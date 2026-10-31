m4_include(`errors.plx.m4')m4_dnl
m4_include(`idents.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl
m4_include(`parser.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

type struc ParserContext(errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, pop_idx: u64, next_tok: *struc Token, peek_tok: *struc Token, peek_tok_i: *struc Token, p_toks: *vector_t(struc Token))

m4_define(`Ctx', `TODO')m4_dnl

fn expect_next(ctx: *struc ParserContext, next_tok: *struc Token, expect_tok: i32) error_t {
    CATCH_ENTER
    if next_tok[].tok_kind ~= expect_tok {
        THROW_AT_TOKEN(next_tok[].info_at,
            GET_PARSER_MSG(2, MSG_unexpected_next_tok, str_fmt_tok(next_tok), get_tok_kind_fmt(expect_tok)))
    }
    FINALLY
    CATCH_EXIT
}

fn pop_next(ctx: *struc ParserContext) error_t {
    CATCH_ENTER
    if ctx[].pop_idx >= vec_size(ctx[].p_toks[]) {
        THROW_AT_TOKEN(vec_back(ctx[].p_toks[]).info_at, GET_PARSER_MSG(0, MSG_reached_eof))
    }
    ctx[].next_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    ctx[].pop_idx++
    FINALLY
    CATCH_EXIT
}

fn peek_next(ctx: *struc ParserContext) error_t {
    CATCH_ENTER
    if ctx[].pop_idx >= vec_size(ctx[].p_toks[]) {
        THROW_AT_TOKEN(vec_back(ctx[].p_toks[]).info_at, GET_PARSER_MSG(0, MSG_reached_eof))
    }
    ctx[].peek_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    FINALLY
    CATCH_EXIT
}

fn peek_next_i(ctx: *struc ParserContext, i: u64) error_t {
    CATCH_ENTER
    if i == 0 {
        TRY(peek_next(ctx))
        ctx[].peek_tok_i = ctx[].peek_tok
        EARLY_EXIT
    }
    if ctx[].pop_idx + i >= vec_size(ctx[].p_toks[]) {
        THROW_AT_TOKEN(vec_back(ctx[].p_toks[]).info_at, GET_PARSER_MSG(0, MSG_reached_eof))
    }
    ctx[].peek_tok_i = @(ctx[].p_toks[])[ctx[].pop_idx + i]
    FINALLY
    CATCH_EXIT
}

fn parse_identifier(ctx: *struc ParserContext, identifier: *u64) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    identifier[] = ctx[].next_tok[].tok
    FINALLY
    CATCH_EXIT
}

fn parse_string_literal(ctx: *struc ParserContext, literal: **struc CStringLiteral) error_t {
    value: vector_t(i8) = vec_new()
    CATCH_ENTER
    string_to_literal(map_get(ctx[].identifiers[].hash_table, ctx[].next_tok[].tok), @value)
    TRY(peek_next(ctx))
    loop while ctx[].peek_tok[].tok_kind == TOK_string_literal {
        TRY(pop_next(ctx))
        string_to_literal(map_get(ctx[].identifiers[].hash_table, ctx[].next_tok[].tok), @value)
        TRY(peek_next(ctx))
    }
    literal[] = make_CStringLiteral(@value)
    FINALLY
    vec_delete(value)
    CATCH_EXIT
}

fn parse_int_const(intmax: i64) *struc CConst {
    value: i32 = cast<i32>(intmax)
    return make_CConstInt(value)
}

fn parse_char_const(ctx: *struc ParserContext) *struc CConst {
    value: i32 = string_to_char_ascii(map_get(ctx[].identifiers[].hash_table, ctx[].next_tok[].tok))
    return make_CConstInt(value)
}

fn parse_long_const(intmax: i64) *struc CConst {
    value: i64 = cast<i64>(intmax)
    return make_CConstLong(value)
}

fn parse_dbl_const(ctx: *struc ParserContext, constant: **struc CConst) error_t {
    CATCH_ENTER
    value: f64;
    TRY(string_to_dbl(ctx[].errors, map_get(ctx[].identifiers[].hash_table, ctx[].next_tok[].tok), ctx[].next_tok[].info_at, @value))
    constant[] = make_CConstDouble(value)
    FINALLY
    CATCH_EXIT
}

fn parse_uint_const(uintmax: u64) *struc CConst {
    value: u32 = cast<u32>(uintmax)
    return make_CConstUInt(value)
}

fn parse_ulong_const(uintmax: u64) *struc CConst {
    value: u64 = cast<u64>(uintmax)
    return make_CConstULong(value)
}

fn parse_const(ctx: *struc ParserContext, constant: **struc CConst) error_t {
    CATCH_ENTER
    value: i64;
    strto_value: string;
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_true {
            constant[] = make_CConstInt(1)
            EARLY_EXIT
        }
        -> TOK_key_false {
            constant[] = make_CConstInt(0)
            EARLY_EXIT
        }
        -> TOK_char_const {
            constant[] = parse_char_const(ctx)
            EARLY_EXIT
        }
        -> TOK_dbl_const {
            TRY(parse_dbl_const(ctx, constant))
        }
        EARLY_EXIT
        otherwise {
            break
        }
    }
    strto_value = map_get(ctx[].identifiers[].hash_table, ctx[].next_tok[].tok)
    TRY(string_to_long(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value))
    if value > 9223372036854775807l {
        THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_overflow_long_const, strto_value))
    }
    elif ctx[].next_tok[].tok_kind == TOK_int_const and value <= 2147483647l {
        constant[] = parse_int_const(value)
    }
    else {
        constant[] = parse_long_const(value)
    }
    FINALLY
    CATCH_EXIT
}

fn parse_unsigned_const(ctx: *struc ParserContext, constant: **struc CConst) error_t {
    CATCH_ENTER
    value: u64;
    strto_value: string;
    TRY(pop_next(ctx))
    strto_value = map_get(ctx[].identifiers[].hash_table, ctx[].next_tok[].tok)
    TRY(string_to_ulong(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value))
    if value > 18446744073709551615ul {
        THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_overflow_ulong_const, strto_value))
    }
    elif ctx[].next_tok[].tok_kind == TOK_uint_const and value <= 4294967295ul {
        constant[] = parse_uint_const(value)
    }
    else {
        constant[] = parse_ulong_const(value)
    }
    FINALLY
    CATCH_EXIT
}

