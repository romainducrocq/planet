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
type struc FileIoContext;
type struc Pairhash_thash_t(key: u64, value: u64)
type struc FileOpenLine(    linenum: u64    , total_linenum: u64    , filename: string    )
type struc TokenInfo(    tok_pos: i32    , tok_len: i32    , total_linenum: u64    )
type struc ErrorsContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , msg: [1024]char    , is_stdout: i32    , info_at_buf: u64    , info_at_map: *struc Pairhash_thash_t    , fopen_lines: *struc FileOpenLine    , token_infos: *struc TokenInfo    )
pub fn panic_sigabrt(msg: string, line: i32, file: string) none;
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
pub fn make_CConst(none) *struc CConst {
    self: *struc CConst = 0
    loop .. while 0 {
        loop .. while 0 {
            free_CConst(@self)
            self = cast<*struc CConst>(malloc(sizeof<struc CConst>))
            if not self {
                panic_sigabrt("alloc " "CConst", 15, "/home/romain/proj/planet/selfhost/wheelcc/ast/ast.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 46
    return self
}
pub fn make_CConstInt(value: i32) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 47
    self[].get._CConstInt.value = value
    return self
}
pub fn make_CConstLong(value: i64) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 48
    self[].get._CConstLong.value = value
    return self
}
pub fn make_CConstUInt(value: u32) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 49
    self[].get._CConstUInt.value = value
    return self
}
pub fn make_CConstULong(value: u64) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 50
    self[].get._CConstULong.value = value
    return self
}
pub fn make_CConstDouble(value: f64) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 51
    self[].get._CConstDouble.value = value
    return self
}
pub fn make_CConstChar(value: i8) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 52
    self[].get._CConstChar.value = value
    return self
}
pub fn make_CConstUChar(value: u8) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].type = 53
    self[].get._CConstUChar.value = value
    return self
}
pub fn free_CConst(self: **struc CConst) none {
    if not self[] {
        return none
    }
    elif (self[])[]._ref_count > 1 {
        (self[])[]._ref_count--
        self[] = 0
        return none
    }
    ;
    match (self[])[].type {
        -> 46 {
            -> 47 {
                -> 48 {
                    -> 49 {
                        -> 50 {
                            -> 51 {
                                -> 52 {
                                    -> 53 {
                                        break
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort", 82, "/home/romain/proj/planet/selfhost/wheelcc/ast/ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral {
    self: *struc CStringLiteral = 0
    loop .. while 0 {
        loop .. while 0 {
            free_CStringLiteral(@self)
            self = cast<*struc CStringLiteral>(malloc(sizeof<struc CStringLiteral>))
            if not self {
                panic_sigabrt("alloc " "CStringLiteral", 89, "/home/romain/proj/planet/selfhost/wheelcc/ast/ast.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 54
    self[].value = 0
    if value[] ~= self[].value {
        if self[].value {
            loop .. while 0 {
                cast<none>((? (self[].value) then free((cast<*struc stbds_array_header>((self[].value)) - 1)) else cast<none>(0)))
                (self[].value) = 0
            }
            self[].value = 0
        }
        ;
        self[].value = value[]
        value[] = 0
    }
    ;
    return self
}
pub fn free_CStringLiteral(self: **struc CStringLiteral) none {
    if not self[] {
        return none
    }
    elif (self[])[]._ref_count > 1 {
        (self[])[]._ref_count--
        self[] = 0
        return none
    }
    ;
    match (self[])[].type {
        -> 54 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 102, "/home/romain/proj/planet/selfhost/wheelcc/ast/ast.c")
        }
    }
    if (self[])[].value {
        loop .. while 0 {
            cast<none>((? ((self[])[].value) then free((cast<*struc stbds_array_header>(((self[])[].value)) - 1)) else cast<none>(0)))
            ((self[])[].value) = 0
        }
        (self[])[].value = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64 {
    identifier: u64 = stbds_hash_string(value[], 42)
    if (? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((identifier))), sizeof(ctx[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            loop .. while 0 {
                (ctx[].hash_table) = stbds_hmput_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((identifier))), sizeof(ctx[].hash_table)[].key, 0)
                (ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp].key = (identifier)
                (ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp].value = (value[])
            }
            value[] = 0
        }
    }
    else {
        if value[] {
            sdsfree(value[])
            value[] = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    return identifier
}
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64 {
    loop .. while 0 {
        name[] = sdscat(name[], ".")
    }
    {
        strto_uid: string = ? (ctx[].label_count) > 0 then sdsfromunsignedlong(cast<u64>((ctx[].label_count))) else sdsfromlong(cast<i64>((ctx[].label_count)))
        loop .. while 0 {
            name[] = sdscat(name[], strto_uid)
        }
        if strto_uid {
            sdsfree(strto_uid)
            strto_uid = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    ctx[].label_count++
    return make_string_identifier(ctx, name)
}
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64 {
    loop .. while 0 {
        name[] = sdscat(name[], ".")
    }
    {
        strto_uid: string = ? (ctx[].var_count) > 0 then sdsfromunsignedlong(cast<u64>((ctx[].var_count))) else sdsfromlong(cast<i64>((ctx[].var_count)))
        loop .. while 0 {
            name[] = sdscat(name[], strto_uid)
        }
        if strto_uid {
            sdsfree(strto_uid)
            strto_uid = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    ctx[].var_count++
    return make_string_identifier(ctx, name)
}
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64 {
    loop .. while 0 {
        name[] = sdscat(name[], ".")
    }
    {
        strto_uid: string = ? (ctx[].struct_count) > 0 then sdsfromunsignedlong(cast<u64>((ctx[].struct_count))) else sdsfromlong(cast<i64>((ctx[].struct_count)))
        loop .. while 0 {
            name[] = sdscat(name[], strto_uid)
        }
        if strto_uid {
            sdsfree(strto_uid)
            strto_uid = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    ctx[].struct_count++
    return make_string_identifier(ctx, name)
}
