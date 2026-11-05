m4_include(`sds.plx.m4')m4_dnl

m4_include(`../lib/c_lib.plx.m4')m4_dnl

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
m4_define(`SDS_HDR_VAR', `sh: *struc sdshdr$1 = cast<*any>(($2) - sizeof<struc sdshdr$1>)')m4_dnl
m4_define(`SDS_HDR', `cast<*struc sdshdr$1>(($2) - sizeof<struc sdshdr$1>)')m4_dnl
m4_define(`SDS_TYPE_5_LEN', `(($1) >> SDS_TYPE_BITS)')m4_dnl
pub SDS_NOINIT: string = "SDS_NOINIT"

pub fn sdslen(s: sds) u64 {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            return SDS_TYPE_5_LEN(flags)
        }
        -> SDS_TYPE_8 {
            return SDS_HDR(8, s)[].len
        }
        -> SDS_TYPE_32 {
            return SDS_HDR(32, s)[].len
        }
        -> SDS_TYPE_64 {
            return SDS_HDR(64, s)[].len
        }
    }
    return 0
}

fn sdsavail(s: sds) u64 {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            return 0
        }
        -> SDS_TYPE_8 {
            SDS_HDR_VAR(8, s)
            return sh[].alloc - sh[].len
        }
        -> SDS_TYPE_32 {
            SDS_HDR_VAR(32, s)
            return sh[].alloc - sh[].len
        }
        -> SDS_TYPE_64 {
            SDS_HDR_VAR(64, s)
            return sh[].alloc - sh[].len
        }
    }
    return 0
}

fn sdssetlen(s: sds, newlen: u64) none {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            fp: *u8 = (cast<*u8>(s)) - 1
            fp[] = SDS_TYPE_5 | (newlen << SDS_TYPE_BITS)
        }
        break
        -> SDS_TYPE_8 {
            SDS_HDR(8, s)[].len = newlen
        }
        break
        -> SDS_TYPE_32 {
            SDS_HDR(32, s)[].len = newlen
        }
        break
        -> SDS_TYPE_64 {
            SDS_HDR(64, s)[].len = newlen
        }
        break
    }
}

fn sdssetalloc(s: sds, newlen: u64) none {
    flags: u8 = s[-1]
    match flags & SDS_TYPE_MASK {
        -> SDS_TYPE_5 {
            break
        }
        -> SDS_TYPE_8 {
            SDS_HDR(8, s)[].alloc = newlen
        }
        break
        -> SDS_TYPE_32 {
            SDS_HDR(32, s)[].alloc = newlen
        }
        break
        -> SDS_TYPE_64 {
            SDS_HDR(64, s)[].alloc = newlen
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

fn sdsnewlen(init: *any, initlen: u64) sds {
    sh: *any;
    s: sds;
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
            SDS_HDR_VAR(8, s)
            sh[].len = initlen
            sh[].alloc = initlen
            fp[] = stype
            break
        }
        -> SDS_TYPE_32 {
            SDS_HDR_VAR(32, s)
            sh[].len = initlen
            sh[].alloc = initlen
            fp[] = stype
            break
        }
        -> SDS_TYPE_64 {
            SDS_HDR_VAR(64, s)
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

pub fn sdsnew(init: string) sds {
    initlen: u64 = ? (init == 0) then 0 else strlen(init)
    return sdsnewlen(init, initlen)
}

pub fn sdsdup(s: sds) sds {
    return sdsnewlen(s, sdslen(s))
}

pub fn sdsfree(s: sds) none {
    if s == 0 {
        return none
    }
    free(cast<string>(s) - sdsHdrSize(s[-1]))
}

pub fn sdsclear(s: sds) none {
    sdssetlen(s, 0)
    s[0] = 0
}

m4_define(`SDS_MAX_PREALLOC', `(1024 * 1024)')m4_dnl
pub fn sdsMakeRoomFor(s: sds, addlen: u64) sds {
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
    if newlen < SDS_MAX_PREALLOC {
        newlen *= 2
    }
    else {
        newlen += SDS_MAX_PREALLOC
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

pub fn sdsgrowzero(s: sds, len: u64) sds {
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

fn sdscatlen(s: sds, t: *any, len: u64) sds {
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

pub fn sdscat(s: sds, t: string) sds {
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

pub fn sdsfromlong(value: i64) sds {
    buf: [SDS_LLSTR_SIZE]char;
    len: i32 = sdsll2str(buf, value)
    return sdsnewlen(buf, len)
}

pub fn sdsfromunsignedlong(value: u64) sds {
    buf: [SDS_LLSTR_SIZE]char;
    len: i32 = sdsull2str(buf, value)
    return sdsnewlen(buf, len)
}

pub fn sdsrange(s: sds, start: i64, end: i64) none {
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
