const std = @import("std");

const MyRand = struct {
    var seed: u64 = 0;

    fn next() u64 {
        seed = seed *% 123456789 +% 101112131415;
        return seed;
    }
};

pub fn main() !void {
    var arr: [1000_000]u64 = undefined;
    for (&arr) |*ptr| {
        ptr.* = MyRand.next();
    }
    std.mem.sort(u64, arr[0..], void{}, struct {
        pub fn lessThan(_: void, a: u64, b: u64) bool {
            return std.math.compare(a, .lt, b);
        }
    }.lessThan);
    std.mem.doNotOptimizeAway(arr[0]);
}
