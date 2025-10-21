#ifndef _TRANSPILER_H_
#define _TRANSPILER_H_

#include <string>
#include <vector>

struct Token;
struct ErrorsContext;
struct IdentifierContext;

namespace cc {

class Transpiler {
    struct Line {
        std::string buf;
        std::string end;
    };

    private:
        int indent = 0;
        size_t linenum = 1;
        std::vector<Line> lines = {};
        const ErrorsContext* errors = nullptr;
        IdentifierContext* identifiers = nullptr;

    public:
        Transpiler() = default;
        ~Transpiler() = default;

        void set_errors_ctx(const ErrorsContext* errrors);
        void set_identifiers_ctx(IdentifierContext* identifiers);

        void add_line();
        void break_line();
        void keep_token(const Token* tok);
        void print_lines();

        void comment_start();
        void comment_end();
        void comment_line(const char* line, size_t match_at, size_t line_size);
        void skip(bool is_comment, const char* line, size_t match_at, size_t match_size);

    private:
        void set_linenum(const Token* tok);
        void incr_indent();
        void decr_indent();
        void append_buf(const std::string& buf);
        void append_end(const std::string& end);
        void append_identifier(size_t identifier);
        void comment(const char* line, size_t match_at, size_t match_size);
    };
}

extern cc::Transpiler transpiler;

#endif
