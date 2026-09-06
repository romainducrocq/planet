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
type struc Type;
type struc StaticInit;
type struc InitialValue;
type struc IdentifierAttr;
type struc Symbol;
type struc StructMember;
type struc StructTypedef;
type struc Char(    _empty: char    )
type struc SChar(    _empty: char    )
type struc UChar(    _empty: char    )
type struc Int(    _empty: char    )
type struc Long(    _empty: char    )
type struc UInt(    _empty: char    )
type struc ULong(    _empty: char    )
type struc Double(    _empty: char    )
type struc Void(    _empty: char    )
type struc FunType(    param_reg_mask: u64    , ret_reg_mask: u64    , param_types: **struc Type    , ret_type: *struc Type    )
type struc Pointer(    ref_type: *struc Type    )
type struc Array(    size: i64    , elem_type: *struc Type    )
type struc Structure(    tag: u64    , is_union: i32    )
type union _Type(    _Char: struc Char    , _SChar: struc SChar    , _UChar: struc UChar    , _Int: struc Int    , _Long: struc Long    , _UInt: struc UInt    , _ULong: struc ULong    , _Double: struc Double    , _Void: struc Void    , _FunType: struc FunType    , _Pointer: struc Pointer    , _Array: struc Array    , _Structure: struc Structure    )
type struc Type(    _ref_count: u64, type: i32    , get: union _Type    )
pub fn make_Type(none) *struc Type;
pub fn make_Char(none) *struc Type;
pub fn make_SChar(none) *struc Type;
pub fn make_UChar(none) *struc Type;
pub fn make_Int(none) *struc Type;
pub fn make_Long(none) *struc Type;
pub fn make_UInt(none) *struc Type;
pub fn make_ULong(none) *struc Type;
pub fn make_Double(none) *struc Type;
pub fn make_Void(none) *struc Type;
pub fn make_FunType(param_types: ***struc Type, ret_type: **struc Type) *struc Type;
pub fn make_Pointer(ref_type: **struc Type) *struc Type;
pub fn make_Array(size: i64, elem_type: **struc Type) *struc Type;
pub fn make_Structure(tag: u64, is_union: i32) *struc Type;
pub fn free_Type(self: **struc Type) none;
type struc IntInit(    value: i32    )
type struc LongInit(    value: i64    )
type struc UIntInit(    value: u32    )
type struc ULongInit(    value: u64    )
type struc CharInit(    value: i8    )
type struc UCharInit(    value: u8    )
type struc DoubleInit(    dbl_const: u64    )
type struc ZeroInit(    byte: i64    )
type struc StringInit(    string_const: u64    , is_null_term: i32    , literal: *struc CStringLiteral    )
type struc PointerInit(    name: u64    )
type union _StaticInit(    _IntInit: struc IntInit    , _LongInit: struc LongInit    , _UIntInit: struc UIntInit    , _ULongInit: struc ULongInit    , _CharInit: struc CharInit    , _UCharInit: struc UCharInit    , _DoubleInit: struc DoubleInit    , _ZeroInit: struc ZeroInit    , _StringInit: struc StringInit    , _PointerInit: struc PointerInit    )
type struc StaticInit(    _ref_count: u64, type: i32    , get: union _StaticInit    )
pub fn make_StaticInit(none) *struc StaticInit;
pub fn make_IntInit(value: i32) *struc StaticInit;
pub fn make_LongInit(value: i64) *struc StaticInit;
pub fn make_UIntInit(value: u32) *struc StaticInit;
pub fn make_ULongInit(value: u64) *struc StaticInit;
pub fn make_CharInit(value: i8) *struc StaticInit;
pub fn make_UCharInit(value: u8) *struc StaticInit;
pub fn make_DoubleInit(dbl_const: u64) *struc StaticInit;
pub fn make_ZeroInit(byte: i64) *struc StaticInit;
pub fn make_StringInit(string_const: u64, is_null_term: i32, literal: **struc CStringLiteral) *struc StaticInit;

