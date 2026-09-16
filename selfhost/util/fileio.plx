m4_include(`fileio.plx.m4')m4_dnl
m4_include(`throw.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../frontend/errors.plx.m4')m4_dnl











m4_define(`Ctx', `TODO')m4_dnl
m4_define(`WRITE_BUF_SIZE', `4096')m4_dnl

pub fn find_file(filename: string) i32 {
    fd: *struc FILE = fopen(filename, "rb")
    if fd {
        fclose(fd)
        return true
    }
    else {
        return false
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
        "@MACRO@:str_copy(filename, ctx->filename)"
        if ctx[].filename {
            "@MACRO@:str_delete(ctx->filename)"
            sdsfree(ctx[].filename)
            ctx[].filename = ? nil then sdsnew(nil) else nil
        }
        ctx[].filename = sdsdup(filename)
    }
}

pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32 {
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) .. ++i {
        if ctx[].file_reads[i].fd {
            n_fopens: u64 = (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - i
            if n_fopens == FOPEN_MAX - 1 {
                ctx[].file_reads[i].len = 0
                free(ctx[].file_reads[i].buf)
                ctx[].file_reads[i].buf = nil
                fclose(ctx[].file_reads[i].fd)
                ctx[].file_reads[i].fd = nil
            }
            break
        }
    }
    file_read: struc FileRead = $(0, nil, nil, ? nil then sdsnew(nil) else nil)
    file_read.fd = fopen(filename, "rb")
    if not file_read.fd or sdslen(filename) >= 4096 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fread), "MSG_failed_fread", "", "", filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if filename ~= file_read.filename {
        "@MACRO@:str_copy(filename, file_read.filename)"
        if file_read.filename {
            "@MACRO@:str_delete(file_read.filename)"
            sdsfree(file_read.filename)
            file_read.filename = ? nil then sdsnew(nil) else nil
        }
        file_read.filename = sdsdup(filename)
    }
    loop .. while 0 {
        "@MACRO@:vec_push_back(ctx->file_reads, file_read)"
        loop .. while 0 {
            (? (not (ctx[].file_reads) or (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].capacity) then (((ctx[].file_reads) = stbds_arrgrowf((ctx[].file_reads), sizeof((ctx[].file_reads)[]), (1), (0))) and 0) else 0)
            (ctx[].file_reads)[(cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length++] = (file_read)
        }
    }
    label _Lfinally
    return _errval
}

pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32 {
    _errval: i32 = 0
    ctx[].fd_write = nil
    ctx[].fd_write = fopen(filename, "wb")
    if not ctx[].fd_write or sdslen(filename) >= 4096 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fwrite), "MSG_failed_fwrite", "", "", filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].write_buf = ? "" then sdsnew("") else nil
    loop .. while 0 {
        "@MACRO@:str_reserve(ctx->write_buf, WRITE_BUF_SIZE)"
        ctx[].write_buf = sdsMakeRoomFor(ctx[].write_buf, WRITE_BUF_SIZE)
    }
    label _Lfinally
    return _errval
}

pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32 {
    line_ssize: i64 = getline(@(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf, @(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len, (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)
    if line_ssize == -1 {
        line = nil
        line_size[] = 0
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len = 0
        free((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf)
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf = nil
        return false
    }
    else {
        line[] = (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf
        line_size[] = cast<u64>(line_ssize)
        return true
    }
}

fn write_chunk(ctx: *struc FileIoContext, buf: string, buf_size: u64) none {
    fwrite(buf, sizeof<char>, buf_size, ctx[].fd_write)
}

pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none {
    loop .. while 0 {
        "@MACRO@:str_append(ctx->write_buf, buf)"
        ctx[].write_buf = sdscat(ctx[].write_buf, buf)
    }
    loop while sdslen(ctx[].write_buf) >= WRITE_BUF_SIZE {
        write_chunk(ctx, ctx[].write_buf, WRITE_BUF_SIZE)
        loop .. while 0 {
            "@MACRO@:str_substr(ctx->write_buf, WRITE_BUF_SIZE, -1)"
            sdsrange(ctx[].write_buf, WRITE_BUF_SIZE, -1)
        }
    }
}

pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32 {
    _errval: i32 = 0
    fclose((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)
    (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd = nil
    if (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename {
        "@MACRO@:str_delete(vec_back(ctx->file_reads).filename)"
        sdsfree((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename)
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename = ? nil then sdsnew(nil) else nil
    }
    loop .. while 0 {
        "@MACRO@:vec_pop_back(ctx->file_reads)"
        ((cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length--)
    }
    if not ((? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) == 0) and not (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd {
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd = fopen((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename, "rb")
        if not (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fread), "MSG_failed_fread", "", "", (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop i: u64 = 0 while i < linenum .. ++i {
            if getline(@(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf, @(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len, (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd) == -1 {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fread), "MSG_failed_fread", "", "", (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
    }
    label _Lfinally
    return _errval
}

pub fn close_fwrite(ctx: *struc FileIoContext) none {
    write_chunk(ctx, ctx[].write_buf, sdslen(ctx[].write_buf))
    loop .. while 0 {
        "@MACRO@:str_clear(ctx->write_buf)"
        sdsclear(ctx[].write_buf)
    }
    fclose(ctx[].fd_write)
    ctx[].fd_write = nil
}

pub fn free_fileio(ctx: *struc FileIoContext) none {
    loop i: u64 = 0 while i < (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) .. ++i {
        file_read: *struc FileRead = @ctx[].file_reads[i]
        if file_read[].buf ~= nil {
            free(file_read[].buf)
            file_read[].buf = nil
        }
        if file_read[].fd ~= nil {
            fclose(file_read[].fd)
            file_read[].fd = nil
        }
    }
    if ctx[].fd_write ~= nil {
        fclose(ctx[].fd_write)
        ctx[].fd_write = nil
    }
}
