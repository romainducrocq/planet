m4_include(`errors.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

pub fn get_tok_kind_fmt(tok_kind: TOKEN_KIND) string {
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
            THROW_ABORT
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
                                        return map_get(ctx[].hash_table, token[].tok)
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
                    THROW_ABORT
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
                    THROW_ABORT
                }
            }
        }
        otherwise {
            THROW_ABORT
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
            THROW_ABORT
        }
    }
}

pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string_t) string {
    value: string_t = map_get(ctx[].hash_table, name)
    str_copy(value, name_fmt[])
    loop i: u64 = str_size(name_fmt[]) while i-- > 0 {
        if (name_fmt[])[i] == UID_SEPARATOR[0] {
            str_substr(name_fmt[], 0, i - 1)
            break
        }
    }
    return name_fmt[]
}

pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string_t) string {
    struct_fmt[] = ? is_union then str_new("union ") else str_new("struc ")
    {
        name_fmt: string_t = str_new(nil)
        str_append(struct_fmt[], get_name_fmt(ctx, name, @name_fmt))
        str_delete(name_fmt)
    }
    return struct_fmt[]
}

pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string_t) string {
    fun_fmt[] = str_new(`"("')
    if vec_empty(fun_type[].param_types) {
        str_append(fun_fmt[], "none")
    }
    else {
        type_fmt: string_t = str_new(nil)
        str_append(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[0], @type_fmt))
        str_delete(type_fmt)
    }
    loop i: u64 = 1 while i < vec_size(fun_type[].param_types) .. ++i {
        str_append(fun_fmt[], `","' " ")
        {
            type_fmt: string_t = str_new(nil)
            str_append(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[i], @type_fmt))
            str_delete(type_fmt)
        }
    }
    str_append(fun_fmt[], `")"' " -> ")
    {
        type_fmt: string_t = str_new(nil)
        str_append(fun_fmt[], get_type_fmt(ctx, fun_type[].ret_type, @type_fmt))
        str_delete(type_fmt)
    }
    return fun_fmt[]
}

pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string_t) string {
    ptr_fmt[] = str_new("*")
    loop while ptr_type[].ref_type[].tag == AST_Pointer_t {
        ptr_type = @ptr_type[].ref_type[].get._Pointer
        str_append(ptr_fmt[], "*")
    }
    if ptr_type[].ref_type[].tag == AST_Void_t {
        str_append(ptr_fmt[], "any")
    }
    else {
        type_fmt: string_t = str_new(nil)
        str_append(ptr_fmt[], get_type_fmt(ctx, ptr_type[].ref_type, @type_fmt))
        str_delete(type_fmt)
    }
    return ptr_fmt[]
}

pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string_t) string {
    arr_fmt[] = str_new("[")
    {
        strto_size: string_t = str_to_string(arr_type[].size)
        str_append(arr_fmt[], strto_size)
        str_delete(strto_size)
    }
    str_append(arr_fmt[], "]")
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        str_append(arr_fmt[], "[")
        {
            strto_size: string_t = str_to_string(arr_type[].size)
            str_append(arr_fmt[], strto_size)
            str_delete(strto_size)
        }
        str_append(arr_fmt[], "]")
    }
    if arr_type[].elem_type[].tag == AST_Void_t {
        str_append(arr_fmt[], "any")
    }
    else {
        type_fmt: string_t = str_new(nil)
        str_append(arr_fmt[], get_type_fmt(ctx, arr_type[].elem_type, @type_fmt))
        str_delete(type_fmt)
    }
    return arr_fmt[]
}

pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string_t) string {
    return get_struct_name_fmt(ctx, struct_type[].tag_name, struct_type[].is_union, struct_fmt)
}

pub fn get_type_fmt(ctx: *struc IdentifierContext, type_t: *struc Type, type_fmt: *string_t) string {
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
            THROW_ABORT
        }
    }
}

