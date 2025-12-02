#include "util/c_std.h"
#include "util/str2t.h"
#include "util/throw.h"

#include "ast/ast.h"
#include "ast/front_ast.h"
#include "ast/front_symt.h"

#include "frontend/parser/errors.h"
#include "frontend/parser/lexer.h"
#include "frontend/parser/parser.h"

#include "frontend/intermediate/idents.h"

typedef struct ParserContext {
    ErrorsContext* errors;
    IdentifierContext* identifiers;
    // Parser
    size_t pop_idx;
    const Token* next_tok;
    const Token* peek_tok;
    const Token* peek_tok_i;
    vector_t(Token) * p_toks;
} ParserContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Parser

typedef ParserContext* Ctx;

static error_t expect_next(Ctx ctx, const Token* next_tok, TOKEN_KIND expect_tok) {
    CATCH_ENTER;
    if (next_tok->tok_kind != expect_tok) {
        THROW_AT_TOKEN(next_tok->info_at,
            GET_PARSER_MSG(MSG_unexpected_next_tok, str_fmt_tok(next_tok), get_tok_kind_fmt(expect_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t pop_next(Ctx ctx) {
    CATCH_ENTER;
    if (ctx->pop_idx >= vec_size(*ctx->p_toks)) {
        THROW_AT_TOKEN(vec_back(*ctx->p_toks).info_at, GET_PARSER_MSG_0(MSG_reached_eof));
    }

    ctx->next_tok = &(*ctx->p_toks)[ctx->pop_idx];
    ctx->pop_idx++;
    FINALLY;
    CATCH_EXIT;
}

static error_t peek_next(Ctx ctx) {
    CATCH_ENTER;
    if (ctx->pop_idx >= vec_size(*ctx->p_toks)) {
        THROW_AT_TOKEN(vec_back(*ctx->p_toks).info_at, GET_PARSER_MSG_0(MSG_reached_eof));
    }

    ctx->peek_tok = &(*ctx->p_toks)[ctx->pop_idx];
    FINALLY;
    CATCH_EXIT;
}

static error_t peek_next_i(Ctx ctx, size_t i) {
    CATCH_ENTER;
    if (i == 0) {
        TRY(peek_next(ctx));
        ctx->peek_tok_i = ctx->peek_tok;
        EARLY_EXIT;
    }
    if (ctx->pop_idx + i >= vec_size(*ctx->p_toks)) {
        THROW_AT_TOKEN(vec_back(*ctx->p_toks).info_at, GET_PARSER_MSG_0(MSG_reached_eof));
    }

    ctx->peek_tok_i = &(*ctx->p_toks)[ctx->pop_idx + i];
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_identifier(Ctx ctx, TIdentifier* identifier) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    *identifier = ctx->next_tok->tok;
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_string_literal(Ctx ctx, shared_ptr_t(CStringLiteral) * literal) {
    vector_t(TChar) value = vec_new();
    CATCH_ENTER;
    string_to_literal(map_get(ctx->identifiers->hash_table, ctx->next_tok->tok), &value);
    TRY(peek_next(ctx));
    while (ctx->peek_tok->tok_kind == TOK_string_literal) {
        TRY(pop_next(ctx));
        string_to_literal(map_get(ctx->identifiers->hash_table, ctx->next_tok->tok), &value);
        TRY(peek_next(ctx));
    }
    *literal = make_CStringLiteral(&value);
    FINALLY;
    vec_delete(value);
    CATCH_EXIT;
}

static shared_ptr_t(CConst) parse_int_const(intmax_t intmax) {
    TInt value = intmax_to_int32(intmax);
    return make_CConstInt(value);
}

static shared_ptr_t(CConst) parse_char_const(Ctx ctx) {
    TInt value = string_to_char_ascii(map_get(ctx->identifiers->hash_table, ctx->next_tok->tok));
    return make_CConstInt(value);
}

static shared_ptr_t(CConst) parse_long_const(intmax_t intmax) {
    TLong value = intmax_to_int64(intmax);
    return make_CConstLong(value);
}

static error_t parse_dbl_const(Ctx ctx, shared_ptr_t(CConst) * constant) {
    CATCH_ENTER;
    TDouble value;
    TRY(string_to_dbl(
        ctx->errors, map_get(ctx->identifiers->hash_table, ctx->next_tok->tok), ctx->next_tok->info_at, &value));
    *constant = make_CConstDouble(value);
    FINALLY;
    CATCH_EXIT;
}

static shared_ptr_t(CConst) parse_uint_const(uintmax_t uintmax) {
    TUInt value = uintmax_to_uint32(uintmax);
    return make_CConstUInt(value);
}

static shared_ptr_t(CConst) parse_ulong_const(uintmax_t uintmax) {
    TULong value = uintmax_to_uint64(uintmax);
    return make_CConstULong(value);
}

static error_t parse_const(Ctx ctx, shared_ptr_t(CConst) * constant) {
    CATCH_ENTER;
    intmax_t value;
    const char* strto_value;
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_key_true: {
            *constant = make_CConstInt(1);
            EARLY_EXIT;
        }
        case TOK_key_false: {
            *constant = make_CConstInt(0);
            EARLY_EXIT;
        }
        case TOK_char_const: {
            *constant = parse_char_const(ctx);
            EARLY_EXIT;
        }
        case TOK_dbl_const:
            TRY(parse_dbl_const(ctx, constant));
            EARLY_EXIT;
        default:
            break;
    }

    strto_value = map_get(ctx->identifiers->hash_table, ctx->next_tok->tok);
    TRY(string_to_intmax(ctx->errors, strto_value, ctx->next_tok->info_at, &value));
    if (value > 9223372036854775807ll) {
        THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_overflow_long_const, strto_value));
    }
    else if (ctx->next_tok->tok_kind == TOK_int_const && value <= 2147483647l) {
        *constant = parse_int_const(value);
    }
    else {
        *constant = parse_long_const(value);
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_unsigned_const(Ctx ctx, shared_ptr_t(CConst) * constant) {
    CATCH_ENTER;
    uintmax_t value;
    const char* strto_value;
    TRY(pop_next(ctx));

    strto_value = map_get(ctx->identifiers->hash_table, ctx->next_tok->tok);
    TRY(string_to_uintmax(ctx->errors, strto_value, ctx->next_tok->info_at, &value));
    if (value > 18446744073709551615ull) {
        THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_overflow_ulong_const, strto_value));
    }
    else if (ctx->next_tok->tok_kind == TOK_uint_const && value <= 4294967295ul) {
        *constant = parse_uint_const(value);
    }
    else {
        *constant = parse_ulong_const(value);
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_unop(Ctx ctx, CUnaryOp* unop) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_unop_complement: {
            *unop = init_CComplement();
            break;
        }
        case TOK_unop_neg: {
            *unop = init_CNegate();
            break;
        }
        case TOK_unop_not: {
            *unop = init_CNot();
            break;
        }
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_unop, str_fmt_tok(ctx->next_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_binop(Ctx ctx, CBinaryOp* binop) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_binop_add:
        case TOK_assign_add:
        case TOK_unop_incr: {
            *binop = init_CAdd();
            break;
        }
        case TOK_unop_neg:
        case TOK_assign_subtract:
        case TOK_unop_decr: {
            *binop = init_CSubtract();
            break;
        }
        case TOK_binop_multiply:
        case TOK_assign_multiply: {
            *binop = init_CMultiply();
            break;
        }
        case TOK_binop_divide:
        case TOK_assign_divide: {
            *binop = init_CDivide();
            break;
        }
        case TOK_binop_remainder:
        case TOK_assign_remainder: {
            *binop = init_CRemainder();
            break;
        }
        case TOK_binop_bitand:
        case TOK_assign_bitand: {
            *binop = init_CBitAnd();
            break;
        }
        case TOK_binop_bitor:
        case TOK_assign_bitor: {
            *binop = init_CBitOr();
            break;
        }
        case TOK_binop_xor:
        case TOK_assign_xor: {
            *binop = init_CBitXor();
            break;
        }
        case TOK_binop_shiftleft:
        case TOK_assign_shiftleft: {
            *binop = init_CBitShiftLeft();
            break;
        }
        case TOK_binop_shiftright:
        case TOK_assign_shiftright: {
            *binop = init_CBitShiftRight();
            break;
        }
        case TOK_binop_and: {
            *binop = init_CAnd();
            break;
        }
        case TOK_binop_or: {
            *binop = init_COr();
            break;
        }
        case TOK_binop_eq: {
            *binop = init_CEqual();
            break;
        }
        case TOK_binop_ne: {
            *binop = init_CNotEqual();
            break;
        }
        case TOK_binop_lt: {
            *binop = init_CLessThan();
            break;
        }
        case TOK_binop_le: {
            *binop = init_CLessOrEqual();
            break;
        }
        case TOK_binop_gt: {
            *binop = init_CGreaterThan();
            break;
        }
        case TOK_binop_ge: {
            *binop = init_CGreaterOrEqual();
            break;
        }
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_binop, str_fmt_tok(ctx->next_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_type_name(Ctx ctx, shared_ptr_t(Type) * type_name);

static error_t parse_datatype_specifier(Ctx ctx, TIdentifier* tag, bool* is_union) {
    CATCH_ENTER;
    switch (ctx->next_tok->tok_kind) {
        case TOK_key_struc: {
            *is_union = false;
            break;
        }
        case TOK_key_union: {
            *is_union = true;
            break;
        }
        default:
            THROW_AT_TOKEN(
                ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_data_specifier, str_fmt_tok(ctx->next_tok)));
    }
    TRY(peek_next(ctx));
    TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
    TRY(parse_identifier(ctx, tag));
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_type_specifier(Ctx ctx, shared_ptr_t(Type) * type_specifier) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_key_char: {
            *type_specifier = make_Char();
            break;
        }
        case TOK_key_string: {
            *type_specifier = make_Char();
            *type_specifier = make_Pointer(type_specifier);
            break;
        }
        case TOK_key_i32: {
            *type_specifier = make_Int();
            break;
        }
        case TOK_key_i64: {
            *type_specifier = make_Long();
            break;
        }
        case TOK_key_i8: {
            *type_specifier = make_SChar();
            break;
        }
        case TOK_key_f64: {
            *type_specifier = make_Double();
            break;
        }
        case TOK_key_u32: {
            *type_specifier = make_UInt();
            break;
        }
        case TOK_key_u64: {
            *type_specifier = make_ULong();
            break;
        }
        case TOK_key_u8: {
            *type_specifier = make_UChar();
            break;
        }
        case TOK_key_any: {
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG_0(MSG_incomplete_any));
        }
        case TOK_key_struc:
        case TOK_key_union: {
            bool is_union;
            TIdentifier tag;
            TRY(parse_datatype_specifier(ctx, &tag, &is_union));
            *type_specifier = make_Structure(tag, is_union);
            break;
        }
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_specifier, str_fmt_tok(ctx->next_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_arr_specifier(Ctx ctx, shared_ptr_t(Type) * type_specifier) {
    shared_ptr_t(CConst) constant = sptr_new();
    CATCH_ENTER;
    TLong size;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_true:
        case TOK_key_false:
        case TOK_int_const:
        case TOK_long_const:
        case TOK_char_const:
            TRY(parse_const(ctx, &constant));
            break;
        case TOK_uint_const:
        case TOK_ulong_const:
            TRY(parse_unsigned_const(ctx, &constant));
            break;
        default:
            THROW_AT_TOKEN(
                ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_arr_size_not_int_const, str_fmt_tok(ctx->peek_tok)));
    }
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_bracket));
    switch (constant->type) {
        case AST_CConstInt_t: {
            size = (TLong)constant->get._CConstInt.value;
            break;
        }
        case AST_CConstLong_t: {
            size = constant->get._CConstLong.value;
            break;
        }
        case AST_CConstUInt_t: {
            size = (TLong)constant->get._CConstUInt.value;
            break;
        }
        case AST_CConstULong_t: {
            size = (TLong)constant->get._CConstULong.value;
            break;
        }
        default:
            THROW_ABORT;
    }
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_key_any) {
        TRY(pop_next(ctx));
        *type_specifier = make_Void();
    }
    else {
        TRY(parse_type_name(ctx, type_specifier));
    }
    *type_specifier = make_Array(size, type_specifier);
    FINALLY;
    free_CConst(&constant);
    CATCH_EXIT;
}

static error_t parse_ptr_specifier(Ctx ctx, shared_ptr_t(Type) * type_specifier) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_key_any) {
        TRY(pop_next(ctx));
        *type_specifier = make_Void();
    }
    else {
        TRY(parse_type_name(ctx, type_specifier));
    }
    *type_specifier = make_Pointer(type_specifier);
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_type_name(Ctx ctx, shared_ptr_t(Type) * type_name) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_open_bracket:
            TRY(parse_arr_specifier(ctx, type_name));
            break;
        case TOK_binop_multiply:
            TRY(parse_ptr_specifier(ctx, type_name));
            break;
        default:
            TRY(parse_type_specifier(ctx, type_name));
            break;
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_maybe_type(Ctx ctx, shared_ptr_t(Type) * maybe_type) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_char:
        case TOK_key_string:
        case TOK_key_i32:
        case TOK_key_i64:
        case TOK_key_i8:
        case TOK_key_f64:
        case TOK_key_u32:
        case TOK_key_u64:
        case TOK_key_u8:
        case TOK_key_any:
        case TOK_key_struc:
        case TOK_key_union:
        case TOK_open_bracket:
        case TOK_binop_multiply:
            TRY(parse_type_name(ctx, maybe_type));
            break;
        case TOK_key_none: {
            TRY(pop_next(ctx));
            *maybe_type = make_Void();
            break;
        }
        default:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_expect_maybe_type, str_fmt_tok(ctx->peek_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_unary_exp_factor(Ctx ctx, unique_ptr_t(CExp) * exp);
static error_t parse_exp(Ctx ctx, int32_t min_precedence, unique_ptr_t(CExp) * exp);

static error_t parse_arg_list(Ctx ctx, vector_t(unique_ptr_t(CExp)) * args) {
    unique_ptr_t(CExp) arg = uptr_new();
    CATCH_ENTER;
    TRY(parse_exp(ctx, 0, &arg));
    vec_move_back(*args, arg);
    TRY(peek_next(ctx));
    while (ctx->peek_tok->tok_kind == TOK_comma_separator) {
        TRY(pop_next(ctx));
        TRY(parse_exp(ctx, 0, &arg));
        vec_move_back(*args, arg);
        TRY(peek_next(ctx));
    }
    FINALLY;
    free_CExp(&arg);
    CATCH_EXIT;
}

static error_t parse_const_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    shared_ptr_t(CConst) constant = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(parse_const(ctx, &constant));
    *exp = make_CConstant(&constant, info_at);
    FINALLY;
    free_CConst(&constant);
    CATCH_EXIT;
}

static error_t parse_unsigned_const_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    shared_ptr_t(CConst) constant = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(parse_unsigned_const(ctx, &constant));
    *exp = make_CConstant(&constant, info_at);
    FINALLY;
    free_CConst(&constant);
    CATCH_EXIT;
}

