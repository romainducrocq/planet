#include "parser/transpiler.h"
#include <iostream>

cc::Transpiler transpiler;

void cc::Transpiler::add_buffer_line(size_t at, const std::string& line) {
    if (buffer_lines.find(at) == buffer_lines.end()) {
        buffer_lines[at] = "";
    }
    buffer_lines[at] += line;
}

void cc::Transpiler::append_text(const std::string& text) {

}
