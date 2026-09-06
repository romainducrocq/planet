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
pub fn find_file(filename: string) i32 {
    fd: *struc FILE = fopen(filename, "rb")
    if fd {
        fclose(fd)
        return 1
    }
    else {
        return 0
    }
}
pub fn get_filename(ctx: *struc FileIoContext) string {
    if not ((? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) == 0) {
        return (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename
    }
    else {
        return ctx[].filename
    }
}
pub fn set_filename(ctx: *struc FileIoContext, filename: string) none {
    if filename ~= ctx[].filename {
        if ctx[].filename {
            sdsfree(ctx[].filename)
            ctx[].filename = ? 0 then sdsnew(0) else 0
        }
        ;
        ctx[].filename = sdsdup(filename)
    }
    ;
}
pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32 {
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) .. ++i {
        if ctx[].file_reads[i].fd {
            n_fopens: u64 = (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - i
            ;
            if n_fopens == 8 - 1 {
                ctx[].file_reads[i].len = 0
                free(ctx[].file_reads[i].buf)
                ctx[].file_reads[i].buf = 0
                fclose(ctx[].file_reads[i].fd)
                ctx[].file_reads[i].fd = 0
            }
            break
        }
    }
    file_read: struc FileRead = $(0, 0, 0, ? 0 then sdsnew(0) else 0)
    file_read.fd = fopen(filename, "rb")
    if not file_read.fd or sdslen(filename) >= 4096 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(201), "201", "", "", filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort", 58, "/home/romain/proj/planet/selfhost/wheelcc/util/fileio.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if filename ~= file_read.filename {
        if file_read.filename {
            sdsfree(file_read.filename)
            file_read.filename = ? 0 then sdsnew(0) else 0
        }
        ;
        file_read.filename = sdsdup(filename)
    }
    ;
    loop .. while 0 {
        (? (not (ctx[].file_reads) or (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].capacity) then (((ctx[].file_reads) = stbds_arrgrowf((ctx[].file_reads), sizeof((ctx[].file_reads)[]), (1), (0))) and 0) else 0)
        (ctx[].file_reads)[(cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length++] = (file_read)
    }
    label _Lfinally
    ;
    return _errval
}
pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32 {
    _errval: i32 = 0
    ;
    ctx[].fd_write = 0
    ctx[].fd_write = fopen(filename, "wb")
    if not ctx[].fd_write or sdslen(filename) >= 4096 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(202), "202", "", "", filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort", 73, "/home/romain/proj/planet/selfhost/wheelcc/util/fileio.c")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].write_buf = ? "" then sdsnew("") else 0
    loop .. while 0 {
        ctx[].write_buf = sdsMakeRoomFor(ctx[].write_buf, 4096)
    }
    label _Lfinally
    ;
    return _errval
}
pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32 {
    line_ssize: i64 =     getline(@(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf, @(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len, (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)
    if line_ssize == -1 {
        line = 0
        line_size[] = 0
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len = 0
        free((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf)
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf = 0
        return 0
    }
    else {
        line[] = (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf
        line_size[] = cast<u64>(line_ssize)
        return 1
    }
}
fn write_chunk(ctx: *struc FileIoContext, buf: string, buf_size: u64) none {
    fwrite(buf, sizeof<char>, buf_size, ctx[].fd_write)
}
pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none {
    loop .. while 0 {
        ctx[].write_buf = sdscat(ctx[].write_buf, buf)
    }
    loop while sdslen(ctx[].write_buf) >= 4096 {
        write_chunk(ctx, ctx[].write_buf, 4096)
        sdsrange(ctx[].write_buf, 4096, -1)
    }
}
pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32 {
    _errval: i32 = 0
    fclose((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)
    (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd = 0
    if (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename {
        sdsfree((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename)
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename = ? 0 then sdsnew(0) else 0
    }
    ;
    ((cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length--)
    if not ((? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) == 0) and not (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd {
        ;
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd = fopen((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename, "rb")
        if not (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(201), "201", "", "", (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort", 123, "/home/romain/proj/planet/selfhost/wheelcc/util/fileio.c")
                _errval = 1
                jump _Lfinally
            }
        }
        loop i: u64 = 0 while i < linenum .. ++i {
            if getline(@(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf, @(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len, (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)             == -1 {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_util_msg(201), "201", "", "", (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort", 128, "/home/romain/proj/planet/selfhost/wheelcc/util/fileio.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
pub fn close_fwrite(ctx: *struc FileIoContext) none {
    write_chunk(ctx, ctx[].write_buf, sdslen(ctx[].write_buf))
    sdsclear(ctx[].write_buf)
    fclose(ctx[].fd_write)
    ctx[].fd_write = 0
}
pub fn free_fileio(ctx: *struc FileIoContext) none {
    loop i: u64 = 0 while i < (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) .. ++i {
        file_read: *struc FileRead = @ctx[].file_reads[i]
        if file_read[].buf ~= 0 {
            free(file_read[].buf)
            file_read[].buf = 0
        }
        if file_read[].fd ~= 0 {
            fclose(file_read[].fd)
            file_read[].fd = 0
        }
    }
    if ctx[].fd_write ~= 0 {
        fclose(ctx[].fd_write)
        ctx[].fd_write = 0
    }
}
