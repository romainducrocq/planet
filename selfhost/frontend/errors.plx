m4_include(`errors.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl






m4_define(`MESSAGE_FATAL', `TODO')m4_dnl
m4_define(`MSG_unhandled_fatal_error', `0')m4_dnl
m4_define(`MSG_unsupported_os', `1')m4_dnl
m4_define(`MSG_unsupported_arch', `2')m4_dnl
m4_define(`MSG_unsupported_compiler', `3')m4_dnl
m4_define(`MSG_unsupported_cc_ver', `4')m4_dnl
m4_define(`MESSAGE_ARG', `TODO')m4_dnl
m4_define(`MSG_unhandled_arg_error', `100')m4_dnl
m4_define(`MSG_print_help', `101')m4_dnl
m4_define(`MSG_no_debug_arg', `102')m4_dnl
m4_define(`MSG_invalid_debug_arg', `103')m4_dnl
m4_define(`MSG_no_optim_1_arg', `104')m4_dnl
m4_define(`MSG_invalid_optim_1_arg', `105')m4_dnl
m4_define(`MSG_no_optim_2_arg', `106')m4_dnl
m4_define(`MSG_invalid_optim_2_arg', `107')m4_dnl
m4_define(`MSG_no_input_files_arg', `108')m4_dnl
m4_define(`MSG_no_stdlib_dir_arg', `109')m4_dnl
m4_define(`MSG_no_include_dir_arg', `110')m4_dnl
m4_define(`MESSAGE_UTIL', `TODO')m4_dnl
m4_define(`MSG_unhandled_util_error', `200')m4_dnl
m4_define(`MSG_failed_fread', `201')m4_dnl
m4_define(`MSG_failed_fwrite', `202')m4_dnl
m4_define(`MSG_failed_strtoi', `203')m4_dnl
m4_define(`MSG_failed_strtou', `204')m4_dnl
m4_define(`MSG_failed_strtod', `205')m4_dnl
m4_define(`MESSAGE_LEXER', `TODO')m4_dnl
m4_define(`MSG_unhandled_lexer_error', `300')m4_dnl
m4_define(`MSG_invalid_tok', `301')m4_dnl
m4_define(`MSG_import_in_line', `302')m4_dnl
m4_define(`MSG_use_in_line', `303')m4_dnl
m4_define(`MSG_failed_import', `304')m4_dnl
m4_define(`MSG_failed_use', `305')m4_dnl
m4_define(`MSG_preproc_macro', `306')m4_dnl
m4_define(`MSG_unmatched_close', `307')m4_dnl
m4_define(`MESSAGE_PARSER', `TODO')m4_dnl
m4_define(`MSG_unhandled_parser_error', `400')m4_dnl
m4_define(`MSG_unexpected_next_tok', `401')m4_dnl
m4_define(`MSG_reached_eof', `402')m4_dnl
m4_define(`MSG_overflow_long_const', `403')m4_dnl
m4_define(`MSG_overflow_ulong_const', `404')m4_dnl
m4_define(`MSG_expect_unop', `405')m4_dnl
m4_define(`MSG_expect_binop', `406')m4_dnl
m4_define(`MSG_expect_data_specifier', `407')m4_dnl
m4_define(`MSG_expect_specifier', `408')m4_dnl
m4_define(`MSG_expect_maybe_type', `409')m4_dnl
m4_define(`MSG_expect_open_sizeof', `410')m4_dnl
m4_define(`MSG_expect_expression', `411')m4_dnl
m4_define(`MSG_expect_assign', `412')m4_dnl
m4_define(`MSG_expect_datatype', `413')m4_dnl
m4_define(`MSG_expect_block', `414')m4_dnl
m4_define(`MSG_expect_declaration', `415')m4_dnl
m4_define(`MSG_expect_storage_class', `416')m4_dnl
m4_define(`MSG_incomplete_any', `417')m4_dnl
m4_define(`MSG_arr_size_not_int_const', `418')m4_dnl
m4_define(`MSG_case_value_not_int_const', `419')m4_dnl
m4_define(`MSG_empty_block', `420')m4_dnl
m4_define(`MSG_empty_compound_init', `421')m4_dnl
m4_define(`MSG_infinite_loop', `422')m4_dnl
m4_define(`MSG_loop_decl_not_auto', `423')m4_dnl
m4_define(`MSG_list_decl_not_auto', `424')m4_dnl
m4_define(`MSG_type_decl_not_auto', `425')m4_dnl
m4_define(`MSG_pub_in_block', `426')m4_dnl
m4_define(`MSG_data_at_toplvl', `427')m4_dnl
m4_define(`MESSAGE_SEMANTIC', `TODO')m4_dnl
m4_define(`MSG_unhandled_semantic_error', `500')m4_dnl
m4_define(`MSG_incomplete_arr', `501')m4_dnl
m4_define(`MSG_joint_ptr_mismatch', `502')m4_dnl
m4_define(`MSG_fun_used_as_var', `503')m4_dnl
m4_define(`MSG_illegal_cast', `504')m4_dnl
m4_define(`MSG_invalid_unary_op', `505')m4_dnl
m4_define(`MSG_invalid_binary_op', `506')m4_dnl
m4_define(`MSG_invalid_binary_ops', `507')m4_dnl
m4_define(`MSG_assign_to_void', `508')m4_dnl
m4_define(`MSG_assign_to_rvalue', `509')m4_dnl
m4_define(`MSG_invalid_condition', `510')m4_dnl
m4_define(`MSG_invalid_ternary_op', `511')m4_dnl
m4_define(`MSG_var_used_as_fun', `512')m4_dnl
m4_define(`MSG_call_with_wrong_argc', `513')m4_dnl
m4_define(`MSG_deref_not_ptr', `514')m4_dnl
m4_define(`MSG_addrof_rvalue', `515')m4_dnl
m4_define(`MSG_invalid_subscript', `516')m4_dnl
m4_define(`MSG_sizeof_incomplete', `517')m4_dnl
m4_define(`MSG_dot_not_struct', `518')m4_dnl
m4_define(`MSG_member_not_in_struct', `519')m4_dnl
m4_define(`MSG_arrow_not_struct_ptr', `520')m4_dnl
m4_define(`MSG_arrow_incomplete', `521')m4_dnl
m4_define(`MSG_exp_incomplete', `522')m4_dnl
m4_define(`MSG_ret_value_in_void_fun', `523')m4_dnl
m4_define(`MSG_no_ret_value_in_fun', `524')m4_dnl
m4_define(`MSG_invalid_if', `525')m4_dnl
m4_define(`MSG_invalid_while', `526')m4_dnl
m4_define(`MSG_invalid_do_while', `527')m4_dnl
m4_define(`MSG_invalid_for', `528')m4_dnl
m4_define(`MSG_invalid_switch', `529')m4_dnl
m4_define(`MSG_duplicate_case_value', `530')m4_dnl
m4_define(`MSG_string_init_not_char_arr', `531')m4_dnl
m4_define(`MSG_string_init_overflow', `532')m4_dnl
m4_define(`MSG_arr_init_overflow', `533')m4_dnl
m4_define(`MSG_struct_init_overflow', `534')m4_dnl
m4_define(`MSG_ret_arr', `535')m4_dnl
m4_define(`MSG_ret_incomplete', `536')m4_dnl
m4_define(`MSG_void_param', `537')m4_dnl
m4_define(`MSG_incomplete_param', `538')m4_dnl
m4_define(`MSG_redecl_fun_conflict', `539')m4_dnl
m4_define(`MSG_redef_fun', `540')m4_dnl
m4_define(`MSG_redecl_static_conflict', `541')m4_dnl
m4_define(`MSG_static_ptr_init_not_int', `542')m4_dnl
m4_define(`MSG_static_ptr_init_not_null', `543')m4_dnl
m4_define(`MSG_agg_init_with_single', `544')m4_dnl
m4_define(`MSG_static_ptr_init_string', `545')m4_dnl
m4_define(`MSG_static_init_not_const', `546')m4_dnl
m4_define(`MSG_scalar_init_with_compound', `547')m4_dnl
m4_define(`MSG_void_var_decl', `548')m4_dnl
m4_define(`MSG_incomplete_var_decl', `549')m4_dnl
m4_define(`MSG_redecl_var_conflict', `550')m4_dnl
m4_define(`MSG_redecl_var_storage', `551')m4_dnl
m4_define(`MSG_redef_extern_var', `552')m4_dnl
m4_define(`MSG_duplicate_member_decl', `553')m4_dnl
m4_define(`MSG_incomplete_member_decl', `554')m4_dnl
m4_define(`MSG_redecl_struct_in_scope', `555')m4_dnl
m4_define(`MSG_case_out_of_switch', `556')m4_dnl
m4_define(`MSG_default_out_of_switch', `557')m4_dnl
m4_define(`MSG_multiple_default', `558')m4_dnl
m4_define(`MSG_break_out_of_loop', `559')m4_dnl
m4_define(`MSG_continue_out_of_loop', `560')m4_dnl
m4_define(`MSG_undef_goto_target', `561')m4_dnl
m4_define(`MSG_redecl_struct_conflict', `562')m4_dnl
m4_define(`MSG_undef_struct_in_scope', `563')m4_dnl
m4_define(`MSG_undecl_var_in_scope', `564')m4_dnl
m4_define(`MSG_undecl_fun_in_scope', `565')m4_dnl
m4_define(`MSG_for_init_decl_not_auto', `566')m4_dnl
m4_define(`MSG_redef_label_in_scope', `567')m4_dnl
m4_define(`MSG_redecl_var_in_scope', `568')m4_dnl
m4_define(`MSG_def_nested_fun', `569')m4_dnl
m4_define(`MSG_decl_nested_static_fun', `570')m4_dnl
m4_define(`MSG_redecl_fun_in_scope', `571')m4_dnl
m4_define(`TOKEN_KIND', `TODO')m4_dnl
m4_define(`TOK_skip', `0')m4_dnl
m4_define(`TOK_line_break', `1')m4_dnl
m4_define(`TOK_open_paren', `2')m4_dnl
m4_define(`TOK_close_paren', `3')m4_dnl
m4_define(`TOK_open_brace', `4')m4_dnl
m4_define(`TOK_close_brace', `5')m4_dnl
m4_define(`TOK_open_bracket', `6')m4_dnl
m4_define(`TOK_close_bracket', `7')m4_dnl
m4_define(`TOK_comma_separator', `8')m4_dnl
m4_define(`TOK_semicolon', `9')m4_dnl
m4_define(`TOK_unop_complement', `10')m4_dnl
m4_define(`TOK_unop_neg', `11')m4_dnl
m4_define(`TOK_unop_not', `12')m4_dnl
m4_define(`TOK_unop_addrof', `13')m4_dnl
m4_define(`TOK_unop_incr', `14')m4_dnl
m4_define(`TOK_unop_decr', `15')m4_dnl
m4_define(`TOK_binop_add', `16')m4_dnl
m4_define(`TOK_binop_multiply', `17')m4_dnl
m4_define(`TOK_binop_divide', `18')m4_dnl
m4_define(`TOK_binop_remainder', `19')m4_dnl
m4_define(`TOK_binop_bitand', `20')m4_dnl
m4_define(`TOK_binop_bitor', `21')m4_dnl
m4_define(`TOK_binop_xor', `22')m4_dnl
m4_define(`TOK_binop_shiftleft', `23')m4_dnl
m4_define(`TOK_binop_shiftright', `24')m4_dnl
m4_define(`TOK_binop_and', `25')m4_dnl
m4_define(`TOK_binop_or', `26')m4_dnl
m4_define(`TOK_binop_eq', `27')m4_dnl
m4_define(`TOK_binop_ne', `28')m4_dnl
m4_define(`TOK_binop_lt', `29')m4_dnl
m4_define(`TOK_binop_le', `30')m4_dnl
m4_define(`TOK_binop_gt', `31')m4_dnl
m4_define(`TOK_binop_ge', `32')m4_dnl
m4_define(`TOK_assign', `33')m4_dnl
m4_define(`TOK_assign_type', `34')m4_dnl
m4_define(`TOK_assign_add', `35')m4_dnl
m4_define(`TOK_assign_subtract', `36')m4_dnl
m4_define(`TOK_assign_multiply', `37')m4_dnl
m4_define(`TOK_assign_divide', `38')m4_dnl
m4_define(`TOK_assign_remainder', `39')m4_dnl
m4_define(`TOK_assign_bitand', `40')m4_dnl
m4_define(`TOK_assign_bitor', `41')m4_dnl
m4_define(`TOK_assign_xor', `42')m4_dnl
m4_define(`TOK_assign_shiftleft', `43')m4_dnl
m4_define(`TOK_assign_shiftright', `44')m4_dnl
m4_define(`TOK_force_exec', `45')m4_dnl
m4_define(`TOK_ternary_if', `46')m4_dnl
m4_define(`TOK_compound_init', `47')m4_dnl
m4_define(`TOK_typeop_member', `48')m4_dnl
m4_define(`TOK_loop_post', `49')m4_dnl
m4_define(`TOK_match_with', `50')m4_dnl
m4_define(`TOK_key_char', `51')m4_dnl
m4_define(`TOK_key_string', `52')m4_dnl
m4_define(`TOK_key_i32', `53')m4_dnl
m4_define(`TOK_key_i64', `54')m4_dnl
m4_define(`TOK_key_i8', `55')m4_dnl
m4_define(`TOK_key_f64', `56')m4_dnl
m4_define(`TOK_key_u32', `57')m4_dnl
m4_define(`TOK_key_u64', `58')m4_dnl
m4_define(`TOK_key_u8', `59')m4_dnl
m4_define(`TOK_key_any', `60')m4_dnl
m4_define(`TOK_key_none', `61')m4_dnl
m4_define(`TOK_key_fn', `62')m4_dnl
m4_define(`TOK_key_struc', `63')m4_dnl
m4_define(`TOK_key_union', `64')m4_dnl
m4_define(`TOK_key_type', `65')m4_dnl
m4_define(`TOK_key_sizeof', `66')m4_dnl
m4_define(`TOK_key_return', `67')m4_dnl
m4_define(`TOK_key_cast', `68')m4_dnl
m4_define(`TOK_key_if', `69')m4_dnl
m4_define(`TOK_key_elif', `70')m4_dnl
m4_define(`TOK_key_else', `71')m4_dnl
m4_define(`TOK_key_then', `72')m4_dnl
m4_define(`TOK_key_jump', `73')m4_dnl
m4_define(`TOK_key_label', `74')m4_dnl
m4_define(`TOK_key_loop', `75')m4_dnl
m4_define(`TOK_key_while', `76')m4_dnl
m4_define(`TOK_key_match', `77')m4_dnl
m4_define(`TOK_key_otherwise', `78')m4_dnl
m4_define(`TOK_key_break', `79')m4_dnl
m4_define(`TOK_key_continue', `80')m4_dnl
m4_define(`TOK_key_pub', `81')m4_dnl
m4_define(`TOK_key_data', `82')m4_dnl
m4_define(`TOK_key_extrn', `83')m4_dnl
m4_define(`TOK_key_true', `84')m4_dnl
m4_define(`TOK_key_false', `85')m4_dnl
m4_define(`TOK_identifier', `86')m4_dnl
m4_define(`TOK_string_literal', `87')m4_dnl
m4_define(`TOK_char_const', `88')m4_dnl
m4_define(`TOK_int_const', `89')m4_dnl
m4_define(`TOK_long_const', `90')m4_dnl
m4_define(`TOK_uint_const', `91')m4_dnl
m4_define(`TOK_ulong_const', `92')m4_dnl
m4_define(`TOK_dbl_const', `93')m4_dnl
m4_define(`TOK_m4_prefix', `94')m4_dnl
m4_define(`TOK_import_file', `95')m4_dnl
m4_define(`TOK_import_force', `96')m4_dnl
m4_define(`TOK_use_file', `97')m4_dnl
m4_define(`TOK_use_force', `98')m4_dnl
m4_define(`TOK_error', `99')m4_dnl
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
type struc ErrorsContext;
type struc FileIoContext;
type struc IdentifierContext;

type struc Token(tok_kind: i32, tok: u64, info_at: u64)

pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32;

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
type struc CUnaryOp;
type struc CBinaryOp;
type struc CAbstractDeclarator;
type struc CParam;
type struc CDeclarator;
type struc CExp;
type struc CStatement;
type struc CForInit;
type struc CBlock;
type struc CBlockItem;
type struc CStorageClass;
type struc CInitializer;
type struc CMemberDeclaration;
type struc CStructDeclaration;
type struc CFunctionDeclaration;
type struc CVariableDeclaration;
type struc CDeclaration;
type struc CProgram;

type struc CUnaryOp(tag: i32)
pub fn make_CUnaryOp(tag: i32) struc CUnaryOp;
m4_define(`init_CUnaryOp', `TODO')m4_dnl
m4_define(`init_CComplement', `TODO')m4_dnl
m4_define(`init_CNegate', `TODO')m4_dnl
m4_define(`init_CNot', `TODO')m4_dnl
m4_define(`init_CPrefix', `TODO')m4_dnl
m4_define(`init_CPostfix', `TODO')m4_dnl

type struc CBinaryOp(tag: i32)
pub fn make_CBinaryOp(tag: i32) struc CBinaryOp;
m4_define(`init_CBinaryOp', `TODO')m4_dnl
m4_define(`init_CAdd', `TODO')m4_dnl
m4_define(`init_CSubtract', `TODO')m4_dnl
m4_define(`init_CMultiply', `TODO')m4_dnl
m4_define(`init_CDivide', `TODO')m4_dnl
m4_define(`init_CRemainder', `TODO')m4_dnl
m4_define(`init_CBitAnd', `TODO')m4_dnl
m4_define(`init_CBitOr', `TODO')m4_dnl
m4_define(`init_CBitXor', `TODO')m4_dnl
m4_define(`init_CBitShiftLeft', `TODO')m4_dnl
m4_define(`init_CBitShiftRight', `TODO')m4_dnl
m4_define(`init_CBitShrArithmetic', `TODO')m4_dnl
m4_define(`init_CAnd', `TODO')m4_dnl
m4_define(`init_COr', `TODO')m4_dnl
m4_define(`init_CEqual', `TODO')m4_dnl
m4_define(`init_CNotEqual', `TODO')m4_dnl
m4_define(`init_CLessThan', `TODO')m4_dnl
m4_define(`init_CLessOrEqual', `TODO')m4_dnl
m4_define(`init_CGreaterThan', `TODO')m4_dnl
m4_define(`init_CGreaterOrEqual', `TODO')m4_dnl

type struc CAbstractPointer(abstract_decltor: *struc CAbstractDeclarator)

type struc CAbstractArray(size: i64, abstract_decltor: *struc CAbstractDeclarator)

type struc CAbstractBase(_empty: char)

type union _CAbstractDeclarator(_CAbstractPointer: struc CAbstractPointer, _CAbstractArray: struc CAbstractArray, _CAbstractBase: struc CAbstractBase)

type struc CAbstractDeclarator(tag: i32, get: union _CAbstractDeclarator)
pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator;
pub fn make_CAbstractPointer(abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractArray(size: i64, abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractBase(none) *struc CAbstractDeclarator;
pub fn free_CAbstractDeclarator(self: **struc CAbstractDeclarator) none;

type struc CParam(tag: i32, decltor: *struc CDeclarator, param_type: *struc Type)
pub fn make_CParam(decltor: **struc CDeclarator, param_type: **struc Type) *struc CParam;
pub fn free_CParam(self: **struc CParam) none;

type struc CIdent(name: u64)

type struc CPointerDeclarator(decltor: *struc CDeclarator)

type struc CArrayDeclarator(size: i64, decltor: *struc CDeclarator)

type struc CFunDeclarator(param_list: **struc CParam, decltor: *struc CDeclarator)

type union _CDeclarator(_CIdent: struc CIdent, _CPointerDeclarator: struc CPointerDeclarator, _CArrayDeclarator: struc CArrayDeclarator, _CFunDeclarator: struc CFunDeclarator)

type struc CDeclarator(tag: i32, get: union _CDeclarator)
pub fn make_CDeclarator(none) *struc CDeclarator;
pub fn make_CIdent(name: u64) *struc CDeclarator;
pub fn make_CPointerDeclarator(decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CArrayDeclarator(size: i64, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CFunDeclarator(param_list: ***struc CParam, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn free_CDeclarator(self: **struc CDeclarator) none;

type struc CConstant(constant: *struc CConst, _base: *struc CExp)

type struc CString(literal: *struc CStringLiteral, _base: *struc CExp)

type struc CVar(name: u64, _base: *struc CExp)

type struc CCast(exp: *struc CExp, target_type: *struc Type, _base: *struc CExp)

type struc CUnary(unop: struc CUnaryOp, exp: *struc CExp, _base: *struc CExp)

type struc CBinary(binop: struc CBinaryOp, exp_left: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CAssignment(unop: struc CUnaryOp, exp_left: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CConditional(condition: *struc CExp, exp_middle: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CFunctionCall(name: u64, args: **struc CExp, _base: *struc CExp)

type struc CDereference(exp: *struc CExp, _base: *struc CExp)

type struc CAddrOf(exp: *struc CExp, _base: *struc CExp)

type struc CSubscript(primary_exp: *struc CExp, subscript_exp: *struc CExp, _base: *struc CExp)

type struc CSizeOf(exp: *struc CExp, _base: *struc CExp)

type struc CSizeOfT(target_type: *struc Type, _base: *struc CExp)

type struc CDot(member: u64, structure: *struc CExp, _base: *struc CExp)

type struc CArrow(member: u64, pointer: *struc CExp, _base: *struc CExp)

type union _CExp(_CConstant: struc CConstant, _CString: struc CString, _CVar: struc CVar, _CCast: struc CCast, _CUnary: struc CUnary, _CBinary: struc CBinary, _CAssignment: struc CAssignment, _CConditional: struc CConditional, _CFunctionCall: struc CFunctionCall, _CDereference: struc CDereference, _CAddrOf: struc CAddrOf, _CSubscript: struc CSubscript, _CSizeOf: struc CSizeOf, _CSizeOfT: struc CSizeOfT, _CDot: struc CDot, _CArrow: struc CArrow)

type struc CExp(tag: i32, exp_type: *struc Type, info_at: u64, get: union _CExp)
pub fn make_CExp(info_at: u64) *struc CExp;
pub fn make_CConstant(constant: **struc CConst, info_at: u64) *struc CExp;
pub fn make_CString(literal: **struc CStringLiteral, info_at: u64) *struc CExp;
pub fn make_CVar(name: u64, info_at: u64) *struc CExp;
pub fn make_CCast(exp: **struc CExp, target_type: **struc Type, info_at: u64) *struc CExp;
pub fn make_CUnary(unop: *struc CUnaryOp, exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CBinary(binop: *struc CBinaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CAssignment(unop: *struc CUnaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CConditional(condition: **struc CExp, exp_middle: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CFunctionCall(name: u64, args: ***struc CExp, info_at: u64) *struc CExp;
pub fn make_CDereference(exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CAddrOf(exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CSubscript(primary_exp: **struc CExp, subscript_exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CSizeOf(exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CSizeOfT(target_type: **struc Type, info_at: u64) *struc CExp;
pub fn make_CDot(member: u64, structure: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CArrow(member: u64, pointer: **struc CExp, info_at: u64) *struc CExp;
pub fn free_CExp(self: **struc CExp) none;

type struc CReturn(exp: *struc CExp, info_at: u64)

type struc CExpression(exp: *struc CExp)

type struc CIf(condition: *struc CExp, then_fi: *struc CStatement, else_fi: *struc CStatement)

type struc CGoto(target: u64, info_at: u64)

type struc CLabel(target: u64, jump_to: *struc CStatement, info_at: u64)

type struc CCompound(block: *struc CBlock)

type struc CWhile(target: u64, condition: *struc CExp, body: *struc CStatement)

type struc CDoWhile(target: u64, condition: *struc CExp, body: *struc CStatement)

type struc CFor(target: u64, init: *struc CForInit, condition: *struc CExp, post: *struc CExp, body: *struc CStatement)

type struc CSwitch(target: u64, is_default: i32, lookup: *struc CExp, body: *struc CStatement, cases: **struc CExp)

type struc CCase(target: u64, value: *struc CExp, jump_to: *struc CStatement)

type struc CDefault(target: u64, jump_to: *struc CStatement, info_at: u64)

type struc CBreak(target: u64, info_at: u64)

type struc CContinue(target: u64, info_at: u64)

type struc CNull(_empty: char)

type union _CStatement(_CReturn: struc CReturn, _CExpression: struc CExpression, _CIf: struc CIf, _CGoto: struc CGoto, _CLabel: struc CLabel, _CCompound: struc CCompound, _CWhile: struc CWhile, _CDoWhile: struc CDoWhile, _CFor: struc CFor, _CSwitch: struc CSwitch, _CCase: struc CCase, _CDefault: struc CDefault, _CBreak: struc CBreak, _CContinue: struc CContinue, _CNull: struc CNull)

type struc CStatement(tag: i32, get: union _CStatement)
pub fn make_CStatement(none) *struc CStatement;
pub fn make_CReturn(exp: **struc CExp, info_at: u64) *struc CStatement;
pub fn make_CExpression(exp: **struc CExp) *struc CStatement;
pub fn make_CIf(condition: **struc CExp, then_fi: **struc CStatement, else_fi: **struc CStatement) *struc CStatement;
pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement;
pub fn make_CLabel(target: u64, jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CCompound(block: **struc CBlock) *struc CStatement;
pub fn make_CWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CDoWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CFor(init: **struc CForInit, condition: **struc CExp, post: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CSwitch(lookup: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CCase(value: **struc CExp, jump_to: **struc CStatement) *struc CStatement;
pub fn make_CDefault(jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CBreak(info_at: u64) *struc CStatement;
pub fn make_CContinue(info_at: u64) *struc CStatement;
pub fn make_CNull(none) *struc CStatement;
pub fn free_CStatement(self: **struc CStatement) none;

type struc CInitDecl(init: *struc CVariableDeclaration)

type struc CInitExp(init: *struc CExp)

type union _CForInit(_CInitDecl: struc CInitDecl, _CInitExp: struc CInitExp)

type struc CForInit(tag: i32, get: union _CForInit)
pub fn make_CForInit(none) *struc CForInit;
pub fn make_CInitDecl(init: **struc CVariableDeclaration) *struc CForInit;
pub fn make_CInitExp(init: **struc CExp) *struc CForInit;
pub fn free_CForInit(self: **struc CForInit) none;

type struc CB(block_items: **struc CBlockItem)

type union _CBlock(_CB: struc CB)

type struc CBlock(tag: i32, get: union _CBlock)
pub fn make_CBlock(none) *struc CBlock;
pub fn make_CB(block_items: ***struc CBlockItem) *struc CBlock;
pub fn free_CBlock(self: **struc CBlock) none;

type struc CS(statement: *struc CStatement)

type struc CD(declaration: *struc CDeclaration)

type union _CBlockItem(_CS: struc CS, _CD: struc CD)

type struc CBlockItem(tag: i32, get: union _CBlockItem)
pub fn make_CBlockItem(none) *struc CBlockItem;
pub fn make_CS(statement: **struc CStatement) *struc CBlockItem;
pub fn make_CD(declaration: **struc CDeclaration) *struc CBlockItem;
pub fn free_CBlockItem(self: **struc CBlockItem) none;

type struc CStorageClass(tag: i32)
pub fn make_CStorageClass(tag: i32) struc CStorageClass;
m4_define(`init_CStorageClass', `TODO')m4_dnl
m4_define(`init_CStatic', `TODO')m4_dnl
m4_define(`init_CExtern', `TODO')m4_dnl

type struc CSingleInit(exp: *struc CExp, _base: *struc CInitializer)

type struc CCompoundInit(initializers: **struc CInitializer, _base: *struc CInitializer)

type union _CInitializer(_CSingleInit: struc CSingleInit, _CCompoundInit: struc CCompoundInit)

type struc CInitializer(tag: i32, init_type: *struc Type, get: union _CInitializer)
pub fn make_CInitializer(none) *struc CInitializer;
pub fn make_CSingleInit(exp: **struc CExp) *struc CInitializer;
pub fn make_CCompoundInit(initializers: ***struc CInitializer) *struc CInitializer;
pub fn free_CInitializer(self: **struc CInitializer) none;

type struc CMemberDeclaration(tag: i32, member_name: u64, member_type: *struc Type, info_at: u64)
pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration;
pub fn free_CMemberDeclaration(self: **struc CMemberDeclaration) none;

type struc CStructDeclaration(tag: i32, tag_name: u64, is_union: i32, members: **struc CMemberDeclaration, info_at: u64)
pub fn make_CStructDeclaration(tag_name: u64, is_union: i32, members: ***struc CMemberDeclaration, info_at: u64) *struc CStructDeclaration;
pub fn free_CStructDeclaration(self: **struc CStructDeclaration) none;

type struc CFunctionDeclaration(tag: i32, name: u64, params: *u64, body: *struc CBlock, fun_type: *struc Type, storage_class: struc CStorageClass, info_at: u64)
pub fn make_CFunctionDeclaration(name: u64, params: **u64, body: **struc CBlock, fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration;
pub fn free_CFunctionDeclaration(self: **struc CFunctionDeclaration) none;

type struc CVariableDeclaration(tag: i32, name: u64, init: *struc CInitializer, var_type: *struc Type, storage_class: struc CStorageClass, info_at: u64)
pub fn make_CVariableDeclaration(name: u64, init: **struc CInitializer, var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration;
pub fn free_CVariableDeclaration(self: **struc CVariableDeclaration) none;

type struc CFunDecl(fun_decl: *struc CFunctionDeclaration)

type struc CVarDecl(var_decl: *struc CVariableDeclaration)

type struc CStructDecl(struct_decl: *struc CStructDeclaration)

type union _CDeclaration(_CFunDecl: struc CFunDecl, _CVarDecl: struc CVarDecl, _CStructDecl: struc CStructDecl)

type struc CDeclaration(tag: i32, get: union _CDeclaration)
pub fn make_CDeclaration(none) *struc CDeclaration;
pub fn make_CFunDecl(fun_decl: **struc CFunctionDeclaration) *struc CDeclaration;
pub fn make_CVarDecl(var_decl: **struc CVariableDeclaration) *struc CDeclaration;
pub fn make_CStructDecl(struct_decl: **struc CStructDeclaration) *struc CDeclaration;
pub fn free_CDeclaration(self: **struc CDeclaration) none;

type struc CProgram(tag: i32, declarations: **struc CDeclaration)
pub fn make_CProgram(declarations: ***struc CDeclaration) *struc CProgram;
pub fn free_CProgram(self: **struc CProgram) none;

pub fn get_tok_kind_fmt(tok_kind: i32) string {
    match tok_kind {
        -> TOK_line_break {
            return "line break"
        }
        -> TOK_open_paren {
            return "("
        }
        -> TOK_close_paren {
            return ")"
        }
        -> TOK_open_brace {
            return "{"
        }
        -> TOK_close_brace {
            return "}"
        }
        -> TOK_open_bracket {
            return "["
        }
        -> TOK_close_bracket {
            return "]"
        }
        -> TOK_comma_separator {
            return ","
        }
        -> TOK_semicolon {
            return ";"
        }
        -> TOK_unop_complement {
            return "~"
        }
        -> TOK_unop_neg {
            return "-"
        }
        -> TOK_unop_not {
            return "not"
        }
        -> TOK_unop_addrof {
            return "@"
        }
        -> TOK_unop_incr {
            return "++"
        }
        -> TOK_unop_decr {
            return "--"
        }
        -> TOK_binop_add {
            return "+"
        }
        -> TOK_binop_multiply {
            return "*"
        }
        -> TOK_binop_divide {
            return "/"
        }
        -> TOK_binop_remainder {
            return "%"
        }
        -> TOK_binop_bitand {
            return "&"
        }
        -> TOK_binop_bitor {
            return "|"
        }
        -> TOK_binop_xor {
            return "^"
        }
        -> TOK_binop_shiftleft {
            return "<<"
        }
        -> TOK_binop_shiftright {
            return ">>"
        }
        -> TOK_binop_and {
            return "and"
        }
        -> TOK_binop_or {
            return "or"
        }
        -> TOK_binop_eq {
            return "=="
        }
        -> TOK_binop_ne {
            return "~="
        }
        -> TOK_binop_lt {
            return "<"
        }
        -> TOK_binop_le {
            return "<="
        }
        -> TOK_binop_gt {
            return ">"
        }
        -> TOK_binop_ge {
            return ">="
        }
        -> TOK_assign {
            return "="
        }
        -> TOK_assign_type {
            return ":"
        }
        -> TOK_assign_add {
            return "+="
        }
        -> TOK_assign_subtract {
            return "-="
        }
        -> TOK_assign_multiply {
            return "*="
        }
        -> TOK_assign_divide {
            return "/="
        }
        -> TOK_assign_remainder {
            return "%="
        }
        -> TOK_assign_bitand {
            return "&="
        }
        -> TOK_assign_bitor {
            return "|="
        }
        -> TOK_assign_xor {
            return "^="
        }
        -> TOK_assign_shiftleft {
            return "<<="
        }
        -> TOK_assign_shiftright {
            return ">>="
        }
        -> TOK_force_exec {
            return "!"
        }
        -> TOK_ternary_if {
            return "?"
        }
        -> TOK_compound_init {
            return "$"
        }
        -> TOK_typeop_member {
            return "."
        }
        -> TOK_loop_post {
            return ".."
        }
        -> TOK_match_with {
            return "->"
        }
        -> TOK_key_char {
            return "char"
        }
        -> TOK_key_string {
            return "string"
        }
        -> TOK_key_i32 {
            return "i32"
        }
        -> TOK_key_i64 {
            return "i64"
        }
        -> TOK_key_i8 {
            return "i8"
        }
        -> TOK_key_f64 {
            return "f64"
        }
        -> TOK_key_u32 {
            return "u32"
        }
        -> TOK_key_u64 {
            return "u64"
        }
        -> TOK_key_u8 {
            return "u8"
        }
        -> TOK_key_any {
            return "any"
        }
        -> TOK_key_none {
            return "none"
        }
        -> TOK_key_fn {
            return "fn"
        }
        -> TOK_key_struc {
            return "struc"
        }
        -> TOK_key_union {
            return "union"
        }
        -> TOK_key_type {
            return "type"
        }
        -> TOK_key_sizeof {
            return "sizeof"
        }
        -> TOK_key_return {
            return "return"
        }
        -> TOK_key_cast {
            return "cast"
        }
        -> TOK_key_if {
            return "if"
        }
        -> TOK_key_elif {
            return "elif"
        }
        -> TOK_key_else {
            return "else"
        }
        -> TOK_key_then {
            return "then"
        }
        -> TOK_key_jump {
            return "jump"
        }
        -> TOK_key_label {
            return "label"
        }
        -> TOK_key_loop {
            return "loop"
        }
        -> TOK_key_while {
            return "while"
        }
        -> TOK_key_match {
            return "match"
        }
        -> TOK_key_otherwise {
            return "otherwise"
        }
        -> TOK_key_break {
            return "break"
        }
        -> TOK_key_continue {
            return "continue"
        }
        -> TOK_key_pub {
            return "pub"
        }
        -> TOK_key_data {
            return "data"
        }
        -> TOK_key_extrn {
            return "extrn"
        }
        -> TOK_key_true {
            return "true"
        }
        -> TOK_key_false {
            return "false"
        }
        -> TOK_identifier {
            return "identifier"
        }
        -> TOK_string_literal {
            return "const string"
        }
        -> TOK_char_const {
            return "const char"
        }
        -> TOK_int_const {
            return "const i32"
        }
        -> TOK_long_const {
            return "const i64"
        }
        -> TOK_uint_const {
            return "const u32"
        }
        -> TOK_ulong_const {
            return "const u64"
        }
        -> TOK_dbl_const {
            return "const f64"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_tok_fmt(ctx: *struc IdentifierContext, token: *struc Token) string {
    match token[].tok_kind {
        -> TOK_identifier {
            -> TOK_string_literal {
                -> TOK_char_const {
                    -> TOK_int_const {
                        -> TOK_long_const {
                            -> TOK_uint_const {
                                -> TOK_ulong_const {
                                    -> TOK_dbl_const {
                                        return ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((token[].tok))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return get_tok_kind_fmt(token[].tok_kind)
        }
    }
}

pub fn get_const_fmt(node: *struc CConst) string {
    match node[].tag {
        -> AST_CConstInt_t {
            return "i32"
        }
        -> AST_CConstLong_t {
            return "i64"
        }
        -> AST_CConstUInt_t {
            return "u32"
        }
        -> AST_CConstULong_t {
            return "u64"
        }
        -> AST_CConstDouble_t {
            return "f64"
        }
        -> AST_CConstChar_t {
            return "char"
        }
        -> AST_CConstUChar_t {
            return "u8"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_storage_class_fmt(node: *struc CStorageClass) string {
    match node[].tag {
        -> AST_CStatic_t {
            return "data"
        }
        -> AST_CExtern_t {
            return "extrn"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_unop_fmt(node: *struc CUnaryOp) string {
    match node[].tag {
        -> AST_CComplement_t {
            return "~"
        }
        -> AST_CNegate_t {
            return "-"
        }
        -> AST_CNot_t {
            return "not"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_binop_fmt(node: *struc CBinaryOp) string {
    match node[].tag {
        -> AST_CAdd_t {
            return "+"
        }
        -> AST_CSubtract_t {
            return "-"
        }
        -> AST_CMultiply_t {
            return "*"
        }
        -> AST_CDivide_t {
            return "/"
        }
        -> AST_CRemainder_t {
            return "%"
        }
        -> AST_CBitAnd_t {
            return "&"
        }
        -> AST_CBitOr_t {
            return "|"
        }
        -> AST_CBitXor_t {
            return "^"
        }
        -> AST_CBitShiftLeft_t {
            return "<<"
        }
        -> AST_CBitShiftRight_t {
            return ">>"
        }
        -> AST_CBitShrArithmetic_t {
            return ">>"
        }
        -> AST_CAnd_t {
            return "and"
        }
        -> AST_COr_t {
            return "or"
        }
        -> AST_CEqual_t {
            return "=="
        }
        -> AST_CNotEqual_t {
            return "~="
        }
        -> AST_CLessThan_t {
            return "<"
        }
        -> AST_CLessOrEqual_t {
            return "<="
        }
        -> AST_CGreaterThan_t {
            return ">"
        }
        -> AST_CGreaterOrEqual_t {
            return ">="
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_assign_fmt(node: *struc CBinaryOp, unop: *struc CUnaryOp) string {
    if not node {
        return "="
    }
    match unop[].tag {
        -> AST_CUnaryOp_t {
            break
        }
        -> AST_CPrefix_t {
            match node[].tag {
                -> AST_CAdd_t {
                    return "prefix ++"
                }
                -> AST_CSubtract_t {
                    return "prefix --"
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        -> AST_CPostfix_t {
            match node[].tag {
                -> AST_CAdd_t {
                    return "postfix ++"
                }
                -> AST_CSubtract_t {
                    return "postfix --"
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    match node[].tag {
        -> AST_CAdd_t {
            return "+="
        }
        -> AST_CSubtract_t {
            return "-="
        }
        -> AST_CMultiply_t {
            return "*="
        }
        -> AST_CDivide_t {
            return "/="
        }
        -> AST_CRemainder_t {
            return "%="
        }
        -> AST_CBitAnd_t {
            return "&="
        }
        -> AST_CBitOr_t {
            return "|="
        }
        -> AST_CBitXor_t {
            return "^="
        }
        -> AST_CBitShiftLeft_t {
            return "<<="
        }
        -> AST_CBitShiftRight_t {
            return ">>="
        }
        -> AST_CBitShrArithmetic_t {
            return ">>="
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string) string {
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((name))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name_fmt[] {
        "@MACRO@:str_copy(value, *name_fmt)"
        if name_fmt[] {
            "@MACRO@:str_delete(*name_fmt)"
            sdsfree(name_fmt[])
            name_fmt[] = ? nil then sdsnew(nil) else nil
        }
        name_fmt[] = sdsdup(value)
    }
    loop i: u64 = sdslen(name_fmt[]) while i-- > 0 {
        if (name_fmt[])[i] == "."[0] {
            loop .. while 0 {
                "@MACRO@:str_substr(*name_fmt, 0, i - 1)"
                sdsrange(name_fmt[], 0, i - 1)
            }
            break
        }
    }
    return name_fmt[]
}

pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string) string {
    struct_fmt[] = ? is_union then ? "union " then sdsnew("union ") else nil else ? "struc " then sdsnew("struc ") else nil
    {
        name_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            "@MACRO@:str_append(*struct_fmt, get_name_fmt(ctx, name, &name_fmt))"
            struct_fmt[] = sdscat(struct_fmt[], get_name_fmt(ctx, name, @name_fmt))
        }
        if name_fmt {
            "@MACRO@:str_delete(name_fmt)"
            sdsfree(name_fmt)
            name_fmt = ? nil then sdsnew(nil) else nil
        }
    }
    return struct_fmt[]
}

pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string) string {
    fun_fmt[] = ? "(" then sdsnew("(") else nil
    if ((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            "@MACRO@:str_append(*fun_fmt, \"none\")"
            fun_fmt[] = sdscat(fun_fmt[], "none")
        }
    }
    else {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            "@MACRO@:str_append(*fun_fmt, get_type_fmt(ctx, fun_type->param_types[0], &type_fmt))"
            fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[0], @type_fmt))
        }
        if type_fmt {
            "@MACRO@:str_delete(type_fmt)"
            sdsfree(type_fmt)
            type_fmt = ? nil then sdsnew(nil) else nil
        }
    }
    loop i: u64 = 1 while i < (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            "@MACRO@:str_append(*fun_fmt, \", \")"
            fun_fmt[] = sdscat(fun_fmt[], ", ")
        }
        {
            type_fmt: string = ? nil then sdsnew(nil) else nil
            loop .. while 0 {
                "@MACRO@:str_append(*fun_fmt, get_type_fmt(ctx, fun_type->param_types[i], &type_fmt))"
                fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[i], @type_fmt))
            }
            if type_fmt {
                "@MACRO@:str_delete(type_fmt)"
                sdsfree(type_fmt)
                type_fmt = ? nil then sdsnew(nil) else nil
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:str_append(*fun_fmt, \") -> \")"
        fun_fmt[] = sdscat(fun_fmt[], ") -> ")
    }
    {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            "@MACRO@:str_append(*fun_fmt, get_type_fmt(ctx, fun_type->ret_type, &type_fmt))"
            fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].ret_type, @type_fmt))
        }
        if type_fmt {
            "@MACRO@:str_delete(type_fmt)"
            sdsfree(type_fmt)
            type_fmt = ? nil then sdsnew(nil) else nil
        }
    }
    return fun_fmt[]
}

pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string) string {
    ptr_fmt[] = ? "*" then sdsnew("*") else nil
    loop while ptr_type[].ref_type[].tag == AST_Pointer_t {
        ptr_type = @ptr_type[].ref_type[].get._Pointer
        loop .. while 0 {
            "@MACRO@:str_append(*ptr_fmt, \"*\")"
            ptr_fmt[] = sdscat(ptr_fmt[], "*")
        }
    }
    if ptr_type[].ref_type[].tag == AST_Void_t {
        loop .. while 0 {
            "@MACRO@:str_append(*ptr_fmt, \"any\")"
            ptr_fmt[] = sdscat(ptr_fmt[], "any")
        }
    }
    else {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            "@MACRO@:str_append(*ptr_fmt, get_type_fmt(ctx, ptr_type->ref_type, &type_fmt))"
            ptr_fmt[] = sdscat(ptr_fmt[], get_type_fmt(ctx, ptr_type[].ref_type, @type_fmt))
        }
        if type_fmt {
            "@MACRO@:str_delete(type_fmt)"
            sdsfree(type_fmt)
            type_fmt = ? nil then sdsnew(nil) else nil
        }
    }
    return ptr_fmt[]
}

pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string) string {
    arr_fmt[] = ? "[" then sdsnew("[") else nil
    {
        strto_size: string = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        loop .. while 0 {
            "@MACRO@:str_append(*arr_fmt, strto_size)"
            arr_fmt[] = sdscat(arr_fmt[], strto_size)
        }
        if strto_size {
            "@MACRO@:str_delete(strto_size)"
            sdsfree(strto_size)
            strto_size = ? nil then sdsnew(nil) else nil
        }
    }
    loop .. while 0 {
        "@MACRO@:str_append(*arr_fmt, \"]\")"
        arr_fmt[] = sdscat(arr_fmt[], "]")
    }
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        loop .. while 0 {
            "@MACRO@:str_append(*arr_fmt, \"[\")"
            arr_fmt[] = sdscat(arr_fmt[], "[")
        }
        {
            strto_size: string = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
            loop .. while 0 {
                "@MACRO@:str_append(*arr_fmt, strto_size)"
                arr_fmt[] = sdscat(arr_fmt[], strto_size)
            }
            if strto_size {
                "@MACRO@:str_delete(strto_size)"
                sdsfree(strto_size)
                strto_size = ? nil then sdsnew(nil) else nil
            }
        }
        loop .. while 0 {
            "@MACRO@:str_append(*arr_fmt, \"]\")"
            arr_fmt[] = sdscat(arr_fmt[], "]")
        }
    }
    if arr_type[].elem_type[].tag == AST_Void_t {
        loop .. while 0 {
            "@MACRO@:str_append(*arr_fmt, \"any\")"
            arr_fmt[] = sdscat(arr_fmt[], "any")
        }
    }
    else {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            "@MACRO@:str_append(*arr_fmt, get_type_fmt(ctx, arr_type->elem_type, &type_fmt))"
            arr_fmt[] = sdscat(arr_fmt[], get_type_fmt(ctx, arr_type[].elem_type, @type_fmt))
        }
        if type_fmt {
            "@MACRO@:str_delete(type_fmt)"
            sdsfree(type_fmt)
            type_fmt = ? nil then sdsnew(nil) else nil
        }
    }
    return arr_fmt[]
}

pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string) string {
    return get_struct_name_fmt(ctx, struct_type[].tag_name, struct_type[].is_union, struct_fmt)
}

pub fn get_type_fmt(ctx: *struc IdentifierContext, type_t: *struc Type, type_fmt: *string) string {
    match type_t[].tag {
        -> AST_Char_t {
            return "char"
        }
        -> AST_SChar_t {
            return "i8"
        }
        -> AST_UChar_t {
            return "u8"
        }
        -> AST_Int_t {
            return "i32"
        }
        -> AST_Long_t {
            return "i64"
        }
        -> AST_UInt_t {
            return "u32"
        }
        -> AST_ULong_t {
            return "u64"
        }
        -> AST_Double_t {
            return "f64"
        }
        -> AST_Void_t {
            return "none"
        }
        -> AST_FunType_t {
            return get_fun_fmt(ctx, @type_t[].get._FunType, type_fmt)
        }
        -> AST_Pointer_t {
            return get_ptr_fmt(ctx, @type_t[].get._Pointer, type_fmt)
        }
        -> AST_Array_t {
            return get_arr_fmt(ctx, @type_t[].get._Array, type_fmt)
        }
        -> AST_Structure_t {
            return get_struct_fmt(ctx, @type_t[].get._Structure, type_fmt)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

m4_define(`EM_CSTR', `TODO')m4_dnl
m4_define(`EM_VARG', `TODO')m4_dnl
m4_define(`PAD_ERR_0', `TODO')m4_dnl
m4_define(`PAD_ERR_1', `TODO')m4_dnl
m4_define(`PAD_ERR_2', `TODO')m4_dnl
m4_define(`PAD_ERR_3', `TODO')m4_dnl
m4_define(`RET_ERR', `TODO')m4_dnl

pub fn get_fatal_msg(msg: i32) string {
    match msg {
        -> MSG_unsupported_os {
            return "(no. %s) "             "%s%s"             "‘%s’"             " operating system is not supported, requires "             "‘"             "GNU/Linux"             "’"             " (x86_64) or "             "‘"             "MacOS"             "’"
        }
        -> MSG_unsupported_arch {
            return "(no. %s) "             "%s%s"             "‘%s’"             " architecture is not supported, requires "             "‘"             "x86_64"             "’"
        }
        -> MSG_unsupported_compiler {
            return "(no. %s) "             "%s%s"             "‘%s’"             " compiler is not supported, requires "             "‘"             "gcc"             "’"             " >= 8.1.0"
        }
        -> MSG_unsupported_cc_ver {
            return "(no. %s) "             ""             "‘"             "gcc"             "’"             " %s.%s.%s is not supported, requires "             "‘"             "gcc"             "’"             " >= 8.1.0"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_arg_msg(msg: i32) string {
    match msg {
        -> MSG_print_help {
            return "(no. %s) "             "%s%s"             "Usage: %s [--help] Debug OptimL1 OptimL2 FILE StdlibDir SourceDir [IncludeDir...]\n"             "    [--help]:         print help and exit\n"             "    Debug:            print debug info (0..1|251..255)\n"             "    OptimL1:          optimization level 1 mask (0..15)\n"             "    OptimL2:          optimization level 2 enum (0..2)\n"             "    FILE:             source file to compile\n"             "    StdlibDir:        standard lib include path\n"             "    SourceDir:        source file include path\n"             "    [IncludeDir...]:  add a list of paths to include path\n"             "see "             "‘"             "driver.sh"             "’"
        }
        -> MSG_no_debug_arg {
            return "(no. %s) "             "%s%s%s"             "no debug code passed in first argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_invalid_debug_arg {
            return "(no. %s) "             "%s%s"             "invalid debug code "             "‘%s’"             " passed in first argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_no_optim_1_arg {
            return "(no. %s) "             "%s%s%s"             "no level 1 optimization mask passed in second argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_invalid_optim_1_arg {
            return "(no. %s) "             "%s%s"             "invalid level 1 optimization mask "             "‘%s’"             " passed in second argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_no_optim_2_arg {
            return "(no. %s) "             "%s%s%s"             "no level 2 optimization code passed in third argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_invalid_optim_2_arg {
            return "(no. %s) "             "%s%s"             "invalid level 2 optimization code "             "‘%s’"             " passed in third argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_no_input_files_arg {
            return "(no. %s) "             "%s%s%s"             "no input file passed in fourth argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_no_stdlib_dir_arg {
            return "(no. %s) "             "%s%s%s"             "no standard lib directory passed in fifth argument, see "             "‘"             "--help"             "’"
        }
        -> MSG_no_include_dir_arg {
            return "(no. %s) "             "%s%s%s"             "no include directories passed in sixth argument, see "             "‘"             "--help"             "’"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_util_msg(msg: i32) string {
    match msg {
        -> MSG_failed_fread {
            return "(no. %s) "             "%s%s"             "cannot read input file "             "‘%s’"
        }
        -> MSG_failed_fwrite {
            return "(no. %s) "             "%s%s"             "cannot write output file "             "‘%s’"
        }
        -> MSG_failed_strtoi {
            return "(no. %s) "             "%s%s"             "cannot interpret string "             "‘%s’"             " to an integer value"
        }
        -> MSG_failed_strtou {
            return "(no. %s) "             "%s%s"             "cannot interpret string "             "‘%s’"             " to an unsigned integer value"
        }
        -> MSG_failed_strtod {
            return "(no. %s) "             "%s%s"             "cannot interpret string "             "‘%s’"             " to a floating point value"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_lexer_msg(msg: i32) string {
    match msg {
        -> MSG_invalid_tok {
            return "(no. %s) "             "%s%s"             "found invalid token "             "‘%s’"
        }
        -> MSG_failed_import {
            return "(no. %s) "             "%s%s"             "cannot find "             "‘%s’"             " header file in "             "‘"             "import"             "’"             " directive search"
        }
        -> MSG_failed_use {
            return "(no. %s) "             "%s%s"             "cannot find "             "‘%s’"             " header file in "             "‘"             "use"             "’"             " directive search"
        }
        -> MSG_import_in_line {
            return "(no. %s) "             "%s%s"             "cannot search "             "‘%s’"             " in a line, "             "‘"             "import"             "’"             " requires its own line"
        }
        -> MSG_use_in_line {
            return "(no. %s) "             "%s%s"             "cannot search "             "‘%s’"             " in a line, "             "‘"             "use"             "’"             " requires its own line"
        }
        -> MSG_preproc_macro {
            return "(no. %s) "             "%s%s"             "found m4 macro "             "‘%s’"             ", preprocess with "             "‘"             "-E"             "’"             " or see "             "‘"             "--help"             "’"
        }
        -> MSG_unmatched_close {
            return "(no. %s) "             "%s%s"             "found unmatched bracket "             "‘%s’"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_parser_msg(msg: i32) string {
    match msg {
        -> MSG_unexpected_next_tok {
            return "(no. %s) "             "%s"             "found token "             "‘%s’"             ", but expected "             "‘%s’"             " next"
        }
        -> MSG_reached_eof {
            return "(no. %s) "             "%s%s%s"             "reached end of file, but expected declaration or statement next"
        }
        -> MSG_overflow_long_const {
            return "(no. %s) "             "%s%s"             "cannot represent "             "‘%s’"             " as a 64 bits signed integer constant, very large number"
        }
        -> MSG_overflow_ulong_const {
            return "(no. %s) "             "%s%s"             "cannot represent "             "‘%s’"             " as a 64 bits unsigned integer constant, very large number"
        }
        -> MSG_expect_unop {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected unary operator "             "‘"             "~"             "’"             ", "             "‘"             "-"             "’"             " or "             "‘"             "not"             "’"             " next"
        }
        -> MSG_expect_binop {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected binary operator "             "‘"             "="             "’"             ", "             "‘"             "+"             "’"             ", "             "‘"             "+="             "’"             ", "             "‘"             "-"             "’"             ", "             "‘"             "-="             "’"             ", "             "‘"             "*"             "’"             ", "             "‘"             "*="             "’"             ", "             "‘"             "/"             "’"             ", "             "‘"             "/="             "’"             ", "             "‘"             "%"             "’"             ", "             "‘"             "%="             "’"             ", "             "‘"             "&"             "’"             ", "             "‘"             "&="             "’"             ", "             "‘"             "|"             "’"             ", "             "‘"             "|="             "’"             ", "             "‘"             "^"             "’"             ", "             "‘"             "^="             "’"             ", "             "‘"             "<<"             "’"             ", "             "‘"             "<<="             "’"             ", "             "‘"             ">>"             "’"             ", "             "‘"             ">>="             "’"             ", "             "‘"             "and"             "’"             ", "             "‘"             "or"             "’"             ", "             "‘"             "=="             "’"             ", "             "‘"             "~="             "’"             ", "             "‘"             "<"             "’"             ", "             "‘"             "<="             "’"             ", "             "‘"             ">"             "’"             " or "             "‘"             ">="             "’"             " next"
        }
        -> MSG_expect_data_specifier {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected datatype specifier "             "‘"             "struc"             "’"             " or "             "‘"             "union"             "’"             " next"
        }
        -> MSG_expect_specifier {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected type specifier "             "‘"             "char"             "’"             ", "             "‘"             "string"             "’"             ", "             "‘"             "bool"             "’"             ", "             "‘"             "i32"             "’"             ", "             "‘"             "i64"             "’"             ", "             "‘"             "i8"             "’"             ", "             "‘"             "f64"             "’"             ", "             "‘"             "u32"             "’"             ", "             "‘"             "u64"             "’"             ", "             "‘"             "u8"             "’"             ", "             "‘"             "struc"             "’"             ", "             "‘"             "union"             "’"             ", "             "‘"             "*"             "’"             ", "             "‘"             "*any"             "’"             " or "             "‘"             "["             "’"             " next"
        }
        -> MSG_expect_maybe_type {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected maybe type specifier "             "‘"             "none"             "’"             ", "             "‘"             "char"             "’"             ", "             "‘"             "string"             "’"             ", "             "‘"             "bool"             "’"             ", "             "‘"             "i32"             "’"             ", "             "‘"             "i64"             "’"             ", "             "‘"             "i8"             "’"             ", "             "‘"             "f64"             "’"             ", "             "‘"             "u32"             "’"             ", "             "‘"             "u64"             "’"             ", "             "‘"             "u8"             "’"             ", "             "‘"             "struc"             "’"             ", "             "‘"             "union"             "’"             ", "             "‘"             "*"             "’"             ", "             "‘"             "*any"             "’"             " or "             "‘"             "["             "’"             " next"
        }
        -> MSG_expect_open_sizeof {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected sizeof "             "‘"             "<"             "’"             " or "             "‘"             "("             "’"             " next"
        }
        -> MSG_expect_expression {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected expression "             "‘"             "?"             "’"             ", "             "‘"             "~"             "’"             ", "             "‘"             "-"             "’"             ", "             "‘"             "not"             "’"             ", "             "‘"             "++"             "’"             ", "             "‘"             "--"             "’"             ", "             "‘"             "@"             "’"             ", "             "‘"             "sizeof"             "’"             ", "             "‘"             "cast"             "’"             ", "             "‘"             "identifier"             "’"             ", "             "‘"             "identifier("             "’"             ", "             "‘"             "("             "’"             ", "             "‘"             "const string"             "’"             ", "             "‘"             "const char"             "’"             ", "             "‘"             "const i32"             "’"             ", "             "‘"             "const i64"             "’"             ", "             "‘"             "const u32"             "’"             ", "             "‘"             "const u64"             "’"             ", "             "‘"             "const f64"             "’"             ", "             "‘"             "true"             "’"             ", "             "‘"             "false"             "’"             " or "             "‘"             "nil"             "’"             " next"
        }
        -> MSG_expect_assign {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected assignment "             "‘"             "="             "’"             " or "             "‘"             ";"             "’"             " next"
        }
        -> MSG_expect_datatype {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected member list "             "‘"             "("             "’"             " or "             "‘"             ";"             "’"             " next"
        }
        -> MSG_expect_block {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected block "             "‘"             "{"             "’"             " or "             "‘"             ";"             "’"             " next"
        }
        -> MSG_expect_declaration {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected declaration "             "‘"             "identifier"             "’"             ", "             "‘"             "fn"             "’"             " or "             "‘"             "type"             "’"             " next"
        }
        -> MSG_expect_storage_class {
            return "(no. %s) "             "%s%s"             "found token "             "‘%s’"             ", but expected storage class "             "‘"             "pub"             "’"             ", "             "‘"             "data"             "’"             ", "             "‘"             "extrn"             "’"             ", "             "‘"             "identifier"             "’"             ", "             "‘"             "fn"             "’"             " or "             "‘"             "type"             "’"             " next"
        }
        -> MSG_incomplete_any {
            return "(no. %s) "             "%s%s%s"             "incomplete type "             "‘"             "any"             "’"             " requires a pointer, or use "             "‘"             "none"             "’"             " instead"
        }
        -> MSG_arr_size_not_int_const {
            return "(no. %s) "             "%s%s"             "illegal array size "             "‘%s’"             ", requires a constant integer"
        }
        -> MSG_case_value_not_int_const {
            return "(no. %s) "             "%s%s"             "illegal "             "‘"             "->"             "’"             " value "             "‘%s’"             ", requires a constant integer"
        }
        -> MSG_empty_block {
            return "(no. %s) "             "%s%s%s"             "empty block requires at least one item, or use "             "‘"             ";"             "’"             " instead"
        }
        -> MSG_empty_compound_init {
            return "(no. %s) "             "%s%s%s"             "empty compound initializer requires at least one initializer"
        }
        -> MSG_infinite_loop {
            return "(no. %s) "             "%s%s%s"             "cannot exit "             "‘"             "loop"             "’"             ", infinite loop requires at least one statement"
        }
        -> MSG_loop_decl_not_auto {
            return "(no. %s) "             "%s%s"             "illegal storage "             "‘%s’"             ", cannot use storage class in "             "‘"             "loop"             "’"             " initialization"
        }
        -> MSG_list_decl_not_auto {
            return "(no. %s) "             "%s%s"             "illegal storage "             "‘%s’"             ", cannot use storage class in list declaration"
        }
        -> MSG_type_decl_not_auto {
            return "(no. %s) "             "%s%s"             "illegal storage "             "‘%s’"             ", cannot use storage class in type declaration"
        }
        -> MSG_pub_in_block {
            return "(no. %s) "             "%s%s%s"             "illegal storage class, cannot use "             "‘"             "pub"             "’"             " declaration in block"
        }
        -> MSG_data_at_toplvl {
            return "(no. %s) "             "%s%s%s"             "illegal storage class, cannot use "             "‘"             "data"             "’"             " declaration at top level"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn get_semantic_msg(msg: i32) string {
    match msg {
        -> MSG_incomplete_arr {
            return "(no. %s) "             "%s"             "array type "             "‘%s’"             " of incomplete type "             "‘%s’"             ", requires a complete type"
        }
        -> MSG_joint_ptr_mismatch {
            return "(no. %s) "             "%s"             "pointer type mismatch "             "‘%s’"             " and "             "‘%s’"             " in operator"
        }
        -> MSG_fun_used_as_var {
            return "(no. %s) "             "%s%s"             "function "             "‘%s’"             " used as a variable"
        }
        -> MSG_illegal_cast {
            return "(no. %s) "             "%s"             "illegal cast, cannot convert expression from type "             "‘%s’"             " to "             "‘%s’"
        }
        -> MSG_invalid_unary_op {
            return "(no. %s) "             "%s"             "cannot apply unary operator "             "‘%s’"             " on operand type "             "‘%s’"
        }
        -> MSG_invalid_binary_op {
            return "(no. %s) "             "%s"             "cannot apply binary operator "             "‘%s’"             " on operand type "             "‘%s’"
        }
        -> MSG_invalid_binary_ops {
            return "(no. %s) "             ""             "cannot apply binary operator "             "‘%s’"             " on operand types "             "‘%s’"             " and "             "‘%s’"
        }
        -> MSG_assign_to_void {
            return "(no. %s) "             "%s%s%s"             "cannot assign "             "‘"             "="             "’"             " to left operand type "             "‘"             "none"             "’"
        }
        -> MSG_assign_to_rvalue {
            return "(no. %s) "             "%s%s"             "assignment "             "‘%s’"             " requires lvalue left operand, but got rvalue"
        }
        -> MSG_invalid_condition {
            return "(no. %s) "             "%s%s"             "cannot apply conditional "             "‘"             "then"             "’"             " on condition operand type "             "‘%s’"
        }
        -> MSG_invalid_ternary_op {
            return "(no. %s) "             "%s"             "cannot apply ternary operator "             "‘"             "else"             "’"             " on operand types "             "‘%s’"             " and "             "‘%s’"
        }
        -> MSG_var_used_as_fun {
            return "(no. %s) "             "%s%s"             "variable "             "‘%s’"             " used as a function"
        }
        -> MSG_call_with_wrong_argc {
            return "(no. %s) "             ""             "function "             "‘%s’"             " called with "             "‘%s’"             " arguments instead of "             "‘%s’"
        }
        -> MSG_deref_not_ptr {
            return "(no. %s) "             "%s%s"             "cannot apply dereference operator "             "‘"             "[]"             "’"             " on non-pointer type "             "‘%s’"
        }
        -> MSG_addrof_rvalue {
            return "(no. %s) "             "%s%s%s"             "addresssing "             "‘"             "@"             "’"             " requires lvalue operand, but got rvalue"
        }
        -> MSG_invalid_subscript {
            return "(no. %s) "             "%s"             "cannot subscript array with operand types "             "‘%s’"             " and "             "‘%s’"             ", requires a complete pointer and an integer types"
        }
        -> MSG_sizeof_incomplete {
            return "(no. %s) "             "%s%s"             "cannot get size with "             "‘"             "sizeof"             "’"             " operator on incomplete type "             "‘%s’"
        }
        -> MSG_dot_not_struct {
            return "(no. %s) "             "%s"             "cannot access datatype member "             "‘%s’"             " with dot operator "             "‘"             "."             "’"             " on non-datatype "             "‘%s’"
        }
        -> MSG_member_not_in_struct {
            return "(no. %s) "             "%s"             "datatype "             "‘%s’"             " has no member named "             "‘%s’"
        }
        -> MSG_arrow_not_struct_ptr {
            return "(no. %s) "             "%s"             "cannot access datatype member "             "‘%s’"             " with dereferenced dot operator "             "‘"             "[]."             "’"             " on non-pointer-to-datatype "             "‘%s’"
        }
        -> MSG_arrow_incomplete {
            return "(no. %s) "             "%s"             "cannot access datatype member "             "‘%s’"             " with dereferenced dot operator "             "‘"             "[]."             "’"             " on incomplete datatype "             "‘%s’"
        }
        -> MSG_exp_incomplete {
            return "(no. %s) "             "%s%s"             "incomplete datatype "             "‘%s’"             " in expression"
        }
        -> MSG_ret_value_in_void_fun {
            return "(no. %s) "             "%s%s"             "found "             "‘"             "return"             "’"             " value in function "             "‘%s’"             " returning type "             "‘"             "none"             "’"
        }
        -> MSG_no_ret_value_in_fun {
            return "(no. %s) "             "%s"             "found "             "‘"             "return"             "’"             " with no value in function "             "‘%s’"             " returning type "             "‘%s’"
        }
        -> MSG_invalid_if {
            return "(no. %s) "             "%s%s"             "cannot use "             "‘"             "if"             "’"             " statement with condition expression type "             "‘%s’"
        }
        -> MSG_invalid_while {
            return "(no. %s) "             "%s%s"             "cannot use "             "‘"             "loop while"             "’"             " statement with condition expression type "             "‘%s’"
        }
        -> MSG_invalid_do_while {
            return "(no. %s) "             "%s%s"             "cannot use "             "‘"             "loop .. while"             "’"             " statement with post-condition expression type "             "‘%s’"
        }
        -> MSG_invalid_for {
            return "(no. %s) "             "%s%s"             "cannot use "             "‘"             "loop"             "’"             " statement with "             "‘"             "while"             "’"             " condition expression type "             "‘%s’"
        }
        -> MSG_invalid_switch {
            return "(no. %s) "             "%s%s"             "cannot use "             "‘"             "match"             "’"             " statement with match expression type "             "‘%s’"             ", requires an integer type"
        }
        -> MSG_duplicate_case_value {
            return "(no. %s) "             "%s%s"             "found duplicate "             "‘"             "->"             "’"             " value "             "‘%s’"             " in "             "‘"             "match"             "’"             " statement"
        }
        -> MSG_string_init_not_char_arr {
            return "(no. %s) "             "%s%s"             "non-character array type "             "‘%s’"             " initialized from string constant"
        }
        -> MSG_string_init_overflow {
            return "(no. %s) "             "%s"             "size "             "‘%s’"             " string constant initialized with "             "‘%s’"             " characters"
        }
        -> MSG_arr_init_overflow {
            return "(no. %s) "             ""             "size "             "‘%s’"             " array type "             "‘%s’"             " initialized with "             "‘%s’"             " initializers"
        }
        -> MSG_struct_init_overflow {
            return "(no. %s) "             ""             "datatype "             "‘%s’"             " initialized with "             "‘%s’"             " members instead of "             "‘%s’"
        }
        -> MSG_ret_arr {
            return "(no. %s) "             "%s"             "function "             "‘%s’"             " returns array type "             "‘%s’"             ", instead of pointer type"
        }
        -> MSG_ret_incomplete {
            return "(no. %s) "             "%s"             "function "             "‘%s’"             " returns incomplete datatype "             "‘%s’"
        }
        -> MSG_void_param {
            return "(no. %s) "             "%s"             "function "             "‘%s’"             " declared with parameter "             "‘%s’"             " with type "             "‘"             "none"             "’"
        }
        -> MSG_incomplete_param {
            return "(no. %s) "             ""             "function "             "‘%s’"             " defined with parameter "             "‘%s’"             " with incomplete datatype "             "‘%s’"
        }
        -> MSG_redecl_fun_conflict {
            return "(no. %s) "             ""             "function "             "‘%s’"             " redeclared with function type "             "‘%s’"             ", but previous declaration has function type "             "‘%s’"
        }
        -> MSG_redef_fun {
            return "(no. %s) "             "%s"             "function "             "‘%s’"             " already defined with function type "             "‘%s’"
        }
        -> MSG_redecl_static_conflict {
            return "(no. %s) "             "%s%s"             "function "             "‘%s’"             " with "             "‘"             "data"             "’"             " storage class already declared non-static"
        }
        -> MSG_static_ptr_init_not_int {
            return "(no. %s) "             "%s"             "cannot statically initialize pointer type "             "‘%s’"             " from constant "             "‘%s’"             ", requires a constant integer"
        }
        -> MSG_static_ptr_init_not_null {
            return "(no. %s) "             "%s"             "cannot statically initialize pointer type "             "‘%s’"             " from non-zero value "             "‘%s’"
        }
        -> MSG_agg_init_with_single {
            return "(no. %s) "             "%s%s"             "aggregate type "             "‘%s’"             " statically initialized with single initializer"
        }
        -> MSG_static_ptr_init_string {
            return "(no. %s) "             "%s%s"             "non-character pointer type "             "‘%s’"             " statically initialized from string constant"
        }
        -> MSG_static_init_not_const {
            return "(no. %s) "             "%s%s"             "cannot statically initialize variable from non-constant type "             "‘%s’"             ", requires a constant"
        }
        -> MSG_scalar_init_with_compound {
            return "(no. %s) "             "%s%s"             "cannot initialize scalar type "             "‘%s’"             " with compound initializer"
        }
        -> MSG_void_var_decl {
            return "(no. %s) "             "%s%s"             "variable "             "‘%s’"             " declared with type "             "‘"             "none"             "’"
        }
        -> MSG_incomplete_var_decl {
            return "(no. %s) "             "%s"             "variable "             "‘%s’"             " declared with incomplete datatype "             "‘%s’"
        }
        -> MSG_redecl_var_conflict {
            return "(no. %s) "             ""             "variable "             "‘%s’"             " redeclared with conflicting type "             "‘%s’"             ", but previously declared with type "             "‘%s’"
        }
        -> MSG_redecl_var_storage {
            return "(no. %s) "             "%s%s"             "variable "             "‘%s’"             " redeclared with conflicting storage class"
        }
        -> MSG_redef_extern_var {
            return "(no. %s) "             "%s%s"             "illegal initializer, can only declare variable "             "‘%s’"             " with "             "‘"             "extrn"             "’"             " storage class"
        }
        -> MSG_duplicate_member_decl {
            return "(no. %s) "             "%s"             "datatype "             "‘%s’"             " declared with duplicate member name "             "‘%s’"
        }
        -> MSG_incomplete_member_decl {
            return "(no. %s) "             ""             "datatype "             "‘%s’"             " declared with member "             "‘%s’"             " with incomplete type "             "‘%s’"
        }
        -> MSG_redecl_struct_in_scope {
            return "(no. %s) "             "%s%s"             "datatype "             "‘%s’"             " already declared in this scope"
        }
        -> MSG_case_out_of_switch {
            return "(no. %s) "             "%s%s%s"             "found "             "‘"             "->"             "’"             " statement outside of "             "‘"             "match"             "’"
        }
        -> MSG_default_out_of_switch {
            return "(no. %s) "             "%s%s%s"             "found "             "‘"             "otherwise"             "’"             " statement outside of "             "‘"             "match"             "’"
        }
        -> MSG_multiple_default {
            return "(no. %s) "             "%s%s%s"             "found more than one "             "‘"             "otherwise"             "’"             " statement in "             "‘"             "match"             "’"
        }
        -> MSG_break_out_of_loop {
            return "(no. %s) "             "%s%s%s"             "found "             "‘"             "break"             "’"             " statement outside of "             "‘"             "loop"             "’"             " or "             "‘"             "match"             "’"
        }
        -> MSG_continue_out_of_loop {
            return "(no. %s) "             "%s%s%s"             "found "             "‘"             "continue"             "’"             " statement outside of "             "‘"             "loop"             "’"
        }
        -> MSG_undef_goto_target {
            return "(no. %s) "             "%s"             "found "             "‘"             "jump"             "’"             " statement, but "             "‘"             "label"             "’"             " with target "             "‘%s’"             " not defined in function "             "‘%s’"
        }
        -> MSG_redecl_struct_conflict {
            return "(no. %s) "             "%s"             "‘%s’"             " conflicts with datatype "             "‘%s’"             " previously declared or defined in this scope"
        }
        -> MSG_undef_struct_in_scope {
            return "(no. %s) "             "%s%s"             "datatype "             "‘%s’"             " not defined in this scope"
        }
        -> MSG_undecl_var_in_scope {
            return "(no. %s) "             "%s%s"             "variable "             "‘%s’"             " not declared in this scope"
        }
        -> MSG_undecl_fun_in_scope {
            return "(no. %s) "             "%s%s"             "function "             "‘%s’"             " not declared in this scope"
        }
        -> MSG_for_init_decl_not_auto {
            return "(no. %s) "             "%s"             "variable "             "‘%s’"             " declared with "             "‘%s’"             " storage class in "             "‘"             "loop"             "’"             " initialization"
        }
        -> MSG_redef_label_in_scope {
            return "(no. %s) "             "%s%s"             "‘"             "label"             "’"             " with target "             "‘%s’"             " already defined in this scope"
        }
        -> MSG_redecl_var_in_scope {
            return "(no. %s) "             "%s%s"             "variable "             "‘%s’"             " already declared in this scope"
        }
        -> MSG_def_nested_fun {
            return "(no. %s) "             "%s%s"             "function "             "‘%s’"             " defined inside another function, but nested function definition are not permitted"
        }
        -> MSG_decl_nested_static_fun {
            return "(no. %s) "             "%s%s"             "cannot declare nested function "             "‘%s’"             " in another function with "             "‘"             "data"             "’"             " storage class"
        }
        -> MSG_redecl_fun_in_scope {
            return "(no. %s) "             "%s%s"             "function "             "‘%s’"             " already declared in this scope"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}