static error_t parse_string_literal_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    shared_ptr_t(CStringLiteral) literal = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(parse_string_literal(ctx, &literal));
    *exp = make_CString(&literal, info_at);
    FINALLY;
    free_CStringLiteral(&literal);
    CATCH_EXIT;
}

static error_t parse_var_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TIdentifier name;
    TRY(parse_identifier(ctx, &name));
    *exp = make_CVar(name, info_at);
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_call_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    vector_t(unique_ptr_t(CExp)) args = vec_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TIdentifier name;
    TRY(parse_identifier(ctx, &name));
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind != TOK_close_paren) {
        TRY(parse_arg_list(ctx, &args));
    }
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    *exp = make_CFunctionCall(name, &args, info_at);
    FINALLY;
    for (size_t i = 0; i < vec_size(args); ++i) {
        free_CExp(&args[i]);
    }
    vec_delete(args);
    CATCH_EXIT;
}

static error_t parse_cast_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) cast_exp = uptr_new();
    shared_ptr_t(Type) target_type = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_binop_lt));
    TRY(parse_maybe_type(ctx, &target_type));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_binop_gt));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren));
    TRY(parse_exp(ctx, 0, &cast_exp));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    *exp = make_CCast(&cast_exp, &target_type, info_at);
    FINALLY;
    free_CExp(&cast_exp);
    free_Type(&target_type);
    CATCH_EXIT;
}

