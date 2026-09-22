m4_include(`idents.plx.m4')m4_dnl
m4_include(`tac_repr.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl
m4_include(`../ast/interm_ast.plx.m4')m4_dnl

type struc TacReprContext(frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext, p_instrs: *vector_t(unique_ptr_t(TacInstruction)), p_toplvls: *vector_t(unique_ptr_t(TacTopLevel)), p_static_consts: *vector_t(unique_ptr_t(TacTopLevel)))

m4_define(`Ctx', `TODO')m4_dnl

fn repr_unop(node: *struc CUnaryOp) struc TacUnaryOp {
    match node[].tag {
        -> AST_CComplement_t {
            return make_TacUnaryOp(AST_TacComplement_t)
        }
        -> AST_CNegate_t {
            return make_TacUnaryOp(AST_TacNegate_t)
        }
        -> AST_CNot_t {
            return make_TacUnaryOp(AST_TacNot_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn repr_binop(node: *struc CBinaryOp) struc TacBinaryOp {
    match node[].tag {
        -> AST_CAdd_t {
            return make_TacBinaryOp(AST_TacAdd_t)
        }
        -> AST_CSubtract_t {
            return make_TacBinaryOp(AST_TacSubtract_t)
        }
        -> AST_CMultiply_t {
            return make_TacBinaryOp(AST_TacMultiply_t)
        }
        -> AST_CDivide_t {
            return make_TacBinaryOp(AST_TacDivide_t)
        }
        -> AST_CRemainder_t {
            return make_TacBinaryOp(AST_TacRemainder_t)
        }
        -> AST_CBitAnd_t {
            return make_TacBinaryOp(AST_TacBitAnd_t)
        }
        -> AST_CBitOr_t {
            return make_TacBinaryOp(AST_TacBitOr_t)
        }
        -> AST_CBitXor_t {
            return make_TacBinaryOp(AST_TacBitXor_t)
        }
        -> AST_CBitShiftLeft_t {
            return make_TacBinaryOp(AST_TacBitShiftLeft_t)
        }
        -> AST_CBitShiftRight_t {
            return make_TacBinaryOp(AST_TacBitShiftRight_t)
        }
        -> AST_CBitShrArithmetic_t {
            return make_TacBinaryOp(AST_TacBitShrArithmetic_t)
        }
        -> AST_CEqual_t {
            return make_TacBinaryOp(AST_TacEqual_t)
        }
        -> AST_CNotEqual_t {
            return make_TacBinaryOp(AST_TacNotEqual_t)
        }
        -> AST_CLessThan_t {
            return make_TacBinaryOp(AST_TacLessThan_t)
        }
        -> AST_CLessOrEqual_t {
            return make_TacBinaryOp(AST_TacLessOrEqual_t)
        }
        -> AST_CGreaterThan_t {
            return make_TacBinaryOp(AST_TacGreaterThan_t)
        }
        -> AST_CGreaterOrEqual_t {
            return make_TacBinaryOp(AST_TacGreaterOrEqual_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn const_value(node: *struc CConstant) *struc TacValue {
    constant: *struc CConst = sptr_new()
    if node[].constant ~= constant {
        " #@MACRO@:sptr_copy(CConst, node->constant, constant)"
        free_CConst(@constant)
        constant = node[].constant
        (constant)[]._ref_count++
    }
    return make_TacConstant(@constant)
}

fn var_value(node: *struc CVar) *struc TacValue {
    name: u64 = node[].name
    return make_TacVariable(name)
}

fn exp_inner_value(ctx: *struc TacReprContext, node: *struc CExp, is_ptr: i32) *struc TacValue {
    inner_name: u64 = repr_var_identifier(ctx[].identifiers, node)
    if map_find(ctx[].frontend[].symbol_table, inner_name) == map_end() {
        inner_type: *struc Type = sptr_new()
        if is_ptr {
            inner_type = make_Long()
        }
        else {
            if node[].exp_type ~= inner_type {
                " #@MACRO@:sptr_copy(Type, node->exp_type, inner_type)"
                free_Type(@inner_type)
                inner_type = node[].exp_type
                (inner_type)[]._ref_count++
            }
        }
        inner_attrs: *struc IdentifierAttr = make_LocalAttr()
        symbol: *struc Symbol = make_Symbol(@inner_type, @inner_attrs)
        map_move_add(ctx[].frontend[].symbol_table, inner_name, symbol)
    }
    return make_TacVariable(inner_name)
}

fn plain_inner_value(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    return exp_inner_value(ctx, node, false)
}

fn ptr_inner_value(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    return exp_inner_value(ctx, node, true)
}

fn repr_value(node: *struc CExp) *struc TacValue {
    match node[].tag {
        -> AST_CConstant_t {
            return const_value(@node[].get._CConstant)
        }
        -> AST_CVar_t {
            return var_value(@node[].get._CVar)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn push_instr(ctx: *struc TacReprContext, instr: *struc TacInstruction) none {
    vec_move_back(ctx[].p_instrs[], instr)
}
fn repr_res_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacExpResult;
fn repr_exp_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue;

fn const_res_instr(node: *struc CConstant) *struc TacExpResult {
    val: *struc TacValue = repr_value(node[]._base)
    return make_TacPlainOperand(@val)
}

fn make_literal_identifier(ctx: *struc TacReprContext, node: *struc CStringLiteral) u64 {
    value: string = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}

fn string_res_instr(ctx: *struc TacReprContext, node: *struc CString) *struc TacExpResult {
    string_const_label: u64;
    {
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        map_it: i64 = map_find(ctx[].frontend[].string_const_table, string_const)
        if map_it ~= map_end() {
            string_const_label = (ctx[].frontend[].string_const_table[map_it]).value
        }
        else {
            string_const_label = repr_label_identifier(ctx[].identifiers, LBL_Lstring)
            map_add(ctx[].frontend[].string_const_table, string_const, string_const_label)

            constant_type: *struc Type = sptr_new()
            {
                size: i64 = cast<i64>(vec_size(node[].literal[].value)) + 1l
                elem_type: *struc Type = make_Char()
                constant_type = make_Array(size, @elem_type)
            }

            constant_attrs: *struc IdentifierAttr = uptr_new()
            {
                static_init: *struc StaticInit = sptr_new()
                {
                    literal: *struc CStringLiteral = sptr_new()
                    if node[].literal ~= literal {
                        " #@MACRO@:sptr_copy(CStringLiteral, node->literal, literal)"
                        free_CStringLiteral(@literal)
                        literal = node[].literal
                        (literal)[]._ref_count++
                    }
                    static_init = make_StringInit(string_const, true, @literal)
                }

                constant_attrs = make_ConstantAttr(@static_init)
            }
            symbol: *struc Symbol = make_Symbol(@constant_type, @constant_attrs)
            map_move_add(ctx[].frontend[].symbol_table, string_const_label, symbol)
        }
    }
    val: *struc TacValue = make_TacVariable(string_const_label)
    return make_TacPlainOperand(@val)
}

fn var_res_instr(node: *struc CVar) *struc TacExpResult {
    val: *struc TacValue = repr_value(node[]._base)
    return make_TacPlainOperand(@val)
}

fn is_type_signed(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            return true
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

fn get_scalar_size(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return 1
                }
            }
        }
        -> AST_Int_t {
            -> AST_UInt_t {
                return 4
            }
        }
        -> AST_Long_t {
            -> AST_Double_t {
                -> AST_ULong_t {
                    -> AST_Pointer_t {
                        return 8
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_type_scale(ctx: *struc TacReprContext, type_t: *struc Type) i64;

fn get_arr_scale(ctx: *struc TacReprContext, arr_type: *struc Array) i64 {
    size: i64 = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size *= arr_type[].size
    }
    return get_type_scale(ctx, arr_type[].elem_type) * size
}

fn get_struct_scale(ctx: *struc TacReprContext, struct_type: *struc Structure) i64 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
}

fn get_type_scale(ctx: *struc TacReprContext, type_t: *struc Type) i64 {
    match type_t[].tag {
        -> AST_Array_t {
            return get_arr_scale(ctx, @type_t[].get._Array)
        }
        -> AST_Structure_t {
            return get_struct_scale(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type_t)
        }
    }
}

fn cast_complete_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    if node[].target_type[].tag == node[].exp[].exp_type[].tag {
        return make_TacPlainOperand(@src)
    }
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    if node[].exp[].exp_type[].tag == AST_Double_t {
        if is_type_signed(node[].target_type) {
            push_instr(ctx, make_TacDoubleToInt(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacDoubleToUInt(@src, @dst_cp))
        }
    }
    elif node[].target_type[].tag == AST_Double_t {
        if is_type_signed(node[].exp[].exp_type) {
            push_instr(ctx, make_TacIntToDouble(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacUIntToDouble(@src, @dst_cp))
        }
    }
    else {
        target_type_size: i32 = get_scalar_size(node[].target_type)
        inner_type_size: i32 = get_scalar_size(node[].exp[].exp_type)
        if target_type_size == inner_type_size {
            push_instr(ctx, make_TacCopy(@src, @dst_cp))
        }
        elif target_type_size < inner_type_size {
            push_instr(ctx, make_TacTruncate(@src, @dst_cp))
        }
        elif is_type_signed(node[].exp[].exp_type) {
            push_instr(ctx, make_TacSignExtend(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacZeroExtend(@src, @dst_cp))
        }
    }
    return make_TacPlainOperand(@dst)
}

fn cast_void_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    dst: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    free_TacValue(@dst)
    return make_TacPlainOperand(@dst)
}

fn cast_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    if node[].target_type[].tag == AST_Void_t {
        return cast_void_res_instr(ctx, node)
    }
    else {
        return cast_complete_res_instr(ctx, node)
    }
}

fn unary_res_instr(ctx: *struc TacReprContext, node: *struc CUnary) *struc TacExpResult {
    src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    unop: struc TacUnaryOp = repr_unop(@node[].unop)
    push_instr(ctx, make_TacUnary(@unop, @src, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_any_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult;

fn binary_add_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    scale: i64;
    src_ptr: *struc TacValue = sptr_new()
    idx: *struc TacValue = sptr_new()
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t {
        scale = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].exp_left)
        idx = repr_exp_instr(ctx, node[].exp_right)
    }
    else {
        scale = get_type_scale(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].exp_right)
        idx = repr_exp_instr(ctx, node[].exp_left)
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_add_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        return binary_add_ptr_res_instr(ctx, node)
    }
    else {
        return binary_any_res_instr(ctx, node)
    }
}

fn binary_sub_to_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    scale: i64 = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
    src_ptr: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)

    idx: *struc TacValue = sptr_new()
    {
        idx = repr_exp_instr(ctx, node[].exp_right)
        dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        unop: struc TacUnaryOp = make_TacUnaryOp(AST_TacNegate_t)
        push_instr(ctx, make_TacUnary(@unop, @idx, @dst_cp))
        loop .. while 0 {
            " #@MACRO@:sptr_move(TacValue, dst, idx)"
            if dst ~= idx {
                " #@MACRO@:uptr_move(TacValue, dst, idx)"
                free_TacValue(@idx)
                idx = dst
                dst = uptr_new()
            }
        }
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_subtract_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    src_1: *struc TacValue = sptr_new()
    {
        src_1 = repr_exp_instr(ctx, node[].exp_left)
        src_2: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        binop: struc TacBinaryOp = make_TacBinaryOp(AST_TacSubtract_t)
        push_instr(ctx, make_TacBinary(@binop, @src_1, @src_2, @dst_cp))
        loop .. while 0 {
            " #@MACRO@:sptr_move(TacValue, dst, src_1)"
            if dst ~= src_1 {
                " #@MACRO@:uptr_move(TacValue, dst, src_1)"
                free_TacValue(@src_1)
                src_1 = dst
                dst = uptr_new()
            }
        }
    }

    src_2: *struc TacValue = sptr_new()
    {
        value: i64 = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
        constant: *struc CConst = make_CConstLong(value)
        src_2 = make_TacConstant(@constant)
    }
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    binop: struc TacBinaryOp = make_TacBinaryOp(AST_TacDivide_t)
    push_instr(ctx, make_TacBinary(@binop, @src_1, @src_2, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_subtract_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t {
        if node[].exp_right[].exp_type[].tag == AST_Pointer_t {
            return binary_subtract_ptr_res_instr(ctx, node)
        }
        else {
            return binary_sub_to_ptr_res_instr(ctx, node)
        }
    }
    else {
        return binary_any_res_instr(ctx, node)
    }
}

fn binary_and_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Land_false)
    target_true: u64 = repr_label_identifier(ctx[].identifiers, LBL_Land_true)

    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition_left: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition_left))
    }

    {
        condition_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition_right))
    }
    {
        constant: *struc CConst = make_CConstInt(1)
        src_true: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_true, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_true))
    push_instr(ctx, make_TacLabel(target_false))
    {
        constant: *struc CConst = make_CConstInt(0)
        src_false: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_false, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_true))
    return make_TacPlainOperand(@dst)
}

fn binary_or_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    target_true: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lor_true)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lor_false)

    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition_left: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
        push_instr(ctx, make_TacJumpIfNotZero(target_true, @condition_left))
    }

    {
        condition_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        push_instr(ctx, make_TacJumpIfNotZero(target_true, @condition_right))
    }
    {
        constant: *struc CConst = make_CConstInt(0)
        src_false: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_false, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_true))
    {
        constant: *struc CConst = make_CConstInt(1)
        src_true: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_true, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}

