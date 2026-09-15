m4_include(`fileio.plx.m4')m4_dnl
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
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`WRITE_BUF_SIZE', `4096')m4_dnl

pub fn find_file(filename: string) i32 {
    fd: *struc FILE = fopen(filename, "rb")
    if fd {
        fclose(fd)
        return true
    }
    else {
        return false
    }
}

pub fn get_filename(ctx: *struc FileIoContext) string {
    if not ((? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) == 0) {
        return (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename
    }
    else {
        return ctx[].filename
    }
}

pub fn set_filename(ctx: *struc FileIoContext, filename: string) none {
    if filename ~= ctx[].filename {
        "@MACRO@:str_copy(filename, ctx->filename)"
        if ctx[].filename {
            "@MACRO@:str_delete(ctx->filename)"
            sdsfree(ctx[].filename)
            ctx[].filename = ? nil then sdsnew(nil) else nil
        }
        ctx[].filename = sdsdup(filename)
    }
}

pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32 {
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) .. ++i {
        if ctx[].file_reads[i].fd {
            n_fopens: u64 = (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - i
            if n_fopens == FOPEN_MAX - 1 {
                ctx[].file_reads[i].len = 0
                free(ctx[].file_reads[i].buf)
                ctx[].file_reads[i].buf = nil
                fclose(ctx[].file_reads[i].fd)
                ctx[].file_reads[i].fd = nil
            }
            break
        }
    }
    file_read: struc FileRead = $(0, nil, nil, ? nil then sdsnew(nil) else nil)
    file_read.fd = fopen(filename, "rb")
    if not file_read.fd or sdslen(filename) >= 4096 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fread), "MSG_failed_fread", "", "", filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if filename ~= file_read.filename {
        "@MACRO@:str_copy(filename, file_read.filename)"
        if file_read.filename {
            "@MACRO@:str_delete(file_read.filename)"
            sdsfree(file_read.filename)
            file_read.filename = ? nil then sdsnew(nil) else nil
        }
        file_read.filename = sdsdup(filename)
    }
    loop .. while 0 {
        "@MACRO@:vec_push_back(ctx->file_reads, file_read)"
        loop .. while 0 {
            (? (not (ctx[].file_reads) or (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].capacity) then (((ctx[].file_reads) = stbds_arrgrowf((ctx[].file_reads), sizeof((ctx[].file_reads)[]), (1), (0))) and 0) else 0)
            (ctx[].file_reads)[(cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length++] = (file_read)
        }
    }
    label _Lfinally
    return _errval
}

pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32 {
    _errval: i32 = 0
    ctx[].fd_write = nil
    ctx[].fd_write = fopen(filename, "wb")
    if not ctx[].fd_write or sdslen(filename) >= 4096 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fwrite), "MSG_failed_fwrite", "", "", filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].write_buf = ? "" then sdsnew("") else nil
    loop .. while 0 {
        "@MACRO@:str_reserve(ctx->write_buf, WRITE_BUF_SIZE)"
        ctx[].write_buf = sdsMakeRoomFor(ctx[].write_buf, WRITE_BUF_SIZE)
    }
    label _Lfinally
    return _errval
}

pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32 {
    line_ssize: i64 = getline(@(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf, @(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len, (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)
    if line_ssize == -1 {
        line = nil
        line_size[] = 0
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len = 0
        free((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf)
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf = nil
        return false
    }
    else {
        line[] = (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf
        line_size[] = cast<u64>(line_ssize)
        return true
    }
}

fn write_chunk(ctx: *struc FileIoContext, buf: string, buf_size: u64) none {
    fwrite(buf, sizeof<char>, buf_size, ctx[].fd_write)
}

pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none {
    loop .. while 0 {
        "@MACRO@:str_append(ctx->write_buf, buf)"
        ctx[].write_buf = sdscat(ctx[].write_buf, buf)
    }
    loop while sdslen(ctx[].write_buf) >= WRITE_BUF_SIZE {
        write_chunk(ctx, ctx[].write_buf, WRITE_BUF_SIZE)
        loop .. while 0 {
            "@MACRO@:str_substr(ctx->write_buf, WRITE_BUF_SIZE, -1)"
            sdsrange(ctx[].write_buf, WRITE_BUF_SIZE, -1)
        }
    }
}

pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32 {
    _errval: i32 = 0
    fclose((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd)
    (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd = nil
    if (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename {
        "@MACRO@:str_delete(vec_back(ctx->file_reads).filename)"
        sdsfree((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename)
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename = ? nil then sdsnew(nil) else nil
    }
    loop .. while 0 {
        "@MACRO@:vec_pop_back(ctx->file_reads)"
        ((cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length--)
    }
    if not ((? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) == 0) and not (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd {
        (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd = fopen((ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename, "rb")
        if not (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fread), "MSG_failed_fread", "", "", (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop i: u64 = 0 while i < linenum .. ++i {
            if getline(@(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].buf, @(ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].len, (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].fd) == -1 {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_base_error(ctx->errors))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_util_msg(MSG_failed_fread), "MSG_failed_fread", "", "", (ctx[].file_reads)[(? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) - 1].filename) > 0 then cast<none>(raise_base_error(ctx[].errors)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
    }
    label _Lfinally
    return _errval
}

pub fn close_fwrite(ctx: *struc FileIoContext) none {
    write_chunk(ctx, ctx[].write_buf, sdslen(ctx[].write_buf))
    loop .. while 0 {
        "@MACRO@:str_clear(ctx->write_buf)"
        sdsclear(ctx[].write_buf)
    }
    fclose(ctx[].fd_write)
    ctx[].fd_write = nil
}

pub fn free_fileio(ctx: *struc FileIoContext) none {
    loop i: u64 = 0 while i < (? (ctx[].file_reads) then (cast<*struc stbds_array_header>((ctx[].file_reads)) - 1)[].length else 0) .. ++i {
        file_read: *struc FileRead = @ctx[].file_reads[i]
        if file_read[].buf ~= nil {
            free(file_read[].buf)
            file_read[].buf = nil
        }
        if file_read[].fd ~= nil {
            fclose(file_read[].fd)
            file_read[].fd = nil
        }
    }
    if ctx[].fd_write ~= nil {
        fclose(ctx[].fd_write)
        ctx[].fd_write = nil
    }
}
