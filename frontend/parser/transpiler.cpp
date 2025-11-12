#include "parser/transpiler.h"
#include "frontend/parser/lexer.h"
#include "util/throw.h"
#include "ast/ast.h"
#include "ast/front_ast.h"

#include <exception>
#include <iostream>
#include <fstream>

#include <stdio.h>
#include <stdlib.h>
// #include <time.h>

typedef struct Declarator {
    TIdentifier name;
    shared_ptr_t(Type) derived_type;
    vector_t(TIdentifier) params;
} Declarator;

cc::Transpiler transpiler = []() -> cc::Transpiler {
    srand (10000);
    return {};
}();

void cc::Transpiler::add_line() {
    lines.push_back({"", ""});
}

void cc::Transpiler::set_filename(const char* filename) {
    this->filename = std::string(filename) + ".transpile";
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

void cc::Transpiler::set_top_level(bool top_level) {
    this->top_level = top_level;
}

void cc::Transpiler::set_is_elif(bool is_elif) {
    this->is_elif = is_elif;
}

void cc::Transpiler::set_is_arr_size(bool is_arr_size) {
    this->is_arr_size = is_arr_size;
}

// void cc::Transpiler::new_token(const Token* tok, std::string buf) {
//     set_linenum(tok);
//     append_buf(buf);
// }

void cc::Transpiler::unary_op(const Token* tok) {
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_unop_complement:
            append_buf("~");
            break;
        case TOK_unop_neg:
            append_buf("-");
            break;
        case TOK_unop_not:
            append_buf("not ");
            break;
        case TOK_binop_bitand:
            append_buf("@");
            break;
        default:
            throw std::runtime_error("invalid unary_op");
    }
}

void cc::Transpiler::deref_ptr() {
    append_buf("[]");
}

void cc::Transpiler::binary_op(const Token* tok) {
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_binop_add:
            append_buf(" + ");
            break;
        case TOK_unop_neg:
            append_buf(" - ");
            break;
        case TOK_binop_multiply:
            append_buf(" * ");
            break;
        case TOK_binop_divide:
            append_buf(" / ");
            break;
        case TOK_binop_remainder:
            append_buf(" % ");
            break;
        case TOK_binop_bitand:
            append_buf(" & ");
            break;
        case TOK_binop_bitor:
            append_buf(" | ");
            break;
        case TOK_binop_xor:
            append_buf(" ^ ");
            break;
        case TOK_binop_shiftleft:
            append_buf(" << ");
            break;
        case TOK_binop_shiftright:
            append_buf(" >> ");
            break;
        case TOK_binop_and:
            append_buf(" and ");
            break;
        case TOK_binop_or:
            append_buf(" or ");
            break;
        case TOK_binop_eq:
            append_buf(" == ");
            break;
        case TOK_binop_ne:
            append_buf(" ~= ");
            break;
        case TOK_binop_lt:
            append_buf(" < ");
            break;
        case TOK_binop_le:
            append_buf(" <= ");
            break;
        case TOK_binop_gt:
            append_buf(" > ");
            break;
        case TOK_binop_ge:
            append_buf(" >= ");
            break;
        case TOK_assign:
            append_buf(" = ");
            break;
        case TOK_assign_add:
            append_buf(" += ");
            break;
        case TOK_assign_subtract:
            append_buf(" -= ");
            break;
        case TOK_assign_multiply:
            append_buf(" *= ");
            break;
        case TOK_assign_divide:
            append_buf(" /= ");
            break;
        case TOK_assign_remainder:
            append_buf(" %= ");
            break;
        case TOK_assign_bitand:
            append_buf(" &= ");
            break;
        case TOK_assign_bitor:
            append_buf(" |= ");
            break;
        case TOK_assign_xor:
            append_buf(" ^= ");
            break;
        case TOK_assign_shiftleft:
            append_buf(" <<= ");
            break;
        case TOK_assign_shiftright:
            append_buf(" >>= ");
            break;
        case TOK_unop_incr:
            append_buf("++");
            break;
        case TOK_unop_decr:
            append_buf("--");
            break;
        default:
            throw std::runtime_error("invalid binary_op");
    }
    // append_buf(" ");
}

void cc::Transpiler::cast_op(const Type* target_type) {
    append_buf("cast<");
    derived_type(target_type);
    append_buf(">(");
    incr_paren();
}

void cc::Transpiler::cast_end() {
    append_buf(")");
    decr_paren();        
}

