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
        if name_fmt[][i] == UID_SEPARATOR[0] {
            str_substr(name_fmt[], 0, i - 1)
            break
        }
    }
    return name_fmt[]
}

pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: bool, struct_fmt: *string_t) string {
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

m4_define(`ARG_INDEX', `m4_define(`_argi', `$1')`'')m4_dnl
m4_define(`ARG_SHIFT', `ARG_INDEX(m4_incr(_argi))m4_dnl
"", arg`'_argi, ""')m4_dnl
m4_define(`EM_CSTR', `"‘" $1 "’"')m4_dnl
m4_define(`FMT_ERR_0', `fmt3')m4_dnl
m4_define(`FMT_ERR_1', `fmt5')m4_dnl
m4_define(`FMT_ERR_2', `fmt7')m4_dnl
m4_define(`FMT_ERR_3', `fmt9')m4_dnl
m4_define(`MSG_ARG', `EM_CSTR(`ARG_SHIFT')`'')m4_dnl
m4_define(`MSG_ENO', `"(no. ", ltostr(_no, msg), ") "')m4_dnl
m4_define(`RET_ERR', `ARG_INDEX(0)m4_dnl
    _no: [20]char = $(nil)
    return FMT_ERR_$1')m4_dnl

pub fn get_fatal_msg(msg: MESSAGE_FATAL, arg1: string, arg2: string, arg3: string) string {
    if msg == MSG_unsupported_os {
        RET_ERR(1) (MSG_ENO MSG_ARG " operating system is not supported, requires " EM_CSTR("GNU/Linux") " (x86_64) or "
            EM_CSTR("MacOS"))
    }
    else {
        THROW_ABORT
    }
}

pub fn get_arg_msg(msg: MESSAGE_ARG, arg1: string, arg2: string, arg3: string) string {
    match msg {
        -> MSG_print_help {
            RET_ERR(1) (MSG_ENO "Usage: " ARG_SHIFT
                " [--help] Debug OptimL1 OptimL2 FILE StdlibDir SourceDir [IncludeDir...]\n"
                "    [--help]:         print help and exit\n"
                "    Debug:            print debug info (0..1|251..255)\n"
                "    OptimL1:          optimization level 1 mask (0..15)\n"
                "    OptimL2:          optimization level 2 enum (0..2)\n"
                "    FILE:             source file to compile\n"
                "    StdlibDir:        standard lib include path\n"
                "    SourceDir:        source file include path\n"
                "    [IncludeDir...]:  add a list of paths to include path\n"
                "see " EM_CSTR("driver.sh"))
        }
        -> MSG_no_debug_arg {
            RET_ERR(0) (MSG_ENO "no debug code passed in first argument, see " EM_CSTR("--help"))
        }
        -> MSG_invalid_debug_arg {
            RET_ERR(1) (MSG_ENO "invalid debug code " MSG_ARG " passed in first argument, see " EM_CSTR("--help"))
        }
        -> MSG_no_optim_1_arg {
            RET_ERR(0) (MSG_ENO "no level 1 optimization mask passed in second argument, see " EM_CSTR("--help"))
        }
        -> MSG_invalid_optim_1_arg {
            RET_ERR(1) (MSG_ENO "invalid level 1 optimization mask " MSG_ARG " passed in second argument, see "
                EM_CSTR("--help"))
        }
        -> MSG_no_optim_2_arg {
            RET_ERR(0) (MSG_ENO "no level 2 optimization code passed in third argument, see " EM_CSTR("--help"))
        }
        -> MSG_invalid_optim_2_arg {
            RET_ERR(1) (MSG_ENO "invalid level 2 optimization code " MSG_ARG " passed in third argument, see "
                EM_CSTR("--help"))
        }
        -> MSG_no_input_files_arg {
            RET_ERR(0) (MSG_ENO "no input file passed in fourth argument, see " EM_CSTR("--help"))
        }
        -> MSG_no_stdlib_dir_arg {
            RET_ERR(0) (MSG_ENO "no standard lib directory passed in fifth argument, see " EM_CSTR("--help"))
        }
        -> MSG_no_include_dir_arg {
            RET_ERR(0) (MSG_ENO "no include directories passed in sixth argument, see " EM_CSTR("--help"))
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_util_msg(msg: MESSAGE_UTIL, arg1: string, arg2: string, arg3: string) string {
    match msg {
        -> MSG_failed_fread {
            RET_ERR(1) (MSG_ENO "cannot read input file " MSG_ARG)
        }
        -> MSG_failed_fwrite {
            RET_ERR(1) (MSG_ENO "cannot write output file " MSG_ARG)
        }
        -> MSG_failed_strtoi {
            RET_ERR(1) (MSG_ENO "cannot interpret string " MSG_ARG " to an integer value")
        }
        -> MSG_failed_strtou {
            RET_ERR(1) (MSG_ENO "cannot interpret string " MSG_ARG " to an unsigned integer value")
        }
        -> MSG_failed_strtod {
            RET_ERR(1) (MSG_ENO "cannot interpret string " MSG_ARG " to a floating point value")
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_lexer_msg(msg: MESSAGE_LEXER, arg1: string, arg2: string, arg3: string) string {
    match msg {
        -> MSG_invalid_tok {
            RET_ERR(1) (MSG_ENO "found invalid token " MSG_ARG)
        }
        -> MSG_failed_import {
            RET_ERR(1) (MSG_ENO "cannot find " MSG_ARG " header file in " EM_CSTR("import") " directive search")
        }
        -> MSG_failed_use {
            RET_ERR(1) (MSG_ENO "cannot find " MSG_ARG " header file in " EM_CSTR("use") " directive search")
        }
        -> MSG_import_in_line {
            RET_ERR(1) (MSG_ENO "cannot search " MSG_ARG " in a line, " EM_CSTR("import") " requires its own line")
        }
        -> MSG_use_in_line {
            RET_ERR(1) (MSG_ENO "cannot search " MSG_ARG " in a line, " EM_CSTR("use") " requires its own line")
        }
        -> MSG_preproc_macro {
            RET_ERR(1) (MSG_ENO "found m4 macro " MSG_ARG ", preprocess with " EM_CSTR("-E") " or see "
                EM_CSTR("--help"))
        }
        -> MSG_unmatched_close {
            RET_ERR(1) (MSG_ENO "found unmatched bracket " MSG_ARG)
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_parser_msg(msg: MESSAGE_PARSER, arg1: string, arg2: string, arg3: string) string {
    match msg {
        -> MSG_unexpected_next_tok {
            RET_ERR(2) (MSG_ENO "found token " MSG_ARG ", but expected " MSG_ARG " next")
        }
        -> MSG_reached_eof {
            RET_ERR(0) (MSG_ENO "reached end of file, but expected declaration or statement next")
        }
        -> MSG_overflow_long_const {
            RET_ERR(1) (MSG_ENO "cannot represent " MSG_ARG " as a 64 bits signed integer constant, very large number")
        }
        -> MSG_overflow_ulong_const {
            RET_ERR(1) (MSG_ENO "cannot represent " MSG_ARG
                " as a 64 bits unsigned integer constant, very large number")
        }
        -> MSG_expect_unop {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected unary operator " EM_CSTR("~") ", " EM_CSTR("-")
                " or " EM_CSTR("not") " next")
        }
        -> MSG_expect_binop {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected binary operator " EM_CSTR("=") ", " EM_CSTR("+")
                ", " EM_CSTR("+=") ", " EM_CSTR("-") ", " EM_CSTR("-=") ", " EM_CSTR("*") ", " EM_CSTR("*=") ", "
                EM_CSTR("/") ", " EM_CSTR("/=") ", " EM_CSTR("%") ", " EM_CSTR("%=") ", " EM_CSTR("&") ", "
                EM_CSTR("&=") ", " EM_CSTR("|") ", " EM_CSTR("|=") ", " EM_CSTR("^") ", " EM_CSTR("^=") ", "
                EM_CSTR("<<") ", " EM_CSTR("<<=") ", " EM_CSTR(">>") ", " EM_CSTR(">>=") ", " EM_CSTR("and") ", "
                EM_CSTR("or") ", " EM_CSTR("==") ", " EM_CSTR("~=") ", " EM_CSTR("<") ", " EM_CSTR("<=") ", "
                EM_CSTR(">") " or " EM_CSTR(">=") " next")
        }
        -> MSG_expect_data_specifier {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected datatype specifier " EM_CSTR("struc") " or "
                EM_CSTR("union") " next")
        }
        -> MSG_expect_specifier {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected type specifier " EM_CSTR("char") ", "
                EM_CSTR("string") ", " EM_CSTR("bool") ", " EM_CSTR("i32") ", " EM_CSTR("i64") ", " EM_CSTR("i8") ", "
                EM_CSTR("f64") ", " EM_CSTR("u32") ", " EM_CSTR("u64") ", " EM_CSTR("u8") ", " EM_CSTR("struc") ", "
                EM_CSTR("union") ", " EM_CSTR("*") ", " EM_CSTR("*any") " or " EM_CSTR("[") " next")
        }
        -> MSG_expect_maybe_type {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected maybe type specifier " EM_CSTR("none") ", "
                EM_CSTR("char") ", " EM_CSTR("string") ", " EM_CSTR("bool") ", " EM_CSTR("i32") ", " EM_CSTR("i64") ", "
                EM_CSTR("i8") ", " EM_CSTR("f64") ", " EM_CSTR("u32") ", " EM_CSTR("u64") ", " EM_CSTR("u8") ", "
                EM_CSTR("struc") ", " EM_CSTR("union") ", " EM_CSTR("*") ", " EM_CSTR("*any") " or " EM_CSTR("[")
                " next")
        }
        -> MSG_expect_open_sizeof {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected sizeof " EM_CSTR("<") " or " EM_CSTR(`"("')
                " next")
        }
        -> MSG_expect_expression {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected expression " EM_CSTR("?") ", " EM_CSTR("~") ", "
                EM_CSTR("-") ", " EM_CSTR("not") ", " EM_CSTR("++") ", " EM_CSTR("--") ", " EM_CSTR("@") ", "
                EM_CSTR("sizeof") ", " EM_CSTR("cast") ", " EM_CSTR("identifier") ", " EM_CSTR("identifier" `"("') ", "
                EM_CSTR(`"("') ", " EM_CSTR("const string") ", " EM_CSTR("const char") ", " EM_CSTR("const i32") ", "
                EM_CSTR("const i64") ", " EM_CSTR("const u32") ", " EM_CSTR("const u64") ", " EM_CSTR("const f64") ", "
                EM_CSTR("true") ", " EM_CSTR("false") " or " EM_CSTR("nil") " next")
        }
        -> MSG_expect_assign {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected assignment " EM_CSTR("=") " or " EM_CSTR(";")
                " next")
        }
        -> MSG_expect_datatype {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected member list " EM_CSTR(`"("') " or " EM_CSTR(";")
                " next")
        }
        -> MSG_expect_block {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected block " EM_CSTR("{") " or " EM_CSTR(";") " next")
        }
        -> MSG_expect_declaration {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected declaration " EM_CSTR("identifier") ", "
                EM_CSTR("fn") " or " EM_CSTR("type") " next")
        }
        -> MSG_expect_storage_class {
            RET_ERR(1) (MSG_ENO "found token " MSG_ARG ", but expected storage class " EM_CSTR("pub") ", "
                EM_CSTR("data") ", " EM_CSTR("extrn") ", " EM_CSTR("identifier") ", " EM_CSTR("fn") " or "
                EM_CSTR("type") " next")
        }
        -> MSG_incomplete_any {
            RET_ERR(0) (MSG_ENO "incomplete type " EM_CSTR("any") " requires a pointer, or use " EM_CSTR("none")
                " instead")
        }
        -> MSG_arr_size_not_int_const {
            RET_ERR(1) (MSG_ENO "illegal array size " MSG_ARG ", requires a constant integer")
        }
        -> MSG_case_value_not_int_const {
            RET_ERR(1) (MSG_ENO "illegal " EM_CSTR("->") " value " MSG_ARG ", requires a constant integer")
        }
        -> MSG_empty_block {
            RET_ERR(0) (MSG_ENO "empty block requires at least one item, or use " EM_CSTR(";") " instead")
        }
        -> MSG_empty_compound_init {
            RET_ERR(0) (MSG_ENO "empty compound initializer requires at least one initializer")
        }
        -> MSG_infinite_loop {
            RET_ERR(0) (MSG_ENO "cannot exit " EM_CSTR("loop") ", infinite loop requires at least one statement")
        }
        -> MSG_loop_decl_not_auto {
            RET_ERR(1) (MSG_ENO "illegal storage " MSG_ARG ", cannot use storage class in " EM_CSTR("loop")
                " initialization")
        }
        -> MSG_list_decl_not_auto {
            RET_ERR(1) (MSG_ENO "illegal storage " MSG_ARG ", cannot use storage class in list declaration")
        }
        -> MSG_type_decl_not_auto {
            RET_ERR(1) (MSG_ENO "illegal storage " MSG_ARG ", cannot use storage class in type declaration")
        }
        -> MSG_pub_in_block {
            RET_ERR(0) (MSG_ENO "illegal storage class, cannot use " EM_CSTR("pub") " declaration in block")
        }
        -> MSG_data_at_toplvl {
            RET_ERR(0) (MSG_ENO "illegal storage class, cannot use " EM_CSTR("data") " declaration at top level")
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn get_semantic_msg(msg: MESSAGE_SEMANTIC, arg1: string, arg2: string, arg3: string) string {
    match msg {
        -> MSG_incomplete_arr {
            RET_ERR(2) (MSG_ENO "array type " MSG_ARG " of incomplete type " MSG_ARG ", requires a complete type")
        }
        -> MSG_joint_ptr_mismatch {
            RET_ERR(2) (MSG_ENO "pointer type mismatch " MSG_ARG " and " MSG_ARG " in operator")
        }
        -> MSG_fun_used_as_var {
            RET_ERR(1) (MSG_ENO "function " MSG_ARG " used as a variable")
        }
        -> MSG_illegal_cast {
            RET_ERR(2) (MSG_ENO "illegal cast, cannot convert expression from type " MSG_ARG " to " MSG_ARG)
        }
        -> MSG_invalid_unary_op {
            RET_ERR(2) (MSG_ENO "cannot apply unary operator " MSG_ARG " on operand type " MSG_ARG)
        }
        -> MSG_invalid_binary_op {
            RET_ERR(2) (MSG_ENO "cannot apply binary operator " MSG_ARG " on operand type " MSG_ARG)
        }
        -> MSG_invalid_binary_ops {
            RET_ERR(3) (MSG_ENO "cannot apply binary operator " MSG_ARG " on operand types " MSG_ARG " and " MSG_ARG)
        }
        -> MSG_assign_to_void {
            RET_ERR(0) (MSG_ENO "cannot assign " EM_CSTR("=") " to left operand type " EM_CSTR("none"))
        }
        -> MSG_assign_to_rvalue {
            RET_ERR(1) (MSG_ENO "assignment " MSG_ARG " requires lvalue left operand, but got rvalue")
        }
        -> MSG_invalid_condition {
            RET_ERR(1) (MSG_ENO "cannot apply conditional " EM_CSTR("then") " on condition operand type " MSG_ARG)
        }
        -> MSG_invalid_ternary_op {
            RET_ERR(2) (MSG_ENO "cannot apply ternary operator " EM_CSTR("else") " on operand types " MSG_ARG " and "
                MSG_ARG)
        }
        -> MSG_var_used_as_fun {
            RET_ERR(1) (MSG_ENO "variable " MSG_ARG " used as a function")
        }
        -> MSG_call_with_wrong_argc {
            RET_ERR(3) (MSG_ENO "function " MSG_ARG " called with " MSG_ARG " arguments instead of " MSG_ARG)
        }
        -> MSG_deref_not_ptr {
            RET_ERR(1) (MSG_ENO "cannot apply dereference operator " EM_CSTR("[]") " on non-pointer type " MSG_ARG)
        }
        -> MSG_addrof_rvalue {
            RET_ERR(0) (MSG_ENO "addresssing " EM_CSTR("@") " requires lvalue operand, but got rvalue")
        }
        -> MSG_invalid_subscript {
            RET_ERR(2) (MSG_ENO "cannot subscript array with operand types " MSG_ARG " and " MSG_ARG
                ", requires a complete pointer and an integer types")
        }
        -> MSG_sizeof_incomplete {
            RET_ERR(1) (MSG_ENO "cannot get size with " EM_CSTR("sizeof") " operator on incomplete type " MSG_ARG)
        }
        -> MSG_dot_not_struct {
            RET_ERR(2) (MSG_ENO "cannot access datatype member " MSG_ARG " with dot operator " EM_CSTR(".")
                " on non-datatype " MSG_ARG)
        }
        -> MSG_member_not_in_struct {
            RET_ERR(2) (MSG_ENO "datatype " MSG_ARG " has no member named " MSG_ARG)
        }
        -> MSG_arrow_not_struct_ptr {
            RET_ERR(2) (MSG_ENO "cannot access datatype member " MSG_ARG " with dereferenced dot operator "
                EM_CSTR("[].") " on non-pointer-to-datatype " MSG_ARG)
        }
        -> MSG_arrow_incomplete {
            RET_ERR(2) (MSG_ENO "cannot access datatype member " MSG_ARG " with dereferenced dot operator "
                EM_CSTR("[].") " on incomplete datatype " MSG_ARG)
        }
        -> MSG_exp_incomplete {
            RET_ERR(1) (MSG_ENO "incomplete datatype " MSG_ARG " in expression")
        }
        -> MSG_ret_value_in_void_fun {
            RET_ERR(1) (MSG_ENO "found " EM_CSTR("return") " value in function " MSG_ARG " returning type "
                EM_CSTR("none"))
        }
        -> MSG_no_ret_value_in_fun {
            RET_ERR(2) (MSG_ENO "found " EM_CSTR("return") " with no value in function " MSG_ARG " returning type "
                MSG_ARG)
        }
        -> MSG_invalid_if {
            RET_ERR(1) (MSG_ENO "cannot use " EM_CSTR("if") " statement with condition expression type " MSG_ARG)
        }
        -> MSG_invalid_while {
            RET_ERR(1) (MSG_ENO "cannot use " EM_CSTR("loop while") " statement with condition expression type "
                MSG_ARG)
        }
        -> MSG_invalid_do_while {
            RET_ERR(1) (MSG_ENO "cannot use " EM_CSTR("loop .. while") " statement with post-condition expression type "
                MSG_ARG)
        }
        -> MSG_invalid_for {
            RET_ERR(1) (MSG_ENO "cannot use " EM_CSTR("loop") " statement with " EM_CSTR("while")
                " condition expression type " MSG_ARG)
        }
        -> MSG_invalid_switch {
            RET_ERR(1) (MSG_ENO "cannot use " EM_CSTR("match") " statement with match expression type " MSG_ARG
                ", requires an integer type")
        }
        -> MSG_duplicate_case_value {
            RET_ERR(1) (MSG_ENO "found duplicate " EM_CSTR("->") " value " MSG_ARG " in " EM_CSTR("match") " statement")
        }
        -> MSG_string_init_not_char_arr {
            RET_ERR(1) (MSG_ENO "non-character array type " MSG_ARG " initialized from string constant")
        }
        -> MSG_string_init_overflow {
            RET_ERR(2) (MSG_ENO "size " MSG_ARG " string constant initialized with " MSG_ARG " characters")
        }
        -> MSG_arr_init_overflow {
            RET_ERR(3) (MSG_ENO "size " MSG_ARG " array type " MSG_ARG " initialized with " MSG_ARG " initializers")
        }
        -> MSG_struct_init_overflow {
            RET_ERR(3) (MSG_ENO "datatype " MSG_ARG " initialized with " MSG_ARG " members instead of " MSG_ARG)
        }
        -> MSG_ret_arr {
            RET_ERR(2) (MSG_ENO "function " MSG_ARG " returns array type " MSG_ARG ", instead of pointer type")
        }
        -> MSG_ret_incomplete {
            RET_ERR(2) (MSG_ENO "function " MSG_ARG " returns incomplete datatype " MSG_ARG)
        }
        -> MSG_void_param {
            RET_ERR(2) (MSG_ENO "function " MSG_ARG " declared with parameter " MSG_ARG " with type " EM_CSTR("none"))
        }
        -> MSG_incomplete_param {
            RET_ERR(3) (MSG_ENO "function " MSG_ARG " defined with parameter " MSG_ARG " with incomplete datatype "
                MSG_ARG)
        }
        -> MSG_redecl_fun_conflict {
            RET_ERR(3) (MSG_ENO "function " MSG_ARG " redeclared with function type " MSG_ARG
                ", but previous declaration has function type " MSG_ARG)
        }
        -> MSG_redef_fun {
            RET_ERR(2) (MSG_ENO "function " MSG_ARG " already defined with function type " MSG_ARG)
        }
        -> MSG_redecl_static_conflict {
            RET_ERR(1) (MSG_ENO "function " MSG_ARG " with " EM_CSTR("data")
                " storage class already declared non-static")
        }
        -> MSG_static_ptr_init_not_int {
            RET_ERR(2) (MSG_ENO "cannot statically initialize pointer type " MSG_ARG " from constant " MSG_ARG
                ", requires a constant integer")
        }
        -> MSG_static_ptr_init_not_null {
            RET_ERR(2) (MSG_ENO "cannot statically initialize pointer type " MSG_ARG " from non-zero value " MSG_ARG)
        }
        -> MSG_agg_init_with_single {
            RET_ERR(1) (MSG_ENO "aggregate type " MSG_ARG " statically initialized with single initializer")
        }
        -> MSG_static_ptr_init_string {
            RET_ERR(1) (MSG_ENO "non-character pointer type " MSG_ARG " statically initialized from string constant")
        }
        -> MSG_static_init_not_const {
            RET_ERR(1) (MSG_ENO "cannot statically initialize variable from non-constant type " MSG_ARG
                ", requires a constant")
        }
        -> MSG_scalar_init_with_compound {
            RET_ERR(1) (MSG_ENO "cannot initialize scalar type " MSG_ARG " with compound initializer")
        }
        -> MSG_void_var_decl {
            RET_ERR(1) (MSG_ENO "variable " MSG_ARG " declared with type " EM_CSTR("none"))
        }
        -> MSG_incomplete_var_decl {
            RET_ERR(2) (MSG_ENO "variable " MSG_ARG " declared with incomplete datatype " MSG_ARG)
        }
        -> MSG_redecl_var_conflict {
            RET_ERR(3) (MSG_ENO "variable " MSG_ARG " redeclared with conflicting type " MSG_ARG
                ", but previously declared with type " MSG_ARG)
        }
        -> MSG_redecl_var_storage {
            RET_ERR(1) (MSG_ENO "variable " MSG_ARG " redeclared with conflicting storage class")
        }
        -> MSG_redef_extern_var {
            RET_ERR(1) (MSG_ENO "illegal initializer, can only declare variable " MSG_ARG " with " EM_CSTR("extrn")
                " storage class")
        }
        -> MSG_duplicate_member_decl {
            RET_ERR(2) (MSG_ENO "datatype " MSG_ARG " declared with duplicate member name " MSG_ARG)
        }
        -> MSG_incomplete_member_decl {
            RET_ERR(3) (MSG_ENO "datatype " MSG_ARG " declared with member " MSG_ARG " with incomplete type " MSG_ARG)
        }
        -> MSG_redecl_struct_in_scope {
            RET_ERR(1) (MSG_ENO "datatype " MSG_ARG " already declared in this scope")
        }
        -> MSG_case_out_of_switch {
            RET_ERR(0) (MSG_ENO "found " EM_CSTR("->") " statement outside of " EM_CSTR("match"))
        }
        -> MSG_default_out_of_switch {
            RET_ERR(0) (MSG_ENO "found " EM_CSTR("otherwise") " statement outside of " EM_CSTR("match"))
        }
        -> MSG_multiple_default {
            RET_ERR(0) (MSG_ENO "found more than one " EM_CSTR("otherwise") " statement in " EM_CSTR("match"))
        }
        -> MSG_break_out_of_loop {
            RET_ERR(0) (MSG_ENO "found " EM_CSTR("break") " statement outside of " EM_CSTR("loop") " or "
                EM_CSTR("match"))
        }
        -> MSG_continue_out_of_loop {
            RET_ERR(0) (MSG_ENO "found " EM_CSTR("continue") " statement outside of " EM_CSTR("loop"))
        }
        -> MSG_undef_goto_target {
            RET_ERR(2) (MSG_ENO "found " EM_CSTR("jump") " statement, but " EM_CSTR("label") " with target " MSG_ARG
                " not defined in function " MSG_ARG)
        }
        -> MSG_redecl_struct_conflict {
            RET_ERR(2) (MSG_ENO MSG_ARG " conflicts with datatype " MSG_ARG
                " previously declared or defined in this scope")
        }
        -> MSG_undef_struct_in_scope {
            RET_ERR(1) (MSG_ENO "datatype " MSG_ARG " not defined in this scope")
        }
        -> MSG_undecl_var_in_scope {
            RET_ERR(1) (MSG_ENO "variable " MSG_ARG " not declared in this scope")
        }
        -> MSG_undecl_fun_in_scope {
            RET_ERR(1) (MSG_ENO "function " MSG_ARG " not declared in this scope")
        }
        -> MSG_for_init_decl_not_auto {
            RET_ERR(2) (MSG_ENO "variable " MSG_ARG " declared with " MSG_ARG " storage class in " EM_CSTR("loop")
                " initialization")
        }
        -> MSG_redef_label_in_scope {
            RET_ERR(1) (MSG_ENO EM_CSTR("label") " with target " MSG_ARG " already defined in this scope")
        }
        -> MSG_redecl_var_in_scope {
            RET_ERR(1) (MSG_ENO "variable " MSG_ARG " already declared in this scope")
        }
        -> MSG_def_nested_fun {
            RET_ERR(1) (MSG_ENO "function " MSG_ARG
                " defined inside another function, but nested function definition are not permitted")
        }
        -> MSG_decl_nested_static_fun {
            RET_ERR(1) (MSG_ENO "cannot declare nested function " MSG_ARG " in another function with " EM_CSTR("data")
                " storage class")
        }
        -> MSG_redecl_fun_in_scope {
            RET_ERR(1) (MSG_ENO "function " MSG_ARG " already declared in this scope")
        }
        otherwise {
            THROW_ABORT
        }
    }
}
