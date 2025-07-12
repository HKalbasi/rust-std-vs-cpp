use std::collections::BTreeSet;

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
    let mut hashset = BTreeSet::new();
    for _ in 0..1_000_000 {
        hashset.insert(rand.next());
    }
    println!("{}", hashset.len());
}