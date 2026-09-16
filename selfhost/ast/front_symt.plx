m4_include(`ast.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../backend/regs.plx.m4')m4_dnl







type struc Type;
type struc StaticInit;
type struc InitialValue;
type struc IdentifierAttr;
type struc Symbol;
type struc StructMember;
type struc StructTypedef;

type struc Char(_empty: char)

type struc SChar(_empty: char)

type struc UChar(_empty: char)

type struc Int(_empty: char)

type struc Long(_empty: char)

type struc UInt(_empty: char)

type struc ULong(_empty: char)

type struc Double(_empty: char)

type struc Void(_empty: char)

type struc FunType(param_reg_mask: u64, ret_reg_mask: u64, param_types: **struc Type, ret_type: *struc Type)

type struc Pointer(ref_type: *struc Type)

type struc Array(size: i64, elem_type: *struc Type)

type struc Structure(tag_name: u64, is_union: i32)

type union _Type(_Char: struc Char, _SChar: struc SChar, _UChar: struc UChar, _Int: struc Int, _Long: struc Long, _UInt: struc UInt, _ULong: struc ULong, _Double: struc Double, _Void: struc Void, _FunType: struc FunType, _Pointer: struc Pointer, _Array: struc Array, _Structure: struc Structure)

type struc Type(_ref_count: u64, tag: i32, get: union _Type)
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
pub fn make_Structure(tag_name: u64, is_union: i32) *struc Type;
pub fn free_Type(self: **struc Type) none;

type struc IntInit(value: i32)

type struc LongInit(value: i64)

type struc UIntInit(value: u32)

type struc ULongInit(value: u64)

type struc CharInit(value: i8)

type struc UCharInit(value: u8)

type struc DoubleInit(dbl_const: u64)

type struc ZeroInit(byte: i64)

type struc StringInit(string_const: u64, is_null_term: i32, literal: *struc CStringLiteral)

type struc PointerInit(name: u64)

type union _StaticInit(_IntInit: struc IntInit, _LongInit: struc LongInit, _UIntInit: struc UIntInit, _ULongInit: struc ULongInit, _CharInit: struc CharInit, _UCharInit: struc UCharInit, _DoubleInit: struc DoubleInit, _ZeroInit: struc ZeroInit, _StringInit: struc StringInit, _PointerInit: struc PointerInit)

type struc StaticInit(_ref_count: u64, tag: i32, get: union _StaticInit)
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

type struc Tentative(_empty: char)

type struc Initial(static_inits: **struc StaticInit)

type struc NoInitializer(_empty: char)

type union _InitialValue(_Tentative: struc Tentative, _Initial: struc Initial, _NoInitializer: struc NoInitializer)

type struc InitialValue(_ref_count: u64, tag: i32, get: union _InitialValue)
pub fn make_InitialValue(none) *struc InitialValue;
pub fn make_Tentative(none) *struc InitialValue;
pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue;
pub fn make_NoInitializer(none) *struc InitialValue;
pub fn free_InitialValue(self: **struc InitialValue) none;

type struc FunAttr(is_def: i32, is_glob: i32)

type struc StaticAttr(is_glob: i32, init: *struc InitialValue)

type struc ConstantAttr(static_init: *struc StaticInit)

type struc LocalAttr(_empty: char)

type union _IdentifierAttr(_FunAttr: struc FunAttr, _StaticAttr: struc StaticAttr, _ConstantAttr: struc ConstantAttr, _LocalAttr: struc LocalAttr)

type struc IdentifierAttr(tag: i32, get: union _IdentifierAttr)
pub fn make_IdentifierAttr(none) *struc IdentifierAttr;
pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr;
pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr;
pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr;
pub fn make_LocalAttr(none) *struc IdentifierAttr;
pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none;

type struc Symbol(tag: i32, type_t: *struc Type, attrs: *struc IdentifierAttr)
pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol;
pub fn free_Symbol(self: **struc Symbol) none;

type struc StructMember(tag: i32, offset: i64, member_type: *struc Type)
pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember;
pub fn free_StructMember(self: **struc StructMember) none;
m4_define(`UPtrStructMember', `TODO')m4_dnl

type struc PairTIdentifierUPtrStructMember(key: u64, value: *struc StructMember)

