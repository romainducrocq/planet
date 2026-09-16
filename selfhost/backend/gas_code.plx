m4_include(`gas_code.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/fileio.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl

type struc GasCodeContext(backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext)

m4_define(`Ctx', `TODO')m4_dnl
m4_define(`LF', `TODO')m4_dnl
m4_define(`TAB', `TODO')m4_dnl
m4_define(`LBL', `TODO')m4_dnl
m4_define(`LBL', `TODO')m4_dnl

fn emit(ctx: *struc GasCodeContext, code: string) none {
    write_buffer(ctx[].fileio, code)
}

fn emit_identifier(ctx: *struc GasCodeContext, identifier: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((identifier))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}

fn emit_string(ctx: *struc GasCodeContext, string_const: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((string_const))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}

fn emit_char(ctx: *struc GasCodeContext, value: i8) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        "@MACRO@:str_delete(strto_value)"
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_int(ctx: *struc GasCodeContext, value: i32) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        "@MACRO@:str_delete(strto_value)"
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_long(ctx: *struc GasCodeContext, value: i64) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        "@MACRO@:str_delete(strto_value)"
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_dbl(ctx: *struc GasCodeContext, dbl_const: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((dbl_const))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}

fn emit_uchar(ctx: *struc GasCodeContext, value: u8) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        "@MACRO@:str_delete(strto_value)"
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_uint(ctx: *struc GasCodeContext, value: u32) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        "@MACRO@:str_delete(strto_value)"
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_ulong(ctx: *struc GasCodeContext, value: u64) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        "@MACRO@:str_delete(strto_value)"
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn get_reg_rsp_sse(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmSp_t {
            return "%rsp"
        }
        -> AST_AsmBp_t {
            return "%rbp"
        }
        -> AST_AsmXMM0_t {
            return "%xmm0"
        }
        -> AST_AsmXMM1_t {
            return "%xmm1"
        }
        -> AST_AsmXMM2_t {
            return "%xmm2"
        }
        -> AST_AsmXMM3_t {
            return "%xmm3"
        }
        -> AST_AsmXMM4_t {
            return "%xmm4"
        }
        -> AST_AsmXMM5_t {
            return "%xmm5"
        }
        -> AST_AsmXMM6_t {
            return "%xmm6"
        }
        -> AST_AsmXMM7_t {
            return "%xmm7"
        }
        -> AST_AsmXMM8_t {
            return "%xmm8"
        }
        -> AST_AsmXMM9_t {
            return "%xmm9"
        }
        -> AST_AsmXMM10_t {
            return "%xmm10"
        }
        -> AST_AsmXMM11_t {
            return "%xmm11"
        }
        -> AST_AsmXMM12_t {
            return "%xmm12"
        }
        -> AST_AsmXMM13_t {
            return "%xmm13"
        }
        -> AST_AsmXMM14_t {
            return "%xmm14"
        }
        -> AST_AsmXMM15_t {
            return "%xmm15"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_reg_1b(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmAx_t {
            return "%al"
        }
        -> AST_AsmBx_t {
            return "%bl"
        }
        -> AST_AsmDx_t {
            return "%dl"
        }
        -> AST_AsmCx_t {
            return "%cl"
        }
        -> AST_AsmDi_t {
            return "%dil"
        }
        -> AST_AsmSi_t {
            return "%sil"
        }
        -> AST_AsmR8_t {
            return "%r8b"
        }
        -> AST_AsmR9_t {
            return "%r9b"
        }
        -> AST_AsmR10_t {
            return "%r10b"
        }
        -> AST_AsmR11_t {
            return "%r11b"
        }
        -> AST_AsmR12_t {
            return "%r12b"
        }
        -> AST_AsmR13_t {
            return "%r13b"
        }
        -> AST_AsmR14_t {
            return "%r14b"
        }
        -> AST_AsmR15_t {
            return "%r15b"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}

fn get_reg_4b(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmAx_t {
            return "%eax"
        }
        -> AST_AsmBx_t {
            return "%ebx"
        }
        -> AST_AsmDx_t {
            return "%edx"
        }
        -> AST_AsmCx_t {
            return "%ecx"
        }
        -> AST_AsmDi_t {
            return "%edi"
        }
        -> AST_AsmSi_t {
            return "%esi"
        }
        -> AST_AsmR8_t {
            return "%r8d"
        }
        -> AST_AsmR9_t {
            return "%r9d"
        }
        -> AST_AsmR10_t {
            return "%r10d"
        }
        -> AST_AsmR11_t {
            return "%r11d"
        }
        -> AST_AsmR12_t {
            return "%r12d"
        }
        -> AST_AsmR13_t {
            return "%r13d"
        }
        -> AST_AsmR14_t {
            return "%r14d"
        }
        -> AST_AsmR15_t {
            return "%r15d"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}

fn get_reg_8b(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmAx_t {
            return "%rax"
        }
        -> AST_AsmBx_t {
            return "%rbx"
        }
        -> AST_AsmDx_t {
            return "%rdx"
        }
        -> AST_AsmCx_t {
            return "%rcx"
        }
        -> AST_AsmDi_t {
            return "%rdi"
        }
        -> AST_AsmSi_t {
            return "%rsi"
        }
        -> AST_AsmR8_t {
            return "%r8"
        }
        -> AST_AsmR9_t {
            return "%r9"
        }
        -> AST_AsmR10_t {
            return "%r10"
        }
        -> AST_AsmR11_t {
            return "%r11"
        }
        -> AST_AsmR12_t {
            return "%r12"
        }
        -> AST_AsmR13_t {
            return "%r13"
        }
        -> AST_AsmR14_t {
            return "%r14"
        }
        -> AST_AsmR15_t {
            return "%r15"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}

fn get_cond_code(node: *struc AsmCondCode) string {
    match node[].tag {
        -> AST_AsmE_t {
            return "e"
        }
        -> AST_AsmNE_t {
            return "ne"
        }
        -> AST_AsmL_t {
            return "l"
        }
        -> AST_AsmLE_t {
            return "le"
        }
        -> AST_AsmG_t {
            return "g"
        }
        -> AST_AsmGE_t {
            return "ge"
        }
        -> AST_AsmB_t {
            return "b"
        }
        -> AST_AsmBE_t {
            return "be"
        }
        -> AST_AsmA_t {
            return "a"
        }
        -> AST_AsmAE_t {
            return "ae"
        }
        -> AST_AsmP_t {
            return "p"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn type_align_bytes(node: *struc AssemblyType) i32 {
    match node[].tag {
        -> AST_Byte_t {
            return 1
        }
        -> AST_LongWord_t {
            return 4
        }
        -> AST_QuadWord_t {
            -> AST_BackendDouble_t {
                return 8
            }
        }
        -> AST_ByteArray_t {
            return node[].get._ByteArray.alignment
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_type_suffix(node: *struc AssemblyType, is_packed: i32) string {
    match node[].tag {
        -> AST_Byte_t {
            return "b"
        }
        -> AST_LongWord_t {
            return "l"
        }
        -> AST_QuadWord_t {
            return "q"
        }
        -> AST_BackendDouble_t {
            return ? is_packed then "pd" else "sd"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn imm_op(ctx: *struc GasCodeContext, node: *struc AsmImm) none {
    emit(ctx, "$")
    if node[].is_neg {
        emit_long(ctx, cast<i64>(node[].value))
    }
    else {
        emit_ulong(ctx, node[].value)
    }
}

fn reg_op(ctx: *struc GasCodeContext, node: *struc AsmRegister, byte: i32) none {
    match byte {
        -> 1 {
            emit(ctx, get_reg_1b(@node[].reg))
        }
        break
        -> 4 {
            emit(ctx, get_reg_4b(@node[].reg))
        }
        break
        -> 8 {
            emit(ctx, get_reg_8b(@node[].reg))
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn memory_op(ctx: *struc GasCodeContext, node: *struc AsmMemory) none {
    if node[].value ~= 0l {
        emit_long(ctx, node[].value)
    }
    emit(ctx, "(")
    emit(ctx, get_reg_8b(@node[].reg))
    emit(ctx, ")")
}

fn data_op(ctx: *struc GasCodeContext, node: *struc AsmData) none {
    map_it: i64 = (? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        backend_obj_symbol: *struc BackendSymbol = (ctx[].backend[].symbol_table[map_it]).value
        if backend_obj_symbol[].tag == AST_BackendObj_t and backend_obj_symbol[].get._BackendObj.is_const {
            emit(ctx, ".L")
        }
    }
    emit_identifier(ctx, node[].name)
    if node[].offset ~= 0l {
        emit(ctx, "+")
        emit_long(ctx, node[].offset)
    }
    emit(ctx, "(%rip)")
}

fn indexed_op(ctx: *struc GasCodeContext, node: *struc AsmIndexed) none {
    emit(ctx, "(")
    emit(ctx, get_reg_8b(@node[].reg_base))
    emit(ctx, ", ")
    emit(ctx, get_reg_8b(@node[].reg_index))
    emit(ctx, ", ")
    emit_long(ctx, node[].scale)
    emit(ctx, ")")
}

fn emit_op(ctx: *struc GasCodeContext, node: *struc AsmOperand, byte: i32) none {
    match node[].tag {
        -> AST_AsmImm_t {
            imm_op(ctx, @node[].get._AsmImm)
        }
        break
        -> AST_AsmRegister_t {
            reg_op(ctx, @node[].get._AsmRegister, byte)
        }
        break
        -> AST_AsmMemory_t {
            memory_op(ctx, @node[].get._AsmMemory)
        }
        break
        -> AST_AsmData_t {
            data_op(ctx, @node[].get._AsmData)
        }
        break
        -> AST_AsmIndexed_t {
            indexed_op(ctx, @node[].get._AsmIndexed)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_unop(node: *struc AsmUnaryOp) string {
    match node[].tag {
        -> AST_AsmNeg_t {
            return "neg"
        }
        -> AST_AsmNot_t {
            return "not"
        }
        -> AST_AsmShr_t {
            return "shr"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_binop(node: *struc AsmBinaryOp, is_dbl: i32) string {
    match node[].tag {
        -> AST_AsmAdd_t {
            return "add"
        }
        -> AST_AsmSub_t {
            return "sub"
        }
        -> AST_AsmMult_t {
            return ? is_dbl then "mul" else "imul"
        }
        -> AST_AsmDivDouble_t {
            return "div"
        }
        -> AST_AsmBitAnd_t {
            return "and"
        }
        -> AST_AsmBitOr_t {
            return "or"
        }
        -> AST_AsmBitXor_t {
            return "xor"
        }
        -> AST_AsmBitShiftLeft_t {
            return "shl"
        }
        -> AST_AsmBitShiftRight_t {
            return "shr"
        }
        -> AST_AsmBitShrArithmetic_t {
            return "sar"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn mov_instr(ctx: *struc GasCodeContext, node: *struc AsmMov) none {
    emit(ctx, "    "         "    "         "mov")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn mov_sx_instr(ctx: *struc GasCodeContext, node: *struc AsmMovSx) none {
    emit(ctx, "    "         "    "         "movs")
    emit(ctx, get_type_suffix(node[].asm_type_src, false))
    emit(ctx, get_type_suffix(node[].asm_type_dst, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type_src)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, ", ")
    {
        byte: i32 = type_align_bytes(node[].asm_type_dst)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn zero_extend_instr(ctx: *struc GasCodeContext, node: *struc AsmMovZeroExtend) none {
    emit(ctx, "    "         "    "         "movzb")
    emit(ctx, get_type_suffix(node[].asm_type_dst, false))
    emit(ctx, " ")
    emit_op(ctx, node[].src, 1)
    emit(ctx, ", ")
    {
        byte: i32 = type_align_bytes(node[].asm_type_dst)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn lea_instr(ctx: *struc GasCodeContext, node: *struc AsmLea) none {
    emit(ctx, "    "         "    "         "leaq ")
    emit_op(ctx, node[].src, 8)
    emit(ctx, ", ")
    emit_op(ctx, node[].dst, 8)
    emit(ctx, "\n")
}

fn cvttsd2si_instr(ctx: *struc GasCodeContext, node: *struc AsmCvttsd2si) none {
    emit(ctx, "    "         "    "         "cvttsd2si")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn cvtsi2sd_instr(ctx: *struc GasCodeContext, node: *struc AsmCvtsi2sd) none {
    emit(ctx, "    "         "    "         "cvtsi2sd")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn unary_instr(ctx: *struc GasCodeContext, node: *struc AsmUnary) none {
    emit(ctx, "    "         "    ")
    emit(ctx, get_unop(@node[].unop))
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn binary_instr(ctx: *struc GasCodeContext, node: *struc AsmBinary) none {
    emit(ctx, "    "         "    ")
    {
        is_dbl: i32 = node[].asm_type[].tag == AST_BackendDouble_t
        emit(ctx, get_binop(@node[].binop, is_dbl))
        is_packed: i32 = node[].binop.tag == AST_AsmBitXor_t and is_dbl
        emit(ctx, get_type_suffix(node[].asm_type, is_packed))
    }
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        match node[].binop.tag {
            -> AST_AsmBitShiftLeft_t {
                -> AST_AsmBitShiftRight_t {
                    -> AST_AsmBitShrArithmetic_t {
                        emit_op(ctx, node[].src, 1)
                    }
                }
            }
            break
            otherwise {
                emit_op(ctx, node[].src, byte)
            }
            break
        }
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn cmp_instr(ctx: *struc GasCodeContext, node: *struc AsmCmp) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        emit(ctx, "    "             "    "             "comi")
    }
    else {
        emit(ctx, "    "             "    "             "cmp")
    }
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn idiv_instr(ctx: *struc GasCodeContext, node: *struc AsmIdiv) none {
    emit(ctx, "    "         "    "         "idiv")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, "\n")
}

fn div_instr(ctx: *struc GasCodeContext, node: *struc AsmDiv) none {
    emit(ctx, "    "         "    "         "div")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, "\n")
}

fn cdq_instr(ctx: *struc GasCodeContext, node: *struc AsmCdq) none {
    match node[].asm_type[].tag {
        -> AST_LongWord_t {
            emit(ctx, "    "                 "    "                 "cdq"                 "\n")
        }
        break
        -> AST_QuadWord_t {
            emit(ctx, "    "                 "    "                 "cqo"                 "\n")
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn jmp_instr(ctx: *struc GasCodeContext, node: *struc AsmJmp) none {
    emit(ctx, "    "         "    "         "jmp "         ".L")
    emit_identifier(ctx, node[].target)
    emit(ctx, "\n")
}

fn jmp_cc_instr(ctx: *struc GasCodeContext, node: *struc AsmJmpCC) none {
    emit(ctx, "    "         "    "         "j")
    emit(ctx, get_cond_code(@node[].cond_code))
    emit(ctx, " "         ".L")
    emit_identifier(ctx, node[].target)
    emit(ctx, "\n")
}

fn set_cc_instr(ctx: *struc GasCodeContext, node: *struc AsmSetCC) none {
    emit(ctx, "    "         "    "         "set")
    emit(ctx, get_cond_code(@node[].cond_code))
    emit(ctx, " ")
    emit_op(ctx, node[].dst, 1)
    emit(ctx, "\n")
}

fn label_instr(ctx: *struc GasCodeContext, node: *struc AsmLabel) none {
    emit(ctx, "    "         ".L")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n")
}

fn push_instr(ctx: *struc GasCodeContext, node: *struc AsmPush) none {
    emit(ctx, "    "         "    "         "pushq ")
    emit_op(ctx, node[].src, 8)
    emit(ctx, "\n")
}

fn pop_instr(ctx: *struc GasCodeContext, node: *struc AsmPop) none {
    emit(ctx, "    "         "    "         "popq ")
    emit(ctx, get_reg_8b(@node[].reg))
    emit(ctx, "\n")
}

fn call_instr(ctx: *struc GasCodeContext, node: *struc AsmCall) none {
    emit(ctx, "    "         "    "         "call ")
    emit_identifier(ctx, node[].name)
    backend_fun_symbol: *struc BackendSymbol = ((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)
    if not backend_fun_symbol[].get._BackendFun.is_def {
        emit(ctx, "@PLT")
    }
    emit(ctx, "\n")
}

fn ret_instr(ctx: *struc GasCodeContext) none {
    emit(ctx, "    "         "movq %rbp, %rsp"         "\n"         "    "         "popq %rbp"         "\n"         "    "         "ret"         "\n")
}

fn emit_instr(ctx: *struc GasCodeContext, node: *struc AsmInstruction) none {
    match node[].tag {
        -> AST_AsmMov_t {
            mov_instr(ctx, @node[].get._AsmMov)
        }
        break
        -> AST_AsmMovSx_t {
            mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmCdq_t {
            cdq_instr(ctx, @node[].get._AsmCdq)
        }
        break
        -> AST_AsmJmp_t {
            jmp_instr(ctx, @node[].get._AsmJmp)
        }
        break
        -> AST_AsmJmpCC_t {
            jmp_cc_instr(ctx, @node[].get._AsmJmpCC)
        }
        break
        -> AST_AsmSetCC_t {
            set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmLabel_t {
            label_instr(ctx, @node[].get._AsmLabel)
        }
        break
        -> AST_AsmPush_t {
            push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> AST_AsmPop_t {
            pop_instr(ctx, @node[].get._AsmPop)
        }
        break
        -> AST_AsmCall_t {
            call_instr(ctx, @node[].get._AsmCall)
        }
        break
        -> AST_AsmRet_t {
            ret_instr(ctx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn emit_instr_list(ctx: *struc GasCodeContext, node_list: **struc AsmInstruction) none {
    loop i: u64 = ? node_list[0] then 0 else 1 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        emit_instr(ctx, node_list[i])
    }
}

fn glob_directive_toplvl(ctx: *struc GasCodeContext, name: u64, is_glob: i32) none {
    if is_glob {
        emit(ctx, "    "             ".globl ")
        emit_identifier(ctx, name)
        emit(ctx, "\n")
    }
}

fn emit_fun_toplvl(ctx: *struc GasCodeContext, node: *struc AsmFunction) none {
    glob_directive_toplvl(ctx, node[].name, node[].is_glob)
    emit(ctx, "    "         ".text"         "\n")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n"         "    "         "pushq %rbp"         "\n"         "    "         "movq %rsp, %rbp"         "\n")
    emit_instr_list(ctx, node[].instructions)
}

fn static_section_toplvl(ctx: *struc GasCodeContext, node_list: **struc StaticInit) none {
    if (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) == 1 and node_list[0][].tag == AST_ZeroInit_t {
        emit(ctx, "    "             ".bss"             "\n")
    }
    else {
        emit(ctx, "    "             ".data"             "\n")
    }
}

fn align_directive_toplvl(ctx: *struc GasCodeContext, alignment: i32) none {
    if alignment > 1 {
        emit(ctx, "    "             ".balign ")
        emit_int(ctx, alignment)
        emit(ctx, "\n")
    }
}

fn static_init_toplvl(ctx: *struc GasCodeContext, node: *struc StaticInit) none {
    match node[].tag {
        -> AST_CharInit_t {
            emit(ctx, "    "                 "    "                 ".byte ")
        }
        emit_char(ctx, node[].get._CharInit.value)
        emit(ctx, "\n")
        break
        -> AST_IntInit_t {
            emit(ctx, "    "                 "    "                 ".long ")
        }
        emit_int(ctx, node[].get._IntInit.value)
        emit(ctx, "\n")
        break
        -> AST_LongInit_t {
            emit(ctx, "    "                 "    "                 ".quad ")
        }
        emit_long(ctx, node[].get._LongInit.value)
        emit(ctx, "\n")
        break
        -> AST_DoubleInit_t {
            emit(ctx, "    "                 "    "                 ".quad ")
        }
        emit_dbl(ctx, node[].get._DoubleInit.dbl_const)
        emit(ctx, "\n")
        break
        -> AST_UCharInit_t {
            emit(ctx, "    "                 "    "                 ".byte ")
        }
        emit_uchar(ctx, node[].get._UCharInit.value)
        emit(ctx, "\n")
        break
        -> AST_UIntInit_t {
            emit(ctx, "    "                 "    "                 ".long ")
        }
        emit_uint(ctx, node[].get._UIntInit.value)
        emit(ctx, "\n")
        break
        -> AST_ULongInit_t {
            emit(ctx, "    "                 "    "                 ".quad ")
        }
        emit_ulong(ctx, node[].get._ULongInit.value)
        emit(ctx, "\n")
        break
        -> AST_ZeroInit_t {
            emit(ctx, "    "                 "    "                 ".zero ")
        }
        emit_long(ctx, node[].get._ZeroInit.byte)
        emit(ctx, "\n")
        break
        -> AST_StringInit_t {
            emit(ctx, "    "                 "    "                 ".asci")
        }
        {
            string_init: *struc StringInit = @node[].get._StringInit
            emit(ctx, ? string_init[].is_null_term then "z" else "i")
            emit(ctx, " \"")
            emit_string(ctx, string_init[].string_const)
        }
        emit(ctx, "\""             "\n")
        break
        -> AST_PointerInit_t {
            emit(ctx, "    "                 "    "                 ".quad "                 ".L")
        }
        emit_identifier(ctx, node[].get._PointerInit.name)
        emit(ctx, "\n")
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn emit_static_var_toplvl(ctx: *struc GasCodeContext, node: *struc AsmStaticVariable) none {
    glob_directive_toplvl(ctx, node[].name, node[].is_glob)
    static_section_toplvl(ctx, node[].static_inits)
    align_directive_toplvl(ctx, node[].alignment)
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n")
    loop i: u64 = 0 while i < (? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0) .. ++i {
        static_init_toplvl(ctx, node[].static_inits[i])
    }
}

fn emit_static_const_toplvl(ctx: *struc GasCodeContext, node: *struc AsmStaticConstant) none {
    emit(ctx, "    "         ".section .rodata"         "\n")
    align_directive_toplvl(ctx, node[].alignment)
    emit(ctx, ".L")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n")
    static_init_toplvl(ctx, node[].static_init)
}

fn emit_toplvl(ctx: *struc GasCodeContext, node: *struc AsmTopLevel) none {
    emit(ctx, "\n")
    match node[].tag {
        -> AST_AsmFunction_t {
            emit_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> AST_AsmStaticVariable_t {
            emit_static_var_toplvl(ctx, @node[].get._AsmStaticVariable)
        }
        break
        -> AST_AsmStaticConstant_t {
            emit_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn emit_program(ctx: *struc GasCodeContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        emit_toplvl(ctx, node[].static_const_toplvls[i])
    }
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        emit_toplvl(ctx, node[].top_levels[i])
    }
    emit(ctx, "    "         "    "         ".section .note.GNU-stack,\"\",@progbits"         "\n")
}

pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none {
    ctx: struc GasCodeContext;
    {
        ctx.backend = backend
        ctx.fileio = fileio
        ctx.identifiers = identifiers
    }

    emit_program(@ctx, asm_ast[])
    free_AsmProgram(asm_ast)
}
