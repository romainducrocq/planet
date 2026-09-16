m4_ifdef(`_AST_AST_M4', `', `
m4_define(`_AST_AST_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

type struc CConst;
type struc CStringLiteral;

type struc CConstInt(value: i32)

type struc CConstLong(value: i64)

type struc CConstUInt(value: u32)

type struc CConstULong(value: u64)

type struc CConstDouble(value: f64)

type struc CConstChar(value: i8)

type struc CConstUChar(value: u8)

type union _CConst(_CConstInt: struc CConstInt, _CConstLong: struc CConstLong, _CConstUInt: struc CConstUInt, _CConstULong: struc CConstULong, _CConstDouble: struc CConstDouble, _CConstChar: struc CConstChar, _CConstUChar: struc CConstUChar)

type struc CConst(_ref_count: u64, tag: i32, get: union _CConst)
pub fn make_CConst(none) *struc CConst;
pub fn make_CConstInt(value: i32) *struc CConst;
pub fn make_CConstLong(value: i64) *struc CConst;
pub fn make_CConstUInt(value: u32) *struc CConst;
pub fn make_CConstULong(value: u64) *struc CConst;
pub fn make_CConstDouble(value: f64) *struc CConst;
pub fn make_CConstChar(value: i8) *struc CConst;
pub fn make_CConstUChar(value: u8) *struc CConst;
pub fn free_CConst(self: **struc CConst) none;

type struc CStringLiteral(_ref_count: u64, tag: i32, value: *i8)
pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral;
pub fn free_CStringLiteral(self: **struc CStringLiteral) none;

type struc PairTIdentifierstring_t(key: u64, value: string)

type struc IdentifierContext(label_count: u32, var_count: u32, struct_count: u32, hash_table: *struc PairTIdentifierstring_t)

pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64;
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64;
m4_define(`UID_SEPARATOR', `TODO')m4_dnl

')m4_dnl