type struc StructTypedef(tag: i32, alignment: i32, size: i64, member_names: *u64, members: *struc PairTIdentifierUPtrStructMember)
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef;
pub fn free_StructTypedef(self: **struc StructTypedef) none;
m4_define(`ulong_t', `TODO')m4_dnl

type struc PairTIdentifierulong_t(key: u64, value: u64)

type struc PairTIdentifierTIdentifier(key: u64, value: u64)

m4_define(`UPtrStructTypedef', `TODO')m4_dnl

type struc PairTIdentifierUPtrStructTypedef(key: u64, value: *struc StructTypedef)

m4_define(`UPtrSymbol', `TODO')m4_dnl

type struc PairTIdentifierUPtrSymbol(key: u64, value: *struc Symbol)

type struc ElementTIdentifier(key: u64, value: char)

type struc FrontEndContext(string_const_table: *struc PairTIdentifierTIdentifier, struct_typedef_table: *struc PairTIdentifierUPtrStructTypedef, symbol_table: *struc PairTIdentifierUPtrSymbol, addressed_set: *struc ElementTIdentifier)
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag_name: u64, member_name: u64) *struc StructMember;
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag_name: u64) *struc StructMember;
type struc FileIoContext;
m4_define(`hash_t', `TODO')m4_dnl

type struc Pairhash_thash_t(key: u64, value: u64)

type struc FileOpenLine(linenum: u64, total_linenum: u64, filename: string)

type struc TokenInfo(tok_pos: i32, tok_len: i32, total_linenum: u64)

type struc ErrorsContext(errors: *struc ErrorsContext, fileio: *struc FileIoContext, msg: [ERROR_MSG_SIZE]char, is_stdout: i32, info_at_buf: u64, info_at_map: *struc Pairhash_thash_t, fopen_lines: *struc FileOpenLine, token_infos: *struc TokenInfo)

pub fn panic_sigabrt(msg: string) none;
m4_define(`PANIC_FUNC', `TODO')m4_dnl
m4_define(`THROW_ABORT', `TODO')m4_dnl
m4_define(`THROW_ALLOC', `TODO')m4_dnl
m4_define(`THROW_ABORT_IF', `TODO')m4_dnl
m4_define(`THROW_ABORT_IF', `TODO')m4_dnl
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
m4_define(`ERROR_MSG_BUF', `TODO')m4_dnl
m4_define(`THROW_INIT', `TODO')m4_dnl
m4_define(`THROW_BASE', `TODO')m4_dnl
m4_define(`THROW_AT_TOKEN', `TODO')m4_dnl
m4_define(`REGISTER_KIND', `TODO')m4_dnl
m4_define(`REG_Ax', `0')m4_dnl
m4_define(`REG_Bx', `1')m4_dnl
m4_define(`REG_Cx', `2')m4_dnl
m4_define(`REG_Dx', `3')m4_dnl
m4_define(`REG_Di', `4')m4_dnl
m4_define(`REG_Si', `5')m4_dnl
m4_define(`REG_R8', `6')m4_dnl
m4_define(`REG_R9', `7')m4_dnl
m4_define(`REG_R10', `8')m4_dnl
m4_define(`REG_R11', `9')m4_dnl
m4_define(`REG_R12', `10')m4_dnl
m4_define(`REG_R13', `11')m4_dnl
m4_define(`REG_R14', `12')m4_dnl
m4_define(`REG_R15', `13')m4_dnl
m4_define(`REG_Sp', `14')m4_dnl
m4_define(`REG_Bp', `15')m4_dnl
m4_define(`REG_Xmm0', `16')m4_dnl
m4_define(`REG_Xmm1', `17')m4_dnl
m4_define(`REG_Xmm2', `18')m4_dnl
m4_define(`REG_Xmm3', `19')m4_dnl
m4_define(`REG_Xmm4', `20')m4_dnl
m4_define(`REG_Xmm5', `21')m4_dnl
m4_define(`REG_Xmm6', `22')m4_dnl
m4_define(`REG_Xmm7', `23')m4_dnl
m4_define(`REG_Xmm8', `24')m4_dnl
m4_define(`REG_Xmm9', `25')m4_dnl
m4_define(`REG_Xmm10', `26')m4_dnl
m4_define(`REG_Xmm11', `27')m4_dnl
m4_define(`REG_Xmm12', `28')m4_dnl
m4_define(`REG_Xmm13', `29')m4_dnl
m4_define(`REG_Xmm14', `30')m4_dnl
m4_define(`REG_Xmm15', `31')m4_dnl
m4_define(`REGISTER_MASK_SIZE', `26')m4_dnl
m4_define(`REGISTER_MASK_FALSE', `TODO')m4_dnl
m4_define(`NULL_REGISTER_MASK', `TODO')m4_dnl

pub fn make_Type(none) *struc Type {
    self: *struc Type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_alloc(Type, self)"
        loop .. while 0 {
            "@MACRO@:uptr_alloc(Type, self)"
            free_Type(@self)
            self = cast<*struc Type>(malloc(sizeof<struc Type>))
            if not self {
                panic_sigabrt("alloc "                     "Type")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_Type_t
    return self
}

pub fn make_Char(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Char_t
    return self
}

pub fn make_SChar(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_SChar_t
    return self
}

pub fn make_UChar(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_UChar_t
    return self
}

pub fn make_Int(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Int_t
    return self
}

pub fn make_Long(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Long_t
    return self
}

pub fn make_UInt(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_UInt_t
    return self
}

pub fn make_ULong(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_ULong_t
    return self
}

pub fn make_Double(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Double_t
    return self
}

pub fn make_Void(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Void_t
    return self
}

pub fn make_FunType(param_types: ***struc Type, ret_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_FunType_t
    self[].get._FunType.param_reg_mask = 0ul
    self[].get._FunType.ret_reg_mask = 0ul
    self[].get._FunType.param_types = vec_new()
    if param_types[] ~= self[].get._FunType.param_types {
        "@MACRO@:vec_move(*param_types, self->get._FunType.param_types)"
        if self[].get._FunType.param_types {
            "@MACRO@:vec_delete(self->get._FunType.param_types)"
            loop .. while 0 {
                cast<none>((? (self[].get._FunType.param_types) then free((cast<*struc stbds_array_header>((self[].get._FunType.param_types)) - 1)) else cast<none>(0)))
                (self[].get._FunType.param_types) = nil
            }
            self[].get._FunType.param_types = vec_new()
        }
        self[].get._FunType.param_types = param_types[]
        param_types[] = vec_new()
    }
    self[].get._FunType.ret_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *ret_type, self->get._FunType.ret_type)"
        if ret_type[] ~= self[].get._FunType.ret_type {
            "@MACRO@:uptr_move(Type, *ret_type, self->get._FunType.ret_type)"
            free_Type(@self[].get._FunType.ret_type)
            self[].get._FunType.ret_type = ret_type[]
            ret_type[] = uptr_new()
        }
    }
    self[].get._FunType.param_reg_mask = (cast<u8>(1u)) << REGISTER_MASK_SIZE
    self[].get._FunType.ret_reg_mask = (cast<u8>(1u)) << REGISTER_MASK_SIZE
    return self
}

pub fn make_Pointer(ref_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Pointer_t
    self[].get._Pointer.ref_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *ref_type, self->get._Pointer.ref_type)"
        if ref_type[] ~= self[].get._Pointer.ref_type {
            "@MACRO@:uptr_move(Type, *ref_type, self->get._Pointer.ref_type)"
            free_Type(@self[].get._Pointer.ref_type)
            self[].get._Pointer.ref_type = ref_type[]
            ref_type[] = uptr_new()
        }
    }
    return self
}

pub fn make_Array(size: i64, elem_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Array_t
    self[].get._Array.size = size
    self[].get._Array.elem_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *elem_type, self->get._Array.elem_type)"
        if elem_type[] ~= self[].get._Array.elem_type {
            "@MACRO@:uptr_move(Type, *elem_type, self->get._Array.elem_type)"
            free_Type(@self[].get._Array.elem_type)
            self[].get._Array.elem_type = elem_type[]
            elem_type[] = uptr_new()
        }
    }
    return self
}

pub fn make_Structure(tag_name: u64, is_union: i32) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Structure_t
    self[].get._Structure.tag_name = tag_name
    self[].get._Structure.is_union = is_union
    return self
}

pub fn free_Type(self: **struc Type) none {
    loop .. while 0 {
        "@MACRO@:sptr_delete(*self)"
        if not self[] {
            "@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_Type_t {
            -> AST_Char_t {
                -> AST_SChar_t {
                    -> AST_UChar_t {
                        -> AST_Int_t {
                            -> AST_Long_t {
                                -> AST_UInt_t {
                                    -> AST_ULong_t {
                                        -> AST_Double_t {
                                            -> AST_Void_t {
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
        -> AST_FunType_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._FunType.param_types) then (cast<*struc stbds_array_header>(((self[])[].get._FunType.param_types)) - 1)[].length else 0) .. ++i {
                free_Type(@(self[])[].get._FunType.param_types[i])
            }
        }
        if (self[])[].get._FunType.param_types {
            "@MACRO@:vec_delete((*self)->get._FunType.param_types)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._FunType.param_types) then free((cast<*struc stbds_array_header>(((self[])[].get._FunType.param_types)) - 1)) else cast<none>(0)))
                ((self[])[].get._FunType.param_types) = nil
            }
            (self[])[].get._FunType.param_types = vec_new()
        }
        free_Type(@(self[])[].get._FunType.ret_type)
        break
        -> AST_Pointer_t {
            free_Type(@(self[])[].get._Pointer.ref_type)
        }
        break
        -> AST_Array_t {
            free_Type(@(self[])[].get._Array.elem_type)
        }
        break
        -> AST_Structure_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_free(*self)"
        if self[] {
            "@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_StaticInit(none) *struc StaticInit {
    self: *struc StaticInit = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_alloc(StaticInit, self)"
        loop .. while 0 {
            "@MACRO@:uptr_alloc(StaticInit, self)"
            free_StaticInit(@self)
            self = cast<*struc StaticInit>(malloc(sizeof<struc StaticInit>))
            if not self {
                panic_sigabrt("alloc "                     "StaticInit")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_StaticInit_t
    return self
}

pub fn make_IntInit(value: i32) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_IntInit_t
    self[].get._IntInit.value = value
    return self
}

pub fn make_LongInit(value: i64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_LongInit_t
    self[].get._LongInit.value = value
    return self
}

pub fn make_UIntInit(value: u32) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_UIntInit_t
    self[].get._UIntInit.value = value
    return self
}

pub fn make_ULongInit(value: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_ULongInit_t
    self[].get._ULongInit.value = value
    return self
}

pub fn make_CharInit(value: i8) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_CharInit_t
    self[].get._CharInit.value = value
    return self
}

pub fn make_UCharInit(value: u8) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_UCharInit_t
    self[].get._UCharInit.value = value
    return self
}

pub fn make_DoubleInit(dbl_const: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_DoubleInit_t
    self[].get._DoubleInit.dbl_const = dbl_const
    return self
}

pub fn make_ZeroInit(byte: i64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_ZeroInit_t
    self[].get._ZeroInit.byte = byte
    return self
}

pub fn make_StringInit(string_const: u64, is_null_term: i32, literal: **struc CStringLiteral) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_StringInit_t
    self[].get._StringInit.string_const = string_const
    self[].get._StringInit.is_null_term = is_null_term
    self[].get._StringInit.literal = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(CStringLiteral, *literal, self->get._StringInit.literal)"
        if literal[] ~= self[].get._StringInit.literal {
            "@MACRO@:uptr_move(CStringLiteral, *literal, self->get._StringInit.literal)"
            free_CStringLiteral(@self[].get._StringInit.literal)
            self[].get._StringInit.literal = literal[]
            literal[] = uptr_new()
        }
    }
    return self
}

pub fn make_PointerInit(name: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_PointerInit_t
    self[].get._PointerInit.name = name
    return self
}

pub fn free_StaticInit(self: **struc StaticInit) none {
    loop .. while 0 {
        "@MACRO@:sptr_delete(*self)"
        if not self[] {
            "@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_StaticInit_t {
            -> AST_IntInit_t {
                -> AST_LongInit_t {
                    -> AST_UIntInit_t {
                        -> AST_ULongInit_t {
                            -> AST_CharInit_t {
                                -> AST_UCharInit_t {
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }
        -> AST_DoubleInit_t {
            break
        }
        -> AST_ZeroInit_t {
            break
        }
        -> AST_StringInit_t {
            free_CStringLiteral(@(self[])[].get._StringInit.literal)
        }
        break
        -> AST_PointerInit_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_free(*self)"
        if self[] {
            "@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_InitialValue(none) *struc InitialValue {
    self: *struc InitialValue = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_alloc(InitialValue, self)"
        loop .. while 0 {
            "@MACRO@:uptr_alloc(InitialValue, self)"
            free_InitialValue(@self)
            self = cast<*struc InitialValue>(malloc(sizeof<struc InitialValue>))
            if not self {
                panic_sigabrt("alloc "                     "InitialValue")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_InitialValue_t
    return self
}

pub fn make_Tentative(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_Tentative_t
    return self
}

pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_Initial_t
    self[].get._Initial.static_inits = vec_new()
    if static_inits[] ~= self[].get._Initial.static_inits {
        "@MACRO@:vec_move(*static_inits, self->get._Initial.static_inits)"
        if self[].get._Initial.static_inits {
            "@MACRO@:vec_delete(self->get._Initial.static_inits)"
            loop .. while 0 {
                cast<none>((? (self[].get._Initial.static_inits) then free((cast<*struc stbds_array_header>((self[].get._Initial.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._Initial.static_inits) = nil
            }
            self[].get._Initial.static_inits = vec_new()
        }
        self[].get._Initial.static_inits = static_inits[]
        static_inits[] = vec_new()
    }
    return self
}

pub fn make_NoInitializer(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_NoInitializer_t
    return self
}

pub fn free_InitialValue(self: **struc InitialValue) none {
    loop .. while 0 {
        "@MACRO@:sptr_delete(*self)"
        if not self[] {
            "@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_InitialValue_t {
            -> AST_Tentative_t {
                break
            }
        }
        -> AST_Initial_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._Initial.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._Initial.static_inits)) - 1)[].length else 0) .. ++i {
                free_StaticInit(@(self[])[].get._Initial.static_inits[i])
            }
        }
        if (self[])[].get._Initial.static_inits {
            "@MACRO@:vec_delete((*self)->get._Initial.static_inits)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._Initial.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._Initial.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._Initial.static_inits) = nil
            }
            (self[])[].get._Initial.static_inits = vec_new()
        }
        break
        -> AST_NoInitializer_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_free(*self)"
        if self[] {
            "@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_IdentifierAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(IdentifierAttr, self)"
        free_IdentifierAttr(@self)
        self = cast<*struc IdentifierAttr>(malloc(sizeof<struc IdentifierAttr>))
        if not self {
            panic_sigabrt("alloc "                 "IdentifierAttr")
        }
    }
    self[].tag = AST_IdentifierAttr_t
    return self
}

pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_FunAttr_t
    self[].get._FunAttr.is_def = is_def
    self[].get._FunAttr.is_glob = is_glob
    return self
}

pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_StaticAttr_t
    self[].get._StaticAttr.is_glob = is_glob
    self[].get._StaticAttr.init = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(InitialValue, *init, self->get._StaticAttr.init)"
        if init[] ~= self[].get._StaticAttr.init {
            "@MACRO@:uptr_move(InitialValue, *init, self->get._StaticAttr.init)"
            free_InitialValue(@self[].get._StaticAttr.init)
            self[].get._StaticAttr.init = init[]
            init[] = uptr_new()
        }
    }
    return self
}

pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_ConstantAttr_t
    self[].get._ConstantAttr.static_init = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(StaticInit, *static_init, self->get._ConstantAttr.static_init)"
        if static_init[] ~= self[].get._ConstantAttr.static_init {
            "@MACRO@:uptr_move(StaticInit, *static_init, self->get._ConstantAttr.static_init)"
            free_StaticInit(@self[].get._ConstantAttr.static_init)
            self[].get._ConstantAttr.static_init = static_init[]
            static_init[] = uptr_new()
        }
    }
    return self
}

pub fn make_LocalAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_LocalAttr_t
    return self
}

pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_IdentifierAttr_t {
            -> AST_FunAttr_t {
                break
            }
        }
        -> AST_StaticAttr_t {
            free_InitialValue(@(self[])[].get._StaticAttr.init)
        }
        break
        -> AST_ConstantAttr_t {
            free_StaticInit(@(self[])[].get._ConstantAttr.static_init)
        }
        break
        -> AST_LocalAttr_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol {
    self: *struc Symbol = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(Symbol, self)"
        free_Symbol(@self)
        self = cast<*struc Symbol>(malloc(sizeof<struc Symbol>))
        if not self {
            panic_sigabrt("alloc "                 "Symbol")
        }
    }
    self[].tag = AST_Symbol_t
    self[].type_t = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *type_t, self->type_t)"
        if type_t[] ~= self[].type_t {
            "@MACRO@:uptr_move(Type, *type_t, self->type_t)"
            free_Type(@self[].type_t)
            self[].type_t = type_t[]
            type_t[] = uptr_new()
        }
    }
    self[].attrs = uptr_new()
    if attrs[] ~= self[].attrs {
        "@MACRO@:uptr_move(IdentifierAttr, *attrs, self->attrs)"
        free_IdentifierAttr(@self[].attrs)
        self[].attrs = attrs[]
        attrs[] = uptr_new()
    }
    return self
}

pub fn free_Symbol(self: **struc Symbol) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_Symbol_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].type_t)
    free_IdentifierAttr(@(self[])[].attrs)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember {
    self: *struc StructMember = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(StructMember, self)"
        free_StructMember(@self)
        self = cast<*struc StructMember>(malloc(sizeof<struc StructMember>))
        if not self {
            panic_sigabrt("alloc "                 "StructMember")
        }
    }
    self[].tag = AST_StructMember_t
    self[].offset = offset
    self[].member_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *member_type, self->member_type)"
        if member_type[] ~= self[].member_type {
            "@MACRO@:uptr_move(Type, *member_type, self->member_type)"
            free_Type(@self[].member_type)
            self[].member_type = member_type[]
            member_type[] = uptr_new()
        }
    }
    return self
}

pub fn free_StructMember(self: **struc StructMember) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_StructMember_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].member_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef {
    self: *struc StructTypedef = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(StructTypedef, self)"
        free_StructTypedef(@self)
        self = cast<*struc StructTypedef>(malloc(sizeof<struc StructTypedef>))
        if not self {
            panic_sigabrt("alloc "                 "StructTypedef")
        }
    }
    self[].tag = AST_StructTypedef_t
    self[].alignment = alignment
    self[].size = size
    self[].member_names = vec_new()
    if member_names[] ~= self[].member_names {
        "@MACRO@:vec_move(*member_names, self->member_names)"
        if self[].member_names {
            "@MACRO@:vec_delete(self->member_names)"
            loop .. while 0 {
                cast<none>((? (self[].member_names) then free((cast<*struc stbds_array_header>((self[].member_names)) - 1)) else cast<none>(0)))
                (self[].member_names) = nil
            }
            self[].member_names = vec_new()
        }
        self[].member_names = member_names[]
        member_names[] = vec_new()
    }
    self[].members = map_new()
    if members[] ~= self[].members {
        "@MACRO@:map_move(*members, self->members)"
        if self[].members {
            "@MACRO@:map_delete(self->members)"
            loop .. while 0 {
                cast<none>((? (self[].members) ~= nil then stbds_hmfree_func((self[].members) - 1, sizeof((self[].members)[])) else cast<none>(0)))
                (self[].members) = nil
            }
            self[].members = map_new()
        }
        self[].members = members[]
        members[] = map_new()
    }
    return self
}

pub fn free_StructTypedef(self: **struc StructTypedef) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_StructTypedef_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if (self[])[].member_names {
        "@MACRO@:vec_delete((*self)->member_names)"
        loop .. while 0 {
            cast<none>((? ((self[])[].member_names) then free((cast<*struc stbds_array_header>(((self[])[].member_names)) - 1)) else cast<none>(0)))
            ((self[])[].member_names) = nil
        }
        (self[])[].member_names = vec_new()
    }
    loop i: u64 = 0 while i < (? ((self[])[].members) then (cast<*struc stbds_array_header>((((self[])[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@((self[])[].members[i]).value)
    }
    if (self[])[].members {
        "@MACRO@:map_delete((*self)->members)"
        loop .. while 0 {
            cast<none>((? ((self[])[].members) ~= nil then stbds_hmfree_func(((self[])[].members) - 1, sizeof(((self[])[].members)[])) else cast<none>(0)))
            ((self[])[].members) = nil
        }
        (self[])[].members = map_new()
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

m4_define(`Ctx', `TODO')m4_dnl

pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag_name: u64, member_name: u64) *struc StructMember {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((struct_typedef[].member_names[member_name]))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}

pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag_name: u64) *struc StructMember {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@(((struct_typedef[].member_names)[(? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0) - 1]))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}