m4_define(`EM_CSTR', `"‘" $1 "’"')m4_dnl
m4_define(`EM_VARG', `"‘%s’"')m4_dnl
m4_define(`PAD_ERR_0', `"%s%s%s"')m4_dnl
m4_define(`PAD_ERR_1', `"%s%s"')m4_dnl
m4_define(`PAD_ERR_2', `"%s"')m4_dnl
m4_define(`PAD_ERR_3', `""')m4_dnl
m4_define(`RET_ERR', `return "(no. %s) " PAD_ERR_$1')m4_dnl

pub fn get_fatal_msg(msg: MESSAGE_FATAL) string {
    if msg == MSG_unsupported_os {
        RET_ERR(1) EM_VARG " operating system is not supported, requires " EM_CSTR("GNU/Linux") " (x86_64) or " EM_CSTR("MacOS")
    }
    else {
        THROW_ABORT
    }
}

pub fn get_arg_msg(msg: MESSAGE_ARG) string {
    match msg {
        -> MSG_print_help {
            RET_ERR(1) "Usage: %s [--help] Debug OptimL1 OptimL2 FILE StdlibDir SourceDir [IncludeDir...]\n" "    [--help]:         print help and exit\n" "    Debug:            print debug info (0..1|251..255)\n" "    OptimL1:          optimization level 1 mask (0..15)\n" "    OptimL2:          optimization level 2 enum (0..2)\n" "    FILE:             source file to compile\n" "    StdlibDir:        standard lib include path\n" "    SourceDir:        source file include path\n" "    [IncludeDir...]:  add a list of paths to include path\n" "see " EM_CSTR("driver.sh")
        }
        -> MSG_no_debug_arg {
            RET_ERR(0) "no debug code passed in first argument, see " EM_CSTR("--help")
        }
        -> MSG_invalid_debug_arg {
            RET_ERR(1) "invalid debug code " EM_VARG " passed in first argument, see " EM_CSTR("--help")
        }
        -> MSG_no_optim_1_arg {
            RET_ERR(0) "no level 1 optimization mask passed in second argument, see " EM_CSTR("--help")
        }
        -> MSG_invalid_optim_1_arg {
            RET_ERR(1) "invalid level 1 optimization mask " EM_VARG " passed in second argument, see " EM_CSTR("--help")
        }
        -> MSG_no_optim_2_arg {
            RET_ERR(0) "no level 2 optimization code passed in third argument, see " EM_CSTR("--help")
        }
        -> MSG_invalid_optim_2_arg {
            RET_ERR(1) "invalid level 2 optimization code " EM_VARG " passed in third argument, see " EM_CSTR("--help")
        }
        -> MSG_no_input_files_arg {
            RET_ERR(0) "no input file passed in fourth argument, see " EM_CSTR("--help")
        }
        -> MSG_no_stdlib_dir_arg {
            RET_ERR(0) "no standard lib directory passed in fifth argument, see " EM_CSTR("--help")
        }
        -> MSG_no_include_dir_arg {
            RET_ERR(0) "no include directories passed in sixth argument, see " EM_CSTR("--help")
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_util_msg(msg: MESSAGE_UTIL) string {
    match msg {
        -> MSG_failed_fread {
            RET_ERR(1) "cannot read input file " EM_VARG
        }
        -> MSG_failed_fwrite {
            RET_ERR(1) "cannot write output file " EM_VARG
        }
        -> MSG_failed_strtoi {
            RET_ERR(1) "cannot interpret string " EM_VARG " to an integer value"
        }
        -> MSG_failed_strtou {
            RET_ERR(1) "cannot interpret string " EM_VARG " to an unsigned integer value"
        }
        -> MSG_failed_strtod {
            RET_ERR(1) "cannot interpret string " EM_VARG " to a floating point value"
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_lexer_msg(msg: MESSAGE_LEXER) string {
    match msg {
        -> MSG_invalid_tok {
            RET_ERR(1) "found invalid token " EM_VARG
        }
        -> MSG_failed_import {
            RET_ERR(1) "cannot find " EM_VARG " header file in " EM_CSTR("import") " directive search"
        }
        -> MSG_failed_use {
            RET_ERR(1) "cannot find " EM_VARG " header file in " EM_CSTR("use") " directive search"
        }
        -> MSG_import_in_line {
            RET_ERR(1) "cannot search " EM_VARG " in a line, " EM_CSTR("import") " requires its own line"
        }
        -> MSG_use_in_line {
            RET_ERR(1) "cannot search " EM_VARG " in a line, " EM_CSTR("use") " requires its own line"
        }
        -> MSG_preproc_macro {
            RET_ERR(1) "found m4 macro " EM_VARG ", preprocess with " EM_CSTR("-E") " or see " EM_CSTR("--help")
        }
        -> MSG_unmatched_close {
            RET_ERR(1) "found unmatched bracket " EM_VARG
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_parser_msg(msg: MESSAGE_PARSER) string {
    match msg {
        -> MSG_unexpected_next_tok {
            RET_ERR(2) "found token " EM_VARG ", but expected " EM_VARG " next"
        }
        -> MSG_reached_eof {
            RET_ERR(0) "reached end of file, but expected declaration or statement next"
        }
        -> MSG_overflow_long_const {
            RET_ERR(1) "cannot represent " EM_VARG " as a 64 bits signed integer constant, very large number"
        }
        -> MSG_overflow_ulong_const {
            RET_ERR(1) "cannot represent " EM_VARG " as a 64 bits unsigned integer constant, very large number"
        }
        -> MSG_expect_unop {
            RET_ERR(1) "found token " EM_VARG ", but expected unary operator " EM_CSTR("~") ", " EM_CSTR("-") " or " EM_CSTR("not") " next"
        }
        -> MSG_expect_binop {
            RET_ERR(1) "found token " EM_VARG ", but expected binary operator " EM_CSTR("=") ", " EM_CSTR("+") ", " EM_CSTR("+=") ", " EM_CSTR("-") ", " EM_CSTR("-=") ", " EM_CSTR("*") ", " EM_CSTR("*=") ", " EM_CSTR("/") ", " EM_CSTR("/=") ", " EM_CSTR("%") ", " EM_CSTR("%=") ", " EM_CSTR("&") ", " EM_CSTR("&=") ", " EM_CSTR("|") ", " EM_CSTR("|=") ", " EM_CSTR("^") ", " EM_CSTR("^=") ", " EM_CSTR("<<") ", " EM_CSTR("<<=") ", " EM_CSTR(">>") ", " EM_CSTR(">>=") ", " EM_CSTR("and") ", " EM_CSTR("or") ", " EM_CSTR("==") ", " EM_CSTR("~=") ", " EM_CSTR("<") ", " EM_CSTR("<=") ", " EM_CSTR(">") " or " EM_CSTR(">=") " next"
        }
        -> MSG_expect_data_specifier {
            RET_ERR(1) "found token " EM_VARG ", but expected datatype specifier " EM_CSTR("struc") " or " EM_CSTR("union") " next"
        }
        -> MSG_expect_specifier {
            RET_ERR(1) "found token " EM_VARG ", but expected type specifier " EM_CSTR("char") ", " EM_CSTR("string") ", " EM_CSTR("bool") ", " EM_CSTR("i32") ", " EM_CSTR("i64") ", " EM_CSTR("i8") ", " EM_CSTR("f64") ", " EM_CSTR("u32") ", " EM_CSTR("u64") ", " EM_CSTR("u8") ", " EM_CSTR("struc") ", " EM_CSTR("union") ", " EM_CSTR("*") ", " EM_CSTR("*any") " or " EM_CSTR("[") " next"
        }
        -> MSG_expect_maybe_type {
            RET_ERR(1) "found token " EM_VARG ", but expected maybe type specifier " EM_CSTR("none") ", " EM_CSTR("char") ", " EM_CSTR("string") ", " EM_CSTR("bool") ", " EM_CSTR("i32") ", " EM_CSTR("i64") ", " EM_CSTR("i8") ", " EM_CSTR("f64") ", " EM_CSTR("u32") ", " EM_CSTR("u64") ", " EM_CSTR("u8") ", " EM_CSTR("struc") ", " EM_CSTR("union") ", " EM_CSTR("*") ", " EM_CSTR("*any") " or " EM_CSTR("[") " next"
        }
        -> MSG_expect_open_sizeof {
            RET_ERR(1) "found token " EM_VARG ", but expected sizeof " EM_CSTR("<") " or " EM_CSTR(`"("') " next"
        }
        -> MSG_expect_expression {
            RET_ERR(1) "found token " EM_VARG ", but expected expression " EM_CSTR("?") ", " EM_CSTR("~") ", " EM_CSTR("-") ", " EM_CSTR("not") ", " EM_CSTR("++") ", " EM_CSTR("--") ", " EM_CSTR("@") ", " EM_CSTR("sizeof") ", " EM_CSTR("cast") ", " EM_CSTR("identifier") ", " EM_CSTR("identifier" `"("') ", " EM_CSTR(`"("') ", " EM_CSTR("const string") ", " EM_CSTR("const char") ", " EM_CSTR("const i32") ", " EM_CSTR("const i64") ", " EM_CSTR("const u32") ", " EM_CSTR("const u64") ", " EM_CSTR("const f64") ", " EM_CSTR("true") ", " EM_CSTR("false") " or " EM_CSTR("nil") " next"
        }
        -> MSG_expect_assign {
            RET_ERR(1) "found token " EM_VARG ", but expected assignment " EM_CSTR("=") " or " EM_CSTR(";") " next"
        }
        -> MSG_expect_datatype {
            RET_ERR(1) "found token " EM_VARG ", but expected member list " EM_CSTR(`"("') " or " EM_CSTR(";") " next"
        }
        -> MSG_expect_block {
            RET_ERR(1) "found token " EM_VARG ", but expected block " EM_CSTR("{") " or " EM_CSTR(";") " next"
        }
        -> MSG_expect_declaration {
            RET_ERR(1) "found token " EM_VARG ", but expected declaration " EM_CSTR("identifier") ", " EM_CSTR("fn") " or " EM_CSTR("type") " next"
        }
        -> MSG_expect_storage_class {
            RET_ERR(1) "found token " EM_VARG ", but expected storage class " EM_CSTR("pub") ", " EM_CSTR("data") ", " EM_CSTR("extrn") ", " EM_CSTR("identifier") ", " EM_CSTR("fn") " or " EM_CSTR("type") " next"
        }
        -> MSG_incomplete_any {
            RET_ERR(0) "incomplete type " EM_CSTR("any") " requires a pointer, or use " EM_CSTR("none") " instead"
        }
        -> MSG_arr_size_not_int_const {
            RET_ERR(1) "illegal array size " EM_VARG ", requires a constant integer"
        }
        -> MSG_case_value_not_int_const {
            RET_ERR(1) "illegal " EM_CSTR("->") " value " EM_VARG ", requires a constant integer"
        }
        -> MSG_empty_block {
            RET_ERR(0) "empty block requires at least one item, or use " EM_CSTR(";") " instead"
        }
        -> MSG_empty_compound_init {
            RET_ERR(0) "empty compound initializer requires at least one initializer"
        }
        -> MSG_infinite_loop {
            RET_ERR(0) "cannot exit " EM_CSTR("loop") ", infinite loop requires at least one statement"
        }
        -> MSG_loop_decl_not_auto {
            RET_ERR(1) "illegal storage " EM_VARG ", cannot use storage class in " EM_CSTR("loop") " initialization"
        }
        -> MSG_list_decl_not_auto {
            RET_ERR(1) "illegal storage " EM_VARG ", cannot use storage class in list declaration"
        }
        -> MSG_type_decl_not_auto {
            RET_ERR(1) "illegal storage " EM_VARG ", cannot use storage class in type declaration"
        }
        -> MSG_pub_in_block {
            RET_ERR(0) "illegal storage class, cannot use " EM_CSTR("pub") " declaration in block"
        }
        -> MSG_data_at_toplvl {
            RET_ERR(0) "illegal storage class, cannot use " EM_CSTR("data") " declaration at top level"
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_semantic_msg(msg: MESSAGE_SEMANTIC) string {
    match msg {
        -> MSG_incomplete_arr {
            RET_ERR(2) "array type " EM_VARG " of incomplete type " EM_VARG ", requires a complete type"
        }
        -> MSG_joint_ptr_mismatch {
            RET_ERR(2) "pointer type mismatch " EM_VARG " and " EM_VARG " in operator"
        }
        -> MSG_fun_used_as_var {
            RET_ERR(1) "function " EM_VARG " used as a variable"
        }
        -> MSG_illegal_cast {
            RET_ERR(2) "illegal cast, cannot convert expression from type " EM_VARG " to " EM_VARG
        }
        -> MSG_invalid_unary_op {
            RET_ERR(2) "cannot apply unary operator " EM_VARG " on operand type " EM_VARG
        }
        -> MSG_invalid_binary_op {
            RET_ERR(2) "cannot apply binary operator " EM_VARG " on operand type " EM_VARG
        }
        -> MSG_invalid_binary_ops {
            RET_ERR(3) "cannot apply binary operator " EM_VARG " on operand types " EM_VARG " and " EM_VARG
        }
        -> MSG_assign_to_void {
            RET_ERR(0) "cannot assign " EM_CSTR("=") " to left operand type " EM_CSTR("none")
        }
        -> MSG_assign_to_rvalue {
            RET_ERR(1) "assignment " EM_VARG " requires lvalue left operand, but got rvalue"
        }
        -> MSG_invalid_condition {
            RET_ERR(1) "cannot apply conditional " EM_CSTR("then") " on condition operand type " EM_VARG
        }
        -> MSG_invalid_ternary_op {
            RET_ERR(2) "cannot apply ternary operator " EM_CSTR("else") " on operand types " EM_VARG " and " EM_VARG
        }
        -> MSG_var_used_as_fun {
            RET_ERR(1) "variable " EM_VARG " used as a function"
        }
        -> MSG_call_with_wrong_argc {
            RET_ERR(3) "function " EM_VARG " called with " EM_VARG " arguments instead of " EM_VARG
        }
        -> MSG_deref_not_ptr {
            RET_ERR(1) "cannot apply dereference operator " EM_CSTR("[]") " on non-pointer type " EM_VARG
        }
        -> MSG_addrof_rvalue {
            RET_ERR(0) "addresssing " EM_CSTR("@") " requires lvalue operand, but got rvalue"
        }
        -> MSG_invalid_subscript {
            RET_ERR(2) "cannot subscript array with operand types " EM_VARG " and " EM_VARG ", requires a complete pointer and an integer types"
        }
        -> MSG_sizeof_incomplete {
            RET_ERR(1) "cannot get size with " EM_CSTR("sizeof") " operator on incomplete type " EM_VARG
        }
        -> MSG_dot_not_struct {
            RET_ERR(2) "cannot access datatype member " EM_VARG " with dot operator " EM_CSTR(".") " on non-datatype " EM_VARG
        }
        -> MSG_member_not_in_struct {
            RET_ERR(2) "datatype " EM_VARG " has no member named " EM_VARG
        }
        -> MSG_arrow_not_struct_ptr {
            RET_ERR(2) "cannot access datatype member " EM_VARG " with dereferenced dot operator " EM_CSTR("[].") " on non-pointer-to-datatype " EM_VARG
        }
        -> MSG_arrow_incomplete {
            RET_ERR(2) "cannot access datatype member " EM_VARG " with dereferenced dot operator " EM_CSTR("[].") " on incomplete datatype " EM_VARG
        }
        -> MSG_exp_incomplete {
            RET_ERR(1) "incomplete datatype " EM_VARG " in expression"
        }
        -> MSG_ret_value_in_void_fun {
            RET_ERR(1) "found " EM_CSTR("return") " value in function " EM_VARG " returning type " EM_CSTR("none")
        }
        -> MSG_no_ret_value_in_fun {
            RET_ERR(2) "found " EM_CSTR("return") " with no value in function " EM_VARG " returning type " EM_VARG
        }
        -> MSG_invalid_if {
            RET_ERR(1) "cannot use " EM_CSTR("if") " statement with condition expression type " EM_VARG
        }
        -> MSG_invalid_while {
            RET_ERR(1) "cannot use " EM_CSTR("loop while") " statement with condition expression type " EM_VARG
        }
        -> MSG_invalid_do_while {
            RET_ERR(1) "cannot use " EM_CSTR("loop .. while") " statement with post-condition expression type " EM_VARG
        }
        -> MSG_invalid_for {
            RET_ERR(1) "cannot use " EM_CSTR("loop") " statement with " EM_CSTR("while") " condition expression type " EM_VARG
        }
        -> MSG_invalid_switch {
            RET_ERR(1) "cannot use " EM_CSTR("match") " statement with match expression type " EM_VARG ", requires an integer type"
        }
        -> MSG_duplicate_case_value {
            RET_ERR(1) "found duplicate " EM_CSTR("->") " value " EM_VARG " in " EM_CSTR("match") " statement"
        }
        -> MSG_string_init_not_char_arr {
            RET_ERR(1) "non-character array type " EM_VARG " initialized from string constant"
        }
        -> MSG_string_init_overflow {
            RET_ERR(2) "size " EM_VARG " string constant initialized with " EM_VARG " characters"
        }
        -> MSG_arr_init_overflow {
            RET_ERR(3) "size " EM_VARG " array type " EM_VARG " initialized with " EM_VARG " initializers"
        }
        -> MSG_struct_init_overflow {
            RET_ERR(3) "datatype " EM_VARG " initialized with " EM_VARG " members instead of " EM_VARG
        }
        -> MSG_ret_arr {
            RET_ERR(2) "function " EM_VARG " returns array type " EM_VARG ", instead of pointer type"
        }
        -> MSG_ret_incomplete {
            RET_ERR(2) "function " EM_VARG " returns incomplete datatype " EM_VARG
        }
        -> MSG_void_param {
            RET_ERR(2) "function " EM_VARG " declared with parameter " EM_VARG " with type " EM_CSTR("none")
        }
        -> MSG_incomplete_param {
            RET_ERR(3) "function " EM_VARG " defined with parameter " EM_VARG " with incomplete datatype " EM_VARG
        }
        -> MSG_redecl_fun_conflict {
            RET_ERR(3) "function " EM_VARG " redeclared with function type " EM_VARG ", but previous declaration has function type " EM_VARG
        }
        -> MSG_redef_fun {
            RET_ERR(2) "function " EM_VARG " already defined with function type " EM_VARG
        }
        -> MSG_redecl_static_conflict {
            RET_ERR(1) "function " EM_VARG " with " EM_CSTR("data") " storage class already declared non-static"
        }
        -> MSG_static_ptr_init_not_int {
            RET_ERR(2) "cannot statically initialize pointer type " EM_VARG " from constant " EM_VARG ", requires a constant integer"
        }
        -> MSG_static_ptr_init_not_null {
            RET_ERR(2) "cannot statically initialize pointer type " EM_VARG " from non-zero value " EM_VARG
        }
        -> MSG_agg_init_with_single {
            RET_ERR(1) "aggregate type " EM_VARG " statically initialized with single initializer"
        }
        -> MSG_static_ptr_init_string {
            RET_ERR(1) "non-character pointer type " EM_VARG " statically initialized from string constant"
        }
        -> MSG_static_init_not_const {
            RET_ERR(1) "cannot statically initialize variable from non-constant type " EM_VARG ", requires a constant"
        }
        -> MSG_scalar_init_with_compound {
            RET_ERR(1) "cannot initialize scalar type " EM_VARG " with compound initializer"
        }
        -> MSG_void_var_decl {
            RET_ERR(1) "variable " EM_VARG " declared with type " EM_CSTR("none")
        }
        -> MSG_incomplete_var_decl {
            RET_ERR(2) "variable " EM_VARG " declared with incomplete datatype " EM_VARG
        }
        -> MSG_redecl_var_conflict {
            RET_ERR(3) "variable " EM_VARG " redeclared with conflicting type " EM_VARG ", but previously declared with type " EM_VARG
        }
        -> MSG_redecl_var_storage {
            RET_ERR(1) "variable " EM_VARG " redeclared with conflicting storage class"
        }
        -> MSG_redef_extern_var {
            RET_ERR(1) "illegal initializer, can only declare variable " EM_VARG " with " EM_CSTR("extrn") " storage class"
        }
        -> MSG_duplicate_member_decl {
            RET_ERR(2) "datatype " EM_VARG " declared with duplicate member name " EM_VARG
        }
        -> MSG_incomplete_member_decl {
            RET_ERR(3) "datatype " EM_VARG " declared with member " EM_VARG " with incomplete type " EM_VARG
        }
        -> MSG_redecl_struct_in_scope {
            RET_ERR(1) "datatype " EM_VARG " already declared in this scope"
        }
        -> MSG_case_out_of_switch {
            RET_ERR(0) "found " EM_CSTR("->") " statement outside of " EM_CSTR("match")
        }
        -> MSG_default_out_of_switch {
            RET_ERR(0) "found " EM_CSTR("otherwise") " statement outside of " EM_CSTR("match")
        }
        -> MSG_multiple_default {
            RET_ERR(0) "found more than one " EM_CSTR("otherwise") " statement in " EM_CSTR("match")
        }
        -> MSG_break_out_of_loop {
            RET_ERR(0) "found " EM_CSTR("break") " statement outside of " EM_CSTR("loop") " or " EM_CSTR("match")
        }
        -> MSG_continue_out_of_loop {
            RET_ERR(0) "found " EM_CSTR("continue") " statement outside of " EM_CSTR("loop")
        }
        -> MSG_undef_goto_target {
            RET_ERR(2) "found " EM_CSTR("jump") " statement, but " EM_CSTR("label") " with target " EM_VARG " not defined in function " EM_VARG
        }
        -> MSG_redecl_struct_conflict {
            RET_ERR(2) EM_VARG " conflicts with datatype " EM_VARG " previously declared or defined in this scope"
        }
        -> MSG_undef_struct_in_scope {
            RET_ERR(1) "datatype " EM_VARG " not defined in this scope"
        }
        -> MSG_undecl_var_in_scope {
            RET_ERR(1) "variable " EM_VARG " not declared in this scope"
        }
        -> MSG_undecl_fun_in_scope {
            RET_ERR(1) "function " EM_VARG " not declared in this scope"
        }
        -> MSG_for_init_decl_not_auto {
            RET_ERR(2) "variable " EM_VARG " declared with " EM_VARG " storage class in " EM_CSTR("loop") " initialization"
        }
        -> MSG_redef_label_in_scope {
            RET_ERR(1) EM_CSTR("label") " with target " EM_VARG " already defined in this scope"
        }
        -> MSG_redecl_var_in_scope {
            RET_ERR(1) "variable " EM_VARG " already declared in this scope"
        }
        -> MSG_def_nested_fun {
            RET_ERR(1) "function " EM_VARG " defined inside another function, but nested function definition are not permitted"
        }
        -> MSG_decl_nested_static_fun {
            RET_ERR(1) "cannot declare nested function " EM_VARG " in another function with " EM_CSTR("data") " storage class"
        }
        -> MSG_redecl_fun_in_scope {
            RET_ERR(1) "function " EM_VARG " already declared in this scope"
        }
        otherwise {
            THROW_ABORT
        }
    }
}
