#include <gtest/gtest.h>
#include <vector>

#include "lib/demolib.h"

// Demonstrate some basic assertions.
TEST(Lib_Test, Basic_42) {
    // Expect equality.
    EXPECT_EQ(demolib::foo(42, 42), 84);
}

TEST(Lib_Test, Basic_Out_Of_Boundary) {
    std::vector<int> t;
    t.resize(10);
//    t[10] = 1;
    EXPECT_EQ(t[0], 0);
}