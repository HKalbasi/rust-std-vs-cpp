## Results

<table>
    <thead>
        <tr>
            <th>Benchmark name</th>
            <th>Measured property</th>
            <th>Rust</th>
            <th>C++</th>
            <th>Zig</th>
            <th>Ratio</th>
            <th>Winner</th>
            <th>Benchmark description</th>
            <th>Comment on result</th>
        </tr>
    </thead>
        <tr>
            <td rowspan=2>deque_push</td>
            <td>time</td>
            <td>90.1ms</td>
            <td>191ms</td>
            <td></td>
            <td>2.1x</td>
            <td>Rust</td>
            <td rowspan=2>100M push of u64 numbers in VecDeque and deque</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>803MB</td>
            <td>843MB</td>
            <td></td>
            <td>1x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>hashset</td>
            <td>time</td>
            <td>23.0ms</td>
            <td>110ms</td>
            <td>24.2ms</td>
            <td>4.8x</td>
            <td>Rust</td>
            <td rowspan=2>1M insert of random u64 numbers in HashSet and unordered_set</td>
            <td rowspan=2>Rust uses Swiss table for its HashSet implementation, so it is faster</td>
        </tr>
        <tr>
            <td>memory</td>
            <td>30.4MB</td>
            <td>46.8MB</td>
            <td>29.6MB</td>
            <td>1.5x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>ordered_set</td>
            <td>time</td>
            <td>88.6ms</td>
            <td>202ms</td>
            <td>237ms</td>
            <td>2.3x</td>
            <td>Rust</td>
            <td rowspan=2>1M insert of random u64 numbers in BtreeSet and set</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>18.2MB</td>
            <td>51.5MB</td>
            <td>42.4MB</td>
            <td>2.8x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>priority_queue</td>
            <td>time</td>
            <td>236ms</td>
            <td>250ms</td>
            <td>270ms</td>
            <td>1.1x</td>
            <td>Rust</td>
            <td rowspan=2>5M push-push-pop operation of random u64 numbers in BinaryHeap and priority_queue</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>43.5MB</td>
            <td>71.3MB</td>
            <td>75.0MB</td>
            <td>1.6x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>stable_sort</td>
            <td>time</td>
            <td>16.8ms</td>
            <td>33.4ms</td>
            <td>59.2ms</td>
            <td>2x</td>
            <td>Rust</td>
            <td rowspan=2>Sort 1M random u64 numbers using sort and stable_sort</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>26.0MB</td>
            <td>15.3MB</td>
            <td>9.23MB</td>
            <td>0.6x</td>
            <td>C++</td>
        </tr>
        <tr>
            <td rowspan=2>unstable_sort</td>
            <td>time</td>
            <td>12.3ms</td>
            <td>44.7ms</td>
            <td>48.2ms</td>
            <td>3.6x</td>
            <td>Rust</td>
            <td rowspan=2>Sort 1M random u64 numbers using unstable_sort and sort</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>18.1MB</td>
            <td>11.5MB</td>
            <td>9.23MB</td>
            <td>0.6x</td>
            <td>C++</td>
        </tr>
        <tr>
            <td rowspan=2>vector_push</td>
            <td>time</td>
            <td>63.8ms</td>
            <td>142ms</td>
            <td>184ms</td>
            <td>2.2x</td>
            <td>Rust</td>
            <td rowspan=2>100M push of u64 numbers in Vec and vector</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>803MB</td>
            <td>1.08GB</td>
            <td>1.12GB</td>
            <td>1.3x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>vector_push_reserved</td>
            <td>time</td>
            <td>72.5ms</td>
            <td>56.7ms</td>
            <td>60.6ms</td>
            <td>0.8x</td>
            <td>C++</td>
            <td rowspan=2>100M push of u64 numbers in Vec and vector when reserve(100M+5) is called</td>
            <td rowspan=2>The C++ compiler is able to optimize the check for the capacity in the push</td>
        </tr>
        <tr>
            <td>memory</td>
            <td>802MB</td>
            <td>804MB</td>
            <td>801MB</td>
            <td>1x</td>
            <td>Rust</td>
        </tr>
    </tbody>
</table>

## System information

Rust compiler:
```
rustc 1.90.0 (1159e78c4 2025-09-14)
binary: rustc
commit-hash: 1159e78c4747b02ef996e55082b704c09b970588
commit-date: 2025-09-14
host: x86_64-unknown-linux-gnu
release: 1.90.0
LLVM version: 20.1.8
```
C++ compiler
```
clang version 20.1.8
Target: x86_64-unknown-linux-gnu
Thread model: posix
```
Zig compiler
```
0.15.1
clang version 20.1.2 (https://github.com/ziglang/zig-bootstrap c6bc9398c72c7a63fe9420a9055dcfd1845bc266)
Target: x86_64-unknown-linux-musl
Thread model: posix
```
Processor
```
model name	: AMD Ryzen 9 9900X 12-Core Processor
```
