#include "parser/transpiler.h"
#include <iostream>

cc::Transpiler transpiler;

void cc::Transpiler::Hello() {
    std::cout << "Hello From Transpiler" << std::endl;
}
