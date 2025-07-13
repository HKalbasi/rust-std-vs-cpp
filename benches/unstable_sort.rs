#[derive(Default)]
struct MyRand {
    seed: u64,
}

impl MyRand {
    fn next(&mut self) -> u64 {
        self.seed = self.seed.overflowing_mul(123456789).0.overflowing_add(101112131415).0;
        self.seed
    }
}


fn main() {
    let mut rand = MyRand::default();
    let mut array: [u64; 1_000_000] = std::array::from_fn(|_| rand.next());
    array.sort_unstable();
}