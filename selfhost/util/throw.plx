m4_include(`fileio.plx.m4')m4_dnl
m4_include(`throw.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl






type struc ErrorsContext;

type struc FileRead(len: u64, buf: string, fd: *struc FILE, filename: string)

type struc FileIoContext(errors: *struc ErrorsContext, fd_write: *struc FILE, write_buf: string, filename: string, file_reads: *struc FileRead)

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
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`ESC', `27')m4_dnl
m4_define(`ESC_RESET_SIZE', `4')m4_dnl
m4_define(`ESC_BOLD_SIZE', `4')m4_dnl
m4_define(`ESC_RED_SIZE', `7')m4_dnl
esc_reset: [5]char = $(ESC, '[', '0', 'm', 0)
esc_bold: [5]char = $(ESC, '[', '1', 'm', 0)
esc_red: [8]char = $(ESC, '[', '0', ';', '3', '1', 'm', 0)

pub fn panic_sigabrt(msg: string) none {
    fflush(nil)
    {
        stderr_buf: string = ? "" then sdsnew("") else nil
        stderr_buf_size: u64 = strlen("internal error: \n") + ESC_RED_SIZE + ESC_RESET_SIZE + strlen(msg)
        loop .. while 0 {
            "@MACRO@:str_reserve(stderr_buf, stderr_buf_size)"
            stderr_buf = sdsMakeRoomFor(stderr_buf, stderr_buf_size)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_red)"
            stderr_buf = sdscat(stderr_buf, esc_red)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"internal error:\")"
            stderr_buf = sdscat(stderr_buf, "internal error:")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_reset)"
            stderr_buf = sdscat(stderr_buf, esc_reset)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \" \")"
            stderr_buf = sdscat(stderr_buf, " ")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, msg)"
            stderr_buf = sdscat(stderr_buf, msg)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"\\n\")"
            stderr_buf = sdscat(stderr_buf, "\n")
        }
        write(STDERR_FILENO, stderr_buf, sdslen(stderr_buf))
        if stderr_buf {
            "@MACRO@:str_delete(stderr_buf)"
            sdsfree(stderr_buf)
            stderr_buf = ? nil then sdsnew(nil) else nil
        }
    }
    abort()
}

pub fn raise_init_error(ctx: *struc ErrorsContext) none {
    if ctx[].is_stdout {
        printf("%s", "\n")
        fflush(nil)
    }
    stderr_buf: string = ? "" then sdsnew("") else nil
    stderr_buf_size: u64 = strlen("error: \n") + ESC_RED_SIZE + ESC_RESET_SIZE + strlen(ctx[].msg)
    loop .. while 0 {
        "@MACRO@:str_reserve(stderr_buf, stderr_buf_size)"
        stderr_buf = sdsMakeRoomFor(stderr_buf, stderr_buf_size)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, esc_red)"
        stderr_buf = sdscat(stderr_buf, esc_red)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \"error:\")"
        stderr_buf = sdscat(stderr_buf, "error:")
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, esc_reset)"
        stderr_buf = sdscat(stderr_buf, esc_reset)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \" \")"
        stderr_buf = sdscat(stderr_buf, " ")
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, ctx->msg)"
        stderr_buf = sdscat(stderr_buf, ctx[].msg)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \"\\n\")"
        stderr_buf = sdscat(stderr_buf, "\n")
    }
    write(STDERR_FILENO, stderr_buf, sdslen(stderr_buf))
    if stderr_buf {
        "@MACRO@:str_delete(stderr_buf)"
        sdsfree(stderr_buf)
        stderr_buf = ? nil then sdsnew(nil) else nil
    }
}

pub fn raise_base_error(ctx: *struc ErrorsContext) none {
    free_fileio(ctx[].fileio)
    filename: string = get_filename(ctx[].fileio)
    if not filename {
        filename = ""
    }
    if ctx[].is_stdout {
        printf("%s", "\n")
        fflush(nil)
    }
    stderr_buf: string = ? "" then sdsnew("") else nil
    stderr_buf_size: u64 = strlen(":\nerror: \n") + ESC_BOLD_SIZE + strlen(filename) + ESC_RESET_SIZE + ESC_RED_SIZE + ESC_RESET_SIZE + strlen(ctx[].msg)
    loop .. while 0 {
        "@MACRO@:str_reserve(stderr_buf, stderr_buf_size)"
        stderr_buf = sdsMakeRoomFor(stderr_buf, stderr_buf_size)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, esc_bold)"
        stderr_buf = sdscat(stderr_buf, esc_bold)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, filename)"
        stderr_buf = sdscat(stderr_buf, filename)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \":\")"
        stderr_buf = sdscat(stderr_buf, ":")
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, esc_reset)"
        stderr_buf = sdscat(stderr_buf, esc_reset)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \"\\n\")"
        stderr_buf = sdscat(stderr_buf, "\n")
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, esc_red)"
        stderr_buf = sdscat(stderr_buf, esc_red)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \"error:\")"
        stderr_buf = sdscat(stderr_buf, "error:")
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, esc_reset)"
        stderr_buf = sdscat(stderr_buf, esc_reset)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \" \")"
        stderr_buf = sdscat(stderr_buf, " ")
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, ctx->msg)"
        stderr_buf = sdscat(stderr_buf, ctx[].msg)
    }
    loop .. while 0 {
        "@MACRO@:str_append(stderr_buf, \"\\n\")"
        stderr_buf = sdscat(stderr_buf, "\n")
    }
    write(STDERR_FILENO, stderr_buf, sdslen(stderr_buf))
    if stderr_buf {
        "@MACRO@:str_delete(stderr_buf)"
        sdsfree(stderr_buf)
        stderr_buf = ? nil then sdsnew(nil) else nil
    }
}

