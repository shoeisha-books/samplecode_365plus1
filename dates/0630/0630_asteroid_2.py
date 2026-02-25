def simulate_orbit(asteroid, num_steps):
    """軌道シミュレーションを実行する"""
    for _ in range(num_steps):
        force = calculate_gravity(asteroid)
        update_position(asteroid, force, dt)

# 小惑星の初期設定
# 位置 (x, y, z) [m] と 速度 (vx, vy, vz) [m/s]
# 地球の軌道を参考に設定 (太陽からの平均距離 約1.5億km、公転速度 約20km/s)
asteroid_pos = [1.5e11, 10, 0]
asteroid_vel = [0, 2.0e4, 0]
asteroid_mass = 1e15 # 適当な質量
asteroid1 = Asteroid(asteroid_mass, asteroid_pos, asteroid_vel)

# シミュレーションの実行
num_years = 1
num_steps = int(365 * num_years)
simulate_orbit(asteroid1, num_steps)

# 軌道の可視化
path = np.array(asteroid1.path)
plt.figure(figsize=(8, 8))
plt.plot(path[:, 0], path[:, 1], label=f'Asteroid Orbit ({num_years} year)')
plt.plot(0, 0, 'yo', markersize=10, label='Sun') # 太陽
plt.title('Asteroid Orbit Simulation')
plt.xlabel('X position (m)')
plt.ylabel('Y position (m)')
plt.grid(True)
plt.axis('equal') # 縦横比を同じに設定
plt.legend()
plt.show()
# 6月30日は国際小惑星デー