fn parse_unop(ctx: *struc ParserContext, unop: *struc CUnaryOp) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_unop_complement {
            unop[] = init_CComplement()
            break
        }
        -> TOK_unop_neg {
            unop[] = init_CNegate()
            break
        }
        -> TOK_unop_not {
            unop[] = init_CNot()
            break
        }
        otherwise {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_unop, str_fmt_tok(ctx[].next_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_binop(ctx: *struc ParserContext, binop: *struc CBinaryOp) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_binop_add {
            -> TOK_assign_add {
                -> TOK_unop_incr {
                    binop[] = init_CAdd()
                    break
                }
            }
        }
        -> TOK_unop_neg {
            -> TOK_assign_subtract {
                -> TOK_unop_decr {
                    binop[] = init_CSubtract()
                    break
                }
            }
        }
        -> TOK_binop_multiply {
            -> TOK_assign_multiply {
                binop[] = init_CMultiply()
                break
            }
        }
        -> TOK_binop_divide {
            -> TOK_assign_divide {
                binop[] = init_CDivide()
                break
            }
        }
        -> TOK_binop_remainder {
            -> TOK_assign_remainder {
                binop[] = init_CRemainder()
                break
            }
        }
        -> TOK_binop_bitand {
            -> TOK_assign_bitand {
                binop[] = init_CBitAnd()
                break
            }
        }
        -> TOK_binop_bitor {
            -> TOK_assign_bitor {
                binop[] = init_CBitOr()
                break
            }
        }
        -> TOK_binop_xor {
            -> TOK_assign_xor {
                binop[] = init_CBitXor()
                break
            }
        }
        -> TOK_binop_shiftleft {
            -> TOK_assign_shiftleft {
                binop[] = init_CBitShiftLeft()
                break
            }
        }
        -> TOK_binop_shiftright {
            -> TOK_assign_shiftright {
                binop[] = init_CBitShiftRight()
                break
            }
        }
        -> TOK_binop_and {
            binop[] = init_CAnd()
            break
        }
        -> TOK_binop_or {
            binop[] = init_COr()
            break
        }
        -> TOK_binop_eq {
            binop[] = init_CEqual()
            break
        }
        -> TOK_binop_ne {
            binop[] = init_CNotEqual()
            break
        }
        -> TOK_binop_lt {
            binop[] = init_CLessThan()
            break
        }
        -> TOK_binop_le {
            binop[] = init_CLessOrEqual()
            break
        }
        -> TOK_binop_gt {
            binop[] = init_CGreaterThan()
            break
        }
        -> TOK_binop_ge {
            binop[] = init_CGreaterOrEqual()
            break
        }
        otherwise {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_binop, str_fmt_tok(ctx[].next_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) error_t;

fn parse_datatype_specifier(ctx: *struc ParserContext, tag_name: *u64, is_union: *i32) error_t {
    CATCH_ENTER
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_struc {
            is_union[] = false
            break
        }
        -> TOK_key_union {
            is_union[] = true
            break
        }
        otherwise {
            THROW_AT_TOKEN(
                ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_data_specifier, str_fmt_tok(ctx[].next_tok)))
        }
    }
    TRY(peek_next(ctx))
    TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
    TRY(parse_identifier(ctx, tag_name))
    FINALLY
    CATCH_EXIT
}

fn parse_type_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_char {
            type_specifier[] = make_Char()
            break
        }
        -> TOK_key_string {
            type_specifier[] = make_Char()
            type_specifier[] = make_Pointer(type_specifier)
            break
        }
        -> TOK_key_i32 {
            type_specifier[] = make_Int()
            break
        }
        -> TOK_key_i64 {
            type_specifier[] = make_Long()
            break
        }
        -> TOK_key_i8 {
            type_specifier[] = make_SChar()
            break
        }
        -> TOK_key_f64 {
            type_specifier[] = make_Double()
            break
        }
        -> TOK_key_u32 {
            type_specifier[] = make_UInt()
            break
        }
        -> TOK_key_u64 {
            type_specifier[] = make_ULong()
            break
        }
        -> TOK_key_u8 {
            type_specifier[] = make_UChar()
            break
        }
        -> TOK_key_any {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(0, MSG_incomplete_any))
        }
        -> TOK_key_struc {
            -> TOK_key_union {
                is_union: i32;
                tag_name: u64;
                TRY(parse_datatype_specifier(ctx, @tag_name, @is_union))
                type_specifier[] = make_Structure(tag_name, is_union)
                break
            }
        }
        otherwise {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_specifier, str_fmt_tok(ctx[].next_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_arr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) error_t {
    constant: shared_ptr_t(CConst) = sptr_new()
    CATCH_ENTER
    size: i64 = 0
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            TRY(parse_const(ctx, @constant))
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                TRY(parse_unsigned_const(ctx, @constant))
            }
        }
        break
        otherwise {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_arr_size_not_int_const, str_fmt_tok(ctx[].peek_tok)))
        }
    }
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_bracket))
    match constant[].tag {
        -> AST_CConstInt_t {
            size = cast<i64>(constant[].get._CConstInt.value)
            break
        }
        -> AST_CConstLong_t {
            size = constant[].get._CConstLong.value
            break
        }
        -> AST_CConstUInt_t {
            size = cast<i64>(constant[].get._CConstUInt.value)
            break
        }
        -> AST_CConstULong_t {
            size = cast<i64>(constant[].get._CConstULong.value)
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_key_any {
        TRY(pop_next(ctx))
        type_specifier[] = make_Void()
    }
    else {
        TRY(parse_type_name(ctx, type_specifier))
    }
    type_specifier[] = make_Array(size, type_specifier)
    FINALLY
    free_CConst(@constant)
    CATCH_EXIT
}

fn parse_ptr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_key_any {
        TRY(pop_next(ctx))
        type_specifier[] = make_Void()
    }
    else {
        TRY(parse_type_name(ctx, type_specifier))
    }
    type_specifier[] = make_Pointer(type_specifier)
    FINALLY
    CATCH_EXIT
}

fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            TRY(parse_arr_specifier(ctx, type_name))
        }
        break
        -> TOK_binop_multiply {
            TRY(parse_ptr_specifier(ctx, type_name))
        }
        break
        otherwise {
            TRY(parse_type_specifier(ctx, type_name))
        }
        break
    }
    FINALLY
    CATCH_EXIT
}