void cc::Transpiler::if_statement(const Token* tok) {
    if (lines[linenum - 1].buf.back() == '}') {
        break_line(false);
    }
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_key_if: {
            if (is_elif) {
                append_buf("elif ");
            }
            else {
                append_buf("if ");
            }
            is_elif = false;
            break;
        }
        case TOK_key_else:
            if (!is_elif) {
                append_buf("else");
            }
            break;
        default:
            throw std::runtime_error("invalid if statement");
    }
}

void cc::Transpiler::for_partial(int i) {
    switch (i) {
        case 1:
            append_buf(" while ");
            break;
        case 2:
            append_buf(" .. ");
            break;
        default:
            throw std::runtime_error("invalid for partial");
    }
}

void cc::Transpiler::goto_statement(const Token* tok) {
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_identifier: {
            append_buf("jump ");
            append_identifier(tok->tok);
            break;
        }
        default:
            throw std::runtime_error("invalid goto statement");
    }
}

void cc::Transpiler::label_statement(const Token* tok) {
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_identifier: {
            append_buf("label ");
            append_identifier(tok->tok);
            break_line(false);
            break;
        }
        default:
            throw std::runtime_error("invalid label statement");
    }
}

void cc::Transpiler::open_block(const Token* tok) {
    open_blocks.push_back(false);
    switch (tok->tok_kind) {
        case TOK_open_brace:
            break;
        default: {
            if (tok->tok_kind == TOK_key_if && is_elif) {
                break;
            }
            if (lines[linenum - 1].buf.back() != ' ') {
                append_buf(" ");
            }
            append_buf("{");
            incr_indent();
            break_line(true);
            open_blocks.back() = true;
            break;
        }
    }
}

void cc::Transpiler::close_block(bool br_line) {
    if (open_blocks.empty()) {
        throw std::runtime_error("open_blocks empty");
    }
    
    if (open_blocks.back()) {
        decr_indent();
        break_line(true);
        append_buf("}");
        if (br_line) {
            break_line(false);
        }
    }
    open_blocks.pop_back();
}

void cc::Transpiler::push_conditional(size_t min_precedence) {
    if (min_precedence > 3) {
        return;
    }
    cond_buf.push_back({0, 0});
    cond_buf.back().pos = lines[linenum - 1].buf.size();
    cond_buf.back().linenum = linenum;
}

void cc::Transpiler::pop_conditional(size_t min_precedence) {
    if (min_precedence > 3) {
        return;
    }

    if (cond_buf.empty()) {
        throw std::runtime_error("invalid pop conditional");
    }
    cond_buf.pop_back();
}

void cc::Transpiler::push_do_while() {
    do_while_buf.push_back({0, 0});
    do_while_buf.back().pos = lines[linenum - 1].buf.size();
    do_while_buf.back().linenum = linenum;
}

void cc::Transpiler::pop_do_while() {
    if (do_while_buf.empty()) {
        throw std::runtime_error("invalid pop do while");
    }

    std::string buf = "";
    for (size_t i = linenum; i-- > 0;) {
        std::string& line_buf = lines[i].buf;
        for (size_t j = line_buf.size(); j-- > 0;) {
            if (line_buf.back() == '}') {
                goto Lbreak;
            }
            buf = std::string{line_buf.back()} + buf;
            line_buf.pop_back();
        }
    }
    Lbreak:;
    while (buf[0] == ' ') {
        buf = buf.substr(1, buf.size());
    }
    buf = std::string{' '} + buf;
    concat_buf(do_while_buf.back(), buf);

    do_while_buf.pop_back();
}

void cc::Transpiler::keep_token(const Token* tok) {
    set_linenum(tok);
    switch (tok->tok_kind) {
        case TOK_identifier:
            append_identifier(tok->tok);
            break;
        case TOK_open_brace:
            if (!lines[linenum - 1].buf.empty() && 
                lines[linenum - 1].buf.back() != ' ') {
                append_buf(" ");
            }
            append_buf("{");
            incr_indent();
            break;
        case TOK_close_brace:
            decr_indent();
            append_buf("}");
            break;
        case TOK_open_paren:
            append_buf("(");
            incr_paren();
            break;
        case TOK_close_paren:
            append_buf(")");
            decr_paren();
            break;
        case TOK_key_return:
            append_buf("return ");
            break;
        case TOK_key_break:
            append_buf("break");
            break;
        case TOK_key_continue:
            append_buf("continue");
            break;
        case TOK_key_for:
            append_buf("loop ");
            break;
        case TOK_key_do:
            append_buf("loop .. while");
            break;
        case TOK_key_while:
            append_buf("loop while ");
            break;
        case TOK_key_switch:
            append_buf("match ");
            break;
        case TOK_key_case:
            append_buf("-> ");
            break;
        case TOK_key_default:
            append_buf("otherwise ");
            break;
        case TOK_comma_separator:
            append_buf(", ");
            break;
        case TOK_ternary_if:
            if (cond_buf.empty()) {
                throw std::runtime_error("invalid pop conditional");
            }
            concat_buf(cond_buf.back(), "? ");
            append_buf(" then ");
            break;
        case TOK_ternary_else:
            append_buf(" else ");
            break;
        case TOK_int_const:
            append_const(tok->tok);
            break;
        case TOK_long_const:
            append_long_const(tok->tok);
            break;
        case TOK_dbl_const:
            append_double_const(tok->tok);
            break;
        case TOK_uint_const:
            append_unsigned_const(tok->tok);
            break;
        case TOK_ulong_const:
            append_long_unsigned_const(tok->tok);
            break;
        case TOK_semicolon:
            break;
        default:
            throw std::runtime_error("invalid token");
    }
}

