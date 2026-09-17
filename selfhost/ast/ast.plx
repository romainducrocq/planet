m4_include(`ast.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

pub fn make_CConst(none) *struc CConst {
    self: *struc CConst = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_alloc(CConst, self)"
        loop .. while 0 {
            " #@MACRO@:uptr_alloc(CConst, self)"
            free_CConst(@self)
            self = cast<*struc CConst>(malloc(sizeof<struc CConst>))
            if not self {
                panic_sigabrt("alloc "                     "CConst")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_CConst_t
    return self
}

pub fn make_CConstInt(value: i32) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstInt_t
    self[].get._CConstInt.value = value
    return self
}

pub fn make_CConstLong(value: i64) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstLong_t
    self[].get._CConstLong.value = value
    return self
}

pub fn make_CConstUInt(value: u32) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstUInt_t
    self[].get._CConstUInt.value = value
    return self
}

pub fn make_CConstULong(value: u64) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstULong_t
    self[].get._CConstULong.value = value
    return self
}

pub fn make_CConstDouble(value: f64) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstDouble_t
    self[].get._CConstDouble.value = value
    return self
}

pub fn make_CConstChar(value: i8) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstChar_t
    self[].get._CConstChar.value = value
    return self
}

pub fn make_CConstUChar(value: u8) *struc CConst {
    self: *struc CConst = make_CConst()
    self[].tag = AST_CConstUChar_t
    self[].get._CConstUChar.value = value
    return self
}

pub fn free_CConst(self: **struc CConst) none {
    loop .. while 0 {
        " #@MACRO@:sptr_delete(*self)"
        if not self[] {
            " #@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_CConst_t {
            -> AST_CConstInt_t {
                -> AST_CConstLong_t {
                    -> AST_CConstUInt_t {
                        -> AST_CConstULong_t {
                            -> AST_CConstDouble_t {
                                -> AST_CConstChar_t {
                                    -> AST_CConstUChar_t {
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
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_free(*self)"
        if self[] {
            " #@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral {
    self: *struc CStringLiteral = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_alloc(CStringLiteral, self)"
        loop .. while 0 {
            " #@MACRO@:uptr_alloc(CStringLiteral, self)"
            free_CStringLiteral(@self)
            self = cast<*struc CStringLiteral>(malloc(sizeof<struc CStringLiteral>))
            if not self {
                panic_sigabrt("alloc "                     "CStringLiteral")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_CStringLiteral_t
    self[].value = vec_new()
    vec_move(value[], self[].value)
    return self
}

pub fn free_CStringLiteral(self: **struc CStringLiteral) none {
    loop .. while 0 {
        " #@MACRO@:sptr_delete(*self)"
        if not self[] {
            " #@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_CStringLiteral_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    vec_delete(self[][].value)
    loop .. while 0 {
        " #@MACRO@:sptr_free(*self)"
        if self[] {
            " #@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

m4_define(`Ctx', `TODO')m4_dnl

pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64 {
    identifier: u64 = stbds_hash_string(value[], 42)
    if (? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((identifier))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            " #@MACRO@:map_move_add(ctx->hash_table, identifier, *value)"
            loop .. while 0 {
                " #@MACRO@:map_add(ctx->hash_table, identifier, *value)"
                loop .. while 0 {
                    (ctx[].hash_table) = stbds_hmput_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((identifier))), sizeof((ctx[].hash_table)[].key), 0)
                    (ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp].key = (identifier)
                    (ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp].value = (value[])
                }
            }
            value[] = nil
        }
    }
    else {
        if value[] {
            " #@MACRO@:str_delete(*value)"
            sdsfree(value[])
            value[] = ? nil then sdsnew(nil) else nil
        }
    }
    return identifier
}

pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64 {
    loop .. while 0 {
        " #@MACRO@:str_append(*name, UID_SEPARATOR)"
        name[] = sdscat(name[], ".")
    }
    {
        strto_uid: string = ? (ctx[].label_count) > 0 then sdsfromunsignedlong(cast<u64>((ctx[].label_count))) else sdsfromlong(cast<i64>((ctx[].label_count)))
        loop .. while 0 {
            " #@MACRO@:str_append(*name, strto_uid)"
            name[] = sdscat(name[], strto_uid)
        }
        if strto_uid {
            " #@MACRO@:str_delete(strto_uid)"
            sdsfree(strto_uid)
            strto_uid = ? nil then sdsnew(nil) else nil
        }
    }
    ctx[].label_count++
    return make_string_identifier(ctx, name)
}

pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64 {
    loop .. while 0 {
        " #@MACRO@:str_append(*name, UID_SEPARATOR)"
        name[] = sdscat(name[], ".")
    }
    {
        strto_uid: string = ? (ctx[].var_count) > 0 then sdsfromunsignedlong(cast<u64>((ctx[].var_count))) else sdsfromlong(cast<i64>((ctx[].var_count)))
        loop .. while 0 {
            " #@MACRO@:str_append(*name, strto_uid)"
            name[] = sdscat(name[], strto_uid)
        }
        if strto_uid {
            " #@MACRO@:str_delete(strto_uid)"
            sdsfree(strto_uid)
            strto_uid = ? nil then sdsnew(nil) else nil
        }
    }
    ctx[].var_count++
    return make_string_identifier(ctx, name)
}

pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64 {
    loop .. while 0 {
        " #@MACRO@:str_append(*name, UID_SEPARATOR)"
        name[] = sdscat(name[], ".")
    }
    {
        strto_uid: string = ? (ctx[].struct_count) > 0 then sdsfromunsignedlong(cast<u64>((ctx[].struct_count))) else sdsfromlong(cast<i64>((ctx[].struct_count)))
        loop .. while 0 {
            " #@MACRO@:str_append(*name, strto_uid)"
            name[] = sdscat(name[], strto_uid)
        }
        if strto_uid {
            " #@MACRO@:str_delete(strto_uid)"
            sdsfree(strto_uid)
            strto_uid = ? nil then sdsnew(nil) else nil
        }
    }
    ctx[].struct_count++
    return make_string_identifier(ctx, name)
}