static error_t parse_inner_exp_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(parse_exp(ctx, 0, exp));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_deref_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_typeop_member) {
        info_at = ctx->peek_tok->info_at;
        TRY(pop_next(ctx));
        TRY(peek_next(ctx));
        TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
        TIdentifier member;
        TRY(parse_identifier(ctx, &member));
        *exp = make_CArrow(member, exp, info_at);
    }
    else {
        *exp = make_CDereference(exp, info_at);
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_subscript_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) subscript_exp = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(parse_exp(ctx, 0, &subscript_exp));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_bracket));
    *exp = make_CSubscript(exp, &subscript_exp, info_at);
    FINALLY;
    free_CExp(&subscript_exp);
    CATCH_EXIT;
}

static error_t parse_arr_unary_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_close_bracket) {
        TRY(parse_deref_factor(ctx, exp));
    }
    else {
        TRY(parse_subscript_factor(ctx, exp));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_dot_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
    TIdentifier member;
    TRY(parse_identifier(ctx, &member));
    *exp = make_CDot(member, exp, info_at);
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_postfix_incr_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) exp_right = uptr_new();
    unique_ptr_t(CExp) exp_right_1 = uptr_new();
    shared_ptr_t(CConst) constant = sptr_new();
    CATCH_ENTER;
    unique_ptr_t(CExp) exp_null = uptr_new();
    size_t info_at = ctx->peek_tok->info_at;
    CUnaryOp unop = init_CPostfix();
    CBinaryOp binop = init_CBinaryOp();
    TRY(parse_binop(ctx, &binop));
    constant = make_CConstInt(1);
    exp_right = make_CConstant(&constant, info_at);
    exp_right_1 = make_CBinary(&binop, exp, &exp_right, info_at);
    *exp = make_CAssignment(&unop, &exp_null, &exp_right_1, info_at);
    FINALLY;
    free_CExp(&exp_right);
    free_CExp(&exp_right_1);
    free_CConst(&constant);
    CATCH_EXIT;
}

static error_t parse_unary_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) cast_exp = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    CUnaryOp unop = init_CUnaryOp();
    TRY(parse_unop(ctx, &unop));
    TRY(parse_unary_exp_factor(ctx, &cast_exp));
    *exp = make_CUnary(&unop, &cast_exp, info_at);
    FINALLY;
    free_CExp(&cast_exp);
    CATCH_EXIT;
}

static error_t parse_incr_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) exp_left = uptr_new();
    unique_ptr_t(CExp) exp_right = uptr_new();
    unique_ptr_t(CExp) exp_left_1 = uptr_new();
    unique_ptr_t(CExp) exp_right_1 = uptr_new();
    shared_ptr_t(CConst) constant = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    CUnaryOp unop = init_CPrefix();
    CBinaryOp binop = init_CBinaryOp();
    TRY(parse_binop(ctx, &binop));
    TRY(parse_unary_exp_factor(ctx, &exp_left));
    constant = make_CConstInt(1);
    exp_right = make_CConstant(&constant, info_at);
    exp_right_1 = make_CBinary(&binop, &exp_left, &exp_right, info_at);
    *exp = make_CAssignment(&unop, &exp_left_1, &exp_right_1, info_at);
    FINALLY;
    free_CExp(&exp_left);
    free_CExp(&exp_right);
    free_CExp(&exp_left_1);
    free_CExp(&exp_right_1);
    free_CConst(&constant);
    CATCH_EXIT;
}

static error_t parse_addrof_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) cast_exp = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(parse_unary_exp_factor(ctx, &cast_exp));
    *exp = make_CAddrOf(&cast_exp, info_at);
    FINALLY;
    free_CExp(&cast_exp);
    CATCH_EXIT;
}

static error_t parse_sizeoft_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    shared_ptr_t(Type) target_type = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->next_tok->info_at;
    TRY(parse_type_name(ctx, &target_type));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_binop_gt));
    *exp = make_CSizeOfT(&target_type, info_at);
    FINALLY;
    free_Type(&target_type);
    CATCH_EXIT;
}

