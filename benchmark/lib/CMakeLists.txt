add_executable(demo_bench demo_bench.cpp)

target_link_libraries(demo_bench lib benchmark::benchmark)