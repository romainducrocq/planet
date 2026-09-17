m4_include(`errors.plx.m4')m4_dnl
m4_include(`lexer.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

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
        " #@MACRO@:str_copy(value, *name_fmt)"
        if name_fmt[] {
            " #@MACRO@:str_delete(*name_fmt)"
            sdsfree(name_fmt[])
            name_fmt[] = ? nil then sdsnew(nil) else nil
        }
        name_fmt[] = sdsdup(value)
    }
    loop i: u64 = sdslen(name_fmt[]) while i-- > 0 {
        if (name_fmt[])[i] == "."[0] {
            loop .. while 0 {
                " #@MACRO@:str_substr(*name_fmt, 0, i - 1)"
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
            " #@MACRO@:str_append(*struct_fmt, get_name_fmt(ctx, name, &name_fmt))"
            struct_fmt[] = sdscat(struct_fmt[], get_name_fmt(ctx, name, @name_fmt))
        }
        if name_fmt {
            " #@MACRO@:str_delete(name_fmt)"
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
            " #@MACRO@:str_append(*fun_fmt, \"none\")"
            fun_fmt[] = sdscat(fun_fmt[], "none")
        }
    }
    else {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            " #@MACRO@:str_append(*fun_fmt, get_type_fmt(ctx, fun_type->param_types[0], &type_fmt))"
            fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[0], @type_fmt))
        }
        if type_fmt {
            " #@MACRO@:str_delete(type_fmt)"
            sdsfree(type_fmt)
            type_fmt = ? nil then sdsnew(nil) else nil
        }
    }
    loop i: u64 = 1 while i < (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            " #@MACRO@:str_append(*fun_fmt, \", \")"
            fun_fmt[] = sdscat(fun_fmt[], ", ")
        }
        {
            type_fmt: string = ? nil then sdsnew(nil) else nil
            loop .. while 0 {
                " #@MACRO@:str_append(*fun_fmt, get_type_fmt(ctx, fun_type->param_types[i], &type_fmt))"
                fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[i], @type_fmt))
            }
            if type_fmt {
                " #@MACRO@:str_delete(type_fmt)"
                sdsfree(type_fmt)
                type_fmt = ? nil then sdsnew(nil) else nil
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:str_append(*fun_fmt, \") -> \")"
        fun_fmt[] = sdscat(fun_fmt[], ") -> ")
    }
    {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            " #@MACRO@:str_append(*fun_fmt, get_type_fmt(ctx, fun_type->ret_type, &type_fmt))"
            fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].ret_type, @type_fmt))
        }
        if type_fmt {
            " #@MACRO@:str_delete(type_fmt)"
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
            " #@MACRO@:str_append(*ptr_fmt, \"*\")"
            ptr_fmt[] = sdscat(ptr_fmt[], "*")
        }
    }
    if ptr_type[].ref_type[].tag == AST_Void_t {
        loop .. while 0 {
            " #@MACRO@:str_append(*ptr_fmt, \"any\")"
            ptr_fmt[] = sdscat(ptr_fmt[], "any")
        }
    }
    else {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            " #@MACRO@:str_append(*ptr_fmt, get_type_fmt(ctx, ptr_type->ref_type, &type_fmt))"
            ptr_fmt[] = sdscat(ptr_fmt[], get_type_fmt(ctx, ptr_type[].ref_type, @type_fmt))
        }
        if type_fmt {
            " #@MACRO@:str_delete(type_fmt)"
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
            " #@MACRO@:str_append(*arr_fmt, strto_size)"
            arr_fmt[] = sdscat(arr_fmt[], strto_size)
        }
        if strto_size {
            " #@MACRO@:str_delete(strto_size)"
            sdsfree(strto_size)
            strto_size = ? nil then sdsnew(nil) else nil
        }
    }
    loop .. while 0 {
        " #@MACRO@:str_append(*arr_fmt, \"]\")"
        arr_fmt[] = sdscat(arr_fmt[], "]")
    }
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        loop .. while 0 {
            " #@MACRO@:str_append(*arr_fmt, \"[\")"
            arr_fmt[] = sdscat(arr_fmt[], "[")
        }
        {
            strto_size: string = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
            loop .. while 0 {
                " #@MACRO@:str_append(*arr_fmt, strto_size)"
                arr_fmt[] = sdscat(arr_fmt[], strto_size)
            }
            if strto_size {
                " #@MACRO@:str_delete(strto_size)"
                sdsfree(strto_size)
                strto_size = ? nil then sdsnew(nil) else nil
            }
        }
        loop .. while 0 {
            " #@MACRO@:str_append(*arr_fmt, \"]\")"
            arr_fmt[] = sdscat(arr_fmt[], "]")
        }
    }
    if arr_type[].elem_type[].tag == AST_Void_t {
        loop .. while 0 {
            " #@MACRO@:str_append(*arr_fmt, \"any\")"
            arr_fmt[] = sdscat(arr_fmt[], "any")
        }
    }
    else {
        type_fmt: string = ? nil then sdsnew(nil) else nil
        loop .. while 0 {
            " #@MACRO@:str_append(*arr_fmt, get_type_fmt(ctx, arr_type->elem_type, &type_fmt))"
            arr_fmt[] = sdscat(arr_fmt[], get_type_fmt(ctx, arr_type[].elem_type, @type_fmt))
        }
        if type_fmt {
            " #@MACRO@:str_delete(type_fmt)"
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
