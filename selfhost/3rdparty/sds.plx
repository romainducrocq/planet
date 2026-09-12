m4_define(`sds', `TODO')m4_dnl
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
extrn fn strtoimax(nptr: string, endptr: *string, base: i32) i64;
extrn fn strtoumax(nptr: string, endptr: *string, base: i32) u64;
m4_define(`bool', `TODO')m4_dnl
m4_define(`int8_t', `TODO')m4_dnl
m4_define(`int32_t', `TODO')m4_dnl
m4_define(`int64_t', `TODO')m4_dnl
m4_define(`uint8_t', `TODO')m4_dnl
m4_define(`uint32_t', `TODO')m4_dnl
m4_define(`uint64_t', `TODO')m4_dnl
m4_define(`FOPEN_MAX', `8')m4_dnl
type struc FILE;
extrn fn fclose(stream: *struc FILE) i32;
extrn fn fflush(stream: *struc FILE) i32;
extrn fn fopen(filename: string, mode: string) *struc FILE;
extrn fn fwrite(ptr: *any, size: u64, nmemb: u64, stream: *struc FILE) u64;
extrn fn printf(format: string, arg1: string) i32;
extrn fn snprintf(s: string, n: u64, format: string, arg1: string, arg2: string, arg3: string, arg4: string) i32;
extrn fn sprintf(s: string, format: string, arg1: u32) i32;
m4_define(`STDERR_FILENO', `2')m4_dnl
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

type struc sdshdr5(flags: u8)

type struc sdshdr8(len: u8, alloc: u8, flags: u8)

type struc sdshdr32(len: u32, alloc: u32, flags: u8)

type struc sdshdr64(len: u64, alloc: u64, flags: u8)

m4_define(`SDS_TYPE_5', `0')m4_dnl
m4_define(`SDS_TYPE_8', `1')m4_dnl
m4_define(`SDS_TYPE_32', `3')m4_dnl
m4_define(`SDS_TYPE_64', `4')m4_dnl
m4_define(`SDS_TYPE_MASK', `7')m4_dnl
m4_define(`SDS_TYPE_BITS', `3')m4_dnl
m4_define(`SDS_HDR_VAR', `TODO')m4_dnl
m4_define(`SDS_HDR', `TODO')m4_dnl
m4_define(`SDS_TYPE_5_LEN', `TODO')m4_dnl
pub SDS_NOINIT: string = "SDS_NOINIT"

pub fn sdslen(s: string) u64 {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            return ((flags) >> SDS_TYPE_BITS)
        }
        -> SDS_TYPE_8 {
            return (cast<*struc sdshdr8>(((s) - (sizeof<struc sdshdr8>))))[].len
        }
        -> SDS_TYPE_32 {
            return (cast<*struc sdshdr32>(((s) - (sizeof<struc sdshdr32>))))[].len
        }
        -> SDS_TYPE_64 {
            return (cast<*struc sdshdr64>(((s) - (sizeof<struc sdshdr64>))))[].len
        }
    }
    return 0
}

fn sdsavail(s: string) u64 {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            return 0
        }
        -> SDS_TYPE_8 {
            sh: *struc sdshdr8 = cast<*any>(((s) - (sizeof<struc sdshdr8>)))
            return sh[].alloc - sh[].len
        }
        -> SDS_TYPE_32 {
            sh: *struc sdshdr32 = cast<*any>(((s) - (sizeof<struc sdshdr32>)))
            return sh[].alloc - sh[].len
        }
        -> SDS_TYPE_64 {
            sh: *struc sdshdr64 = cast<*any>(((s) - (sizeof<struc sdshdr64>)))
            return sh[].alloc - sh[].len
        }
    }
    return 0
}

fn sdssetlen(s: string, newlen: u64) none {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            fp: *u8 = (cast<*u8>(s)) - 1
            fp[] = SDS_TYPE_5 | (newlen << SDS_TYPE_BITS)
        }
        break
        -> SDS_TYPE_8 {
            (cast<*struc sdshdr8>(((s) - (sizeof<struc sdshdr8>))))[].len = newlen
        }
        break
        -> SDS_TYPE_32 {
            (cast<*struc sdshdr32>(((s) - (sizeof<struc sdshdr32>))))[].len = newlen
        }
        break
        -> SDS_TYPE_64 {
            (cast<*struc sdshdr64>(((s) - (sizeof<struc sdshdr64>))))[].len = newlen
        }
        break
    }
}

fn sdssetalloc(s: string, newlen: u64) none {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            break
        }
        -> SDS_TYPE_8 {
            (cast<*struc sdshdr8>(((s) - (sizeof<struc sdshdr8>))))[].alloc = newlen
        }
        break
        -> SDS_TYPE_32 {
            (cast<*struc sdshdr32>(((s) - (sizeof<struc sdshdr32>))))[].alloc = newlen
        }
        break
        -> SDS_TYPE_64 {
            (cast<*struc sdshdr64>(((s) - (sizeof<struc sdshdr64>))))[].alloc = newlen
        }
        break
    }
}

fn sdsHdrSize(stype: char) i32 {
    match stype & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            return sizeof<struc sdshdr5>
        }
        -> SDS_TYPE_8 {
            return sizeof<struc sdshdr8>
        }
        -> SDS_TYPE_32 {
            return sizeof<struc sdshdr32>
        }
        -> SDS_TYPE_64 {
            return sizeof<struc sdshdr64>
        }
    }
    return 0
}

fn sdsReqType(string_size: u64) char {
    if string_size < 1 << 5 {
        return SDS_TYPE_5
    }
    if string_size < 1 << 8 {
        return SDS_TYPE_8
    }
    if string_size < 1l << 32 {
        return SDS_TYPE_32
    }
    return SDS_TYPE_64
}

fn sdsnewlen(init: *any, initlen: u64) string {
    sh: *any;
    s: string;
    stype: char = sdsReqType(initlen)
    if stype == SDS_TYPE_5 and initlen == 0 {
        stype = SDS_TYPE_8
    }
    hdrlen: i32 = sdsHdrSize(stype)
    fp: *u8;
    sh = malloc(hdrlen + initlen + 1)
    if sh == 0 {
        return 0
    }
    if init == SDS_NOINIT {
        init = 0
    }
    elif not init {
        memset(sh, 0, hdrlen + initlen + 1)
    }
    s = cast<string>(sh) + hdrlen
    fp = (cast<*u8>(s)) - 1
    match stype {
        -> SDS_TYPE_5 {
            fp[] = stype | (initlen << SDS_TYPE_BITS)
            break
        }
        -> SDS_TYPE_8 {
            sh: *struc sdshdr8 = cast<*any>(((s) - (sizeof<struc sdshdr8>)))
            sh[].len = initlen
            sh[].alloc = initlen
            fp[] = stype
            break
        }
        -> SDS_TYPE_32 {
            sh: *struc sdshdr32 = cast<*any>(((s) - (sizeof<struc sdshdr32>)))
            sh[].len = initlen
            sh[].alloc = initlen
            fp[] = stype
            break
        }
        -> SDS_TYPE_64 {
            sh: *struc sdshdr64 = cast<*any>(((s) - (sizeof<struc sdshdr64>)))
            sh[].len = initlen
            sh[].alloc = initlen
            fp[] = stype
            break
        }
    }
    if initlen and init {
        memcpy(s, init, initlen)
    }
    s[initlen] = 0
    return s
}

pub fn sdsnew(init: string) string {
    initlen: u64 = ? (init == 0) then 0 else strlen(init)
    return sdsnewlen(init, initlen)
}

pub fn sdsdup(s: string) string {
    return sdsnewlen(s, sdslen(s))
}

pub fn sdsfree(s: string) none {
    if s == 0 {
        return none
    }
    free(cast<string>(s) - sdsHdrSize(s[-1]))
}

pub fn sdsclear(s: string) none {
    sdssetlen(s, 0)
    s[0] = 0
}

m4_define(`SDS_MAX_PREALLOC', `TODO')m4_dnl

pub fn sdsMakeRoomFor(s: string, addlen: u64) string {
    sh: *any;
    newsh: *any;
    avail: u64 = sdsavail(s)
    len: u64;
    newlen: u64;
    stype: char;
    oldstype: char = s[-1] & SDS_TYPE_MASK
    hdrlen: i32;
    if avail >= addlen {
        return s
    }
    len = sdslen(s)
    sh = cast<string>(s) - sdsHdrSize(oldstype)
    newlen = (len + addlen)
    if newlen < (1024 * 1024) {
        newlen *= 2
    }
    else {
        newlen += (1024 * 1024)
    }
    stype = sdsReqType(newlen)
    if stype == SDS_TYPE_5 {
        stype = SDS_TYPE_8
    }
    hdrlen = sdsHdrSize(stype)
    if oldstype == stype {
        newsh = realloc(sh, hdrlen + newlen + 1)
        if newsh == 0 {
            return 0
        }
        s = cast<string>(newsh) + hdrlen
    }
    else {
        newsh = malloc(hdrlen + newlen + 1)
        if newsh == 0 {
            return 0
        }
        memcpy(cast<string>(newsh) + hdrlen, s, len + 1)
        free(sh)
        s = cast<string>(newsh) + hdrlen
        s[-1] = stype
        sdssetlen(s, len)
    }
    sdssetalloc(s, newlen)
    return s
}

pub fn sdsgrowzero(s: string, len: u64) string {
    curlen: u64 = sdslen(s)
    if len <= curlen {
        return s
    }
    s = sdsMakeRoomFor(s, len - curlen)
    if s == 0 {
        return 0
    }
    memset(s + curlen, 0, (len - curlen + 1))
    sdssetlen(s, len)
    return s
}

fn sdscatlen(s: string, t: *any, len: u64) string {
    curlen: u64 = sdslen(s)
    s = sdsMakeRoomFor(s, len)
    if s == 0 {
        return 0
    }
    memcpy(s + curlen, t, len)
    sdssetlen(s, curlen + len)
    s[curlen + len] = 0
    return s
}

pub fn sdscat(s: string, t: string) string {
    return sdscatlen(s, t, strlen(t))
}

m4_define(`SDS_LLSTR_SIZE', `21')m4_dnl

fn sdsll2str(s: string, value: i64) i32 {
    p: string;
    aux: char;
    v: u64;
    l: u64;
    if value < 0 {
        if value ~= -9223372036854775807l - 1 {
            v = -value
        }
        else {
            v = (cast<u64>(9223372036854775807l)) + 1
        }
    }
    else {
        v = value
    }
    p = s
    loop .. while v {
        p++[] = '0' + (v % 10)
        v /= 10
    }    
    if value < 0 {
        p++[] = '-'
    }
    l = p - s
    p[] = 0
    p--
    loop while s < p {
        aux = s[]
        s[] = p[]
        p[] = aux
        s++
        p--
    }
    return l
}

fn sdsull2str(s: string, v: u64) i32 {
    p: string;
    aux: char;
    l: u64;
    p = s
    loop .. while v {
        p++[] = '0' + (v % 10)
        v /= 10
    }    
    l = p - s
    p[] = 0
    p--
    loop while s < p {
        aux = s[]
        s[] = p[]
        p[] = aux
        s++
        p--
    }
    return l
}

pub fn sdsfromlong(value: i64) string {
    buf: [SDS_LLSTR_SIZE]char;
    len: i32 = sdsll2str(buf, value)
    return sdsnewlen(buf, len)
}

pub fn sdsfromunsignedlong(value: u64) string {
    buf: [SDS_LLSTR_SIZE]char;
    len: i32 = sdsull2str(buf, value)
    return sdsnewlen(buf, len)
}

pub fn sdsrange(s: string, start: i64, end: i64) none {
    newlen: u64;
    len: u64 = sdslen(s)
    if len == 0 {
        return none
    }
    if start < 0 {
        start = len + start
        if start < 0 {
            start = 0
        }
    }
    if end < 0 {
        end = len + end
        if end < 0 {
            end = 0
        }
    }
    newlen = ? (start > end) then 0 else (end - start) + 1
    if newlen ~= 0 {
        if start >= cast<i64>(len) {
            newlen = 0
        }
        elif end >= cast<i64>(len) {
            end = len - 1
            newlen = (end - start) + 1
        }
    }
    if start and newlen {
        memmove(s, s + start, newlen)
    }
    s[newlen] = 0
    sdssetlen(s, newlen)
}
