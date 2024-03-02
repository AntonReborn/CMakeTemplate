add_executable(__lib___bench __lib___bench.cpp)

target_link_libraries(__lib___bench __lib__ benchmark::benchmark)