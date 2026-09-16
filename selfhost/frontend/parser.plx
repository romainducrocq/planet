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







m4_define(`TOKEN_KIND', `TODO')m4_dnl
m4_define(`TOK_skip', `0')m4_dnl
m4_define(`TOK_line_break', `1')m4_dnl
m4_define(`TOK_open_paren', `2')m4_dnl
m4_define(`TOK_close_paren', `3')m4_dnl
m4_define(`TOK_open_brace', `4')m4_dnl
m4_define(`TOK_close_brace', `5')m4_dnl
m4_define(`TOK_open_bracket', `6')m4_dnl
m4_define(`TOK_close_bracket', `7')m4_dnl
m4_define(`TOK_comma_separator', `8')m4_dnl
m4_define(`TOK_semicolon', `9')m4_dnl
m4_define(`TOK_unop_complement', `10')m4_dnl
m4_define(`TOK_unop_neg', `11')m4_dnl
m4_define(`TOK_unop_not', `12')m4_dnl
m4_define(`TOK_unop_addrof', `13')m4_dnl
m4_define(`TOK_unop_incr', `14')m4_dnl
m4_define(`TOK_unop_decr', `15')m4_dnl
m4_define(`TOK_binop_add', `16')m4_dnl
m4_define(`TOK_binop_multiply', `17')m4_dnl
m4_define(`TOK_binop_divide', `18')m4_dnl
m4_define(`TOK_binop_remainder', `19')m4_dnl
m4_define(`TOK_binop_bitand', `20')m4_dnl
m4_define(`TOK_binop_bitor', `21')m4_dnl
m4_define(`TOK_binop_xor', `22')m4_dnl
m4_define(`TOK_binop_shiftleft', `23')m4_dnl
m4_define(`TOK_binop_shiftright', `24')m4_dnl
m4_define(`TOK_binop_and', `25')m4_dnl
m4_define(`TOK_binop_or', `26')m4_dnl
m4_define(`TOK_binop_eq', `27')m4_dnl
m4_define(`TOK_binop_ne', `28')m4_dnl
m4_define(`TOK_binop_lt', `29')m4_dnl
m4_define(`TOK_binop_le', `30')m4_dnl
m4_define(`TOK_binop_gt', `31')m4_dnl
m4_define(`TOK_binop_ge', `32')m4_dnl
m4_define(`TOK_assign', `33')m4_dnl
m4_define(`TOK_assign_type', `34')m4_dnl
m4_define(`TOK_assign_add', `35')m4_dnl
m4_define(`TOK_assign_subtract', `36')m4_dnl
m4_define(`TOK_assign_multiply', `37')m4_dnl
m4_define(`TOK_assign_divide', `38')m4_dnl
m4_define(`TOK_assign_remainder', `39')m4_dnl
m4_define(`TOK_assign_bitand', `40')m4_dnl
m4_define(`TOK_assign_bitor', `41')m4_dnl
m4_define(`TOK_assign_xor', `42')m4_dnl
m4_define(`TOK_assign_shiftleft', `43')m4_dnl
m4_define(`TOK_assign_shiftright', `44')m4_dnl
m4_define(`TOK_force_exec', `45')m4_dnl
m4_define(`TOK_ternary_if', `46')m4_dnl
m4_define(`TOK_compound_init', `47')m4_dnl
m4_define(`TOK_typeop_member', `48')m4_dnl
m4_define(`TOK_loop_post', `49')m4_dnl
m4_define(`TOK_match_with', `50')m4_dnl
m4_define(`TOK_key_char', `51')m4_dnl
m4_define(`TOK_key_string', `52')m4_dnl
m4_define(`TOK_key_i32', `53')m4_dnl
m4_define(`TOK_key_i64', `54')m4_dnl
m4_define(`TOK_key_i8', `55')m4_dnl
m4_define(`TOK_key_f64', `56')m4_dnl
m4_define(`TOK_key_u32', `57')m4_dnl
m4_define(`TOK_key_u64', `58')m4_dnl
m4_define(`TOK_key_u8', `59')m4_dnl
m4_define(`TOK_key_any', `60')m4_dnl
m4_define(`TOK_key_none', `61')m4_dnl
m4_define(`TOK_key_fn', `62')m4_dnl
m4_define(`TOK_key_struc', `63')m4_dnl
m4_define(`TOK_key_union', `64')m4_dnl
m4_define(`TOK_key_type', `65')m4_dnl
m4_define(`TOK_key_sizeof', `66')m4_dnl
m4_define(`TOK_key_return', `67')m4_dnl
m4_define(`TOK_key_cast', `68')m4_dnl
m4_define(`TOK_key_if', `69')m4_dnl
m4_define(`TOK_key_elif', `70')m4_dnl
m4_define(`TOK_key_else', `71')m4_dnl
m4_define(`TOK_key_then', `72')m4_dnl
m4_define(`TOK_key_jump', `73')m4_dnl
m4_define(`TOK_key_label', `74')m4_dnl
m4_define(`TOK_key_loop', `75')m4_dnl
m4_define(`TOK_key_while', `76')m4_dnl
m4_define(`TOK_key_match', `77')m4_dnl
m4_define(`TOK_key_otherwise', `78')m4_dnl
m4_define(`TOK_key_break', `79')m4_dnl
m4_define(`TOK_key_continue', `80')m4_dnl
m4_define(`TOK_key_pub', `81')m4_dnl
m4_define(`TOK_key_data', `82')m4_dnl
m4_define(`TOK_key_extrn', `83')m4_dnl
m4_define(`TOK_key_true', `84')m4_dnl
m4_define(`TOK_key_false', `85')m4_dnl
m4_define(`TOK_identifier', `86')m4_dnl
m4_define(`TOK_string_literal', `87')m4_dnl
m4_define(`TOK_char_const', `88')m4_dnl
m4_define(`TOK_int_const', `89')m4_dnl
m4_define(`TOK_long_const', `90')m4_dnl
m4_define(`TOK_uint_const', `91')m4_dnl
m4_define(`TOK_ulong_const', `92')m4_dnl
m4_define(`TOK_dbl_const', `93')m4_dnl
m4_define(`TOK_m4_prefix', `94')m4_dnl
m4_define(`TOK_import_file', `95')m4_dnl
m4_define(`TOK_import_force', `96')m4_dnl
m4_define(`TOK_use_file', `97')m4_dnl
m4_define(`TOK_use_force', `98')m4_dnl
m4_define(`TOK_error', `99')m4_dnl











type struc ParserContext(errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, pop_idx: u64, next_tok: *struc Token, peek_tok: *struc Token, peek_tok_i: *struc Token, p_toks: **struc Token)

m4_define(`Ctx', `TODO')m4_dnl

fn expect_next(ctx: *struc ParserContext, next_tok: *struc Token, expect_tok: i32) i32 {
    _errval: i32 = 0
    if next_tok[].tok_kind ~= expect_tok {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, next_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_unexpected_next_tok), "MSG_unexpected_next_tok", "", get_tok_fmt(ctx[].identifiers, next_tok), get_tok_kind_fmt(expect_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, next_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn pop_next(ctx: *struc ParserContext) i32 {
    _errval: i32 = 0
    if ctx[].pop_idx >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*ctx->p_toks)[((*ctx->p_toks) ? ((struct stbds_array_header*)(*ctx->p_toks)-1)->length : 0) - 1].info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_reached_eof), "MSG_reached_eof", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].next_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    ctx[].pop_idx++
    label _Lfinally
    return _errval
}

fn peek_next(ctx: *struc ParserContext) i32 {
    _errval: i32 = 0
    if ctx[].pop_idx >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*ctx->p_toks)[((*ctx->p_toks) ? ((struct stbds_array_header*)(*ctx->p_toks)-1)->length : 0) - 1].info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_reached_eof), "MSG_reached_eof", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].peek_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    label _Lfinally
    return _errval
}

fn peek_next_i(ctx: *struc ParserContext, i: u64) i32 {
    _errval: i32 = 0
    if i == 0 {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].peek_tok_i = ctx[].peek_tok
        jump _Lfinally
    }
    if ctx[].pop_idx + i >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*ctx->p_toks)[((*ctx->p_toks) ? ((struct stbds_array_header*)(*ctx->p_toks)-1)->length : 0) - 1].info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_reached_eof), "MSG_reached_eof", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].peek_tok_i = @(ctx[].p_toks[])[ctx[].pop_idx + i]
    label _Lfinally
    return _errval
}

fn parse_identifier(ctx: *struc ParserContext, identifier: *u64) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    identifier[] = ctx[].next_tok[].tok
    label _Lfinally
    return _errval
}

fn parse_string_literal(ctx: *struc ParserContext, literal: **struc CStringLiteral) i32 {
    value: *i8 = vec_new()
    _errval: i32 = 0
    string_to_literal(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), @value)
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == TOK_string_literal {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        string_to_literal(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), @value)
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    literal[] = make_CStringLiteral(@value)
    label _Lfinally
    if value {
        "@MACRO@:vec_delete(value)"
        loop .. while 0 {
            cast<none>((? (value) then free((cast<*struc stbds_array_header>((value)) - 1)) else cast<none>(0)))
            (value) = nil
        }
        value = vec_new()
    }
    return _errval
}

fn parse_int_const(intmax: i64) *struc CConst {
    value: i32 = cast<i32>(intmax)
    return make_CConstInt(value)
}

fn parse_char_const(ctx: *struc ParserContext) *struc CConst {
    value: i32 = string_to_char_ascii(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value))
    return make_CConstInt(value)
}

fn parse_long_const(intmax: i64) *struc CConst {
    value: i64 = cast<i64>(intmax)
    return make_CConstLong(value)
}

fn parse_dbl_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: f64;
    loop .. while 0 {
        "@MACRO@:TRY(string_to_dbl( ctx->errors, map_get(ctx->identifiers->hash_table, ctx->next_tok->tok), ctx->next_tok->info_at, &value))"
        _errval = string_to_dbl(ctx[].errors, ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant[] = make_CConstDouble(value)
    label _Lfinally
    return _errval
}

fn parse_uint_const(uintmax: u64) *struc CConst {
    value: u32 = cast<u32>(uintmax)
    return make_CConstUInt(value)
}

fn parse_ulong_const(uintmax: u64) *struc CConst {
    value: u64 = cast<u64>(uintmax)
    return make_CConstULong(value)
}

fn parse_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: i64;
    strto_value: string;
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_true {
            constant[] = make_CConstInt(1)
            jump _Lfinally
        }
        -> TOK_key_false {
            constant[] = make_CConstInt(0)
            jump _Lfinally
        }
        -> TOK_char_const {
            constant[] = parse_char_const(ctx)
            jump _Lfinally
        }
        -> TOK_dbl_const {
            loop .. while 0 {
                "@MACRO@:TRY(parse_dbl_const(ctx, constant))"
                _errval = parse_dbl_const(ctx, constant)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        jump _Lfinally
        otherwise {
            break
        }
    }
    strto_value = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    loop .. while 0 {
        "@MACRO@:TRY(string_to_long(ctx->errors, strto_value, ctx->next_tok->info_at, &value))"
        _errval = string_to_long(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if value > 9223372036854775807l {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_overflow_long_const), "MSG_overflow_long_const", "", "", strto_value) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].next_tok[].tok_kind == TOK_int_const and value <= 2147483647l {
        constant[] = parse_int_const(value)
    }
    else {
        constant[] = parse_long_const(value)
    }
    label _Lfinally
    return _errval
}

fn parse_unsigned_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: u64;
    strto_value: string;
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    strto_value = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    loop .. while 0 {
        "@MACRO@:TRY(string_to_ulong(ctx->errors, strto_value, ctx->next_tok->info_at, &value))"
        _errval = string_to_ulong(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if value > 18446744073709551615ul {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_overflow_ulong_const), "MSG_overflow_ulong_const", "", "", strto_value) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].next_tok[].tok_kind == TOK_uint_const and value <= 4294967295ul {
        constant[] = parse_uint_const(value)
    }
    else {
        constant[] = parse_ulong_const(value)
    }
    label _Lfinally
    return _errval
}

fn parse_unop(ctx: *struc ParserContext, unop: *struc CUnaryOp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_unop_complement {
            unop[] = make_CUnaryOp(AST_CComplement_t)
            break
        }
        -> TOK_unop_neg {
            unop[] = make_CUnaryOp(AST_CNegate_t)
            break
        }
        -> TOK_unop_not {
            unop[] = make_CUnaryOp(AST_CNot_t)
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_unop), "MSG_expect_unop", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_binop(ctx: *struc ParserContext, binop: *struc CBinaryOp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_binop_add {
            -> TOK_assign_add {
                -> TOK_unop_incr {
                    binop[] = make_CBinaryOp(AST_CAdd_t)
                    break
                }
            }
        }
        -> TOK_unop_neg {
            -> TOK_assign_subtract {
                -> TOK_unop_decr {
                    binop[] = make_CBinaryOp(AST_CSubtract_t)
                    break
                }
            }
        }
        -> TOK_binop_multiply {
            -> TOK_assign_multiply {
                binop[] = make_CBinaryOp(AST_CMultiply_t)
                break
            }
        }
        -> TOK_binop_divide {
            -> TOK_assign_divide {
                binop[] = make_CBinaryOp(AST_CDivide_t)
                break
            }
        }
        -> TOK_binop_remainder {
            -> TOK_assign_remainder {
                binop[] = make_CBinaryOp(AST_CRemainder_t)
                break
            }
        }
        -> TOK_binop_bitand {
            -> TOK_assign_bitand {
                binop[] = make_CBinaryOp(AST_CBitAnd_t)
                break
            }
        }
        -> TOK_binop_bitor {
            -> TOK_assign_bitor {
                binop[] = make_CBinaryOp(AST_CBitOr_t)
                break
            }
        }
        -> TOK_binop_xor {
            -> TOK_assign_xor {
                binop[] = make_CBinaryOp(AST_CBitXor_t)
                break
            }
        }
        -> TOK_binop_shiftleft {
            -> TOK_assign_shiftleft {
                binop[] = make_CBinaryOp(AST_CBitShiftLeft_t)
                break
            }
        }
        -> TOK_binop_shiftright {
            -> TOK_assign_shiftright {
                binop[] = make_CBinaryOp(AST_CBitShiftRight_t)
                break
            }
        }
        -> TOK_binop_and {
            binop[] = make_CBinaryOp(AST_CAnd_t)
            break
        }
        -> TOK_binop_or {
            binop[] = make_CBinaryOp(AST_COr_t)
            break
        }
        -> TOK_binop_eq {
            binop[] = make_CBinaryOp(AST_CEqual_t)
            break
        }
        -> TOK_binop_ne {
            binop[] = make_CBinaryOp(AST_CNotEqual_t)
            break
        }
        -> TOK_binop_lt {
            binop[] = make_CBinaryOp(AST_CLessThan_t)
            break
        }
        -> TOK_binop_le {
            binop[] = make_CBinaryOp(AST_CLessOrEqual_t)
            break
        }
        -> TOK_binop_gt {
            binop[] = make_CBinaryOp(AST_CGreaterThan_t)
            break
        }
        -> TOK_binop_ge {
            binop[] = make_CBinaryOp(AST_CGreaterOrEqual_t)
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_binop), "MSG_expect_binop", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) i32;

fn parse_datatype_specifier(ctx: *struc ParserContext, tag_name: *u64, is_union: *i32) i32 {
    _errval: i32 = 0
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
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_data_specifier), "MSG_expect_data_specifier", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, tag_name))"
        _errval = parse_identifier(ctx, tag_name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_type_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
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
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_incomplete_any), "MSG_incomplete_any", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> TOK_key_struc {
            -> TOK_key_union {
                is_union: i32;
                tag_name: u64;
                loop .. while 0 {
                    "@MACRO@:TRY(parse_datatype_specifier(ctx, &tag_name, &is_union))"
                    _errval = parse_datatype_specifier(ctx, @tag_name, @is_union)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                type_specifier[] = make_Structure(tag_name, is_union)
                break
            }
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_specifier), "MSG_expect_specifier", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_arr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    size: i64 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            loop .. while 0 {
                                "@MACRO@:TRY(parse_const(ctx, &constant))"
                                _errval = parse_const(ctx, @constant)
                                if _errval ~= 0 {
                                    jump _Lfinally
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_unsigned_const(ctx, &constant))"
                    _errval = parse_unsigned_const(ctx, @constant)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_arr_size_not_int_const), "MSG_arr_size_not_int_const", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_bracket))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_bracket)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
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
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_any {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        type_specifier[] = make_Void()
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_type_name(ctx, type_specifier))"
            _errval = parse_type_name(ctx, type_specifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    type_specifier[] = make_Array(size, type_specifier)
    label _Lfinally
    free_CConst(@constant)
    return _errval
}

fn parse_ptr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_any {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        type_specifier[] = make_Void()
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_type_name(ctx, type_specifier))"
            _errval = parse_type_name(ctx, type_specifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    type_specifier[] = make_Pointer(type_specifier)
    label _Lfinally
    return _errval
}

fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            loop .. while 0 {
                "@MACRO@:TRY(parse_arr_specifier(ctx, type_name))"
                _errval = parse_arr_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_binop_multiply {
            loop .. while 0 {
                "@MACRO@:TRY(parse_ptr_specifier(ctx, type_name))"
                _errval = parse_ptr_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_type_specifier(ctx, type_name))"
                _errval = parse_type_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    return _errval
}

fn parse_maybe_type(ctx: *struc ParserContext, maybe_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
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
                                                                loop .. while 0 {
                                                                    "@MACRO@:TRY(parse_type_name(ctx, maybe_type))"
                                                                    _errval = parse_type_name(ctx, maybe_type)
                                                                    if _errval ~= 0 {
                                                                        jump _Lfinally
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
        -> TOK_key_none {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            maybe_type[] = make_Void()
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_maybe_type), "MSG_expect_maybe_type", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32;
fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) i32;

fn parse_arg_list(ctx: *struc ParserContext, args: ***struc CExp) i32 {
    arg: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &arg))"
        _errval = parse_exp(ctx, 0, @arg)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(*args, arg)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*args, arg)"
            loop .. while 0 {
                (? (not (args[]) or (cast<*struc stbds_array_header>((args[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args[])) - 1)[].capacity) then (((args[]) = stbds_arrgrowf((args[]), sizeof((args[])[]), (1), (0))) and 0) else 0)
                (args[])[(cast<*struc stbds_array_header>((args[])) - 1)[].length++] = (arg)
            }
        }
        arg = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &arg))"
            _errval = parse_exp(ctx, 0, @arg)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(*args, arg)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(*args, arg)"
                loop .. while 0 {
                    (? (not (args[]) or (cast<*struc stbds_array_header>((args[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args[])) - 1)[].capacity) then (((args[]) = stbds_arrgrowf((args[]), sizeof((args[])[]), (1), (0))) and 0) else 0)
                    (args[])[(cast<*struc stbds_array_header>((args[])) - 1)[].length++] = (arg)
                }
            }
            arg = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    free_CExp(@arg)
    return _errval
}

fn parse_const_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_const(ctx, &constant))"
        _errval = parse_const(ctx, @constant)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConstant(@constant, info_at)
    label _Lfinally
    free_CConst(@constant)
    return _errval
}

fn parse_unsigned_const_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_unsigned_const(ctx, &constant))"
        _errval = parse_unsigned_const(ctx, @constant)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConstant(@constant, info_at)
    label _Lfinally
    free_CConst(@constant)
    return _errval
}

fn parse_string_literal_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    literal: *struc CStringLiteral = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_string_literal(ctx, &literal))"
        _errval = parse_string_literal(ctx, @literal)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CString(@literal, info_at)
    label _Lfinally
    free_CStringLiteral(@literal)
    return _errval
}

fn parse_var_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &name))"
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CVar(name, info_at)
    label _Lfinally
    return _errval
}

fn parse_call_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    args: **struc CExp = vec_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &name))"
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind ~= TOK_close_paren {
        loop .. while 0 {
            "@MACRO@:TRY(parse_arg_list(ctx, &args))"
            _errval = parse_arg_list(ctx, @args)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CFunctionCall(name, @args, info_at)
    label _Lfinally
    loop i: u64 = 0 while i < (? (args) then (cast<*struc stbds_array_header>((args)) - 1)[].length else 0) .. ++i {
        free_CExp(@args[i])
    }
    if args {
        "@MACRO@:vec_delete(args)"
        loop .. while 0 {
            cast<none>((? (args) then free((cast<*struc stbds_array_header>((args)) - 1)) else cast<none>(0)))
            (args) = nil
        }
        args = vec_new()
    }
    return _errval
}

fn parse_cast_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = uptr_new()
    target_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_binop_lt))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_binop_lt)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_maybe_type(ctx, &target_type))"
        _errval = parse_maybe_type(ctx, @target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_binop_gt))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_binop_gt)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_open_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &cast_exp))"
        _errval = parse_exp(ctx, 0, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CCast(@cast_exp, @target_type, info_at)
    label _Lfinally
    free_CExp(@cast_exp)
    free_Type(@target_type)
    return _errval
}

fn parse_inner_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, exp))"
        _errval = parse_exp(ctx, 0, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_deref_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_typeop_member {
        info_at = ctx[].peek_tok[].info_at
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
            _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        member: u64;
        loop .. while 0 {
            "@MACRO@:TRY(parse_identifier(ctx, &member))"
            _errval = parse_identifier(ctx, @member)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        exp[] = make_CArrow(member, exp, info_at)
    }
    else {
        exp[] = make_CDereference(exp, info_at)
    }
    label _Lfinally
    return _errval
}

fn parse_subscript_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    subscript_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &subscript_exp))"
        _errval = parse_exp(ctx, 0, @subscript_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_bracket))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_bracket)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSubscript(exp, @subscript_exp, info_at)
    label _Lfinally
    free_CExp(@subscript_exp)
    return _errval
}

fn parse_arr_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_bracket {
        loop .. while 0 {
            "@MACRO@:TRY(parse_deref_factor(ctx, exp))"
            _errval = parse_deref_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_subscript_factor(ctx, exp))"
            _errval = parse_subscript_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_dot_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    member: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &member))"
        _errval = parse_identifier(ctx, @member)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CDot(member, exp, info_at)
    label _Lfinally
    return _errval
}

fn parse_postfix_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    exp_right_1: *struc CExp = uptr_new()
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    exp_null: *struc CExp = uptr_new()
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CPostfix_t)
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, exp, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    return _errval
}

fn parse_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CUnaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_unop(ctx, &unop))"
        _errval = parse_unop(ctx, @unop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_unary_exp_factor(ctx, &cast_exp))"
        _errval = parse_unary_exp_factor(ctx, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CUnary(@unop, @cast_exp, info_at)
    label _Lfinally
    free_CExp(@cast_exp)
    return _errval
}

fn parse_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_left: *struc CExp = uptr_new()
    exp_right: *struc CExp = uptr_new()
    exp_left_1: *struc CExp = uptr_new()
    exp_right_1: *struc CExp = uptr_new()
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CPrefix_t)
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_unary_exp_factor(ctx, &exp_left))"
        _errval = parse_unary_exp_factor(ctx, @exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, @exp_left, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_left_1, @exp_right_1, info_at)
    label _Lfinally
    free_CExp(@exp_left)
    free_CExp(@exp_right)
    free_CExp(@exp_left_1)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    return _errval
}

fn parse_addrof_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_unary_exp_factor(ctx, &cast_exp))"
        _errval = parse_unary_exp_factor(ctx, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CAddrOf(@cast_exp, info_at)
    label _Lfinally
    free_CExp(@cast_exp)
    return _errval
}

fn parse_sizeoft_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    target_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].next_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_type_name(ctx, &target_type))"
        _errval = parse_type_name(ctx, @target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_binop_gt))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_binop_gt)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSizeOfT(@target_type, info_at)
    label _Lfinally
    free_Type(@target_type)
    return _errval
}

fn parse_sizeof_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    unary_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].next_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &unary_exp))"
        _errval = parse_exp(ctx, 0, @unary_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSizeOf(@unary_exp, info_at)
    label _Lfinally
    free_CExp(@unary_exp)
    return _errval
}

fn parse_sizeof_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_binop_lt {
            loop .. while 0 {
                "@MACRO@:TRY(parse_sizeoft_factor(ctx, exp))"
                _errval = parse_sizeoft_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_open_paren {
            loop .. while 0 {
                "@MACRO@:TRY(parse_sizeof_factor(ctx, exp))"
                _errval = parse_sizeof_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_open_sizeof), "MSG_expect_open_sizeof", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_primary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            -> TOK_dbl_const {
                                loop .. while 0 {
                                    "@MACRO@:TRY(parse_const_factor(ctx, exp))"
                                    _errval = parse_const_factor(ctx, exp)
                                    if _errval ~= 0 {
                                        jump _Lfinally
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_unsigned_const_factor(ctx, exp))"
                    _errval = parse_unsigned_const_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> TOK_string_literal {
            loop .. while 0 {
                "@MACRO@:TRY(parse_string_literal_factor(ctx, exp))"
                _errval = parse_string_literal_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_cast {
            loop .. while 0 {
                "@MACRO@:TRY(parse_cast_factor(ctx, exp))"
                _errval = parse_cast_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(peek_next_i(ctx, 1))"
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == TOK_open_paren {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_call_factor(ctx, exp))"
                    _errval = parse_call_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_var_factor(ctx, exp))"
                    _errval = parse_var_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
        }
        -> TOK_open_paren {
            loop .. while 0 {
                "@MACRO@:TRY(parse_inner_exp_factor(ctx, exp))"
                _errval = parse_inner_exp_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_expression), "MSG_expect_expression", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_postfix_op_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            loop .. while 0 {
                "@MACRO@:TRY(parse_arr_unary_factor(ctx, exp))"
                _errval = parse_arr_unary_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_typeop_member {
            loop .. while 0 {
                "@MACRO@:TRY(parse_dot_factor(ctx, exp))"
                _errval = parse_dot_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_unop_incr {
            -> TOK_unop_decr {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_postfix_incr_factor(ctx, exp))"
                    _errval = parse_postfix_incr_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_postfix_op_exp_factor(ctx, exp))"
        _errval = parse_postfix_op_exp_factor(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_postfix_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_primary_exp_factor(ctx, exp))"
        _errval = parse_primary_exp_factor(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            -> TOK_typeop_member {
                -> TOK_unop_incr {
                    -> TOK_unop_decr {
                        loop .. while 0 {
                            "@MACRO@:TRY(parse_postfix_op_exp_factor(ctx, exp))"
                            _errval = parse_postfix_op_exp_factor(ctx, exp)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_unop_complement {
            -> TOK_unop_neg {
                -> TOK_unop_not {
                    loop .. while 0 {
                        "@MACRO@:TRY(parse_unary_factor(ctx, exp))"
                        _errval = parse_unary_factor(ctx, exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        -> TOK_unop_incr {
            -> TOK_unop_decr {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_incr_factor(ctx, exp))"
                    _errval = parse_incr_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> TOK_unop_addrof {
            loop .. while 0 {
                "@MACRO@:TRY(parse_addrof_factor(ctx, exp))"
                _errval = parse_addrof_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_sizeof {
            loop .. while 0 {
                "@MACRO@:TRY(parse_sizeof_unary_factor(ctx, exp))"
                _errval = parse_sizeof_unary_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_postfix_exp_factor(ctx, exp))"
                _errval = parse_postfix_exp_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    return _errval
}

fn parse_assign_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CUnaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, precedence, &exp_right))"
        _errval = parse_exp(ctx, precedence, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_left[] = make_CAssignment(@unop, exp_left, @exp_right, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    return _errval
}

fn parse_assign_compound_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    exp_right_1: *struc CExp = uptr_new()
    _errval: i32 = 0
    exp_null: *struc CExp = uptr_new()
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CUnaryOp_t)
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, precedence, &exp_right))"
        _errval = parse_exp(ctx, precedence, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_right_1 = make_CBinary(@binop, exp_left, @exp_right, info_at)
    exp_left[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    return _errval
}

fn parse_binary_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, precedence + 1, &exp_right))"
        _errval = parse_exp(ctx, precedence + 1, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_left[] = make_CBinary(@binop, exp_left, @exp_right, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    return _errval
}

fn parse_ternary_exp(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_left: *struc CExp = uptr_new()
    exp_middle: *struc CExp = uptr_new()
    exp_right: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp_left))"
        _errval = parse_exp(ctx, 0, @exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_key_then))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_key_then)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp_middle))"
        _errval = parse_exp(ctx, 0, @exp_middle)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_key_else))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_key_else)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp_right))"
        _errval = parse_exp(ctx, 0, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConditional(@exp_left, @exp_middle, @exp_right, info_at)
    label _Lfinally
    free_CExp(@exp_left)
    free_CExp(@exp_middle)
    free_CExp(@exp_right)
    return _errval
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

fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_ternary_if {
        loop .. while 0 {
            "@MACRO@:TRY(parse_ternary_exp(ctx, exp))"
            _errval = parse_ternary_exp(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_unary_exp_factor(ctx, exp))"
            _errval = parse_unary_exp_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop while true {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
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
                                                                                    loop .. while 0 {
                                                                                        "@MACRO@:TRY(parse_binary_exp(ctx, precedence, exp))"
                                                                                        _errval = parse_binary_exp(ctx, precedence, exp)
                                                                                        if _errval ~= 0 {
                                                                                            jump _Lfinally
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
                }
            }
            break
            -> TOK_assign {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_assign_exp(ctx, precedence, exp))"
                    _errval = parse_assign_exp(ctx, precedence, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
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
                                                    loop .. while 0 {
                                                        "@MACRO@:TRY(parse_assign_compound_exp(ctx, precedence, exp))"
                                                        _errval = parse_assign_compound_exp(ctx, precedence, exp)
                                                        if _errval ~= 0 {
                                                            jump _Lfinally
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
            otherwise {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_binop), "MSG_expect_binop", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) i32;
fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) i32;

fn parse_ret_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_none {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &exp))"
            _errval = parse_exp(ctx, 0, @exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    statement[] = make_CReturn(@exp, info_at)
    label _Lfinally
    free_CExp(@exp)
    return _errval
}

fn parse_exp_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp))"
        _errval = parse_exp(ctx, 0, @exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CExpression(@exp)
    label _Lfinally
    free_CExp(@exp)
    return _errval
}

fn parse_compound_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    block: *struc CBlock = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_block(ctx, &block))"
        _errval = parse_block(ctx, @block)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if block {
        statement[] = make_CCompound(@block)
    }
    else {
        statement[] = make_CNull()
    }
    label _Lfinally
    free_CBlock(@block)
    return _errval
}

fn parse_if_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    condition: *struc CExp = uptr_new()
    then_fi: *struc CStatement = uptr_new()
    else_fi: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
        _errval = parse_exp(ctx, 0, @condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &then_fi))"
        _errval = parse_compound_statement(ctx, @then_fi)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_line_break {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next_i(ctx, 1))"
            _errval = peek_next_i(ctx, 1)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        match ctx[].peek_tok_i[].tok_kind {
            -> TOK_key_elif {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(parse_if_statement(ctx, &else_fi))"
                _errval = parse_if_statement(ctx, @else_fi)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
            -> TOK_key_else {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(parse_compound_statement(ctx, &else_fi))"
                _errval = parse_compound_statement(ctx, @else_fi)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
            otherwise {
                break
            }
        }
    }
    statement[] = make_CIf(@condition, @then_fi, @else_fi)
    label _Lfinally
    free_CExp(@condition)
    free_CStatement(@then_fi)
    free_CStatement(@else_fi)
    return _errval
}

fn parse_jump_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    target: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &target))"
        _errval = parse_identifier(ctx, @target)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CGoto(target, info_at)
    label _Lfinally
    return _errval
}

fn parse_label_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    jump_to: *struc CStatement = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    target: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &target))"
        _errval = parse_identifier(ctx, @target)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    jump_to = make_CNull()
    statement[] = make_CLabel(target, @jump_to, info_at)
    label _Lfinally
    free_CStatement(@jump_to)
    return _errval
}

fn parse_loop_init_decl(ctx: *struc ParserContext, for_init: **struc CForInit) i32 {
    var_decl: *struc CVariableDeclaration = uptr_new()
    _errval: i32 = 0
    storage_class: struc CStorageClass = make_CStorageClass(AST_CStorageClass_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_var_declaration(ctx, &storage_class, &var_decl))"
        _errval = parse_var_declaration(ctx, @storage_class, @var_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    for_init[] = make_CInitDecl(@var_decl)
    label _Lfinally
    free_CVariableDeclaration(@var_decl)
    return _errval
}

fn parse_loop_init_exp(ctx: *struc ParserContext, for_init: **struc CForInit) i32 {
    init: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &init))"
        _errval = parse_exp(ctx, 0, @init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    for_init[] = make_CInitExp(@init)
    label _Lfinally
    free_CExp(@init)
    return _errval
}

fn parse_loop_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    for_init: *struc CForInit = uptr_new()
    condition: *struc CExp = uptr_new()
    post: *struc CExp = uptr_new()
    body: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_brace {
            jump Lbreak
        }
        -> TOK_semicolon {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_infinite_loop), "MSG_infinite_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> TOK_loop_post {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(peek_next(ctx))"
                _errval = peek_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok[].tok_kind == TOK_key_while {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
                    _errval = parse_exp(ctx, 0, @condition)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
                    _errval = parse_compound_statement(ctx, @body)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                statement[] = make_CDoWhile(@condition, @body)
                jump _Lfinally
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_exp(ctx, 0, &post))"
                    _errval = parse_exp(ctx, 0, @post)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump Lbreak
            }
        }
        -> TOK_key_while {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
                _errval = parse_exp(ctx, 0, @condition)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(peek_next(ctx))"
                _errval = peek_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok[].tok_kind == TOK_loop_post {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    "@MACRO@:TRY(parse_exp(ctx, 0, &post))"
                    _errval = parse_exp(ctx, 0, @post)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump Lbreak
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
                    _errval = parse_compound_statement(ctx, @body)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                statement[] = make_CWhile(@condition, @body)
                jump _Lfinally
            }
        }
        -> TOK_key_pub {
            -> TOK_key_data {
                -> TOK_key_extrn {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_loop_decl_not_auto), "MSG_loop_decl_not_auto", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
        }
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(peek_next_i(ctx, 1))"
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == TOK_assign_type {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_loop_init_decl(ctx, &for_init))"
                    _errval = parse_loop_init_decl(ctx, @for_init)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_loop_init_exp(ctx, &for_init))"
                    _errval = parse_loop_init_exp(ctx, @for_init)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_loop_init_exp(ctx, &for_init))"
                _errval = parse_loop_init_exp(ctx, @for_init)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_while {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
            _errval = parse_exp(ctx, 0, @condition)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_loop_post {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &post))"
            _errval = parse_exp(ctx, 0, @post)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label Lbreak
    if not for_init {
        exp_null: *struc CExp = uptr_new()
        for_init = make_CInitExp(@exp_null)
    }
    if not condition {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == TOK_semicolon {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_infinite_loop), "MSG_infinite_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
        _errval = parse_compound_statement(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CFor(@for_init, @condition, @post, @body)
    label _Lfinally
    free_CForInit(@for_init)
    free_CExp(@condition)
    free_CExp(@post)
    free_CStatement(@body)
    return _errval
}

fn parse_match_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    lookup: *struc CExp = uptr_new()
    body: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &lookup))"
        _errval = parse_exp(ctx, 0, @lookup)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
        _errval = parse_compound_statement(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CSwitch(@lookup, @body)
    label _Lfinally
    free_CExp(@lookup)
    free_CStatement(@body)
    return _errval
}

fn parse_with_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    value: *struc CExp = uptr_new()
    jump_to: *struc CStatement = uptr_new()
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            loop .. while 0 {
                                "@MACRO@:TRY(parse_const(ctx, &constant))"
                                _errval = parse_const(ctx, @constant)
                                if _errval ~= 0 {
                                    jump _Lfinally
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_unsigned_const(ctx, &constant))"
                    _errval = parse_unsigned_const(ctx, @constant)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_case_value_not_int_const), "MSG_case_value_not_int_const", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    value = make_CConstant(@constant, info_at)
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &jump_to))"
        _errval = parse_compound_statement(ctx, @jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CCase(@value, @jump_to)
    label _Lfinally
    free_CExp(@value)
    free_CStatement(@jump_to)
    free_CConst(@constant)
    return _errval
}

fn parse_otherwise_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    jump_to: *struc CStatement = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &jump_to))"
        _errval = parse_compound_statement(ctx, @jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CDefault(@jump_to, info_at)
    label _Lfinally
    free_CStatement(@jump_to)
    return _errval
}

fn parse_break_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CBreak(info_at)
    label _Lfinally
    return _errval
}

fn parse_continue_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CContinue(info_at)
    label _Lfinally
    return _errval
}

fn parse_null_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CNull()
    label _Lfinally
    return _errval
}

fn parse_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_return {
            loop .. while 0 {
                "@MACRO@:TRY(parse_ret_statement(ctx, statement))"
                _errval = parse_ret_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        jump _Lfinally
        -> TOK_key_if {
            loop .. while 0 {
                "@MACRO@:TRY(parse_if_statement(ctx, statement))"
                _errval = parse_if_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_jump {
            loop .. while 0 {
                "@MACRO@:TRY(parse_jump_statement(ctx, statement))"
                _errval = parse_jump_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_label {
            loop .. while 0 {
                "@MACRO@:TRY(parse_label_statement(ctx, statement))"
                _errval = parse_label_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_open_brace {
            loop .. while 0 {
                "@MACRO@:TRY(parse_compound_statement(ctx, statement))"
                _errval = parse_compound_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_loop {
            loop .. while 0 {
                "@MACRO@:TRY(parse_loop_statement(ctx, statement))"
                _errval = parse_loop_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_match {
            loop .. while 0 {
                "@MACRO@:TRY(parse_match_statement(ctx, statement))"
                _errval = parse_match_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_match_with {
            loop .. while 0 {
                "@MACRO@:TRY(parse_with_statement(ctx, statement))"
                _errval = parse_with_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_otherwise_statement(ctx, statement))"
                _errval = parse_otherwise_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_break {
            loop .. while 0 {
                "@MACRO@:TRY(parse_break_statement(ctx, statement))"
                _errval = parse_break_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_continue {
            loop .. while 0 {
                "@MACRO@:TRY(parse_continue_statement(ctx, statement))"
                _errval = parse_continue_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_semicolon {
            loop .. while 0 {
                "@MACRO@:TRY(parse_null_statement(ctx, statement))"
                _errval = parse_null_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_exp_statement(ctx, statement))"
                _errval = parse_exp_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    return _errval
}

fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32;

fn parse_s_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    statement: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_statement(ctx, &statement))"
        _errval = parse_statement(ctx, @statement)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block_item[] = make_CS(@statement)
    label _Lfinally
    free_CStatement(@statement)
    return _errval
}

fn parse_d_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    declaration: *struc CDeclaration = uptr_new()
    _errval: i32 = 0
    storage_class: struc CStorageClass = make_CStorageClass(AST_CStorageClass_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_declaration(ctx, &storage_class, &declaration))"
        _errval = parse_declaration(ctx, @storage_class, @declaration)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block_item[] = make_CD(@declaration)
    label _Lfinally
    free_CDeclaration(@declaration)
    return _errval
}

fn parse_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_pub_in_block), "MSG_pub_in_block", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> TOK_key_data {
            -> TOK_key_extrn {
                -> TOK_key_fn {
                    -> TOK_key_type {
                        loop .. while 0 {
                            "@MACRO@:TRY(parse_d_block_item(ctx, block_item))"
                            _errval = parse_d_block_item(ctx, block_item)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        jump _Lfinally
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(peek_next_i(ctx, 1))"
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == TOK_assign_type {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_d_block_item(ctx, block_item))"
                    _errval = parse_d_block_item(ctx, block_item)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump _Lfinally
            }
            break
        }
        otherwise {
            break
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_s_block_item(ctx, block_item))"
        _errval = parse_s_block_item(ctx, block_item)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_b_block(ctx: *struc ParserContext, block: **struc CBlock) i32 {
    block_item: *struc CBlockItem = uptr_new()
    block_items: **struc CBlockItem = vec_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_line_break {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_brace {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_empty_block), "MSG_empty_block", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_block_item(ctx, &block_item))"
        _errval = parse_block_item(ctx, @block_item)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(block_items, block_item)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(block_items, block_item)"
            loop .. while 0 {
                (? (not (block_items) or (cast<*struc stbds_array_header>((block_items)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((block_items)) - 1)[].capacity) then (((block_items) = stbds_arrgrowf((block_items), sizeof((block_items)[]), (1), (0))) and 0) else 0)
                (block_items)[(cast<*struc stbds_array_header>((block_items)) - 1)[].length++] = (block_item)
            }
        }
        block_item = nil
    }
    loop while true {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].next_tok[].tok_kind == TOK_close_brace {
            break
        }
        loop .. while 0 {
            "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_line_break))"
            _errval = expect_next(ctx, ctx[].next_tok, TOK_line_break)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == TOK_close_brace {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_block_item(ctx, &block_item))"
            _errval = parse_block_item(ctx, @block_item)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(block_items, block_item)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(block_items, block_item)"
                loop .. while 0 {
                    (? (not (block_items) or (cast<*struc stbds_array_header>((block_items)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((block_items)) - 1)[].capacity) then (((block_items) = stbds_arrgrowf((block_items), sizeof((block_items)[]), (1), (0))) and 0) else 0)
                    (block_items)[(cast<*struc stbds_array_header>((block_items)) - 1)[].length++] = (block_item)
                }
            }
            block_item = nil
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_brace))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_brace)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block[] = make_CB(@block_items)
    label _Lfinally
    free_CBlockItem(@block_item)
    loop i: u64 = 0 while i < (? (block_items) then (cast<*struc stbds_array_header>((block_items)) - 1)[].length else 0) .. ++i {
        free_CBlockItem(@block_items[i])
    }
    if block_items {
        "@MACRO@:vec_delete(block_items)"
        loop .. while 0 {
            cast<none>((? (block_items) then free((cast<*struc stbds_array_header>((block_items)) - 1)) else cast<none>(0)))
            (block_items) = nil
        }
        block_items = vec_new()
    }
    return _errval
}

fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_open_brace {
            loop .. while 0 {
                "@MACRO@:TRY(parse_b_block(ctx, block))"
                _errval = parse_b_block(ctx, block)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_block), "MSG_expect_block", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) i32;

fn parse_single_init(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp))"
        _errval = parse_exp(ctx, 0, @exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    initializer[] = make_CSingleInit(@exp)
    label _Lfinally
    free_CExp(@exp)
    return _errval
}

fn parse_compound_init(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    initializers: **struc CInitializer = vec_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_open_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_paren {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_empty_compound_init), "MSG_empty_compound_init", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_initializer(ctx, initializer))"
        _errval = parse_initializer(ctx, initializer)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(initializers, *initializer)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(initializers, *initializer)"
            loop .. while 0 {
                (? (not (initializers) or (cast<*struc stbds_array_header>((initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((initializers)) - 1)[].capacity) then (((initializers) = stbds_arrgrowf((initializers), sizeof((initializers)[]), (1), (0))) and 0) else 0)
                (initializers)[(cast<*struc stbds_array_header>((initializers)) - 1)[].length++] = (initializer[])
            }
        }
        initializer[] = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].next_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(parse_initializer(ctx, initializer))"
            _errval = parse_initializer(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(initializers, *initializer)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(initializers, *initializer)"
                loop .. while 0 {
                    (? (not (initializers) or (cast<*struc stbds_array_header>((initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((initializers)) - 1)[].capacity) then (((initializers) = stbds_arrgrowf((initializers), sizeof((initializers)[]), (1), (0))) and 0) else 0)
                    (initializers)[(cast<*struc stbds_array_header>((initializers)) - 1)[].length++] = (initializer[])
                }
            }
            initializer[] = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    initializer[] = make_CCompoundInit(@initializers)
    label _Lfinally
    loop i: u64 = 0 while i < (? (initializers) then (cast<*struc stbds_array_header>((initializers)) - 1)[].length else 0) .. ++i {
        free_CInitializer(@initializers[i])
    }
    if initializers {
        "@MACRO@:vec_delete(initializers)"
        loop .. while 0 {
            cast<none>((? (initializers) then free((cast<*struc stbds_array_header>((initializers)) - 1)) else cast<none>(0)))
            (initializers) = nil
        }
        initializers = vec_new()
    }
    return _errval
}

fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_compound_init {
        loop .. while 0 {
            "@MACRO@:TRY(parse_compound_init(ctx, initializer))"
            _errval = parse_compound_init(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_single_init(ctx, initializer))"
            _errval = parse_single_init(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, name))"
        _errval = parse_identifier(ctx, name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_assign_type))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_assign_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_type_name(ctx, derived_type))"
        _errval = parse_type_name(ctx, derived_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_item_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            -> TOK_key_data {
                -> TOK_key_extrn {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_list_decl_not_auto), "MSG_list_decl_not_auto", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
        }
        otherwise {
            break
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_decltor(ctx, name, derived_type))"
        _errval = parse_decltor(ctx, name, derived_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_decltor_list(ctx: *struc ParserContext, params: **u64, param_types: ***struc Type) i32 {
    param_type: *struc Type = sptr_new()
    _errval: i32 = 0
    param: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_item_decltor(ctx, &param, &param_type))"
        _errval = parse_item_decltor(ctx, @param, @param_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_push_back(*params, param)"
        loop .. while 0 {
            (? (not (params[]) or (cast<*struc stbds_array_header>((params[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((params[])) - 1)[].capacity) then (((params[]) = stbds_arrgrowf((params[]), sizeof((params[])[]), (1), (0))) and 0) else 0)
            (params[])[(cast<*struc stbds_array_header>((params[])) - 1)[].length++] = (param)
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(*param_types, param_type)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*param_types, param_type)"
            loop .. while 0 {
                (? (not (param_types[]) or (cast<*struc stbds_array_header>((param_types[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((param_types[])) - 1)[].capacity) then (((param_types[]) = stbds_arrgrowf((param_types[]), sizeof((param_types[])[]), (1), (0))) and 0) else 0)
                (param_types[])[(cast<*struc stbds_array_header>((param_types[])) - 1)[].length++] = (param_type)
            }
        }
        param_type = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_item_decltor(ctx, &param, &param_type))"
            _errval = parse_item_decltor(ctx, @param, @param_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_push_back(*params, param)"
            loop .. while 0 {
                (? (not (params[]) or (cast<*struc stbds_array_header>((params[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((params[])) - 1)[].capacity) then (((params[]) = stbds_arrgrowf((params[]), sizeof((params[])[]), (1), (0))) and 0) else 0)
                (params[])[(cast<*struc stbds_array_header>((params[])) - 1)[].length++] = (param)
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(*param_types, param_type)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(*param_types, param_type)"
                loop .. while 0 {
                    (? (not (param_types[]) or (cast<*struc stbds_array_header>((param_types[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((param_types[])) - 1)[].capacity) then (((param_types[]) = stbds_arrgrowf((param_types[]), sizeof((param_types[])[]), (1), (0))) and 0) else 0)
                    (param_types[])[(cast<*struc stbds_array_header>((param_types[])) - 1)[].length++] = (param_type)
                }
            }
            param_type = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    free_Type(@param_type)
    return _errval
}

fn parse_fun_decltor(ctx: *struc ParserContext, fun_type: **struc Type, params: **u64) i32 {
    param_types: **struc Type = vec_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_open_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_none {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_decltor_list(ctx, params, &param_types))"
            _errval = parse_decltor_list(ctx, params, @param_types)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_maybe_type(ctx, fun_type))"
        _errval = parse_maybe_type(ctx, fun_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    fun_type[] = make_FunType(@param_types, fun_type)
    label _Lfinally
    loop i: u64 = 0 while i < (? (param_types) then (cast<*struc stbds_array_header>((param_types)) - 1)[].length else 0) .. ++i {
        free_Type(@param_types[i])
    }
    if param_types {
        "@MACRO@:vec_delete(param_types)"
        loop .. while 0 {
            cast<none>((? (param_types) then free((cast<*struc stbds_array_header>((param_types)) - 1)) else cast<none>(0)))
            (param_types) = nil
        }
        param_types = vec_new()
    }
    return _errval
}

fn parse_fun_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, fun_decl: **struc CFunctionDeclaration) i32 {
    body: *struc CBlock = uptr_new()
    fun_type: *struc Type = sptr_new()
    params: *u64 = vec_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &name))"
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_fun_decltor(ctx, &fun_type, &params))"
        _errval = parse_fun_decltor(ctx, @fun_type, @params)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_block(ctx, &body))"
        _errval = parse_block(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    fun_decl[] = make_CFunctionDeclaration(name, @params, @body, @fun_type, storage_class, info_at)
    label _Lfinally
    free_CBlock(@body)
    free_Type(@fun_type)
    if params {
        "@MACRO@:vec_delete(params)"
        loop .. while 0 {
            cast<none>((? (params) then free((cast<*struc stbds_array_header>((params)) - 1)) else cast<none>(0)))
            (params) = nil
        }
        params = vec_new()
    }
    return _errval
}

fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) i32 {
    initializer: *struc CInitializer = uptr_new()
    var_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_decltor(ctx, &name, &var_type))"
        _errval = parse_decltor(ctx, @name, @var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_assign {
            loop .. while 0 {
                "@MACRO@:TRY(parse_initializer(ctx, &initializer))"
                _errval = parse_initializer(ctx, @initializer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_assign), "MSG_expect_assign", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    var_decl[] = make_CVariableDeclaration(name, @initializer, @var_type, storage_class, info_at)
    label _Lfinally
    free_CInitializer(@initializer)
    free_Type(@var_type)
    return _errval
}

fn parse_member_declaration(ctx: *struc ParserContext, member_decl: **struc CMemberDeclaration) i32 {
    member_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64;
    member_name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    info_at = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_item_decltor(ctx, &member_name, &member_type))"
        _errval = parse_item_decltor(ctx, @member_name, @member_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    member_decl[] = make_CMemberDeclaration(member_name, @member_type, info_at)
    label _Lfinally
    free_Type(@member_type)
    return _errval
}

fn parse_member_list(ctx: *struc ParserContext, members: ***struc CMemberDeclaration) i32 {
    member: *struc CMemberDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_member_declaration(ctx, &member))"
        _errval = parse_member_declaration(ctx, @member)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(*members, member)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*members, member)"
            loop .. while 0 {
                (? (not (members[]) or (cast<*struc stbds_array_header>((members[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((members[])) - 1)[].capacity) then (((members[]) = stbds_arrgrowf((members[]), sizeof((members[])[]), (1), (0))) and 0) else 0)
                (members[])[(cast<*struc stbds_array_header>((members[])) - 1)[].length++] = (member)
            }
        }
        member = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].next_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(parse_member_declaration(ctx, &member))"
            _errval = parse_member_declaration(ctx, @member)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(*members, member)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(*members, member)"
                loop .. while 0 {
                    (? (not (members[]) or (cast<*struc stbds_array_header>((members[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((members[])) - 1)[].capacity) then (((members[]) = stbds_arrgrowf((members[]), sizeof((members[])[]), (1), (0))) and 0) else 0)
                    (members[])[(cast<*struc stbds_array_header>((members[])) - 1)[].length++] = (member)
                }
            }
            member = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    free_CMemberDeclaration(@member)
    return _errval
}

fn parse_type_declaration(ctx: *struc ParserContext, struct_decl: **struc CStructDeclaration) i32 {
    members: **struc CMemberDeclaration = vec_new()
    _errval: i32 = 0
    is_union: i32;
    tag_name: u64;
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_datatype_specifier(ctx, &tag_name, &is_union))"
        _errval = parse_datatype_specifier(ctx, @tag_name, @is_union)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_open_paren {
            loop .. while 0 {
                "@MACRO@:TRY(parse_member_list(ctx, &members))"
                _errval = parse_member_list(ctx, @members)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_datatype), "MSG_expect_datatype", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    struct_decl[] = make_CStructDeclaration(tag_name, is_union, @members, info_at)
    label _Lfinally
    loop i: u64 = 0 while i < (? (members) then (cast<*struc stbds_array_header>((members)) - 1)[].length else 0) .. ++i {
        free_CMemberDeclaration(@members[i])
    }
    if members {
        "@MACRO@:vec_delete(members)"
        loop .. while 0 {
            cast<none>((? (members) then free((cast<*struc stbds_array_header>((members)) - 1)) else cast<none>(0)))
            (members) = nil
        }
        members = vec_new()
    }
    return _errval
}

fn parse_fun_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    fun_decl: *struc CFunctionDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_fun_declaration(ctx, storage_class, &fun_decl))"
        _errval = parse_fun_declaration(ctx, storage_class, @fun_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CFunDecl(@fun_decl)
    label _Lfinally
    free_CFunctionDeclaration(@fun_decl)
    return _errval
}

fn parse_var_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    var_decl: *struc CVariableDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_var_declaration(ctx, storage_class, &var_decl))"
        _errval = parse_var_declaration(ctx, storage_class, @var_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CVarDecl(@var_decl)
    label _Lfinally
    free_CVariableDeclaration(@var_decl)
    return _errval
}

fn parse_type_decl(ctx: *struc ParserContext, declaration: **struc CDeclaration) i32 {
    struct_decl: *struc CStructDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_type_declaration(ctx, &struct_decl))"
        _errval = parse_type_declaration(ctx, @struct_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CStructDecl(@struct_decl)
    label _Lfinally
    free_CStructDeclaration(@struct_decl)
    return _errval
}

fn parse_storage_class(ctx: *struc ParserContext, storage_class: *struc CStorageClass) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            storage_class[] = make_CStorageClass(AST_CStorageClass_t)
            break
        }
        -> TOK_key_data {
            storage_class[] = make_CStorageClass(AST_CStatic_t)
            break
        }
        -> TOK_key_extrn {
            storage_class[] = make_CStorageClass(AST_CExtern_t)
            break
        }
        -> TOK_key_fn {
            -> TOK_identifier {
                -> TOK_key_type {
                    jump _Lfinally
                }
            }
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_storage_class), "MSG_expect_storage_class", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_type {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_type_decl_not_auto), "MSG_type_decl_not_auto", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_storage_class(ctx, storage_class))"
        _errval = parse_storage_class(ctx, storage_class)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_fn {
            loop .. while 0 {
                "@MACRO@:TRY(parse_fun_decl(ctx, storage_class, declaration))"
                _errval = parse_fun_decl(ctx, storage_class, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(parse_var_decl(ctx, storage_class, declaration))"
                _errval = parse_var_decl(ctx, storage_class, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_type {
            loop .. while 0 {
                "@MACRO@:TRY(parse_type_decl(ctx, declaration))"
                _errval = parse_type_decl(ctx, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_declaration), "MSG_expect_declaration", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_program(ctx: *struc ParserContext, c_ast: **struc CProgram) i32 {
    declaration: *struc CDeclaration = uptr_new()
    declarations: **struc CDeclaration = vec_new()
    _errval: i32 = 0
    loop while ctx[].pop_idx < (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        storage_class: struc CStorageClass = make_CStorageClass(AST_CStatic_t)
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == TOK_key_data {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_data_at_toplvl), "MSG_data_at_toplvl", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_declaration(ctx, &storage_class, &declaration))"
            _errval = parse_declaration(ctx, @storage_class, @declaration)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(declarations, declaration)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(declarations, declaration)"
                loop .. while 0 {
                    (? (not (declarations) or (cast<*struc stbds_array_header>((declarations)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((declarations)) - 1)[].capacity) then (((declarations) = stbds_arrgrowf((declarations), sizeof((declarations)[]), (1), (0))) and 0) else 0)
                    (declarations)[(cast<*struc stbds_array_header>((declarations)) - 1)[].length++] = (declaration)
                }
            }
            declaration = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_line_break))"
            _errval = expect_next(ctx, ctx[].next_tok, TOK_line_break)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    c_ast[] = make_CProgram(@declarations)
    label _Lfinally
    free_CDeclaration(@declaration)
    loop i: u64 = 0 while i < (? (declarations) then (cast<*struc stbds_array_header>((declarations)) - 1)[].length else 0) .. ++i {
        free_CDeclaration(@declarations[i])
    }
    if declarations {
        "@MACRO@:vec_delete(declarations)"
        loop .. while 0 {
            cast<none>((? (declarations) then free((cast<*struc stbds_array_header>((declarations)) - 1)) else cast<none>(0)))
            (declarations) = nil
        }
        declarations = vec_new()
    }
    return _errval
}

pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32 {
    ctx: struc ParserContext;
    {
        ctx.errors = errors
        ctx.identifiers = identifiers
        ctx.pop_idx = 0
        ctx.p_toks = tokens
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_program(&ctx, c_ast))"
        _errval = parse_program(@ctx, c_ast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if tokens[] {
        "@MACRO@:vec_delete(*tokens)"
        loop .. while 0 {
            cast<none>((? (tokens[]) then free((cast<*struc stbds_array_header>((tokens[])) - 1)) else cast<none>(0)))
            (tokens[]) = nil
        }
        tokens[] = vec_new()
    }
    return _errval
}