static error_t parse_sizeof_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) unary_exp = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->next_tok->info_at;
    TRY(parse_exp(ctx, 0, &unary_exp));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    *exp = make_CSizeOf(&unary_exp, info_at);
    FINALLY;
    free_CExp(&unary_exp);
    CATCH_EXIT;
}

static error_t parse_sizeof_unary_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_binop_lt:
            TRY(parse_sizeoft_factor(ctx, exp));
            break;
        case TOK_open_paren:
            TRY(parse_sizeof_factor(ctx, exp));
            break;
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_open_sizeof, str_fmt_tok(ctx->next_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_primary_exp_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_true:
        case TOK_key_false:
        case TOK_int_const:
        case TOK_long_const:
        case TOK_char_const:
        case TOK_dbl_const:
            TRY(parse_const_factor(ctx, exp));
            break;
        case TOK_uint_const:
        case TOK_ulong_const:
            TRY(parse_unsigned_const_factor(ctx, exp));
            break;
        case TOK_string_literal:
            TRY(parse_string_literal_factor(ctx, exp));
            break;
        case TOK_key_cast:
            TRY(parse_cast_factor(ctx, exp));
            break;
        case TOK_identifier: {
            TRY(peek_next_i(ctx, 1));
            if (ctx->peek_tok_i->tok_kind == TOK_open_paren) {
                TRY(parse_call_factor(ctx, exp));
            }
            else {
                TRY(parse_var_factor(ctx, exp));
            }
            break;
        }
        case TOK_open_paren:
            TRY(parse_inner_exp_factor(ctx, exp));
            break;
        default:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_expect_expression, str_fmt_tok(ctx->peek_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_postfix_op_exp_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_open_bracket:
            TRY(parse_arr_unary_factor(ctx, exp));
            break;
        case TOK_typeop_member:
            TRY(parse_dot_factor(ctx, exp));
            break;
        case TOK_unop_incr:
        case TOK_unop_decr:
            TRY(parse_postfix_incr_factor(ctx, exp));
            break;
        default:
            EARLY_EXIT;
    }
    TRY(parse_postfix_op_exp_factor(ctx, exp));
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_postfix_exp_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(parse_primary_exp_factor(ctx, exp));
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_open_bracket:
        case TOK_typeop_member:
        case TOK_unop_incr:
        case TOK_unop_decr:
            TRY(parse_postfix_op_exp_factor(ctx, exp));
            break;
        default:
            break;
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_unary_exp_factor(Ctx ctx, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_unop_complement:
        case TOK_unop_neg:
        case TOK_unop_not:
            TRY(parse_unary_factor(ctx, exp));
            break;
        case TOK_unop_incr:
        case TOK_unop_decr:
            TRY(parse_incr_factor(ctx, exp));
            break;
        case TOK_unop_addrof:
            TRY(parse_addrof_factor(ctx, exp));
            break;
        case TOK_key_sizeof:
            TRY(parse_sizeof_unary_factor(ctx, exp));
            break;
        default:
            TRY(parse_postfix_exp_factor(ctx, exp));
            break;
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_assign_exp(Ctx ctx, int32_t precedence, unique_ptr_t(CExp) * exp_left) {
    unique_ptr_t(CExp) exp_right = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    CUnaryOp unop = init_CUnaryOp();
    TRY(pop_next(ctx));
    TRY(parse_exp(ctx, precedence, &exp_right));
    *exp_left = make_CAssignment(&unop, exp_left, &exp_right, info_at);
    FINALLY;
    free_CExp(&exp_right);
    CATCH_EXIT;
}

static error_t parse_assign_compound_exp(Ctx ctx, int32_t precedence, unique_ptr_t(CExp) * exp_left) {
    unique_ptr_t(CExp) exp_right = uptr_new();
    unique_ptr_t(CExp) exp_right_1 = uptr_new();
    CATCH_ENTER;
    unique_ptr_t(CExp) exp_null = uptr_new();
    size_t info_at = ctx->peek_tok->info_at;
    CUnaryOp unop = init_CUnaryOp();
    CBinaryOp binop = init_CBinaryOp();
    TRY(parse_binop(ctx, &binop));
    TRY(parse_exp(ctx, precedence, &exp_right));
    exp_right_1 = make_CBinary(&binop, exp_left, &exp_right, info_at);
    *exp_left = make_CAssignment(&unop, &exp_null, &exp_right_1, info_at);
    FINALLY;
    free_CExp(&exp_right);
    free_CExp(&exp_right_1);
    CATCH_EXIT;
}

static error_t parse_binary_exp(Ctx ctx, int32_t precedence, unique_ptr_t(CExp) * exp_left) {
    unique_ptr_t(CExp) exp_right = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    CBinaryOp binop = init_CBinaryOp();
    TRY(parse_binop(ctx, &binop));
    TRY(parse_exp(ctx, precedence + 1, &exp_right));
    *exp_left = make_CBinary(&binop, exp_left, &exp_right, info_at);
    FINALLY;
    free_CExp(&exp_right);
    CATCH_EXIT;
}

static error_t parse_ternary_exp(Ctx ctx, unique_ptr_t(CExp) * exp) {
    unique_ptr_t(CExp) exp_left = uptr_new();
    unique_ptr_t(CExp) exp_middle = uptr_new();
    unique_ptr_t(CExp) exp_right = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(parse_exp(ctx, 0, &exp_left));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_key_then));
    TRY(parse_exp(ctx, 0, &exp_middle));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_key_else));
    TRY(parse_exp(ctx, 0, &exp_right));
    *exp = make_CConditional(&exp_left, &exp_middle, &exp_right, info_at);
    FINALLY;
    free_CExp(&exp_left);
    free_CExp(&exp_middle);
    free_CExp(&exp_right);
    CATCH_EXIT;
}

static int32_t get_tok_precedence(TOKEN_KIND tok_kind) {
    switch (tok_kind) {
        case TOK_binop_multiply:
        case TOK_binop_divide:
        case TOK_binop_remainder:
            return 50;
        case TOK_unop_neg:
        case TOK_binop_add:
            return 45;
        case TOK_binop_shiftleft:
        case TOK_binop_shiftright:
            return 40;
        case TOK_binop_lt:
        case TOK_binop_le:
        case TOK_binop_gt:
        case TOK_binop_ge:
            return 35;
        case TOK_binop_eq:
        case TOK_binop_ne:
            return 30;
        case TOK_binop_bitand:
            return 25;
        case TOK_binop_xor:
            return 20;
        case TOK_binop_bitor:
            return 15;
        case TOK_binop_and:
            return 10;
        case TOK_binop_or:
            return 5;
        case TOK_assign:
        case TOK_assign_add:
        case TOK_assign_subtract:
        case TOK_assign_multiply:
        case TOK_assign_divide:
        case TOK_assign_remainder:
        case TOK_assign_bitand:
        case TOK_assign_bitor:
        case TOK_assign_xor:
        case TOK_assign_shiftleft:
        case TOK_assign_shiftright:
            return 1;
        default:
            return -1;
    }
}

