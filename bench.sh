g++ -std=c++26 benches/$1.cpp -O3 -o bin/cpp-$1
rustc benches/$1.rs -O -o bin/rust-$1
poop ./bin/rust-$1 ./bin/cpp-$1