#include <algorithm>
#include <iostream>
#include <cstdint>
#include <ranges>

struct MyRand {
    uint64_t seed = 0;

    uint64_t next() {
        seed = seed * 123456789 + 101112131415;
        return seed;
    }
};

using namespace std;

int main() {
    MyRand rand{};
    array<uint64_t, 1'000'000> array;
    for (int i: views::iota(0, 1'000'000)) {
        array[i] = rand.next();
    }
    std::stable_sort(array.begin(), array.end());
}