fn main() {
    let mut v = std::collections::VecDeque::<u64>::new();
    for i in 0..100_000_000 {
        v.push_back(i);
    }
    println!("{}", v.len());
}