pub fn make_PointerInit(name: u64) *struc StaticInit;
pub fn free_StaticInit(self: **struc StaticInit) none;
type struc Tentative(    _empty: char    )
type struc Initial(    static_inits: **struc StaticInit    )
type struc NoInitializer(    _empty: char    )
type union _InitialValue(    _Tentative: struc Tentative    , _Initial: struc Initial    , _NoInitializer: struc NoInitializer    )
type struc InitialValue(    _ref_count: u64, type: i32    , get: union _InitialValue    )
pub fn make_InitialValue(none) *struc InitialValue;
pub fn make_Tentative(none) *struc InitialValue;
pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue;
pub fn make_NoInitializer(none) *struc InitialValue;
pub fn free_InitialValue(self: **struc InitialValue) none;
type struc FunAttr(    is_def: i32    , is_glob: i32    )
type struc StaticAttr(    is_glob: i32    , init: *struc InitialValue    )
type struc ConstantAttr(    static_init: *struc StaticInit    )
type struc LocalAttr(    _empty: char    )
type union _IdentifierAttr(    _FunAttr: struc FunAttr    , _StaticAttr: struc StaticAttr    , _ConstantAttr: struc ConstantAttr    , _LocalAttr: struc LocalAttr    )
type struc IdentifierAttr(    type: i32    , get: union _IdentifierAttr    )
pub fn make_IdentifierAttr(none) *struc IdentifierAttr;
pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr;
pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr;
pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr;
pub fn make_LocalAttr(none) *struc IdentifierAttr;
pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none;
type struc Symbol(    type: i32    , type_t: *struc Type    , attrs: *struc IdentifierAttr    )
pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol;
pub fn free_Symbol(self: **struc Symbol) none;
type struc StructMember(    type: i32    , offset: i64    , member_type: *struc Type    )
pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember;
pub fn free_StructMember(self: **struc StructMember) none;
type struc PairTIdentifierUPtrStructMember(key: u64, value: *struc StructMember)
type struc StructTypedef(    type: i32    , alignment: i32    , size: i64    , member_names: *u64    , members: *struc PairTIdentifierUPtrStructMember    )
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef;

