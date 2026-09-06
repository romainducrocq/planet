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
type struc FileIoContext;
type struc IdentifierContext;
type struc Token(    tok_kind: i32    , tok: u64    , info_at: u64    )
pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32;


type struc ErrorsContext;
type struc FileRead(    len: u64    , buf: string    , fd: *struc FILE    , filename: string    )
type struc FileIoContext(    errors: *struc ErrorsContext    , fd_write: *struc FILE    , write_buf: string    , filename: string    , file_reads: *struc FileRead    )
pub fn find_file(filename: string) i32;
pub fn get_filename(ctx: *struc FileIoContext) string;
pub fn set_filename(ctx: *struc FileIoContext, filename: string) none;
pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32;
pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32;
pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32;
pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none;
pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32;
pub fn close_fwrite(ctx: *struc FileIoContext) none;
pub fn free_fileio(ctx: *struc FileIoContext) none;
type struc CConst;
type struc CStringLiteral;
type struc CConstInt(    value: i32    )
type struc CConstLong(    value: i64    )
type struc CConstUInt(    value: u32    )
type struc CConstULong(    value: u64    )
type struc CConstDouble(    value: f64    )
type struc CConstChar(    value: i8    )
type struc CConstUChar(    value: u8    )
type union _CConst(    _CConstInt: struc CConstInt    , _CConstLong: struc CConstLong    , _CConstUInt: struc CConstUInt    , _CConstULong: struc CConstULong    , _CConstDouble: struc CConstDouble    , _CConstChar: struc CConstChar    , _CConstUChar: struc CConstUChar    )
type struc CConst(    _ref_count: u64, type: i32    , get: union _CConst    )
pub fn make_CConst(none) *struc CConst;
pub fn make_CConstInt(value: i32) *struc CConst;
pub fn make_CConstLong(value: i64) *struc CConst;
pub fn make_CConstUInt(value: u32) *struc CConst;
pub fn make_CConstULong(value: u64) *struc CConst;
pub fn make_CConstDouble(value: f64) *struc CConst;
pub fn make_CConstChar(value: i8) *struc CConst;
pub fn make_CConstUChar(value: u8) *struc CConst;
pub fn free_CConst(self: **struc CConst) none;
type struc CStringLiteral(    _ref_count: u64, type: i32    , value: *i8    )
pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral;
pub fn free_CStringLiteral(self: **struc CStringLiteral) none;
type struc PairTIdentifierstring_t(key: u64, value: string)
type struc IdentifierContext(    label_count: u32    , var_count: u32    , struct_count: u32    , hash_table: *struc PairTIdentifierstring_t    )
pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64;
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64;
type struc Elementhash_t(key: u64, value: char)
type struc LexerContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , identifiers: *struc IdentifierContext    , line: string    , line_size: u64    , match_at: u64    , match_size: u64    , includename_set: *struc Elementhash_t    , p_includedirs: **string    , p_stdlibdirs: **string    , p_toks: **struc Token    , paren_depth: u64    , total_linenum: u64    )
fn get_char(ctx: *struc LexerContext) char {
    i: u64 = ctx[].match_at + ctx[].match_size
    if i < ctx[].line_size {
        return ctx[].line[i]
    }
    else {
        return 0
    }
}
fn match_char(ctx: *struc LexerContext, c: char) i32 {
    if c == get_char(ctx) {
        ctx[].match_size++
        return 1
    }
    else {
        return 0
    }
}
fn match_chars(ctx: *struc LexerContext, cs: string, n: u64) i32 {
    loop i: u64 = 0 while i < n .. ++i {
        if not match_char(ctx, cs[i]) {
            return 0
        }
    }
    return 1
}
fn match_invert(ctx: *struc LexerContext, c: char) i32 {
    inv: char = get_char(ctx)
    if inv ~= 0 and c ~= inv {
        ctx[].match_size++
        return 1
    }
    else {
        return 0
    }
}
fn match_space(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> ' ' {
            -> '\t' {
                ctx[].match_size++
                return 1
            }
        }
        otherwise {
            return 0
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
        otherwise {
            return 0
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
            return 0
        }
    }
}
fn match_error(ctx: *struc LexerContext) i32 {
    ctx[].match_size++
    return 99
}
fn match_include(ctx: *struc LexerContext, tok_kind: i32) i32 {
    loop while match_space(ctx) {
    }
    if match_char(ctx, '!') {
        match tok_kind {
            -> 95 {
                tok_kind = 96
                break
            }
            -> 97 {
                tok_kind = 98
                break
            }
            otherwise {
                panic_sigabrt("abort", 146, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
            }
        }
        loop while match_space(ctx) {
        }
    }
    if match_char(ctx, '"') {
        ctx[].match_at += ctx[].match_size - 1
        ctx[].match_size = 1
        loop while match_invert(ctx, '"') {
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
                return 87
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
        return 88
    }
    else {
        return match_error(ctx)
    }
}
fn match_string_literal(ctx: *struc LexerContext) i32 {
    tok_kind: i32;
    loop .. while tok_kind == 88 {
        tok_kind = match_char_const(ctx, 1)
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
        return 99
    }
    loop while match_digit(ctx) {
    }
    return match_const_end(ctx, 93)
}
fn match_dbl_fraction(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
    }
    if match_char(ctx, 'e') {
        return match_dbl_exponent(ctx)
    }
    else {
        return match_const_end(ctx, 93)
    }
}
fn match_const(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
    }
    match get_char(ctx) {
        -> 'l' {
            ctx[].match_size++
            return match_const_end(ctx, 90)
        }
        -> 'u' {
            ctx[].match_size++
            if match_char(ctx, 'l') {
                return match_const_end(ctx, 92)
            }
            else {
                return match_const_end(ctx, 91)
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
            return match_const_end(ctx, 89)
        }
    }
}
fn match_identifier(ctx: *struc LexerContext) i32 {
    match ctx[].line[ctx[].match_at] {
        -> 'a' {
            if match_char(ctx, 'n') {
                if match_char(ctx, 'd') {
                    if not match_word(ctx) {
                        return 25
                    }
                }
                elif match_char(ctx, 'y') and not match_word(ctx) {
                    return 60
                }
            }
            break
        }
        -> 'b' {
            if match_char(ctx, 'r') {
                if match_chars(ctx, "eak", 3) and not match_word(ctx) {
                    return 79
                }
            }
            elif match_chars(ctx, "ool", 3) and not match_word(ctx) {
                return 53
            }
            break
        }
        -> 'c' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "st", 2) and not match_word(ctx) {
                    return 68
                }
            }
            elif match_char(ctx, 'h') {
                if match_chars(ctx, "ar", 2) and not match_word(ctx) {
                    return 51
                }
            }
            elif match_chars(ctx, "ontinue", 7) and not match_word(ctx) {
                return 80
            }
            break
        }
        -> 'd' {
            if match_chars(ctx, "ata", 3) and not match_word(ctx) {
                return 82
            }
            break
        }
        -> 'e' {
            if match_char(ctx, 'l') {
                if match_char(ctx, 'i') {
                    if match_char(ctx, 'f') and not match_word(ctx) {
                        return 70
                    }
                }
                elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                    return 71
                }
            }
            elif match_chars(ctx, "xtrn", 4) and not match_word(ctx) {
                return 83
            }
            break
        }
        -> 'f' {
            if match_char(ctx, 'n') {
                if not match_word(ctx) {
                    return 62
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return 56
                }
            }
            elif match_chars(ctx, "alse", 4) and not match_word(ctx) {
                return 85
            }
            break
        }
        -> 'i' {
            if match_char(ctx, 'f') {
                if not match_word(ctx) {
                    return 69
                }
            }
            elif match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return 53
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return 54
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return 55
                }
            }
            elif match_chars(ctx, "mport", 5) and not match_word(ctx) {
                return match_include(ctx, 95)
            }
            break
        }
        -> 'j' {
            if match_chars(ctx, "ump", 3) and not match_word(ctx) {
                return 73
            }
            break
        }
        -> 'l' {
            if match_char(ctx, 'o') {
                if match_chars(ctx, "op", 2) and not match_word(ctx) {
                    return 75
                }
            }
            elif match_chars(ctx, "abel", 4) and not match_word(ctx) {
                return 74
            }
            break
        }
        -> 'm' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "tch", 3) and not match_word(ctx) {
                    return 77
                }
            }
            elif match_chars(ctx, "4_", 2) {
                loop while match_word(ctx) {
                }
                return 94
            }
            break
        }
        -> 'n' {
            if match_char(ctx, 'o') {
                if match_char(ctx, 'n') {
                    if match_char(ctx, 'e') and not match_word(ctx) {
                        return 61
                    }
                }
                elif match_char(ctx, 't') and not match_word(ctx) {
                    return 12
                }
            }
            elif match_chars(ctx, "il", 2) and not match_word(ctx) {
                return 85
            }
            break
        }
        -> 'o' {
            if match_char(ctx, 'r') {
                if not match_word(ctx) {
                    return 26
                }
            }
            elif match_chars(ctx, "therwise", 8) and not match_word(ctx) {
                return 78
            }
            break
        }
        -> 'p' {
            if match_chars(ctx, "ub", 2) and not match_word(ctx) {
                return 81
            }
            break
        }
        -> 'r' {
            if match_chars(ctx, "eturn", 5) and not match_word(ctx) {
                return 67
            }
            break
        }
        -> 's' {
            if match_char(ctx, 'i') {
                if match_chars(ctx, "zeof", 4) and not match_word(ctx) {
                    return 66
                }
            }
            elif match_chars(ctx, "tr", 2) {
                if match_char(ctx, 'u') {
                    if match_char(ctx, 'c') and not match_word(ctx) {
                        return 63
                    }
                }
                elif match_chars(ctx, "ing", 3) and not match_word(ctx) {
                    return 52
                }
            }
            break
        }
        -> 't' {
            if match_char(ctx, 'h') {
                if match_chars(ctx, "en", 2) and not match_word(ctx) {
                    return 72
                }
            }
            elif match_char(ctx, 'y') {
                if match_chars(ctx, "pe", 2) and not match_word(ctx) {
                    return 65
                }
            }
            elif match_chars(ctx, "rue", 3) and not match_word(ctx) {
                return 84
            }
            break
        }
        -> 'u' {
            if match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return 57
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return 58
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return 59
                }
            }
            elif match_char(ctx, 'n') {
                if match_chars(ctx, "ion", 3) and not match_word(ctx) {
                    return 64
                }
            }
            elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                return match_include(ctx, 97)
            }
            break
        }
        -> 'w' {
            if match_chars(ctx, "hile", 4) and not match_word(ctx) {
                return 76
            }
            break
        }
        otherwise {
            break
        }
    }
    loop while match_word(ctx) {
    }
    return 86
}
fn match_token(ctx: *struc LexerContext) i32 {
    ctx[].match_size = 1
    match ctx[].line[ctx[].match_at] {
        -> '(' {
            return 2
        }
        -> ')' {
            return 3
        }
        -> '{' {
            return 4
        }
        -> '}' {
            return 5
        }
        -> '[' {
            return 6
        }
        -> ']' {
            return 7
        }
        -> ',' {
            return 8
        }
        -> ';' {
            return 9
        }
        -> '@' {
            return 13
        }
        -> ':' {
            return 34
        }
        -> '!' {
            return 45
        }
        -> '?' {
            return 46
        }
        -> '$' {
            return 47
        }
        -> '=' {
            if match_char(ctx, '=') {
                return 27
            }
            else {
                return 33
            }
        }
        -> '~' {
            if match_char(ctx, '=') {
                return 28
            }
            else {
                return 10
            }
        }
        -> '-' {
            if match_char(ctx, '>') {
                return 50
            }
            elif match_char(ctx, '-') {
                return 15
            }
            elif match_char(ctx, '=') {
                return 36
            }
            else {
                return 11
            }
        }
        -> '+' {
            if match_char(ctx, '+') {
                return 14
            }
            elif match_char(ctx, '=') {
                return 35
            }
            else {
                return 16
            }
        }
        -> '*' {
            if match_char(ctx, '=') {
                return 37
            }
            else {
                return 17
            }
        }
        -> '/' {
            if match_char(ctx, '=') {
                return 38
            }
            else {
                return 18
            }
        }
        -> '%' {
            if match_char(ctx, '=') {
                return 39
            }
            else {
                return 19
            }
        }
        -> '&' {
            if match_char(ctx, '=') {
                return 40
            }
            else {
                return 20
            }
        }
        -> '|' {
            if match_char(ctx, '=') {
                return 41
            }
            else {
                return 21
            }
        }
        -> '<' {
            if match_char(ctx, '<') {
                if match_char(ctx, '=') {
                    return 43
                }
                else {
                    return 23
                }
            }
            elif match_char(ctx, '=') {
                return 30
            }
            else {
                return 29
            }
        }
        -> '>' {
            if match_char(ctx, '>') {
                if match_char(ctx, '=') {
                    return 44
                }
                else {
                    return 24
                }
            }
            elif match_char(ctx, '=') {
                return 32
            }
            else {
                return 31
            }
        }
        -> '^' {
            if match_char(ctx, '=') {
                return 42
            }
            else {
                return 22
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
                    return 49
                }
                otherwise {
                    return 48
                }
            }
        }
        -> '\'' {
            return match_char_const(ctx, 0)
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
                    return 1
                }
            }
        }
        -> ' ' {
            -> '\t' {
                -> '\f' {
                    -> '\v' {
                        return 0
                    }
                }
            }
        }
        otherwise {
            return 99
        }
    }
}
fn get_match(ctx: *struc LexerContext, match_at: u64, match_size: u64) string {
    match: string = ? "" then sdsnew("") else 0
    loop .. while 0 {
        match = sdsgrowzero(match, match_size)
    }
    loop i: u64 = 0 while i < match_size .. ++i {
        match[i] = ctx[].line[match_at + i]
    }
    return match
}
fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32;
fn push_token_info(ctx: *struc LexerContext) u64 {
    token_info: struc TokenInfo = $(cast<i32>(ctx[].match_at), cast<i32>(ctx[].match_size), ctx[].total_linenum)
    loop .. while 0 {
        (? (not (ctx[].errors[].token_infos) or (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].capacity) then (((ctx[].errors[].token_infos) = stbds_arrgrowf((ctx[].errors[].token_infos), sizeof((ctx[].errors[].token_infos)[]), (1), (0))) and 0) else 0)
        (ctx[].errors[].token_infos)[(cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length++] = (token_info)
    }
    return (? (ctx[].errors[].token_infos) then (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length else 0) - 1
}
fn tokenize_file(ctx: *struc LexerContext) i32 {
    match: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    loop linenum: u64 = 1 while read_line(ctx[].fileio, @ctx[].line, @ctx[].line_size) .. ++linenum {
        ctx[].total_linenum++
        is_empty: i32 = 1
        loop ctx[].match_at = 0 while ctx[].match_at < ctx[].line_size .. ctx[].match_at += ctx[].match_size {
            match_kind: i32 = match_token(ctx)
            match_tok: u64 = 0
            match match_kind {
                -> 0 {
                    jump Lcontinue
                }
                -> 95 {
                    -> 96 {
                        -> 97 {
                            -> 98 {
                                loop .. while 0 {
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
                -> 1 {
                    if is_empty or ctx[].paren_depth > 0 {
                        jump Lbreak
                    }
                    jump Lpass
                }
                -> 2 {
                    ctx[].paren_depth++
                    jump Lpass
                }
                -> 3 {
                    if ctx[].paren_depth == 0 {
                        match = get_match(ctx, ctx[].match_at, ctx[].match_size)
                        info_at: u64 = push_token_info(ctx)
                        loop .. while 0 {
                            ?                             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(307), "307", "", "", match) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 781, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                            _errval = 1
                            jump _Lfinally
                        }
                    }
                    ctx[].paren_depth--
                    jump Lpass
                }
                -> 86 {
                    -> 87 {
                        -> 88 {
                            -> 89 {
                                -> 90 {
                                    -> 91 {
                                        -> 92 {
                                            -> 93 {
                                                match = get_match(ctx, ctx[].match_at, ctx[].match_size)
                                                match_tok = make_string_identifier(ctx[].identifiers, @match)
                                                jump Lpass
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                -> 94 {
                    match = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(306), "306", "", "", match) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 801, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                -> 99 {
                    match = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(301), "301", "", "", match) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 806, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
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
            loop .. while 0 {
                (? (not (ctx[].p_toks[]) or (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].capacity) then (((ctx[].p_toks[]) = stbds_arrgrowf((ctx[].p_toks[]), sizeof((ctx[].p_toks[])[]), (1), (0))) and 0) else 0)
                (ctx[].p_toks[])[(cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length++] = (token)
            }
            if match_kind == 1 {
                break
            }
            is_empty = 0
        }
    }
    label _Lfinally
    ;
    if match {
        sdsfree(match)
        match = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn find_include(dirnames: *string, filename: *string) i32 {
    loop i: u64 = 0 while i < (? (dirnames) then (cast<*struc stbds_array_header>((dirnames)) - 1)[].length else 0) .. ++i {
        dirname: string = ? dirnames[i] then sdsnew(dirnames[i]) else 0
        loop .. while 0 {
            dirname = sdscat(dirname, filename[])
        }
        if find_file(dirname) {
            if dirname ~= filename[] {
                if filename[] {
                    sdsfree(filename[])
                    filename[] = ? 0 then sdsnew(0) else 0
                }
                ;
                filename[] = dirname
                dirname = ? 0 then sdsnew(0) else 0
            }
            ;
            return 1
        }
        if dirname {
            sdsfree(dirname)
            dirname = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    return 0
}
fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32 {
    filename: string = ? 0 then sdsnew(0) else 0
    fopen_name: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    line: string;
    line_size: u64;
    match_at: u64;
    match_size: u64;
    filename = get_match(ctx, ctx[].match_at + 1, ctx[].match_size - 2)
    loop .. while 0 {
        filename = sdscat(filename, ".etc")
    }
    if not is_empty {
        info_at: u64 = push_token_info(ctx)
        match match_tok {
            -> 95 {
                -> 96 {
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(302), "302", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 860, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
            -> 97 {
                -> 98 {
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(303), "303", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 863, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
            otherwise {
                panic_sigabrt("abort", 865, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
            }
        }
    }
    {
        includename: u64 = stbds_hash_string(filename, 42)
        if (? ((ctx[].includename_set) = stbds_hmget_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof(ctx[].includename_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp) ~= -1 {
            match match_tok {
                -> 95 {
                    -> 97 {
                        jump _Lfinally
                    }
                }
                -> 96 {
                    -> 98 {
                        break
                    }
                }
                otherwise {
                    panic_sigabrt("abort", 879, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                }
            }
        }
        else {
            loop .. while 0 {
                (ctx[].includename_set) = stbds_hmput_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof(ctx[].includename_set)[].key, 0)
                (ctx[].includename_set)[(cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp].key = (includename)
                (ctx[].includename_set)[(cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp].value = (0)
            }
        }
    }
    match match_tok {
        -> 95 {
            -> 96 {
                if not find_include(ctx[].p_includedirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(304), "304", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 891, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                break
            }
        }
        -> 97 {
            -> 98 {
                if not find_include(ctx[].p_stdlibdirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_lexer_msg(305), "305", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort", 899, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                break
            }
        }
        otherwise {
            panic_sigabrt("abort", 904, "/home/romain/proj/planet/selfhost/wheelcc/frontend/lexer.c")
        }
    }
    line = ctx[].line
    line_size = ctx[].line_size
    match_at = ctx[].match_at
    match_size = ctx[].match_size
    if (ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename ~= fopen_name {
        if fopen_name {
            sdsfree(fopen_name)
            fopen_name = ? 0 then sdsnew(0) else 0
        }
        ;
        fopen_name = sdsdup((ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename)
    }
    ;
    loop .. while 0 {
        _errval = open_fread(ctx[].fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(1, ctx[].total_linenum + 1, ? 0 then sdsnew(0) else 0)
        if filename ~= fopen_line.filename {
            if fopen_line.filename {
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? 0 then sdsnew(0) else 0
            }
            ;
            fopen_line.filename = filename
            filename = ? 0 then sdsnew(0) else 0
        }
        ;
        loop .. while 0 {
            (? (not (ctx[].errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].capacity) then (((ctx[].errors[].fopen_lines) = stbds_arrgrowf((ctx[].errors[].fopen_lines), sizeof((ctx[].errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
            (ctx[].errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
        }
    }
    loop .. while 0 {
        _errval = tokenize_file(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = close_fread(ctx[].fileio, linenum)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(linenum + 1, ctx[].total_linenum + 1, ? 0 then sdsnew(0) else 0)
        if fopen_name ~= fopen_line.filename {
            if fopen_line.filename {
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? 0 then sdsnew(0) else 0
            }
            ;
            fopen_line.filename = fopen_name
            fopen_name = ? 0 then sdsnew(0) else 0
        }
        ;
        loop .. while 0 {
            (? (not (ctx[].errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].capacity) then (((ctx[].errors[].fopen_lines) = stbds_arrgrowf((ctx[].errors[].fopen_lines), sizeof((ctx[].errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
            (ctx[].errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
        }
    }
    ctx[].line = line
    ctx[].line_size = line_size
    ctx[].match_at = match_at
    ctx[].match_size = match_size
    label _Lfinally
    ;
    if filename {
        sdsfree(filename)
        filename = ? 0 then sdsnew(0) else 0
    }
    ;
    if fopen_name {
        sdsfree(fopen_name)
        fopen_name = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32 
{
    ctx: struc LexerContext;
    {
        ctx.errors = errors
        ctx.fileio = fileio
        ctx.identifiers = identifiers
        ctx.includename_set = 0
        ctx.p_includedirs = includedirs
        ctx.p_stdlibdirs = stdlibdirs
        ctx.p_toks = tokens
        ctx.paren_depth = 0
        ctx.total_linenum = 0
    }
    _errval: i32 = 0
    loop .. while 0 {
        _errval = open_fread(ctx.fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(1, 1, ? 0 then sdsnew(0) else 0)
        if filename ~= fopen_line.filename {
            if fopen_line.filename {
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? 0 then sdsnew(0) else 0
            }
            ;
            fopen_line.filename = sdsdup(filename)
        }
        ;
        loop .. while 0 {
            (? (not (ctx.errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].capacity) then (((ctx.errors[].fopen_lines) = stbds_arrgrowf((ctx.errors[].fopen_lines), sizeof((ctx.errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
            (ctx.errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
        }
    }
    loop .. while 0 {
        _errval = tokenize_file(@ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = close_fread(ctx.fileio, 0)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    set_filename(ctx.fileio, filename)
    label _Lfinally
    ;
    if ctx.includename_set {
        loop .. while 0 {
            cast<none>((? (ctx.includename_set) ~= 0 then stbds_hmfree_func((ctx.includename_set) - 1, sizeof((ctx.includename_set)[])) else cast<none>(0)))
            (ctx.includename_set) = 0
        }
        ctx.includename_set = 0
    }
    ;
    loop i: u64 = 0 while i < (? (fileio[].file_reads) then (cast<*struc stbds_array_header>((fileio[].file_reads)) - 1)[].length else 0) .. ++i {
        if fileio[].file_reads[i].filename {
            sdsfree(fileio[].file_reads[i].filename)
            fileio[].file_reads[i].filename = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    if fileio[].file_reads {
        loop .. while 0 {
            cast<none>((? (fileio[].file_reads) then free((cast<*struc stbds_array_header>((fileio[].file_reads)) - 1)) else cast<none>(0)))
            (fileio[].file_reads) = 0
        }
        fileio[].file_reads = 0
    }
    ;
    if includedirs[] {
        loop .. while 0 {
            cast<none>((? (includedirs[]) then free((cast<*struc stbds_array_header>((includedirs[])) - 1)) else cast<none>(0)))
            (includedirs[]) = 0
        }
        includedirs[] = 0
    }
    ;
    if stdlibdirs[] {
        loop .. while 0 {
            cast<none>((? (stdlibdirs[]) then free((cast<*struc stbds_array_header>((stdlibdirs[])) - 1)) else cast<none>(0)))
            (stdlibdirs[]) = 0
        }
        stdlibdirs[] = 0
    }
    ;
    return _errval
}
