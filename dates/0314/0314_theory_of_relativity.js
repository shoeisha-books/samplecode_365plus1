function calculateEnergy(mass) {
  const speedOfLight = 299792458; // 光速 (メートル/秒)
  const energy = mass * speedOfLight ** 2;
  return energy;
}

const massInKg = 1;
const energyInJoules = calculateEnergy(massInKg);
console.log(`質量 ${massInKg} kg のエネルギーは ${energyInJoules} ジュールです。`);