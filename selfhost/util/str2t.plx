m4_include(`str2t.plx.m4')m4_dnl
m4_include(`throw.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../frontend/errors.plx.m4')m4_dnl

pub fn dbl_to_binary(decimal: f64) u64 {
    binary: u64;
    memcpy(@binary, @decimal, sizeof<u64>)
    return binary
}

pub fn string_to_literal(str_string: string, string_literal: *vector_t(i8)) none {
    loop byte: u64 = 1 while byte < sdslen(str_string) - 1 .. ++byte {
        str_char: char = cast<char>(str_string[byte])
        if str_char == '\\' {
            str_char = cast<char>(str_string[++byte])
            match str_char {
                -> '\'' {
                    vec_push_back(string_literal[], 39)
                }
                break
                -> '"' {
                    vec_push_back(string_literal[], 34)
                }
                break
                -> '?' {
                    vec_push_back(string_literal[], 63)
                }
                break
                -> '\\' {
                    vec_push_back(string_literal[], 92)
                }
                break
                -> 'a' {
                    vec_push_back(string_literal[], 7)
                }
                break
                -> 'b' {
                    vec_push_back(string_literal[], 8)
                }
                break
                -> 'f' {
                    vec_push_back(string_literal[], 12)
                }
                break
                -> 'n' {
                    vec_push_back(string_literal[], 10)
                }
                break
                -> 'r' {
                    vec_push_back(string_literal[], 13)
                }
                break
                -> 't' {
                    vec_push_back(string_literal[], 9)
                }
                break
                -> 'v' {
                    vec_push_back(string_literal[], 11)
                }
                break
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        else {
            loop .. while 0 {
                " #@MACRO@:vec_push_back(*string_literal, (int8_t)str_char)"
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
        " #@MACRO@:str_append(*str_hex, byte_hex)"
        str_hex[] = sdscat(str_hex[], byte_hex)
    }
}

pub fn string_bytes_to_int8(string_literal: vector_t(i8), byte_at: u64) i8 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 1 while byte-- > byte_at {
        if byte < vec_size(string_literal) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i8 = cast<i8>(hex_string_to_long(str_hex))
    if str_hex {
        " #@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_bytes_to_int32(string_literal: vector_t(i8), byte_at: u64) i32 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 4 while byte-- > byte_at {
        if byte < vec_size(string_literal) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i32 = cast<i32>(hex_string_to_long(str_hex))
    if str_hex {
        " #@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_bytes_to_int64(string_literal: vector_t(i8), byte_at: u64) i64 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 8 while byte-- > byte_at {
        if byte < vec_size(string_literal) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i64 = cast<i64>(hex_string_to_long(str_hex))
    if str_hex {
        " #@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_literal_to_const(string_literal: vector_t(i8)) string {
    string_const: string = ? "" then sdsnew("") else nil
    loop i: u64 = 0 while i < vec_size(string_literal) .. ++i {
        byte: i8 = string_literal[i]
        match byte {
            -> 39 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\047\")"
                    string_const = sdscat(string_const, "\\047")
                }
            }
            break
            -> 34 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\042\")"
                    string_const = sdscat(string_const, "\\042")
                }
            }
            break
            -> 63 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\077\")"
                    string_const = sdscat(string_const, "\\077")
                }
            }
            break
            -> 92 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\134\")"
                    string_const = sdscat(string_const, "\\134")
                }
            }
            break
            -> 7 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\007\")"
                    string_const = sdscat(string_const, "\\007")
                }
            }
            break
            -> 8 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\010\")"
                    string_const = sdscat(string_const, "\\010")
                }
            }
            break
            -> 12 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\014\")"
                    string_const = sdscat(string_const, "\\014")
                }
            }
            break
            -> 10 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\012\")"
                    string_const = sdscat(string_const, "\\012")
                }
            }
            break
            -> 13 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\013\")"
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            -> 9 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\011\")"
                    string_const = sdscat(string_const, "\\011")
                }
            }
            break
            -> 11 {
                loop .. while 0 {
                    " #@MACRO@:str_append(string_const, \"\\\\013\")"
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            otherwise {
                loop .. while 0 {
                    " #@MACRO@:str_push_back(string_const, (char)byte)"
                    loop .. while 0 {
                        " #@MACRO@:str_resize(string_const, str_size(string_const) + 1)"
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
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
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
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
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
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtod), "MSG_failed_strtod", "", "", str_dbl) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}
