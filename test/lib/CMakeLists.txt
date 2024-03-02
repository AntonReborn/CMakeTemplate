add_executable(lib_test lib_test.cpp)
target_link_libraries(lib_test PRIVATE lib)

AddTests(lib_test)