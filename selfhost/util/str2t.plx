extrn fn strtoimax(nptr: string, endptr: *string, base: i32) i64;
extrn fn strtoumax(nptr: string, endptr: *string, base: i32) u64;
type struc FILE;
extrn fn fclose(stream: *struc FILE) i32;
extrn fn fflush(stream: *struc FILE) i32;
extrn fn fopen(filename: string, mode: string) *struc FILE;
extrn fn fwrite(ptr: *any, size: u64, nmemb: u64, stream: *struc FILE) u64;
extrn fn printf(format: string, arg1: string) i32;
extrn fn snprintf(s: string, n: u64, format: string, arg1: string, arg2: string, arg3: string, arg4: string) i32;
extrn fn sprintf(s: string, format: string, arg1: u32) i32;
extrn fn getline(lineptr: *string, n: *u64, stream: *struc FILE) i64;
extrn fn write(fildes: i32, buf: *any, nbyte: u64) i64;
extrn fn strtod(nptr: string, endptr: *string) f64;
extrn fn strtol(nptr: string, endptr: *string, base: i32) i64;
extrn fn free(ptr: *any) none;
extrn fn malloc(size: u64) *any;
extrn fn realloc(ptr: *any, size: u64) *any;
extrn fn abort(none) none;
extrn fn memcpy(s1: *any, s2: *any, n: u64) *any;
extrn fn memmove(s1: *any, s2: *any, n: u64) *any;
extrn fn memcmp(s1: *any, s2: *any, n: u64) i32;
extrn fn strcmp(s1: string, s2: string) i32;
extrn fn memset(s: *any, c: i32, n: u64) *any;
extrn fn strlen(s: string) u64;
pub fn sdslen(s: string) u64;
pub fn sdsnew(init: string) string;
pub fn sdsdup(s: string) string;
pub fn sdsfree(s: string) none;
pub fn sdsgrowzero(s: string, len: u64) string;
pub fn sdscat(s: string, t: string) string;
pub fn sdsrange(s: string, start: i64, end: i64) none;
pub fn sdsclear(s: string) none;
pub fn sdsfromlong(value: i64) string;
pub fn sdsfromunsignedlong(value: u64) string;
pub fn sdsMakeRoomFor(s: string, addlen: u64) string;
type struc stbds_array_header(    length: u64    , capacity: u64    , hash_table: *any    , temp: i64    )
extrn fn stbds_hash_string(str: string, seed: u64) u64;
extrn fn stbds_arrgrowf(a: *any, elemsize: u64, addlen: u64, min_cap: u64) *any;
extrn fn stbds_hmfree_func(p: *any, elemsize: u64) none;
extrn fn stbds_hmget_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmput_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmdel_key(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32) *any;