fn parse_maybe_type(ctx: *struc ParserContext, maybe_type: **struc Type) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_char {
            -> TOK_key_string {
                -> TOK_key_i32 {
                    -> TOK_key_i64 {
                        -> TOK_key_i8 {
                            -> TOK_key_f64 {
                                -> TOK_key_u32 {
                                    -> TOK_key_u64 {
                                        -> TOK_key_u8 {
                                            -> TOK_key_any {
                                                -> TOK_key_struc {
                                                    -> TOK_key_union {
                                                        -> TOK_open_bracket {
                                                            -> TOK_binop_multiply {
                                                                TRY(parse_type_name(ctx, maybe_type))
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_key_none {
            TRY(pop_next(ctx))
            maybe_type[] = make_Void()
            break
        }
        otherwise {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_maybe_type, str_fmt_tok(ctx[].peek_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t;
fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) error_t;

fn parse_arg_list(ctx: *struc ParserContext, args: *vector_t(unique_ptr_t(CExp))) error_t {
    arg: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    TRY(parse_exp(ctx, 0, @arg))
    vec_move_back(args[], arg)
    TRY(peek_next(ctx))
    loop while ctx[].peek_tok[].tok_kind == TOK_comma_separator {
        TRY(pop_next(ctx))
        TRY(parse_exp(ctx, 0, @arg))
        vec_move_back(args[], arg)
        TRY(peek_next(ctx))
    }
    FINALLY
    free_CExp(@arg)
    CATCH_EXIT
}

fn parse_const_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    constant: shared_ptr_t(CConst) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(parse_const(ctx, @constant))
    exp[] = make_CConstant(@constant, info_at)
    FINALLY
    free_CConst(@constant)
    CATCH_EXIT
}

fn parse_unsigned_const_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    constant: shared_ptr_t(CConst) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(parse_unsigned_const(ctx, @constant))
    exp[] = make_CConstant(@constant, info_at)
    FINALLY
    free_CConst(@constant)
    CATCH_EXIT
}

fn parse_string_literal_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    literal: shared_ptr_t(CStringLiteral) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(parse_string_literal(ctx, @literal))
    exp[] = make_CString(@literal, info_at)
    FINALLY
    free_CStringLiteral(@literal)
    CATCH_EXIT
}

fn parse_var_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    TRY(parse_identifier(ctx, @name))
    exp[] = make_CVar(name, info_at)
    FINALLY
    CATCH_EXIT
}

fn parse_call_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    args: vector_t(unique_ptr_t(CExp)) = vec_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    TRY(parse_identifier(ctx, @name))
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind ~= TOK_close_paren {
        TRY(parse_arg_list(ctx, @args))
    }
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    exp[] = make_CFunctionCall(name, @args, info_at)
    FINALLY
    loop i: u64 = 0 while i < vec_size(args) .. ++i {
        free_CExp(@args[i])
    }
    vec_delete(args)
    CATCH_EXIT
}

fn parse_cast_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    cast_exp: unique_ptr_t(CExp) = uptr_new()
    target_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_binop_lt))
    TRY(parse_maybe_type(ctx, @target_type))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_binop_gt))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_open_paren))
    TRY(parse_exp(ctx, 0, @cast_exp))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    exp[] = make_CCast(@cast_exp, @target_type, info_at)
    FINALLY
    free_CExp(@cast_exp)
    free_Type(@target_type)
    CATCH_EXIT
}

fn parse_inner_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(parse_exp(ctx, 0, exp))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    FINALLY
    CATCH_EXIT
}

fn parse_deref_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_typeop_member {
        info_at = ctx[].peek_tok[].info_at
        TRY(pop_next(ctx))
        TRY(peek_next(ctx))
        TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
        member: u64;
        TRY(parse_identifier(ctx, @member))
        exp[] = make_CArrow(member, exp, info_at)
    }
    else {
        exp[] = make_CDereference(exp, info_at)
    }
    FINALLY
    CATCH_EXIT
}

fn parse_subscript_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    subscript_exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(parse_exp(ctx, 0, @subscript_exp))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_bracket))
    exp[] = make_CSubscript(exp, @subscript_exp, info_at)
    FINALLY
    free_CExp(@subscript_exp)
    CATCH_EXIT
}

fn parse_arr_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_close_bracket {
        TRY(parse_deref_factor(ctx, exp))
    }
    else {
        TRY(parse_subscript_factor(ctx, exp))
    }
    FINALLY
    CATCH_EXIT
}

fn parse_dot_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
    member: u64;
    TRY(parse_identifier(ctx, @member))
    exp[] = make_CDot(member, exp, info_at)
    FINALLY
    CATCH_EXIT
}

fn parse_postfix_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    exp_right: unique_ptr_t(CExp) = uptr_new()
    exp_right_1: unique_ptr_t(CExp) = uptr_new()
    constant: shared_ptr_t(CConst) = sptr_new()
    CATCH_ENTER
    exp_null: unique_ptr_t(CExp) = uptr_new()
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = init_CPostfix()
    binop: struc CBinaryOp = init_CBinaryOp()
    TRY(parse_binop(ctx, @binop))
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, exp, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    FINALLY
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    CATCH_EXIT
}

fn parse_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    cast_exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = init_CUnaryOp()
    TRY(parse_unop(ctx, @unop))
    TRY(parse_unary_exp_factor(ctx, @cast_exp))
    exp[] = make_CUnary(@unop, @cast_exp, info_at)
    FINALLY
    free_CExp(@cast_exp)
    CATCH_EXIT
}

fn parse_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    exp_left: unique_ptr_t(CExp) = uptr_new()
    exp_right: unique_ptr_t(CExp) = uptr_new()
    exp_left_1: unique_ptr_t(CExp) = uptr_new()
    exp_right_1: unique_ptr_t(CExp) = uptr_new()
    constant: shared_ptr_t(CConst) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = init_CPrefix()
    binop: struc CBinaryOp = init_CBinaryOp()
    TRY(parse_binop(ctx, @binop))
    TRY(parse_unary_exp_factor(ctx, @exp_left))
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, @exp_left, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_left_1, @exp_right_1, info_at)
    FINALLY
    free_CExp(@exp_left)
    free_CExp(@exp_right)
    free_CExp(@exp_left_1)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    CATCH_EXIT
}

fn parse_addrof_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    cast_exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(parse_unary_exp_factor(ctx, @cast_exp))
    exp[] = make_CAddrOf(@cast_exp, info_at)
    FINALLY
    free_CExp(@cast_exp)
    CATCH_EXIT
}

fn parse_sizeoft_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    target_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].next_tok[].info_at
    TRY(parse_type_name(ctx, @target_type))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_binop_gt))
    exp[] = make_CSizeOfT(@target_type, info_at)
    FINALLY
    free_Type(@target_type)
    CATCH_EXIT
}

fn parse_sizeof_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    unary_exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].next_tok[].info_at
    TRY(parse_exp(ctx, 0, @unary_exp))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    exp[] = make_CSizeOf(@unary_exp, info_at)
    FINALLY
    free_CExp(@unary_exp)
    CATCH_EXIT
}