fn binary_any_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    src1: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
    src2: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    binop: struc TacBinaryOp = repr_binop(@node[].binop)
    push_instr(ctx, make_TacBinary(@binop, @src1, @src2, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    match node[].binop.tag {
        -> AST_CAdd_t {
            return binary_add_res_instr(ctx, node)
        }
        -> AST_CSubtract_t {
            return binary_subtract_res_instr(ctx, node)
        }
        -> AST_CAnd_t {
            return binary_and_res_instr(ctx, node)
        }
        -> AST_COr_t {
            return binary_or_res_instr(ctx, node)
        }
        otherwise {
            return binary_any_res_instr(ctx, node)
        }
    }
}

fn plain_op_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, dst: **struc TacValue) none {
    src: *struc TacValue = sptr_new()
    if res[].val ~= src {
        " #@MACRO@:sptr_copy(TacValue, res->val, src)"
        free_TacValue(@src)
        src = res[].val
        (src)[]._ref_count++
    }
    dst_cp: *struc TacValue = sptr_new()
    if dst[] ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, *dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopy(@src, @dst_cp))
}

fn deref_ptr_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, dst: **struc TacValue) none {
    src: *struc TacValue = sptr_new()
    if res[].val ~= src {
        " #@MACRO@:sptr_copy(TacValue, res->val, src)"
        free_TacValue(@src)
        src = res[].val
        (src)[]._ref_count++
    }
    dst_cp: *struc TacValue = sptr_new()
    if dst[] ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, *dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacLoad(@src, @dst_cp))
}

