fn main() {
    let mut v = Vec::<u64>::new();
    v.reserve(100_000_005);
    for i in 0..100_000_000 {
        v.push(i);
    }
    println!("{}", v.len());
}