static error_t parse_exp(Ctx ctx, int32_t min_precedence, unique_ptr_t(CExp) * exp) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_ternary_if) {
        TRY(parse_ternary_exp(ctx, exp));
    }
    else {
        TRY(parse_unary_exp_factor(ctx, exp));
    }
    while (true) {
        TRY(peek_next(ctx));
        int32_t precedence = get_tok_precedence(ctx->peek_tok->tok_kind);
        if (precedence < min_precedence) {
            break;
        }
        switch (ctx->peek_tok->tok_kind) {
            case TOK_binop_add:
            case TOK_unop_neg:
            case TOK_binop_multiply:
            case TOK_binop_divide:
            case TOK_binop_remainder:
            case TOK_binop_bitand:
            case TOK_binop_bitor:
            case TOK_binop_xor:
            case TOK_binop_shiftleft:
            case TOK_binop_shiftright:
            case TOK_binop_lt:
            case TOK_binop_le:
            case TOK_binop_gt:
            case TOK_binop_ge:
            case TOK_binop_eq:
            case TOK_binop_ne:
            case TOK_binop_and:
            case TOK_binop_or:
                TRY(parse_binary_exp(ctx, precedence, exp));
                break;
            case TOK_assign:
                TRY(parse_assign_exp(ctx, precedence, exp));
                break;
            case TOK_assign_add:
            case TOK_assign_subtract:
            case TOK_assign_multiply:
            case TOK_assign_divide:
            case TOK_assign_remainder:
            case TOK_assign_bitand:
            case TOK_assign_bitor:
            case TOK_assign_xor:
            case TOK_assign_shiftleft:
            case TOK_assign_shiftright:
                TRY(parse_assign_compound_exp(ctx, precedence, exp));
                break;
            default:
                THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_expect_binop, str_fmt_tok(ctx->peek_tok)));
        }
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_block(Ctx ctx, unique_ptr_t(CBlock) * block);
static error_t parse_var_declaration(
    Ctx ctx, const CStorageClass* storage_class, unique_ptr_t(CVariableDeclaration) * var_decl);

static error_t parse_ret_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CExp) exp = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_key_none) {
        TRY(pop_next(ctx));
    }
    else {
        TRY(parse_exp(ctx, 0, &exp));
    }
    *statement = make_CReturn(&exp, info_at);
    FINALLY;
    free_CExp(&exp);
    CATCH_EXIT;
}

static error_t parse_exp_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CExp) exp = uptr_new();
    CATCH_ENTER;
    TRY(parse_exp(ctx, 0, &exp));
    *statement = make_CExpression(&exp);
    FINALLY;
    free_CExp(&exp);
    CATCH_EXIT;
}

static error_t parse_compound_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CBlock) block = uptr_new();
    CATCH_ENTER;
    TRY(parse_block(ctx, &block));
    if (block) {
        *statement = make_CCompound(&block);
    }
    else {
        *statement = make_CNull();
    }
    FINALLY;
    free_CBlock(&block);
    CATCH_EXIT;
}

static error_t parse_if_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CExp) condition = uptr_new();
    unique_ptr_t(CStatement) then = uptr_new();
    unique_ptr_t(CStatement) else_fi = uptr_new();
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(parse_exp(ctx, 0, &condition));
    TRY(parse_compound_statement(ctx, &then));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_line_break) {
        TRY(peek_next_i(ctx, 1));
        switch (ctx->peek_tok_i->tok_kind) {
            case TOK_key_elif:
                TRY(pop_next(ctx));
                TRY(parse_if_statement(ctx, &else_fi));
                break;
            case TOK_key_else:
                TRY(pop_next(ctx));
                TRY(pop_next(ctx));
                TRY(parse_compound_statement(ctx, &else_fi));
                break;
            default:
                break;
        }
    }
    *statement = make_CIf(&condition, &then, &else_fi);
    FINALLY;
    free_CExp(&condition);
    free_CStatement(&then);
    free_CStatement(&else_fi);
    CATCH_EXIT;
}

static error_t parse_jump_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
    TIdentifier target;
    TRY(parse_identifier(ctx, &target));
    *statement = make_CGoto(target, info_at);
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_label_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CStatement) jump_to = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
    TIdentifier target;
    TRY(parse_identifier(ctx, &target));
    jump_to = make_CNull();
    *statement = make_CLabel(target, &jump_to, info_at);
    FINALLY;
    free_CStatement(&jump_to);
    CATCH_EXIT;
}

static error_t parse_loop_init_decl(Ctx ctx, unique_ptr_t(CForInit) * for_init) {
    unique_ptr_t(CVariableDeclaration) var_decl = uptr_new();
    CATCH_ENTER;
    CStorageClass storage_class = init_CStorageClass();
    TRY(parse_var_declaration(ctx, &storage_class, &var_decl));
    *for_init = make_CInitDecl(&var_decl);
    FINALLY;
    free_CVariableDeclaration(&var_decl);
    CATCH_EXIT;
}

static error_t parse_loop_init_exp(Ctx ctx, unique_ptr_t(CForInit) * for_init) {
    unique_ptr_t(CExp) init = uptr_new();
    CATCH_ENTER;
    TRY(parse_exp(ctx, 0, &init));
    *for_init = make_CInitExp(&init);
    FINALLY;
    free_CExp(&init);
    CATCH_EXIT;
}

static error_t parse_loop_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CForInit) for_init = uptr_new();
    unique_ptr_t(CExp) condition = uptr_new();
    unique_ptr_t(CExp) post = uptr_new();
    unique_ptr_t(CStatement) body = uptr_new();
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_open_brace:
            goto Lbreak;
        case TOK_semicolon:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG_0(MSG_infinite_loop));
        case TOK_loop_post: {
            TRY(pop_next(ctx));
            TRY(peek_next(ctx));
            if (ctx->peek_tok->tok_kind == TOK_key_while) {
                TRY(pop_next(ctx));
                TRY(parse_exp(ctx, 0, &condition));
                TRY(parse_compound_statement(ctx, &body));
                *statement = make_CDoWhile(&condition, &body);
                EARLY_EXIT;
            }
            else {
                TRY(parse_exp(ctx, 0, &post));
                goto Lbreak;
            }
        }
        case TOK_key_while: {
            TRY(pop_next(ctx));
            TRY(parse_exp(ctx, 0, &condition));
            TRY(peek_next(ctx));
            if (ctx->peek_tok->tok_kind == TOK_loop_post) {
                TRY(pop_next(ctx));
                TRY(parse_exp(ctx, 0, &post));
                goto Lbreak;
            }
            else {
                TRY(parse_compound_statement(ctx, &body));
                *statement = make_CWhile(&condition, &body);
                EARLY_EXIT;
            }
        }
        case TOK_key_pub:
        case TOK_key_data:
        case TOK_key_extrn:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_loop_decl_not_auto, str_fmt_tok(ctx->peek_tok)));
        case TOK_identifier: {
            TRY(peek_next_i(ctx, 1));
            if (ctx->peek_tok_i->tok_kind == TOK_assign_type) {
                TRY(parse_loop_init_decl(ctx, &for_init));
            }
            else {
                TRY(parse_loop_init_exp(ctx, &for_init));
            }
            break;
        }
        default:
            TRY(parse_loop_init_exp(ctx, &for_init));
            break;
    }
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_key_while) {
        TRY(pop_next(ctx));
        TRY(parse_exp(ctx, 0, &condition));
        TRY(peek_next(ctx));
    }
    if (ctx->peek_tok->tok_kind == TOK_loop_post) {
        TRY(pop_next(ctx));
        TRY(parse_exp(ctx, 0, &post));
    }