fn sub_obj_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, dst: **struc TacValue) none {
    src_name: u64 = res[].base_name
    offset: i64 = res[].offset
    dst_cp: *struc TacValue = sptr_new()
    if dst[] ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, *dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopyFromOffset(src_name, offset, @dst_cp))
}

fn plain_op_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, src: **struc TacValue) none {
    dst: *struc TacValue = sptr_new()
    if res[].val ~= dst {
        " #@MACRO@:sptr_copy(TacValue, res->val, dst)"
        free_TacValue(@dst)
        dst = res[].val
        (dst)[]._ref_count++
    }
    push_instr(ctx, make_TacCopy(src, @dst))
}

fn deref_ptr_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, src: **struc TacValue, exp_res: **struc TacExpResult) none {
    src_cp: *struc TacValue = sptr_new()
    if src[] ~= src_cp {
        " #@MACRO@:sptr_copy(TacValue, *src, src_cp)"
        free_TacValue(@src_cp)
        src_cp = src[]
        (src_cp)[]._ref_count++
    }
    dst: *struc TacValue = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(TacValue, res->val, dst)"
        if res[].val ~= dst {
            " #@MACRO@:uptr_move(TacValue, res->val, dst)"
            free_TacValue(@dst)
            dst = res[].val
            res[].val = uptr_new()
        }
    }
    push_instr(ctx, make_TacStore(@src_cp, @dst))
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(src)
}

fn sub_obj_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, src: **struc TacValue, exp_res: **struc TacExpResult) none {
    dst_name: u64 = res[].base_name
    offset: i64 = res[].offset
    src_cp: *struc TacValue = sptr_new()
    if src[] ~= src_cp {
        " #@MACRO@:sptr_copy(TacValue, *src, src_cp)"
        free_TacValue(@src_cp)
        src_cp = src[]
        (src_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src_cp))
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(src)
}

fn assign_res_instr(ctx: *struc TacReprContext, node: *struc CAssignment) *struc TacExpResult {
    src: *struc TacValue = sptr_new()
    res: *struc TacExpResult = uptr_new()
    res_postfix: *struc TacExpResult = uptr_new()
    if node[].exp_left {
        src = repr_exp_instr(ctx, node[].exp_right)
        res = repr_res_instr(ctx, node[].exp_left)
    }
    else {
        label_count_1: u32 = ctx[].identifiers[].label_count
        var_count_1: u32 = ctx[].identifiers[].var_count
        struct_count_1: u32 = ctx[].identifiers[].struct_count
        src = repr_exp_instr(ctx, node[].exp_right)
        label_count_2: u32 = ctx[].identifiers[].label_count
        var_count_2: u32 = ctx[].identifiers[].var_count
        struct_count_2: u32 = ctx[].identifiers[].struct_count
        ctx[].identifiers[].label_count = label_count_1
        ctx[].identifiers[].var_count = var_count_1
        ctx[].identifiers[].struct_count = struct_count_1
        {
            exp_left: *struc CExp = node[].exp_right
            if exp_left[].tag == AST_CCast_t {
                exp_left = exp_left[].get._CCast.exp
            }
            exp_left = exp_left[].get._CBinary.exp_left
            if exp_left[].tag == AST_CCast_t {
                exp_left = exp_left[].get._CCast.exp
            }
            {
                noeval_instrs: vector_t(unique_ptr_t(TacInstruction)) = vec_new()
                p_instrs: *vector_t(unique_ptr_t(TacInstruction)) = ctx[].p_instrs
                ctx[].p_instrs = @noeval_instrs
                res = repr_res_instr(ctx, exp_left)
                ctx[].p_instrs = p_instrs
                loop i: u64 = 0 while i < vec_size(noeval_instrs) .. ++i {
                    free_TacInstruction(@noeval_instrs[i])
                }
                vec_delete(noeval_instrs)
            }
            ctx[].identifiers[].label_count = label_count_2
            ctx[].identifiers[].var_count = var_count_2
            ctx[].identifiers[].struct_count = struct_count_2
            if node[].unop.tag == AST_CPostfix_t {
                dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
                match res[].tag {
                    -> AST_TacPlainOperand_t {
                        plain_op_postfix_exp_instr(ctx, @res[].get._TacPlainOperand, @dst)
                    }
                    break
                    -> AST_TacDereferencedPointer_t {
                        deref_ptr_postfix_exp_instr(ctx, @res[].get._TacDereferencedPointer, @dst)
                    }
                    break
                    -> AST_TacSubObject_t {
                        sub_obj_postfix_exp_instr(ctx, @res[].get._TacSubObject, @dst)
                    }
                    break
                    otherwise {
                        panic_sigabrt("abort")
                    }
                }
                res_postfix = make_TacPlainOperand(@dst)
            }
        }
    }
    match res[].tag {
        -> AST_TacPlainOperand_t {
            plain_op_assign_res_instr(ctx, @res[].get._TacPlainOperand, @src)
        }
        break
        -> AST_TacDereferencedPointer_t {
            deref_ptr_assign_res_instr(ctx, @res[].get._TacDereferencedPointer, @src, @res)
        }
        break
        -> AST_TacSubObject_t {
            sub_obj_assign_res_instr(ctx, @res[].get._TacSubObject, @src, @res)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if node[].unop.tag == AST_CPostfix_t {
        free_TacExpResult(@res)
        return res_postfix
    }
    else {
        return res
    }
}

fn conditional_complete_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_else)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_false)

    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }

    {
        src_middle: *struc TacValue = repr_exp_instr(ctx, node[].exp_middle)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_middle, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    {
        src_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_right, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}

fn conditional_void_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_else)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_false)

    dst: *struc TacValue = sptr_new()
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }

    dst = repr_exp_instr(ctx, node[].exp_middle)
    free_TacValue(@dst)
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    dst = repr_exp_instr(ctx, node[].exp_right)
    free_TacValue(@dst)
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}

