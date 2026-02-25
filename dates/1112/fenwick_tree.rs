pub struct FenwickTree<T, F> {
    n: usize,
    data: Vec<T>,
    initialize: F,
}

impl<T, F> FenwickTree<T, F>
where
    T: Copy + std::ops::AddAssign + std::ops::Sub<Output = T>,
    F: Fn() -> T,
{
    pub fn add(&mut self, k: usize, value: T) {
        let mut x = k;
        while x < self.n {
            self.data[x] += value;
            x |= x + 1;
        }
    }
    pub fn sum(&self, l: usize, r: usize) -> T {
        self.sum_one(r) - self.sum_one(l)
    }
    pub fn sum_one(&self, k: usize) -> T {
        let mut result = (self.initialize)();
        let mut x = k as i32 - 1;
        while x >= 0 {
            result += self.data[x as usize];
            x = (x & (x + 1)) - 1;
        }
        result
    }
}