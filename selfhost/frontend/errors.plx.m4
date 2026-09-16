m4_ifdef(`_FRONTEND_ERRORS_M4', `', `
m4_define(`_FRONTEND_ERRORS_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

m4_include(`../frontend/messages.plx.m4')m4_dnl
m4_include(`../frontend/tokens.plx.m4')m4_dnl

type struc Token;
type struc FunType;
type struc Pointer;
type struc Array;
type struc Structure;
type struc Type;
type struc CConst;
type struc CUnaryOp;
type struc CBinaryOp;
type struc CStorageClass;
type struc IdentifierContext;
pub fn get_tok_kind_fmt(tok_kind: i32) string;
pub fn get_tok_fmt(ctx: *struc IdentifierContext, token: *struc Token) string;
pub fn get_const_fmt(node: *struc CConst) string;
pub fn get_storage_class_fmt(node: *struc CStorageClass) string;
pub fn get_unop_fmt(node: *struc CUnaryOp) string;
pub fn get_binop_fmt(node: *struc CBinaryOp) string;
pub fn get_assign_fmt(node: *struc CBinaryOp, unop: *struc CUnaryOp) string;
pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string) string;
pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string) string;
pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string) string;
pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string) string;
pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string) string;
pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string) string;
pub fn get_type_fmt(ctx: *struc IdentifierContext, type_t: *struc Type, type_fmt: *string) string;
m4_define(`str_get_fmt', `TODO')m4_dnl
m4_define(`str_fmt_tok', `TODO')m4_dnl
m4_define(`str_fmt_name', `TODO')m4_dnl
m4_define(`str_fmt_struct_name', `TODO')m4_dnl
m4_define(`str_fmt_fun', `TODO')m4_dnl
m4_define(`str_fmt_ptr', `TODO')m4_dnl
m4_define(`str_fmt_arr', `TODO')m4_dnl
m4_define(`str_fmt_struct', `TODO')m4_dnl
m4_define(`str_fmt_type', `TODO')m4_dnl
pub fn get_fatal_msg(msg: i32) string;
pub fn get_arg_msg(msg: i32) string;
pub fn get_util_msg(msg: i32) string;
pub fn get_lexer_msg(msg: i32) string;
pub fn get_parser_msg(msg: i32) string;
pub fn get_semantic_msg(msg: i32) string;
m4_define(`GET_MESSAGE', `TODO')m4_dnl
m4_define(`GET_MESSAGE_0', `TODO')m4_dnl
m4_define(`GET_MESSAGE_1', `TODO')m4_dnl
m4_define(`GET_MESSAGE_2', `TODO')m4_dnl
m4_define(`GET_MESSAGE_3', `TODO')m4_dnl
m4_define(`GET_FATAL_MSG', `TODO')m4_dnl
m4_define(`GET_ARG_MSG', `TODO')m4_dnl
m4_define(`GET_UTIL_MSG', `TODO')m4_dnl
m4_define(`GET_LEXER_MSG', `TODO')m4_dnl
m4_define(`GET_PARSER_MSG', `TODO')m4_dnl
m4_define(`GET_SEMANTIC_MSG', `TODO')m4_dnl
m4_define(`STRINGIFY', `TODO')m4_dnl
m4_define(`GET_VERSION', `TODO')m4_dnl
m4_define(`GCC_VERSION', `TODO')m4_dnl
m4_define(`CLANG_VERSION', `TODO')m4_dnl

')m4_dnl