fn conditional_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    if node[].exp_middle[].exp_type[].tag == AST_Void_t {
        return conditional_void_res_instr(ctx, node)
    }
    else {
        return conditional_complete_res_instr(ctx, node)
    }
}

fn call_res_instr(ctx: *struc TacReprContext, node: *struc CFunctionCall) *struc TacExpResult {
    name: u64 = node[].name
    args: vector_t(shared_ptr_t(TacValue)) = vec_new()
    vec_reserve(args, vec_size(node[].args))
    loop i: u64 = 0 while i < vec_size(node[].args) .. ++i {
        arg: *struc TacValue = repr_exp_instr(ctx, node[].args[i])
        vec_move_back(args, arg)
    }
    dst: *struc TacValue = sptr_new()
    if node[]._base[].exp_type[].tag ~= AST_Void_t {
        dst = plain_inner_value(ctx, node[]._base)
    }
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacFunCall(name, @args, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn deref_res_instr(ctx: *struc TacReprContext, node: *struc CDereference) *struc TacExpResult {
    val: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    return make_TacDereferencedPointer(@val)
}

fn plain_op_addrof_res_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, node: *struc CAddrOf) none {
    src: *struc TacValue = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(TacValue, res->val, src)"
        if res[].val ~= src {
            " #@MACRO@:uptr_move(TacValue, res->val, src)"
            free_TacValue(@src)
            src = res[].val
            res[].val = uptr_new()
        }
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacGetAddress(@src, @dst_cp))
    loop .. while 0 {
        " #@MACRO@:sptr_move(TacValue, dst, res->val)"
        if dst ~= res[].val {
            " #@MACRO@:uptr_move(TacValue, dst, res->val)"
            free_TacValue(@res[].val)
            res[].val = dst
            dst = uptr_new()
        }
    }
}

fn deref_ptr_addrof_res_instr(res: *struc TacDereferencedPointer, exp_res: **struc TacExpResult) none {
    val: *struc TacValue = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(TacValue, res->val, val)"
        if res[].val ~= val {
            " #@MACRO@:uptr_move(TacValue, res->val, val)"
            free_TacValue(@val)
            val = res[].val
            res[].val = uptr_new()
        }
    }
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(@val)
}

fn sub_obj_addrof_res_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, node: *struc CAddrOf, exp_res: **struc TacExpResult) none {
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    {
        name: u64 = res[].base_name
        src: *struc TacValue = make_TacVariable(name)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacGetAddress(@src, @dst_cp))
    }

    if res[].offset > 0l {
        src_ptr: *struc TacValue = sptr_new()
        if dst ~= src_ptr {
            " #@MACRO@:sptr_copy(TacValue, dst, src_ptr)"
            free_TacValue(@src_ptr)
            src_ptr = dst
            (src_ptr)[]._ref_count++
        }

        idx: *struc TacValue = sptr_new()
        {
            offset: i64 = res[].offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacAddPtr(1l, @src_ptr, @idx, @dst_cp))
    }
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(@dst)
}

fn addrof_res_instr(ctx: *struc TacReprContext, node: *struc CAddrOf) *struc TacExpResult {
    res: *struc TacExpResult = repr_res_instr(ctx, node[].exp)
    match res[].tag {
        -> AST_TacPlainOperand_t {
            plain_op_addrof_res_instr(ctx, @res[].get._TacPlainOperand, node)
        }
        break
        -> AST_TacDereferencedPointer_t {
            deref_ptr_addrof_res_instr(@res[].get._TacDereferencedPointer, @res)
        }
        break
        -> AST_TacSubObject_t {
            sub_obj_addrof_res_instr(ctx, @res[].get._TacSubObject, node, @res)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return res
}

fn subscript_res_instr(ctx: *struc TacReprContext, node: *struc CSubscript) *struc TacExpResult {
    scale: i64;
    src_ptr: *struc TacValue = sptr_new()
    idx: *struc TacValue = sptr_new()
    if node[].primary_exp[].exp_type[].tag == AST_Pointer_t {
        scale = get_type_scale(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].primary_exp)
        idx = repr_exp_instr(ctx, node[].subscript_exp)
    }
    else {
        scale = get_type_scale(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].subscript_exp)
        idx = repr_exp_instr(ctx, node[].primary_exp)
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacDereferencedPointer(@dst)
}

fn sizeof_res_instr(ctx: *struc TacReprContext, node: *struc CSizeOf) *struc TacExpResult {
    constant: *struc CConst = sptr_new()
    {
        value: u64 = cast<u64>(get_type_scale(ctx, node[].exp[].exp_type))
        constant = make_CConstULong(value)
    }
    val: *struc TacValue = make_TacConstant(@constant)
    return make_TacPlainOperand(@val)
}

fn sizeoft_res_instr(ctx: *struc TacReprContext, node: *struc CSizeOfT) *struc TacExpResult {
    constant: *struc CConst = sptr_new()
    {
        value: u64 = cast<u64>(get_type_scale(ctx, node[].target_type))
        constant = make_CConstULong(value)
    }
    val: *struc TacValue = make_TacConstant(@constant)
    return make_TacPlainOperand(@val)
}

fn plain_op_dot_res_instr(res: *struc TacPlainOperand, member_offset: i64, exp_res: **struc TacExpResult) none {
    base_name: u64 = res[].val[].get._TacVariable.name
    offset: i64 = member_offset
    free_TacExpResult(exp_res)
    exp_res[] = make_TacSubObject(base_name, offset)
}

fn deref_ptr_dot_res_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, node: *struc CDot, member_offset: i64) none {
    if member_offset > 0l {
        src_ptr: *struc TacValue = sptr_new()
        loop .. while 0 {
            " #@MACRO@:sptr_move(TacValue, res->val, src_ptr)"
            if res[].val ~= src_ptr {
                " #@MACRO@:uptr_move(TacValue, res->val, src_ptr)"
                free_TacValue(@src_ptr)
                src_ptr = res[].val
                res[].val = uptr_new()
            }
        }

        idx: *struc TacValue = sptr_new()
        {
            offset: i64 = member_offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacAddPtr(1l, @src_ptr, @idx, @dst_cp))
        loop .. while 0 {
            " #@MACRO@:sptr_move(TacValue, dst, res->val)"
            if dst ~= res[].val {
                " #@MACRO@:uptr_move(TacValue, dst, res->val)"
                free_TacValue(@res[].val)
                res[].val = dst
                dst = uptr_new()
            }
        }
    }
}

