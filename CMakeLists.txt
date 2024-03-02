cmake_minimum_required(VERSION 3.27)
project(BaseTemplate)
list(APPEND CMAKE_MODULE_PATH "${CMAKE_SOURCE_DIR}/cmake")

enable_testing()

include(Options)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_subdirectory(src)
add_subdirectory(test)
add_subdirectory(benchmark)