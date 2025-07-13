#include <deque>
#include <iostream>
#include <cstdint>
#include <ranges>

using namespace std;

int main() {
    deque<uint64_t> v;
    for (uint64_t i: views::iota(0, 100'000'000)) {
        v.push_back(i);
    }
    cout << v.size() << endl;
}