fn parse_sizeof_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_binop_lt {
            TRY(parse_sizeoft_factor(ctx, exp))
        }
        break
        -> TOK_open_paren {
            TRY(parse_sizeof_factor(ctx, exp))
        }
        break
        otherwise {
            THROW_AT_TOKEN(
                ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_open_sizeof, str_fmt_tok(ctx[].next_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_primary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            -> TOK_dbl_const {
                                TRY(parse_const_factor(ctx, exp))
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                TRY(parse_unsigned_const_factor(ctx, exp))
            }
        }
        break
        -> TOK_string_literal {
            TRY(parse_string_literal_factor(ctx, exp))
        }
        break
        -> TOK_key_cast {
            TRY(parse_cast_factor(ctx, exp))
        }
        break
        -> TOK_identifier {
            TRY(peek_next_i(ctx, 1))
            if ctx[].peek_tok_i[].tok_kind == TOK_open_paren {
                TRY(parse_call_factor(ctx, exp))
            }
            else {
                TRY(parse_var_factor(ctx, exp))
            }
            break
        }
        -> TOK_open_paren {
            TRY(parse_inner_exp_factor(ctx, exp))
        }
        break
        otherwise {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_expression, str_fmt_tok(ctx[].peek_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_postfix_op_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            TRY(parse_arr_unary_factor(ctx, exp))
        }
        break
        -> TOK_typeop_member {
            TRY(parse_dot_factor(ctx, exp))
        }
        break
        -> TOK_unop_incr {
            -> TOK_unop_decr {
                TRY(parse_postfix_incr_factor(ctx, exp))
            }
        }
        break
        otherwise {
            EARLY_EXIT
        }
    }
    TRY(parse_postfix_op_exp_factor(ctx, exp))
    FINALLY
    CATCH_EXIT
}

fn parse_postfix_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(parse_primary_exp_factor(ctx, exp))
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            -> TOK_typeop_member {
                -> TOK_unop_incr {
                    -> TOK_unop_decr {
                        TRY(parse_postfix_op_exp_factor(ctx, exp))
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_unop_complement {
            -> TOK_unop_neg {
                -> TOK_unop_not {
                    TRY(parse_unary_factor(ctx, exp))
                }
            }
        }
        break
        -> TOK_unop_incr {
            -> TOK_unop_decr {
                TRY(parse_incr_factor(ctx, exp))
            }
        }
        break
        -> TOK_unop_addrof {
            TRY(parse_addrof_factor(ctx, exp))
        }
        break
        -> TOK_key_sizeof {
            TRY(parse_sizeof_unary_factor(ctx, exp))
        }
        break
        otherwise {
            TRY(parse_postfix_exp_factor(ctx, exp))
        }
        break
    }
    FINALLY
    CATCH_EXIT
}

fn parse_assign_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) error_t {
    exp_right: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = init_CUnaryOp()
    TRY(pop_next(ctx))
    TRY(parse_exp(ctx, precedence, @exp_right))
    exp_left[] = make_CAssignment(@unop, exp_left, @exp_right, info_at)
    FINALLY
    free_CExp(@exp_right)
    CATCH_EXIT
}

fn parse_assign_compound_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) error_t {
    exp_right: unique_ptr_t(CExp) = uptr_new()
    exp_right_1: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    exp_null: unique_ptr_t(CExp) = uptr_new()
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = init_CUnaryOp()
    binop: struc CBinaryOp = init_CBinaryOp()
    TRY(parse_binop(ctx, @binop))
    TRY(parse_exp(ctx, precedence, @exp_right))
    exp_right_1 = make_CBinary(@binop, exp_left, @exp_right, info_at)
    exp_left[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    FINALLY
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    CATCH_EXIT
}

fn parse_binary_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) error_t {
    exp_right: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    binop: struc CBinaryOp = init_CBinaryOp()
    TRY(parse_binop(ctx, @binop))
    TRY(parse_exp(ctx, precedence + 1, @exp_right))
    exp_left[] = make_CBinary(@binop, exp_left, @exp_right, info_at)
    FINALLY
    free_CExp(@exp_right)
    CATCH_EXIT
}

fn parse_ternary_exp(ctx: *struc ParserContext, exp: **struc CExp) error_t {
    exp_left: unique_ptr_t(CExp) = uptr_new()
    exp_middle: unique_ptr_t(CExp) = uptr_new()
    exp_right: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(parse_exp(ctx, 0, @exp_left))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_key_then))
    TRY(parse_exp(ctx, 0, @exp_middle))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_key_else))
    TRY(parse_exp(ctx, 0, @exp_right))
    exp[] = make_CConditional(@exp_left, @exp_middle, @exp_right, info_at)
    FINALLY
    free_CExp(@exp_left)
    free_CExp(@exp_middle)
    free_CExp(@exp_right)
    CATCH_EXIT
}

