m4_include(`optim_tac.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl
m4_include(`../ast/interm_ast.plx.m4')m4_dnl

type struc ControlFlowGraph;
type struc DataFlowAnalysis;
type struc DataFlowAnalysisO1;

type struc OptimTacContext(frontend: *struc FrontEndContext, is_fixed_point: i32, enabled_optims: [5]i32, cfg: *struc ControlFlowGraph, dfa: *struc DataFlowAnalysis, dfa_o1: *struc DataFlowAnalysisO1, p_instrs: ***struc TacInstruction)

m4_ifdef(`__OPTIM_LEVEL__', `', `
m4_define(`__OPTIM_LEVEL__', `1')m4_dnl
m4_undefine(`_OPTIMIZER_IMPL_OLVL_M4')m4_dnl
m4_include(`impl_olvl.plx.m4')m4_dnl
m4_undefine(`__OPTIM_LEVEL__')m4_dnl
')m4_dnl

fn fold_sign_extend_char_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_sign_extend_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_sign_extend_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_sign_extend_char_const(ctx, node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_sign_extend_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_sign_extend_instr(ctx: *struc OptimTacContext, node: *struc TacSignExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_sign_extend_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_truncate_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_long_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstLong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_ulong_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstULong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstInt_t {
            fold_constant = fold_truncate_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_truncate_long_const(ctx, node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_truncate_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_truncate_ulong_const(ctx, node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_truncate_instr(ctx: *struc OptimTacContext, node: *struc TacTruncate, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_truncate_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_zero_extend_uchar_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_zero_extend_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_zero_extend_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstUChar_t {
            fold_constant = fold_zero_extend_uchar_const(ctx, node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_zero_extend_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_zero_extend_instr(ctx: *struc OptimTacContext, node: *struc TacZeroExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_zero_extend_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_dbl_to_signed_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = sptr_new()
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].get._CConstDouble.value)
                fold_constant = make_CConstChar(value)
                break
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstInt(value)
            break
        }
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstLong(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_dbl_to_signed_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_dbl_to_signed_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_dbl_to_unsigned_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = sptr_new()
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstUChar(value)
            break
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstUInt(value)
            break
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstULong(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_dbl_to_unsigned_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToUInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_dbl_to_unsigned_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_signed_to_dbl_const(constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            value: f64 = cast<f64>(constant[].get._CConstChar.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstInt_t {
            value: f64 = cast<f64>(constant[].get._CConstInt.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstLong_t {
            value: f64 = cast<f64>(constant[].get._CConstLong.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_signed_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_signed_to_dbl_const(node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_unsigned_to_dbl_const(constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstUChar_t {
            value: f64 = cast<f64>(constant[].get._CConstUChar.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstUInt_t {
            value: f64 = cast<f64>(constant[].get._CConstUInt.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstULong_t {
            value: f64 = cast<f64>(constant[].get._CConstULong.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_unsigned_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacUIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_unsigned_to_dbl_const(node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_unary_char_const(node: *struc TacUnaryOp, constant: *struc CConstChar) *struc CConst {
    if node[].tag == AST_TacNot_t {
        value: i32 = ? not constant[].value then 1 else 0
        return make_CConstInt(value)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn fold_unary_int_const(node: *struc TacUnaryOp, constant: *struc CConstInt) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: i32 = ~constant[].value
            return make_CConstInt(value)
        }
        -> AST_TacNegate_t {
            value: i32 = -constant[].value
            return make_CConstInt(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_long_const(node: *struc TacUnaryOp, constant: *struc CConstLong) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: i64 = ~constant[].value
            return make_CConstLong(value)
        }
        -> AST_TacNegate_t {
            value: i64 = -constant[].value
            return make_CConstLong(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_dbl_const(node: *struc TacUnaryOp, constant: *struc CConstDouble) *struc CConst {
    match node[].tag {
        -> AST_TacNegate_t {
            value: f64 = -constant[].value
            return make_CConstDouble(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_uchar_const(node: *struc TacUnaryOp, constant: *struc CConstUChar) *struc CConst {
    if node[].tag == AST_TacNot_t {
        value: i32 = ? not constant[].value then 1 else 0
        return make_CConstInt(value)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn fold_unary_uint_const(node: *struc TacUnaryOp, constant: *struc CConstUInt) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: u32 = ~constant[].value
            return make_CConstUInt(value)
        }
        -> AST_TacNegate_t {
            value: u32 = -constant[].value
            return make_CConstUInt(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_ulong_const(node: *struc TacUnaryOp, constant: *struc CConstULong) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: u64 = ~constant[].value
            return make_CConstULong(value)
        }
        -> AST_TacNegate_t {
            value: u64 = -constant[].value
            return make_CConstULong(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_const(node: *struc TacUnaryOp, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_unary_char_const(node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_unary_int_const(node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_unary_long_const(node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_unary_dbl_const(node, @constant[].get._CConstDouble)
            break
        }
        -> AST_CConstUChar_t {
            fold_constant = fold_unary_uchar_const(node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_unary_uint_const(node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_unary_ulong_const(node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_unary_instr(ctx: *struc OptimTacContext, node: *struc TacUnary, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        src: *struc TacValue = fold_unary_const(@node[].unop, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_binary_int_const(node: *struc TacBinaryOp, constant_1: *struc CConstInt, constant_2: *struc CConstInt) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: i32 = constant_1[].value + constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacSubtract_t {
            value: i32 = constant_1[].value - constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacMultiply_t {
            value: i32 = constant_1[].value * constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacDivide_t {
            value: i32 = ? constant_2[].value ~= 0 then constant_1[].value / constant_2[].value else 0
            return make_CConstInt(value)
        }
        -> AST_TacRemainder_t {
            value: i32 = ? constant_2[].value ~= 0 then constant_1[].value % constant_2[].value else 0
            return make_CConstInt(value)
        }
        -> AST_TacBitAnd_t {
            value: i32 = constant_1[].value & constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitOr_t {
            value: i32 = constant_1[].value | constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitXor_t {
            value: i32 = constant_1[].value ^ constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: i32 = constant_1[].value << constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: i32 = constant_1[].value >> constant_2[].value
                return make_CConstInt(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_long_const(node: *struc TacBinaryOp, constant_1: *struc CConstLong, constant_2: *struc CConstLong) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: i64 = constant_1[].value + constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacSubtract_t {
            value: i64 = constant_1[].value - constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacMultiply_t {
            value: i64 = constant_1[].value * constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacDivide_t {
            value: i64 = ? constant_2[].value ~= 0l then constant_1[].value / constant_2[].value else 0l
            return make_CConstLong(value)
        }
        -> AST_TacRemainder_t {
            value: i64 = ? constant_2[].value ~= 0l then constant_1[].value % constant_2[].value else 0l
            return make_CConstLong(value)
        }
        -> AST_TacBitAnd_t {
            value: i64 = constant_1[].value & constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitOr_t {
            value: i64 = constant_1[].value | constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitXor_t {
            value: i64 = constant_1[].value ^ constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: i64 = constant_1[].value << constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: i64 = constant_1[].value >> constant_2[].value
                return make_CConstLong(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_dbl_const(node: *struc TacBinaryOp, constant_1: *struc CConstDouble, constant_2: *struc CConstDouble) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: f64 = constant_1[].value + constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacSubtract_t {
            value: f64 = constant_1[].value - constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacMultiply_t {
            value: f64 = constant_1[].value * constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacDivide_t {
            value: f64 = constant_1[].value / constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_uint_const(node: *struc TacBinaryOp, constant_1: *struc CConstUInt, constant_2: *struc CConstUInt) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: u32 = constant_1[].value + constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacSubtract_t {
            value: u32 = constant_1[].value - constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacMultiply_t {
            value: u32 = constant_1[].value * constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacDivide_t {
            value: u32 = ? constant_2[].value ~= 0u then constant_1[].value / constant_2[].value else 0u
            return make_CConstUInt(value)
        }
        -> AST_TacRemainder_t {
            value: u32 = ? constant_2[].value ~= 0u then constant_1[].value % constant_2[].value else 0u
            return make_CConstUInt(value)
        }
        -> AST_TacBitAnd_t {
            value: u32 = constant_1[].value & constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitOr_t {
            value: u32 = constant_1[].value | constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitXor_t {
            value: u32 = constant_1[].value ^ constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: u32 = constant_1[].value << constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: u32 = constant_1[].value >> constant_2[].value
                return make_CConstUInt(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_ulong_const(node: *struc TacBinaryOp, constant_1: *struc CConstULong, constant_2: *struc CConstULong) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: u64 = constant_1[].value + constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacSubtract_t {
            value: u64 = constant_1[].value - constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacMultiply_t {
            value: u64 = constant_1[].value * constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacDivide_t {
            value: u64 = ? constant_2[].value ~= 0ul then constant_1[].value / constant_2[].value else 0ul
            return make_CConstULong(value)
        }
        -> AST_TacRemainder_t {
            value: u64 = ? constant_2[].value ~= 0ul then constant_1[].value % constant_2[].value else 0ul
            return make_CConstULong(value)
        }
        -> AST_TacBitAnd_t {
            value: u64 = constant_1[].value & constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitOr_t {
            value: u64 = constant_1[].value | constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitXor_t {
            value: u64 = constant_1[].value ^ constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: u64 = constant_1[].value << constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: u64 = constant_1[].value >> constant_2[].value
                return make_CConstULong(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_const(node: *struc TacBinaryOp, constant_1: *struc CConst, constant_2: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = sptr_new()
    match constant_1[].tag {
        -> AST_CConstInt_t {
            fold_constant = fold_binary_int_const(node, @constant_1[].get._CConstInt, @constant_2[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_binary_long_const(node, @constant_1[].get._CConstLong, @constant_2[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_binary_dbl_const(node, @constant_1[].get._CConstDouble, @constant_2[].get._CConstDouble)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_binary_uint_const(node, @constant_1[].get._CConstUInt, @constant_2[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_binary_ulong_const(node, @constant_1[].get._CConstULong, @constant_2[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_binary_instr(ctx: *struc OptimTacContext, node: *struc TacBinary, instr_idx: u64) none {
    if node[].src1[].tag == AST_TacConstant_t and node[].src2[].tag == AST_TacConstant_t {
        src: *struc TacValue = fold_binary_const(@node[].binop, node[].src1[].get._TacConstant.constant, node[].src2[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_copy_char_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                return sptr_new()
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            return sptr_new()
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_long_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstLong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                return sptr_new()
            }
        }
        -> AST_Double_t {
            value: f64 = cast<f64>(constant[].value)
            return make_CConstDouble(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_dbl_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstDouble) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].value)
            return make_CConstLong(value)
        }
        -> AST_Double_t {
            return sptr_new()
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_uchar_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            return sptr_new()
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UInt_t {
            return sptr_new()
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_ulong_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstULong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].value)
            return make_CConstLong(value)
        }
        -> AST_Double_t {
            value: f64 = cast<f64>(constant[].value)
            return make_CConstDouble(value)
        }
        -> AST_Pointer_t {
            -> AST_ULong_t {
                return sptr_new()
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_copy_char_const(ctx, node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_copy_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_copy_long_const(ctx, node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_copy_dbl_const(ctx, node, @constant[].get._CConstDouble)
            break
        }
        -> AST_CConstUChar_t {
            fold_constant = fold_copy_uchar_const(ctx, node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_copy_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_copy_ulong_const(ctx, node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if fold_constant {
        return make_TacConstant(@fold_constant)
    }
    else {
        return sptr_new()
    }
}

fn fold_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_copy_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        if src {
            loop .. while 0 {
                " #@MACRO@:sptr_move(TacValue, src, node->src)"
                if src ~= node[].src {
                    " #@MACRO@:uptr_move(TacValue, src, node->src)"
                    free_TacValue(@node[].src)
                    node[].src = src
                    src = uptr_new()
                }
            }
            ctx[].is_fixed_point = false
        }
    }
}

fn is_const_zero(constant: *struc CConst) i32 {
    match constant[].tag {
        -> AST_CConstChar_t {
            return constant[].get._CConstChar.value == 0
        }
        -> AST_CConstInt_t {
            return constant[].get._CConstInt.value == 0
        }
        -> AST_CConstLong_t {
            return constant[].get._CConstLong.value == 0l
        }
        -> AST_CConstDouble_t {
            return constant[].get._CConstDouble.value == 0.0
        }
        -> AST_CConstUChar_t {
            return constant[].get._CConstUChar.value == 0u
        }
        -> AST_CConstUInt_t {
            return constant[].get._CConstUInt.value == 0u
        }
        -> AST_CConstULong_t {
            return constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_jmp_eq_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, instr_idx: u64) none {
    if node[].condition[].tag == AST_TacConstant_t {
        if is_const_zero(node[].condition[].get._TacConstant.constant) {
            target: u64 = node[].target
            set_instr(ctx, make_TacJump(target), instr_idx)
        }
        else {
            set_instr(ctx, uptr_new(), instr_idx)
        }
    }
}

fn fold_jmp_ne_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, instr_idx: u64) none {
    if node[].condition[].tag == AST_TacConstant_t {
        if is_const_zero(node[].condition[].get._TacConstant.constant) {
            set_instr(ctx, uptr_new(), instr_idx)
        }
        else {
            target: u64 = node[].target
            set_instr(ctx, make_TacJump(target), instr_idx)
        }
    }
}

fn fold_instr(ctx: *struc OptimTacContext, instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            fold_sign_extend_instr(ctx, @node[].get._TacSignExtend, instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            fold_truncate_instr(ctx, @node[].get._TacTruncate, instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            fold_zero_extend_instr(ctx, @node[].get._TacZeroExtend, instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            fold_dbl_to_signed_instr(ctx, @node[].get._TacDoubleToInt, instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            fold_dbl_to_unsigned_instr(ctx, @node[].get._TacDoubleToUInt, instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            fold_signed_to_dbl_instr(ctx, @node[].get._TacIntToDouble, instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            fold_unsigned_to_dbl_instr(ctx, @node[].get._TacUIntToDouble, instr_idx)
        }
        break
        -> AST_TacUnary_t {
            fold_unary_instr(ctx, @node[].get._TacUnary, instr_idx)
        }
        break
        -> AST_TacBinary_t {
            fold_binary_instr(ctx, @node[].get._TacBinary, instr_idx)
        }
        break
        -> AST_TacCopy_t {
            fold_copy_instr(ctx, @node[].get._TacCopy)
        }
        break
        -> AST_TacJumpIfZero_t {
            fold_jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero, instr_idx)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            fold_jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn fold_constants(ctx: *struc OptimTacContext) none {
    loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            fold_instr(ctx, instr_idx)
        }
    }
}

fn unreach_reachable_block(ctx: *struc OptimTacContext, block_id: u64) none;

fn unreach_succ_reachable_blocks(ctx: *struc OptimTacContext, block_id: u64) none {
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
        unreach_reachable_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[i])
    }
}

fn unreach_reachable_block(ctx: *struc OptimTacContext, block_id: u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        unreach_succ_reachable_blocks(ctx, block_id)
    }
}

fn unreach_empty_block(ctx: *struc OptimTacContext, block_id: u64) none {
    loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            set_instr(ctx, uptr_new(), instr_idx)
        }
    }
    ctx[].cfg[].blocks[block_id].size = 0
    cfg_rm_empty_block(ctx, block_id, false)
    vec_clear(ctx[].cfg[].blocks[block_id].succ_ids) # TODO GET_CFG_BLOCK(block_id).succ_ids
    ;
    vec_clear(ctx[].cfg[].blocks[block_id].pred_ids) # TODO GET_CFG_BLOCK(block_id).pred_ids
    ;
}

fn unreach_jump_instr(ctx: *struc OptimTacContext, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
        -> AST_TacJump_t {
            -> AST_TacJumpIfZero_t {
                -> AST_TacJumpIfNotZero_t {
                    cfg_rm_block_instr(ctx, ctx[].cfg[].blocks[block_id].instrs_back_idx, block_id)
                }
            }
        }
        break
        otherwise {
            break
        }
    }
}

fn unreach_jump_block(ctx: *struc OptimTacContext, block_id: u64, next_block_id: u64) none {
    if (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) == 1 and ctx[].cfg[].blocks[block_id].succ_ids[0] == next_block_id {
        unreach_jump_instr(ctx, block_id)
    }
}

fn unreach_label_instr(ctx: *struc OptimTacContext, block_id: u64) none {
    ;
    cfg_rm_block_instr(ctx, ctx[].cfg[].blocks[block_id].instrs_front_idx, block_id)
}

fn unreach_label_block(ctx: *struc OptimTacContext, block_id: u64, prev_block_id: u64) none {
    if (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) == 1 and ctx[].cfg[].blocks[block_id].pred_ids[0] == prev_block_id {
        unreach_label_instr(ctx, block_id)
    }
}

fn eliminate_unreachable_code(ctx: *struc OptimTacContext) none {
    if ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) == 0) {
        return none
    }
    if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        vec_resize(ctx[].cfg[].reaching_code, vec_size(ctx[].cfg[].blocks))
    }
    memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))
    loop i: u64 = 0 while i < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++i {
        unreach_reachable_block(ctx, ctx[].cfg[].entry_succ_ids[i])
    }
    block_id: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    next_block_id: u64 = ctx[].cfg[].exit_id
    loop while block_id-- > 0 {
        if ctx[].cfg[].reaching_code[block_id] {
            next_block_id = block_id
            break
        }
        else {
            unreach_empty_block(ctx, block_id)
        }
    }
    loop while block_id-- > 0 {
        if ctx[].cfg[].reaching_code[block_id] {
            unreach_jump_block(ctx, block_id, next_block_id)
            next_block_id = block_id
        }
        else {
            unreach_empty_block(ctx, block_id)
        }
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        label_id: u64 = (ctx[].cfg[].identifier_id_map[i]).value
        if ctx[].cfg[].reaching_code[label_id] {
            loop block_id = label_id while block_id-- > 0 {
                if ctx[].cfg[].reaching_code[block_id] {
                    next_block_id = block_id
                    jump Lelse
                }
            }
            next_block_id = ctx[].cfg[].entry_id
            label Lelse
            unreach_label_block(ctx, label_id, next_block_id)
        }
        else {
            (ctx[].cfg[].identifier_id_map[i]).value = ctx[].cfg[].exit_id
        }
    }
}

fn is_aliased_value(ctx: *struc OptimTacContext, node: *struc TacValue) i32 {
    return node[].tag == AST_TacVariable_t and is_aliased_name(ctx, node[].get._TacVariable.name)
}

fn is_const_signed(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            -> AST_CConstInt_t {
                -> AST_CConstLong_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_var_signed(ctx: *struc OptimTacContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        return true
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_value_signed(ctx: *struc OptimTacContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return is_const_signed(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return is_var_signed(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_const_null_ptr(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstInt_t {
            return node[].constant[].get._CConstInt.value == 0
        }
        -> AST_CConstLong_t {
            return node[].constant[].get._CConstLong.value == 0l
        }
        -> AST_CConstUInt_t {
            return node[].constant[].get._CConstUInt.value == 0u
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            return false
        }
    }
}

fn is_dbl_same_const(constant_1: *struc CConstDouble, constant_2: *struc CConstDouble) i32 {
    if constant_1[].value == constant_2[].value {
        if constant_1[].value ~= 0.0 {
            return true
        }
        else {
            return dbl_to_binary(constant_1[].value) == dbl_to_binary(constant_2[].value)
        }
    }
    elif constant_1[].value ~= constant_1[].value and constant_2[].value ~= constant_2[].value {
        return true
    }
    else {
        return false
    }
}

fn is_same_const(node_1: *struc TacConstant, node_2: *struc TacConstant) i32 {
    if node_1[].constant[].tag == node_2[].constant[].tag {
        match node_1[].constant[].tag {
            -> AST_CConstChar_t {
                return node_1[].constant[].get._CConstChar.value == node_2[].constant[].get._CConstChar.value
            }
            -> AST_CConstInt_t {
                return node_1[].constant[].get._CConstInt.value == node_2[].constant[].get._CConstInt.value
            }
            -> AST_CConstLong_t {
                return node_1[].constant[].get._CConstLong.value == node_2[].constant[].get._CConstLong.value
            }
            -> AST_CConstDouble_t {
                return is_dbl_same_const(@node_1[].constant[].get._CConstDouble, @node_2[].constant[].get._CConstDouble)
            }
            -> AST_CConstUChar_t {
                return node_1[].constant[].get._CConstUChar.value == node_2[].constant[].get._CConstUChar.value
            }
            -> AST_CConstUInt_t {
                return node_1[].constant[].get._CConstUInt.value == node_2[].constant[].get._CConstUInt.value
            }
            -> AST_CConstULong_t {
                return node_1[].constant[].get._CConstULong.value == node_2[].constant[].get._CConstULong.value
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    return false
}

fn is_same_var(node_1: *struc TacVariable, node_2: *struc TacVariable) i32 {
    return node_1[].name == node_2[].name
}

fn is_same_value(node_1: *struc TacValue, node_2: *struc TacValue) i32 {
    if node_1[].tag == node_2[].tag {
        match node_1[].tag {
            -> AST_TacConstant_t {
                return is_same_const(@node_1[].get._TacConstant, @node_2[].get._TacConstant)
            }
            -> AST_TacVariable_t {
                return is_same_var(@node_1[].get._TacVariable, @node_2[].get._TacVariable)
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    return false
}

fn is_same_name(node: *struc TacValue, name: u64) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return false
        }
        -> AST_TacVariable_t {
            return node[].get._TacVariable.name == name
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_copy_same_signedness(ctx: *struc OptimTacContext, node: *struc TacCopy) i32 {
    return is_value_signed(ctx, node[].src) == is_value_signed(ctx, node[].dst)
}

fn is_copy_null_ptr(ctx: *struc OptimTacContext, node: *struc TacCopy) i32 {
    if node[].src[].tag == AST_TacConstant_t and node[].dst[].tag == AST_TacVariable_t and ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].dst[].get._TacVariable.name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Pointer_t {
        return is_const_null_ptr(@node[].src[].get._TacConstant)
    }
    else {
        return false
    }
}

fn prop_transfer_dst_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_same_value(node, copy[].src) or is_same_value(node, copy[].dst) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_call(ctx: *struc OptimTacContext, node: *struc TacFunCall, next_instr_idx: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_aliased_value(ctx, copy[].src) or is_aliased_value(ctx, copy[].dst) or (node[].dst and (is_same_value(node[].dst, copy[].src) or is_same_value(node[].dst, copy[].dst))) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_copy(ctx: *struc OptimTacContext, node: *struc TacCopy, next_instr_idx: u64) i32 {
    ;
    loop i: u64 = 0 while i < ctx[].dfa[].set_size .. ++i {
        ;
        copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
        ;
        if is_same_value(node[].dst, copy[].dst) {
            if (is_copy_same_signedness(ctx, copy) or is_copy_null_ptr(ctx, copy)) and is_same_value(node[].src, copy[].src) {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
            }
            else {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
            }
        }
        elif mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
            if is_same_value(node[].dst, copy[].src) {
                if is_same_value(node[].src, copy[].dst) {
                    return false
                }
                else {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                }
            }
        }
    }
    return true
}

fn prop_transfer_store(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_aliased_value(ctx, copy[].src) or is_aliased_value(ctx, copy[].dst) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_cp_to_offset(ctx: *struc OptimTacContext, node: *struc TacCopyToOffset, next_instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_same_name(copy[].src, node[].dst_name) or is_same_name(copy[].dst, node[].dst_name) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_reach_copies(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) i32 {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            prop_transfer_dst_value(ctx, node[].get._TacSignExtend.dst, next_instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            prop_transfer_dst_value(ctx, node[].get._TacTruncate.dst, next_instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            prop_transfer_dst_value(ctx, node[].get._TacZeroExtend.dst, next_instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            prop_transfer_dst_value(ctx, node[].get._TacDoubleToInt.dst, next_instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            prop_transfer_dst_value(ctx, node[].get._TacDoubleToUInt.dst, next_instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            prop_transfer_dst_value(ctx, node[].get._TacIntToDouble.dst, next_instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            prop_transfer_dst_value(ctx, node[].get._TacUIntToDouble.dst, next_instr_idx)
        }
        break
        -> AST_TacFunCall_t {
            prop_transfer_call(ctx, @node[].get._TacFunCall, next_instr_idx)
        }
        break
        -> AST_TacUnary_t {
            prop_transfer_dst_value(ctx, node[].get._TacUnary.dst, next_instr_idx)
        }
        break
        -> AST_TacBinary_t {
            prop_transfer_dst_value(ctx, node[].get._TacBinary.dst, next_instr_idx)
        }
        break
        -> AST_TacCopy_t {
            return prop_transfer_copy(ctx, @node[].get._TacCopy, next_instr_idx)
        }
        -> AST_TacGetAddress_t {
            prop_transfer_dst_value(ctx, node[].get._TacGetAddress.dst, next_instr_idx)
        }
        break
        -> AST_TacLoad_t {
            prop_transfer_dst_value(ctx, node[].get._TacLoad.dst, next_instr_idx)
        }
        break
        -> AST_TacStore_t {
            prop_transfer_store(ctx, next_instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            prop_transfer_dst_value(ctx, node[].get._TacAddPtr.dst, next_instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            prop_transfer_cp_to_offset(ctx, @node[].get._TacCopyToOffset, next_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            prop_transfer_dst_value(ctx, node[].get._TacCopyFromOffset.dst, next_instr_idx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return true
}

fn get_dfa_bak_copy_instr(ctx: *struc OptimTacContext, i: u64) *struc TacCopy {
    node: *struc TacInstruction = get_dfa_bak_instr(ctx, i)
    ;
    return @node[].get._TacCopy
}

fn set_dfa_bak_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64) none {
    i: u64;
    if set_dfa_bak_instr(ctx, instr_idx, @i) {
        src: *struc TacValue = sptr_new()
        if node[].src ~= src {
            " #@MACRO@:sptr_copy(TacValue, node->src, src)"
            free_TacValue(@src)
            src = node[].src
            (src)[]._ref_count++
        }
        ;
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            " #@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        free_TacInstruction(@ctx[].dfa_o1[].bak_instrs[i])
        ctx[].dfa_o1[].bak_instrs[i] = make_TacCopy(@src, @dst)
    }
}

fn prop_ret_instr(ctx: *struc OptimTacContext, node: *struc TacReturn, incoming_idx: u64, exit_block: i32) none {
    if node[].val and node[].val[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].val, copy[].dst) {
                        if copy[].src ~= node[].val {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->val)"
                            free_TacValue(@node[].val)
                            node[].val = copy[].src
                            (node[].val)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_sign_extend_instr(ctx: *struc OptimTacContext, node: *struc TacSignExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_truncate_instr(ctx: *struc OptimTacContext, node: *struc TacTruncate, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_zero_extend_instr(ctx: *struc OptimTacContext, node: *struc TacZeroExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_dbl_to_int_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_dbl_to_uint_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToUInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_int_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_uint_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacUIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_call_instr(ctx: *struc OptimTacContext, node: *struc TacFunCall, instr_idx: u64) none {
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        if node[].args[i][].tag == AST_TacVariable_t {
            j: u64 = 0
            loop k: u64 = 0 while k < ctx[].dfa[].mask_size .. ++k {
                if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (k)] == 0ul {
                    j += 64
                    continue
                }
                mask_set_size: u64 = j + 64
                if mask_set_size > ctx[].dfa[].set_size {
                    mask_set_size = ctx[].dfa[].set_size
                }
                loop  while j < mask_set_size .. ++j {
                    if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
                        copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, j)
                        ;
                        if is_same_value(node[].args[i], copy[].dst) {
                            if copy[].src ~= node[].args[i] {
                                " #@MACRO@:sptr_copy(TacValue, copy->src, node->args[i])"
                                free_TacValue(@node[].args[i])
                                node[].args[i] = copy[].src
                                (node[].args[i])[]._ref_count++
                            }
                            ;
                            ctx[].is_fixed_point = false
                            jump Lbreak
                        }
                    }
                }
            }
            label Lbreak
            ;
        }
    }
}

fn prop_unary_instr(ctx: *struc OptimTacContext, node: *struc TacUnary, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_binary_instr(ctx: *struc OptimTacContext, node: *struc TacBinary, instr_idx: u64) none {
    is_src1: i32 = node[].src1[].tag == AST_TacVariable_t
    is_src2: i32 = node[].src2[].tag == AST_TacVariable_t
    if is_src1 or is_src2 {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_src1 and is_same_value(node[].src1, copy[].dst) {
                        if copy[].src ~= node[].src1 {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src1)"
                            free_TacValue(@node[].src1)
                            node[].src1 = copy[].src
                            (node[].src1)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src1 = false
                        if not is_src2 {
                            return none
                        }
                    }
                    if is_src2 and is_same_value(node[].src2, copy[].dst) {
                        if copy[].src ~= node[].src2 {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src2)"
                            free_TacValue(@node[].src2)
                            node[].src2 = copy[].src
                            (node[].src2)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src2 = false
                        if not is_src1 {
                            return none
                        }
                    }
                }
            }
        }
    }
}

fn prop_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64, block_id: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                ;
                if ctx[].dfa_o1[].data_idx_map[i] == instr_idx or (is_same_value(node[].src, copy[].dst) and is_same_value(node[].dst, copy[].src)) {
                    set_dfa_bak_copy_instr(ctx, node, instr_idx)
                    cfg_rm_block_instr(ctx, instr_idx, block_id)
                    return none
                }
                elif is_same_value(node[].src, copy[].dst) {
                    set_dfa_bak_copy_instr(ctx, node, instr_idx)
                    if copy[].src ~= node[].src {
                        " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                        free_TacValue(@node[].src)
                        node[].src = copy[].src
                        (node[].src)[]._ref_count++
                    }
                    ;
                    ctx[].is_fixed_point = false
                    return none
                }
            }
        }
    }
}

fn prop_load_instr(ctx: *struc OptimTacContext, node: *struc TacLoad, instr_idx: u64) none {
    if node[].src_ptr[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src_ptr, copy[].dst) {
                        if copy[].src ~= node[].src_ptr {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src_ptr)"
                            free_TacValue(@node[].src_ptr)
                            node[].src_ptr = copy[].src
                            (node[].src_ptr)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_store_instr(ctx: *struc OptimTacContext, node: *struc TacStore, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_add_ptr_instr(ctx: *struc OptimTacContext, node: *struc TacAddPtr, instr_idx: u64) none {
    is_src_ptr: i32 = node[].src_ptr[].tag == AST_TacVariable_t
    is_idx: i32 = node[].idx[].tag == AST_TacVariable_t
    if is_src_ptr or is_idx {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_src_ptr and is_same_value(node[].src_ptr, copy[].dst) {
                        if copy[].src ~= node[].src_ptr {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src_ptr)"
                            free_TacValue(@node[].src_ptr)
                            node[].src_ptr = copy[].src
                            (node[].src_ptr)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src_ptr = false
                        if not is_idx {
                            return none
                        }
                    }
                    if is_idx and is_same_value(node[].idx, copy[].dst) {
                        if copy[].src ~= node[].idx {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->idx)"
                            free_TacValue(@node[].idx)
                            node[].idx = copy[].src
                            (node[].idx)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_idx = false
                        if not is_src_ptr {
                            return none
                        }
                    }
                }
            }
        }
    }
}

fn prop_cp_to_offset_instr(ctx: *struc OptimTacContext, node: *struc TacCopyToOffset, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_cp_from_offset_instr(ctx: *struc OptimTacContext, node: *struc TacCopyFromOffset, instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                ;
                if is_same_name(copy[].dst, node[].src_name) {
                    ;
                    node[].src_name = copy[].src[].get._TacVariable.name
                    ctx[].is_fixed_point = false
                    return none
                }
            }
        }
    }
}

fn prop_jmp_eq_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, incoming_idx: u64, exit_block: u64) none {
    if node[].condition[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].condition, copy[].dst) {
                        if copy[].src ~= node[].condition {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->condition)"
                            free_TacValue(@node[].condition)
                            node[].condition = copy[].src
                            (node[].condition)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_jmp_ne_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, incoming_idx: u64, exit_block: u64) none {
    if node[].condition[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].condition, copy[].dst) {
                        if copy[].src ~= node[].condition {
                            " #@MACRO@:sptr_copy(TacValue, copy->src, node->condition)"
                            free_TacValue(@node[].condition)
                            node[].condition = copy[].src
                            (node[].condition)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_instr(ctx: *struc OptimTacContext, instr_idx: u64, copy_instr_idx: u64, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            prop_ret_instr(ctx, @node[].get._TacReturn, copy_instr_idx, block_id > 0)
        }
        break
        -> AST_TacSignExtend_t {
            prop_sign_extend_instr(ctx, @node[].get._TacSignExtend, copy_instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            prop_truncate_instr(ctx, @node[].get._TacTruncate, copy_instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            prop_zero_extend_instr(ctx, @node[].get._TacZeroExtend, copy_instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            prop_dbl_to_int_instr(ctx, @node[].get._TacDoubleToInt, copy_instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            prop_dbl_to_uint_instr(ctx, @node[].get._TacDoubleToUInt, copy_instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            prop_int_to_dbl_instr(ctx, @node[].get._TacIntToDouble, copy_instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            prop_uint_to_dbl_instr(ctx, @node[].get._TacUIntToDouble, copy_instr_idx)
        }
        break
        -> AST_TacFunCall_t {
            prop_call_instr(ctx, @node[].get._TacFunCall, copy_instr_idx)
        }
        break
        -> AST_TacUnary_t {
            prop_unary_instr(ctx, @node[].get._TacUnary, copy_instr_idx)
        }
        break
        -> AST_TacBinary_t {
            prop_binary_instr(ctx, @node[].get._TacBinary, copy_instr_idx)
        }
        break
        -> AST_TacCopy_t {
            prop_copy_instr(ctx, @node[].get._TacCopy, copy_instr_idx, block_id)
        }
        break
        -> AST_TacLoad_t {
            prop_load_instr(ctx, @node[].get._TacLoad, copy_instr_idx)
        }
        break
        -> AST_TacStore_t {
            prop_store_instr(ctx, @node[].get._TacStore, copy_instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            prop_add_ptr_instr(ctx, @node[].get._TacAddPtr, copy_instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            prop_cp_to_offset_instr(ctx, @node[].get._TacCopyToOffset, copy_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            prop_cp_from_offset_instr(ctx, @node[].get._TacCopyFromOffset, copy_instr_idx)
        }
        break
        -> AST_TacJumpIfZero_t {
            prop_jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero, copy_instr_idx, block_id > 0)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            prop_jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero, copy_instr_idx, block_id > 0)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn propagate_copies(ctx: *struc OptimTacContext) none {
    if not init_data_flow_analysis(ctx, false, true) {
        return none
    }
    dfa_forward_iter_alg(ctx)
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            incoming_idx: u64 = block_id
            exit_block: u64 = 1
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1 while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    match (ctx[].p_instrs[])[instr_idx][].tag {
                        -> AST_TacReturn_t {
                            -> AST_TacJumpIfZero_t {
                                -> AST_TacJumpIfNotZero_t {
                                    prop_instr(ctx, instr_idx, incoming_idx, exit_block)
                                }
                            }
                        }
                        break
                        -> AST_TacSignExtend_t {
                            -> AST_TacTruncate_t {
                                -> AST_TacZeroExtend_t {
                                    -> AST_TacDoubleToInt_t {
                                        -> AST_TacDoubleToUInt_t {
                                            -> AST_TacIntToDouble_t {
                                                -> AST_TacUIntToDouble_t {
                                                    -> AST_TacFunCall_t {
                                                        -> AST_TacUnary_t {
                                                            -> AST_TacBinary_t {
                                                                -> AST_TacCopy_t {
                                                                    -> AST_TacLoad_t {
                                                                        -> AST_TacStore_t {
                                                                            -> AST_TacAddPtr_t {
                                                                                -> AST_TacCopyToOffset_t {
                                                                                    -> AST_TacCopyFromOffset_t {
                                                                                        prop_instr(ctx, instr_idx, instr_idx, block_id)
                                                                                        incoming_idx = instr_idx
                                                                                        exit_block = 0
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
                                        }
                                    }
                                }
                            }
                        }
                        -> AST_TacGetAddress_t {
                            incoming_idx = instr_idx
                            exit_block = 0
                            break
                        }
                        otherwise {
                            break
                        }
                    }
                }
            }
        }
    }
}

fn elim_transfer_addressed(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)]
    }
}

fn elim_transfer_aliased(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)]
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)]
    }
}

fn elim_transfer_src_name(ctx: *struc OptimTacContext, name: u64, next_instr_idx: u64) none {
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
}

fn elim_transfer_src_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    if node[].tag == AST_TacVariable_t {
        elim_transfer_src_name(ctx, node[].get._TacVariable.name, next_instr_idx)
    }
}

fn elim_transfer_dst_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    ;
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].get._TacVariable.name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
}

fn elim_transfer_live_values(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            p_node: *struc TacReturn = @node[].get._TacReturn
            if p_node[].val {
                elim_transfer_src_value(ctx, p_node[].val, next_instr_idx)
            }
            break
        }
        -> AST_TacSignExtend_t {
            p_node: *struc TacSignExtend = @node[].get._TacSignExtend
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacTruncate_t {
            p_node: *struc TacTruncate = @node[].get._TacTruncate
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacZeroExtend_t {
            p_node: *struc TacZeroExtend = @node[].get._TacZeroExtend
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacDoubleToInt_t {
            p_node: *struc TacDoubleToInt = @node[].get._TacDoubleToInt
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacDoubleToUInt_t {
            p_node: *struc TacDoubleToUInt = @node[].get._TacDoubleToUInt
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacIntToDouble_t {
            p_node: *struc TacIntToDouble = @node[].get._TacIntToDouble
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacUIntToDouble_t {
            p_node: *struc TacUIntToDouble = @node[].get._TacUIntToDouble
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacFunCall_t {
            p_node: *struc TacFunCall = @node[].get._TacFunCall
            if p_node[].dst {
                elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            }
            loop i: u64 = 0 while i < (? (p_node[].args) then (cast<*struc stbds_array_header>((p_node[].args)) - 1)[].length else 0) .. ++i {
                elim_transfer_src_value(ctx, p_node[].args[i], next_instr_idx)
            }
            elim_transfer_aliased(ctx, next_instr_idx)
            break
        }
        -> AST_TacUnary_t {
            p_node: *struc TacUnary = @node[].get._TacUnary
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacBinary_t {
            p_node: *struc TacBinary = @node[].get._TacBinary
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src1, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src2, next_instr_idx)
            break
        }
        -> AST_TacCopy_t {
            p_node: *struc TacCopy = @node[].get._TacCopy
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacGetAddress_t {
            elim_transfer_dst_value(ctx, node[].get._TacGetAddress.dst, next_instr_idx)
        }
        break
        -> AST_TacLoad_t {
            p_node: *struc TacLoad = @node[].get._TacLoad
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src_ptr, next_instr_idx)
            elim_transfer_addressed(ctx, next_instr_idx)
            break
        }
        -> AST_TacStore_t {
            p_node: *struc TacStore = @node[].get._TacStore
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].dst_ptr, next_instr_idx)
            break
        }
        -> AST_TacAddPtr_t {
            p_node: *struc TacAddPtr = @node[].get._TacAddPtr
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src_ptr, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].idx, next_instr_idx)
            break
        }
        -> AST_TacCopyToOffset_t {
            elim_transfer_src_value(ctx, node[].get._TacCopyToOffset.src, next_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            p_node: *struc TacCopyFromOffset = @node[].get._TacCopyFromOffset
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_name(ctx, p_node[].src_name, next_instr_idx)
            break
        }
        -> AST_TacJumpIfZero_t {
            elim_transfer_src_value(ctx, node[].get._TacJumpIfZero.condition, next_instr_idx)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            elim_transfer_src_value(ctx, node[].get._TacJumpIfNotZero.condition, next_instr_idx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn elim_dst_name_instr(ctx: *struc OptimTacContext, name: u64, instr_idx: u64) none {
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    if not mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
        set_instr(ctx, uptr_new(), instr_idx)
    }
}

fn elim_dst_value_instr(ctx: *struc OptimTacContext, node: *struc TacValue, instr_idx: u64) none {
    ;
    elim_dst_name_instr(ctx, node[].get._TacVariable.name, instr_idx)
}

fn elim_instr(ctx: *struc OptimTacContext, instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            elim_dst_value_instr(ctx, node[].get._TacSignExtend.dst, instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            elim_dst_value_instr(ctx, node[].get._TacTruncate.dst, instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            elim_dst_value_instr(ctx, node[].get._TacZeroExtend.dst, instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            elim_dst_value_instr(ctx, node[].get._TacDoubleToInt.dst, instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            elim_dst_value_instr(ctx, node[].get._TacDoubleToUInt.dst, instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            elim_dst_value_instr(ctx, node[].get._TacIntToDouble.dst, instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            elim_dst_value_instr(ctx, node[].get._TacUIntToDouble.dst, instr_idx)
        }
        break
        -> AST_TacUnary_t {
            elim_dst_value_instr(ctx, node[].get._TacUnary.dst, instr_idx)
        }
        break
        -> AST_TacBinary_t {
            elim_dst_value_instr(ctx, node[].get._TacBinary.dst, instr_idx)
        }
        break
        -> AST_TacCopy_t {
            elim_dst_value_instr(ctx, node[].get._TacCopy.dst, instr_idx)
        }
        break
        -> AST_TacGetAddress_t {
            elim_dst_value_instr(ctx, node[].get._TacGetAddress.dst, instr_idx)
        }
        break
        -> AST_TacLoad_t {
            elim_dst_value_instr(ctx, node[].get._TacLoad.dst, instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            elim_dst_value_instr(ctx, node[].get._TacAddPtr.dst, instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            elim_dst_name_instr(ctx, node[].get._TacCopyToOffset.dst_name, instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            elim_dst_value_instr(ctx, node[].get._TacCopyFromOffset.dst, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn eliminate_dead_stores(ctx: *struc OptimTacContext, is_addressed_set: i32) none {
    if not init_data_flow_analysis(ctx, true, is_addressed_set) {
        return none
    }
    dfa_iter_alg(ctx)
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    elim_instr(ctx, instr_idx)
                }
            }
        }
    }
}

m4_define(`CONSTANT_FOLDING', `0')m4_dnl
m4_define(`COPY_PROPAGATION', `1')m4_dnl
m4_define(`UNREACHABLE_CODE_ELIMINATION', `2')m4_dnl
m4_define(`DEAD_STORE_ELIMINATION', `3')m4_dnl
m4_define(`CONTROL_FLOW_GRAPH', `4')m4_dnl

fn optim_fun_toplvl(ctx: *struc OptimTacContext, node: *struc TacFunction) none {
    ctx[].p_instrs = @node[].body
    loop .. while not ctx[].is_fixed_point {
        ctx[].is_fixed_point = true
        if ctx[].enabled_optims[CONSTANT_FOLDING] {
            fold_constants(ctx)
        }
        if ctx[].enabled_optims[CONTROL_FLOW_GRAPH] {
            init_control_flow_graph(ctx)
            if ctx[].enabled_optims[UNREACHABLE_CODE_ELIMINATION] {
                eliminate_unreachable_code(ctx)
            }
            if ctx[].enabled_optims[COPY_PROPAGATION] {
                propagate_copies(ctx)
            }
            if ctx[].enabled_optims[DEAD_STORE_ELIMINATION] {
                eliminate_dead_stores(ctx, not ctx[].enabled_optims[COPY_PROPAGATION])
            }
        }
    }
    ctx[].p_instrs = nil
}

fn optim_toplvl(ctx: *struc OptimTacContext, node: *struc TacTopLevel) none {
    if node[].tag == AST_TacFunction_t {
        optim_fun_toplvl(ctx, @node[].get._TacFunction)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn optim_program(ctx: *struc OptimTacContext, node: *struc TacProgram) none {
    loop i: u64 = 0 while i < (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0) .. ++i {
        optim_toplvl(ctx, node[].fun_toplvls[i])
    }
    loop .. while 0 {
        " #@MACRO@:set_clear(ctx->frontend->addressed_set)"
        loop .. while 0 {
            " #@MACRO@:map_clear(ctx->frontend->addressed_set)"
            if ctx[].frontend[].addressed_set {
                " #@MACRO@:map_delete(ctx->frontend->addressed_set)"
                loop .. while 0 {
                    cast<none>((? (ctx[].frontend[].addressed_set) ~= nil then stbds_hmfree_func((ctx[].frontend[].addressed_set) - 1, sizeof((ctx[].frontend[].addressed_set)[])) else cast<none>(0)))
                    (ctx[].frontend[].addressed_set) = nil
                }
                ctx[].frontend[].addressed_set = map_new()
            }
            ;
        }
    }
}

pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none {
    ctx: struc OptimTacContext;
    {
        ctx.frontend = frontend
        ctx.is_fixed_point = true
        ctx.enabled_optims[CONSTANT_FOLDING] = (optim_1_mask & ((cast<u8>(1u)) << 0)) > 0
        ctx.enabled_optims[COPY_PROPAGATION] = (optim_1_mask & ((cast<u8>(1u)) << 1)) > 0
        ctx.enabled_optims[UNREACHABLE_CODE_ELIMINATION] = (optim_1_mask & ((cast<u8>(1u)) << 2)) > 0
        ctx.enabled_optims[DEAD_STORE_ELIMINATION] = (optim_1_mask & ((cast<u8>(1u)) << 3)) > 0
        ctx.enabled_optims[CONTROL_FLOW_GRAPH] = (optim_1_mask & ~((cast<u8>(1u)) << 0)) > 0
        ctx.cfg = uptr_new()
        ctx.dfa = uptr_new()
        ctx.dfa_o1 = uptr_new()
        if ctx.enabled_optims[CONTROL_FLOW_GRAPH] {
            ctx.cfg = make_ControlFlowGraph()
            if ctx.enabled_optims[COPY_PROPAGATION] or ctx.enabled_optims[DEAD_STORE_ELIMINATION] {
                ctx.dfa = make_DataFlowAnalysis()
                ctx.dfa_o1 = make_DataFlowAnalysisO1()
            }
        }
    }

    optim_program(@ctx, node)
    free_ControlFlowGraph(@ctx.cfg)
    free_DataFlowAnalysis(@ctx.dfa)
    free_DataFlowAnalysisO1(@ctx.dfa_o1)
}
