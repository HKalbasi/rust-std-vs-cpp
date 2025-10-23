const std = @import("std");

const MyRand = struct {
    var seed: u64 = 0;

    fn next() u64 {
        seed = seed *% 123456789 +% 101112131415;
        return seed;
    }
};

pub fn main() !void {
    const Treap = std.Treap(u64, std.math.order);
    var treap = Treap{};
    var node_pool = std.heap.MemoryPool(Treap.Node).init(std.heap.smp_allocator);

    for (0..1_000_000) |_| {
        var entry = treap.getEntryFor(MyRand.next());
        if (entry.node == null) {
            entry.set(node_pool.create() catch unreachable);
        }
    }
    // treap doesn't have size
}
