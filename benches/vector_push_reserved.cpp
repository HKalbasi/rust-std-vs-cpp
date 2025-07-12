#include <vector>
#include <iostream>
#include <cstdint>
#include <ranges>

using namespace std;

int main() {
    vector<uint64_t> v;
    v.reserve(100'000'005);
    for (uint64_t i: views::iota(0, 100'000'000)) {
        v.push_back(i);
    }
    cout << v.size() << endl;
}