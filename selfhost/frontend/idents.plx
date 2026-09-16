m4_include(`idents.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl






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



m4_define(`Ctx', `TODO')m4_dnl

pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((target))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name {
        "@MACRO@:str_copy(value, name)"
        if name {
            "@MACRO@:str_delete(name)"
            sdsfree(name)
            name = ? nil then sdsnew(nil) else nil
        }
        name = sdsdup(value)
    }
    return make_label_identifier(ctx, @name)
}

pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((variable))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name {
        "@MACRO@:str_copy(value, name)"
        if name {
            "@MACRO@:str_delete(name)"
            sdsfree(name)
            name = ? nil then sdsnew(nil) else nil
        }
        name = sdsdup(value)
    }
    return make_var_identifier(ctx, @name)
}

pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((structure))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name {
        "@MACRO@:str_copy(value, name)"
        if name {
            "@MACRO@:str_delete(name)"
            sdsfree(name)
            name = ? nil then sdsnew(nil) else nil
        }
        name = sdsdup(value)
    }
    return make_struct_identifier(ctx, @name)
}

pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match label_kind {
        -> LBL_Land_false {
            name = ? "and_false" then sdsnew("and_false") else nil
            break
        }
        -> LBL_Land_true {
            name = ? "and_true" then sdsnew("and_true") else nil
            break
        }
        -> LBL_Ldo_while {
            name = ? "do_while" then sdsnew("do_while") else nil
            break
        }
        -> LBL_Ldo_while_start {
            name = ? "do_while_start" then sdsnew("do_while_start") else nil
            break
        }
        -> LBL_Lfor {
            name = ? "for" then sdsnew("for") else nil
            break
        }
        -> LBL_Lswitch {
            name = ? "switch" then sdsnew("switch") else nil
            break
        }
        -> LBL_Lfor_start {
            name = ? "for_start" then sdsnew("for_start") else nil
            break
        }
        -> LBL_Lif_else {
            name = ? "if_else" then sdsnew("if_else") else nil
            break
        }
        -> LBL_Lif_false {
            name = ? "if_false" then sdsnew("if_false") else nil
            break
        }
        -> LBL_Lor_false {
            name = ? "or_false" then sdsnew("or_false") else nil
            break
        }
        -> LBL_Lor_true {
            name = ? "or_true" then sdsnew("or_true") else nil
            break
        }
        -> LBL_Lstring {
            name = ? "string" then sdsnew("string") else nil
            break
        }
        -> LBL_Lternary_else {
            name = ? "ternary_else" then sdsnew("ternary_else") else nil
            break
        }
        -> LBL_Lternary_false {
            name = ? "ternary_false" then sdsnew("ternary_false") else nil
            break
        }
        -> LBL_Lwhile {
            name = ? "while" then sdsnew("while") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_label_identifier(ctx, @name)
}

pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match label_kind {
        -> LBL_Lbreak {
            name = ? "break_" then sdsnew("break_") else nil
            break
        }
        -> LBL_Lcase {
            name = ? "case_" then sdsnew("case_") else nil
            break
        }
        -> LBL_Lcontinue {
            name = ? "continue_" then sdsnew("continue_") else nil
            break
        }
        -> LBL_Ldefault {
            name = ? "default_" then sdsnew("default_") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:str_append(name, map_get(ctx->hash_table, target))"
        name = sdscat(name, ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((target))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value))
    }
    return make_string_identifier(ctx, @name)
}

pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64 {
    name: string = ? is_label then ? "case_" then sdsnew("case_") else nil else ? "" then sdsnew("") else nil
    {
        strto_i: string = ? (i) > 0 then sdsfromunsignedlong(cast<u64>((i))) else sdsfromlong(cast<i64>((i)))
        loop .. while 0 {
            "@MACRO@:str_append(name, strto_i)"
            name = sdscat(name, strto_i)
        }
        if strto_i {
            "@MACRO@:str_delete(strto_i)"
            sdsfree(strto_i)
            strto_i = ? nil then sdsnew(nil) else nil
        }
    }
    loop .. while 0 {
        "@MACRO@:str_append(name, map_get(ctx->hash_table, target))"
        name = sdscat(name, ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((target))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value))
    }
    return make_string_identifier(ctx, @name)
}

pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match node[].tag {
        -> AST_CConstant_t {
            name = ? "const" then sdsnew("const") else nil
            break
        }
        -> AST_CString_t {
            name = ? "string" then sdsnew("string") else nil
            break
        }
        -> AST_CVar_t {
            name = ? "var" then sdsnew("var") else nil
            break
        }
        -> AST_CCast_t {
            name = ? "cast" then sdsnew("cast") else nil
            break
        }
        -> AST_CUnary_t {
            name = ? "unop" then sdsnew("unop") else nil
            break
        }
        -> AST_CBinary_t {
            name = ? "binop" then sdsnew("binop") else nil
            break
        }
        -> AST_CAssignment_t {
            name = ? "assign" then sdsnew("assign") else nil
            break
        }
        -> AST_CConditional_t {
            name = ? "ternop" then sdsnew("ternop") else nil
            break
        }
        -> AST_CFunctionCall_t {
            name = ? "call" then sdsnew("call") else nil
            break
        }
        -> AST_CDereference_t {
            name = ? "deref" then sdsnew("deref") else nil
            break
        }
        -> AST_CAddrOf_t {
            name = ? "addr" then sdsnew("addr") else nil
            break
        }
        -> AST_CSubscript_t {
            name = ? "subscr" then sdsnew("subscr") else nil
            break
        }
        -> AST_CDot_t {
            name = ? "smem" then sdsnew("smem") else nil
            break
        }
        -> AST_CArrow_t {
            name = ? "sptr" then sdsnew("sptr") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_var_identifier(ctx, @name)
}
