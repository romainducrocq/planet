m4_include(`ast.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../backend/regs.plx.m4')m4_dnl

pub fn make_Type(none) *struc Type {
    self: *struc Type = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_alloc(Type, self)"
        loop .. while 0 {
            " #@MACRO@:uptr_alloc(Type, self)"
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

pub fn make_FunType(param_types: *vector_t(shared_ptr_t(Type)), ret_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_FunType_t
    self[].get._FunType.param_reg_mask = 0ul
    self[].get._FunType.ret_reg_mask = 0ul
    self[].get._FunType.param_types = vec_new()
    vec_move(param_types[], self[].get._FunType.param_types)
    self[].get._FunType.ret_type = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, *ret_type, self->get._FunType.ret_type)"
        if ret_type[] ~= self[].get._FunType.ret_type {
            " #@MACRO@:uptr_move(Type, *ret_type, self->get._FunType.ret_type)"
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
        " #@MACRO@:sptr_move(Type, *ref_type, self->get._Pointer.ref_type)"
        if ref_type[] ~= self[].get._Pointer.ref_type {
            " #@MACRO@:uptr_move(Type, *ref_type, self->get._Pointer.ref_type)"
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
        " #@MACRO@:sptr_move(Type, *elem_type, self->get._Array.elem_type)"
        if elem_type[] ~= self[].get._Array.elem_type {
            " #@MACRO@:uptr_move(Type, *elem_type, self->get._Array.elem_type)"
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
            loop i: u64 = 0 while i < vec_size(self[][].get._FunType.param_types) .. ++i {
                free_Type(@(self[])[].get._FunType.param_types[i])
            }
        }
        vec_delete(self[][].get._FunType.param_types)
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
        " #@MACRO@:sptr_free(*self)"
        if self[] {
            " #@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_StaticInit(none) *struc StaticInit {
    self: *struc StaticInit = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_alloc(StaticInit, self)"
        loop .. while 0 {
            " #@MACRO@:uptr_alloc(StaticInit, self)"
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
        " #@MACRO@:sptr_move(CStringLiteral, *literal, self->get._StringInit.literal)"
        if literal[] ~= self[].get._StringInit.literal {
            " #@MACRO@:uptr_move(CStringLiteral, *literal, self->get._StringInit.literal)"
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
        " #@MACRO@:sptr_free(*self)"
        if self[] {
            " #@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_InitialValue(none) *struc InitialValue {
    self: *struc InitialValue = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_alloc(InitialValue, self)"
        loop .. while 0 {
            " #@MACRO@:uptr_alloc(InitialValue, self)"
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

pub fn make_Initial(static_inits: *vector_t(shared_ptr_t(StaticInit))) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_Initial_t
    self[].get._Initial.static_inits = vec_new()
    vec_move(static_inits[], self[].get._Initial.static_inits)
    return self
}

pub fn make_NoInitializer(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_NoInitializer_t
    return self
}

pub fn free_InitialValue(self: **struc InitialValue) none {
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
        -> AST_InitialValue_t {
            -> AST_Tentative_t {
                break
            }
        }
        -> AST_Initial_t {
            loop i: u64 = 0 while i < vec_size(self[][].get._Initial.static_inits) .. ++i {
                free_StaticInit(@(self[])[].get._Initial.static_inits[i])
            }
        }
        vec_delete(self[][].get._Initial.static_inits)
        break
        -> AST_NoInitializer_t {
            break
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

pub fn make_IdentifierAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(IdentifierAttr, self)"
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
        " #@MACRO@:sptr_move(InitialValue, *init, self->get._StaticAttr.init)"
        if init[] ~= self[].get._StaticAttr.init {
            " #@MACRO@:uptr_move(InitialValue, *init, self->get._StaticAttr.init)"
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
        " #@MACRO@:sptr_move(StaticInit, *static_init, self->get._ConstantAttr.static_init)"
        if static_init[] ~= self[].get._ConstantAttr.static_init {
            " #@MACRO@:uptr_move(StaticInit, *static_init, self->get._ConstantAttr.static_init)"
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
        " #@MACRO@:uptr_delete(*self)"
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
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol {
    self: *struc Symbol = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(Symbol, self)"
        free_Symbol(@self)
        self = cast<*struc Symbol>(malloc(sizeof<struc Symbol>))
        if not self {
            panic_sigabrt("alloc "                 "Symbol")
        }
    }
    self[].tag = AST_Symbol_t
    self[].type_t = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, *type_t, self->type_t)"
        if type_t[] ~= self[].type_t {
            " #@MACRO@:uptr_move(Type, *type_t, self->type_t)"
            free_Type(@self[].type_t)
            self[].type_t = type_t[]
            type_t[] = uptr_new()
        }
    }
    self[].attrs = uptr_new()
    if attrs[] ~= self[].attrs {
        " #@MACRO@:uptr_move(IdentifierAttr, *attrs, self->attrs)"
        free_IdentifierAttr(@self[].attrs)
        self[].attrs = attrs[]
        attrs[] = uptr_new()
    }
    return self
}

pub fn free_Symbol(self: **struc Symbol) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
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
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember {
    self: *struc StructMember = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(StructMember, self)"
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
        " #@MACRO@:sptr_move(Type, *member_type, self->member_type)"
        if member_type[] ~= self[].member_type {
            " #@MACRO@:uptr_move(Type, *member_type, self->member_type)"
            free_Type(@self[].member_type)
            self[].member_type = member_type[]
            member_type[] = uptr_new()
        }
    }
    return self
}

pub fn free_StructMember(self: **struc StructMember) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
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
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_StructTypedef(alignment: i32, size: i64, member_names: *vector_t(TIdentifier), members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef {
    self: *struc StructTypedef = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(StructTypedef, self)"
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
    vec_move(member_names[], self[].member_names)
    self[].members = map_new()
    if members[] ~= self[].members {
        " #@MACRO@:map_move(*members, self->members)"
        if self[].members {
            " #@MACRO@:map_delete(self->members)"
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
        " #@MACRO@:uptr_delete(*self)"
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
    vec_delete(self[][].member_names)
    loop i: u64 = 0 while i < (? ((self[])[].members) then (cast<*struc stbds_array_header>((((self[])[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@((self[])[].members[i]).value)
    }
    if (self[])[].members {
        " #@MACRO@:map_delete((*self)->members)"
        loop .. while 0 {
            cast<none>((? ((self[])[].members) ~= nil then stbds_hmfree_func(((self[])[].members) - 1, sizeof(((self[])[].members)[])) else cast<none>(0)))
            ((self[])[].members) = nil
        }
        (self[])[].members = map_new()
    }
    if self[] {
        " #@MACRO@:uptr_free(*self)"
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
    # TODO map_get(struct_typedef->members, vec_back(struct_typedef->member_names));
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@(((struct_typedef[].member_names)[(? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0) - 1]))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}
