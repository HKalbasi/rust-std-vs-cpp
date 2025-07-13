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
            <td rowspan=2>hashset</td>
            <td>time</td>
            <td>78.6ms</td>
            <td>504ms</td>
            <td>6.4x</td>
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
            <td>312ms</td>
            <td>975ms</td>
            <td>3.1x</td>
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
            <td>555ms</td>
            <td>755ms</td>
            <td>1.4x</td>
            <td>Rust</td>
            <td rowspan=2>5M push-push-pop operation of random u64 numbers in BinaryHeap and priority_queue</td>
            <td rowspan=2></td>
        </tr>
        <tr>
            <td>memory</td>
            <td>42.8MB</td>
            <td>71.5MB</td>
            <td>1.7x</td>
            <td>Rust</td>
        </tr>
        <tr>
            <td rowspan=2>vector_push</td>
            <td>time</td>
            <td>294ms</td>
            <td>420ms</td>
            <td>1.4x</td>
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
            <td>256ms</td>
            <td>162ms</td>
            <td>0.6x</td>
            <td>C++</td>
            <td rowspan=2>100M push of u64 numbers in Vec and vector when reserve(100M+5) is called</td>
            <td rowspan=2></td>
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
