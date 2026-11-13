m4_ifdef(`_AST_AST_M4', `', `
m4_define(`_AST_AST_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

########################################################################################################################

# Abstract syntax tree

########################################################################################################################

type struc CConst;
type struc CStringLiteral;

########################################################################################################################

# const = ConstInt(int)
#       | ConstLong(int)
#       | ConstUInt(int)
#       | ConstULong(int)
#       | ConstDouble(double)
#       | ConstChar(int)
#       | ConstUChar(int)

type struc CConstInt(value: TInt)

type struc CConstLong(value: TLong)

type struc CConstUInt(value: TUInt)

type struc CConstULong(value: TULong)

type struc CConstDouble(value: TDouble)

type struc CConstChar(value: TChar)

type struc CConstUChar(value: TUChar)

type union _CConst(_CConstInt: struc CConstInt, _CConstLong: struc CConstLong, _CConstUInt: struc CConstUInt, _CConstULong: struc CConstULong, _CConstDouble: struc CConstDouble, _CConstChar: struc CConstChar, _CConstUChar: struc CConstUChar)

type struc CConst(shared_ptr_impl(AST_T)
    get: union _CConst)
pub fn make_CConst(none) shared_ptr_t(CConst);
pub fn make_CConstInt(value: TInt) shared_ptr_t(CConst);
pub fn make_CConstLong(value: TLong) shared_ptr_t(CConst);
pub fn make_CConstUInt(value: TUInt) shared_ptr_t(CConst);
pub fn make_CConstULong(value: TULong) shared_ptr_t(CConst);
pub fn make_CConstDouble(value: TDouble) shared_ptr_t(CConst);
pub fn make_CConstChar(value: TChar) shared_ptr_t(CConst);
pub fn make_CConstUChar(value: TUChar) shared_ptr_t(CConst);
pub fn free_CConst(self: *shared_ptr_t(CConst)) none;

########################################################################################################################

# string = StringLiteral(int*)

type struc CStringLiteral(shared_ptr_impl(AST_T)
    value: vector_t(TChar))
pub fn make_CStringLiteral(value: *vector_t(TChar)) shared_ptr_t(CStringLiteral);
pub fn free_CStringLiteral(self: *shared_ptr_t(CStringLiteral)) none;

########################################################################################################################

PairKeyValue(``TIdentifier'', ``string_t'')

type struc IdentifierContext(label_count: u32, var_count: u32, struct_count: u32, hash_table: hashmap_t(``TIdentifier'', ``string_t''))

pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string_t) TIdentifier;
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string_t) TIdentifier;
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string_t) TIdentifier;
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string_t) TIdentifier;
m4_define(`UID_SEPARATOR', `"."')m4_dnl

')m4_dnl
