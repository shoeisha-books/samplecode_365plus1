using MLJ, DataFrames, Dates, Random, Statistics
XGB = @load XGBoostRegressor pkg=XGBoost verbosity=0
Random.seed!(42)

# サンプルの時系列データ作成（1時間刻み、気温は季節+日内変動+ノイズ）
n = 800; t0 = DateTime(2024,1,1)
dt  = [t0 + Hour(i) for i in 0:n-1]
temp = [15 .+ 10*sin(2π*(i/24)) .+ 5*sin(2π*(i/(24*90))) .+ randn()*0.8 for i in 1:n]
df = DataFrame(datetime=dt, temp=temp)

# 特徴量
function lag(v, k); [fill(missing,k); v[1:end-k]] end
df.hour  = hour.(df.datetime); df.month = month.(df.datetime)
df.temp_l1 = lag(df.temp, 1); df.temp_l3 = lag(df.temp, 3); df.temp_l6 = lag(df.temp, 6)
df.ma6 = [i<6 ? missing : mean(df.temp[i-5:i]) for i in 1:n]
# 6時間先を目的変数に
df.temp_tplus6 = [i>n-6 ? missing : df.temp[i+6] for i in 1:n]
dropmissing!(df)

# 学習/評価分割
cut = floor(Int, 0.8*nrow(df))
train = df[1:cut, :]; test = df[cut+1:end, :]
ytr = train.temp_tplus6; Xtr = select(train, Not([:datetime, :temp_tplus6]))
yte = test.temp_tplus6;  Xte = select(test,  Not([:datetime, :temp_tplus6]))

# モデル学習（XGBoost）
model = XGB(nrounds=400, eta=0.05, max_depth=6, subsample=0.8, colsample_bytree=0.8)
mach = machine(model, Xtr, ytr) |> fit!

# 予測と評価
ŷ = predict(mach, Xte) |> MLJ.unwrap
rmse = sqrt(mean((ŷ .- yte).^2))
@info "Test RMSE (6h-ahead temp)" rmse