fn get_tok_precedence(tok_kind: i32) i32 {
    match tok_kind {
        -> TOK_binop_multiply {
            -> TOK_binop_divide {
                -> TOK_binop_remainder {
                    return 50
                }
            }
        }
        -> TOK_unop_neg {
            -> TOK_binop_add {
                return 45
            }
        }
        -> TOK_binop_shiftleft {
            -> TOK_binop_shiftright {
                return 40
            }
        }
        -> TOK_binop_lt {
            -> TOK_binop_le {
                -> TOK_binop_gt {
                    -> TOK_binop_ge {
                        return 35
                    }
                }
            }
        }
        -> TOK_binop_eq {
            -> TOK_binop_ne {
                return 30
            }
        }
        -> TOK_binop_bitand {
            return 25
        }
        -> TOK_binop_xor {
            return 20
        }
        -> TOK_binop_bitor {
            return 15
        }
        -> TOK_binop_and {
            return 10
        }
        -> TOK_binop_or {
            return 5
        }
        -> TOK_assign {
            -> TOK_assign_add {
                -> TOK_assign_subtract {
                    -> TOK_assign_multiply {
                        -> TOK_assign_divide {
                            -> TOK_assign_remainder {
                                -> TOK_assign_bitand {
                                    -> TOK_assign_bitor {
                                        -> TOK_assign_xor {
                                            -> TOK_assign_shiftleft {
                                                -> TOK_assign_shiftright {
                                                    return 1
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return -1
        }
    }
}

fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_ternary_if {
        TRY(parse_ternary_exp(ctx, exp))
    }
    else {
        TRY(parse_unary_exp_factor(ctx, exp))
    }
    loop while true {
        TRY(peek_next(ctx))
        precedence: i32 = get_tok_precedence(ctx[].peek_tok[].tok_kind)
        if precedence < min_precedence {
            break
        }
        match ctx[].peek_tok[].tok_kind {
            -> TOK_binop_add {
                -> TOK_unop_neg {
                    -> TOK_binop_multiply {
                        -> TOK_binop_divide {
                            -> TOK_binop_remainder {
                                -> TOK_binop_bitand {
                                    -> TOK_binop_bitor {
                                        -> TOK_binop_xor {
                                            -> TOK_binop_shiftleft {
                                                -> TOK_binop_shiftright {
                                                    -> TOK_binop_lt {
                                                        -> TOK_binop_le {
                                                            -> TOK_binop_gt {
                                                                -> TOK_binop_ge {
                                                                    -> TOK_binop_eq {
                                                                        -> TOK_binop_ne {
                                                                            -> TOK_binop_and {
                                                                                -> TOK_binop_or {
                                                                                    TRY(parse_binary_exp(ctx, precedence, exp))
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            break
            -> TOK_assign {
                TRY(parse_assign_exp(ctx, precedence, exp))
            }
            break
            -> TOK_assign_add {
                -> TOK_assign_subtract {
                    -> TOK_assign_multiply {
                        -> TOK_assign_divide {
                            -> TOK_assign_remainder {
                                -> TOK_assign_bitand {
                                    -> TOK_assign_bitor {
                                        -> TOK_assign_xor {
                                            -> TOK_assign_shiftleft {
                                                -> TOK_assign_shiftright {
                                                    TRY(parse_assign_compound_exp(ctx, precedence, exp))
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            break
            otherwise {
                THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_binop, str_fmt_tok(ctx[].peek_tok)))
            }
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) error_t;
fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) error_t;

fn parse_ret_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_key_none {
        TRY(pop_next(ctx))
    }
    else {
        TRY(parse_exp(ctx, 0, @exp))
    }
    statement[] = make_CReturn(@exp, info_at)
    FINALLY
    free_CExp(@exp)
    CATCH_EXIT
}

fn parse_exp_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    TRY(parse_exp(ctx, 0, @exp))
    statement[] = make_CExpression(@exp)
    FINALLY
    free_CExp(@exp)
    CATCH_EXIT
}

fn parse_compound_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    block: unique_ptr_t(CBlock) = uptr_new()
    CATCH_ENTER
    TRY(parse_block(ctx, @block))
    if block {
        statement[] = make_CCompound(@block)
    }
    else {
        statement[] = make_CNull()
    }
    FINALLY
    free_CBlock(@block)
    CATCH_EXIT
}

fn parse_if_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    condition: unique_ptr_t(CExp) = uptr_new()
    then_fi: unique_ptr_t(CStatement) = uptr_new()
    else_fi: unique_ptr_t(CStatement) = uptr_new()
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(parse_exp(ctx, 0, @condition))
    TRY(parse_compound_statement(ctx, @then_fi))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_line_break {
        TRY(peek_next_i(ctx, 1))
        match ctx[].peek_tok_i[].tok_kind {
            -> TOK_key_elif {
                TRY(pop_next(ctx))
            }
            TRY(parse_if_statement(ctx, @else_fi))
            break
            -> TOK_key_else {
                TRY(pop_next(ctx))
            }
            TRY(pop_next(ctx))
            TRY(parse_compound_statement(ctx, @else_fi))
            break
            otherwise {
                break
            }
        }
    }
    statement[] = make_CIf(@condition, @then_fi, @else_fi)
    FINALLY
    free_CExp(@condition)
    free_CStatement(@then_fi)
    free_CStatement(@else_fi)
    CATCH_EXIT
}

fn parse_jump_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
    target: u64;
    TRY(parse_identifier(ctx, @target))
    statement[] = make_CGoto(target, info_at)
    FINALLY
    CATCH_EXIT
}

fn parse_label_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    jump_to: unique_ptr_t(CStatement) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
    target: u64;
    TRY(parse_identifier(ctx, @target))
    jump_to = make_CNull()
    statement[] = make_CLabel(target, @jump_to, info_at)
    FINALLY
    free_CStatement(@jump_to)
    CATCH_EXIT
}

fn parse_loop_init_decl(ctx: *struc ParserContext, for_init: **struc CForInit) error_t {
    var_decl: unique_ptr_t(CVariableDeclaration) = uptr_new()
    CATCH_ENTER
    storage_class: struc CStorageClass = init_CStorageClass()
    TRY(parse_var_declaration(ctx, @storage_class, @var_decl))
    for_init[] = make_CInitDecl(@var_decl)
    FINALLY
    free_CVariableDeclaration(@var_decl)
    CATCH_EXIT
}

fn parse_loop_init_exp(ctx: *struc ParserContext, for_init: **struc CForInit) error_t {
    init: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    TRY(parse_exp(ctx, 0, @init))
    for_init[] = make_CInitExp(@init)
    FINALLY
    free_CExp(@init)
    CATCH_EXIT
}

fn parse_loop_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    for_init: unique_ptr_t(CForInit) = uptr_new()
    condition: unique_ptr_t(CExp) = uptr_new()
    post: unique_ptr_t(CExp) = uptr_new()
    body: unique_ptr_t(CStatement) = uptr_new()
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_brace {
            jump Lbreak
        }
        -> TOK_semicolon {
            THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(0, MSG_infinite_loop))
        }
        -> TOK_loop_post {
            TRY(pop_next(ctx))
            TRY(peek_next(ctx))
            if ctx[].peek_tok[].tok_kind == TOK_key_while {
                TRY(pop_next(ctx))
                TRY(parse_exp(ctx, 0, @condition))
                TRY(parse_compound_statement(ctx, @body))
                statement[] = make_CDoWhile(@condition, @body)
                EARLY_EXIT
            }
            else {
                TRY(parse_exp(ctx, 0, @post))
                jump Lbreak
            }
        }
        -> TOK_key_while {
            TRY(pop_next(ctx))
            TRY(parse_exp(ctx, 0, @condition))
            TRY(peek_next(ctx))
            if ctx[].peek_tok[].tok_kind == TOK_loop_post {
                TRY(pop_next(ctx))
                TRY(parse_exp(ctx, 0, @post))
                jump Lbreak
            }
            else {
                TRY(parse_compound_statement(ctx, @body))
                statement[] = make_CWhile(@condition, @body)
                EARLY_EXIT
            }
        }
        -> TOK_key_pub {
            -> TOK_key_data {
                -> TOK_key_extrn {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_loop_decl_not_auto, str_fmt_tok(ctx[].peek_tok)))
                }
            }
        }
        -> TOK_identifier {
            TRY(peek_next_i(ctx, 1))
            if ctx[].peek_tok_i[].tok_kind == TOK_assign_type {
                TRY(parse_loop_init_decl(ctx, @for_init))
            }
            else {
                TRY(parse_loop_init_exp(ctx, @for_init))
            }
            break
        }
        otherwise {
            TRY(parse_loop_init_exp(ctx, @for_init))
        }
        break
    }
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_key_while {
        TRY(pop_next(ctx))
        TRY(parse_exp(ctx, 0, @condition))
        TRY(peek_next(ctx))
    }
    if ctx[].peek_tok[].tok_kind == TOK_loop_post {
        TRY(pop_next(ctx))
        TRY(parse_exp(ctx, 0, @post))
    }
    label Lbreak
    if not for_init {
        exp_null: unique_ptr_t(CExp) = uptr_new()
        for_init = make_CInitExp(@exp_null)
    }
    if not condition {
        TRY(peek_next(ctx))
        if ctx[].peek_tok[].tok_kind == TOK_semicolon {
            THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(0, MSG_infinite_loop))
        }
    }
    TRY(parse_compound_statement(ctx, @body))
    statement[] = make_CFor(@for_init, @condition, @post, @body)
    FINALLY
    free_CForInit(@for_init)
    free_CExp(@condition)
    free_CExp(@post)
    free_CStatement(@body)
    CATCH_EXIT
}

fn parse_match_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    lookup: unique_ptr_t(CExp) = uptr_new()
    body: unique_ptr_t(CStatement) = uptr_new()
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(parse_exp(ctx, 0, @lookup))
    TRY(parse_compound_statement(ctx, @body))
    statement[] = make_CSwitch(@lookup, @body)
    FINALLY
    free_CExp(@lookup)
    free_CStatement(@body)
    CATCH_EXIT
}

fn parse_with_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    value: unique_ptr_t(CExp) = uptr_new()
    jump_to: unique_ptr_t(CStatement) = uptr_new()
    constant: shared_ptr_t(CConst) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            TRY(parse_const(ctx, @constant))
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                TRY(parse_unsigned_const(ctx, @constant))
            }
        }
        break
        otherwise {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_case_value_not_int_const, str_fmt_tok(ctx[].peek_tok)))
        }
    }
    value = make_CConstant(@constant, info_at)
    TRY(parse_compound_statement(ctx, @jump_to))
    statement[] = make_CCase(@value, @jump_to)
    FINALLY
    free_CExp(@value)
    free_CStatement(@jump_to)
    free_CConst(@constant)
    CATCH_EXIT
}

fn parse_otherwise_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    jump_to: unique_ptr_t(CStatement) = uptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(parse_compound_statement(ctx, @jump_to))
    statement[] = make_CDefault(@jump_to, info_at)
    FINALLY
    free_CStatement(@jump_to)
    CATCH_EXIT
}

fn parse_break_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    statement[] = make_CBreak(info_at)
    FINALLY
    CATCH_EXIT
}

fn parse_continue_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    statement[] = make_CContinue(info_at)
    FINALLY
    CATCH_EXIT
}

fn parse_null_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    statement[] = make_CNull()
    FINALLY
    CATCH_EXIT
}

fn parse_statement(ctx: *struc ParserContext, statement: **struc CStatement) error_t {
    CATCH_ENTER
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_return {
            TRY(parse_ret_statement(ctx, statement))
        }
        EARLY_EXIT
        -> TOK_key_if {
            TRY(parse_if_statement(ctx, statement))
        }
        break
        -> TOK_key_jump {
            TRY(parse_jump_statement(ctx, statement))
        }
        break
        -> TOK_key_label {
            TRY(parse_label_statement(ctx, statement))
        }
        break
        -> TOK_open_brace {
            TRY(parse_compound_statement(ctx, statement))
        }
        break
        -> TOK_key_loop {
            TRY(parse_loop_statement(ctx, statement))
        }
        break
        -> TOK_key_match {
            TRY(parse_match_statement(ctx, statement))
        }
        break
        -> TOK_match_with {
            TRY(parse_with_statement(ctx, statement))
        }
        break
        -> TOK_key_otherwise {
            TRY(parse_otherwise_statement(ctx, statement))
        }
        break
        -> TOK_key_break {
            TRY(parse_break_statement(ctx, statement))
        }
        break
        -> TOK_key_continue {
            TRY(parse_continue_statement(ctx, statement))
        }
        break
        -> TOK_semicolon {
            TRY(parse_null_statement(ctx, statement))
        }
        break
        otherwise {
            TRY(parse_exp_statement(ctx, statement))
        }
        break
    }
    FINALLY
    CATCH_EXIT
}

fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) error_t;

fn parse_s_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) error_t {
    statement: unique_ptr_t(CStatement) = uptr_new()
    CATCH_ENTER
    TRY(parse_statement(ctx, @statement))
    block_item[] = make_CS(@statement)
    FINALLY
    free_CStatement(@statement)
    CATCH_EXIT
}

fn parse_d_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) error_t {
    declaration: unique_ptr_t(CDeclaration) = uptr_new()
    CATCH_ENTER
    storage_class: struc CStorageClass = init_CStorageClass()
    TRY(parse_declaration(ctx, @storage_class, @declaration))
    block_item[] = make_CD(@declaration)
    FINALLY
    free_CDeclaration(@declaration)
    CATCH_EXIT
}

fn parse_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) error_t {
    CATCH_ENTER
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(0, MSG_pub_in_block))
        }
        -> TOK_key_data {
            -> TOK_key_extrn {
                -> TOK_key_fn {
                    -> TOK_key_type {
                        TRY(parse_d_block_item(ctx, block_item))
                    }
                }
            }
        }
        EARLY_EXIT
        -> TOK_identifier {
            TRY(peek_next_i(ctx, 1))
            if ctx[].peek_tok_i[].tok_kind == TOK_assign_type {
                TRY(parse_d_block_item(ctx, block_item))
                EARLY_EXIT
            }
            break
        }
        otherwise {
            break
        }
    }
    TRY(parse_s_block_item(ctx, block_item))
    FINALLY
    CATCH_EXIT
}

fn parse_b_block(ctx: *struc ParserContext, block: **struc CBlock) error_t {
    block_item: unique_ptr_t(CBlockItem) = uptr_new()
    block_items: vector_t(unique_ptr_t(CBlockItem)) = vec_new()
    CATCH_ENTER
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_line_break {
        TRY(pop_next(ctx))
        TRY(peek_next(ctx))
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_brace {
        THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(0, MSG_empty_block))
    }
    TRY(parse_block_item(ctx, @block_item))
    vec_move_back(block_items, block_item)
    loop while true {
        TRY(pop_next(ctx))
        if ctx[].next_tok[].tok_kind == TOK_close_brace {
            break
        }
        TRY(expect_next(ctx, ctx[].next_tok, TOK_line_break))
        TRY(peek_next(ctx))
        if ctx[].peek_tok[].tok_kind == TOK_close_brace {
            TRY(pop_next(ctx))
            break
        }
        TRY(parse_block_item(ctx, @block_item))
        vec_move_back(block_items, block_item)
    }
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_brace))
    block[] = make_CB(@block_items)
    FINALLY
    free_CBlockItem(@block_item)
    loop i: u64 = 0 while i < vec_size(block_items) .. ++i {
        free_CBlockItem(@block_items[i])
    }
    vec_delete(block_items)
    CATCH_EXIT
}

fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) error_t {
    CATCH_ENTER
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_open_brace {
            TRY(parse_b_block(ctx, block))
        }
        break
        otherwise {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_block, str_fmt_tok(ctx[].next_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) error_t;

fn parse_single_init(ctx: *struc ParserContext, initializer: **struc CInitializer) error_t {
    exp: unique_ptr_t(CExp) = uptr_new()
    CATCH_ENTER
    TRY(parse_exp(ctx, 0, @exp))
    initializer[] = make_CSingleInit(@exp)
    FINALLY
    free_CExp(@exp)
    CATCH_EXIT
}

fn parse_compound_init(ctx: *struc ParserContext, initializer: **struc CInitializer) error_t {
    initializers: vector_t(unique_ptr_t(CInitializer)) = vec_new()
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_open_paren))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_close_paren {
        THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(0, MSG_empty_compound_init))
    }
    TRY(parse_initializer(ctx, initializer))
    vec_move_back(initializers, initializer[])
    TRY(pop_next(ctx))
    loop while ctx[].next_tok[].tok_kind == TOK_comma_separator {
        TRY(parse_initializer(ctx, initializer))
        vec_move_back(initializers, initializer[])
        TRY(pop_next(ctx))
    }
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    initializer[] = make_CCompoundInit(@initializers)
    FINALLY
    loop i: u64 = 0 while i < vec_size(initializers) .. ++i {
        free_CInitializer(@initializers[i])
    }
    vec_delete(initializers)
    CATCH_EXIT
}

fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) error_t {
    CATCH_ENTER
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_compound_init {
        TRY(parse_compound_init(ctx, initializer))
    }
    else {
        TRY(parse_single_init(ctx, initializer))
    }
    FINALLY
    CATCH_EXIT
}

