#include "include/lib/demolib.h"

#include <vector>

int demolib::foo(int a, int b) {
    std::vector<int> t;
    t.resize(1000);
//    t[10] = 1;

    return a + b;
}
