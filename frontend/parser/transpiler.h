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
        void break_line();
        void incr_indent();
        void decr_indent();
        void print_lines();

        void comment_start();
        void comment_end();
        void comment_line(const char* line, size_t match_at, size_t line_size);
        void skip(bool is_comment, const char* line, size_t match_at, size_t match_size);

    private:
        void append_buf(const std::string& buf);
        void append_end(const std::string& end);
        void comment(const char* line, size_t match_at, size_t match_size);
    };
}

extern cc::Transpiler transpiler;

#endif
