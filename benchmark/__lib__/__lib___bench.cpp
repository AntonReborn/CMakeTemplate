#include <benchmark/benchmark.h>

#include "__namespace__/__lib__/__lib__.h"

static void BM_SomeFunction(benchmark::State& state) {
    // Perform setup here
    for (auto _ : state) {
        // This code gets timed
        __namespace__::foo(42, 42);
    }
}

// Register the function as a benchmark
BENCHMARK(BM_SomeFunction);
// Run the benchmark
BENCHMARK_MAIN();