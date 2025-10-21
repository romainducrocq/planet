#include "parser/transpiler.h"
#include "frontend/parser/lexer.h"
#include "util/throw.h"
#include "ast/ast.h"
#include "ast/front_ast.h"

#include <exception>
#include <iostream>

typedef struct Declarator {
    TIdentifier name;
    shared_ptr_t(Type) derived_type;
    vector_t(TIdentifier) params;
} Declarator;

cc::Transpiler transpiler;

void cc::Transpiler::add_line() {
    lines.push_back({"", ""});
}

void cc::Transpiler::set_errors_ctx(const ErrorsContext* errors) {
    this->errors = errors;
}

void cc::Transpiler::set_identifiers_ctx(IdentifierContext* identifiers) {
    this->identifiers = identifiers;
}

void cc::Transpiler::set_linenum(const Token* tok) {
    linenum = errors->token_infos[tok->info_at].total_linenum;
}

// void cc::Transpiler::new_token(const Token* tok, std::string buf) {
//     set_linenum(tok);
//     append_buf(buf);
// }

void cc::Transpiler::keep_token(const Token* tok) {
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_open_brace:
            append_buf("{");
            incr_indent();
            break;
        case TOK_close_brace:
            decr_indent();
            append_buf("}");
            break;
        case TOK_key_return:
            append_buf("return ");
            break;
        case TOK_int_const:
            append_identifier(tok->tok);
            break;
        default:
            break;
    }
}

void cc::Transpiler::append_identifier(size_t identifier) {
    append_buf(map_get(identifiers->hash_table, identifier));
}

void cc::Transpiler::append_buf(const std::string& buf) {
    if (lines[linenum - 1].buf.empty() || lines[linenum - 1].buf.back() == '\n') {
        for (int i = 0; i < indent; ++i) {
            lines[linenum - 1].buf += "    ";
        }
    }

    lines[linenum - 1].buf += buf;
}

void cc::Transpiler::append_end(const std::string& end) {
    lines.back().end += end;
}

void cc::Transpiler::derived_type(const Type* derived_type) {
    // TODO
    switch (derived_type->type) {
        case AST_Int_t:
            append_buf("i32");
            break;
        default:
            throw std::runtime_error("invalid type");
    }
}

void cc::Transpiler::fun_decltor(const Declarator* decltor) {
    append_identifier(decltor->name);
    append_buf("(");
    if (vec_empty(decltor->params)) {
        append_buf("none");
    }
    else {
        // TODO
    }
    append_buf(") ");
    // TODO
    derived_type(decltor->derived_type->get._FunType.ret_type);
    append_buf(" ");
}

void cc::Transpiler::storage_class(const CStorageClass* storage_class) {
    // TODO
    if (storage_class->type == AST_CStorageClass_t) {
        append_buf("pub ");
    }
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
    append_buf("\n");
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
            if (line.buf.back() == '\n') {
                line.buf.back() = ' ';
            }
        }
        std::cout << line.buf << line.end;
    }
    // std::cout << std::endl;
}
