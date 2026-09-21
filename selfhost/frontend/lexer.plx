m4_include(`errors.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/fileio.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl

type struc Elementhash_t(key: u64, value: char)

type struc LexerContext(errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, line: string, line_size: u64, match_at: u64, match_size: u64, includename_set: *struc Elementhash_t, p_includedirs: *vector_t(string), p_stdlibdirs: *vector_t(string), p_toks: *vector_t(struc Token), paren_depth: u64, total_linenum: u64)

m4_define(`Ctx', `TODO')m4_dnl

fn get_char(ctx: *struc LexerContext) char {
    i: u64 = ctx[].match_at + ctx[].match_size
    if i < ctx[].line_size {
        return ctx[].line[i]
    }
    else {
        return 0
    }
}

m4_define(`LEX_SPACE', `TODO')m4_dnl
m4_define(`LEX_DIGIT', `TODO')m4_dnl
m4_define(`LEX_LETTER', `TODO')m4_dnl
m4_define(`LEX_WORD', `TODO')m4_dnl

fn match_char(ctx: *struc LexerContext, c: char) i32 {
    if c == get_char(ctx) {
        ctx[].match_size++
        return true
    }
    else {
        return false
    }
}

fn match_chars(ctx: *struc LexerContext, cs: string, n: u64) i32 {
    loop i: u64 = 0 while i < n .. ++i {
        if not match_char(ctx, cs[i]) {
            return false
        }
    }
    return true
}

fn match_invert(ctx: *struc LexerContext, c: char) i32 {
    inv: char = get_char(ctx)
    if inv ~= 0 and c ~= inv {
        ctx[].match_size++
        return true
    }
    else {
        return false
    }
}

fn match_space(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> ' ' {
            -> '\t' {
                ctx[].match_size++
                return true
            }
        }
        otherwise {
            return false
        }
    }
}

fn match_digit(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                ctx[].match_size++
                                                return true
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
            return false
        }
    }
}

fn match_word(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                -> '_' {
                                                    -> 'a' {
                                                        -> 'b' {
                                                            -> 'c' {
                                                                -> 'd' {
                                                                    -> 'e' {
                                                                        -> 'f' {
                                                                            -> 'g' {
                                                                                -> 'h' {
                                                                                    -> 'i' {
                                                                                        -> 'j' {
                                                                                            -> 'k' {
                                                                                                -> 'l' {
                                                                                                    -> 'm' {
                                                                                                        -> 'n' {
                                                                                                            -> 'o' {
                                                                                                                -> 'p' {
                                                                                                                    -> 'q' {
                                                                                                                        -> 'r' {
                                                                                                                            -> 's' {
                                                                                                                                -> 't' {
                                                                                                                                    -> 'u' {
                                                                                                                                        -> 'v' {
                                                                                                                                            -> 'w' {
                                                                                                                                                -> 'x' {
                                                                                                                                                    -> 'y' {
                                                                                                                                                        -> 'z' {
                                                                                                                                                            -> 'A' {
                                                                                                                                                                -> 'B' {
                                                                                                                                                                    -> 'C' {
                                                                                                                                                                        -> 'D' {
                                                                                                                                                                            -> 'E' {
                                                                                                                                                                                -> 'F' {
                                                                                                                                                                                    -> 'G' {
                                                                                                                                                                                        -> 'H' {
                                                                                                                                                                                            -> 'I' {
                                                                                                                                                                                                -> 'J' {
                                                                                                                                                                                                    -> 'K' {
                                                                                                                                                                                                        -> 'L' {
                                                                                                                                                                                                            -> 'M' {
                                                                                                                                                                                                                -> 'N' {
                                                                                                                                                                                                                    -> 'O' {
                                                                                                                                                                                                                        -> 'P' {
                                                                                                                                                                                                                            -> 'Q' {
                                                                                                                                                                                                                                -> 'R' {
                                                                                                                                                                                                                                    -> 'S' {
                                                                                                                                                                                                                                        -> 'T' {
                                                                                                                                                                                                                                            -> 'U' {
                                                                                                                                                                                                                                                -> 'V' {
                                                                                                                                                                                                                                                    -> 'W' {
                                                                                                                                                                                                                                                        -> 'X' {
                                                                                                                                                                                                                                                            -> 'Y' {
                                                                                                                                                                                                                                                                -> 'Z' {
                                                                                                                                                                                                                                                                    ctx[].match_size++
                                                                                                                                                                                                                                                                    return true
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
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn match_error(ctx: *struc LexerContext) i32 {
    ctx[].match_size++
    return TOK_error
}

fn match_include(ctx: *struc LexerContext, tok_kind: i32) i32 {
    loop while match_space(ctx) {
        ;
    }
    if match_char(ctx, '!') {
        match tok_kind {
            -> TOK_import_file {
                tok_kind = TOK_import_force
                break
            }
            -> TOK_use_file {
                tok_kind = TOK_use_force
                break
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        loop while match_space(ctx) {
            ;
        }
    }
    if match_char(ctx, '"') {
        ctx[].match_at += ctx[].match_size - 1
        ctx[].match_size = 1
        loop while match_invert(ctx, '"') {
            ;
        }
        if get_char(ctx) == '"' {
            ctx[].match_size++
            return tok_kind
        }
    }
    return match_error(ctx)
}

fn match_char_const(ctx: *struc LexerContext, is_str: i32) i32 {
    match get_char(ctx) {
        -> '\'' {
            if not is_str {
                return match_error(ctx)
            }
            break
        }
        -> '"' {
            if is_str {
                ctx[].match_size++
                return TOK_string_literal
            }
            break
        }
        -> '\n' {
            return match_error(ctx)
        }
        -> '\\' {
            ctx[].match_size++
            match get_char(ctx) {
                -> '\'' {
                    -> '"' {
                        -> '\\' {
                            -> '?' {
                                -> 'a' {
                                    -> 'b' {
                                        -> 'f' {
                                            -> 'n' {
                                                -> 'r' {
                                                    -> 't' {
                                                        -> 'v' {
                                                            break
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
                    return match_error(ctx)
                }
            }
        }
        otherwise {
            break
        }
    }
    ctx[].match_size++
    if is_str or match_char(ctx, '\'') {
        return TOK_char_const
    }
    else {
        return match_error(ctx)
    }
}

fn match_string_literal(ctx: *struc LexerContext) i32 {
    tok_kind: i32;
    loop .. while tok_kind == TOK_char_const {
        tok_kind = match_char_const(ctx, true)
    }
    return tok_kind
}

fn match_const_end(ctx: *struc LexerContext, tok_kind: i32) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                -> '_' {
                                                    -> 'a' {
                                                        -> 'b' {
                                                            -> 'c' {
                                                                -> 'd' {
                                                                    -> 'e' {
                                                                        -> 'f' {
                                                                            -> 'g' {
                                                                                -> 'h' {
                                                                                    -> 'i' {
                                                                                        -> 'j' {
                                                                                            -> 'k' {
                                                                                                -> 'l' {
                                                                                                    -> 'm' {
                                                                                                        -> 'n' {
                                                                                                            -> 'o' {
                                                                                                                -> 'p' {
                                                                                                                    -> 'q' {
                                                                                                                        -> 'r' {
                                                                                                                            -> 's' {
                                                                                                                                -> 't' {
                                                                                                                                    -> 'u' {
                                                                                                                                        -> 'v' {
                                                                                                                                            -> 'w' {
                                                                                                                                                -> 'x' {
                                                                                                                                                    -> 'y' {
                                                                                                                                                        -> 'z' {
                                                                                                                                                            -> 'A' {
                                                                                                                                                                -> 'B' {
                                                                                                                                                                    -> 'C' {
                                                                                                                                                                        -> 'D' {
                                                                                                                                                                            -> 'E' {
                                                                                                                                                                                -> 'F' {
                                                                                                                                                                                    -> 'G' {
                                                                                                                                                                                        -> 'H' {
                                                                                                                                                                                            -> 'I' {
                                                                                                                                                                                                -> 'J' {
                                                                                                                                                                                                    -> 'K' {
                                                                                                                                                                                                        -> 'L' {
                                                                                                                                                                                                            -> 'M' {
                                                                                                                                                                                                                -> 'N' {
                                                                                                                                                                                                                    -> 'O' {
                                                                                                                                                                                                                        -> 'P' {
                                                                                                                                                                                                                            -> 'Q' {
                                                                                                                                                                                                                                -> 'R' {
                                                                                                                                                                                                                                    -> 'S' {
                                                                                                                                                                                                                                        -> 'T' {
                                                                                                                                                                                                                                            -> 'U' {
                                                                                                                                                                                                                                                -> 'V' {
                                                                                                                                                                                                                                                    -> 'W' {
                                                                                                                                                                                                                                                        -> 'X' {
                                                                                                                                                                                                                                                            -> 'Y' {
                                                                                                                                                                                                                                                                -> 'Z' {
                                                                                                                                                                                                                                                                    -> '.' {
                                                                                                                                                                                                                                                                        return match_error(ctx)
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
                    }
                }
            }
        }
        otherwise {
            return tok_kind
        }
    }
}

fn match_dbl_exponent(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '+' {
            -> '-' {
                ctx[].match_size++
                break
            }
        }
        otherwise {
            break
        }
    }
    if not match_digit(ctx) {
        return TOK_error
    }
    loop while match_digit(ctx) {
        ;
    }
    return match_const_end(ctx, TOK_dbl_const)
}

fn match_dbl_fraction(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
        ;
    }
    if match_char(ctx, 'e') {
        return match_dbl_exponent(ctx)
    }
    else {
        return match_const_end(ctx, TOK_dbl_const)
    }
}

fn match_const(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
        ;
    }
    match get_char(ctx) {
        -> 'l' {
            ctx[].match_size++
            return match_const_end(ctx, TOK_long_const)
        }
        -> 'u' {
            ctx[].match_size++
            if match_char(ctx, 'l') {
                return match_const_end(ctx, TOK_ulong_const)
            }
            else {
                return match_const_end(ctx, TOK_uint_const)
            }
        }
        -> 'e' {
            ctx[].match_size++
            return match_dbl_exponent(ctx)
        }
        -> '.' {
            ctx[].match_size++
            return match_dbl_fraction(ctx)
        }
        otherwise {
            return match_const_end(ctx, TOK_int_const)
        }
    }
}

fn match_identifier(ctx: *struc LexerContext) i32 {
    match ctx[].line[ctx[].match_at] {
        -> 'a' {
            if match_char(ctx, 'n') {
                if match_char(ctx, 'd') {
                    if not match_word(ctx) {
                        return TOK_binop_and
                    }
                }
                elif match_char(ctx, 'y') and not match_word(ctx) {
                    return TOK_key_any
                }
            }
            break
        }
        -> 'b' {
            if match_char(ctx, 'r') {
                if match_chars(ctx, "eak", 3) and not match_word(ctx) {
                    return TOK_key_break
                }
            }
            elif match_chars(ctx, "ool", 3) and not match_word(ctx) {
                return TOK_key_i32
            }
            break
        }
        -> 'c' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "st", 2) and not match_word(ctx) {
                    return TOK_key_cast
                }
            }
            elif match_char(ctx, 'h') {
                if match_chars(ctx, "ar", 2) and not match_word(ctx) {
                    return TOK_key_char
                }
            }
            elif match_chars(ctx, "ontinue", 7) and not match_word(ctx) {
                return TOK_key_continue
            }
            break
        }
        -> 'd' {
            if match_chars(ctx, "ata", 3) and not match_word(ctx) {
                return TOK_key_data
            }
            break
        }
        -> 'e' {
            if match_char(ctx, 'l') {
                if match_char(ctx, 'i') {
                    if match_char(ctx, 'f') and not match_word(ctx) {
                        return TOK_key_elif
                    }
                }
                elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                    return TOK_key_else
                }
            }
            elif match_chars(ctx, "xtrn", 4) and not match_word(ctx) {
                return TOK_key_extrn
            }
            break
        }
        -> 'f' {
            if match_char(ctx, 'n') {
                if not match_word(ctx) {
                    return TOK_key_fn
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_f64
                }
            }
            elif match_chars(ctx, "alse", 4) and not match_word(ctx) {
                return TOK_key_false
            }
            break
        }
        -> 'i' {
            if match_char(ctx, 'f') {
                if not match_word(ctx) {
                    return TOK_key_if
                }
            }
            elif match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return TOK_key_i32
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_i64
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return TOK_key_i8
                }
            }
            elif match_chars(ctx, "mport", 5) and not match_word(ctx) {
                return match_include(ctx, TOK_import_file)
            }
            break
        }
        -> 'j' {
            if match_chars(ctx, "ump", 3) and not match_word(ctx) {
                return TOK_key_jump
            }
            break
        }
        -> 'l' {
            if match_char(ctx, 'o') {
                if match_chars(ctx, "op", 2) and not match_word(ctx) {
                    return TOK_key_loop
                }
            }
            elif match_chars(ctx, "abel", 4) and not match_word(ctx) {
                return TOK_key_label
            }
            break
        }
        -> 'm' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "tch", 3) and not match_word(ctx) {
                    return TOK_key_match
                }
            }
            elif match_chars(ctx, "4_", 2) {
                loop while match_word(ctx) {
                    ;
                }
                return TOK_m4_prefix
            }
            break
        }
        -> 'n' {
            if match_char(ctx, 'o') {
                if match_char(ctx, 'n') {
                    if match_char(ctx, 'e') and not match_word(ctx) {
                        return TOK_key_none
                    }
                }
                elif match_char(ctx, 't') and not match_word(ctx) {
                    return TOK_unop_not
                }
            }
            elif match_chars(ctx, "il", 2) and not match_word(ctx) {
                return TOK_key_false
            }
            break
        }
        -> 'o' {
            if match_char(ctx, 'r') {
                if not match_word(ctx) {
                    return TOK_binop_or
                }
            }
            elif match_chars(ctx, "therwise", 8) and not match_word(ctx) {
                return TOK_key_otherwise
            }
            break
        }
        -> 'p' {
            if match_chars(ctx, "ub", 2) and not match_word(ctx) {
                return TOK_key_pub
            }
            break
        }
        -> 'r' {
            if match_chars(ctx, "eturn", 5) and not match_word(ctx) {
                return TOK_key_return
            }
            break
        }
        -> 's' {
            if match_char(ctx, 'i') {
                if match_chars(ctx, "zeof", 4) and not match_word(ctx) {
                    return TOK_key_sizeof
                }
            }
            elif match_chars(ctx, "tr", 2) {
                if match_char(ctx, 'u') {
                    if match_char(ctx, 'c') and not match_word(ctx) {
                        return TOK_key_struc
                    }
                }
                elif match_chars(ctx, "ing", 3) and not match_word(ctx) {
                    return TOK_key_string
                }
            }
            break
        }
        -> 't' {
            if match_char(ctx, 'h') {
                if match_chars(ctx, "en", 2) and not match_word(ctx) {
                    return TOK_key_then
                }
            }
            elif match_char(ctx, 'y') {
                if match_chars(ctx, "pe", 2) and not match_word(ctx) {
                    return TOK_key_type
                }
            }
            elif match_chars(ctx, "rue", 3) and not match_word(ctx) {
                return TOK_key_true
            }
            break
        }
        -> 'u' {
            if match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return TOK_key_u32
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_u64
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return TOK_key_u8
                }
            }
            elif match_char(ctx, 'n') {
                if match_chars(ctx, "ion", 3) and not match_word(ctx) {
                    return TOK_key_union
                }
            }
            elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                return match_include(ctx, TOK_use_file)
            }
            break
        }
        -> 'w' {
            if match_chars(ctx, "hile", 4) and not match_word(ctx) {
                return TOK_key_while
            }
            break
        }
        otherwise {
            break
        }
    }
    loop while match_word(ctx) {
        ;
    }
    return TOK_identifier
}

fn match_token(ctx: *struc LexerContext) i32 {
    ctx[].match_size = 1
    match ctx[].line[ctx[].match_at] {
        -> '(' {
            return TOK_open_paren
        }
        -> ')' {
            return TOK_close_paren
        }
        -> '{' {
            return TOK_open_brace
        }
        -> '}' {
            return TOK_close_brace
        }
        -> '[' {
            return TOK_open_bracket
        }
        -> ']' {
            return TOK_close_bracket
        }
        -> ',' {
            return TOK_comma_separator
        }
        -> ';' {
            return TOK_semicolon
        }
        -> '@' {
            return TOK_unop_addrof
        }
        -> ':' {
            return TOK_assign_type
        }
        -> '!' {
            return TOK_force_exec
        }
        -> '?' {
            return TOK_ternary_if
        }
        -> '$' {
            return TOK_compound_init
        }
        -> '=' {
            if match_char(ctx, '=') {
                return TOK_binop_eq
            }
            else {
                return TOK_assign
            }
        }
        -> '~' {
            if match_char(ctx, '=') {
                return TOK_binop_ne
            }
            else {
                return TOK_unop_complement
            }
        }
        -> '-' {
            if match_char(ctx, '>') {
                return TOK_match_with
            }
            elif match_char(ctx, '-') {
                return TOK_unop_decr
            }
            elif match_char(ctx, '=') {
                return TOK_assign_subtract
            }
            else {
                return TOK_unop_neg
            }
        }
        -> '+' {
            if match_char(ctx, '+') {
                return TOK_unop_incr
            }
            elif match_char(ctx, '=') {
                return TOK_assign_add
            }
            else {
                return TOK_binop_add
            }
        }
        -> '*' {
            if match_char(ctx, '=') {
                return TOK_assign_multiply
            }
            else {
                return TOK_binop_multiply
            }
        }
        -> '/' {
            if match_char(ctx, '=') {
                return TOK_assign_divide
            }
            else {
                return TOK_binop_divide
            }
        }
        -> '%' {
            if match_char(ctx, '=') {
                return TOK_assign_remainder
            }
            else {
                return TOK_binop_remainder
            }
        }
        -> '&' {
            if match_char(ctx, '=') {
                return TOK_assign_bitand
            }
            else {
                return TOK_binop_bitand
            }
        }
        -> '|' {
            if match_char(ctx, '=') {
                return TOK_assign_bitor
            }
            else {
                return TOK_binop_bitor
            }
        }
        -> '<' {
            if match_char(ctx, '<') {
                if match_char(ctx, '=') {
                    return TOK_assign_shiftleft
                }
                else {
                    return TOK_binop_shiftleft
                }
            }
            elif match_char(ctx, '=') {
                return TOK_binop_le
            }
            else {
                return TOK_binop_lt
            }
        }
        -> '>' {
            if match_char(ctx, '>') {
                if match_char(ctx, '=') {
                    return TOK_assign_shiftright
                }
                else {
                    return TOK_binop_shiftright
                }
            }
            elif match_char(ctx, '=') {
                return TOK_binop_ge
            }
            else {
                return TOK_binop_gt
            }
        }
        -> '^' {
            if match_char(ctx, '=') {
                return TOK_assign_xor
            }
            else {
                return TOK_binop_xor
            }
        }
        -> '.' {
            match get_char(ctx) {
                -> '0' {
                    -> '1' {
                        -> '2' {
                            -> '3' {
                                -> '4' {
                                    -> '5' {
                                        -> '6' {
                                            -> '7' {
                                                -> '8' {
                                                    -> '9' {
                                                        return match_dbl_fraction(ctx)
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
                -> '.' {
                    ctx[].match_size++
                    return TOK_loop_post
                }
                otherwise {
                    return TOK_typeop_member
                }
            }
        }
        -> '\'' {
            return match_char_const(ctx, false)
        }
        -> '"' {
            return match_string_literal(ctx)
        }
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                return match_const(ctx)
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
        -> '_' {
            -> 'a' {
                -> 'b' {
                    -> 'c' {
                        -> 'd' {
                            -> 'e' {
                                -> 'f' {
                                    -> 'g' {
                                        -> 'h' {
                                            -> 'i' {
                                                -> 'j' {
                                                    -> 'k' {
                                                        -> 'l' {
                                                            -> 'm' {
                                                                -> 'n' {
                                                                    -> 'o' {
                                                                        -> 'p' {
                                                                            -> 'q' {
                                                                                -> 'r' {
                                                                                    -> 's' {
                                                                                        -> 't' {
                                                                                            -> 'u' {
                                                                                                -> 'v' {
                                                                                                    -> 'w' {
                                                                                                        -> 'x' {
                                                                                                            -> 'y' {
                                                                                                                -> 'z' {
                                                                                                                    -> 'A' {
                                                                                                                        -> 'B' {
                                                                                                                            -> 'C' {
                                                                                                                                -> 'D' {
                                                                                                                                    -> 'E' {
                                                                                                                                        -> 'F' {
                                                                                                                                            -> 'G' {
                                                                                                                                                -> 'H' {
                                                                                                                                                    -> 'I' {
                                                                                                                                                        -> 'J' {
                                                                                                                                                            -> 'K' {
                                                                                                                                                                -> 'L' {
                                                                                                                                                                    -> 'M' {
                                                                                                                                                                        -> 'N' {
                                                                                                                                                                            -> 'O' {
                                                                                                                                                                                -> 'P' {
                                                                                                                                                                                    -> 'Q' {
                                                                                                                                                                                        -> 'R' {
                                                                                                                                                                                            -> 'S' {
                                                                                                                                                                                                -> 'T' {
                                                                                                                                                                                                    -> 'U' {
                                                                                                                                                                                                        -> 'V' {
                                                                                                                                                                                                            -> 'W' {
                                                                                                                                                                                                                -> 'X' {
                                                                                                                                                                                                                    -> 'Y' {
                                                                                                                                                                                                                        -> 'Z' {
                                                                                                                                                                                                                            return match_identifier(ctx)
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
        -> '#' {
            -> '\n' {
                -> '\r' {
                    return TOK_line_break
                }
            }
        }
        -> ' ' {
            -> '\t' {
                -> '\f' {
                    -> '\v' {
                        return TOK_skip
                    }
                }
            }
        }
        otherwise {
            return TOK_error
        }
    }
}

fn get_match(ctx: *struc LexerContext, match_at: u64, match_size: u64) string {
    smatch: string = ? "" then sdsnew("") else nil
    loop .. while 0 {
        " #@MACRO@:str_resize(smatch, match_size)"
        smatch = sdsgrowzero(smatch, match_size)
    }
    loop i: u64 = 0 while i < match_size .. ++i {
        smatch[i] = ctx[].line[match_at + i]
    }
    return smatch
}

fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32;

fn push_token_info(ctx: *struc LexerContext) u64 {
    token_info: struc TokenInfo = $(cast<i32>(ctx[].match_at), cast<i32>(ctx[].match_size), ctx[].total_linenum)
    vec_push_back(ctx[].errors[].token_infos, token_info)
    return vec_size(ctx[].errors[].token_infos) - 1
}

fn tokenize_file(ctx: *struc LexerContext) i32 {
    smatch: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop linenum: u64 = 1 while read_line(ctx[].fileio, @ctx[].line, @ctx[].line_size) .. ++linenum {
        ctx[].total_linenum++
        is_empty: i32 = true
        loop ctx[].match_at = 0 while ctx[].match_at < ctx[].line_size .. ctx[].match_at += ctx[].match_size {
            match_kind: i32 = match_token(ctx)
            match_tok: u64 = 0
            match match_kind {
                -> TOK_skip {
                    jump Lcontinue
                }
                -> TOK_import_file {
                    -> TOK_import_force {
                        -> TOK_use_file {
                            -> TOK_use_force {
                                loop .. while 0 {
                                    " #@MACRO@:TRY(tokenize_include(ctx, match_kind, linenum, is_empty))"
                                    _errval = tokenize_include(ctx, match_kind, linenum, is_empty)
                                    if _errval ~= 0 {
                                        jump _Lfinally
                                    }
                                }
                            }
                        }
                    }
                }
                jump Lbreak
                -> TOK_line_break {
                    if is_empty or ctx[].paren_depth > 0 {
                        jump Lbreak
                    }
                    jump Lpass
                }
                -> TOK_open_paren {
                    ctx[].paren_depth++
                    jump Lpass
                }
                -> TOK_close_paren {
                    if ctx[].paren_depth == 0 {
                        smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                        info_at: u64 = push_token_info(ctx)
                        loop .. while 0 {
                            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_unmatched_close), "MSG_unmatched_close", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                            _errval = 1
                            jump _Lfinally
                        }
                    }
                    ctx[].paren_depth--
                    jump Lpass
                }
                -> TOK_identifier {
                    -> TOK_string_literal {
                        -> TOK_char_const {
                            -> TOK_int_const {
                                -> TOK_long_const {
                                    -> TOK_uint_const {
                                        -> TOK_ulong_const {
                                            -> TOK_dbl_const {
                                                smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                                                match_tok = make_string_identifier(ctx[].identifiers, @smatch)
                                                jump Lpass
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                -> TOK_m4_prefix {
                    smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_preproc_macro), "MSG_preproc_macro", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                -> TOK_error {
                    smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_invalid_tok), "MSG_invalid_tok", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                otherwise {
                    jump Lpass
                }
            }
            label Lbreak
            break
            label Lcontinue
            continue
            label Lpass
            ;
            info_at: u64 = push_token_info(ctx)
            token: struc Token = $(match_kind, match_tok, info_at)
            vec_push_back(ctx[].p_toks[], token)
            if match_kind == TOK_line_break {
                break
            }
            is_empty = false
        }
    }
    label _Lfinally
    ;
    if smatch {
        " #@MACRO@:str_delete(smatch)"
        sdsfree(smatch)
        smatch = ? nil then sdsnew(nil) else nil
    }
    ;
    return _errval
}

fn find_include(dirnames: vector_t(string), filename: *string) i32 {
    loop i: u64 = 0 while i < vec_size(dirnames) .. ++i {
        dirname: string = ? dirnames[i] then sdsnew(dirnames[i]) else nil
        loop .. while 0 {
            " #@MACRO@:str_append(dirname, *filename)"
            dirname = sdscat(dirname, filename[])
        }
        if find_file(dirname) {
            if dirname ~= filename[] {
                " #@MACRO@:str_move(dirname, *filename)"
                if filename[] {
                    " #@MACRO@:str_delete(*filename)"
                    sdsfree(filename[])
                    filename[] = ? nil then sdsnew(nil) else nil
                }
                ;
                filename[] = dirname
                dirname = ? nil then sdsnew(nil) else nil
            }
            ;
            return true
        }
        if dirname {
            " #@MACRO@:str_delete(dirname)"
            sdsfree(dirname)
            dirname = ? nil then sdsnew(nil) else nil
        }
        ;
    }
    return false
}

fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32 {
    filename: string = ? nil then sdsnew(nil) else nil
    fopen_name: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    line: string;
    line_size: u64;
    match_at: u64;
    match_size: u64;
    filename = get_match(ctx, ctx[].match_at + 1, ctx[].match_size - 2)
    loop .. while 0 {
        " #@MACRO@:str_append(filename, \".etc\")"
        filename = sdscat(filename, ".etc")
    }
    if not is_empty {
        info_at: u64 = push_token_info(ctx)
        match match_tok {
            -> TOK_import_file {
                -> TOK_import_force {
                    loop .. while 0 {
                        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_import_in_line), "MSG_import_in_line", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
            -> TOK_use_file {
                -> TOK_use_force {
                    loop .. while 0 {
                        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_use_in_line), "MSG_use_in_line", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    {
        includename: u64 = stbds_hash_string(filename, 42)
        if (? ((ctx[].includename_set) = stbds_hmget_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof((ctx[].includename_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp) ~= -1 {
            match match_tok {
                -> TOK_import_file {
                    -> TOK_use_file {
                        jump _Lfinally
                    }
                }
                -> TOK_import_force {
                    -> TOK_use_force {
                        break
                    }
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        else {
            set_insert(ctx[].includename_set, includename)
        }
    }
    match match_tok {
        -> TOK_import_file {
            -> TOK_import_force {
                if not find_include(ctx[].p_includedirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_failed_import), "MSG_failed_import", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                break
            }
        }
        -> TOK_use_file {
            -> TOK_use_force {
                if not find_include(ctx[].p_stdlibdirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_failed_use), "MSG_failed_use", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                break
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    line = ctx[].line
    line_size = ctx[].line_size
    match_at = ctx[].match_at
    match_size = ctx[].match_size
    if (ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename ~= fopen_name {
        " #@MACRO@:str_copy(vec_back(ctx->errors->fopen_lines).filename, fopen_name)"
        if fopen_name {
            " #@MACRO@:str_delete(fopen_name)"
            sdsfree(fopen_name)
            fopen_name = ? nil then sdsnew(nil) else nil
        }
        ;
        fopen_name = sdsdup((ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename)
    }
    ;
    loop .. while 0 {
        " #@MACRO@:TRY(open_fread(ctx->fileio, filename))"
        _errval = open_fread(ctx[].fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(1, ctx[].total_linenum + 1, ? nil then sdsnew(nil) else nil)
        if filename ~= fopen_line.filename {
            " #@MACRO@:str_move(filename, fopen_line.filename)"
            if fopen_line.filename {
                " #@MACRO@:str_delete(fopen_line.filename)"
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = filename
            filename = ? nil then sdsnew(nil) else nil
        }
        ;
        vec_push_back(ctx[].errors[].fopen_lines, fopen_line)
    }
    loop .. while 0 {
        " #@MACRO@:TRY(tokenize_file(ctx))"
        _errval = tokenize_file(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(close_fread(ctx->fileio, linenum))"
        _errval = close_fread(ctx[].fileio, linenum)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(linenum + 1, ctx[].total_linenum + 1, ? nil then sdsnew(nil) else nil)
        if fopen_name ~= fopen_line.filename {
            " #@MACRO@:str_move(fopen_name, fopen_line.filename)"
            if fopen_line.filename {
                " #@MACRO@:str_delete(fopen_line.filename)"
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = fopen_name
            fopen_name = ? nil then sdsnew(nil) else nil
        }
        ;
        vec_push_back(ctx[].errors[].fopen_lines, fopen_line)
    }
    ctx[].line = line
    ctx[].line_size = line_size
    ctx[].match_at = match_at
    ctx[].match_size = match_size
    label _Lfinally
    ;
    if filename {
        " #@MACRO@:str_delete(filename)"
        sdsfree(filename)
        filename = ? nil then sdsnew(nil) else nil
    }
    ;
    if fopen_name {
        " #@MACRO@:str_delete(fopen_name)"
        sdsfree(fopen_name)
        fopen_name = ? nil then sdsnew(nil) else nil
    }
    ;
    return _errval
}

pub fn lex_c_code(filename: string, includedirs: *vector_t(string), stdlibdirs: *vector_t(string), errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: *vector_t(struc Token)) i32 {
    ctx: struc LexerContext;
    {
        ctx.errors = errors
        ctx.fileio = fileio
        ctx.identifiers = identifiers
        ctx.includename_set = set_new()
        ctx.p_includedirs = includedirs
        ctx.p_stdlibdirs = stdlibdirs
        ctx.p_toks = tokens
        ctx.paren_depth = 0
        ctx.total_linenum = 0
    }

    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(open_fread(ctx.fileio, filename))"
        _errval = open_fread(ctx.fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(1, 1, ? nil then sdsnew(nil) else nil)
        if filename ~= fopen_line.filename {
            " #@MACRO@:str_copy(filename, fopen_line.filename)"
            if fopen_line.filename {
                " #@MACRO@:str_delete(fopen_line.filename)"
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = sdsdup(filename)
        }
        ;
        vec_push_back(ctx.errors[].fopen_lines, fopen_line)
    }
    loop .. while 0 {
        " #@MACRO@:TRY(tokenize_file(&ctx))"
        _errval = tokenize_file(@ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(close_fread(ctx.fileio, 0))"
        _errval = close_fread(ctx.fileio, 0)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    set_filename(ctx.fileio, filename)
    label _Lfinally
    ;
    set_delete(ctx.includename_set)
    loop i: u64 = 0 while i < vec_size(fileio[].file_reads) .. ++i {
        if fileio[].file_reads[i].filename {
            " #@MACRO@:str_delete(fileio->file_reads[i].filename)"
            sdsfree(fileio[].file_reads[i].filename)
            fileio[].file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
        ;
    }
    vec_delete(fileio[].file_reads)
    ;
    vec_delete(includedirs[])
    ;
    vec_delete(stdlibdirs[])
    ;
    return _errval
}