Lbreak:
    if (!for_init) {
        unique_ptr_t(CExp) exp_null = uptr_new();
        for_init = make_CInitExp(&exp_null);
    }
    if (!condition) {
        TRY(peek_next(ctx));
        if (ctx->peek_tok->tok_kind == TOK_semicolon) {
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG_0(MSG_infinite_loop));
        }
    }
    TRY(parse_compound_statement(ctx, &body));
    *statement = make_CFor(&for_init, &condition, &post, &body);
    FINALLY;
    free_CForInit(&for_init);
    free_CExp(&condition);
    free_CExp(&post);
    free_CStatement(&body);
    CATCH_EXIT;
}

static error_t parse_match_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CExp) match = uptr_new();
    unique_ptr_t(CStatement) body = uptr_new();
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(parse_exp(ctx, 0, &match));
    TRY(parse_compound_statement(ctx, &body));
    *statement = make_CSwitch(&match, &body);
    FINALLY;
    free_CExp(&match);
    free_CStatement(&body);
    CATCH_EXIT;
}

static error_t parse_with_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CExp) value = uptr_new();
    unique_ptr_t(CStatement) jump_to = uptr_new();
    shared_ptr_t(CConst) constant = sptr_new();
    CATCH_ENTER;
    size_t info_at;
    TRY(pop_next(ctx));
    info_at = ctx->peek_tok->info_at;
    TRY(peek_next(ctx));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_true:
        case TOK_key_false:
        case TOK_int_const:
        case TOK_long_const:
        case TOK_char_const:
            TRY(parse_const(ctx, &constant));
            break;
        case TOK_uint_const:
        case TOK_ulong_const:
            TRY(parse_unsigned_const(ctx, &constant));
            break;
        default:
            THROW_AT_TOKEN(
                ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_case_value_not_int_const, str_fmt_tok(ctx->peek_tok)));
    }
    value = make_CConstant(&constant, info_at);
    TRY(parse_compound_statement(ctx, &jump_to));
    *statement = make_CCase(&value, &jump_to);
    FINALLY;
    free_CExp(&value);
    free_CStatement(&jump_to);
    free_CConst(&constant);
    CATCH_EXIT;
}

static error_t parse_otherwise_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    unique_ptr_t(CStatement) jump_to = uptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(parse_compound_statement(ctx, &jump_to));
    *statement = make_CDefault(&jump_to, info_at);
    FINALLY;
    free_CStatement(&jump_to);
    CATCH_EXIT;
}

static error_t parse_break_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    *statement = make_CBreak(info_at);
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_continue_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    *statement = make_CContinue(info_at);
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_null_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    *statement = make_CNull();
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_statement(Ctx ctx, unique_ptr_t(CStatement) * statement) {
    CATCH_ENTER;
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_return:
            TRY(parse_ret_statement(ctx, statement));
            EARLY_EXIT;
        case TOK_key_if:
            TRY(parse_if_statement(ctx, statement));
            break;
        case TOK_key_jump:
            TRY(parse_jump_statement(ctx, statement));
            break;
        case TOK_key_label:
            TRY(parse_label_statement(ctx, statement));
            break;
        case TOK_open_brace:
            TRY(parse_compound_statement(ctx, statement));
            break;
        case TOK_key_loop:
            TRY(parse_loop_statement(ctx, statement));
            break;
        case TOK_key_match:
            TRY(parse_match_statement(ctx, statement));
            break;
        case TOK_match_with:
            TRY(parse_with_statement(ctx, statement));
            break;
        case TOK_key_otherwise:
            TRY(parse_otherwise_statement(ctx, statement));
            break;
        case TOK_key_break:
            TRY(parse_break_statement(ctx, statement));
            break;
        case TOK_key_continue:
            TRY(parse_continue_statement(ctx, statement));
            break;
        case TOK_semicolon:
            TRY(parse_null_statement(ctx, statement));
            break;
        default:
            TRY(parse_exp_statement(ctx, statement));
            break;
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_declaration(Ctx ctx, CStorageClass* storage_class, unique_ptr_t(CDeclaration) * declaration);

static error_t parse_s_block_item(Ctx ctx, unique_ptr_t(CBlockItem) * block_item) {
    unique_ptr_t(CStatement) statement = uptr_new();
    CATCH_ENTER;
    TRY(parse_statement(ctx, &statement));
    *block_item = make_CS(&statement);
    FINALLY;
    free_CStatement(&statement);
    CATCH_EXIT;
}

static error_t parse_d_block_item(Ctx ctx, unique_ptr_t(CBlockItem) * block_item) {
    unique_ptr_t(CDeclaration) declaration = uptr_new();
    CATCH_ENTER;
    CStorageClass storage_class = init_CStorageClass();
    TRY(parse_declaration(ctx, &storage_class, &declaration));
    *block_item = make_CD(&declaration);
    FINALLY;
    free_CDeclaration(&declaration);
    CATCH_EXIT;
}

static error_t parse_block_item(Ctx ctx, unique_ptr_t(CBlockItem) * block_item) {
    CATCH_ENTER;
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_pub:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG_0(MSG_pub_in_block));
        case TOK_key_data:
        case TOK_key_extrn:
        case TOK_key_fn:
        case TOK_key_type:
            TRY(parse_d_block_item(ctx, block_item));
            EARLY_EXIT;
        case TOK_identifier: {
            TRY(peek_next_i(ctx, 1));
            if (ctx->peek_tok_i->tok_kind == TOK_assign_type) {
                TRY(parse_d_block_item(ctx, block_item));
                EARLY_EXIT;
            }
            break;
        }
        default:
            break;
    }
    TRY(parse_s_block_item(ctx, block_item));
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_b_block(Ctx ctx, unique_ptr_t(CBlock) * block) {
    unique_ptr_t(CBlockItem) block_item = uptr_new();
    vector_t(unique_ptr_t(CBlockItem)) block_items = vec_new();
    CATCH_ENTER;
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_line_break) {
        TRY(pop_next(ctx));
        TRY(peek_next(ctx));
    }
    if (ctx->peek_tok->tok_kind == TOK_close_brace) {
        THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG_0(MSG_empty_block));
    }
    TRY(parse_block_item(ctx, &block_item));
    vec_move_back(block_items, block_item);
    while (true) {
        TRY(pop_next(ctx));
        if (ctx->next_tok->tok_kind == TOK_close_brace) {
            break;
        }
        TRY(expect_next(ctx, ctx->next_tok, TOK_line_break));
        TRY(peek_next(ctx));
        if (ctx->peek_tok->tok_kind == TOK_close_brace) {
            TRY(pop_next(ctx));
            break;
        }
        TRY(parse_block_item(ctx, &block_item));
        vec_move_back(block_items, block_item);
    }
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_brace));
    *block = make_CB(&block_items);
    FINALLY;
    free_CBlockItem(&block_item);
    for (size_t i = 0; i < vec_size(block_items); ++i) {
        free_CBlockItem(&block_items[i]);
    }
    vec_delete(block_items);
    CATCH_EXIT;
}

