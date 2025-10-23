const std = @import("std");

const MyRand = struct {
    var seed: u64 = 0;

    fn next() u64 {
        seed = seed *% 123456789 +% 101112131415;
        return seed;
    }
};

pub fn main() !void {
    const HashSet = std.AutoHashMapUnmanaged(u64, void);
    var hashset = HashSet.empty;
    for (0..1_000_000) |_| {
        hashset.put(std.heap.c_allocator, MyRand.next(), void{}) catch unreachable;
    }
    var writer = std.fs.File.stdout().writer(&.{});
    writer.interface.print("{}\n", .{hashset.size}) catch unreachable;
}
