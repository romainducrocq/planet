m4_include(`str2t.plx.m4')m4_dnl
m4_include(`throw.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../frontend/errors.plx.m4')m4_dnl









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


pub fn dbl_to_binary(decimal: f64) u64 {
    binary: u64;
    memcpy(@binary, @decimal, sizeof<u64>)
    return binary
}

pub fn string_to_literal(str_string: string, string_literal: **i8) none {
    loop byte: u64 = 1 while byte < sdslen(str_string) - 1 .. ++byte {
        str_char: char = cast<char>(str_string[byte])
        if str_char == '\\' {
            str_char = cast<char>(str_string[++byte])
            match str_char {
                -> '\'' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 39)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (39)
                        }
                    }
                }
                break
                -> '"' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 34)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (34)
                        }
                    }
                }
                break
                -> '?' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 63)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (63)
                        }
                    }
                }
                break
                -> '\\' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 92)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (92)
                        }
                    }
                }
                break
                -> 'a' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 7)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (7)
                        }
                    }
                }
                break
                -> 'b' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 8)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (8)
                        }
                    }
                }
                break
                -> 'f' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 12)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (12)
                        }
                    }
                }
                break
                -> 'n' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 10)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (10)
                        }
                    }
                }
                break
                -> 'r' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 13)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (13)
                        }
                    }
                }
                break
                -> 't' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 9)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (9)
                        }
                    }
                }
                break
                -> 'v' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 11)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (11)
                        }
                    }
                }
                break
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        else {
            loop .. while 0 {
                "@MACRO@:vec_push_back(*string_literal, (int8_t)str_char)"
                loop .. while 0 {
                    (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                    (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (cast<i8>(str_char))
                }
            }
        }
    }
}

pub fn string_to_char_ascii(str_char: string) i32 {
    c_char: char = cast<char>(str_char[1])
    if c_char == '\\' {
        c_char = cast<char>(str_char[2])
        match c_char {
            -> '\'' {
                return 39
            }
            -> '"' {
                return 34
            }
            -> '?' {
                return 63
            }
            -> '\\' {
                return 92
            }
            -> 'a' {
                return 7
            }
            -> 'b' {
                return 8
            }
            -> 'f' {
                return 12
            }
            -> 'n' {
                return 10
            }
            -> 'r' {
                return 13
            }
            -> 't' {
                return 9
            }
            -> 'v' {
                return 11
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    else {
        return cast<i32>(c_char)
    }
}

fn hex_string_to_long(str_hex: string) i64 {
    end_ptr: string = nil
    value: i64 = strtoimax(str_hex, @end_ptr, 16)
    return value
}

fn string_literal_byte_to_hex(value: i8, str_hex: *string) none {
    byte_hex: [3]char;
    sprintf(byte_hex, "%.2x", cast<u32>(value))
    loop .. while 0 {
        "@MACRO@:str_append(*str_hex, byte_hex)"
        str_hex[] = sdscat(str_hex[], byte_hex)
    }
}

pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 1 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i8 = cast<i8>(hex_string_to_long(str_hex))
    if str_hex {
        "@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 4 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i32 = cast<i32>(hex_string_to_long(str_hex))
    if str_hex {
        "@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 8 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i64 = cast<i64>(hex_string_to_long(str_hex))
    if str_hex {
        "@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_literal_to_const(string_literal: *i8) string {
    string_const: string = ? "" then sdsnew("") else nil
    loop i: u64 = 0 while i < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) .. ++i {
        byte: i8 = string_literal[i]
        match byte {
            -> 39 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\047\")"
                    string_const = sdscat(string_const, "\\047")
                }
            }
            break
            -> 34 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\042\")"
                    string_const = sdscat(string_const, "\\042")
                }
            }
            break
            -> 63 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\077\")"
                    string_const = sdscat(string_const, "\\077")
                }
            }
            break
            -> 92 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\134\")"
                    string_const = sdscat(string_const, "\\134")
                }
            }
            break
            -> 7 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\007\")"
                    string_const = sdscat(string_const, "\\007")
                }
            }
            break
            -> 8 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\010\")"
                    string_const = sdscat(string_const, "\\010")
                }
            }
            break
            -> 12 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\014\")"
                    string_const = sdscat(string_const, "\\014")
                }
            }
            break
            -> 10 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\012\")"
                    string_const = sdscat(string_const, "\\012")
                }
            }
            break
            -> 13 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\013\")"
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            -> 9 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\011\")"
                    string_const = sdscat(string_const, "\\011")
                }
            }
            break
            -> 11 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\013\")"
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            otherwise {
                loop .. while 0 {
                    "@MACRO@:str_push_back(string_const, (char)byte)"
                    loop .. while 0 {
                        "@MACRO@:str_resize(string_const, str_size(string_const) + 1)"
                        string_const = sdsgrowzero(string_const, sdslen(string_const) + 1)
                    }
                    (string_const)[sdslen(string_const) - 1] = cast<char>(byte)
                }
            }
            break
        }
    }
    return string_const
}

pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32 {
    _errval: i32 = 0
    end_ptr: string = nil
    value[] = strtoimax(str_int, @end_ptr, 10)
    if end_ptr == str_int {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtoi), "MSG_failed_strtoi", "", "", str_int) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32 {
    _errval: i32 = 0
    end_ptr: string = nil
    value[] = strtoumax(str_uint, @end_ptr, 10)
    if end_ptr == str_uint {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtou), "MSG_failed_strtou", "", "", str_uint) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32 {
    _errval: i32 = 0
    end_ptr: string = nil
    value[] = strtod(str_dbl, @end_ptr)
    if end_ptr == str_dbl {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtod), "MSG_failed_strtod", "", "", str_dbl) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}
