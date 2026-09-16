m4_include(`errors.plx.m4')m4_dnl
m4_include(`idents.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl
m4_include(`parser.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
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
m4_define(`LABEL_KIND', `TODO')m4_dnl
m4_define(`LBL_Land_false', `0')m4_dnl
m4_define(`LBL_Land_true', `1')m4_dnl
m4_define(`LBL_Lbreak', `2')m4_dnl
m4_define(`LBL_Lcase', `3')m4_dnl
m4_define(`LBL_Lcontinue', `4')m4_dnl
m4_define(`LBL_Ldefault', `5')m4_dnl
m4_define(`LBL_Ldo_while', `6')m4_dnl
m4_define(`LBL_Ldo_while_start', `7')m4_dnl
m4_define(`LBL_Lfor', `8')m4_dnl
m4_define(`LBL_Lfor_start', `9')m4_dnl
m4_define(`LBL_Lif_else', `10')m4_dnl
m4_define(`LBL_Lif_false', `11')m4_dnl
m4_define(`LBL_Lor_false', `12')m4_dnl
m4_define(`LBL_Lor_true', `13')m4_dnl
m4_define(`LBL_Lstring', `14')m4_dnl
m4_define(`LBL_Lswitch', `15')m4_dnl
m4_define(`LBL_Lternary_else', `16')m4_dnl
m4_define(`LBL_Lternary_false', `17')m4_dnl
m4_define(`LBL_Lwhile', `18')m4_dnl
type struc CExp;
type struc IdentifierContext;
pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: u64) u64;
pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64;
pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64;
pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64;
pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64;
pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64;
pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64;
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
type struc Token;
type struc CProgram;
type struc ErrorsContext;
type struc IdentifierContext;
pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32;
type struc ErrorsContext;
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: **i8) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: *i8) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;

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

type struc ParserContext(errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, pop_idx: u64, next_tok: *struc Token, peek_tok: *struc Token, peek_tok_i: *struc Token, p_toks: **struc Token)

m4_define(`Ctx', `TODO')m4_dnl

fn expect_next(ctx: *struc ParserContext, next_tok: *struc Token, expect_tok: i32) i32 {
    _errval: i32 = 0
    if next_tok[].tok_kind ~= expect_tok {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, next_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_unexpected_next_tok), "MSG_unexpected_next_tok", "", get_tok_fmt(ctx[].identifiers, next_tok), get_tok_kind_fmt(expect_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, next_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn pop_next(ctx: *struc ParserContext) i32 {
    _errval: i32 = 0
    if ctx[].pop_idx >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*ctx->p_toks)[((*ctx->p_toks) ? ((struct stbds_array_header*)(*ctx->p_toks)-1)->length : 0) - 1].info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_reached_eof), "MSG_reached_eof", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].next_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    ctx[].pop_idx++
    label _Lfinally
    return _errval
}

fn peek_next(ctx: *struc ParserContext) i32 {
    _errval: i32 = 0
    if ctx[].pop_idx >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*ctx->p_toks)[((*ctx->p_toks) ? ((struct stbds_array_header*)(*ctx->p_toks)-1)->length : 0) - 1].info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_reached_eof), "MSG_reached_eof", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].peek_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    label _Lfinally
    return _errval
}

fn peek_next_i(ctx: *struc ParserContext, i: u64) i32 {
    _errval: i32 = 0
    if i == 0 {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].peek_tok_i = ctx[].peek_tok
        jump _Lfinally
    }
    if ctx[].pop_idx + i >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*ctx->p_toks)[((*ctx->p_toks) ? ((struct stbds_array_header*)(*ctx->p_toks)-1)->length : 0) - 1].info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_reached_eof), "MSG_reached_eof", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].peek_tok_i = @(ctx[].p_toks[])[ctx[].pop_idx + i]
    label _Lfinally
    return _errval
}

fn parse_identifier(ctx: *struc ParserContext, identifier: *u64) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    identifier[] = ctx[].next_tok[].tok
    label _Lfinally
    return _errval
}

fn parse_string_literal(ctx: *struc ParserContext, literal: **struc CStringLiteral) i32 {
    value: *i8 = vec_new()
    _errval: i32 = 0
    string_to_literal(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), @value)
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == TOK_string_literal {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        string_to_literal(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), @value)
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    literal[] = make_CStringLiteral(@value)
    label _Lfinally
    if value {
        "@MACRO@:vec_delete(value)"
        loop .. while 0 {
            cast<none>((? (value) then free((cast<*struc stbds_array_header>((value)) - 1)) else cast<none>(0)))
            (value) = nil
        }
        value = vec_new()
    }
    return _errval
}

fn parse_int_const(intmax: i64) *struc CConst {
    value: i32 = cast<i32>(intmax)
    return make_CConstInt(value)
}

fn parse_char_const(ctx: *struc ParserContext) *struc CConst {
    value: i32 = string_to_char_ascii(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value))
    return make_CConstInt(value)
}

fn parse_long_const(intmax: i64) *struc CConst {
    value: i64 = cast<i64>(intmax)
    return make_CConstLong(value)
}

fn parse_dbl_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: f64;
    loop .. while 0 {
        "@MACRO@:TRY(string_to_dbl( ctx->errors, map_get(ctx->identifiers->hash_table, ctx->next_tok->tok), ctx->next_tok->info_at, &value))"
        _errval = string_to_dbl(ctx[].errors, ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant[] = make_CConstDouble(value)
    label _Lfinally
    return _errval
}

fn parse_uint_const(uintmax: u64) *struc CConst {
    value: u32 = cast<u32>(uintmax)
    return make_CConstUInt(value)
}

fn parse_ulong_const(uintmax: u64) *struc CConst {
    value: u64 = cast<u64>(uintmax)
    return make_CConstULong(value)
}

fn parse_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: i64;
    strto_value: string;
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_true {
            constant[] = make_CConstInt(1)
            jump _Lfinally
        }
        -> TOK_key_false {
            constant[] = make_CConstInt(0)
            jump _Lfinally
        }
        -> TOK_char_const {
            constant[] = parse_char_const(ctx)
            jump _Lfinally
        }
        -> TOK_dbl_const {
            loop .. while 0 {
                "@MACRO@:TRY(parse_dbl_const(ctx, constant))"
                _errval = parse_dbl_const(ctx, constant)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        jump _Lfinally
        otherwise {
            break
        }
    }
    strto_value = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    loop .. while 0 {
        "@MACRO@:TRY(string_to_long(ctx->errors, strto_value, ctx->next_tok->info_at, &value))"
        _errval = string_to_long(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if value > 9223372036854775807l {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_overflow_long_const), "MSG_overflow_long_const", "", "", strto_value) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].next_tok[].tok_kind == TOK_int_const and value <= 2147483647l {
        constant[] = parse_int_const(value)
    }
    else {
        constant[] = parse_long_const(value)
    }
    label _Lfinally
    return _errval
}

fn parse_unsigned_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: u64;
    strto_value: string;
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    strto_value = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    loop .. while 0 {
        "@MACRO@:TRY(string_to_ulong(ctx->errors, strto_value, ctx->next_tok->info_at, &value))"
        _errval = string_to_ulong(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if value > 18446744073709551615ul {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_overflow_ulong_const), "MSG_overflow_ulong_const", "", "", strto_value) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].next_tok[].tok_kind == TOK_uint_const and value <= 4294967295ul {
        constant[] = parse_uint_const(value)
    }
    else {
        constant[] = parse_ulong_const(value)
    }
    label _Lfinally
    return _errval
}

fn parse_unop(ctx: *struc ParserContext, unop: *struc CUnaryOp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_unop_complement {
            unop[] = make_CUnaryOp(AST_CComplement_t)
            break
        }
        -> TOK_unop_neg {
            unop[] = make_CUnaryOp(AST_CNegate_t)
            break
        }
        -> TOK_unop_not {
            unop[] = make_CUnaryOp(AST_CNot_t)
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_unop), "MSG_expect_unop", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_binop(ctx: *struc ParserContext, binop: *struc CBinaryOp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_binop_add {
            -> TOK_assign_add {
                -> TOK_unop_incr {
                    binop[] = make_CBinaryOp(AST_CAdd_t)
                    break
                }
            }
        }
        -> TOK_unop_neg {
            -> TOK_assign_subtract {
                -> TOK_unop_decr {
                    binop[] = make_CBinaryOp(AST_CSubtract_t)
                    break
                }
            }
        }
        -> TOK_binop_multiply {
            -> TOK_assign_multiply {
                binop[] = make_CBinaryOp(AST_CMultiply_t)
                break
            }
        }
        -> TOK_binop_divide {
            -> TOK_assign_divide {
                binop[] = make_CBinaryOp(AST_CDivide_t)
                break
            }
        }
        -> TOK_binop_remainder {
            -> TOK_assign_remainder {
                binop[] = make_CBinaryOp(AST_CRemainder_t)
                break
            }
        }
        -> TOK_binop_bitand {
            -> TOK_assign_bitand {
                binop[] = make_CBinaryOp(AST_CBitAnd_t)
                break
            }
        }
        -> TOK_binop_bitor {
            -> TOK_assign_bitor {
                binop[] = make_CBinaryOp(AST_CBitOr_t)
                break
            }
        }
        -> TOK_binop_xor {
            -> TOK_assign_xor {
                binop[] = make_CBinaryOp(AST_CBitXor_t)
                break
            }
        }
        -> TOK_binop_shiftleft {
            -> TOK_assign_shiftleft {
                binop[] = make_CBinaryOp(AST_CBitShiftLeft_t)
                break
            }
        }
        -> TOK_binop_shiftright {
            -> TOK_assign_shiftright {
                binop[] = make_CBinaryOp(AST_CBitShiftRight_t)
                break
            }
        }
        -> TOK_binop_and {
            binop[] = make_CBinaryOp(AST_CAnd_t)
            break
        }
        -> TOK_binop_or {
            binop[] = make_CBinaryOp(AST_COr_t)
            break
        }
        -> TOK_binop_eq {
            binop[] = make_CBinaryOp(AST_CEqual_t)
            break
        }
        -> TOK_binop_ne {
            binop[] = make_CBinaryOp(AST_CNotEqual_t)
            break
        }
        -> TOK_binop_lt {
            binop[] = make_CBinaryOp(AST_CLessThan_t)
            break
        }
        -> TOK_binop_le {
            binop[] = make_CBinaryOp(AST_CLessOrEqual_t)
            break
        }
        -> TOK_binop_gt {
            binop[] = make_CBinaryOp(AST_CGreaterThan_t)
            break
        }
        -> TOK_binop_ge {
            binop[] = make_CBinaryOp(AST_CGreaterOrEqual_t)
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_binop), "MSG_expect_binop", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) i32;

fn parse_datatype_specifier(ctx: *struc ParserContext, tag_name: *u64, is_union: *i32) i32 {
    _errval: i32 = 0
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_struc {
            is_union[] = false
            break
        }
        -> TOK_key_union {
            is_union[] = true
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_data_specifier), "MSG_expect_data_specifier", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, tag_name))"
        _errval = parse_identifier(ctx, tag_name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_type_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_key_char {
            type_specifier[] = make_Char()
            break
        }
        -> TOK_key_string {
            type_specifier[] = make_Char()
            type_specifier[] = make_Pointer(type_specifier)
            break
        }
        -> TOK_key_i32 {
            type_specifier[] = make_Int()
            break
        }
        -> TOK_key_i64 {
            type_specifier[] = make_Long()
            break
        }
        -> TOK_key_i8 {
            type_specifier[] = make_SChar()
            break
        }
        -> TOK_key_f64 {
            type_specifier[] = make_Double()
            break
        }
        -> TOK_key_u32 {
            type_specifier[] = make_UInt()
            break
        }
        -> TOK_key_u64 {
            type_specifier[] = make_ULong()
            break
        }
        -> TOK_key_u8 {
            type_specifier[] = make_UChar()
            break
        }
        -> TOK_key_any {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_incomplete_any), "MSG_incomplete_any", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> TOK_key_struc {
            -> TOK_key_union {
                is_union: i32;
                tag_name: u64;
                loop .. while 0 {
                    "@MACRO@:TRY(parse_datatype_specifier(ctx, &tag_name, &is_union))"
                    _errval = parse_datatype_specifier(ctx, @tag_name, @is_union)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                type_specifier[] = make_Structure(tag_name, is_union)
                break
            }
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_specifier), "MSG_expect_specifier", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_arr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    size: i64 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            loop .. while 0 {
                                "@MACRO@:TRY(parse_const(ctx, &constant))"
                                _errval = parse_const(ctx, @constant)
                                if _errval ~= 0 {
                                    jump _Lfinally
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_unsigned_const(ctx, &constant))"
                    _errval = parse_unsigned_const(ctx, @constant)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_arr_size_not_int_const), "MSG_arr_size_not_int_const", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_bracket))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_bracket)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match constant[].tag {
        -> AST_CConstInt_t {
            size = cast<i64>(constant[].get._CConstInt.value)
            break
        }
        -> AST_CConstLong_t {
            size = constant[].get._CConstLong.value
            break
        }
        -> AST_CConstUInt_t {
            size = cast<i64>(constant[].get._CConstUInt.value)
            break
        }
        -> AST_CConstULong_t {
            size = cast<i64>(constant[].get._CConstULong.value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_any {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        type_specifier[] = make_Void()
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_type_name(ctx, type_specifier))"
            _errval = parse_type_name(ctx, type_specifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    type_specifier[] = make_Array(size, type_specifier)
    label _Lfinally
    free_CConst(@constant)
    return _errval
}

fn parse_ptr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_any {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        type_specifier[] = make_Void()
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_type_name(ctx, type_specifier))"
            _errval = parse_type_name(ctx, type_specifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    type_specifier[] = make_Pointer(type_specifier)
    label _Lfinally
    return _errval
}

fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            loop .. while 0 {
                "@MACRO@:TRY(parse_arr_specifier(ctx, type_name))"
                _errval = parse_arr_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_binop_multiply {
            loop .. while 0 {
                "@MACRO@:TRY(parse_ptr_specifier(ctx, type_name))"
                _errval = parse_ptr_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_type_specifier(ctx, type_name))"
                _errval = parse_type_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    return _errval
}

fn parse_maybe_type(ctx: *struc ParserContext, maybe_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_char {
            -> TOK_key_string {
                -> TOK_key_i32 {
                    -> TOK_key_i64 {
                        -> TOK_key_i8 {
                            -> TOK_key_f64 {
                                -> TOK_key_u32 {
                                    -> TOK_key_u64 {
                                        -> TOK_key_u8 {
                                            -> TOK_key_any {
                                                -> TOK_key_struc {
                                                    -> TOK_key_union {
                                                        -> TOK_open_bracket {
                                                            -> TOK_binop_multiply {
                                                                loop .. while 0 {
                                                                    "@MACRO@:TRY(parse_type_name(ctx, maybe_type))"
                                                                    _errval = parse_type_name(ctx, maybe_type)
                                                                    if _errval ~= 0 {
                                                                        jump _Lfinally
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
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_key_none {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            maybe_type[] = make_Void()
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_maybe_type), "MSG_expect_maybe_type", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32;
fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) i32;

fn parse_arg_list(ctx: *struc ParserContext, args: ***struc CExp) i32 {
    arg: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &arg))"
        _errval = parse_exp(ctx, 0, @arg)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(*args, arg)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*args, arg)"
            loop .. while 0 {
                (? (not (args[]) or (cast<*struc stbds_array_header>((args[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args[])) - 1)[].capacity) then (((args[]) = stbds_arrgrowf((args[]), sizeof((args[])[]), (1), (0))) and 0) else 0)
                (args[])[(cast<*struc stbds_array_header>((args[])) - 1)[].length++] = (arg)
            }
        }
        arg = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &arg))"
            _errval = parse_exp(ctx, 0, @arg)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(*args, arg)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(*args, arg)"
                loop .. while 0 {
                    (? (not (args[]) or (cast<*struc stbds_array_header>((args[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args[])) - 1)[].capacity) then (((args[]) = stbds_arrgrowf((args[]), sizeof((args[])[]), (1), (0))) and 0) else 0)
                    (args[])[(cast<*struc stbds_array_header>((args[])) - 1)[].length++] = (arg)
                }
            }
            arg = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    free_CExp(@arg)
    return _errval
}

fn parse_const_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_const(ctx, &constant))"
        _errval = parse_const(ctx, @constant)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConstant(@constant, info_at)
    label _Lfinally
    free_CConst(@constant)
    return _errval
}

fn parse_unsigned_const_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_unsigned_const(ctx, &constant))"
        _errval = parse_unsigned_const(ctx, @constant)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConstant(@constant, info_at)
    label _Lfinally
    free_CConst(@constant)
    return _errval
}

fn parse_string_literal_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    literal: *struc CStringLiteral = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_string_literal(ctx, &literal))"
        _errval = parse_string_literal(ctx, @literal)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CString(@literal, info_at)
    label _Lfinally
    free_CStringLiteral(@literal)
    return _errval
}

fn parse_var_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &name))"
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CVar(name, info_at)
    label _Lfinally
    return _errval
}

fn parse_call_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    args: **struc CExp = vec_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &name))"
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind ~= TOK_close_paren {
        loop .. while 0 {
            "@MACRO@:TRY(parse_arg_list(ctx, &args))"
            _errval = parse_arg_list(ctx, @args)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CFunctionCall(name, @args, info_at)
    label _Lfinally
    loop i: u64 = 0 while i < (? (args) then (cast<*struc stbds_array_header>((args)) - 1)[].length else 0) .. ++i {
        free_CExp(@args[i])
    }
    if args {
        "@MACRO@:vec_delete(args)"
        loop .. while 0 {
            cast<none>((? (args) then free((cast<*struc stbds_array_header>((args)) - 1)) else cast<none>(0)))
            (args) = nil
        }
        args = vec_new()
    }
    return _errval
}

fn parse_cast_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = uptr_new()
    target_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_binop_lt))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_binop_lt)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_maybe_type(ctx, &target_type))"
        _errval = parse_maybe_type(ctx, @target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_binop_gt))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_binop_gt)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_open_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &cast_exp))"
        _errval = parse_exp(ctx, 0, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CCast(@cast_exp, @target_type, info_at)
    label _Lfinally
    free_CExp(@cast_exp)
    free_Type(@target_type)
    return _errval
}

fn parse_inner_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, exp))"
        _errval = parse_exp(ctx, 0, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_deref_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_typeop_member {
        info_at = ctx[].peek_tok[].info_at
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
            _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        member: u64;
        loop .. while 0 {
            "@MACRO@:TRY(parse_identifier(ctx, &member))"
            _errval = parse_identifier(ctx, @member)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        exp[] = make_CArrow(member, exp, info_at)
    }
    else {
        exp[] = make_CDereference(exp, info_at)
    }
    label _Lfinally
    return _errval
}

fn parse_subscript_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    subscript_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &subscript_exp))"
        _errval = parse_exp(ctx, 0, @subscript_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_bracket))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_bracket)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSubscript(exp, @subscript_exp, info_at)
    label _Lfinally
    free_CExp(@subscript_exp)
    return _errval
}

