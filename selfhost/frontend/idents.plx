m4_include(`idents.plx.m4')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl

########################################################################################################################

# Identifiers

m4_define(`Ctx', `*struc IdentifierContext')m4_dnl

pub fn rslv_label_identifier(ctx: Ctx, target: TIdentifier) TIdentifier {
    name: string_t = str_new(nil)
    value: string_t = map_get(ctx[].hash_table, target)
    str_copy(value, name)
    return make_label_identifier(ctx, @name)
}

pub fn rslv_var_identifier(ctx: Ctx, variable: TIdentifier) TIdentifier {
    name: string_t = str_new(nil)
    value: string_t = map_get(ctx[].hash_table, variable)
    str_copy(value, name)
    return make_var_identifier(ctx, @name)
}

pub fn rslv_struct_tag(ctx: Ctx, structure: TIdentifier) TIdentifier {
    name: string_t = str_new(nil)
    value: string_t = map_get(ctx[].hash_table, structure)
    str_copy(value, name)
    return make_struct_identifier(ctx, @name)
}

pub fn repr_label_identifier(ctx: Ctx, label_kind: LABEL_KIND) TIdentifier {
    name: string_t = str_new(nil)
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
            THROW_ABORT
        }
    }
    return make_label_identifier(ctx, @name)
}

pub fn repr_loop_identifier(ctx: Ctx, label_kind: LABEL_KIND, target: TIdentifier) TIdentifier {
    name: string_t = str_new(nil)
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
            THROW_ABORT
        }
    }
    str_append(name, map_get(ctx[].hash_table, target))
    return make_string_identifier(ctx, @name)
}

pub fn repr_case_identifier(ctx: Ctx, target: TIdentifier, is_label: bool, i: u64) TIdentifier {
    name: string_t = ? is_label then str_new("case_") else str_new("")
    {
        strto_i: string_t = str_to_string(i)
        str_append(name, strto_i)
        str_delete(strto_i)
    }
    str_append(name, map_get(ctx[].hash_table, target))
    return make_string_identifier(ctx, @name)
}

pub fn repr_var_identifier(ctx: Ctx, node: *struc CExp) TIdentifier {
    name: string_t = str_new(nil)
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
            THROW_ABORT
        }
    }
    return make_var_identifier(ctx, @name)
}
