use std::collections::BinaryHeap;

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
    let mut pq = BinaryHeap::new();
    for _ in 0..5_000_000 {
        pq.push(rand.next());
        pq.push(rand.next());
        pq.pop();
    }
    println!("{}", pq.len());
}