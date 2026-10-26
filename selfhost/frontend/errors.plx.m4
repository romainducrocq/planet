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
pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string_t) string;
pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string_t) string;
pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string_t) string;
pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string_t) string;
pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string_t) string;
pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string_t) string;
pub fn get_type_fmt(ctx: *struc IdentifierContext, type_t: *struc Type, type_fmt: *string_t) string;
m4_define(`str_get_fmt', `get_$1_fmt(ctx[].identifiers, m4_shift($@))')m4_dnl
m4_define(`str_fmt_tok', `str_get_fmt(tok, $1)')m4_dnl
m4_define(`str_fmt_name', `str_get_fmt(name, $1, $2)')m4_dnl
m4_define(`str_fmt_struct_name', `str_get_fmt(struct_name, $1, $2, $3)')m4_dnl
m4_define(`str_fmt_fun', `str_get_fmt(fun, $1, $2)')m4_dnl
m4_define(`str_fmt_ptr', `str_get_fmt(ptr, $1, $2)')m4_dnl
m4_define(`str_fmt_arr', `str_get_fmt(arr, $1, $2)')m4_dnl
m4_define(`str_fmt_struct', `str_get_fmt(struct, $1, $2)')m4_dnl
m4_define(`str_fmt_type', `str_get_fmt(type, $1, $2)')m4_dnl
pub fn get_fatal_msg(msg: i32) string;
pub fn get_arg_msg(msg: i32) string;
pub fn get_util_msg(msg: i32) string;
pub fn get_lexer_msg(msg: i32) string;
pub fn get_parser_msg(msg: i32) string;
pub fn get_semantic_msg(msg: i32) string;
m4_define(`GET_MESSAGE', `get_$1_msg($2), "$2"')m4_dnl
m4_define(`GET_MESSAGE_0', `GET_MESSAGE($1, $2), "", "", ""')m4_dnl
m4_define(`GET_MESSAGE_1', `GET_MESSAGE($1, $2), "", "", $3')m4_dnl
m4_define(`GET_MESSAGE_2', `GET_MESSAGE($1, $2), "", $3, $4')m4_dnl
m4_define(`GET_MESSAGE_3', `GET_MESSAGE($1, $2), $3, $4, $5')m4_dnl
m4_define(`GET_FATAL_MSG', `GET_MESSAGE_$1(fatal, m4_shift($@))')m4_dnl
m4_define(`GET_ARG_MSG', `GET_MESSAGE_$1(arg, m4_shift($@))')m4_dnl
m4_define(`GET_UTIL_MSG', `GET_MESSAGE_$1(util, m4_shift($@))')m4_dnl
m4_define(`GET_LEXER_MSG', `GET_MESSAGE_$1(lexer, m4_shift($@))')m4_dnl
m4_define(`GET_PARSER_MSG', `GET_MESSAGE_$1(parser, m4_shift($@))')m4_dnl
m4_define(`GET_SEMANTIC_MSG', `GET_MESSAGE_$1(semantic, m4_shift($@))')m4_dnl
m4_define(`STRINGIFY', `TODO')m4_dnl
m4_define(`GET_VERSION', `TODO')m4_dnl
m4_define(`GCC_VERSION', `TODO')m4_dnl
m4_define(`CLANG_VERSION', `TODO')m4_dnl

')m4_dnl
