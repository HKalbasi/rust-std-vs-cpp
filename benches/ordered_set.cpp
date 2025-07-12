#include <set>
#include <iostream>
#include <cstdint>
#include <ranges>

struct MyRand {
    uint64_t seed = 5;

    uint64_t next() {
        seed = seed * 123456789 + 101112131415;
        return seed;
    }
};

using namespace std;

int main() {
    MyRand rand{};
    set<uint64_t> hashset;
    for (int _: views::iota(0, 1'000'000)) {
        hashset.insert(rand.next());
    }
    cout << hashset.size() << endl;
}