void cc::Transpiler::append_const_buf(const std::string& buf) {
    if (is_arr_size) {
        arr_sizes.insert(arr_sizes.begin(), buf);
    }
    else {
        append_buf(buf);
    }
}

void cc::Transpiler::append_const(size_t identifier) {
    std::string const_buf = map_get(identifiers->hash_table, identifier);
    if (const_buf.compare("0") == 0 && with_prob(10)) {
        append_const_buf("nil");
    }
    else if (const_buf.compare("0") == 0 && with_prob(10)) {
        append_const_buf("false");
    }
    else if (const_buf.compare("1") == 0 && with_prob(10)) {
        append_const_buf("true");
    }
    else {
        append_const_buf(const_buf);
    }
}

void cc::Transpiler::append_long_const(size_t identifier) {
    std::string const_buf = map_get(identifiers->hash_table, identifier);
    const_buf.back() = 'l';
    append_const_buf(const_buf);
}

void cc::Transpiler::append_double_const(size_t identifier) {
    std::string const_buf = map_get(identifiers->hash_table, identifier);
    for (size_t i = 0; i < const_buf.size(); ++i) {
        if (const_buf[i] == 'E') {
            const_buf[i] = 'e';
        }
    }
    if (is_arr_size) {
        throw std::runtime_error("invalid arr_size");
    }
    append_buf(const_buf);
}

void cc::Transpiler::append_unsigned_const(size_t identifier) {
    std::string const_buf = map_get(identifiers->hash_table, identifier);
    const_buf.back() = 'u';
    append_const_buf(const_buf);
}

void cc::Transpiler::append_long_unsigned_const(size_t identifier) {
    std::string const_buf = map_get(identifiers->hash_table, identifier);
    const_buf.pop_back();
    const_buf.back() = 'u';
    const_buf.push_back('l');
    append_const_buf(const_buf);
}

void cc::Transpiler::append_identifier(size_t identifier) {
    append_buf(map_get(identifiers->hash_table, identifier));
}

bool cc::Transpiler::with_prob(unsigned int x) {
    return (rand() % 100) < x;
}

void cc::Transpiler::concat_buf(const LineBuf& line_buf, const std::string& buf) {
    size_t linenum_temp = linenum;
    linenum = line_buf.linenum;

    std::string buf_temp = lines[linenum - 1].buf;
    lines[linenum - 1].buf = buf_temp.substr(0, line_buf.pos);

    append_buf(buf);

    buf_temp = buf_temp.substr(line_buf.pos, buf_temp.size());
    if (buf_temp.empty()) {
        buf_temp = lines[linenum].buf;
        while (buf_temp[0] == ' ') {
            buf_temp = buf_temp.substr(1, buf_temp.size());
        }
        lines[linenum].buf = buf_temp;
    }
    else {
        lines[linenum - 1].buf += buf_temp;
    }
    linenum = linenum_temp;
}

void cc::Transpiler::append_buf(const std::string& buf) {
    if (paren > 0 && with_prob(2)) {
        break_line(false);
    }
    if (lines[linenum - 1].buf.empty() || lines[linenum - 1].buf.back() == '\n') {
        for (int i = 0; i < indent; ++i) {
            lines[linenum - 1].buf += "    ";
        }
        if (paren > 0) {
            lines[linenum - 1].buf += "    ";
        }
    }

    lines[linenum - 1].buf += buf;
}

void cc::Transpiler::append_end(const std::string& end) {
    lines.back().end += end;
}

