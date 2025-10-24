mkdir -p bin
clang++ -std=c++26 benches/$1.cpp -O3 -o bin/cpp-$1
rustc benches/$1.rs -O -o bin/rust-$1
zig build-exe benches/$1.zig -lc -O ReleaseFast --name zig-$1 && mv zig-$1 bin/zig-$1