fn parse_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) error_t {
    CATCH_ENTER
    TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
    TRY(parse_identifier(ctx, name))
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_assign_type))
    TRY(parse_type_name(ctx, derived_type))
    FINALLY
    CATCH_EXIT
}

fn parse_item_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) error_t {
    CATCH_ENTER
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            -> TOK_key_data {
                -> TOK_key_extrn {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_list_decl_not_auto, str_fmt_tok(ctx[].peek_tok)))
                }
            }
        }
        otherwise {
            break
        }
    }
    TRY(parse_decltor(ctx, name, derived_type))
    FINALLY
    CATCH_EXIT
}

fn parse_decltor_list(ctx: *struc ParserContext, params: *vector_t(TIdentifier), param_types: *vector_t(shared_ptr_t(Type))) error_t {
    param_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    param: u64;
    TRY(parse_item_decltor(ctx, @param, @param_type))
    vec_push_back(params[], param)
    vec_move_back(param_types[], param_type)
    TRY(peek_next(ctx))
    loop while ctx[].peek_tok[].tok_kind == TOK_comma_separator {
        TRY(pop_next(ctx))
        TRY(peek_next(ctx))
        TRY(parse_item_decltor(ctx, @param, @param_type))
        vec_push_back(params[], param)
        vec_move_back(param_types[], param_type)
        TRY(peek_next(ctx))
    }
    FINALLY
    free_Type(@param_type)
    CATCH_EXIT
}

