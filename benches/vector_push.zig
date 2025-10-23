const std = @import("std");

pub fn main() !void {
    var v = std.ArrayList(u64).empty;
    for (0..100_000_000) |i| {
        v.append(std.heap.smp_allocator, i) catch unreachable;
    }
    var writer = std.fs.File.stdout().writer(&.{});
    writer.interface.print("{}\n", .{v.items.len}) catch unreachable;
}
