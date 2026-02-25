import numpy as np
import matplotlib.pyplot as plt

# 定数の設定
G = 6.67430e-11  # 万有引力定数 (m^3 kg^-1 s^-2)
M_sun = 1.989e30 # 太陽の質量 (kg)
dt = 3600 * 24   # タイムステップ (1日)

class Asteroid:
    def __init__(self, mass, position, velocity):
        self.mass = mass
        self.pos = np.array(position, dtype=float)
        self.vel = np.array(velocity, dtype=float)
        self.path = [self.pos.copy()]

def calculate_gravity(asteroid):
    """太陽から小惑星に働く重力を計算する"""
    r_vec = -asteroid.pos
    r = np.linalg.norm(r_vec)
    if r == 0:
        return np.zeros(3) # 太陽と重なるときは力をゼロとする
    
    force_magnitude = G * M_sun * asteroid.mass / r**2
    force_vec = force_magnitude * (r_vec / r)
    return force_vec

def update_position(asteroid, force, dt):
    """位置と速度を更新する"""
    acceleration = force / asteroid.mass
    asteroid.vel += acceleration * dt
    asteroid.pos += asteroid.vel * dt
    asteroid.path.append(asteroid.pos.copy())