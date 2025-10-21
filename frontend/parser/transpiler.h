#ifndef _TRANSPILER_H_
#define _TRANSPILER_H_

#include <string>
#include <vector>

struct Token;

namespace cc {

class Transpiler {
    struct Line {
        std::string buf;
        std::string end;
    };

    private:
        int indent = 0;
        std::vector<Line> lines = {};

    public:
        Transpiler() = default;
        ~Transpiler() = default;

        void append_line();
        void append_tok(const Token& tok);
        void append_buf(const std::string& buf);
        void append_end(const std::string& end);
        void break_line();
        void incr_indent();
        void decr_indent();
        void print_lines();
};

}

extern cc::Transpiler transpiler;

#endif
