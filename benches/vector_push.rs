fn main() {
    let mut v = Vec::<u64>::new();
    for i in 0..100_000_000 {
        v.push(i);
    }
    println!("{}", v.len());
}