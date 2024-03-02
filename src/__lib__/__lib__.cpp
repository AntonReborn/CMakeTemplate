#include "include/__lib__/__lib__.h"

#include <vector>

int demo__lib__::foo(int a, int b) {
    std::vector<int> t;
    t.resize(1000);
//    t[10] = 1;

    return a + b;
}
