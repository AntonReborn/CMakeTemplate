#include "__namespace__/__lib__/__lib__.h"

#include <vector>

int __namespace__::foo(int a, int b) {
    std::vector<int> t;
    t.resize(10);
//    t[10] = 1;

    return a + b;
}