fn parse_fun_decltor(ctx: *struc ParserContext, fun_type: **struc Type, params: *vector_t(TIdentifier)) error_t {
    param_types: vector_t(shared_ptr_t(Type)) = vec_new()
    CATCH_ENTER
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_open_paren))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_key_none {
        TRY(pop_next(ctx))
    }
    else {
        TRY(parse_decltor_list(ctx, params, @param_types))
    }
    TRY(pop_next(ctx))
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    TRY(parse_maybe_type(ctx, fun_type))
    fun_type[] = make_FunType(@param_types, fun_type)
    FINALLY
    loop i: u64 = 0 while i < vec_size(param_types) .. ++i {
        free_Type(@param_types[i])
    }
    vec_delete(param_types)
    CATCH_EXIT
}

fn parse_fun_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, fun_decl: **struc CFunctionDeclaration) error_t {
    body: unique_ptr_t(CBlock) = uptr_new()
    fun_type: shared_ptr_t(Type) = sptr_new()
    params: vector_t(TIdentifier) = vec_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    TRY(expect_next(ctx, ctx[].peek_tok, TOK_identifier))
    name: u64;
    TRY(parse_identifier(ctx, @name))
    TRY(parse_fun_decltor(ctx, @fun_type, @params))
    TRY(parse_block(ctx, @body))
    fun_decl[] = make_CFunctionDeclaration(name, @params, @body, @fun_type, storage_class, info_at)
    FINALLY
    free_CBlock(@body)
    free_Type(@fun_type)
    vec_delete(params)
    CATCH_EXIT
}

fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) error_t {
    initializer: unique_ptr_t(CInitializer) = uptr_new()
    var_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    TRY(parse_decltor(ctx, @name, @var_type))
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_assign {
            TRY(parse_initializer(ctx, @initializer))
        }
        break
        otherwise {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_assign, str_fmt_tok(ctx[].next_tok)))
        }
    }
    var_decl[] = make_CVariableDeclaration(name, @initializer, @var_type, storage_class, info_at)
    FINALLY
    free_CInitializer(@initializer)
    free_Type(@var_type)
    CATCH_EXIT
}

fn parse_member_declaration(ctx: *struc ParserContext, member_decl: **struc CMemberDeclaration) error_t {
    member_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    info_at: u64;
    member_name: u64;
    TRY(peek_next(ctx))
    info_at = ctx[].peek_tok[].info_at
    TRY(parse_item_decltor(ctx, @member_name, @member_type))
    member_decl[] = make_CMemberDeclaration(member_name, @member_type, info_at)
    FINALLY
    free_Type(@member_type)
    CATCH_EXIT
}