fn sub_obj_dot_res_instr(res: *struc TacSubObject, member_offset: i64) none {
    res[].offset += member_offset
}

fn dot_res_instr(ctx: *struc TacReprContext, node: *struc CDot) *struc TacExpResult {
    struct_type: *struc Structure = @node[].structure[].exp_type[].get._Structure
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    member_offset: i64 = ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)[].offset
    res: *struc TacExpResult = repr_res_instr(ctx, node[].structure)
    match res[].tag {
        -> AST_TacPlainOperand_t {
            plain_op_dot_res_instr(@res[].get._TacPlainOperand, member_offset, @res)
        }
        break
        -> AST_TacDereferencedPointer_t {
            deref_ptr_dot_res_instr(ctx, @res[].get._TacDereferencedPointer, node, member_offset)
        }
        break
        -> AST_TacSubObject_t {
            sub_obj_dot_res_instr(@res[].get._TacSubObject, member_offset)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return res
}

fn arrow_res_instr(ctx: *struc TacReprContext, node: *struc CArrow) *struc TacExpResult {
    ptr_type: *struc Pointer = @node[].pointer[].exp_type[].get._Pointer
    struct_type: *struc Structure = @ptr_type[].ref_type[].get._Structure
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    member_offset: i64 = ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)[].offset
    val: *struc TacValue = repr_exp_instr(ctx, node[].pointer)
    if member_offset > 0l {
        idx: *struc TacValue = sptr_new()
        {
            offset: i64 = member_offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = sptr_new()
        if dst ~= dst_cp {
            " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacAddPtr(1l, @val, @idx, @dst_cp))
        loop .. while 0 {
            " #@MACRO@:sptr_move(TacValue, dst, val)"
            if dst ~= val {
                " #@MACRO@:uptr_move(TacValue, dst, val)"
                free_TacValue(@val)
                val = dst
                dst = uptr_new()
            }
        }
    }
    return make_TacDereferencedPointer(@val)
}

fn repr_res_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacExpResult {
    match node[].tag {
        -> AST_CConstant_t {
            return const_res_instr(@node[].get._CConstant)
        }
        -> AST_CString_t {
            return string_res_instr(ctx, @node[].get._CString)
        }
        -> AST_CVar_t {
            return var_res_instr(@node[].get._CVar)
        }
        -> AST_CCast_t {
            return cast_res_instr(ctx, @node[].get._CCast)
        }
        -> AST_CUnary_t {
            return unary_res_instr(ctx, @node[].get._CUnary)
        }
        -> AST_CBinary_t {
            return binary_res_instr(ctx, @node[].get._CBinary)
        }
        -> AST_CAssignment_t {
            return assign_res_instr(ctx, @node[].get._CAssignment)
        }
        -> AST_CConditional_t {
            return conditional_res_instr(ctx, @node[].get._CConditional)
        }
        -> AST_CFunctionCall_t {
            return call_res_instr(ctx, @node[].get._CFunctionCall)
        }
        -> AST_CDereference_t {
            return deref_res_instr(ctx, @node[].get._CDereference)
        }
        -> AST_CAddrOf_t {
            return addrof_res_instr(ctx, @node[].get._CAddrOf)
        }
        -> AST_CSubscript_t {
            return subscript_res_instr(ctx, @node[].get._CSubscript)
        }
        -> AST_CSizeOf_t {
            return sizeof_res_instr(ctx, @node[].get._CSizeOf)
        }
        -> AST_CSizeOfT_t {
            return sizeoft_res_instr(ctx, @node[].get._CSizeOfT)
        }
        -> AST_CDot_t {
            return dot_res_instr(ctx, @node[].get._CDot)
        }
        -> AST_CArrow_t {
            return arrow_res_instr(ctx, @node[].get._CArrow)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn plain_op_exp_instr(res: *struc TacPlainOperand) *struc TacValue {
    dst: *struc TacValue = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(TacValue, res->val, dst)"
        if res[].val ~= dst {
            " #@MACRO@:uptr_move(TacValue, res->val, dst)"
            free_TacValue(@dst)
            dst = res[].val
            res[].val = uptr_new()
        }
    }
    return dst
}

fn deref_ptr_exp_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, node: *struc CExp) *struc TacValue {
    src: *struc TacValue = sptr_new()
    loop .. while 0 {
        " #@MACRO@:sptr_move(TacValue, res->val, src)"
        if res[].val ~= src {
            " #@MACRO@:uptr_move(TacValue, res->val, src)"
            free_TacValue(@src)
            src = res[].val
            res[].val = uptr_new()
        }
    }
    dst: *struc TacValue = plain_inner_value(ctx, node)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacLoad(@src, @dst_cp))
    return dst
}

fn sub_obj_exp_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, node: *struc CExp) *struc TacValue {
    src_name: u64 = res[].base_name
    offset: i64 = res[].offset
    dst: *struc TacValue = plain_inner_value(ctx, node)
    dst_cp: *struc TacValue = sptr_new()
    if dst ~= dst_cp {
        " #@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopyFromOffset(src_name, offset, @dst_cp))
    return dst
}

fn repr_exp_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    val: *struc TacValue = sptr_new()
    res: *struc TacExpResult = repr_res_instr(ctx, node)
    match res[].tag {
        -> AST_TacPlainOperand_t {
            val = plain_op_exp_instr(@res[].get._TacPlainOperand)
            break
        }
        -> AST_TacDereferencedPointer_t {
            val = deref_ptr_exp_instr(ctx, @res[].get._TacDereferencedPointer, node)
            break
        }
        -> AST_TacSubObject_t {
            val = sub_obj_exp_instr(ctx, @res[].get._TacSubObject, node)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_TacExpResult(@res)
    return val
}

fn repr_block(ctx: *struc TacReprContext, node: *struc CBlock) none;
fn statement_instr(ctx: *struc TacReprContext, node: *struc CStatement) none;
fn var_decl_instr(ctx: *struc TacReprContext, node: *struc CVariableDeclaration) none;

fn ret_statement_instr(ctx: *struc TacReprContext, node: *struc CReturn) none {
    val: *struc TacValue = sptr_new()
    if node[].exp {
        val = repr_exp_instr(ctx, node[].exp)
    }
    push_instr(ctx, make_TacReturn(@val))
}

fn exp_statement_instr(ctx: *struc TacReprContext, node: *struc CExpression) none {
    res: *struc TacExpResult = repr_res_instr(ctx, node[].exp)
    free_TacExpResult(@res)
}

fn if_only_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lif_false)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition))
    }
    statement_instr(ctx, node[].then_fi)
    push_instr(ctx, make_TacLabel(target_false))
}

fn if_else_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lif_else)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lif_false)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }
    statement_instr(ctx, node[].then_fi)
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    statement_instr(ctx, node[].else_fi)
    push_instr(ctx, make_TacLabel(target_false))
}

