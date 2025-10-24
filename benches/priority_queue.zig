const std = @import("std");

const MyRand = struct {
    var seed: u64 = 0;

    fn next() u64 {
        seed = seed *% 123456789 +% 101112131415;
        return seed;
    }
};

pub fn main() !void {
    const Queue = std.PriorityQueue(u64, void, struct {
        pub fn compare(_: void, a: u64, b: u64) std.math.Order {
            return std.math.order(a, b);
        }
    }.compare);
    var pq = Queue.init(std.heap.c_allocator, void{});
    for (0..5_000_000) |_| {
        // pq.addSlice(&.{ MyRand.next(), MyRand.next() }) catch unreachable;
        pq.add(MyRand.next()) catch unreachable;
        pq.add(MyRand.next()) catch unreachable;
        _ = pq.remove();
    }
    var writer = std.fs.File.stdout().writer(&.{});
    writer.interface.print("{}\n", .{pq.items.len}) catch unreachable;
}
