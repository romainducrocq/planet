m4_include(`str2t.plx.m4')m4_dnl
m4_include(`throw.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../frontend/errors.plx.m4')m4_dnl





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

pub fn dbl_to_binary(decimal: f64) u64 {
    binary: u64;
    memcpy(@binary, @decimal, sizeof<u64>)
    return binary
}

pub fn string_to_literal(str_string: string, string_literal: **i8) none {
    loop byte: u64 = 1 while byte < sdslen(str_string) - 1 .. ++byte {
        str_char: char = cast<char>(str_string[byte])
        if str_char == '\\' {
            str_char = cast<char>(str_string[++byte])
            match str_char {
                -> '\'' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 39)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (39)
                        }
                    }
                }
                break
                -> '"' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 34)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (34)
                        }
                    }
                }
                break
                -> '?' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 63)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (63)
                        }
                    }
                }
                break
                -> '\\' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 92)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (92)
                        }
                    }
                }
                break
                -> 'a' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 7)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (7)
                        }
                    }
                }
                break
                -> 'b' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 8)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (8)
                        }
                    }
                }
                break
                -> 'f' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 12)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (12)
                        }
                    }
                }
                break
                -> 'n' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 10)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (10)
                        }
                    }
                }
                break
                -> 'r' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 13)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (13)
                        }
                    }
                }
                break
                -> 't' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 9)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (9)
                        }
                    }
                }
                break
                -> 'v' {
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(*string_literal, 11)"
                        loop .. while 0 {
                            (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                            (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (11)
                        }
                    }
                }
                break
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        else {
            loop .. while 0 {
                "@MACRO@:vec_push_back(*string_literal, (int8_t)str_char)"
                loop .. while 0 {
                    (? (not (string_literal[]) or (cast<*struc stbds_array_header>((string_literal[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((string_literal[])) - 1)[].capacity) then (((string_literal[]) = stbds_arrgrowf((string_literal[]), sizeof((string_literal[])[]), (1), (0))) and 0) else 0)
                    (string_literal[])[(cast<*struc stbds_array_header>((string_literal[])) - 1)[].length++] = (cast<i8>(str_char))
                }
            }
        }
    }
}

pub fn string_to_char_ascii(str_char: string) i32 {
    c_char: char = cast<char>(str_char[1])
    if c_char == '\\' {
        c_char = cast<char>(str_char[2])
        match c_char {
            -> '\'' {
                return 39
            }
            -> '"' {
                return 34
            }
            -> '?' {
                return 63
            }
            -> '\\' {
                return 92
            }
            -> 'a' {
                return 7
            }
            -> 'b' {
                return 8
            }
            -> 'f' {
                return 12
            }
            -> 'n' {
                return 10
            }
            -> 'r' {
                return 13
            }
            -> 't' {
                return 9
            }
            -> 'v' {
                return 11
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    else {
        return cast<i32>(c_char)
    }
}

fn hex_string_to_long(str_hex: string) i64 {
    end_ptr: string = nil
    value: i64 = strtoimax(str_hex, @end_ptr, 16)
    return value
}

fn string_literal_byte_to_hex(value: i8, str_hex: *string) none {
    byte_hex: [3]char;
    sprintf(byte_hex, "%.2x", cast<u32>(value))
    loop .. while 0 {
        "@MACRO@:str_append(*str_hex, byte_hex)"
        str_hex[] = sdscat(str_hex[], byte_hex)
    }
}

pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 1 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i8 = cast<i8>(hex_string_to_long(str_hex))
    if str_hex {
        "@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 4 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i32 = cast<i32>(hex_string_to_long(str_hex))
    if str_hex {
        "@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64 {
    str_hex: string = ? "" then sdsnew("") else nil
    loop byte: u64 = byte_at + 8 while byte-- > byte_at {
        if byte < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) {
            string_literal_byte_to_hex(string_literal[byte], @str_hex)
        }
    }
    hex_value: i64 = cast<i64>(hex_string_to_long(str_hex))
    if str_hex {
        "@MACRO@:str_delete(str_hex)"
        sdsfree(str_hex)
        str_hex = ? nil then sdsnew(nil) else nil
    }
    return hex_value
}

pub fn string_literal_to_const(string_literal: *i8) string {
    string_const: string = ? "" then sdsnew("") else nil
    loop i: u64 = 0 while i < (? (string_literal) then (cast<*struc stbds_array_header>((string_literal)) - 1)[].length else 0) .. ++i {
        byte: i8 = string_literal[i]
        match byte {
            -> 39 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\047\")"
                    string_const = sdscat(string_const, "\\047")
                }
            }
            break
            -> 34 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\042\")"
                    string_const = sdscat(string_const, "\\042")
                }
            }
            break
            -> 63 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\077\")"
                    string_const = sdscat(string_const, "\\077")
                }
            }
            break
            -> 92 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\134\")"
                    string_const = sdscat(string_const, "\\134")
                }
            }
            break
            -> 7 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\007\")"
                    string_const = sdscat(string_const, "\\007")
                }
            }
            break
            -> 8 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\010\")"
                    string_const = sdscat(string_const, "\\010")
                }
            }
            break
            -> 12 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\014\")"
                    string_const = sdscat(string_const, "\\014")
                }
            }
            break
            -> 10 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\012\")"
                    string_const = sdscat(string_const, "\\012")
                }
            }
            break
            -> 13 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\013\")"
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            -> 9 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\011\")"
                    string_const = sdscat(string_const, "\\011")
                }
            }
            break
            -> 11 {
                loop .. while 0 {
                    "@MACRO@:str_append(string_const, \"\\\\013\")"
                    string_const = sdscat(string_const, "\\013")
                }
            }
            break
            otherwise {
                loop .. while 0 {
                    "@MACRO@:str_push_back(string_const, (char)byte)"
                    loop .. while 0 {
                        "@MACRO@:str_resize(string_const, str_size(string_const) + 1)"
                        string_const = sdsgrowzero(string_const, sdslen(string_const) + 1)
                    }
                    (string_const)[sdslen(string_const) - 1] = cast<char>(byte)
                }
            }
            break
        }
    }
    return string_const
}

pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32 {
    _errval: i32 = 0
    end_ptr: string = nil
    value[] = strtoimax(str_int, @end_ptr, 10)
    if end_ptr == str_int {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtoi), "MSG_failed_strtoi", "", "", str_int) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32 {
    _errval: i32 = 0
    end_ptr: string = nil
    value[] = strtoumax(str_uint, @end_ptr, 10)
    if end_ptr == str_uint {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtou), "MSG_failed_strtou", "", "", str_uint) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32 {
    _errval: i32 = 0
    end_ptr: string = nil
    value[] = strtod(str_dbl, @end_ptr)
    if end_ptr == str_dbl {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_strtod), "MSG_failed_strtod", "", "", str_dbl) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}
