#ifndef _TRANSPILER_H_
#define _TRANSPILER_H_

#include <string>
#include <vector>

#if 0
#define TRANSPILE(X) transpiler.X
#else
#define TRANSPILE(X)
#endif

struct Token;
struct Type;
struct Declarator;
struct CStorageClass;
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
        int paren = 0;
        size_t linenum = 1;
        std::vector<Line> lines = {};

        std::string filename = "";
        const ErrorsContext* errors = nullptr;
        IdentifierContext* identifiers = nullptr;

    public:
        Transpiler() = default;
        ~Transpiler() = default;

        void set_filename(const char* filename);
        void set_errors_ctx(const ErrorsContext* errrors);
        void set_identifiers_ctx(IdentifierContext* identifiers);

        void add_line();
        void break_line(bool maybe);
        void set_linenum(const Token* tok);
        // void new_token(const Token* tok, std::string buf);
        void keep_token(const Token* tok);
        void unary_op(const Token* tok);
        void binary_op(const Token* tok);
        void print_lines();
        void write_lines();

        void derived_type(const Type* derived_type);
        void fun_decltor(const Declarator* decltor);
        void storage_class(const CStorageClass* storage_class);
        void comment_start();
        void comment_end();
        void comment_line(const char* line, size_t match_at, size_t line_size);
        void skip(bool is_comment, const char* line, size_t match_at, size_t match_size);

    private:
        void incr_indent();
        void decr_indent();
        void incr_paren();
        void decr_paren();
        void append_buf(const std::string& buf);
        void append_end(const std::string& end);
        void append_const(size_t identifier);
        void append_identifier(size_t identifier);
        void comment(const char* line, size_t match_at, size_t match_size);
        void format_line(Line& line, size_t i);
        bool with_prob(unsigned int x);
    };
}

extern cc::Transpiler transpiler;

#endif
