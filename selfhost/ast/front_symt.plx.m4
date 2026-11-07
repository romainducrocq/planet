m4_ifdef(`_AST_FRONT_SYMT_M4', `', `
m4_define(`_AST_FRONT_SYMT_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl

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

type struc FunType(param_reg_mask: u64, ret_reg_mask: u64, param_types: vector_t(shared_ptr_t(Type)), ret_type: shared_ptr_t(Type))

type struc Pointer(ref_type: shared_ptr_t(Type))

type struc Array(size: i64, elem_type: shared_ptr_t(Type))

type struc Structure(tag_name: u64, is_union: i32)

type union _Type(_Char: struc Char, _SChar: struc SChar, _UChar: struc UChar, _Int: struc Int, _Long: struc Long, _UInt: struc UInt, _ULong: struc ULong, _Double: struc Double, _Void: struc Void, _FunType: struc FunType, _Pointer: struc Pointer, _Array: struc Array, _Structure: struc Structure)

type struc Type(shared_ptr_impl(AST_T)
    get: union _Type)
pub fn make_Type(none) shared_ptr_t(Type);
pub fn make_Char(none) shared_ptr_t(Type);
pub fn make_SChar(none) shared_ptr_t(Type);
pub fn make_UChar(none) shared_ptr_t(Type);
pub fn make_Int(none) shared_ptr_t(Type);
pub fn make_Long(none) shared_ptr_t(Type);
pub fn make_UInt(none) shared_ptr_t(Type);
pub fn make_ULong(none) shared_ptr_t(Type);
pub fn make_Double(none) shared_ptr_t(Type);
pub fn make_Void(none) shared_ptr_t(Type);
pub fn make_FunType(param_types: *vector_t(shared_ptr_t(Type)), ret_type: *shared_ptr_t(Type)) shared_ptr_t(Type);
pub fn make_Pointer(ref_type: *shared_ptr_t(Type)) shared_ptr_t(Type);
pub fn make_Array(size: i64, elem_type: *shared_ptr_t(Type)) shared_ptr_t(Type);
pub fn make_Structure(tag_name: u64, is_union: i32) shared_ptr_t(Type);
pub fn free_Type(self: *shared_ptr_t(Type)) none;

type struc IntInit(value: i32)

type struc LongInit(value: i64)

type struc UIntInit(value: u32)

type struc ULongInit(value: u64)

type struc CharInit(value: TChar)

type struc UCharInit(value: TUChar)

type struc DoubleInit(dbl_const: u64)

type struc ZeroInit(byte: i64)

type struc StringInit(string_const: u64, is_null_term: i32, literal: shared_ptr_t(CStringLiteral))

type struc PointerInit(name: u64)

type union _StaticInit(_IntInit: struc IntInit, _LongInit: struc LongInit, _UIntInit: struc UIntInit, _ULongInit: struc ULongInit, _CharInit: struc CharInit, _UCharInit: struc UCharInit, _DoubleInit: struc DoubleInit, _ZeroInit: struc ZeroInit, _StringInit: struc StringInit, _PointerInit: struc PointerInit)

type struc StaticInit(shared_ptr_impl(AST_T)
    get: union _StaticInit)
pub fn make_StaticInit(none) shared_ptr_t(StaticInit);
pub fn make_IntInit(value: i32) shared_ptr_t(StaticInit);
pub fn make_LongInit(value: i64) shared_ptr_t(StaticInit);
pub fn make_UIntInit(value: u32) shared_ptr_t(StaticInit);
pub fn make_ULongInit(value: u64) shared_ptr_t(StaticInit);
pub fn make_CharInit(value: TChar) shared_ptr_t(StaticInit);
pub fn make_UCharInit(value: TUChar) shared_ptr_t(StaticInit);
pub fn make_DoubleInit(dbl_const: u64) shared_ptr_t(StaticInit);
pub fn make_ZeroInit(byte: i64) shared_ptr_t(StaticInit);
pub fn make_StringInit(string_const: u64, is_null_term: i32, literal: *shared_ptr_t(CStringLiteral)) shared_ptr_t(StaticInit);
pub fn make_PointerInit(name: u64) shared_ptr_t(StaticInit);
pub fn free_StaticInit(self: *shared_ptr_t(StaticInit)) none;

type struc Tentative(_empty: char)

type struc Initial(static_inits: vector_t(shared_ptr_t(StaticInit)))

type struc NoInitializer(_empty: char)

type union _InitialValue(_Tentative: struc Tentative, _Initial: struc Initial, _NoInitializer: struc NoInitializer)

type struc InitialValue(shared_ptr_impl(AST_T)
    get: union _InitialValue)
pub fn make_InitialValue(none) shared_ptr_t(InitialValue);
pub fn make_Tentative(none) shared_ptr_t(InitialValue);
pub fn make_Initial(static_inits: *vector_t(shared_ptr_t(StaticInit))) shared_ptr_t(InitialValue);
pub fn make_NoInitializer(none) shared_ptr_t(InitialValue);
pub fn free_InitialValue(self: *shared_ptr_t(InitialValue)) none;

type struc FunAttr(is_def: i32, is_glob: i32)

type struc StaticAttr(is_glob: i32, init: shared_ptr_t(InitialValue))

type struc ConstantAttr(static_init: shared_ptr_t(StaticInit))

type struc LocalAttr(_empty: char)

type union _IdentifierAttr(_FunAttr: struc FunAttr, _StaticAttr: struc StaticAttr, _ConstantAttr: struc ConstantAttr, _LocalAttr: struc LocalAttr)

type struc IdentifierAttr(unique_ptr_impl(AST_T)
    get: union _IdentifierAttr)
pub fn make_IdentifierAttr(none) unique_ptr_t(IdentifierAttr);
pub fn make_FunAttr(is_def: i32, is_glob: i32) unique_ptr_t(IdentifierAttr);
pub fn make_StaticAttr(is_glob: i32, init: *shared_ptr_t(InitialValue)) unique_ptr_t(IdentifierAttr);
pub fn make_ConstantAttr(static_init: *shared_ptr_t(StaticInit)) unique_ptr_t(IdentifierAttr);
pub fn make_LocalAttr(none) unique_ptr_t(IdentifierAttr);
pub fn free_IdentifierAttr(self: *unique_ptr_t(IdentifierAttr)) none;

type struc Symbol(unique_ptr_impl(AST_T)
    type_t: shared_ptr_t(Type), attrs: unique_ptr_t(IdentifierAttr))
pub fn make_Symbol(type_t: *shared_ptr_t(Type), attrs: *unique_ptr_t(IdentifierAttr)) unique_ptr_t(Symbol);
pub fn free_Symbol(self: *unique_ptr_t(Symbol)) none;

type struc StructMember(unique_ptr_impl(AST_T)
    offset: i64, member_type: shared_ptr_t(Type))
pub fn make_StructMember(offset: i64, member_type: *shared_ptr_t(Type)) unique_ptr_t(StructMember);
pub fn free_StructMember(self: *unique_ptr_t(StructMember)) none;
m4_define(`UPtrStructMember', `unique_ptr_t(StructMember)')m4_dnl

PairKeyValue(``TIdentifier'', ``UPtrStructMember'')

type struc StructTypedef(unique_ptr_impl(AST_T)
    alignment: i32, size: i64, member_names: vector_t(TIdentifier), members: hashmap_t(``TIdentifier'', ``UPtrStructMember''))
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: *vector_t(TIdentifier), members: *hashmap_t(``TIdentifier'', ``UPtrStructMember'')) unique_ptr_t(StructTypedef);
pub fn free_StructTypedef(self: *unique_ptr_t(StructTypedef)) none;

PairKeyValue(``TIdentifier'', u64)

PairKeyValue(``TIdentifier'', ``TIdentifier'')

m4_define(`UPtrStructTypedef', `unique_ptr_t(StructTypedef)')m4_dnl

PairKeyValue(``TIdentifier'', ``UPtrStructTypedef'')

m4_define(`UPtrSymbol', `unique_ptr_t(Symbol)')m4_dnl

PairKeyValue(``TIdentifier'', ``UPtrSymbol'')

ElementKey(``TIdentifier'')

type struc FrontEndContext(string_const_table: hashmap_t(``TIdentifier'', ``TIdentifier''), struct_typedef_table: hashmap_t(``TIdentifier'', ``UPtrStructTypedef''), symbol_table: hashmap_t(``TIdentifier'', ``UPtrSymbol''), addressed_set: hashset_t(``TIdentifier''))
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag_name: u64, member_name: u64) *struc StructMember;
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag_name: u64) *struc StructMember;

')m4_dnl