fn if_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    if node[].else_fi {
        if_else_statement_instr(ctx, node)
    }
    else {
        if_only_statement_instr(ctx, node)
    }
}

fn goto_statement_instr(ctx: *struc TacReprContext, node: *struc CGoto) none {
    target_label: u64 = node[].target
    push_instr(ctx, make_TacJump(target_label))
}

fn label_statement_instr(ctx: *struc TacReprContext, node: *struc CLabel) none {
    target_label: u64 = node[].target
    push_instr(ctx, make_TacLabel(target_label))
    statement_instr(ctx, node[].jump_to)
}

fn statement_compound_instr(ctx: *struc TacReprContext, node: *struc CCompound) none {
    repr_block(ctx, node[].block)
}

fn while_statement_instr(ctx: *struc TacReprContext, node: *struc CWhile) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    push_instr(ctx, make_TacLabel(target_continue))
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_break, @condition))
    }
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacJump(target_continue))
    push_instr(ctx, make_TacLabel(target_break))
}

fn do_while_statement_instr(ctx: *struc TacReprContext, node: *struc CDoWhile) none {
    target_do_while_start: u64 = repr_label_identifier(ctx[].identifiers, LBL_Ldo_while_start)
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    push_instr(ctx, make_TacLabel(target_do_while_start))
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacLabel(target_continue))
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfNotZero(target_do_while_start, @condition))
    }
    push_instr(ctx, make_TacLabel(target_break))
}

fn for_init_decl_instr(ctx: *struc TacReprContext, node: *struc CInitDecl) none {
    if node[].init and node[].init[].init {
        var_decl_instr(ctx, node[].init)
    }
}

fn for_init_exp_instr(ctx: *struc TacReprContext, node: *struc CInitExp) none {
    if node[].init {
        res: *struc TacExpResult = repr_res_instr(ctx, node[].init)
        free_TacExpResult(@res)
    }
}

fn for_init_statement_instr(ctx: *struc TacReprContext, node: *struc CForInit) none {
    match node[].tag {
        -> AST_CInitDecl_t {
            for_init_decl_instr(ctx, @node[].get._CInitDecl)
        }
        break
        -> AST_CInitExp_t {
            for_init_exp_instr(ctx, @node[].get._CInitExp)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn for_statement_instr(ctx: *struc TacReprContext, node: *struc CFor) none {
    target_for_start: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lfor_start)
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    for_init_statement_instr(ctx, node[].init)
    push_instr(ctx, make_TacLabel(target_for_start))
    if node[].condition {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_break, @condition))
    }
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacLabel(target_continue))
    if node[].post {
        res: *struc TacExpResult = repr_res_instr(ctx, node[].post)
        free_TacExpResult(@res)
    }
    push_instr(ctx, make_TacJump(target_for_start))
    push_instr(ctx, make_TacLabel(target_break))
}

fn switch_statement_instr(ctx: *struc TacReprContext, node: *struc CSwitch) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    {
        lookup: *struc TacValue = repr_exp_instr(ctx, node[].lookup)
        loop i: u64 = 0 while i < vec_size(node[].cases) .. ++i {
            target_case: u64 = repr_case_identifier(ctx[].identifiers, node[].target, true, i)

            case_match: *struc TacValue = sptr_new()
            {
                lookup_cp: *struc TacValue = sptr_new()
                if lookup ~= lookup_cp {
                    " #@MACRO@:sptr_copy(TacValue, lookup, lookup_cp)"
                    free_TacValue(@lookup_cp)
                    lookup_cp = lookup
                    (lookup_cp)[]._ref_count++
                }
                esac: *struc TacValue = repr_exp_instr(ctx, node[].cases[i])
                case_match = plain_inner_value(ctx, node[].cases[i])
                case_match_cp: *struc TacValue = sptr_new()
                if case_match ~= case_match_cp {
                    " #@MACRO@:sptr_copy(TacValue, case_match, case_match_cp)"
                    free_TacValue(@case_match_cp)
                    case_match_cp = case_match
                    (case_match_cp)[]._ref_count++
                }
                binop: struc TacBinaryOp = make_TacBinaryOp(AST_TacEqual_t)
                push_instr(ctx, make_TacBinary(@binop, @lookup_cp, @esac, @case_match_cp))
            }

            push_instr(ctx, make_TacJumpIfNotZero(target_case, @case_match))
        }
        free_TacValue(@lookup)
    }
    if node[].is_default {
        target_default: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Ldefault, node[].target)
        push_instr(ctx, make_TacJump(target_default))
        statement_instr(ctx, node[].body)
    }
    elif not vec_empty(node[].cases) {
        push_instr(ctx, make_TacJump(target_break))
        statement_instr(ctx, node[].body)
    }
    push_instr(ctx, make_TacLabel(target_break))
}

fn case_statement_instr(ctx: *struc TacReprContext, node: *struc CCase) none {
    target_case: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcase, node[].target)
    push_instr(ctx, make_TacLabel(target_case))
    statement_instr(ctx, node[].jump_to)
}

fn default_statement_instr(ctx: *struc TacReprContext, node: *struc CDefault) none {
    target_default: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Ldefault, node[].target)
    push_instr(ctx, make_TacLabel(target_default))
    statement_instr(ctx, node[].jump_to)
}

fn break_statement_instr(ctx: *struc TacReprContext, node: *struc CBreak) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    push_instr(ctx, make_TacJump(target_break))
}

fn continue_statement_instr(ctx: *struc TacReprContext, node: *struc CContinue) none {
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    push_instr(ctx, make_TacJump(target_continue))
}