fn get_token_linenum(ctx: *struc ErrorsContext, total_linenum: u64) u64 {
    loop i: u64 = 0 while i < (? (ctx[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].fopen_lines)) - 1)[].length else 0) - 1 .. ++i {
        if total_linenum < ctx[].fopen_lines[i + 1].total_linenum {
            set_filename(ctx[].fileio, ctx[].fopen_lines[i].filename)
            return total_linenum - ctx[].fopen_lines[i].total_linenum + ctx[].fopen_lines[i].linenum
        }
    }
    set_filename(ctx[].fileio, (ctx[].fopen_lines)[(? (ctx[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].fopen_lines)) - 1)[].length else 0) - 1].filename)
    return total_linenum - (ctx[].fopen_lines)[(? (ctx[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].fopen_lines)) - 1)[].length else 0) - 1].total_linenum + (ctx[].fopen_lines)[(? (ctx[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].fopen_lines)) - 1)[].length else 0) - 1].linenum
}

pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none {
    token_info: *struc TokenInfo = @ctx[].errors[].token_infos[info_at]
    tok_linenum: u64 = get_token_linenum(ctx, token_info[].total_linenum)
    free_fileio(ctx[].fileio)
    filename: string = get_filename(ctx[].fileio)
    line: string = ? nil then sdsnew(nil) else nil
    {
        len: u64 = 0
        buf: string = nil
        fd: *struc FILE = fopen(filename, "rb")
        if not fd {
            raise_base_error(ctx)
            return none
        }
        loop i: u64 = 0 while i < tok_linenum .. ++i {
            if getline(@buf, @len, fd) == -1 {
                free(buf)
                fclose(fd)
                buf = nil
                fd = nil
                raise_base_error(ctx)
                return none
            }
        }
        line = ? buf then sdsnew(buf) else nil
        free(buf)
        fclose(fd)
        buf = nil
        fd = nil
        if (line)[sdslen(line) - 1] == '\n' {
            sdsrange(line, 0, -2)
        }
    }
    if ctx[].is_stdout {
        printf("%s", "\n")
        fflush(nil)
    }
    {
        tok_overline: string = ? "" then sdsnew("") else nil
        tok_pos: i32 = 1
        if token_info[].tok_pos >= 0 {
            tok_pos += token_info[].tok_pos
            if token_info[].tok_len > 1 {
                loop .. while 0 {
                    "@MACRO@:str_resize(tok_overline, token_info->tok_len - 1)"
                    tok_overline = sdsgrowzero(tok_overline, token_info[].tok_len - 1)
                }
                loop i: u64 = 0 while i < sdslen(tok_overline) .. ++i {
                    tok_overline[i] = '~'
                }
            }
        }
        pad_tok: string = ? "" then sdsnew("") else nil
        pad_linenum: string = ? "" then sdsnew("") else nil
        strto_pos: string = ? (tok_pos) > 0 then sdsfromunsignedlong(cast<u64>((tok_pos))) else sdsfromlong(cast<i64>((tok_pos)))
        strto_linenum: string = ? (tok_linenum) > 0 then sdsfromunsignedlong(cast<u64>((tok_linenum))) else sdsfromlong(cast<i64>((tok_linenum)))
        loop .. while 0 {
            "@MACRO@:str_resize(pad_tok, tok_pos - 1)"
            pad_tok = sdsgrowzero(pad_tok, tok_pos - 1)
        }
        loop i: u64 = 0 while i < sdslen(pad_tok) .. ++i {
            pad_tok[i] = ' '
        }
        loop .. while 0 {
            "@MACRO@:str_resize(pad_linenum, str_size(strto_linenum))"
            pad_linenum = sdsgrowzero(pad_linenum, sdslen(strto_linenum))
        }
        loop i: u64 = 0 while i < sdslen(pad_linenum) .. ++i {
            pad_linenum[i] = ' '
        }
        stderr_buf: string = ? "" then sdsnew("") else nil
        stderr_buf_size: u64 = strlen(":::\nerror: \nat line : v\n        | \n") + ESC_BOLD_SIZE + strlen(filename) + sdslen(strto_linenum) + sdslen(strto_pos) + ESC_RESET_SIZE + ESC_RED_SIZE + ESC_RESET_SIZE + strlen(ctx[].msg) + sdslen(strto_linenum) + ESC_RED_SIZE + sdslen(pad_tok) + sdslen(tok_overline) + ESC_RESET_SIZE + sdslen(pad_linenum) + ESC_BOLD_SIZE + sdslen(line) + ESC_RESET_SIZE
        loop .. while 0 {
            "@MACRO@:str_reserve(stderr_buf, stderr_buf_size)"
            stderr_buf = sdsMakeRoomFor(stderr_buf, stderr_buf_size)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_bold)"
            stderr_buf = sdscat(stderr_buf, esc_bold)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, filename)"
            stderr_buf = sdscat(stderr_buf, filename)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \":\")"
            stderr_buf = sdscat(stderr_buf, ":")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, strto_linenum)"
            stderr_buf = sdscat(stderr_buf, strto_linenum)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \":\")"
            stderr_buf = sdscat(stderr_buf, ":")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, strto_pos)"
            stderr_buf = sdscat(stderr_buf, strto_pos)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \":\")"
            stderr_buf = sdscat(stderr_buf, ":")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_reset)"
            stderr_buf = sdscat(stderr_buf, esc_reset)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"\\n\")"
            stderr_buf = sdscat(stderr_buf, "\n")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_red)"
            stderr_buf = sdscat(stderr_buf, esc_red)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"error:\")"
            stderr_buf = sdscat(stderr_buf, "error:")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_reset)"
            stderr_buf = sdscat(stderr_buf, esc_reset)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \" \")"
            stderr_buf = sdscat(stderr_buf, " ")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, ctx->msg)"
            stderr_buf = sdscat(stderr_buf, ctx[].msg)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"\\n\")"
            stderr_buf = sdscat(stderr_buf, "\n")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"at line \")"
            stderr_buf = sdscat(stderr_buf, "at line ")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, strto_linenum)"
            stderr_buf = sdscat(stderr_buf, strto_linenum)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \": \")"
            stderr_buf = sdscat(stderr_buf, ": ")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_red)"
            stderr_buf = sdscat(stderr_buf, esc_red)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, pad_tok)"
            stderr_buf = sdscat(stderr_buf, pad_tok)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"v\")"
            stderr_buf = sdscat(stderr_buf, "v")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, tok_overline)"
            stderr_buf = sdscat(stderr_buf, tok_overline)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_reset)"
            stderr_buf = sdscat(stderr_buf, esc_reset)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"\\n\")"
            stderr_buf = sdscat(stderr_buf, "\n")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"        \")"
            stderr_buf = sdscat(stderr_buf, "        ")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, pad_linenum)"
            stderr_buf = sdscat(stderr_buf, pad_linenum)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"| \")"
            stderr_buf = sdscat(stderr_buf, "| ")
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_bold)"
            stderr_buf = sdscat(stderr_buf, esc_bold)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, line)"
            stderr_buf = sdscat(stderr_buf, line)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, esc_reset)"
            stderr_buf = sdscat(stderr_buf, esc_reset)
        }
        loop .. while 0 {
            "@MACRO@:str_append(stderr_buf, \"\\n\")"
            stderr_buf = sdscat(stderr_buf, "\n")
        }
        write(STDERR_FILENO, stderr_buf, sdslen(stderr_buf))
        if pad_tok {
            "@MACRO@:str_delete(pad_tok)"
            sdsfree(pad_tok)
            pad_tok = ? nil then sdsnew(nil) else nil
        }
        if pad_linenum {
            "@MACRO@:str_delete(pad_linenum)"
            sdsfree(pad_linenum)
            pad_linenum = ? nil then sdsnew(nil) else nil
        }
        if strto_linenum {
            "@MACRO@:str_delete(strto_linenum)"
            sdsfree(strto_linenum)
            strto_linenum = ? nil then sdsnew(nil) else nil
        }
        if strto_pos {
            "@MACRO@:str_delete(strto_pos)"
            sdsfree(strto_pos)
            strto_pos = ? nil then sdsnew(nil) else nil
        }
        if tok_overline {
            "@MACRO@:str_delete(tok_overline)"
            sdsfree(tok_overline)
            tok_overline = ? nil then sdsnew(nil) else nil
        }
        if stderr_buf {
            "@MACRO@:str_delete(stderr_buf)"
            sdsfree(stderr_buf)
            stderr_buf = ? nil then sdsnew(nil) else nil
        }
    }
    if line {
        "@MACRO@:str_delete(line)"
        sdsfree(line)
        line = ? nil then sdsnew(nil) else nil
    }
}
