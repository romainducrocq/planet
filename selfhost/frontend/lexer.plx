m4_include(`errors.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/fileio.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl






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
type struc ErrorsContext;

type struc FileRead(len: u64, buf: string, fd: *struc FILE, filename: string)

type struc FileIoContext(errors: *struc ErrorsContext, fd_write: *struc FILE, write_buf: string, filename: string, file_reads: *struc FileRead)

pub fn find_file(filename: string) i32;
pub fn get_filename(ctx: *struc FileIoContext) string;
pub fn set_filename(ctx: *struc FileIoContext, filename: string) none;
pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32;
pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32;
pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32;
pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none;
pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32;
pub fn close_fwrite(ctx: *struc FileIoContext) none;
pub fn free_fileio(ctx: *struc FileIoContext) none;


type struc Elementhash_t(key: u64, value: char)

type struc LexerContext(errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, line: string, line_size: u64, match_at: u64, match_size: u64, includename_set: *struc Elementhash_t, p_includedirs: **string, p_stdlibdirs: **string, p_toks: **struc Token, paren_depth: u64, total_linenum: u64)

m4_define(`Ctx', `TODO')m4_dnl

fn get_char(ctx: *struc LexerContext) char {
    i: u64 = ctx[].match_at + ctx[].match_size
    if i < ctx[].line_size {
        return ctx[].line[i]
    }
    else {
        return 0
    }
}

