m4_include(`registers.plx.m4')m4_dnl
m4_include(`stack_fix.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl






m4_define(`REGISTER_KIND', `TODO')m4_dnl
m4_define(`REG_Ax', `0')m4_dnl
m4_define(`REG_Bx', `1')m4_dnl
m4_define(`REG_Cx', `2')m4_dnl
m4_define(`REG_Dx', `3')m4_dnl
m4_define(`REG_Di', `4')m4_dnl
m4_define(`REG_Si', `5')m4_dnl
m4_define(`REG_R8', `6')m4_dnl
m4_define(`REG_R9', `7')m4_dnl
m4_define(`REG_R10', `8')m4_dnl
m4_define(`REG_R11', `9')m4_dnl
m4_define(`REG_R12', `10')m4_dnl
m4_define(`REG_R13', `11')m4_dnl
m4_define(`REG_R14', `12')m4_dnl
m4_define(`REG_R15', `13')m4_dnl
m4_define(`REG_Sp', `14')m4_dnl
m4_define(`REG_Bp', `15')m4_dnl
m4_define(`REG_Xmm0', `16')m4_dnl
m4_define(`REG_Xmm1', `17')m4_dnl
m4_define(`REG_Xmm2', `18')m4_dnl
m4_define(`REG_Xmm3', `19')m4_dnl
m4_define(`REG_Xmm4', `20')m4_dnl
m4_define(`REG_Xmm5', `21')m4_dnl
m4_define(`REG_Xmm6', `22')m4_dnl
m4_define(`REG_Xmm7', `23')m4_dnl
m4_define(`REG_Xmm8', `24')m4_dnl
m4_define(`REG_Xmm9', `25')m4_dnl
m4_define(`REG_Xmm10', `26')m4_dnl
m4_define(`REG_Xmm11', `27')m4_dnl
m4_define(`REG_Xmm12', `28')m4_dnl
m4_define(`REG_Xmm13', `29')m4_dnl
m4_define(`REG_Xmm14', `30')m4_dnl
m4_define(`REG_Xmm15', `31')m4_dnl
m4_define(`REGISTER_MASK_SIZE', `26')m4_dnl
m4_define(`REGISTER_MASK_FALSE', `TODO')m4_dnl
m4_define(`NULL_REGISTER_MASK', `TODO')m4_dnl
type struc AsmReg;
type struc AsmOperand;
pub fn gen_register(reg_kind: i32) *struc AsmOperand;
pub fn gen_memory(reg_kind: i32, value: i64) *struc AsmOperand;
pub fn gen_indexed(reg_kind_base: i32, reg_kind_idx: i32, scale: i64) *struc AsmOperand;
pub fn register_mask_kind(node: *struc AsmReg) i32;
pub fn register_mask_bit(reg_kind: i32) u64;
pub fn register_mask_get(reg_mask: u64, reg_kind: i32) i32;
pub fn register_mask_set(reg_mask: *u64, reg_kind: i32, value: i32) none;
type struc AsmInstruction;
type struc AsmProgram;
type struc BackEndContext;
pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction;
pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none;
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

type struc AssemblyType;
type struc BackendSymbol;
type struc AsmOperand;

type struc Byte(_empty: char)

type struc LongWord(_empty: char)

type struc QuadWord(_empty: char)

type struc BackendDouble(_empty: char)

type struc ByteArray(size: i64, alignment: i32)

type union _AssemblyType(_Byte: struc Byte, _LongWord: struc LongWord, _QuadWord: struc QuadWord, _BackendDouble: struc BackendDouble, _ByteArray: struc ByteArray)

type struc AssemblyType(_ref_count: u64, tag: i32, get: union _AssemblyType)
pub fn make_AssemblyType(none) *struc AssemblyType;
pub fn make_Byte(none) *struc AssemblyType;
pub fn make_LongWord(none) *struc AssemblyType;
pub fn make_QuadWord(none) *struc AssemblyType;
pub fn make_BackendDouble(none) *struc AssemblyType;
pub fn make_ByteArray(size: i64, alignment: i32) *struc AssemblyType;
pub fn free_AssemblyType(self: **struc AssemblyType) none;

type struc BackendObj(is_static: i32, is_const: i32, asm_type: *struc AssemblyType)

type struc BackendFun(is_def: i32, callee_saved_regs: **struc AsmOperand)

type union _BackendSymbol(_BackendObj: struc BackendObj, _BackendFun: struc BackendFun)

type struc BackendSymbol(tag: i32, get: union _BackendSymbol)
pub fn make_BackendSymbol(none) *struc BackendSymbol;
pub fn make_BackendObj(is_static: i32, is_const: i32, asm_type: **struc AssemblyType) *struc BackendSymbol;
pub fn make_BackendFun(is_def: i32) *struc BackendSymbol;
pub fn free_BackendSymbol(self: **struc BackendSymbol) none;
m4_define(`UPtrBackendSymbol', `TODO')m4_dnl

type struc PairTIdentifierUPtrBackendSymbol(key: u64, value: *struc BackendSymbol)

type struc BackEndContext(symbol_table: *struc PairTIdentifierUPtrBackendSymbol)

type struc AsmReg;
type struc AsmCondCode;
type struc AsmOperand;
type struc AsmBinaryOp;
type struc AsmUnaryOp;
type struc AsmInstruction;
type struc AsmTopLevel;
type struc AsmProgram;

type struc AsmReg(tag: i32)
pub fn make_AsmReg(tag: i32) struc AsmReg;
m4_define(`init_AsmReg', `TODO')m4_dnl
m4_define(`init_AsmAx', `TODO')m4_dnl
m4_define(`init_AsmBx', `TODO')m4_dnl
m4_define(`init_AsmCx', `TODO')m4_dnl
m4_define(`init_AsmDx', `TODO')m4_dnl
m4_define(`init_AsmDi', `TODO')m4_dnl
m4_define(`init_AsmSi', `TODO')m4_dnl
m4_define(`init_AsmR8', `TODO')m4_dnl
m4_define(`init_AsmR9', `TODO')m4_dnl
m4_define(`init_AsmR10', `TODO')m4_dnl
m4_define(`init_AsmR11', `TODO')m4_dnl
m4_define(`init_AsmR12', `TODO')m4_dnl
m4_define(`init_AsmR13', `TODO')m4_dnl
m4_define(`init_AsmR14', `TODO')m4_dnl
m4_define(`init_AsmR15', `TODO')m4_dnl
m4_define(`init_AsmSp', `TODO')m4_dnl
m4_define(`init_AsmBp', `TODO')m4_dnl
m4_define(`init_AsmXMM0', `TODO')m4_dnl
m4_define(`init_AsmXMM1', `TODO')m4_dnl
m4_define(`init_AsmXMM2', `TODO')m4_dnl
m4_define(`init_AsmXMM3', `TODO')m4_dnl
m4_define(`init_AsmXMM4', `TODO')m4_dnl
m4_define(`init_AsmXMM5', `TODO')m4_dnl
m4_define(`init_AsmXMM6', `TODO')m4_dnl
m4_define(`init_AsmXMM7', `TODO')m4_dnl
m4_define(`init_AsmXMM8', `TODO')m4_dnl
m4_define(`init_AsmXMM9', `TODO')m4_dnl
m4_define(`init_AsmXMM10', `TODO')m4_dnl
m4_define(`init_AsmXMM11', `TODO')m4_dnl
m4_define(`init_AsmXMM12', `TODO')m4_dnl
m4_define(`init_AsmXMM13', `TODO')m4_dnl
m4_define(`init_AsmXMM14', `TODO')m4_dnl
m4_define(`init_AsmXMM15', `TODO')m4_dnl

type struc AsmCondCode(tag: i32)
pub fn make_AsmCondCode(tag: i32) struc AsmCondCode;
m4_define(`init_AsmCondCode', `TODO')m4_dnl
m4_define(`init_AsmE', `TODO')m4_dnl
m4_define(`init_AsmNE', `TODO')m4_dnl
m4_define(`init_AsmG', `TODO')m4_dnl
m4_define(`init_AsmGE', `TODO')m4_dnl
m4_define(`init_AsmL', `TODO')m4_dnl
m4_define(`init_AsmLE', `TODO')m4_dnl
m4_define(`init_AsmA', `TODO')m4_dnl
m4_define(`init_AsmAE', `TODO')m4_dnl
m4_define(`init_AsmB', `TODO')m4_dnl
m4_define(`init_AsmBE', `TODO')m4_dnl
m4_define(`init_AsmP', `TODO')m4_dnl

type struc AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32)

type struc AsmRegister(reg: struc AsmReg)

type struc AsmPseudo(name: u64)

type struc AsmMemory(value: i64, reg: struc AsmReg)

type struc AsmData(name: u64, offset: i64)

type struc AsmPseudoMem(name: u64, offset: i64)

type struc AsmIndexed(scale: i64, reg_base: struc AsmReg, reg_index: struc AsmReg)

type union _AsmOperand(_AsmImm: struc AsmImm, _AsmRegister: struc AsmRegister, _AsmPseudo: struc AsmPseudo, _AsmMemory: struc AsmMemory, _AsmData: struc AsmData, _AsmPseudoMem: struc AsmPseudoMem, _AsmIndexed: struc AsmIndexed)

type struc AsmOperand(_ref_count: u64, tag: i32, get: union _AsmOperand)
pub fn make_AsmOperand(none) *struc AsmOperand;
pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand;
pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmPseudo(name: u64) *struc AsmOperand;
pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand;
pub fn free_AsmOperand(self: **struc AsmOperand) none;

type struc AsmBinaryOp(tag: i32)
pub fn make_AsmBinaryOp(tag: i32) struc AsmBinaryOp;
m4_define(`init_AsmBinaryOp', `TODO')m4_dnl
m4_define(`init_AsmAdd', `TODO')m4_dnl
m4_define(`init_AsmSub', `TODO')m4_dnl
m4_define(`init_AsmMult', `TODO')m4_dnl
m4_define(`init_AsmDivDouble', `TODO')m4_dnl
m4_define(`init_AsmBitAnd', `TODO')m4_dnl
m4_define(`init_AsmBitOr', `TODO')m4_dnl
m4_define(`init_AsmBitXor', `TODO')m4_dnl
m4_define(`init_AsmBitShiftLeft', `TODO')m4_dnl
m4_define(`init_AsmBitShiftRight', `TODO')m4_dnl
m4_define(`init_AsmBitShrArithmetic', `TODO')m4_dnl

type struc AsmUnaryOp(tag: i32)
pub fn make_AsmUnaryOp(tag: i32) struc AsmUnaryOp;
m4_define(`init_AsmUnaryOp', `TODO')m4_dnl
m4_define(`init_AsmNot', `TODO')m4_dnl
m4_define(`init_AsmNeg', `TODO')m4_dnl
m4_define(`init_AsmShr', `TODO')m4_dnl

type struc AsmMov(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmMovSx(asm_type_src: *struc AssemblyType, asm_type_dst: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmMovZeroExtend(asm_type_src: *struc AssemblyType, asm_type_dst: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmLea(src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmCvttsd2si(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmCvtsi2sd(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmUnary(unop: struc AsmUnaryOp, asm_type: *struc AssemblyType, dst: *struc AsmOperand)

type struc AsmBinary(binop: struc AsmBinaryOp, asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmCmp(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmIdiv(asm_type: *struc AssemblyType, src: *struc AsmOperand)

type struc AsmDiv(asm_type: *struc AssemblyType, src: *struc AsmOperand)

type struc AsmCdq(asm_type: *struc AssemblyType)

type struc AsmJmp(target: u64)

type struc AsmJmpCC(target: u64, cond_code: struc AsmCondCode)

type struc AsmSetCC(cond_code: struc AsmCondCode, dst: *struc AsmOperand)

type struc AsmLabel(name: u64)

type struc AsmPush(src: *struc AsmOperand)

type struc AsmPop(reg: struc AsmReg)

type struc AsmCall(name: u64)

type struc AsmRet(_empty: char)

type union _AsmInstruction(_AsmMov: struc AsmMov, _AsmMovSx: struc AsmMovSx, _AsmMovZeroExtend: struc AsmMovZeroExtend, _AsmLea: struc AsmLea, _AsmCvttsd2si: struc AsmCvttsd2si, _AsmCvtsi2sd: struc AsmCvtsi2sd, _AsmUnary: struc AsmUnary, _AsmBinary: struc AsmBinary, _AsmCmp: struc AsmCmp, _AsmIdiv: struc AsmIdiv, _AsmDiv: struc AsmDiv, _AsmCdq: struc AsmCdq, _AsmJmp: struc AsmJmp, _AsmJmpCC: struc AsmJmpCC, _AsmSetCC: struc AsmSetCC, _AsmLabel: struc AsmLabel, _AsmPush: struc AsmPush, _AsmPop: struc AsmPop, _AsmCall: struc AsmCall, _AsmRet: struc AsmRet)

type struc AsmInstruction(tag: i32, get: union _AsmInstruction)
pub fn make_AsmInstruction(none) *struc AsmInstruction;
pub fn make_AsmMov(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmMovSx(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmMovZeroExtend(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmLea(src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmCvttsd2si(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmCvtsi2sd(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: **struc AssemblyType, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmCmp(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmIdiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmDiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmCdq(asm_type: **struc AssemblyType) *struc AsmInstruction;
pub fn make_AsmJmp(target: u64) *struc AsmInstruction;
pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction;
pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmLabel(name: u64) *struc AsmInstruction;
pub fn make_AsmPush(src: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction;
pub fn make_AsmCall(name: u64) *struc AsmInstruction;
pub fn make_AsmRet(none) *struc AsmInstruction;
pub fn free_AsmInstruction(self: **struc AsmInstruction) none;

type struc AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: **struc AsmInstruction)

type struc AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: **struc StaticInit)

type struc AsmStaticConstant(name: u64, alignment: i32, static_init: *struc StaticInit)

type union _AsmTopLevel(_AsmFunction: struc AsmFunction, _AsmStaticVariable: struc AsmStaticVariable, _AsmStaticConstant: struc AsmStaticConstant)

type struc AsmTopLevel(tag: i32, get: union _AsmTopLevel)
pub fn make_AsmTopLevel(none) *struc AsmTopLevel;
pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: ***struc AsmInstruction) *struc AsmTopLevel;
pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: ***struc StaticInit) *struc AsmTopLevel;
pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel;
pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none;

type struc AsmProgram(tag: i32, static_const_toplvls: **struc AsmTopLevel, top_levels: **struc AsmTopLevel)
pub fn make_AsmProgram(static_const_toplvls: ***struc AsmTopLevel, top_levels: ***struc AsmTopLevel) *struc AsmProgram;
pub fn free_AsmProgram(self: **struc AsmProgram) none;

type struc PairTIdentifierTLong(key: u64, value: i64)

type struc StackFixContext(backend: *struc BackEndContext, stack_bytes: i64, pseudo_stack_map: *struc PairTIdentifierTLong, p_fix_instrs: ***struc AsmInstruction)

m4_define(`Ctx', `TODO')m4_dnl

fn pseudo_data(node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    name: u64 = node[].name
    free_AsmOperand(pseudo_op)
    pseudo_op[] = make_AsmData(name, 0l)
}

fn pseudo_mem_data(node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    name: u64 = node[].name
    offset: i64 = node[].offset
    free_AsmOperand(pseudo_op)
    pseudo_op[] = make_AsmData(name, offset)
}

fn pseudo_memory(ctx: *struc StackFixContext, node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    value: i64 = -1l * ((? ((? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp])[].value)
    free_AsmOperand(pseudo_op)
    pseudo_op[] = gen_memory(REG_Bp, value)
}

fn pseudo_mem_memory(ctx: *struc StackFixContext, node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    value: i64 = -1l * (((? ((? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp])[].value) - node[].offset)
    free_AsmOperand(pseudo_op)
    pseudo_op[] = gen_memory(REG_Bp, value)
}

fn align_offset_stack_bytes(ctx: *struc StackFixContext, alignment: i32) none {
    offset: i64 = ctx[].stack_bytes % alignment
    if offset ~= 0l {
        ctx[].stack_bytes += alignment - offset
    }
}

fn align_offset_pseudo(ctx: *struc StackFixContext, size: i64, alignment: i32) none {
    ctx[].stack_bytes += size
    align_offset_stack_bytes(ctx, alignment)
}

fn alloc_offset_pseudo(ctx: *struc StackFixContext, asm_type: *struc AssemblyType) none {
    match asm_type[].tag {
        -> AST_Byte_t {
            align_offset_pseudo(ctx, 1l, 1)
        }
        break
        -> AST_LongWord_t {
            align_offset_pseudo(ctx, 4l, 4)
        }
        break
        -> AST_QuadWord_t {
            -> AST_BackendDouble_t {
                align_offset_pseudo(ctx, 8l, 8)
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn alloc_offset_pseudo_mem(ctx: *struc StackFixContext, asm_type: *struc AssemblyType) none {
    if asm_type[].tag == AST_ByteArray_t {
        bytearray_type: *struc ByteArray = @asm_type[].get._ByteArray
        align_offset_pseudo(ctx, bytearray_type[].size, bytearray_type[].alignment)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn repl_pseudo_op(ctx: *struc StackFixContext, node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    if (? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp) == -1 {
        backend_obj: *struc BackendObj = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendObj
        if backend_obj[].is_static {
            pseudo_data(node, pseudo_op)
            return none
        }
        else {
            alloc_offset_pseudo(ctx, backend_obj[].asm_type)
            loop .. while 0 {
                "@MACRO@:map_add(ctx->pseudo_stack_map, node->name, ctx->stack_bytes)"
                loop .. while 0 {
                    (ctx[].pseudo_stack_map) = stbds_hmput_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)
                    (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].key = (node[].name)
                    (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].value = (ctx[].stack_bytes)
                }
            }
        }
    }
    pseudo_memory(ctx, node, pseudo_op)
}

fn repl_pseudo_mem_op(ctx: *struc StackFixContext, node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    if (? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp) == -1 {
        backend_obj: *struc BackendObj = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendObj
        if backend_obj[].is_static {
            pseudo_mem_data(node, pseudo_op)
            return none
        }
        else {
            alloc_offset_pseudo_mem(ctx, backend_obj[].asm_type)
            loop .. while 0 {
                "@MACRO@:map_add(ctx->pseudo_stack_map, node->name, ctx->stack_bytes)"
                loop .. while 0 {
                    (ctx[].pseudo_stack_map) = stbds_hmput_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)
                    (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].key = (node[].name)
                    (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].value = (ctx[].stack_bytes)
                }
            }
        }
    }
    pseudo_mem_memory(ctx, node, pseudo_op)
}

fn repl_mov_pseudo(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_mov_sx_pseudo(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_zero_extend_pseudo(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_lea_pseudo(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_cvttsd2si_pseudo(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_cvtsi2sd_pseudo(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_unary(ctx: *struc StackFixContext, node: *struc AsmUnary) none {
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_binary_pseudo(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_cmp_pseudo(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_idiv_pseudo(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_div_pseudo(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_set_cc_pseudo(ctx: *struc StackFixContext, node: *struc AsmSetCC) none {
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_push_pseudo(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_pseudo_regs(ctx: *struc StackFixContext, node: *struc AsmInstruction) none {
    match node[].tag {
        -> AST_AsmMov_t {
            repl_mov_pseudo(ctx, @node[].get._AsmMov)
        }
        break
        -> AST_AsmMovSx_t {
            repl_mov_sx_pseudo(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            repl_zero_extend_pseudo(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            repl_lea_pseudo(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            repl_cvttsd2si_pseudo(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            repl_cvtsi2sd_pseudo(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            repl_unary(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            repl_binary_pseudo(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            repl_cmp_pseudo(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            repl_idiv_pseudo(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            repl_div_pseudo(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmSetCC_t {
            repl_set_cc_pseudo(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmPush_t {
            repl_push_pseudo(ctx, @node[].get._AsmPush)
        }
        break
        otherwise {
            break
        }
    }
}

pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmSub_t)
    asm_type: *struc AssemblyType = make_QuadWord()

    src: *struc AsmOperand = sptr_new()
    {
        value: u64 = cast<u64>(byte)
        is_byte: i32 = byte <= 127l and byte >= -128l
        is_quad: i32 = byte > 2147483647l or byte < -2147483648l
        is_neg: i32 = byte < 0l
        src = make_AsmImm(value, is_byte, is_quad, is_neg)
    }
    dst: *struc AsmOperand = gen_register(REG_Sp)
    return make_AsmBinary(@binop, @asm_type, @src, @dst)
}

fn push_fix_instr(ctx: *struc StackFixContext, instr: *struc AsmInstruction) none {
    loop .. while 0 {
        "@MACRO@:vec_move_back(*ctx->p_fix_instrs, instr)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*ctx->p_fix_instrs, instr)"
            loop .. while 0 {
                (? (not (ctx[].p_fix_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].capacity) then (((ctx[].p_fix_instrs[]) = stbds_arrgrowf((ctx[].p_fix_instrs[]), sizeof((ctx[].p_fix_instrs[])[]), (1), (0))) and 0) else 0)
                (ctx[].p_fix_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length++] = (instr)
            }
        }
        instr = nil
    }
}

fn swap_fix_instr_back(ctx: *struc StackFixContext) none {
    swap_instr: *struc AsmInstruction = uptr_new()
    instr_back_1: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
    instr_back_2: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 2]
    if instr_back_1[] ~= swap_instr {
        "@MACRO@:uptr_move(AsmInstruction, *instr_back_1, swap_instr)"
        free_AsmInstruction(@swap_instr)
        swap_instr = instr_back_1[]
        instr_back_1[] = uptr_new()
    }
    if instr_back_2[] ~= instr_back_1[] {
        "@MACRO@:uptr_move(AsmInstruction, *instr_back_2, *instr_back_1)"
        free_AsmInstruction(@instr_back_1[])
        instr_back_1[] = instr_back_2[]
        instr_back_2[] = uptr_new()
    }
    if swap_instr ~= instr_back_2[] {
        "@MACRO@:uptr_move(AsmInstruction, swap_instr, *instr_back_2)"
        free_AsmInstruction(@instr_back_2[])
        instr_back_2[] = swap_instr
        swap_instr = uptr_new()
    }
}

fn fix_alloc_stack_bytes(ctx: *struc StackFixContext, callee_saved_size: i64) none {
    callee_saved_bytes: i64 = callee_saved_size * 8l
    ctx[].stack_bytes += callee_saved_bytes
    if ctx[].stack_bytes > 0l {
        align_offset_stack_bytes(ctx, 16)
        ctx[].stack_bytes -= callee_saved_bytes
        (ctx[].p_fix_instrs[])[0] = alloc_stack_bytes(ctx[].stack_bytes)
    }
}

fn push_callee_saved_regs(ctx: *struc StackFixContext, callee_saved_regs: **struc AsmOperand) none {
    loop i: u64 = 0 while i < (? (callee_saved_regs) then (cast<*struc stbds_array_header>((callee_saved_regs)) - 1)[].length else 0) .. ++i {
        src: *struc AsmOperand = sptr_new()
        if callee_saved_regs[i] ~= src {
            "@MACRO@:sptr_copy(AsmOperand, callee_saved_regs[i], src)"
            free_AsmOperand(@src)
            src = callee_saved_regs[i]
            (src)[]._ref_count++
        }
        push_fix_instr(ctx, make_AsmPush(@src))
    }
}

fn pop_callee_saved_regs(ctx: *struc StackFixContext, callee_saved_regs: **struc AsmOperand) none {
    loop i: u64 = (? (callee_saved_regs) then (cast<*struc stbds_array_header>((callee_saved_regs)) - 1)[].length else 0) while i-- > 0 {
        reg_kind: i32 = register_mask_kind(@callee_saved_regs[i][].get._AsmRegister.reg)
        reg: struc AsmReg = make_AsmReg(AST_AsmReg_t)
        match reg_kind {
            -> REG_Bx {
                reg = make_AsmReg(AST_AsmBx_t)
                break
            }
            -> REG_R12 {
                reg = make_AsmReg(AST_AsmR12_t)
                break
            }
            -> REG_R13 {
                reg = make_AsmReg(AST_AsmR13_t)
                break
            }
            -> REG_R14 {
                reg = make_AsmReg(AST_AsmR14_t)
                break
            }
            -> REG_R15 {
                reg = make_AsmReg(AST_AsmR15_t)
                break
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        push_fix_instr(ctx, make_AsmPop(@reg))
    }
}

fn is_op_addr(node: *struc AsmOperand) i32 {
    match node[].tag {
        -> AST_AsmMemory_t {
            -> AST_AsmData_t {
                -> AST_AsmIndexed_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn mov_dbl_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Xmm14)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn mov_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    if node[].dst[].tag == AST_AsmRegister_t {
        if node[].asm_type[].tag ~= AST_QuadWord_t {
            free_AssemblyType(@node[].asm_type)
            node[].asm_type = make_QuadWord()
        }
        return none
    }
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn mov_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_mov_instr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            mov_dbl_from_addr_to_addr(ctx, node)
        }
    }
    else {
        if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
            mov_from_quad_imm(ctx, node)
        }
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            mov_from_addr_to_addr(ctx, node)
        }
    }
}

fn mov_sx_from_imm(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type_src ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type_src, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_src
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn mov_sx_to_addr(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type_dst ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type_dst, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_dst
        (asm_type)[]._ref_count++
    }
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_mov_sx_instr(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    if node[].src[].tag == AST_AsmImm_t {
        mov_sx_from_imm(ctx, node)
    }
    if is_op_addr(node[].dst) {
        mov_sx_to_addr(ctx, node)
    }
}

fn byte_zero_extend_from_imm(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_Byte()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn byte_zero_extend_to_addr(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type_dst ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type_dst, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_dst
        (asm_type)[]._ref_count++
    }
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn zero_extend_as_mov(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) *struc AsmMov {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = make_LongWord()
    instr_back: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
    free_AsmInstruction(instr_back)
    instr_back[] = make_AsmMov(@asm_type, @src, @dst)
    return @(instr_back[])[].get._AsmMov
}

fn zero_extend_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = make_QuadWord()
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_zero_extend_instr(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    if node[].asm_type_src[].tag == AST_Byte_t {
        if node[].src[].tag == AST_AsmImm_t {
            byte_zero_extend_from_imm(ctx, node)
        }
        if is_op_addr(node[].dst) {
            byte_zero_extend_to_addr(ctx, node)
        }
    }
    else {
        mov: *struc AsmMov = zero_extend_as_mov(ctx, node)
        if is_op_addr(mov[].dst) {
            zero_extend_to_addr(ctx, mov)
        }
    }
}

fn lea_to_addr(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = make_QuadWord()
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_lea_instr(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    if is_op_addr(node[].dst) {
        lea_to_addr(ctx, node)
    }
}

fn cvttsd2si_to_addr(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_cvttsd2si_instr(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    if is_op_addr(node[].dst) {
        cvttsd2si_to_addr(ctx, node)
    }
}

fn cvtsi2sd_from_imm(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cvtsi2sd_to_addr(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    src: *struc AsmOperand = gen_register(REG_Xmm15)
    dst: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = uptr_new()
        }
    }
    asm_type: *struc AssemblyType = make_BackendDouble()
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_cvtsi2sd_instr(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].tag == AST_AsmImm_t {
        cvtsi2sd_from_imm(ctx, node)
    }
    if is_op_addr(node[].dst) {
        cvtsi2sd_to_addr(ctx, node)
    }
}

fn binary_dbl_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Xmm15)
    asm_type: *struc AssemblyType = make_BackendDouble()
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    {
        src_cp: *struc AsmOperand = sptr_new()
        if src ~= src_cp {
            "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        asm_type_cp: *struc AssemblyType = sptr_new()
        if asm_type ~= asm_type_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type, asm_type_cp)"
            free_AssemblyType(@asm_type_cp)
            asm_type_cp = asm_type
            (asm_type_cp)[]._ref_count++
        }
        push_fix_instr(ctx, make_AsmMov(@asm_type_cp, @src_cp, @dst_cp))
    }
    swap_fix_instr_back(ctx)
    push_fix_instr(ctx, make_AsmMov(@asm_type, @dst, @src))
}

fn binary_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn binary_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn binary_imul_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R11)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    {
        src_cp: *struc AsmOperand = sptr_new()
        if src ~= src_cp {
            "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        asm_type_cp: *struc AssemblyType = sptr_new()
        if asm_type ~= asm_type_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type, asm_type_cp)"
            free_AssemblyType(@asm_type_cp)
            asm_type_cp = asm_type
            (asm_type_cp)[]._ref_count++
        }
        push_fix_instr(ctx, make_AsmMov(@asm_type_cp, @src_cp, @dst_cp))
    }
    swap_fix_instr_back(ctx)
    push_fix_instr(ctx, make_AsmMov(@asm_type, @dst, @src))
}

fn binary_shx_from_not_imm(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    if node[].src[].tag == AST_AsmRegister_t and register_mask_kind(@node[].src[].get._AsmRegister.reg) == REG_Cx {
        return none
    }
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Cx)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_binary_instr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        if is_op_addr(node[].dst) {
            binary_dbl_to_addr(ctx, node)
        }
    }
    else {
        match node[].binop.tag {
            -> AST_AsmAdd_t {
                -> AST_AsmSub_t {
                    -> AST_AsmBitAnd_t {
                        -> AST_AsmBitOr_t {
                            -> AST_AsmBitXor_t {
                                if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
                                    binary_from_quad_imm(ctx, node)
                                }
                                if is_op_addr(node[].src) and is_op_addr(node[].dst) {
                                    binary_from_addr_to_addr(ctx, node)
                                }
                                break
                            }
                        }
                    }
                }
            }
            -> AST_AsmMult_t {
                if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
                    binary_from_quad_imm(ctx, node)
                }
                if is_op_addr(node[].dst) {
                    binary_imul_to_addr(ctx, node)
                }
                break
            }
            -> AST_AsmBitShiftLeft_t {
                -> AST_AsmBitShiftRight_t {
                    -> AST_AsmBitShrArithmetic_t {
                        if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
                            binary_from_quad_imm(ctx, node)
                        }
                        if node[].src[].tag ~= AST_AsmImm_t {
                            binary_shx_from_not_imm(ctx, node)
                        }
                        break
                    }
                }
            }
            otherwise {
                break
            }
        }
    }
}

fn cmp_dbl_to_addr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Xmm15)
    asm_type: *struc AssemblyType = make_BackendDouble()
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cmp_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cmp_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cmp_to_imm(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R11)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_cmp_instr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        if is_op_addr(node[].dst) {
            cmp_dbl_to_addr(ctx, node)
        }
    }
    else {
        if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
            cmp_from_quad_imm(ctx, node)
        }
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            cmp_from_addr_to_addr(ctx, node)
        }
        elif node[].dst[].tag == AST_AsmImm_t {
            cmp_to_imm(ctx, node)
        }
    }
}

fn idiv_from_imm(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_idiv_instr(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    if node[].src[].tag == AST_AsmImm_t {
        idiv_from_imm(ctx, node)
    }
}

fn div_from_imm(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = sptr_new()
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_div_instr(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    if node[].src[].tag == AST_AsmImm_t {
        div_from_imm(ctx, node)
    }
}

fn push_dbl_from_xmm_reg(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    src_reg: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src_reg)"
        if node[].src ~= src_reg {
            "@MACRO@:uptr_move(AsmOperand, node->src, src_reg)"
            free_AsmOperand(@src_reg)
            src_reg = node[].src
            node[].src = uptr_new()
        }
    }

    asm_type_src: *struc AssemblyType = make_QuadWord()
    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmSub_t)
        src: *struc AsmOperand = make_AsmImm(8ul, true, false, false)
        dst: *struc AsmOperand = gen_register(REG_Sp)
        asm_type_src_cp: *struc AssemblyType = sptr_new()
        if asm_type_src ~= asm_type_src_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        instr_back: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
        free_AsmInstruction(instr_back)
        instr_back[] = make_AsmBinary(@binop, @asm_type_src_cp, @src, @dst)
    }

    {
        dst: *struc AsmOperand = gen_memory(REG_Sp, 0l)
        push_fix_instr(ctx, make_AsmMov(@asm_type_src, @src_reg, @dst))
    }
}

fn push_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    src: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = uptr_new()
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_push_instr(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    if node[].src[].tag == AST_AsmRegister_t {
        reg_kind: i32 = register_mask_kind(@node[].src[].get._AsmRegister.reg)
        if reg_kind ~= REG_Sp and register_mask_bit(reg_kind) > 11 {
            push_dbl_from_xmm_reg(ctx, node)
        }
    }
    elif node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
        push_from_quad_imm(ctx, node)
    }
}

fn fix_instr(ctx: *struc StackFixContext, node: *struc AsmInstruction) none {
    match node[].tag {
        -> AST_AsmMov_t {
            fix_mov_instr(ctx, @node[].get._AsmMov)
        }
        break
        -> AST_AsmMovSx_t {
            fix_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            fix_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            fix_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            fix_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            fix_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmBinary_t {
            fix_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            fix_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            fix_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            fix_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmPush_t {
            fix_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        otherwise {
            break
        }
    }
}

fn fix_fun_toplvl(ctx: *struc StackFixContext, node: *struc AsmFunction) none {
    instructions: **struc AsmInstruction = vec_new()
    if node[].instructions ~= instructions {
        "@MACRO@:vec_move(node->instructions, instructions)"
        if instructions {
            "@MACRO@:vec_delete(instructions)"
            loop .. while 0 {
                cast<none>((? (instructions) then free((cast<*struc stbds_array_header>((instructions)) - 1)) else cast<none>(0)))
                (instructions) = nil
            }
            instructions = vec_new()
        }
        instructions = node[].instructions
        node[].instructions = vec_new()
    }
    backend_fun: *struc BackendFun = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendFun
    if node[].instructions {
        "@MACRO@:vec_clear(node->instructions)"
        (cast<*struc stbds_array_header>((node[].instructions)) - 1)[].length = 0
    }
    loop .. while 0 {
        "@MACRO@:vec_reserve(node->instructions, vec_size(instructions))"
        (((node[].instructions) = stbds_arrgrowf((node[].instructions), sizeof((node[].instructions)[]), (0), ((? (instructions) then (cast<*struc stbds_array_header>((instructions)) - 1)[].length else 0)))))
    }
    ctx[].stack_bytes = ? node[].is_ret_memory then 8l else 0l
    loop .. while 0 {
        "@MACRO@:map_clear(ctx->pseudo_stack_map)"
        if ctx[].pseudo_stack_map {
            "@MACRO@:map_delete(ctx->pseudo_stack_map)"
            loop .. while 0 {
                cast<none>((? (ctx[].pseudo_stack_map) ~= nil then stbds_hmfree_func((ctx[].pseudo_stack_map) - 1, sizeof((ctx[].pseudo_stack_map)[])) else cast<none>(0)))
                (ctx[].pseudo_stack_map) = nil
            }
            ctx[].pseudo_stack_map = map_new()
        }
    }
    ctx[].p_fix_instrs = @node[].instructions
    loop .. while 0 {
        "@MACRO@:vec_push_back(*ctx->p_fix_instrs, uptr_new())"
        loop .. while 0 {
            (? (not (ctx[].p_fix_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].capacity) then (((ctx[].p_fix_instrs[]) = stbds_arrgrowf((ctx[].p_fix_instrs[]), sizeof((ctx[].p_fix_instrs[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_fix_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length++] = (uptr_new())
        }
    }
    is_ret: i32 = false
    push_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
    loop i: u64 = 0 while i < (? (instructions) then (cast<*struc stbds_array_header>((instructions)) - 1)[].length else 0) .. ++i {
        if instructions[i] {
            if instructions[i][].tag == AST_AsmRet_t {
                pop_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
                is_ret = true
            }
            push_fix_instr(ctx, instructions[i])
            instructions[i] = uptr_new()
            repl_pseudo_regs(ctx, (ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1])
            fix_instr(ctx, (ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1])
        }
    }
    if not is_ret {
        pop_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
    }
    {
        callee_saved_size: i64 = cast<i64>((? (backend_fun[].callee_saved_regs) then (cast<*struc stbds_array_header>((backend_fun[].callee_saved_regs)) - 1)[].length else 0))
        fix_alloc_stack_bytes(ctx, callee_saved_size)
    }
    ctx[].p_fix_instrs = nil
    if instructions {
        "@MACRO@:vec_delete(instructions)"
        loop .. while 0 {
            cast<none>((? (instructions) then free((cast<*struc stbds_array_header>((instructions)) - 1)) else cast<none>(0)))
            (instructions) = nil
        }
        instructions = vec_new()
    }
}

fn fix_toplvl(ctx: *struc StackFixContext, node: *struc AsmTopLevel) none {
    match node[].tag {
        -> AST_AsmFunction_t {
            fix_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> AST_AsmStaticVariable_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fix_program(ctx: *struc StackFixContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        fix_toplvl(ctx, node[].top_levels[i])
    }
}

pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none {
    ctx: struc StackFixContext;
    {
        ctx.backend = backend
        ctx.stack_bytes = 0l
        ctx.pseudo_stack_map = map_new()
    }

    fix_program(@ctx, node)
    if ctx.pseudo_stack_map {
        "@MACRO@:map_delete(ctx.pseudo_stack_map)"
        loop .. while 0 {
            cast<none>((? (ctx.pseudo_stack_map) ~= nil then stbds_hmfree_func((ctx.pseudo_stack_map) - 1, sizeof((ctx.pseudo_stack_map)[])) else cast<none>(0)))
            (ctx.pseudo_stack_map) = nil
        }
        ctx.pseudo_stack_map = map_new()
    }
}
