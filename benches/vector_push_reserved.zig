const std = @import("std");

pub fn main() !void {
    var v =
        std.ArrayList(u64).initCapacity(std.heap.smp_allocator, 100_000_005) catch unreachable;
    for (0..100_000_000) |i| {
        // v.appendAssumeCapacity(i);
        v.append(std.heap.smp_allocator, i) catch unreachable;
    }
    var writer = std.fs.File.stdout().writer(&.{});
    writer.interface.print("{}\n", .{v.items.len}) catch unreachable;
}