fn parse_member_list(ctx: *struc ParserContext, members: *vector_t(unique_ptr_t(CMemberDeclaration))) error_t {
    member: unique_ptr_t(CMemberDeclaration) = uptr_new()
    CATCH_ENTER
    TRY(parse_member_declaration(ctx, @member))
    vec_move_back(members[], member)
    TRY(pop_next(ctx))
    loop while ctx[].next_tok[].tok_kind == TOK_comma_separator {
        TRY(parse_member_declaration(ctx, @member))
        vec_move_back(members[], member)
        TRY(pop_next(ctx))
    }
    TRY(expect_next(ctx, ctx[].next_tok, TOK_close_paren))
    FINALLY
    free_CMemberDeclaration(@member)
    CATCH_EXIT
}

fn parse_type_declaration(ctx: *struc ParserContext, struct_decl: **struc CStructDeclaration) error_t {
    members: vector_t(unique_ptr_t(CMemberDeclaration)) = vec_new()
    CATCH_ENTER
    is_union: i32;
    tag_name: u64;
    info_at: u64 = ctx[].peek_tok[].info_at
    TRY(pop_next(ctx))
    TRY(pop_next(ctx))
    TRY(parse_datatype_specifier(ctx, @tag_name, @is_union))
    TRY(pop_next(ctx))
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_open_paren {
            TRY(parse_member_list(ctx, @members))
        }
        break
        otherwise {
            THROW_AT_TOKEN(ctx[].next_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_datatype, str_fmt_tok(ctx[].next_tok)))
        }
    }
    struct_decl[] = make_CStructDeclaration(tag_name, is_union, @members, info_at)
    FINALLY
    loop i: u64 = 0 while i < vec_size(members) .. ++i {
        free_CMemberDeclaration(@members[i])
    }
    vec_delete(members)
    CATCH_EXIT
}

fn parse_fun_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) error_t {
    fun_decl: unique_ptr_t(CFunctionDeclaration) = uptr_new()
    CATCH_ENTER
    TRY(parse_fun_declaration(ctx, storage_class, @fun_decl))
    declaration[] = make_CFunDecl(@fun_decl)
    FINALLY
    free_CFunctionDeclaration(@fun_decl)
    CATCH_EXIT
}

fn parse_var_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) error_t {
    var_decl: unique_ptr_t(CVariableDeclaration) = uptr_new()
    CATCH_ENTER
    TRY(parse_var_declaration(ctx, storage_class, @var_decl))
    declaration[] = make_CVarDecl(@var_decl)
    FINALLY
    free_CVariableDeclaration(@var_decl)
    CATCH_EXIT
}

fn parse_type_decl(ctx: *struc ParserContext, declaration: **struc CDeclaration) error_t {
    struct_decl: unique_ptr_t(CStructDeclaration) = uptr_new()
    CATCH_ENTER
    TRY(parse_type_declaration(ctx, @struct_decl))
    declaration[] = make_CStructDecl(@struct_decl)
    FINALLY
    free_CStructDeclaration(@struct_decl)
    CATCH_EXIT
}

fn parse_storage_class(ctx: *struc ParserContext, storage_class: *struc CStorageClass) error_t {
    CATCH_ENTER
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            storage_class[] = init_CStorageClass()
            break
        }
        -> TOK_key_data {
            storage_class[] = init_CStatic()
            break
        }
        -> TOK_key_extrn {
            storage_class[] = init_CExtern()
            break
        }
        -> TOK_key_fn {
            -> TOK_identifier {
                -> TOK_key_type {
                    EARLY_EXIT
                }
            }
        }
        otherwise {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_storage_class, str_fmt_tok(ctx[].peek_tok)))
        }
    }
    TRY(pop_next(ctx))
    TRY(peek_next(ctx))
    if ctx[].peek_tok[].tok_kind == TOK_key_type {
        THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_type_decl_not_auto, str_fmt_tok(ctx[].peek_tok)))
    }
    FINALLY
    CATCH_EXIT
}

fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) error_t {
    CATCH_ENTER
    TRY(parse_storage_class(ctx, storage_class))
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_fn {
            TRY(parse_fun_decl(ctx, storage_class, declaration))
        }
        break
        -> TOK_identifier {
            TRY(parse_var_decl(ctx, storage_class, declaration))
        }
        break
        -> TOK_key_type {
            TRY(parse_type_decl(ctx, declaration))
        }
        break
        otherwise {
            THROW_AT_TOKEN(
                ctx[].peek_tok[].info_at, GET_PARSER_MSG(1, MSG_expect_declaration, str_fmt_tok(ctx[].peek_tok)))
        }
    }
    FINALLY
    CATCH_EXIT
}

fn parse_program(ctx: *struc ParserContext, c_ast: **struc CProgram) error_t {
    declaration: unique_ptr_t(CDeclaration) = uptr_new()
    declarations: vector_t(unique_ptr_t(CDeclaration)) = vec_new()
    CATCH_ENTER
    loop while ctx[].pop_idx < vec_size(ctx[].p_toks[]) {
        storage_class: struc CStorageClass = init_CStatic()
        TRY(peek_next(ctx))
        if ctx[].peek_tok[].tok_kind == TOK_key_data {
            THROW_AT_TOKEN(ctx[].peek_tok[].info_at, GET_PARSER_MSG(0, MSG_data_at_toplvl))
        }
        TRY(parse_declaration(ctx, @storage_class, @declaration))
        vec_move_back(declarations, declaration)
        TRY(pop_next(ctx))
        TRY(expect_next(ctx, ctx[].next_tok, TOK_line_break))
    }
    c_ast[] = make_CProgram(@declarations)
    FINALLY
    free_CDeclaration(@declaration)
    loop i: u64 = 0 while i < vec_size(declarations) .. ++i {
        free_CDeclaration(@declarations[i])
    }
    vec_delete(declarations)
    CATCH_EXIT
}

pub fn parse_tokens(tokens: *vector_t(struc Token), errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) error_t {
    ctx: struc ParserContext;
    {
        ctx.errors = errors
        ctx.identifiers = identifiers
        ctx.pop_idx = 0
        ctx.p_toks = tokens
    }

    CATCH_ENTER
    TRY(parse_program(@ctx, c_ast))
    THROW_ABORT_IF(ctx.pop_idx ~= vec_size(tokens[]))
    THROW_ABORT_IF(not c_ast[])
    FINALLY
    vec_delete(tokens[])
    CATCH_EXIT
}
