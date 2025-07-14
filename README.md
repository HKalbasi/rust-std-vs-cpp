# Rust vs C++ standard library benchmark



## FAQ

> Where is the result?

[here](./result.md)

> Are these results fake?

You can run it on your machine using `bash all.sh`. You need to install `poop`, `awk`, `bc`, `jq`, `bash`, `rustc` and `clang++`. You can also run a single benchmark using `bash bench.sh name`.

> Does it mean that some language is faster/better than the other?

Not really. You can always use a custom library instead of the standard one. If you consider the quality of the implementation and standardization process in your comparison, then it might mean something.



> Why do you use clang instead of g++?

I want to focus on the difference between standard library implementations, not LLVM and GCC optimizations.
