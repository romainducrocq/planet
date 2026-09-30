m4_include(`idents.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl

m4_define(`Ctx', `TODO')m4_dnl

pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: u64) u64 {
    name: string = str_new(nil)
    value: string = map_get(ctx[].hash_table, target)
    str_copy(value, name)
    return make_label_identifier(ctx, @name)
}

pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64 {
    name: string = str_new(nil)
    value: string = map_get(ctx[].hash_table, variable)
    str_copy(value, name)
    return make_var_identifier(ctx, @name)
}

pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64 {
    name: string = str_new(nil)
    value: string = map_get(ctx[].hash_table, structure)
    str_copy(value, name)
    return make_struct_identifier(ctx, @name)
}

pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64 {
    name: string = str_new(nil)
    match label_kind {
        -> LBL_Land_false {
            name = str_new("and_false")
            break
        }
        -> LBL_Land_true {
            name = str_new("and_true")
            break
        }
        -> LBL_Ldo_while {
            name = str_new("do_while")
            break
        }
        -> LBL_Ldo_while_start {
            name = str_new("do_while_start")
            break
        }
        -> LBL_Lfor {
            name = str_new("for")
            break
        }
        -> LBL_Lswitch {
            name = str_new("switch")
            break
        }
        -> LBL_Lfor_start {
            name = str_new("for_start")
            break
        }
        -> LBL_Lif_else {
            name = str_new("if_else")
            break
        }
        -> LBL_Lif_false {
            name = str_new("if_false")
            break
        }
        -> LBL_Lor_false {
            name = str_new("or_false")
            break
        }
        -> LBL_Lor_true {
            name = str_new("or_true")
            break
        }
        -> LBL_Lstring {
            name = str_new("string")
            break
        }
        -> LBL_Lternary_else {
            name = str_new("ternary_else")
            break
        }
        -> LBL_Lternary_false {
            name = str_new("ternary_false")
            break
        }
        -> LBL_Lwhile {
            name = str_new("while")
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_label_identifier(ctx, @name)
}

pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64 {
    name: string = str_new(nil)
    match label_kind {
        -> LBL_Lbreak {
            name = str_new("break_")
            break
        }
        -> LBL_Lcase {
            name = str_new("case_")
            break
        }
        -> LBL_Lcontinue {
            name = str_new("continue_")
            break
        }
        -> LBL_Ldefault {
            name = str_new("default_")
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    str_append(name, map_get(ctx[].hash_table, target))
    return make_string_identifier(ctx, @name)
}

pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64 {
    name: string = ? is_label then str_new("case_") else str_new("")
    {
        strto_i: string = str_to_string(i)
        str_append(name, strto_i)
        str_delete(strto_i)
    }
    str_append(name, map_get(ctx[].hash_table, target))
    return make_string_identifier(ctx, @name)
}

pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64 {
    name: string = str_new(nil)
    match node[].tag {
        -> AST_CConstant_t {
            name = str_new("const")
            break
        }
        -> AST_CString_t {
            name = str_new("string")
            break
        }
        -> AST_CVar_t {
            name = str_new("var")
            break
        }
        -> AST_CCast_t {
            name = str_new("cast")
            break
        }
        -> AST_CUnary_t {
            name = str_new("unop")
            break
        }
        -> AST_CBinary_t {
            name = str_new("binop")
            break
        }
        -> AST_CAssignment_t {
            name = str_new("assign")
            break
        }
        -> AST_CConditional_t {
            name = str_new("ternop")
            break
        }
        -> AST_CFunctionCall_t {
            name = str_new("call")
            break
        }
        -> AST_CDereference_t {
            name = str_new("deref")
            break
        }
        -> AST_CAddrOf_t {
            name = str_new("addr")
            break
        }
        -> AST_CSubscript_t {
            name = str_new("subscr")
            break
        }
        -> AST_CDot_t {
            name = str_new("smem")
            break
        }
        -> AST_CArrow_t {
            name = str_new("sptr")
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_var_identifier(ctx, @name)
}