fn statement_instr(ctx: *struc TacReprContext, node: *struc CStatement) none {
    match node[].tag {
        -> AST_CReturn_t {
            ret_statement_instr(ctx, @node[].get._CReturn)
        }
        break
        -> AST_CExpression_t {
            exp_statement_instr(ctx, @node[].get._CExpression)
        }
        break
        -> AST_CIf_t {
            if_statement_instr(ctx, @node[].get._CIf)
        }
        break
        -> AST_CGoto_t {
            goto_statement_instr(ctx, @node[].get._CGoto)
        }
        break
        -> AST_CLabel_t {
            label_statement_instr(ctx, @node[].get._CLabel)
        }
        break
        -> AST_CCompound_t {
            statement_compound_instr(ctx, @node[].get._CCompound)
        }
        break
        -> AST_CWhile_t {
            while_statement_instr(ctx, @node[].get._CWhile)
        }
        break
        -> AST_CDoWhile_t {
            do_while_statement_instr(ctx, @node[].get._CDoWhile)
        }
        break
        -> AST_CFor_t {
            for_statement_instr(ctx, @node[].get._CFor)
        }
        break
        -> AST_CSwitch_t {
            switch_statement_instr(ctx, @node[].get._CSwitch)
        }
        break
        -> AST_CCase_t {
            case_statement_instr(ctx, @node[].get._CCase)
        }
        break
        -> AST_CDefault_t {
            default_statement_instr(ctx, @node[].get._CDefault)
        }
        break
        -> AST_CBreak_t {
            break_statement_instr(ctx, @node[].get._CBreak)
        }
        break
        -> AST_CContinue_t {
            continue_statement_instr(ctx, @node[].get._CContinue)
        }
        break
        -> AST_CNull_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn compound_init_instr(ctx: *struc TacReprContext, node: *struc CInitializer, init_type: *struc Type, symbol: u64, size: *i64) none;

fn string_single_init_instr(ctx: *struc TacReprContext, node: *struc CString, arr_type: *struc Array, symbol: u64, size: i64) none {
    byte_at: u64 = 0
    bytes_size: u64 = cast<u64>(arr_type[].size)
    bytes_copy: u64 = ? arr_type[].size > cast<i64>(vec_size(node[].literal[].value)) then vec_size(node[].literal[].value) else bytes_size
    loop while byte_at < bytes_copy {
        dst_name: u64 = symbol
        offset: i64 = size + (cast<i64>(byte_at))

        src: *struc TacValue = sptr_new()
        {
            constant: *struc CConst = sptr_new()
            {
                bytes_left: u64 = bytes_size - byte_at
                if bytes_left < 4 {
                    value: i8 = string_bytes_to_int8(node[].literal[].value, byte_at)
                    constant = make_CConstChar(value)
                    byte_at++
                }
                elif bytes_left < 8 {
                    value: i32 = string_bytes_to_int32(node[].literal[].value, byte_at)
                    constant = make_CConstInt(value)
                    byte_at += 4
                }
                else {
                    value: i64 = string_bytes_to_int64(node[].literal[].value, byte_at)
                    constant = make_CConstLong(value)
                    byte_at += 8
                }
            }

            src = make_TacConstant(@constant)
        }

        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
    loop while byte_at < bytes_size {
        dst_name: u64 = symbol
        offset: i64 = size + (cast<i64>(byte_at))

        src: *struc TacValue = sptr_new()
        {
            constant: *struc CConst = sptr_new()
            {
                bytes_left: u64 = bytes_size - byte_at
                if bytes_left < 4 {
                    constant = make_CConstChar(0)
                    byte_at++
                }
                elif bytes_left < 8 {
                    constant = make_CConstInt(0)
                    byte_at += 4
                }
                else {
                    constant = make_CConstLong(0l)
                    byte_at += 8
                }
            }

            src = make_TacConstant(@constant)
        }

        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
}

fn single_init_instr(ctx: *struc TacReprContext, node: *struc CSingleInit, init_type: *struc Type, symbol: u64) none {
    if node[].exp[].tag == AST_CString_t and init_type[].tag == AST_Array_t {
        string_single_init_instr(ctx, @node[].exp[].get._CString, @init_type[].get._Array, symbol, 0l)
    }
    else {
        src: *struc TacValue = repr_exp_instr(ctx, node[].exp)

        dst: *struc TacValue = sptr_new()
        {
            name: u64 = symbol
            exp: *struc CExp = make_CVar(name, 0)
            dst = repr_value(exp)
            free_CExp(@exp)
        }

        push_instr(ctx, make_TacCopy(@src, @dst))
    }
}

fn scalar_compound_init_instr(ctx: *struc TacReprContext, node: *struc CSingleInit, init_type: *struc Type, symbol: u64, size: i64) none {
    if node[].exp[].tag == AST_CString_t and init_type[].tag == AST_Array_t {
        string_single_init_instr(ctx, @node[].exp[].get._CString, @init_type[].get._Array, symbol, size)
    }
    else {
        dst_name: u64 = symbol
        offset: i64 = size
        src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
}

fn arr_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, arr_type: *struc Array, symbol: u64, size: *i64) none {
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        compound_init_instr(ctx, node[].initializers[i], arr_type[].elem_type, symbol, size)
        if node[].initializers[i][].tag == AST_CSingleInit_t {
            size[] += get_type_scale(ctx, arr_type[].elem_type)
        }
    }
}

fn struct_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, struct_type: *struc Structure, symbol: u64, size: *i64) none {
    loop i: u64 = vec_size(node[].initializers) while i-- > 0 {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        offset: i64 = size[] + member[].offset
        compound_init_instr(ctx, node[].initializers[i], member[].member_type, symbol, @offset)
    }
    size[] += get_struct_scale(ctx, struct_type)
}

fn aggr_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, init_type: *struc Type, symbol: u64, size: *i64) none {
    match init_type[].tag {
        -> AST_Array_t {
            arr_compound_init_instr(ctx, node, @init_type[].get._Array, symbol, size)
        }
        break
        -> AST_Structure_t {
            struct_compound_init_instr(ctx, node, @init_type[].get._Structure, symbol, size)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn compound_init_instr(ctx: *struc TacReprContext, node: *struc CInitializer, init_type: *struc Type, symbol: u64, size: *i64) none {
    match node[].tag {
        -> AST_CSingleInit_t {
            scalar_compound_init_instr(ctx, @node[].get._CSingleInit, init_type, symbol, size[])
        }
        break
        -> AST_CCompoundInit_t {
            aggr_compound_init_instr(ctx, @node[].get._CCompoundInit, init_type, symbol, size)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn var_decl_instr(ctx: *struc TacReprContext, node: *struc CVariableDeclaration) none {
    init_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    match node[].init[].tag {
        -> AST_CSingleInit_t {
            single_init_instr(ctx, @node[].init[].get._CSingleInit, init_type, node[].name)
        }
        break
        -> AST_CCompoundInit_t {
            size: i64 = 0l
            aggr_compound_init_instr(ctx, @node[].init[].get._CCompoundInit, init_type, node[].name, @size)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn var_declaration_instr(ctx: *struc TacReprContext, node: *struc CVarDecl) none {
    if node[].var_decl[].init and ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].var_decl[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag ~= AST_StaticAttr_t {
        var_decl_instr(ctx, node[].var_decl)
    }
}

fn declaration_instr(ctx: *struc TacReprContext, node: *struc CDeclaration) none {
    match node[].tag {
        -> AST_CFunDecl_t {
            -> AST_CStructDecl_t {
                break
            }
        }
        -> AST_CVarDecl_t {
            var_declaration_instr(ctx, @node[].get._CVarDecl)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn repr_instr_list(ctx: *struc TacReprContext, node_list: vector_t(unique_ptr_t(CBlockItem))) none {
    loop i: u64 = 0 while i < vec_size(node_list) .. ++i {
        match node_list[i][].tag {
            -> AST_CS_t {
                statement_instr(ctx, node_list[i][].get._CS.statement)
            }
            break
            -> AST_CD_t {
                declaration_instr(ctx, node_list[i][].get._CD.declaration)
            }
            break
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
}

fn repr_block(ctx: *struc TacReprContext, node: *struc CBlock) none {
    if node[].tag == AST_CB_t {
        repr_instr_list(ctx, node[].get._CB.block_items)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn repr_fun_toplvl(ctx: *struc TacReprContext, node: *struc CFunctionDeclaration) *struc TacTopLevel {
    name: u64 = node[].name
    is_glob: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].get._FunAttr.is_glob
    params: vector_t(TIdentifier) = vec_new()
    vec_resize(params, vec_size(node[].params))
    memcpy(params, node[].params, sizeof<u64> * vec_size(node[].params))

    body: vector_t(unique_ptr_t(TacInstruction)) = vec_new()
    {
        ctx[].p_instrs = @body
        repr_block(ctx, node[].body)
        {
            constant: *struc CConst = make_CConstInt(0)
            val: *struc TacValue = make_TacConstant(@constant)
            push_instr(ctx, make_TacReturn(@val))
        }
        ctx[].p_instrs = nil
    }

    return make_TacFunction(name, is_glob, @params, @body)
}

fn push_toplvl(ctx: *struc TacReprContext, top_level: *struc TacTopLevel) none {
    vec_move_back(ctx[].p_toplvls[], top_level)
}

fn fun_decl_toplvl(ctx: *struc TacReprContext, node: *struc CFunDecl) none {
    if node[].fun_decl[].body {
        push_toplvl(ctx, repr_fun_toplvl(ctx, node[].fun_decl))
    }
}

fn declaration_toplvl(ctx: *struc TacReprContext, node: *struc CDeclaration) none {
    match node[].tag {
        -> AST_CFunDecl_t {
            fun_decl_toplvl(ctx, @node[].get._CFunDecl)
        }
        break
        -> AST_CVarDecl_t {
            -> AST_CStructDecl_t {
                break
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn tentative_static_toplvl(ctx: *struc TacReprContext, static_init_type: *struc Type) vector_t(shared_ptr_t(StaticInit)) {
    static_inits: vector_t(shared_ptr_t(StaticInit)) = vec_new()
    {
        byte: i64 = get_type_scale(ctx, static_init_type)
        static_init: *struc StaticInit = make_ZeroInit(byte)
        vec_move_back(static_inits, static_init)
    }

    return static_inits
}

fn initial_static_toplvl(node: *struc Initial) vector_t(shared_ptr_t(StaticInit)) {
    static_inits: vector_t(shared_ptr_t(StaticInit)) = vec_new()
    vec_reserve(static_inits, vec_size(node[].static_inits))
    loop i: u64 = 0 while i < vec_size(node[].static_inits) .. ++i {
        static_init: *struc StaticInit = sptr_new()
        if node[].static_inits[i] ~= static_init {
            " #@MACRO@:sptr_copy(StaticInit, node->static_inits[i], static_init)"
            free_StaticInit(@static_init)
            static_init = node[].static_inits[i]
            (static_init)[]._ref_count++
        }
        vec_move_back(static_inits, static_init)
    }
    return static_inits
}

fn repr_static_var_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    static_attr: *struc StaticAttr = @node[].attrs[].get._StaticAttr
    if static_attr[].init[].tag == AST_NoInitializer_t {
        return none
    }
    name: u64 = symbol
    is_glob: i32 = static_attr[].is_glob
    static_init_type: *struc Type = sptr_new()
    if node[].type_t ~= static_init_type {
        " #@MACRO@:sptr_copy(Type, node->type_t, static_init_type)"
        free_Type(@static_init_type)
        static_init_type = node[].type_t
        (static_init_type)[]._ref_count++
    }
    static_inits: vector_t(shared_ptr_t(StaticInit)) = vec_new()
    match static_attr[].init[].tag {
        -> AST_Tentative_t {
            static_inits = tentative_static_toplvl(ctx, static_init_type)
        }
        break
        -> AST_Initial_t {
            static_inits = initial_static_toplvl(@static_attr[].init[].get._Initial)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    push_toplvl(ctx, make_TacStaticVariable(name, is_glob, @static_init_type, @static_inits))
}

fn push_static_const_toplvl(ctx: *struc TacReprContext, static_const_toplvls: *struc TacTopLevel) none {
    vec_move_back(ctx[].p_static_consts[], static_const_toplvls)
}

fn repr_static_const_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    name: u64 = symbol
    static_init_type: *struc Type = sptr_new()
    if node[].type_t ~= static_init_type {
        " #@MACRO@:sptr_copy(Type, node->type_t, static_init_type)"
        free_Type(@static_init_type)
        static_init_type = node[].type_t
        (static_init_type)[]._ref_count++
    }
    static_init: *struc StaticInit = sptr_new()
    if node[].attrs[].get._ConstantAttr.static_init ~= static_init {
        " #@MACRO@:sptr_copy(StaticInit, node->attrs->get._ConstantAttr.static_init, static_init)"
        free_StaticInit(@static_init)
        static_init = node[].attrs[].get._ConstantAttr.static_init
        (static_init)[]._ref_count++
    }
    push_static_const_toplvl(ctx, make_TacStaticConstant(name, @static_init_type, @static_init))
}

fn symbol_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    match node[].attrs[].tag {
        -> AST_StaticAttr_t {
            repr_static_var_toplvl(ctx, node, symbol)
        }
        break
        -> AST_ConstantAttr_t {
            repr_static_const_toplvl(ctx, node, symbol)
        }
        break
        otherwise {
            break
        }
    }
}

fn repr_program(ctx: *struc TacReprContext, node: *struc CProgram) *struc TacProgram {
    fun_toplvls: vector_t(unique_ptr_t(TacTopLevel)) = vec_new()
    {
        ctx[].p_toplvls = @fun_toplvls
        loop i: u64 = 0 while i < vec_size(node[].declarations) .. ++i {
            declaration_toplvl(ctx, node[].declarations[i])
        }
        ctx[].p_toplvls = nil
    }
    static_var_toplvls: vector_t(unique_ptr_t(TacTopLevel)) = vec_new()

    static_const_toplvls: vector_t(unique_ptr_t(TacTopLevel)) = vec_new()
    {
        ctx[].p_toplvls = @static_var_toplvls
        ctx[].p_static_consts = @static_const_toplvls
        loop i: u64 = 0 while i < map_size(ctx[].frontend[].symbol_table) .. ++i {
            symbol: *pair_t(``TIdentifier'', ``UPtrSymbol'') = @ctx[].frontend[].symbol_table[i]
            symbol_toplvl(ctx, (symbol[]).value, (symbol[]).key)
        }
        ctx[].p_toplvls = nil
        ctx[].p_static_consts = nil
    }

    return make_TacProgram(@static_const_toplvls, @static_var_toplvls, @fun_toplvls)
}

pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram {
    ctx: struc TacReprContext;
    {
        ctx.frontend = frontend
        ctx.identifiers = identifiers
    }
    tac_ast: *struc TacProgram = repr_program(@ctx, c_ast[])
    free_CProgram(c_ast)
    return tac_ast
}