fn parse_arr_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_bracket {
        loop .. while 0 {
            "@MACRO@:TRY(parse_deref_factor(ctx, exp))"
            _errval = parse_deref_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_subscript_factor(ctx, exp))"
            _errval = parse_subscript_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_dot_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    member: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &member))"
        _errval = parse_identifier(ctx, @member)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CDot(member, exp, info_at)
    label _Lfinally
    return _errval
}

fn parse_postfix_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    exp_right_1: *struc CExp = uptr_new()
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    exp_null: *struc CExp = uptr_new()
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CPostfix_t)
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, exp, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    return _errval
}

fn parse_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CUnaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_unop(ctx, &unop))"
        _errval = parse_unop(ctx, @unop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_unary_exp_factor(ctx, &cast_exp))"
        _errval = parse_unary_exp_factor(ctx, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CUnary(@unop, @cast_exp, info_at)
    label _Lfinally
    free_CExp(@cast_exp)
    return _errval
}

fn parse_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_left: *struc CExp = uptr_new()
    exp_right: *struc CExp = uptr_new()
    exp_left_1: *struc CExp = uptr_new()
    exp_right_1: *struc CExp = uptr_new()
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CPrefix_t)
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_unary_exp_factor(ctx, &exp_left))"
        _errval = parse_unary_exp_factor(ctx, @exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, @exp_left, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_left_1, @exp_right_1, info_at)
    label _Lfinally
    free_CExp(@exp_left)
    free_CExp(@exp_right)
    free_CExp(@exp_left_1)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    return _errval
}