static error_t parse_block(Ctx ctx, unique_ptr_t(CBlock) * block) {
    CATCH_ENTER;
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_semicolon:
            break;
        case TOK_open_brace:
            TRY(parse_b_block(ctx, block));
            break;
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_block, str_fmt_tok(ctx->next_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_initializer(Ctx ctx, unique_ptr_t(CInitializer) * initializer);

static error_t parse_single_init(Ctx ctx, unique_ptr_t(CInitializer) * initializer) {
    unique_ptr_t(CExp) exp = uptr_new();
    CATCH_ENTER;
    TRY(parse_exp(ctx, 0, &exp));
    *initializer = make_CSingleInit(&exp);
    FINALLY;
    free_CExp(&exp);
    CATCH_EXIT;
}

static error_t parse_compound_init(Ctx ctx, unique_ptr_t(CInitializer) * initializer) {
    vector_t(unique_ptr_t(CInitializer)) initializers = vec_new();
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_close_paren) {
        THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG_0(MSG_empty_compound_init));
    }
    TRY(parse_initializer(ctx, initializer));
    vec_move_back(initializers, *initializer);
    TRY(pop_next(ctx));
    while (ctx->next_tok->tok_kind == TOK_comma_separator) {
        TRY(parse_initializer(ctx, initializer));
        vec_move_back(initializers, *initializer);
        TRY(pop_next(ctx));
    }
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    *initializer = make_CCompoundInit(&initializers);
    FINALLY;
    for (size_t i = 0; i < vec_size(initializers); ++i) {
        free_CInitializer(&initializers[i]);
    }
    vec_delete(initializers);
    CATCH_EXIT;
}

static error_t parse_initializer(Ctx ctx, unique_ptr_t(CInitializer) * initializer) {
    CATCH_ENTER;
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_compound_init) {
        TRY(parse_compound_init(ctx, initializer));
    }
    else {
        TRY(parse_single_init(ctx, initializer));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_decltor(Ctx ctx, TIdentifier* name, shared_ptr_t(Type) * derived_type) {
    CATCH_ENTER;
    TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
    TRY(parse_identifier(ctx, name));
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_assign_type));
    TRY(parse_type_name(ctx, derived_type));
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_item_decltor(Ctx ctx, TIdentifier* name, shared_ptr_t(Type) * derived_type) {
    CATCH_ENTER;
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_pub:
        case TOK_key_data:
        case TOK_key_extrn:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_list_decl_not_auto, str_fmt_tok(ctx->peek_tok)));
        default:
            break;
    }
    TRY(parse_decltor(ctx, name, derived_type));
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_decltor_list(Ctx ctx, vector_t(TIdentifier) * params, vector_t(shared_ptr_t(Type)) * param_types) {
    shared_ptr_t(Type) param_type = sptr_new();
    CATCH_ENTER;
    TIdentifier param;
    TRY(parse_item_decltor(ctx, &param, &param_type));
    vec_push_back(*params, param);
    vec_move_back(*param_types, param_type);
    TRY(peek_next(ctx));
    while (ctx->peek_tok->tok_kind == TOK_comma_separator) {
        TRY(pop_next(ctx));
        TRY(peek_next(ctx));
        TRY(parse_item_decltor(ctx, &param, &param_type));
        vec_push_back(*params, param);
        vec_move_back(*param_types, param_type);
        TRY(peek_next(ctx));
    }
    FINALLY;
    free_Type(&param_type);
    CATCH_EXIT;
}

static error_t parse_fun_decltor(Ctx ctx, shared_ptr_t(Type) * fun_type, vector_t(TIdentifier) * params) {
    vector_t(shared_ptr_t(Type)) param_types = vec_new();
    CATCH_ENTER;
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_key_none) {
        TRY(pop_next(ctx));
    }
    else {
        TRY(parse_decltor_list(ctx, params, &param_types));
    }
    TRY(pop_next(ctx));
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    TRY(parse_maybe_type(ctx, fun_type));
    *fun_type = make_FunType(&param_types, fun_type);
    FINALLY;
    for (size_t i = 0; i < vec_size(param_types); ++i) {
        free_Type(&param_types[i]);
    }
    vec_delete(param_types);
    CATCH_EXIT;
}

static error_t parse_fun_declaration(
    Ctx ctx, const CStorageClass* storage_class, unique_ptr_t(CFunctionDeclaration) * fun_decl) {
    unique_ptr_t(CBlock) body = uptr_new();
    shared_ptr_t(Type) fun_type = sptr_new();
    vector_t(TIdentifier) params = vec_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier));
    TIdentifier name;
    TRY(parse_identifier(ctx, &name));
    TRY(parse_fun_decltor(ctx, &fun_type, &params));
    TRY(parse_block(ctx, &body));
    *fun_decl = make_CFunctionDeclaration(name, &params, &body, &fun_type, storage_class, info_at);
    FINALLY;
    free_CBlock(&body);
    free_Type(&fun_type);
    vec_delete(params);
    CATCH_EXIT;
}

static error_t parse_var_declaration(
    Ctx ctx, const CStorageClass* storage_class, unique_ptr_t(CVariableDeclaration) * var_decl) {
    unique_ptr_t(CInitializer) initializer = uptr_new();
    shared_ptr_t(Type) var_type = sptr_new();
    CATCH_ENTER;
    size_t info_at = ctx->peek_tok->info_at;
    TIdentifier name;
    TRY(parse_decltor(ctx, &name, &var_type));
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_semicolon:
            break;
        case TOK_assign:
            TRY(parse_initializer(ctx, &initializer));
            break;
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_assign, str_fmt_tok(ctx->next_tok)));
    }
    *var_decl = make_CVariableDeclaration(name, &initializer, &var_type, storage_class, info_at);
    FINALLY;
    free_CInitializer(&initializer);
    free_Type(&var_type);
    CATCH_EXIT;
}

static error_t parse_member_declaration(Ctx ctx, unique_ptr_t(CMemberDeclaration) * member_decl) {
    shared_ptr_t(Type) member_type = sptr_new();
    CATCH_ENTER;
    size_t info_at;
    TIdentifier member_name;
    TRY(peek_next(ctx));
    info_at = ctx->peek_tok->info_at;
    TRY(parse_item_decltor(ctx, &member_name, &member_type));
    *member_decl = make_CMemberDeclaration(member_name, &member_type, info_at);
    FINALLY;
    free_Type(&member_type);
    CATCH_EXIT;
}

