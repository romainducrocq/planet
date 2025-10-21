#include "parser/transpiler.h"
#include "parser/tokens.h"

#include <exception>
#include <iostream>

cc::Transpiler transpiler;

void cc::Transpiler::append_line() {
    lines.push_back({"", ""});
}

void cc::Transpiler::append_tok(const Token& tok) {

}

void cc::Transpiler::append_buf(const std::string& buf) {
    lines.back().buf += buf;
}

void cc::Transpiler::append_end(const std::string& end) {
    lines.back().end += end;
}

void cc::Transpiler::comment(const char* line, size_t match_at, size_t match_size) {
    append_end(std::string(line).substr(match_at, match_size));
}

void cc::Transpiler::comment_start() {
    append_end("# ");
}

void cc::Transpiler::comment_end() {
    append_end("\n");
}

void cc::Transpiler::comment_line(const char* line, size_t match_at, size_t line_size) {
    comment_start();
    comment(line, match_at + 2, line_size);
}

void cc::Transpiler::skip(bool is_comment, const char* line, size_t match_at, size_t match_size) {
    if (is_comment) {
        for (char c: lines.back().end) {
            if (c == '#') {
                goto Lelse;
            }
        }
        comment_start();
        Lelse:
        comment(line, match_at, match_size);
    }
}

void cc::Transpiler::break_line() {
    lines.back().buf += "\n";
    for (int i = 0; i < indent; ++i) {
        lines.back().buf += "    ";
    }
}

void cc::Transpiler::incr_indent() {
    indent++;
}

void cc::Transpiler::decr_indent() {
    if (indent <= 0) {
        throw std::runtime_error("invalid indent");
    }

    indent--;
}

void cc::Transpiler::print_lines() {
    for (size_t i = 0; i < lines.size(); ++i) {
        auto& line = lines[i];
        if (line.buf.empty() && line.end.empty()) {
            line.buf +=  "\n";
        }
        else if (!line.buf.empty() && !line.end.empty()) {
            line.buf += " ";
        }
        std::cout << line.buf << line.end;
    }
    std::cout << std::endl;
}