m4_define(`LEX_SPACE', `TODO')m4_dnl
m4_define(`LEX_DIGIT', `TODO')m4_dnl
m4_define(`LEX_LETTER', `TODO')m4_dnl
m4_define(`LEX_WORD', `TODO')m4_dnl

fn match_char(ctx: *struc LexerContext, c: char) i32 {
    if c == get_char(ctx) {
        ctx[].match_size++
        return true
    }
    else {
        return false
    }
}

fn match_chars(ctx: *struc LexerContext, cs: string, n: u64) i32 {
    loop i: u64 = 0 while i < n .. ++i {
        if not match_char(ctx, cs[i]) {
            return false
        }
    }
    return true
}

fn match_invert(ctx: *struc LexerContext, c: char) i32 {
    inv: char = get_char(ctx)
    if inv ~= 0 and c ~= inv {
        ctx[].match_size++
        return true
    }
    else {
        return false
    }
}

fn match_space(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> ' ' {
            -> '\t' {
                ctx[].match_size++
                return true
            }
        }
        otherwise {
            return false
        }
    }
}

fn match_digit(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                ctx[].match_size++
                                                return true
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
            return false
        }
    }
}

fn match_word(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                -> '_' {
                                                    -> 'a' {
                                                        -> 'b' {
                                                            -> 'c' {
                                                                -> 'd' {
                                                                    -> 'e' {
                                                                        -> 'f' {
                                                                            -> 'g' {
                                                                                -> 'h' {
                                                                                    -> 'i' {
                                                                                        -> 'j' {
                                                                                            -> 'k' {
                                                                                                -> 'l' {
                                                                                                    -> 'm' {
                                                                                                        -> 'n' {
                                                                                                            -> 'o' {
                                                                                                                -> 'p' {
                                                                                                                    -> 'q' {
                                                                                                                        -> 'r' {
                                                                                                                            -> 's' {
                                                                                                                                -> 't' {
                                                                                                                                    -> 'u' {
                                                                                                                                        -> 'v' {
                                                                                                                                            -> 'w' {
                                                                                                                                                -> 'x' {
                                                                                                                                                    -> 'y' {
                                                                                                                                                        -> 'z' {
                                                                                                                                                            -> 'A' {
                                                                                                                                                                -> 'B' {
                                                                                                                                                                    -> 'C' {
                                                                                                                                                                        -> 'D' {
                                                                                                                                                                            -> 'E' {
                                                                                                                                                                                -> 'F' {
                                                                                                                                                                                    -> 'G' {
                                                                                                                                                                                        -> 'H' {
                                                                                                                                                                                            -> 'I' {
                                                                                                                                                                                                -> 'J' {
                                                                                                                                                                                                    -> 'K' {
                                                                                                                                                                                                        -> 'L' {
                                                                                                                                                                                                            -> 'M' {
                                                                                                                                                                                                                -> 'N' {
                                                                                                                                                                                                                    -> 'O' {
                                                                                                                                                                                                                        -> 'P' {
                                                                                                                                                                                                                            -> 'Q' {
                                                                                                                                                                                                                                -> 'R' {
                                                                                                                                                                                                                                    -> 'S' {
                                                                                                                                                                                                                                        -> 'T' {
                                                                                                                                                                                                                                            -> 'U' {
                                                                                                                                                                                                                                                -> 'V' {
                                                                                                                                                                                                                                                    -> 'W' {
                                                                                                                                                                                                                                                        -> 'X' {
                                                                                                                                                                                                                                                            -> 'Y' {
                                                                                                                                                                                                                                                                -> 'Z' {
                                                                                                                                                                                                                                                                    ctx[].match_size++
                                                                                                                                                                                                                                                                    return true
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
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn match_error(ctx: *struc LexerContext) i32 {
    ctx[].match_size++
    return TOK_error
}

fn match_include(ctx: *struc LexerContext, tok_kind: i32) i32 {
    loop while match_space(ctx) {
        ;
    }
    if match_char(ctx, '!') {
        match tok_kind {
            -> TOK_import_file {
                tok_kind = TOK_import_force
                break
            }
            -> TOK_use_file {
                tok_kind = TOK_use_force
                break
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        loop while match_space(ctx) {
            ;
        }
    }
    if match_char(ctx, '"') {
        ctx[].match_at += ctx[].match_size - 1
        ctx[].match_size = 1
        loop while match_invert(ctx, '"') {
            ;
        }
        if get_char(ctx) == '"' {
            ctx[].match_size++
            return tok_kind
        }
    }
    return match_error(ctx)
}

fn match_char_const(ctx: *struc LexerContext, is_str: i32) i32 {
    match get_char(ctx) {
        -> '\'' {
            if not is_str {
                return match_error(ctx)
            }
            break
        }
        -> '"' {
            if is_str {
                ctx[].match_size++
                return TOK_string_literal
            }
            break
        }
        -> '\n' {
            return match_error(ctx)
        }
        -> '\\' {
            ctx[].match_size++
            match get_char(ctx) {
                -> '\'' {
                    -> '"' {
                        -> '\\' {
                            -> '?' {
                                -> 'a' {
                                    -> 'b' {
                                        -> 'f' {
                                            -> 'n' {
                                                -> 'r' {
                                                    -> 't' {
                                                        -> 'v' {
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
                }
                otherwise {
                    return match_error(ctx)
                }
            }
        }
        otherwise {
            break
        }
    }
    ctx[].match_size++
    if is_str or match_char(ctx, '\'') {
        return TOK_char_const
    }
    else {
        return match_error(ctx)
    }
}

fn match_string_literal(ctx: *struc LexerContext) i32 {
    tok_kind: i32;
    loop .. while tok_kind == TOK_char_const {
        tok_kind = match_char_const(ctx, true)
    }
    return tok_kind
}

fn match_const_end(ctx: *struc LexerContext, tok_kind: i32) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                -> '_' {
                                                    -> 'a' {
                                                        -> 'b' {
                                                            -> 'c' {
                                                                -> 'd' {
                                                                    -> 'e' {
                                                                        -> 'f' {
                                                                            -> 'g' {
                                                                                -> 'h' {
                                                                                    -> 'i' {
                                                                                        -> 'j' {
                                                                                            -> 'k' {
                                                                                                -> 'l' {
                                                                                                    -> 'm' {
                                                                                                        -> 'n' {
                                                                                                            -> 'o' {
                                                                                                                -> 'p' {
                                                                                                                    -> 'q' {
                                                                                                                        -> 'r' {
                                                                                                                            -> 's' {
                                                                                                                                -> 't' {
                                                                                                                                    -> 'u' {
                                                                                                                                        -> 'v' {
                                                                                                                                            -> 'w' {
                                                                                                                                                -> 'x' {
                                                                                                                                                    -> 'y' {
                                                                                                                                                        -> 'z' {
                                                                                                                                                            -> 'A' {
                                                                                                                                                                -> 'B' {
                                                                                                                                                                    -> 'C' {
                                                                                                                                                                        -> 'D' {
                                                                                                                                                                            -> 'E' {
                                                                                                                                                                                -> 'F' {
                                                                                                                                                                                    -> 'G' {
                                                                                                                                                                                        -> 'H' {
                                                                                                                                                                                            -> 'I' {
                                                                                                                                                                                                -> 'J' {
                                                                                                                                                                                                    -> 'K' {
                                                                                                                                                                                                        -> 'L' {
                                                                                                                                                                                                            -> 'M' {
                                                                                                                                                                                                                -> 'N' {
                                                                                                                                                                                                                    -> 'O' {
                                                                                                                                                                                                                        -> 'P' {
                                                                                                                                                                                                                            -> 'Q' {
                                                                                                                                                                                                                                -> 'R' {
                                                                                                                                                                                                                                    -> 'S' {
                                                                                                                                                                                                                                        -> 'T' {
                                                                                                                                                                                                                                            -> 'U' {
                                                                                                                                                                                                                                                -> 'V' {
                                                                                                                                                                                                                                                    -> 'W' {
                                                                                                                                                                                                                                                        -> 'X' {
                                                                                                                                                                                                                                                            -> 'Y' {
                                                                                                                                                                                                                                                                -> 'Z' {
                                                                                                                                                                                                                                                                    -> '.' {
                                                                                                                                                                                                                                                                        return match_error(ctx)
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
                    }
                }
            }
        }
        otherwise {
            return tok_kind
        }
    }
}

fn match_dbl_exponent(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '+' {
            -> '-' {
                ctx[].match_size++
                break
            }
        }
        otherwise {
            break
        }
    }
    if not match_digit(ctx) {
        return TOK_error
    }
    loop while match_digit(ctx) {
        ;
    }
    return match_const_end(ctx, TOK_dbl_const)
}

fn match_dbl_fraction(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
        ;
    }
    if match_char(ctx, 'e') {
        return match_dbl_exponent(ctx)
    }
    else {
        return match_const_end(ctx, TOK_dbl_const)
    }
}

fn match_const(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
        ;
    }
    match get_char(ctx) {
        -> 'l' {
            ctx[].match_size++
            return match_const_end(ctx, TOK_long_const)
        }
        -> 'u' {
            ctx[].match_size++
            if match_char(ctx, 'l') {
                return match_const_end(ctx, TOK_ulong_const)
            }
            else {
                return match_const_end(ctx, TOK_uint_const)
            }
        }
        -> 'e' {
            ctx[].match_size++
            return match_dbl_exponent(ctx)
        }
        -> '.' {
            ctx[].match_size++
            return match_dbl_fraction(ctx)
        }
        otherwise {
            return match_const_end(ctx, TOK_int_const)
        }
    }
}

fn match_identifier(ctx: *struc LexerContext) i32 {
    match ctx[].line[ctx[].match_at] {
        -> 'a' {
            if match_char(ctx, 'n') {
                if match_char(ctx, 'd') {
                    if not match_word(ctx) {
                        return TOK_binop_and
                    }
                }
                elif match_char(ctx, 'y') and not match_word(ctx) {
                    return TOK_key_any
                }
            }
            break
        }
        -> 'b' {
            if match_char(ctx, 'r') {
                if match_chars(ctx, "eak", 3) and not match_word(ctx) {
                    return TOK_key_break
                }
            }
            elif match_chars(ctx, "ool", 3) and not match_word(ctx) {
                return TOK_key_i32
            }
            break
        }
        -> 'c' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "st", 2) and not match_word(ctx) {
                    return TOK_key_cast
                }
            }
            elif match_char(ctx, 'h') {
                if match_chars(ctx, "ar", 2) and not match_word(ctx) {
                    return TOK_key_char
                }
            }
            elif match_chars(ctx, "ontinue", 7) and not match_word(ctx) {
                return TOK_key_continue
            }
            break
        }
        -> 'd' {
            if match_chars(ctx, "ata", 3) and not match_word(ctx) {
                return TOK_key_data
            }
            break
        }
        -> 'e' {
            if match_char(ctx, 'l') {
                if match_char(ctx, 'i') {
                    if match_char(ctx, 'f') and not match_word(ctx) {
                        return TOK_key_elif
                    }
                }
                elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                    return TOK_key_else
                }
            }
            elif match_chars(ctx, "xtrn", 4) and not match_word(ctx) {
                return TOK_key_extrn
            }
            break
        }
        -> 'f' {
            if match_char(ctx, 'n') {
                if not match_word(ctx) {
                    return TOK_key_fn
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_f64
                }
            }
            elif match_chars(ctx, "alse", 4) and not match_word(ctx) {
                return TOK_key_false
            }
            break
        }
        -> 'i' {
            if match_char(ctx, 'f') {
                if not match_word(ctx) {
                    return TOK_key_if
                }
            }
            elif match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return TOK_key_i32
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_i64
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return TOK_key_i8
                }
            }
            elif match_chars(ctx, "mport", 5) and not match_word(ctx) {
                return match_include(ctx, TOK_import_file)
            }
            break
        }
        -> 'j' {
            if match_chars(ctx, "ump", 3) and not match_word(ctx) {
                return TOK_key_jump
            }
            break
        }
        -> 'l' {
            if match_char(ctx, 'o') {
                if match_chars(ctx, "op", 2) and not match_word(ctx) {
                    return TOK_key_loop
                }
            }
            elif match_chars(ctx, "abel", 4) and not match_word(ctx) {
                return TOK_key_label
            }
            break
        }
        -> 'm' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "tch", 3) and not match_word(ctx) {
                    return TOK_key_match
                }
            }
            elif match_chars(ctx, "4_", 2) {
                loop while match_word(ctx) {
                    ;
                }
                return TOK_m4_prefix
            }
            break
        }
        -> 'n' {
            if match_char(ctx, 'o') {
                if match_char(ctx, 'n') {
                    if match_char(ctx, 'e') and not match_word(ctx) {
                        return TOK_key_none
                    }
                }
                elif match_char(ctx, 't') and not match_word(ctx) {
                    return TOK_unop_not
                }
            }
            elif match_chars(ctx, "il", 2) and not match_word(ctx) {
                return TOK_key_false
            }
            break
        }
        -> 'o' {
            if match_char(ctx, 'r') {
                if not match_word(ctx) {
                    return TOK_binop_or
                }
            }
            elif match_chars(ctx, "therwise", 8) and not match_word(ctx) {
                return TOK_key_otherwise
            }
            break
        }
        -> 'p' {
            if match_chars(ctx, "ub", 2) and not match_word(ctx) {
                return TOK_key_pub
            }
            break
        }
        -> 'r' {
            if match_chars(ctx, "eturn", 5) and not match_word(ctx) {
                return TOK_key_return
            }
            break
        }
        -> 's' {
            if match_char(ctx, 'i') {
                if match_chars(ctx, "zeof", 4) and not match_word(ctx) {
                    return TOK_key_sizeof
                }
            }
            elif match_chars(ctx, "tr", 2) {
                if match_char(ctx, 'u') {
                    if match_char(ctx, 'c') and not match_word(ctx) {
                        return TOK_key_struc
                    }
                }
                elif match_chars(ctx, "ing", 3) and not match_word(ctx) {
                    return TOK_key_string
                }
            }
            break
        }
        -> 't' {
            if match_char(ctx, 'h') {
                if match_chars(ctx, "en", 2) and not match_word(ctx) {
                    return TOK_key_then
                }
            }
            elif match_char(ctx, 'y') {
                if match_chars(ctx, "pe", 2) and not match_word(ctx) {
                    return TOK_key_type
                }
            }
            elif match_chars(ctx, "rue", 3) and not match_word(ctx) {
                return TOK_key_true
            }
            break
        }
        -> 'u' {
            if match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return TOK_key_u32
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_u64
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return TOK_key_u8
                }
            }
            elif match_char(ctx, 'n') {
                if match_chars(ctx, "ion", 3) and not match_word(ctx) {
                    return TOK_key_union
                }
            }
            elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                return match_include(ctx, TOK_use_file)
            }
            break
        }
        -> 'w' {
            if match_chars(ctx, "hile", 4) and not match_word(ctx) {
                return TOK_key_while
            }
            break
        }
        otherwise {
            break
        }
    }
    loop while match_word(ctx) {
        ;
    }
    return TOK_identifier
}

fn match_token(ctx: *struc LexerContext) i32 {
    ctx[].match_size = 1
    match ctx[].line[ctx[].match_at] {
        -> '(' {
            return TOK_open_paren
        }
        -> ')' {
            return TOK_close_paren
        }
        -> '{' {
            return TOK_open_brace
        }
        -> '}' {
            return TOK_close_brace
        }
        -> '[' {
            return TOK_open_bracket
        }
        -> ']' {
            return TOK_close_bracket
        }
        -> ',' {
            return TOK_comma_separator
        }
        -> ';' {
            return TOK_semicolon
        }
        -> '@' {
            return TOK_unop_addrof
        }
        -> ':' {
            return TOK_assign_type
        }
        -> '!' {
            return TOK_force_exec
        }
        -> '?' {
            return TOK_ternary_if
        }
        -> '$' {
            return TOK_compound_init
        }
        -> '=' {
            if match_char(ctx, '=') {
                return TOK_binop_eq
            }
            else {
                return TOK_assign
            }
        }
        -> '~' {
            if match_char(ctx, '=') {
                return TOK_binop_ne
            }
            else {
                return TOK_unop_complement
            }
        }
        -> '-' {
            if match_char(ctx, '>') {
                return TOK_match_with
            }
            elif match_char(ctx, '-') {
                return TOK_unop_decr
            }
            elif match_char(ctx, '=') {
                return TOK_assign_subtract
            }
            else {
                return TOK_unop_neg
            }
        }
        -> '+' {
            if match_char(ctx, '+') {
                return TOK_unop_incr
            }
            elif match_char(ctx, '=') {
                return TOK_assign_add
            }
            else {
                return TOK_binop_add
            }
        }
        -> '*' {
            if match_char(ctx, '=') {
                return TOK_assign_multiply
            }
            else {
                return TOK_binop_multiply
            }
        }
        -> '/' {
            if match_char(ctx, '=') {
                return TOK_assign_divide
            }
            else {
                return TOK_binop_divide
            }
        }
        -> '%' {
            if match_char(ctx, '=') {
                return TOK_assign_remainder
            }
            else {
                return TOK_binop_remainder
            }
        }
        -> '&' {
            if match_char(ctx, '=') {
                return TOK_assign_bitand
            }
            else {
                return TOK_binop_bitand
            }
        }
        -> '|' {
            if match_char(ctx, '=') {
                return TOK_assign_bitor
            }
            else {
                return TOK_binop_bitor
            }
        }
        -> '<' {
            if match_char(ctx, '<') {
                if match_char(ctx, '=') {
                    return TOK_assign_shiftleft
                }
                else {
                    return TOK_binop_shiftleft
                }
            }
            elif match_char(ctx, '=') {
                return TOK_binop_le
            }
            else {
                return TOK_binop_lt
            }
        }
        -> '>' {
            if match_char(ctx, '>') {
                if match_char(ctx, '=') {
                    return TOK_assign_shiftright
                }
                else {
                    return TOK_binop_shiftright
                }
            }
            elif match_char(ctx, '=') {
                return TOK_binop_ge
            }
            else {
                return TOK_binop_gt
            }
        }
        -> '^' {
            if match_char(ctx, '=') {
                return TOK_assign_xor
            }
            else {
                return TOK_binop_xor
            }
        }
        -> '.' {
            match get_char(ctx) {
                -> '0' {
                    -> '1' {
                        -> '2' {
                            -> '3' {
                                -> '4' {
                                    -> '5' {
                                        -> '6' {
                                            -> '7' {
                                                -> '8' {
                                                    -> '9' {
                                                        return match_dbl_fraction(ctx)
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
                -> '.' {
                    ctx[].match_size++
                    return TOK_loop_post
                }
                otherwise {
                    return TOK_typeop_member
                }
            }
        }
        -> '\'' {
            return match_char_const(ctx, false)
        }
        -> '"' {
            return match_string_literal(ctx)
        }
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                return match_const(ctx)
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
        -> '_' {
            -> 'a' {
                -> 'b' {
                    -> 'c' {
                        -> 'd' {
                            -> 'e' {
                                -> 'f' {
                                    -> 'g' {
                                        -> 'h' {
                                            -> 'i' {
                                                -> 'j' {
                                                    -> 'k' {
                                                        -> 'l' {
                                                            -> 'm' {
                                                                -> 'n' {
                                                                    -> 'o' {
                                                                        -> 'p' {
                                                                            -> 'q' {
                                                                                -> 'r' {
                                                                                    -> 's' {
                                                                                        -> 't' {
                                                                                            -> 'u' {
                                                                                                -> 'v' {
                                                                                                    -> 'w' {
                                                                                                        -> 'x' {
                                                                                                            -> 'y' {
                                                                                                                -> 'z' {
                                                                                                                    -> 'A' {
                                                                                                                        -> 'B' {
                                                                                                                            -> 'C' {
                                                                                                                                -> 'D' {
                                                                                                                                    -> 'E' {
                                                                                                                                        -> 'F' {
                                                                                                                                            -> 'G' {
                                                                                                                                                -> 'H' {
                                                                                                                                                    -> 'I' {
                                                                                                                                                        -> 'J' {
                                                                                                                                                            -> 'K' {
                                                                                                                                                                -> 'L' {
                                                                                                                                                                    -> 'M' {
                                                                                                                                                                        -> 'N' {
                                                                                                                                                                            -> 'O' {
                                                                                                                                                                                -> 'P' {
                                                                                                                                                                                    -> 'Q' {
                                                                                                                                                                                        -> 'R' {
                                                                                                                                                                                            -> 'S' {
                                                                                                                                                                                                -> 'T' {
                                                                                                                                                                                                    -> 'U' {
                                                                                                                                                                                                        -> 'V' {
                                                                                                                                                                                                            -> 'W' {
                                                                                                                                                                                                                -> 'X' {
                                                                                                                                                                                                                    -> 'Y' {
                                                                                                                                                                                                                        -> 'Z' {
                                                                                                                                                                                                                            return match_identifier(ctx)
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
        -> '#' {
            -> '\n' {
                -> '\r' {
                    return TOK_line_break
                }
            }
        }
        -> ' ' {
            -> '\t' {
                -> '\f' {
                    -> '\v' {
                        return TOK_skip
                    }
                }
            }
        }
        otherwise {
            return TOK_error
        }
    }
}

fn get_match(ctx: *struc LexerContext, match_at: u64, match_size: u64) string {
    smatch: string = ? "" then sdsnew("") else nil
    loop .. while 0 {
        "@MACRO@:str_resize(smatch, match_size)"
        smatch = sdsgrowzero(smatch, match_size)
    }
    loop i: u64 = 0 while i < match_size .. ++i {
        smatch[i] = ctx[].line[match_at + i]
    }
    return smatch
}

fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32;

fn push_token_info(ctx: *struc LexerContext) u64 {
    token_info: struc TokenInfo = $(cast<i32>(ctx[].match_at), cast<i32>(ctx[].match_size), ctx[].total_linenum)
    loop .. while 0 {
        "@MACRO@:vec_push_back(ctx->errors->token_infos, token_info)"
        loop .. while 0 {
            (? (not (ctx[].errors[].token_infos) or (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].capacity) then (((ctx[].errors[].token_infos) = stbds_arrgrowf((ctx[].errors[].token_infos), sizeof((ctx[].errors[].token_infos)[]), (1), (0))) and 0) else 0)
            (ctx[].errors[].token_infos)[(cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length++] = (token_info)
        }
    }
    return (? (ctx[].errors[].token_infos) then (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length else 0) - 1
}

fn tokenize_file(ctx: *struc LexerContext) i32 {
    smatch: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop linenum: u64 = 1 while read_line(ctx[].fileio, @ctx[].line, @ctx[].line_size) .. ++linenum {
        ctx[].total_linenum++
        is_empty: i32 = true
        loop ctx[].match_at = 0 while ctx[].match_at < ctx[].line_size .. ctx[].match_at += ctx[].match_size {
            match_kind: i32 = match_token(ctx)
            match_tok: u64 = 0
            match match_kind {
                -> TOK_skip {
                    jump Lcontinue
                }
                -> TOK_import_file {
                    -> TOK_import_force {
                        -> TOK_use_file {
                            -> TOK_use_force {
                                loop .. while 0 {
                                    "@MACRO@:TRY(tokenize_include(ctx, match_kind, linenum, is_empty))"
                                    _errval = tokenize_include(ctx, match_kind, linenum, is_empty)
                                    if _errval ~= 0 {
                                        jump _Lfinally
                                    }
                                }
                            }
                        }
                    }
                }
                jump Lbreak
                -> TOK_line_break {
                    if is_empty or ctx[].paren_depth > 0 {
                        jump Lbreak
                    }
                    jump Lpass
                }
                -> TOK_open_paren {
                    ctx[].paren_depth++
                    jump Lpass
                }
                -> TOK_close_paren {
                    if ctx[].paren_depth == 0 {
                        smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                        info_at: u64 = push_token_info(ctx)
                        loop .. while 0 {
                            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_unmatched_close), "MSG_unmatched_close", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                            _errval = 1
                            jump _Lfinally
                        }
                    }
                    ctx[].paren_depth--
                    jump Lpass
                }
                -> TOK_identifier {
                    -> TOK_string_literal {
                        -> TOK_char_const {
                            -> TOK_int_const {
                                -> TOK_long_const {
                                    -> TOK_uint_const {
                                        -> TOK_ulong_const {
                                            -> TOK_dbl_const {
                                                smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                                                match_tok = make_string_identifier(ctx[].identifiers, @smatch)
                                                jump Lpass
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                -> TOK_m4_prefix {
                    smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_preproc_macro), "MSG_preproc_macro", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                -> TOK_error {
                    smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_invalid_tok), "MSG_invalid_tok", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                otherwise {
                    jump Lpass
                }
            }
            label Lbreak
            break
            label Lcontinue
            continue
            label Lpass
            ;
            info_at: u64 = push_token_info(ctx)
            token: struc Token = $(match_kind, match_tok, info_at)
            loop .. while 0 {
                "@MACRO@:vec_push_back(*ctx->p_toks, token)"
                loop .. while 0 {
                    (? (not (ctx[].p_toks[]) or (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].capacity) then (((ctx[].p_toks[]) = stbds_arrgrowf((ctx[].p_toks[]), sizeof((ctx[].p_toks[])[]), (1), (0))) and 0) else 0)
                    (ctx[].p_toks[])[(cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length++] = (token)
                }
            }
            if match_kind == TOK_line_break {
                break
            }
            is_empty = false
        }
    }
    label _Lfinally
    ;
    if smatch {
        "@MACRO@:str_delete(smatch)"
        sdsfree(smatch)
        smatch = ? nil then sdsnew(nil) else nil
    }
    ;
    return _errval
}

fn find_include(dirnames: *string, filename: *string) i32 {
    loop i: u64 = 0 while i < (? (dirnames) then (cast<*struc stbds_array_header>((dirnames)) - 1)[].length else 0) .. ++i {
        dirname: string = ? dirnames[i] then sdsnew(dirnames[i]) else nil
        loop .. while 0 {
            "@MACRO@:str_append(dirname, *filename)"
            dirname = sdscat(dirname, filename[])
        }
        if find_file(dirname) {
            if dirname ~= filename[] {
                "@MACRO@:str_move(dirname, *filename)"
                if filename[] {
                    "@MACRO@:str_delete(*filename)"
                    sdsfree(filename[])
                    filename[] = ? nil then sdsnew(nil) else nil
                }
                ;
                filename[] = dirname
                dirname = ? nil then sdsnew(nil) else nil
            }
            ;
            return true
        }
        if dirname {
            "@MACRO@:str_delete(dirname)"
            sdsfree(dirname)
            dirname = ? nil then sdsnew(nil) else nil
        }
        ;
    }
    return false
}

fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32 {
    filename: string = ? nil then sdsnew(nil) else nil
    fopen_name: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    line: string;
    line_size: u64;
    match_at: u64;
    match_size: u64;
    filename = get_match(ctx, ctx[].match_at + 1, ctx[].match_size - 2)
    loop .. while 0 {
        "@MACRO@:str_append(filename, \".etc\")"
        filename = sdscat(filename, ".etc")
    }
    if not is_empty {
        info_at: u64 = push_token_info(ctx)
        match match_tok {
            -> TOK_import_file {
                -> TOK_import_force {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_import_in_line), "MSG_import_in_line", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
            -> TOK_use_file {
                -> TOK_use_force {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_use_in_line), "MSG_use_in_line", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    {
        includename: u64 = stbds_hash_string(filename, 42)
        if (? ((ctx[].includename_set) = stbds_hmget_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof((ctx[].includename_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp) ~= -1 {
            match match_tok {
                -> TOK_import_file {
                    -> TOK_use_file {
                        jump _Lfinally
                    }
                }
                -> TOK_import_force {
                    -> TOK_use_force {
                        break
                    }
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        else {
            loop .. while 0 {
                "@MACRO@:set_insert(ctx->includename_set, includename)"
                loop .. while 0 {
                    "@MACRO@:map_add(ctx->includename_set, includename, 0)"
                    loop .. while 0 {
                        (ctx[].includename_set) = stbds_hmput_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof((ctx[].includename_set)[].key), 0)
                        (ctx[].includename_set)[(cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp].key = (includename)
                        (ctx[].includename_set)[(cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp].value = (0)
                    }
                }
            }
        }
    }
    match match_tok {
        -> TOK_import_file {
            -> TOK_import_force {
                if not find_include(ctx[].p_includedirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_failed_import), "MSG_failed_import", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                break
            }
        }
        -> TOK_use_file {
            -> TOK_use_force {
                if not find_include(ctx[].p_stdlibdirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_failed_use), "MSG_failed_use", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }
                }
                break
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    line = ctx[].line
    line_size = ctx[].line_size
    match_at = ctx[].match_at
    match_size = ctx[].match_size
    if (ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename ~= fopen_name {
        "@MACRO@:str_copy(vec_back(ctx->errors->fopen_lines).filename, fopen_name)"
        if fopen_name {
            "@MACRO@:str_delete(fopen_name)"
            sdsfree(fopen_name)
            fopen_name = ? nil then sdsnew(nil) else nil
        }
        ;
        fopen_name = sdsdup((ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename)
    }
    ;
    loop .. while 0 {
        "@MACRO@:TRY(open_fread(ctx->fileio, filename))"
        _errval = open_fread(ctx[].fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(1, ctx[].total_linenum + 1, ? nil then sdsnew(nil) else nil)
        if filename ~= fopen_line.filename {
            "@MACRO@:str_move(filename, fopen_line.filename)"
            if fopen_line.filename {
                "@MACRO@:str_delete(fopen_line.filename)"
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = filename
            filename = ? nil then sdsnew(nil) else nil
        }
        ;
        loop .. while 0 {
            "@MACRO@:vec_push_back(ctx->errors->fopen_lines, fopen_line)"
            loop .. while 0 {
                (? (not (ctx[].errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].capacity) then (((ctx[].errors[].fopen_lines) = stbds_arrgrowf((ctx[].errors[].fopen_lines), sizeof((ctx[].errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
                (ctx[].errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(tokenize_file(ctx))"
        _errval = tokenize_file(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(close_fread(ctx->fileio, linenum))"
        _errval = close_fread(ctx[].fileio, linenum)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(linenum + 1, ctx[].total_linenum + 1, ? nil then sdsnew(nil) else nil)
        if fopen_name ~= fopen_line.filename {
            "@MACRO@:str_move(fopen_name, fopen_line.filename)"
            if fopen_line.filename {
                "@MACRO@:str_delete(fopen_line.filename)"
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = fopen_name
            fopen_name = ? nil then sdsnew(nil) else nil
        }
        ;
        loop .. while 0 {
            "@MACRO@:vec_push_back(ctx->errors->fopen_lines, fopen_line)"
            loop .. while 0 {
                (? (not (ctx[].errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].capacity) then (((ctx[].errors[].fopen_lines) = stbds_arrgrowf((ctx[].errors[].fopen_lines), sizeof((ctx[].errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
                (ctx[].errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
            }
        }
    }
    ctx[].line = line
    ctx[].line_size = line_size
    ctx[].match_at = match_at
    ctx[].match_size = match_size
    label _Lfinally
    ;
    if filename {
        "@MACRO@:str_delete(filename)"
        sdsfree(filename)
        filename = ? nil then sdsnew(nil) else nil
    }
    ;
    if fopen_name {
        "@MACRO@:str_delete(fopen_name)"
        sdsfree(fopen_name)
        fopen_name = ? nil then sdsnew(nil) else nil
    }
    ;
    return _errval
}

pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32 {
    ctx: struc LexerContext;
    {
        ctx.errors = errors
        ctx.fileio = fileio
        ctx.identifiers = identifiers
        ctx.includename_set = set_new()
        ctx.p_includedirs = includedirs
        ctx.p_stdlibdirs = stdlibdirs
        ctx.p_toks = tokens
        ctx.paren_depth = 0
        ctx.total_linenum = 0
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(open_fread(ctx.fileio, filename))"
        _errval = open_fread(ctx.fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        fopen_line: struc FileOpenLine = $(1, 1, ? nil then sdsnew(nil) else nil)
        if filename ~= fopen_line.filename {
            "@MACRO@:str_copy(filename, fopen_line.filename)"
            if fopen_line.filename {
                "@MACRO@:str_delete(fopen_line.filename)"
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = sdsdup(filename)
        }
        ;
        loop .. while 0 {
            "@MACRO@:vec_push_back(ctx.errors->fopen_lines, fopen_line)"
            loop .. while 0 {
                (? (not (ctx.errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].capacity) then (((ctx.errors[].fopen_lines) = stbds_arrgrowf((ctx.errors[].fopen_lines), sizeof((ctx.errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
                (ctx.errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(tokenize_file(&ctx))"
        _errval = tokenize_file(@ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(close_fread(ctx.fileio, 0))"
        _errval = close_fread(ctx.fileio, 0)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    set_filename(ctx.fileio, filename)
    label _Lfinally
    ;
    loop .. while 0 {
        "@MACRO@:set_delete(ctx.includename_set)"
        if ctx.includename_set {
            "@MACRO@:map_delete(ctx.includename_set)"
            loop .. while 0 {
                cast<none>((? (ctx.includename_set) ~= nil then stbds_hmfree_func((ctx.includename_set) - 1, sizeof((ctx.includename_set)[])) else cast<none>(0)))
                (ctx.includename_set) = nil
            }
            ctx.includename_set = map_new()
        }
        ;
    }
    loop i: u64 = 0 while i < (? (fileio[].file_reads) then (cast<*struc stbds_array_header>((fileio[].file_reads)) - 1)[].length else 0) .. ++i {
        if fileio[].file_reads[i].filename {
            "@MACRO@:str_delete(fileio->file_reads[i].filename)"
            sdsfree(fileio[].file_reads[i].filename)
            fileio[].file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
        ;
    }
    if fileio[].file_reads {
        "@MACRO@:vec_delete(fileio->file_reads)"
        loop .. while 0 {
            cast<none>((? (fileio[].file_reads) then free((cast<*struc stbds_array_header>((fileio[].file_reads)) - 1)) else cast<none>(0)))
            (fileio[].file_reads) = nil
        }
        fileio[].file_reads = vec_new()
    }
    ;
    if includedirs[] {
        "@MACRO@:vec_delete(*includedirs)"
        loop .. while 0 {
            cast<none>((? (includedirs[]) then free((cast<*struc stbds_array_header>((includedirs[])) - 1)) else cast<none>(0)))
            (includedirs[]) = nil
        }
        includedirs[] = vec_new()
    }
    ;
    if stdlibdirs[] {
        "@MACRO@:vec_delete(*stdlibdirs)"
        loop .. while 0 {
            cast<none>((? (stdlibdirs[]) then free((cast<*struc stbds_array_header>((stdlibdirs[])) - 1)) else cast<none>(0)))
            (stdlibdirs[]) = nil
        }
        stdlibdirs[] = vec_new()
    }
    ;
    return _errval
}