pub fn free_StructTypedef(self: **struc StructTypedef) none;
type struc PairTIdentifierulong_t(key: u64, value: u64)
type struc PairTIdentifierTIdentifier(key: u64, value: u64)
type struc PairTIdentifierUPtrStructTypedef(key: u64, value: *struc StructTypedef)
type struc PairTIdentifierUPtrSymbol(key: u64, value: *struc Symbol)
type struc ElementTIdentifier(key: u64, value: char)
type struc FrontEndContext(    string_const_table: *struc PairTIdentifierTIdentifier    , struct_typedef_table: *struc PairTIdentifierUPtrStructTypedef    , symbol_table: *struc PairTIdentifierUPtrSymbol    , addressed_set: *struc ElementTIdentifier    )
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag: u64, member_name: u64) *struc StructMember;
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag: u64) *struc StructMember;
type struc FileIoContext;
type struc Pairhash_thash_t(key: u64, value: u64)
type struc FileOpenLine(    linenum: u64    , total_linenum: u64    , filename: string    )
type struc TokenInfo(    tok_pos: i32    , tok_len: i32    , total_linenum: u64    )
type struc ErrorsContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , msg: [1024]char    , is_stdout: i32    , info_at_buf: u64    , info_at_map: *struc Pairhash_thash_t    , fopen_lines: *struc FileOpenLine    , token_infos: *struc TokenInfo    )
pub fn panic_sigabrt(msg: string, line: i32, file: string) none;
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
pub fn make_Type(none) *struc Type {
    self: *struc Type = 0
    loop .. while 0 {
        loop .. while 0 {
            free_Type(@self)
            self = cast<*struc Type>(malloc(sizeof<struc Type>))
            if not self {
                panic_sigabrt("alloc " "Type", 18, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 0
    return self
}
pub fn make_Char(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 1
    return self
}
pub fn make_SChar(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 2
    return self
}
pub fn make_UChar(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 3
    return self
}
pub fn make_Int(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 4
    return self
}
pub fn make_Long(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 5
    return self
}
pub fn make_UInt(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 6
    return self
}
pub fn make_ULong(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 7
    return self
}
pub fn make_Double(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 8
    return self
}
pub fn make_Void(none) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 9
    return self
}
pub fn make_FunType(param_types: ***struc Type, ret_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 10
    self[].get._FunType.param_reg_mask = 0ul
    self[].get._FunType.ret_reg_mask = 0ul
    self[].get._FunType.param_types = 0
    if param_types[] ~= self[].get._FunType.param_types {
        if self[].get._FunType.param_types {
            loop .. while 0 {
                cast<none>((? (self[].get._FunType.param_types) then free((cast<*struc stbds_array_header>((self[].get._FunType.param_types)) - 1)) else cast<none>(0)))
                (self[].get._FunType.param_types) = 0
            }
            self[].get._FunType.param_types = 0
        }
        ;
        self[].get._FunType.param_types = param_types[]
        param_types[] = 0
    }
    ;
    self[].get._FunType.ret_type = 0
    if ret_type[] ~= self[].get._FunType.ret_type {
        free_Type(@self[].get._FunType.ret_type)
        self[].get._FunType.ret_type = ret_type[]
        ret_type[] = 0
    }
    ;
    self[].get._FunType.param_reg_mask = (cast<u8>(1u)) << 26
    self[].get._FunType.ret_reg_mask = (cast<u8>(1u)) << 26
    return self
}
pub fn make_Pointer(ref_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 11
    self[].get._Pointer.ref_type = 0
    if ref_type[] ~= self[].get._Pointer.ref_type {
        free_Type(@self[].get._Pointer.ref_type)
        self[].get._Pointer.ref_type = ref_type[]
        ref_type[] = 0
    }
    ;
    return self
}
pub fn make_Array(size: i64, elem_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 12
    self[].get._Array.size = size
    self[].get._Array.elem_type = 0
    if elem_type[] ~= self[].get._Array.elem_type {
        free_Type(@self[].get._Array.elem_type)
        self[].get._Array.elem_type = elem_type[]
        elem_type[] = 0
    }
    ;
    return self
}
pub fn make_Structure(tag: u64, is_union: i32) *struc Type {
    self: *struc Type = make_Type()
    self[].type = 13
    self[].get._Structure.tag = tag
    self[].get._Structure.is_union = is_union
    return self
}
pub fn free_Type(self: **struc Type) none {
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
        -> 0 {
            -> 1 {
                -> 2 {
                    -> 3 {
                        -> 4 {
                            -> 5 {
                                -> 6 {
                                    -> 7 {
                                        -> 8 {
                                            -> 9 {
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
        -> 10 {
            loop i: u64 = 0 while i < (? ((self[])[].get._FunType.param_types) then (cast<*struc stbds_array_header>(((self[])[].get._FunType.param_types)) - 1)[].length else 0) .. ++i {
                free_Type(@(self[])[].get._FunType.param_types[i])
            }
        }
        if (self[])[].get._FunType.param_types {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._FunType.param_types) then free((cast<*struc stbds_array_header>(((self[])[].get._FunType.param_types)) - 1)) else cast<none>(0)))
                ((self[])[].get._FunType.param_types) = 0
            }
            (self[])[].get._FunType.param_types = 0
        }
        ;
        free_Type(@(self[])[].get._FunType.ret_type)
        break
        -> 11 {
            free_Type(@(self[])[].get._Pointer.ref_type)
        }
        break
        -> 12 {
            free_Type(@(self[])[].get._Array.elem_type)
        }
        break
        -> 13 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 146, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_StaticInit(none) *struc StaticInit {
    self: *struc StaticInit = 0
    loop .. while 0 {
        loop .. while 0 {
            free_StaticInit(@self)
            self = cast<*struc StaticInit>(malloc(sizeof<struc StaticInit>))
            if not self {
                panic_sigabrt("alloc " "StaticInit", 153, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 14
    return self
}
pub fn make_IntInit(value: i32) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 15
    self[].get._IntInit.value = value
    return self
}
pub fn make_LongInit(value: i64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 16
    self[].get._LongInit.value = value
    return self
}
pub fn make_UIntInit(value: u32) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 17
    self[].get._UIntInit.value = value
    return self
}
pub fn make_ULongInit(value: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 18
    self[].get._ULongInit.value = value
    return self
}
pub fn make_CharInit(value: i8) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 19
    self[].get._CharInit.value = value
    return self
}
pub fn make_UCharInit(value: u8) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 20
    self[].get._UCharInit.value = value
    return self
}
pub fn make_DoubleInit(dbl_const: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 21
    self[].get._DoubleInit.dbl_const = dbl_const
    return self
}
pub fn make_ZeroInit(byte: i64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 22
    self[].get._ZeroInit.byte = byte
    return self
}
pub fn make_StringInit(string_const: u64, is_null_term: i32, literal: **struc CStringLiteral) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 23
    self[].get._StringInit.string_const = string_const
    self[].get._StringInit.is_null_term = is_null_term
    self[].get._StringInit.literal = 0
    if literal[] ~= self[].get._StringInit.literal {
        free_CStringLiteral(@self[].get._StringInit.literal)
        self[].get._StringInit.literal = literal[]
        literal[] = 0
    }
    ;
    return self
}
pub fn make_PointerInit(name: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].type = 24
    self[].get._PointerInit.name = name
    return self
}
pub fn free_StaticInit(self: **struc StaticInit) none {
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
        -> 14 {
            -> 15 {
                -> 16 {
                    -> 17 {
                        -> 18 {
                            -> 19 {
                                -> 20 {
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }
        -> 21 {
            break
        }
        -> 22 {
            break
        }
        -> 23 {
            free_CStringLiteral(@(self[])[].get._StringInit.literal)
        }
        break
        -> 24 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 253, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_InitialValue(none) *struc InitialValue {
    self: *struc InitialValue = 0
    loop .. while 0 {
        loop .. while 0 {
            free_InitialValue(@self)
            self = cast<*struc InitialValue>(malloc(sizeof<struc InitialValue>))
            if not self {
                panic_sigabrt("alloc " "InitialValue", 260, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 25
    return self
}
pub fn make_Tentative(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].type = 26
    return self
}
pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].type = 27
    self[].get._Initial.static_inits = 0
    if static_inits[] ~= self[].get._Initial.static_inits {
        if self[].get._Initial.static_inits {
            loop .. while 0 {
                cast<none>((? (self[].get._Initial.static_inits) then free((cast<*struc stbds_array_header>((self[].get._Initial.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._Initial.static_inits) = 0
            }
            self[].get._Initial.static_inits = 0
        }
        ;
        self[].get._Initial.static_inits = static_inits[]
        static_inits[] = 0
    }
    ;
    return self
}
pub fn make_NoInitializer(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].type = 28
    return self
}
pub fn free_InitialValue(self: **struc InitialValue) none {
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
        -> 25 {
            -> 26 {
                break
            }
        }
        -> 27 {
            loop i: u64 = 0 while i < (? ((self[])[].get._Initial.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._Initial.static_inits)) - 1)[].length else 0) .. ++i {
                free_StaticInit(@(self[])[].get._Initial.static_inits[i])
            }
        }
        if (self[])[].get._Initial.static_inits {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._Initial.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._Initial.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._Initial.static_inits) = 0
            }
            (self[])[].get._Initial.static_inits = 0
        }
        ;
        break
        -> 28 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 300, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_IdentifierAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = 0
    loop .. while 0 {
        free_IdentifierAttr(@self)
        self = cast<*struc IdentifierAttr>(malloc(sizeof<struc IdentifierAttr>))
        if not self {
            panic_sigabrt("alloc " "IdentifierAttr", 307, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    self[].type = 29
    return self
}
pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].type = 30
    self[].get._FunAttr.is_def = is_def
    self[].get._FunAttr.is_glob = is_glob
    return self
}
pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].type = 31
    self[].get._StaticAttr.is_glob = is_glob
    self[].get._StaticAttr.init = 0
    if init[] ~= self[].get._StaticAttr.init {
        free_InitialValue(@self[].get._StaticAttr.init)
        self[].get._StaticAttr.init = init[]
        init[] = 0
    }
    ;
    return self
}
pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].type = 32
    self[].get._ConstantAttr.static_init = 0
    if static_init[] ~= self[].get._ConstantAttr.static_init {
        free_StaticInit(@self[].get._ConstantAttr.static_init)
        self[].get._ConstantAttr.static_init = static_init[]
        static_init[] = 0
    }
    ;
    return self
}
pub fn make_LocalAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].type = 33
    return self
}
pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 29 {
            -> 30 {
                break
            }
        }
        -> 31 {
            free_InitialValue(@(self[])[].get._StaticAttr.init)
        }
        break
        -> 32 {
            free_StaticInit(@(self[])[].get._ConstantAttr.static_init)
        }
        break
        -> 33 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 358, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol {
    self: *struc Symbol = 0
    loop .. while 0 {
        free_Symbol(@self)
        self = cast<*struc Symbol>(malloc(sizeof<struc Symbol>))
        if not self {
            panic_sigabrt("alloc " "Symbol", 365, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    self[].type = 34
    self[].type_t = 0
    if type_t[] ~= self[].type_t {
        free_Type(@self[].type_t)
        self[].type_t = type_t[]
        type_t[] = 0
    }
    ;
    self[].attrs = 0
    if attrs[] ~= self[].attrs {
        free_IdentifierAttr(@self[].attrs)
        self[].attrs = attrs[]
        attrs[] = 0
    }
    ;
    return self
}
pub fn free_Symbol(self: **struc Symbol) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 34 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 380, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    free_Type(@(self[])[].type_t)
    free_IdentifierAttr(@(self[])[].attrs)
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember {
    self: *struc StructMember = 0
    loop .. while 0 {
        free_StructMember(@self)
        self = cast<*struc StructMember>(malloc(sizeof<struc StructMember>))
        if not self {
            panic_sigabrt("alloc " "StructMember", 389, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    self[].type = 35
    self[].offset = offset
    self[].member_type = 0
    if member_type[] ~= self[].member_type {
        free_Type(@self[].member_type)
        self[].member_type = member_type[]
        member_type[] = 0
    }
    ;
    return self
}
pub fn free_StructMember(self: **struc StructMember) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 35 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 403, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    free_Type(@(self[])[].member_type)
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef {
    self: *struc StructTypedef = 0
    loop .. while 0 {
        free_StructTypedef(@self)
        self = cast<*struc StructTypedef>(malloc(sizeof<struc StructTypedef>))
        if not self {
            panic_sigabrt("alloc " "StructTypedef", 412, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    self[].type = 36
    self[].alignment = alignment
    self[].size = size
    self[].member_names = 0
    if member_names[] ~= self[].member_names {
        if self[].member_names {
            loop .. while 0 {
                cast<none>((? (self[].member_names) then free((cast<*struc stbds_array_header>((self[].member_names)) - 1)) else cast<none>(0)))
                (self[].member_names) = 0
            }
            self[].member_names = 0
        }
        ;
        self[].member_names = member_names[]
        member_names[] = 0
    }
    ;
    self[].members = 0
    if members[] ~= self[].members {
        if self[].members {
            loop .. while 0 {
                cast<none>((? (self[].members) ~= 0 then stbds_hmfree_func((self[].members) - 1, sizeof((self[].members)[])) else cast<none>(0)))
                (self[].members) = 0
            }
            self[].members = 0
        }
        ;
        self[].members = members[]
        members[] = 0
    }
    ;
    return self
}
pub fn free_StructTypedef(self: **struc StructTypedef) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 36 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 429, "/home/romain/proj/planet/selfhost/wheelcc/ast/front_symt.c")
        }
    }
    if (self[])[].member_names {
        loop .. while 0 {
            cast<none>((? ((self[])[].member_names) then free((cast<*struc stbds_array_header>(((self[])[].member_names)) - 1)) else cast<none>(0)))
            ((self[])[].member_names) = 0
        }
        (self[])[].member_names = 0
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].members) then (cast<*struc stbds_array_header>((((self[])[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@((self[])[].members[i]).value)
    }
    if (self[])[].members {
        loop .. while 0 {
            cast<none>((? ((self[])[].members) ~= 0 then stbds_hmfree_func(((self[])[].members) - 1, sizeof(((self[])[].members)[])) else cast<none>(0)))
            ((self[])[].members) = 0
        }
        (self[])[].members = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag: u64, member_name: u64) *struc StructMember {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((tag))), sizeof(ctx[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((struct_typedef[].member_names[member_name]))), sizeof(struct_typedef[].members)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag: u64) *struc StructMember {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((tag))), sizeof(ctx[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@(((struct_typedef[].member_names)[(? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0) - 1]))), sizeof(struct_typedef[].members)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}
