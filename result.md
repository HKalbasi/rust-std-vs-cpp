## Results

<table>
    <thead>
        <tr>
            <th>Benchmark name</th>
            <th>Measured property</th>
            <th>Rust</th>
            <th>C++</th>
            <th>Ratio</th>
            <th>Winner</th>
            <th>Benchmark description</th>
            <th>Comment on result</th>
        </tr>
    </thead>
        <tr>
            <td rowspan=2>deque_push</td>
            <td>time</td>
            <td>236ms</td>
            <td>798ms</td>
            <td>3.4x</td>
            <td>Rust</td>
            <td rowspan=2>100M push of u64 numbers in VecDeque and deque</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>803MB</td>
            <td>842MB</td>
            <td>1x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>hashset</td>
            <td>time</td>
            <td>68.0ms</td>
            <td>399ms</td>
            <td>5.9x</td>
            <td>Rust</td>
            <td rowspan=2>1M insert of random u64 numbers in HashSet and unordered_set</td>
            <td rowspan=2>Rust uses Swiss table for its HashSet implementation, so it is faster</td>
        </tr>
        <tr>
            <td>memory</td>
            <td>30.1MB</td>
            <td>46.8MB</td>
            <td>1.6x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>ordered_set</td>
            <td>time</td>
            <td>253ms</td>
            <td>850ms</td>
            <td>3.4x</td>
            <td>Rust</td>
            <td rowspan=2>1M insert of random u64 numbers in BtreeSet and set</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>18.5MB</td>
            <td>51.6MB</td>
            <td>2.8x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>priority_queue</td>
            <td>time</td>
            <td>455ms</td>
            <td>519ms</td>
            <td>1.1x</td>
            <td>Rust</td>
            <td rowspan=2>5M push-push-pop operation of random u64 numbers in BinaryHeap and priority_queue</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>42.7MB</td>
            <td>71.3MB</td>
            <td>1.7x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>stable_sort</td>
            <td>time</td>
            <td>46.4ms</td>
            <td>77.0ms</td>
            <td>1.7x</td>
            <td>Rust</td>
            <td rowspan=2>Sort 1M random u64 numbers using sort and stable_sort</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>25.8MB</td>
            <td>14.9MB</td>
            <td>0.6x</td>
            <td>C++</td>
        </tr>
        <tr>
            <td rowspan=2>unstable_sort</td>
            <td>time</td>
            <td>32.7ms</td>
            <td>84.3ms</td>
            <td>2.6x</td>
            <td>Rust</td>
            <td rowspan=2>Sort 1M random u64 numbers using unstable_sort and sort</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>18.1MB</td>
            <td>11.6MB</td>
            <td>0.6x</td>
            <td>C++</td>
        </tr>
        <tr>
            <td rowspan=2>vector_push</td>
            <td>time</td>
            <td>232ms</td>
            <td>393ms</td>
            <td>1.7x</td>
            <td>Rust</td>
            <td rowspan=2>100M push of u64 numbers in Vec and vector</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>803MB</td>
            <td>1.08GB</td>
            <td>1.3x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>vector_push_reserved</td>
            <td>time</td>
            <td>219ms</td>
            <td>134ms</td>
            <td>0.6x</td>
            <td>C++</td>
            <td rowspan=2>100M push of u64 numbers in Vec and vector when reserve(100M+5) is called</td>
            <td rowspan=2>The C++ compiler is able to optimize the check for the capacity in the push</td>
        </tr>
        <tr>
            <td>memory</td>
            <td>802MB</td>
            <td>803MB</td>
            <td>1x</td>
            <td>Rust</td>
        </tr>
    </tbody>
</table>

## System information

Rust compiler:
```
rustc 1.88.0 (6b00bc388 2025-06-23)
binary: rustc
commit-hash: 6b00bc3880198600130e1cf62b8f8a93494488cc
commit-date: 2025-06-23
host: x86_64-unknown-linux-gnu
release: 1.88.0
LLVM version: 20.1.5
```
C++ compiler
```
clang version 20.1.7
Target: x86_64-pc-linux-gnu
Thread model: posix
InstalledDir: /usr/bin
```