static error_t parse_member_list(Ctx ctx, vector_t(unique_ptr_t(CMemberDeclaration)) * members) {
    unique_ptr_t(CMemberDeclaration) member = uptr_new();
    CATCH_ENTER;
    TRY(parse_member_declaration(ctx, &member));
    vec_move_back(*members, member);
    TRY(pop_next(ctx));
    while (ctx->next_tok->tok_kind == TOK_comma_separator) {
        TRY(parse_member_declaration(ctx, &member));
        vec_move_back(*members, member);
        TRY(pop_next(ctx));
    }
    TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren));
    FINALLY;
    free_CMemberDeclaration(&member);
    CATCH_EXIT;
}

static error_t parse_struct_declaration(Ctx ctx, unique_ptr_t(CStructDeclaration) * struct_decl) {
    vector_t(unique_ptr_t(CMemberDeclaration)) members = vec_new();
    CATCH_ENTER;
    bool is_union;
    TIdentifier tag;
    size_t info_at = ctx->peek_tok->info_at;
    TRY(pop_next(ctx));
    TRY(pop_next(ctx));
    TRY(parse_datatype_specifier(ctx, &tag, &is_union));
    TRY(pop_next(ctx));
    switch (ctx->next_tok->tok_kind) {
        case TOK_semicolon:
            break;
        case TOK_open_paren:
            TRY(parse_member_list(ctx, &members));
            break;
        default:
            THROW_AT_TOKEN(ctx->next_tok->info_at, GET_PARSER_MSG(MSG_expect_datatype, str_fmt_tok(ctx->next_tok)));
    }
    *struct_decl = make_CStructDeclaration(tag, is_union, &members, info_at);
    FINALLY;
    for (size_t i = 0; i < vec_size(members); ++i) {
        free_CMemberDeclaration(&members[i]);
    }
    vec_delete(members);
    CATCH_EXIT;
}

static error_t parse_fun_decl(Ctx ctx, const CStorageClass* storage_class, unique_ptr_t(CDeclaration) * declaration) {
    unique_ptr_t(CFunctionDeclaration) fun_decl = uptr_new();
    CATCH_ENTER;
    TRY(parse_fun_declaration(ctx, storage_class, &fun_decl));
    *declaration = make_CFunDecl(&fun_decl);
    FINALLY;
    free_CFunctionDeclaration(&fun_decl);
    CATCH_EXIT;
}

static error_t parse_var_decl(Ctx ctx, const CStorageClass* storage_class, unique_ptr_t(CDeclaration) * declaration) {
    unique_ptr_t(CVariableDeclaration) var_decl = uptr_new();
    CATCH_ENTER;
    TRY(parse_var_declaration(ctx, storage_class, &var_decl));
    *declaration = make_CVarDecl(&var_decl);
    FINALLY;
    free_CVariableDeclaration(&var_decl);
    CATCH_EXIT;
}

static error_t parse_struct_decl(Ctx ctx, unique_ptr_t(CDeclaration) * declaration) {
    unique_ptr_t(CStructDeclaration) struct_decl = uptr_new();
    CATCH_ENTER;
    TRY(parse_struct_declaration(ctx, &struct_decl));
    *declaration = make_CStructDecl(&struct_decl);
    FINALLY;
    free_CStructDeclaration(&struct_decl);
    CATCH_EXIT;
}

static error_t parse_storage_class(Ctx ctx, CStorageClass* storage_class) {
    CATCH_ENTER;
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_pub: {
            *storage_class = init_CStorageClass();
            break;
        }
        case TOK_key_data: {
            *storage_class = init_CStatic();
            break;
        }
        case TOK_key_extrn: {
            *storage_class = init_CExtern();
            break;
        }
        case TOK_key_fn:
        case TOK_identifier:
        case TOK_key_type:
            EARLY_EXIT;
        default:
            THROW_AT_TOKEN(
                ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_expect_storage_class, str_fmt_tok(ctx->peek_tok)));
    }
    TRY(pop_next(ctx));
    TRY(peek_next(ctx));
    if (ctx->peek_tok->tok_kind == TOK_key_type) {
        THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_type_decl_not_auto, str_fmt_tok(ctx->peek_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_declaration(Ctx ctx, CStorageClass* storage_class, unique_ptr_t(CDeclaration) * declaration) {
    CATCH_ENTER;
    TRY(parse_storage_class(ctx, storage_class));
    switch (ctx->peek_tok->tok_kind) {
        case TOK_key_fn:
            TRY(parse_fun_decl(ctx, storage_class, declaration));
            break;
        case TOK_identifier:
            TRY(parse_var_decl(ctx, storage_class, declaration));
            break;
        case TOK_key_type:
            TRY(parse_struct_decl(ctx, declaration));
            break;
        default:
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG(MSG_expect_declaration, str_fmt_tok(ctx->peek_tok)));
    }
    FINALLY;
    CATCH_EXIT;
}

static error_t parse_program(Ctx ctx, unique_ptr_t(CProgram) * c_ast) {
    unique_ptr_t(CDeclaration) declaration = uptr_new();
    vector_t(unique_ptr_t(CDeclaration)) declarations = vec_new();
    CATCH_ENTER;
    while (ctx->pop_idx < vec_size(*ctx->p_toks)) {
        CStorageClass storage_class = init_CStatic();
        TRY(peek_next(ctx));
        if (ctx->peek_tok->tok_kind == TOK_key_data) {
            THROW_AT_TOKEN(ctx->peek_tok->info_at, GET_PARSER_MSG_0(MSG_data_at_toplvl));
        }
        TRY(parse_declaration(ctx, &storage_class, &declaration));
        vec_move_back(declarations, declaration);
        TRY(pop_next(ctx));
        TRY(expect_next(ctx, ctx->next_tok, TOK_line_break));
    }
    *c_ast = make_CProgram(&declarations);
    FINALLY;
    free_CDeclaration(&declaration);
    for (size_t i = 0; i < vec_size(declarations); ++i) {
        free_CDeclaration(&declarations[i]);
    }
    vec_delete(declarations);
    CATCH_EXIT;
}

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

error_t parse_tokens(
    vector_t(Token) * tokens, ErrorsContext* errors, IdentifierContext* identifiers, unique_ptr_t(CProgram) * c_ast) {
    ParserContext ctx;
    {
        ctx.errors = errors;
        ctx.identifiers = identifiers;
        ctx.pop_idx = 0;
        ctx.p_toks = tokens;
    }
    CATCH_ENTER;
    TRY(parse_program(&ctx, c_ast));
    THROW_ABORT_IF(ctx.pop_idx != vec_size(*tokens));

    THROW_ABORT_IF(!*c_ast);
    FINALLY;
    vec_delete(*tokens);
    CATCH_EXIT;
}
