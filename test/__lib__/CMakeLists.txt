add_executable(__lib___test __lib___test.cpp)
target_link_libraries(__lib___test PRIVATE __lib__)

AddTests(__lib___test)