fn parse_addrof_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_unary_exp_factor(ctx, &cast_exp))"
        _errval = parse_unary_exp_factor(ctx, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CAddrOf(@cast_exp, info_at)
    label _Lfinally
    free_CExp(@cast_exp)
    return _errval
}

fn parse_sizeoft_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    target_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].next_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_type_name(ctx, &target_type))"
        _errval = parse_type_name(ctx, @target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_binop_gt))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_binop_gt)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSizeOfT(@target_type, info_at)
    label _Lfinally
    free_Type(@target_type)
    return _errval
}

fn parse_sizeof_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    unary_exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].next_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &unary_exp))"
        _errval = parse_exp(ctx, 0, @unary_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSizeOf(@unary_exp, info_at)
    label _Lfinally
    free_CExp(@unary_exp)
    return _errval
}

fn parse_sizeof_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_binop_lt {
            loop .. while 0 {
                "@MACRO@:TRY(parse_sizeoft_factor(ctx, exp))"
                _errval = parse_sizeoft_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_open_paren {
            loop .. while 0 {
                "@MACRO@:TRY(parse_sizeof_factor(ctx, exp))"
                _errval = parse_sizeof_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_open_sizeof), "MSG_expect_open_sizeof", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_primary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            -> TOK_dbl_const {
                                loop .. while 0 {
                                    "@MACRO@:TRY(parse_const_factor(ctx, exp))"
                                    _errval = parse_const_factor(ctx, exp)
                                    if _errval ~= 0 {
                                        jump _Lfinally
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_unsigned_const_factor(ctx, exp))"
                    _errval = parse_unsigned_const_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> TOK_string_literal {
            loop .. while 0 {
                "@MACRO@:TRY(parse_string_literal_factor(ctx, exp))"
                _errval = parse_string_literal_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_cast {
            loop .. while 0 {
                "@MACRO@:TRY(parse_cast_factor(ctx, exp))"
                _errval = parse_cast_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(peek_next_i(ctx, 1))"
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == TOK_open_paren {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_call_factor(ctx, exp))"
                    _errval = parse_call_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_var_factor(ctx, exp))"
                    _errval = parse_var_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
        }
        -> TOK_open_paren {
            loop .. while 0 {
                "@MACRO@:TRY(parse_inner_exp_factor(ctx, exp))"
                _errval = parse_inner_exp_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_expression), "MSG_expect_expression", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_postfix_op_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            loop .. while 0 {
                "@MACRO@:TRY(parse_arr_unary_factor(ctx, exp))"
                _errval = parse_arr_unary_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_typeop_member {
            loop .. while 0 {
                "@MACRO@:TRY(parse_dot_factor(ctx, exp))"
                _errval = parse_dot_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_unop_incr {
            -> TOK_unop_decr {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_postfix_incr_factor(ctx, exp))"
                    _errval = parse_postfix_incr_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_postfix_op_exp_factor(ctx, exp))"
        _errval = parse_postfix_op_exp_factor(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_postfix_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_primary_exp_factor(ctx, exp))"
        _errval = parse_primary_exp_factor(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_bracket {
            -> TOK_typeop_member {
                -> TOK_unop_incr {
                    -> TOK_unop_decr {
                        loop .. while 0 {
                            "@MACRO@:TRY(parse_postfix_op_exp_factor(ctx, exp))"
                            _errval = parse_postfix_op_exp_factor(ctx, exp)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_unop_complement {
            -> TOK_unop_neg {
                -> TOK_unop_not {
                    loop .. while 0 {
                        "@MACRO@:TRY(parse_unary_factor(ctx, exp))"
                        _errval = parse_unary_factor(ctx, exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        -> TOK_unop_incr {
            -> TOK_unop_decr {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_incr_factor(ctx, exp))"
                    _errval = parse_incr_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> TOK_unop_addrof {
            loop .. while 0 {
                "@MACRO@:TRY(parse_addrof_factor(ctx, exp))"
                _errval = parse_addrof_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_sizeof {
            loop .. while 0 {
                "@MACRO@:TRY(parse_sizeof_unary_factor(ctx, exp))"
                _errval = parse_sizeof_unary_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_postfix_exp_factor(ctx, exp))"
                _errval = parse_postfix_exp_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    return _errval
}

fn parse_assign_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CUnaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, precedence, &exp_right))"
        _errval = parse_exp(ctx, precedence, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_left[] = make_CAssignment(@unop, exp_left, @exp_right, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    return _errval
}

fn parse_assign_compound_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    exp_right_1: *struc CExp = uptr_new()
    _errval: i32 = 0
    exp_null: *struc CExp = uptr_new()
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(AST_CUnaryOp_t)
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, precedence, &exp_right))"
        _errval = parse_exp(ctx, precedence, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_right_1 = make_CBinary(@binop, exp_left, @exp_right, info_at)
    exp_left[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    return _errval
}

fn parse_binary_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    binop: struc CBinaryOp = make_CBinaryOp(AST_CBinaryOp_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_binop(ctx, &binop))"
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, precedence + 1, &exp_right))"
        _errval = parse_exp(ctx, precedence + 1, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_left[] = make_CBinary(@binop, exp_left, @exp_right, info_at)
    label _Lfinally
    free_CExp(@exp_right)
    return _errval
}

fn parse_ternary_exp(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_left: *struc CExp = uptr_new()
    exp_middle: *struc CExp = uptr_new()
    exp_right: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp_left))"
        _errval = parse_exp(ctx, 0, @exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_key_then))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_key_then)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp_middle))"
        _errval = parse_exp(ctx, 0, @exp_middle)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_key_else))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_key_else)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp_right))"
        _errval = parse_exp(ctx, 0, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConditional(@exp_left, @exp_middle, @exp_right, info_at)
    label _Lfinally
    free_CExp(@exp_left)
    free_CExp(@exp_middle)
    free_CExp(@exp_right)
    return _errval
}

fn get_tok_precedence(tok_kind: i32) i32 {
    match tok_kind {
        -> TOK_binop_multiply {
            -> TOK_binop_divide {
                -> TOK_binop_remainder {
                    return 50
                }
            }
        }
        -> TOK_unop_neg {
            -> TOK_binop_add {
                return 45
            }
        }
        -> TOK_binop_shiftleft {
            -> TOK_binop_shiftright {
                return 40
            }
        }
        -> TOK_binop_lt {
            -> TOK_binop_le {
                -> TOK_binop_gt {
                    -> TOK_binop_ge {
                        return 35
                    }
                }
            }
        }
        -> TOK_binop_eq {
            -> TOK_binop_ne {
                return 30
            }
        }
        -> TOK_binop_bitand {
            return 25
        }
        -> TOK_binop_xor {
            return 20
        }
        -> TOK_binop_bitor {
            return 15
        }
        -> TOK_binop_and {
            return 10
        }
        -> TOK_binop_or {
            return 5
        }
        -> TOK_assign {
            -> TOK_assign_add {
                -> TOK_assign_subtract {
                    -> TOK_assign_multiply {
                        -> TOK_assign_divide {
                            -> TOK_assign_remainder {
                                -> TOK_assign_bitand {
                                    -> TOK_assign_bitor {
                                        -> TOK_assign_xor {
                                            -> TOK_assign_shiftleft {
                                                -> TOK_assign_shiftright {
                                                    return 1
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
        }
        otherwise {
            return -1
        }
    }
}

fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_ternary_if {
        loop .. while 0 {
            "@MACRO@:TRY(parse_ternary_exp(ctx, exp))"
            _errval = parse_ternary_exp(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_unary_exp_factor(ctx, exp))"
            _errval = parse_unary_exp_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop while true {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        precedence: i32 = get_tok_precedence(ctx[].peek_tok[].tok_kind)
        if precedence < min_precedence {
            break
        }
        match ctx[].peek_tok[].tok_kind {
            -> TOK_binop_add {
                -> TOK_unop_neg {
                    -> TOK_binop_multiply {
                        -> TOK_binop_divide {
                            -> TOK_binop_remainder {
                                -> TOK_binop_bitand {
                                    -> TOK_binop_bitor {
                                        -> TOK_binop_xor {
                                            -> TOK_binop_shiftleft {
                                                -> TOK_binop_shiftright {
                                                    -> TOK_binop_lt {
                                                        -> TOK_binop_le {
                                                            -> TOK_binop_gt {
                                                                -> TOK_binop_ge {
                                                                    -> TOK_binop_eq {
                                                                        -> TOK_binop_ne {
                                                                            -> TOK_binop_and {
                                                                                -> TOK_binop_or {
                                                                                    loop .. while 0 {
                                                                                        "@MACRO@:TRY(parse_binary_exp(ctx, precedence, exp))"
                                                                                        _errval = parse_binary_exp(ctx, precedence, exp)
                                                                                        if _errval ~= 0 {
                                                                                            jump _Lfinally
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
            break
            -> TOK_assign {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_assign_exp(ctx, precedence, exp))"
                    _errval = parse_assign_exp(ctx, precedence, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            -> TOK_assign_add {
                -> TOK_assign_subtract {
                    -> TOK_assign_multiply {
                        -> TOK_assign_divide {
                            -> TOK_assign_remainder {
                                -> TOK_assign_bitand {
                                    -> TOK_assign_bitor {
                                        -> TOK_assign_xor {
                                            -> TOK_assign_shiftleft {
                                                -> TOK_assign_shiftright {
                                                    loop .. while 0 {
                                                        "@MACRO@:TRY(parse_assign_compound_exp(ctx, precedence, exp))"
                                                        _errval = parse_assign_compound_exp(ctx, precedence, exp)
                                                        if _errval ~= 0 {
                                                            jump _Lfinally
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
                }
            }
            break
            otherwise {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_binop), "MSG_expect_binop", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) i32;
fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) i32;

fn parse_ret_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_none {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &exp))"
            _errval = parse_exp(ctx, 0, @exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    statement[] = make_CReturn(@exp, info_at)
    label _Lfinally
    free_CExp(@exp)
    return _errval
}

fn parse_exp_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp))"
        _errval = parse_exp(ctx, 0, @exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CExpression(@exp)
    label _Lfinally
    free_CExp(@exp)
    return _errval
}

fn parse_compound_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    block: *struc CBlock = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_block(ctx, &block))"
        _errval = parse_block(ctx, @block)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if block {
        statement[] = make_CCompound(@block)
    }
    else {
        statement[] = make_CNull()
    }
    label _Lfinally
    free_CBlock(@block)
    return _errval
}

fn parse_if_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    condition: *struc CExp = uptr_new()
    then_fi: *struc CStatement = uptr_new()
    else_fi: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
        _errval = parse_exp(ctx, 0, @condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &then_fi))"
        _errval = parse_compound_statement(ctx, @then_fi)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_line_break {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next_i(ctx, 1))"
            _errval = peek_next_i(ctx, 1)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        match ctx[].peek_tok_i[].tok_kind {
            -> TOK_key_elif {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(parse_if_statement(ctx, &else_fi))"
                _errval = parse_if_statement(ctx, @else_fi)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
            -> TOK_key_else {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(parse_compound_statement(ctx, &else_fi))"
                _errval = parse_compound_statement(ctx, @else_fi)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
            otherwise {
                break
            }
        }
    }
    statement[] = make_CIf(@condition, @then_fi, @else_fi)
    label _Lfinally
    free_CExp(@condition)
    free_CStatement(@then_fi)
    free_CStatement(@else_fi)
    return _errval
}

fn parse_jump_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    target: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &target))"
        _errval = parse_identifier(ctx, @target)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CGoto(target, info_at)
    label _Lfinally
    return _errval
}

fn parse_label_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    jump_to: *struc CStatement = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    target: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &target))"
        _errval = parse_identifier(ctx, @target)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    jump_to = make_CNull()
    statement[] = make_CLabel(target, @jump_to, info_at)
    label _Lfinally
    free_CStatement(@jump_to)
    return _errval
}

fn parse_loop_init_decl(ctx: *struc ParserContext, for_init: **struc CForInit) i32 {
    var_decl: *struc CVariableDeclaration = uptr_new()
    _errval: i32 = 0
    storage_class: struc CStorageClass = make_CStorageClass(AST_CStorageClass_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_var_declaration(ctx, &storage_class, &var_decl))"
        _errval = parse_var_declaration(ctx, @storage_class, @var_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    for_init[] = make_CInitDecl(@var_decl)
    label _Lfinally
    free_CVariableDeclaration(@var_decl)
    return _errval
}

fn parse_loop_init_exp(ctx: *struc ParserContext, for_init: **struc CForInit) i32 {
    init: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &init))"
        _errval = parse_exp(ctx, 0, @init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    for_init[] = make_CInitExp(@init)
    label _Lfinally
    free_CExp(@init)
    return _errval
}

fn parse_loop_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    for_init: *struc CForInit = uptr_new()
    condition: *struc CExp = uptr_new()
    post: *struc CExp = uptr_new()
    body: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_open_brace {
            jump Lbreak
        }
        -> TOK_semicolon {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_infinite_loop), "MSG_infinite_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> TOK_loop_post {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(peek_next(ctx))"
                _errval = peek_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok[].tok_kind == TOK_key_while {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
                    _errval = parse_exp(ctx, 0, @condition)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
                    _errval = parse_compound_statement(ctx, @body)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                statement[] = make_CDoWhile(@condition, @body)
                jump _Lfinally
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_exp(ctx, 0, &post))"
                    _errval = parse_exp(ctx, 0, @post)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump Lbreak
            }
        }
        -> TOK_key_while {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
                _errval = parse_exp(ctx, 0, @condition)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                "@MACRO@:TRY(peek_next(ctx))"
                _errval = peek_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok[].tok_kind == TOK_loop_post {
                loop .. while 0 {
                    "@MACRO@:TRY(pop_next(ctx))"
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    "@MACRO@:TRY(parse_exp(ctx, 0, &post))"
                    _errval = parse_exp(ctx, 0, @post)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump Lbreak
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
                    _errval = parse_compound_statement(ctx, @body)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                statement[] = make_CWhile(@condition, @body)
                jump _Lfinally
            }
        }
        -> TOK_key_pub {
            -> TOK_key_data {
                -> TOK_key_extrn {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_loop_decl_not_auto), "MSG_loop_decl_not_auto", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
        }
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(peek_next_i(ctx, 1))"
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == TOK_assign_type {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_loop_init_decl(ctx, &for_init))"
                    _errval = parse_loop_init_decl(ctx, @for_init)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            else {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_loop_init_exp(ctx, &for_init))"
                    _errval = parse_loop_init_exp(ctx, @for_init)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_loop_init_exp(ctx, &for_init))"
                _errval = parse_loop_init_exp(ctx, @for_init)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_while {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &condition))"
            _errval = parse_exp(ctx, 0, @condition)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_loop_post {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_exp(ctx, 0, &post))"
            _errval = parse_exp(ctx, 0, @post)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label Lbreak
    if not for_init {
        exp_null: *struc CExp = uptr_new()
        for_init = make_CInitExp(@exp_null)
    }
    if not condition {
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == TOK_semicolon {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_infinite_loop), "MSG_infinite_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
        _errval = parse_compound_statement(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CFor(@for_init, @condition, @post, @body)
    label _Lfinally
    free_CForInit(@for_init)
    free_CExp(@condition)
    free_CExp(@post)
    free_CStatement(@body)
    return _errval
}

fn parse_match_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    lookup: *struc CExp = uptr_new()
    body: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &lookup))"
        _errval = parse_exp(ctx, 0, @lookup)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &body))"
        _errval = parse_compound_statement(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CSwitch(@lookup, @body)
    label _Lfinally
    free_CExp(@lookup)
    free_CStatement(@body)
    return _errval
}

fn parse_with_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    value: *struc CExp = uptr_new()
    jump_to: *struc CStatement = uptr_new()
    constant: *struc CConst = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_true {
            -> TOK_key_false {
                -> TOK_int_const {
                    -> TOK_long_const {
                        -> TOK_char_const {
                            loop .. while 0 {
                                "@MACRO@:TRY(parse_const(ctx, &constant))"
                                _errval = parse_const(ctx, @constant)
                                if _errval ~= 0 {
                                    jump _Lfinally
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> TOK_uint_const {
            -> TOK_ulong_const {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_unsigned_const(ctx, &constant))"
                    _errval = parse_unsigned_const(ctx, @constant)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_case_value_not_int_const), "MSG_case_value_not_int_const", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    value = make_CConstant(@constant, info_at)
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &jump_to))"
        _errval = parse_compound_statement(ctx, @jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CCase(@value, @jump_to)
    label _Lfinally
    free_CExp(@value)
    free_CStatement(@jump_to)
    free_CConst(@constant)
    return _errval
}

fn parse_otherwise_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    jump_to: *struc CStatement = uptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_compound_statement(ctx, &jump_to))"
        _errval = parse_compound_statement(ctx, @jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CDefault(@jump_to, info_at)
    label _Lfinally
    free_CStatement(@jump_to)
    return _errval
}

fn parse_break_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CBreak(info_at)
    label _Lfinally
    return _errval
}

fn parse_continue_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CContinue(info_at)
    label _Lfinally
    return _errval
}

fn parse_null_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CNull()
    label _Lfinally
    return _errval
}

fn parse_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_return {
            loop .. while 0 {
                "@MACRO@:TRY(parse_ret_statement(ctx, statement))"
                _errval = parse_ret_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        jump _Lfinally
        -> TOK_key_if {
            loop .. while 0 {
                "@MACRO@:TRY(parse_if_statement(ctx, statement))"
                _errval = parse_if_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_jump {
            loop .. while 0 {
                "@MACRO@:TRY(parse_jump_statement(ctx, statement))"
                _errval = parse_jump_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_label {
            loop .. while 0 {
                "@MACRO@:TRY(parse_label_statement(ctx, statement))"
                _errval = parse_label_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_open_brace {
            loop .. while 0 {
                "@MACRO@:TRY(parse_compound_statement(ctx, statement))"
                _errval = parse_compound_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_loop {
            loop .. while 0 {
                "@MACRO@:TRY(parse_loop_statement(ctx, statement))"
                _errval = parse_loop_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_match {
            loop .. while 0 {
                "@MACRO@:TRY(parse_match_statement(ctx, statement))"
                _errval = parse_match_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_match_with {
            loop .. while 0 {
                "@MACRO@:TRY(parse_with_statement(ctx, statement))"
                _errval = parse_with_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_otherwise_statement(ctx, statement))"
                _errval = parse_otherwise_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_break {
            loop .. while 0 {
                "@MACRO@:TRY(parse_break_statement(ctx, statement))"
                _errval = parse_break_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_continue {
            loop .. while 0 {
                "@MACRO@:TRY(parse_continue_statement(ctx, statement))"
                _errval = parse_continue_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_semicolon {
            loop .. while 0 {
                "@MACRO@:TRY(parse_null_statement(ctx, statement))"
                _errval = parse_null_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:TRY(parse_exp_statement(ctx, statement))"
                _errval = parse_exp_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    return _errval
}

fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32;

fn parse_s_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    statement: *struc CStatement = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_statement(ctx, &statement))"
        _errval = parse_statement(ctx, @statement)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block_item[] = make_CS(@statement)
    label _Lfinally
    free_CStatement(@statement)
    return _errval
}

fn parse_d_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    declaration: *struc CDeclaration = uptr_new()
    _errval: i32 = 0
    storage_class: struc CStorageClass = make_CStorageClass(AST_CStorageClass_t)
    loop .. while 0 {
        "@MACRO@:TRY(parse_declaration(ctx, &storage_class, &declaration))"
        _errval = parse_declaration(ctx, @storage_class, @declaration)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block_item[] = make_CD(@declaration)
    label _Lfinally
    free_CDeclaration(@declaration)
    return _errval
}

fn parse_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_pub_in_block), "MSG_pub_in_block", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> TOK_key_data {
            -> TOK_key_extrn {
                -> TOK_key_fn {
                    -> TOK_key_type {
                        loop .. while 0 {
                            "@MACRO@:TRY(parse_d_block_item(ctx, block_item))"
                            _errval = parse_d_block_item(ctx, block_item)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        jump _Lfinally
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(peek_next_i(ctx, 1))"
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == TOK_assign_type {
                loop .. while 0 {
                    "@MACRO@:TRY(parse_d_block_item(ctx, block_item))"
                    _errval = parse_d_block_item(ctx, block_item)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump _Lfinally
            }
            break
        }
        otherwise {
            break
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_s_block_item(ctx, block_item))"
        _errval = parse_s_block_item(ctx, block_item)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_b_block(ctx: *struc ParserContext, block: **struc CBlock) i32 {
    block_item: *struc CBlockItem = uptr_new()
    block_items: **struc CBlockItem = vec_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_line_break {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_brace {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_empty_block), "MSG_empty_block", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_block_item(ctx, &block_item))"
        _errval = parse_block_item(ctx, @block_item)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(block_items, block_item)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(block_items, block_item)"
            loop .. while 0 {
                (? (not (block_items) or (cast<*struc stbds_array_header>((block_items)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((block_items)) - 1)[].capacity) then (((block_items) = stbds_arrgrowf((block_items), sizeof((block_items)[]), (1), (0))) and 0) else 0)
                (block_items)[(cast<*struc stbds_array_header>((block_items)) - 1)[].length++] = (block_item)
            }
        }
        block_item = nil
    }
    loop while true {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].next_tok[].tok_kind == TOK_close_brace {
            break
        }
        loop .. while 0 {
            "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_line_break))"
            _errval = expect_next(ctx, ctx[].next_tok, TOK_line_break)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == TOK_close_brace {
            loop .. while 0 {
                "@MACRO@:TRY(pop_next(ctx))"
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_block_item(ctx, &block_item))"
            _errval = parse_block_item(ctx, @block_item)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(block_items, block_item)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(block_items, block_item)"
                loop .. while 0 {
                    (? (not (block_items) or (cast<*struc stbds_array_header>((block_items)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((block_items)) - 1)[].capacity) then (((block_items) = stbds_arrgrowf((block_items), sizeof((block_items)[]), (1), (0))) and 0) else 0)
                    (block_items)[(cast<*struc stbds_array_header>((block_items)) - 1)[].length++] = (block_item)
                }
            }
            block_item = nil
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_brace))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_brace)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block[] = make_CB(@block_items)
    label _Lfinally
    free_CBlockItem(@block_item)
    loop i: u64 = 0 while i < (? (block_items) then (cast<*struc stbds_array_header>((block_items)) - 1)[].length else 0) .. ++i {
        free_CBlockItem(@block_items[i])
    }
    if block_items {
        "@MACRO@:vec_delete(block_items)"
        loop .. while 0 {
            cast<none>((? (block_items) then free((cast<*struc stbds_array_header>((block_items)) - 1)) else cast<none>(0)))
            (block_items) = nil
        }
        block_items = vec_new()
    }
    return _errval
}

fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_open_brace {
            loop .. while 0 {
                "@MACRO@:TRY(parse_b_block(ctx, block))"
                _errval = parse_b_block(ctx, block)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_block), "MSG_expect_block", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) i32;

fn parse_single_init(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    exp: *struc CExp = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_exp(ctx, 0, &exp))"
        _errval = parse_exp(ctx, 0, @exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    initializer[] = make_CSingleInit(@exp)
    label _Lfinally
    free_CExp(@exp)
    return _errval
}

fn parse_compound_init(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    initializers: **struc CInitializer = vec_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_open_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_close_paren {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_empty_compound_init), "MSG_empty_compound_init", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_initializer(ctx, initializer))"
        _errval = parse_initializer(ctx, initializer)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(initializers, *initializer)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(initializers, *initializer)"
            loop .. while 0 {
                (? (not (initializers) or (cast<*struc stbds_array_header>((initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((initializers)) - 1)[].capacity) then (((initializers) = stbds_arrgrowf((initializers), sizeof((initializers)[]), (1), (0))) and 0) else 0)
                (initializers)[(cast<*struc stbds_array_header>((initializers)) - 1)[].length++] = (initializer[])
            }
        }
        initializer[] = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].next_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(parse_initializer(ctx, initializer))"
            _errval = parse_initializer(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(initializers, *initializer)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(initializers, *initializer)"
                loop .. while 0 {
                    (? (not (initializers) or (cast<*struc stbds_array_header>((initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((initializers)) - 1)[].capacity) then (((initializers) = stbds_arrgrowf((initializers), sizeof((initializers)[]), (1), (0))) and 0) else 0)
                    (initializers)[(cast<*struc stbds_array_header>((initializers)) - 1)[].length++] = (initializer[])
                }
            }
            initializer[] = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    initializer[] = make_CCompoundInit(@initializers)
    label _Lfinally
    loop i: u64 = 0 while i < (? (initializers) then (cast<*struc stbds_array_header>((initializers)) - 1)[].length else 0) .. ++i {
        free_CInitializer(@initializers[i])
    }
    if initializers {
        "@MACRO@:vec_delete(initializers)"
        loop .. while 0 {
            cast<none>((? (initializers) then free((cast<*struc stbds_array_header>((initializers)) - 1)) else cast<none>(0)))
            (initializers) = nil
        }
        initializers = vec_new()
    }
    return _errval
}

fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_compound_init {
        loop .. while 0 {
            "@MACRO@:TRY(parse_compound_init(ctx, initializer))"
            _errval = parse_compound_init(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_single_init(ctx, initializer))"
            _errval = parse_single_init(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, name))"
        _errval = parse_identifier(ctx, name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_assign_type))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_assign_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_type_name(ctx, derived_type))"
        _errval = parse_type_name(ctx, derived_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_item_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            -> TOK_key_data {
                -> TOK_key_extrn {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_list_decl_not_auto), "MSG_list_decl_not_auto", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
        }
        otherwise {
            break
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_decltor(ctx, name, derived_type))"
        _errval = parse_decltor(ctx, name, derived_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_decltor_list(ctx: *struc ParserContext, params: **u64, param_types: ***struc Type) i32 {
    param_type: *struc Type = sptr_new()
    _errval: i32 = 0
    param: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_item_decltor(ctx, &param, &param_type))"
        _errval = parse_item_decltor(ctx, @param, @param_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_push_back(*params, param)"
        loop .. while 0 {
            (? (not (params[]) or (cast<*struc stbds_array_header>((params[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((params[])) - 1)[].capacity) then (((params[]) = stbds_arrgrowf((params[]), sizeof((params[])[]), (1), (0))) and 0) else 0)
            (params[])[(cast<*struc stbds_array_header>((params[])) - 1)[].length++] = (param)
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(*param_types, param_type)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*param_types, param_type)"
            loop .. while 0 {
                (? (not (param_types[]) or (cast<*struc stbds_array_header>((param_types[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((param_types[])) - 1)[].capacity) then (((param_types[]) = stbds_arrgrowf((param_types[]), sizeof((param_types[])[]), (1), (0))) and 0) else 0)
                (param_types[])[(cast<*struc stbds_array_header>((param_types[])) - 1)[].length++] = (param_type)
            }
        }
        param_type = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_item_decltor(ctx, &param, &param_type))"
            _errval = parse_item_decltor(ctx, @param, @param_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_push_back(*params, param)"
            loop .. while 0 {
                (? (not (params[]) or (cast<*struc stbds_array_header>((params[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((params[])) - 1)[].capacity) then (((params[]) = stbds_arrgrowf((params[]), sizeof((params[])[]), (1), (0))) and 0) else 0)
                (params[])[(cast<*struc stbds_array_header>((params[])) - 1)[].length++] = (param)
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(*param_types, param_type)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(*param_types, param_type)"
                loop .. while 0 {
                    (? (not (param_types[]) or (cast<*struc stbds_array_header>((param_types[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((param_types[])) - 1)[].capacity) then (((param_types[]) = stbds_arrgrowf((param_types[]), sizeof((param_types[])[]), (1), (0))) and 0) else 0)
                    (param_types[])[(cast<*struc stbds_array_header>((param_types[])) - 1)[].length++] = (param_type)
                }
            }
            param_type = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    free_Type(@param_type)
    return _errval
}

fn parse_fun_decltor(ctx: *struc ParserContext, fun_type: **struc Type, params: **u64) i32 {
    param_types: **struc Type = vec_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_open_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_open_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_none {
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(parse_decltor_list(ctx, params, &param_types))"
            _errval = parse_decltor_list(ctx, params, @param_types)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_maybe_type(ctx, fun_type))"
        _errval = parse_maybe_type(ctx, fun_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    fun_type[] = make_FunType(@param_types, fun_type)
    label _Lfinally
    loop i: u64 = 0 while i < (? (param_types) then (cast<*struc stbds_array_header>((param_types)) - 1)[].length else 0) .. ++i {
        free_Type(@param_types[i])
    }
    if param_types {
        "@MACRO@:vec_delete(param_types)"
        loop .. while 0 {
            cast<none>((? (param_types) then free((cast<*struc stbds_array_header>((param_types)) - 1)) else cast<none>(0)))
            (param_types) = nil
        }
        param_types = vec_new()
    }
    return _errval
}

fn parse_fun_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, fun_decl: **struc CFunctionDeclaration) i32 {
    body: *struc CBlock = uptr_new()
    fun_type: *struc Type = sptr_new()
    params: *u64 = vec_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->peek_tok, TOK_identifier))"
        _errval = expect_next(ctx, ctx[].peek_tok, TOK_identifier)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_identifier(ctx, &name))"
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_fun_decltor(ctx, &fun_type, &params))"
        _errval = parse_fun_decltor(ctx, @fun_type, @params)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_block(ctx, &body))"
        _errval = parse_block(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    fun_decl[] = make_CFunctionDeclaration(name, @params, @body, @fun_type, storage_class, info_at)
    label _Lfinally
    free_CBlock(@body)
    free_Type(@fun_type)
    if params {
        "@MACRO@:vec_delete(params)"
        loop .. while 0 {
            cast<none>((? (params) then free((cast<*struc stbds_array_header>((params)) - 1)) else cast<none>(0)))
            (params) = nil
        }
        params = vec_new()
    }
    return _errval
}

fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) i32 {
    initializer: *struc CInitializer = uptr_new()
    var_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(parse_decltor(ctx, &name, &var_type))"
        _errval = parse_decltor(ctx, @name, @var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_assign {
            loop .. while 0 {
                "@MACRO@:TRY(parse_initializer(ctx, &initializer))"
                _errval = parse_initializer(ctx, @initializer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_assign), "MSG_expect_assign", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    var_decl[] = make_CVariableDeclaration(name, @initializer, @var_type, storage_class, info_at)
    label _Lfinally
    free_CInitializer(@initializer)
    free_Type(@var_type)
    return _errval
}

fn parse_member_declaration(ctx: *struc ParserContext, member_decl: **struc CMemberDeclaration) i32 {
    member_type: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64;
    member_name: u64;
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    info_at = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(parse_item_decltor(ctx, &member_name, &member_type))"
        _errval = parse_item_decltor(ctx, @member_name, @member_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    member_decl[] = make_CMemberDeclaration(member_name, @member_type, info_at)
    label _Lfinally
    free_Type(@member_type)
    return _errval
}

fn parse_member_list(ctx: *struc ParserContext, members: ***struc CMemberDeclaration) i32 {
    member: *struc CMemberDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_member_declaration(ctx, &member))"
        _errval = parse_member_declaration(ctx, @member)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_move_back(*members, member)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*members, member)"
            loop .. while 0 {
                (? (not (members[]) or (cast<*struc stbds_array_header>((members[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((members[])) - 1)[].capacity) then (((members[]) = stbds_arrgrowf((members[]), sizeof((members[])[]), (1), (0))) and 0) else 0)
                (members[])[(cast<*struc stbds_array_header>((members[])) - 1)[].length++] = (member)
            }
        }
        member = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].next_tok[].tok_kind == TOK_comma_separator {
        loop .. while 0 {
            "@MACRO@:TRY(parse_member_declaration(ctx, &member))"
            _errval = parse_member_declaration(ctx, @member)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(*members, member)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(*members, member)"
                loop .. while 0 {
                    (? (not (members[]) or (cast<*struc stbds_array_header>((members[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((members[])) - 1)[].capacity) then (((members[]) = stbds_arrgrowf((members[]), sizeof((members[])[]), (1), (0))) and 0) else 0)
                    (members[])[(cast<*struc stbds_array_header>((members[])) - 1)[].length++] = (member)
                }
            }
            member = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_close_paren))"
        _errval = expect_next(ctx, ctx[].next_tok, TOK_close_paren)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    free_CMemberDeclaration(@member)
    return _errval
}

fn parse_type_declaration(ctx: *struc ParserContext, struct_decl: **struc CStructDeclaration) i32 {
    members: **struc CMemberDeclaration = vec_new()
    _errval: i32 = 0
    is_union: i32;
    tag_name: u64;
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(parse_datatype_specifier(ctx, &tag_name, &is_union))"
        _errval = parse_datatype_specifier(ctx, @tag_name, @is_union)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> TOK_semicolon {
            break
        }
        -> TOK_open_paren {
            loop .. while 0 {
                "@MACRO@:TRY(parse_member_list(ctx, &members))"
                _errval = parse_member_list(ctx, @members)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->next_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_datatype), "MSG_expect_datatype", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    struct_decl[] = make_CStructDeclaration(tag_name, is_union, @members, info_at)
    label _Lfinally
    loop i: u64 = 0 while i < (? (members) then (cast<*struc stbds_array_header>((members)) - 1)[].length else 0) .. ++i {
        free_CMemberDeclaration(@members[i])
    }
    if members {
        "@MACRO@:vec_delete(members)"
        loop .. while 0 {
            cast<none>((? (members) then free((cast<*struc stbds_array_header>((members)) - 1)) else cast<none>(0)))
            (members) = nil
        }
        members = vec_new()
    }
    return _errval
}

fn parse_fun_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    fun_decl: *struc CFunctionDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_fun_declaration(ctx, storage_class, &fun_decl))"
        _errval = parse_fun_declaration(ctx, storage_class, @fun_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CFunDecl(@fun_decl)
    label _Lfinally
    free_CFunctionDeclaration(@fun_decl)
    return _errval
}

fn parse_var_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    var_decl: *struc CVariableDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_var_declaration(ctx, storage_class, &var_decl))"
        _errval = parse_var_declaration(ctx, storage_class, @var_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CVarDecl(@var_decl)
    label _Lfinally
    free_CVariableDeclaration(@var_decl)
    return _errval
}

fn parse_type_decl(ctx: *struc ParserContext, declaration: **struc CDeclaration) i32 {
    struct_decl: *struc CStructDeclaration = uptr_new()
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_type_declaration(ctx, &struct_decl))"
        _errval = parse_type_declaration(ctx, @struct_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CStructDecl(@struct_decl)
    label _Lfinally
    free_CStructDeclaration(@struct_decl)
    return _errval
}

fn parse_storage_class(ctx: *struc ParserContext, storage_class: *struc CStorageClass) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_pub {
            storage_class[] = make_CStorageClass(AST_CStorageClass_t)
            break
        }
        -> TOK_key_data {
            storage_class[] = make_CStorageClass(AST_CStatic_t)
            break
        }
        -> TOK_key_extrn {
            storage_class[] = make_CStorageClass(AST_CExtern_t)
            break
        }
        -> TOK_key_fn {
            -> TOK_identifier {
                -> TOK_key_type {
                    jump _Lfinally
                }
            }
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_storage_class), "MSG_expect_storage_class", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(pop_next(ctx))"
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(peek_next(ctx))"
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == TOK_key_type {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_type_decl_not_auto), "MSG_type_decl_not_auto", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_storage_class(ctx, storage_class))"
        _errval = parse_storage_class(ctx, storage_class)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> TOK_key_fn {
            loop .. while 0 {
                "@MACRO@:TRY(parse_fun_decl(ctx, storage_class, declaration))"
                _errval = parse_fun_decl(ctx, storage_class, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_identifier {
            loop .. while 0 {
                "@MACRO@:TRY(parse_var_decl(ctx, storage_class, declaration))"
                _errval = parse_var_decl(ctx, storage_class, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> TOK_key_type {
            loop .. while 0 {
                "@MACRO@:TRY(parse_type_decl(ctx, declaration))"
                _errval = parse_type_decl(ctx, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_expect_declaration), "MSG_expect_declaration", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn parse_program(ctx: *struc ParserContext, c_ast: **struc CProgram) i32 {
    declaration: *struc CDeclaration = uptr_new()
    declarations: **struc CDeclaration = vec_new()
    _errval: i32 = 0
    loop while ctx[].pop_idx < (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        storage_class: struc CStorageClass = make_CStorageClass(AST_CStatic_t)
        loop .. while 0 {
            "@MACRO@:TRY(peek_next(ctx))"
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == TOK_key_data {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->peek_tok->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_parser_msg(MSG_data_at_toplvl), "MSG_data_at_toplvl", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(parse_declaration(ctx, &storage_class, &declaration))"
            _errval = parse_declaration(ctx, @storage_class, @declaration)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(declarations, declaration)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(declarations, declaration)"
                loop .. while 0 {
                    (? (not (declarations) or (cast<*struc stbds_array_header>((declarations)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((declarations)) - 1)[].capacity) then (((declarations) = stbds_arrgrowf((declarations), sizeof((declarations)[]), (1), (0))) and 0) else 0)
                    (declarations)[(cast<*struc stbds_array_header>((declarations)) - 1)[].length++] = (declaration)
                }
            }
            declaration = nil
        }
        loop .. while 0 {
            "@MACRO@:TRY(pop_next(ctx))"
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(expect_next(ctx, ctx->next_tok, TOK_line_break))"
            _errval = expect_next(ctx, ctx[].next_tok, TOK_line_break)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    c_ast[] = make_CProgram(@declarations)
    label _Lfinally
    free_CDeclaration(@declaration)
    loop i: u64 = 0 while i < (? (declarations) then (cast<*struc stbds_array_header>((declarations)) - 1)[].length else 0) .. ++i {
        free_CDeclaration(@declarations[i])
    }
    if declarations {
        "@MACRO@:vec_delete(declarations)"
        loop .. while 0 {
            cast<none>((? (declarations) then free((cast<*struc stbds_array_header>((declarations)) - 1)) else cast<none>(0)))
            (declarations) = nil
        }
        declarations = vec_new()
    }
    return _errval
}

pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32 {
    ctx: struc ParserContext;
    {
        ctx.errors = errors
        ctx.identifiers = identifiers
        ctx.pop_idx = 0
        ctx.p_toks = tokens
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(parse_program(&ctx, c_ast))"
        _errval = parse_program(@ctx, c_ast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if tokens[] {
        "@MACRO@:vec_delete(*tokens)"
        loop .. while 0 {
            cast<none>((? (tokens[]) then free((cast<*struc stbds_array_header>((tokens[])) - 1)) else cast<none>(0)))
            (tokens[]) = nil
        }
        tokens[] = vec_new()
    }
    return _errval
}
