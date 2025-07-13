#include <queue>
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
    priority_queue<uint64_t> pq;
    for (int _: views::iota(0, 5'000'000)) {
        pq.push(rand.next());
        pq.push(rand.next());
        pq.pop();
    }
    cout << pq.size() << endl;
}