void cc::Transpiler::derived_type(const Type* _derived_type) {
    switch (_derived_type->type) {
        case AST_Int_t:
            if (with_prob(5)) {
                append_buf("bool");
            }
            else {
                append_buf("i32");
            }
            break;
        case AST_Long_t:
            append_buf("i64");
            break;
        case AST_Double_t:
            append_buf("f64");
            break;
        case AST_UInt_t:
            append_buf("u32");
            break;
        case AST_ULong_t:
            append_buf("u64");
            break;
        case AST_Pointer_t:
            append_buf("*");
            derived_type(_derived_type->get._Pointer.ref_type);
            break;
        case AST_Array_t: {
            append_buf("[");
            append_buf(arr_sizes.back());
            arr_sizes.pop_back();
            append_buf("]");
            derived_type(_derived_type->get._Array.elem_type);
            break;
        }
        default:
            throw std::runtime_error("invalid type");
    }
}

void cc::Transpiler::do_nothing(const Token* tok, int tok_kind) {
    set_linenum(tok);
    if (tok_kind != (int)tok->tok_kind) {
        append_buf(";");
    }
}

void cc::Transpiler::type_decl(size_t name, const Type* type_t) {
    append_identifier(name);
    append_buf(": ");
    derived_type(type_t);
}

void cc::Transpiler::var_decltor(const Declarator* decltor) {
    type_decl(decltor->name, decltor->derived_type);
}

void cc::Transpiler::fun_decltor(const Declarator* decltor, const Token* tok) {
    append_buf("fn ");
    append_identifier(decltor->name);
    append_buf("(");
    incr_paren();
    if (vec_empty(decltor->params)) {
        append_buf("none");
    }
    else {
        type_decl(decltor->params[0], 
            decltor->derived_type->get._FunType.param_types[0]);
        for (size_t i = 1; i < vec_size(decltor->params); ++i) {
            append_buf(", ");
            type_decl(decltor->params[i], 
                decltor->derived_type->get._FunType.param_types[i]);
        }
    }
    append_buf(") ");
    decr_paren();
    // TODO
    derived_type(decltor->derived_type->get._FunType.ret_type);
    if (tok->tok_kind == TOK_semicolon) {
        append_buf(";");
        if (indent == 0) {
            break_line(false);
        }
    }
    else {
        append_buf(" ");
    }
}

void cc::Transpiler::storage_class(const Token* tok, const CStorageClass* clss) {
    set_linenum(tok);
    switch (clss->type) {
        case AST_CStorageClass_t:
            if (top_level) {
                append_buf("pub ");
            }
            break;
        case AST_CStatic_t: {
            if (!top_level) {
                append_buf("data ");
            }
            break;
        }
        case AST_CExtern_t:
            append_buf("extrn ");
            break;
        default:
            throw std::runtime_error("invalid storage class");
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

void cc::Transpiler::break_line(bool maybe) {
    if (maybe && with_prob(2)) {
        append_buf(" ");
    }
    else {
        append_buf("\n");
    }
}

void cc::Transpiler::break_line_var() {
    if (indent == 0) {
        break_line(false);
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

void cc::Transpiler::incr_paren() {
    paren++;
}

void cc::Transpiler::decr_paren() {
    if (paren <= 0) {
        throw std::runtime_error("invalid paren");
    }

    paren--;
}

void cc::Transpiler::format_line(Line& line, size_t i) {
    if (line.buf.empty()) {
        if (line.end.empty()) {
            line.buf +=  "\n";
        }
        else {
            // this just is to align the comments
            // ok to remove if buggy
            int indent_end = 0;
            for (size_t j = i + 1; j < lines.size(); ++j) {
                const auto& next_line = lines[j];
                if (!next_line.buf.empty()) {
                    int blank_end = 0;
                    while (blank_end < next_line.buf.size() &&
                        next_line.buf[blank_end] == ' ') {
                        blank_end++;
                    }
                    if (next_line.buf[blank_end] != '\n'
                        && blank_end % 4 == 0) {
                        indent_end = blank_end / 4;
                        break;
                    }
                }
            }
            for (size_t j = 0; j < indent_end; ++j) {
                line.buf += "    ";
            }
        }
    }
    else if (!line.end.empty() && line.buf.back() == '\n') {
        line.buf.back() = ' ';
    }   
}

void cc::Transpiler::print_lines() {
    for (size_t i = 0; i < lines.size(); ++i) {
        auto& line = lines[i];
        format_line(line, i);
        std::cout << line.buf << line.end;
    }
    // std::cout << std::endl;
}

void cc::Transpiler::write_lines() {
    std::ofstream out(filename);
    for (size_t i = 0; i < lines.size(); ++i) {
        auto& line = lines[i];
        format_line(line, i);
        out << line.buf << line.end;
    }
    out.close();
    // std::cout << std::endl;
}