type struc FileIoContext;
type struc Pairhash_thash_t(key: u64, value: u64)
type struc FileOpenLine(    linenum: u64    , total_linenum: u64    , filename: string    )
type struc TokenInfo(    tok_pos: i32    , tok_len: i32    , total_linenum: u64    )
type struc ErrorsContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , msg: [1024]char    , is_stdout: i32    , info_at_buf: u64    , info_at_map: *struc Pairhash_thash_t    , fopen_lines: *struc FileOpenLine    , token_infos: *struc TokenInfo    )
pub fn panic_sigabrt(msg: string, line: i32, file: string) none;
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
type struc ErrorsContext;
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: **i8) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: *i8) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;
type struc Token;
type struc FunType;
type struc Pointer;
type struc Array;
type struc Structure;
type struc Type;
type struc CConst;
type struc CUnaryOp;
type struc CBinaryOp;
type struc CStorageClass;
type struc IdentifierContext;
pub fn get_tok_kind_fmt(tok_kind: i32) string;
pub fn get_tok_fmt(ctx: *struc IdentifierContext, token: *struc Token) string;
pub fn get_const_fmt(node: *struc CConst) string;
pub fn get_storage_class_fmt(node: *struc CStorageClass) string;
pub fn get_unop_fmt(node: *struc CUnaryOp) string;
pub fn get_binop_fmt(node: *struc CBinaryOp) string;
pub fn get_assign_fmt(node: *struc CBinaryOp, unop: *struc CUnaryOp) string;
pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string) string;
pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string) string;
pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string) string;
pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string) string;
pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string) string;
pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string) string;
pub fn get_type_fmt(ctx: *struc IdentifierContext, type: *struc Type, type_fmt: *string) string;
pub fn get_fatal_msg(msg: i32) string;
pub fn get_arg_msg(msg: i32) string;
pub fn get_util_msg(msg: i32) string;
pub fn get_lexer_msg(msg: i32) string;
pub fn get_parser_msg(msg: i32) string;
pub fn get_semantic_msg(msg: i32) string;
pub fn dbl_to_binary(decimal: f64) u64 {
    binary: u64;
    memcpy(@binary, @decimal, sizeof<u64>)
    return binary
}
pub fn string_to_literal(str_string: string, string_literal: **i8) none {
    ;
    loop byte: u64 = 1 while byte < sdslen(str_string) - 1 .. ++byte {
        str_char: char = cast<char>(str_string[byte])
        if str_char == '\\' {
            str_char = cast<char>(str_string[++byte])
            match str_char {
                -> '\'' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (39)
                    }
                }
                break
                -> '"' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (34)
                    }
                }
                break
                -> '?' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (63)
                    }
                }
                break
                -> '\\' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (92)
                    }
                }
                break
                -> 'a' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (7)
                    }
                }
                break
                -> 'b' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (8)
                    }
                }
                break
                -> 'f' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (12)
                    }
                }
                break
                -> 'n' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (10)
                    }
                }
                break
                -> 'r' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (13)
                    }
                }
                break
                -> 't' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (9)
                    }
                }
                break
                -> 'v' {
                    loop .. while 0 {
                        (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                        (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (11)
                    }
                }
                break
                otherwise {
                    panic_sigabrt("abort", 59, "/home/romain/proj/planet/selfhost/wheelcc/util/str2t.c")
                }
            }
        }
        else {
            loop .. while 0 {
                (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (cast<i8>(str_char))
            }
        }
    }
}
pub fn string_to_char_ascii(str_char: string) i32 {
    ;
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
                panic_sigabrt("abort", 97, "/home/romain/proj/planet/selfhost/wheelcc/util/str2t.c")
            }
        }
    }
    else {
        return cast<i32>(c_char)
    }
}
fn hex_string_to_long(str_hex: string) i64 {
    end_ptr: string = 0
    value: i64 = strtoimax(str_hex, @end_ptr, 16)
    ;
    return value
}
fn string_literal_byte_to_hex(value: i8, str_hex: *string) none {
    byte_hex: [3]char;
    sprintf(byte_hex, "%.2x", cast<u32>(value))
    loop .. while 0 {
        str_hex[] = sdscat(str_hex[], byte_hex)
    }
}
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8 {
    str_hex: string = ? "" then sdsnew("") else 0
    loop byte: u64 = byte_at + 1 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i8 = cast<i8>(hex_string_to_long(str_hex))
    if str_hex {
        sdsfree(str_hex)
        str_hex = ? 0 then sdsnew(0) else 0
    }
    ;
    return hex_value
}
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32 {
    str_hex: string = ? "" then sdsnew("") else 0
    loop byte: u64 = byte_at + 4 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i32 = cast<i32>(hex_string_to_long(str_hex))
    if str_hex {
        sdsfree(str_hex)
        str_hex = ? 0 then sdsnew(0) else 0
    }
    ;
    return hex_value
}
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64 {
    str_hex: string = ? "" then sdsnew("") else 0
    loop byte: u64 = byte_at + 8 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i64 = cast<i64>(hex_string_to_long(str_hex))
    if str_hex {
        sdsfree(str_hex)
        str_hex = ? 0 then sdsnew(0) else 0
    }
    ;
    return hex_value
}
pub fn string_literal_to_const(string_literal: *i8) string {
    string_const: string = ? "" then sdsnew("") else 0
    loop i: u64 = 0 while i < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) .. ++i {
        byte: i8 = string_literal[i]
        match byte {
            -> 39 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\047")
                }
            }
            break
            -> 34 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\042")
                }
            }
            break
            -> 63 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\077")
                }
            }
            break
            -> 92 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\134")
                }
            }
            break
            -> 7 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\007")
                }
            }
            break
            -> 8 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\010")
                }
            }
            break
            -> 12 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\014")
                }
            }
            break
            -> 10 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\012")
                }
            }
            break
            -> 13 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            -> 9 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\011")
                }
            }
            break
            -> 11 {
                loop .. while 0 {
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            otherwise {
                loop .. while 0 {
                    loop .. while 0 {
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
    end_ptr: string = 0
    value[] = strtoimax(str_int, @end_ptr, 10)
    if end_ptr == str_int {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(203), "203", "", "", str_int) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 205, "/home/romain/proj/planet/selfhost/wheelcc/util/str2t.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32 {
    _errval: i32 = 0
    end_ptr: string = 0
    value[] = strtoumax(str_uint, @end_ptr, 10)
    if end_ptr == str_uint {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(204), "204", "", "", str_uint) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 216, "/home/romain/proj/planet/selfhost/wheelcc/util/str2t.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32 {
    _errval: i32 = 0
    end_ptr: string = 0
    value[] = strtod(str_dbl, @end_ptr)
    if end_ptr == str_dbl {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(205), "205", "", "", str_dbl) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 227, "/home/romain/proj/planet/selfhost/wheelcc/util/str2t.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
