using GLMakie, Colors

txt = "X : @vloomy_mario"   # 好みのセリフに変更可
fontname = "Helvetica Neue"
fontsize = 120
bg, fg, shadow = RGB(0.05,0.06,0.08), RGB(1,1,1), RGBA(0,0,0,0.75)
offset = (8.0, -5.0)

fig = Figure(size=(1200,420), backgroundcolor=bg)
ax  = Axis(fig[1,1]); hidedecorations!(ax); hidespines!(ax); ax.aspect = DataAspect()

text!(ax, txt;
        position=Point2f(0,0).+Point2f(offset...),
        align=(:center,:center), fontsize=fontsize, font=fontname, color=shadow)

text!(ax, txt;
        position=Point2f(0,0),
        align=(:center,:center), fontsize=fontsize, font=fontname, color=fg)

xlims!(ax,-700,700); ylims!(ax,-160,160)
display(fig)

while isopen(fig.scene); sleep(0.1); end