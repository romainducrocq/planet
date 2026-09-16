m4_include(`registers.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/back_ast.plx.m4')m4_dnl






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

fn gen_reg(reg_kind: i32) struc AsmReg {
    match reg_kind {
        -> REG_Ax {
            return make_AsmReg(AST_AsmAx_t)
        }
        -> REG_Bx {
            return make_AsmReg(AST_AsmBx_t)
        }
        -> REG_Cx {
            return make_AsmReg(AST_AsmCx_t)
        }
        -> REG_Dx {
            return make_AsmReg(AST_AsmDx_t)
        }
        -> REG_Di {
            return make_AsmReg(AST_AsmDi_t)
        }
        -> REG_Si {
            return make_AsmReg(AST_AsmSi_t)
        }
        -> REG_R8 {
            return make_AsmReg(AST_AsmR8_t)
        }
        -> REG_R9 {
            return make_AsmReg(AST_AsmR9_t)
        }
        -> REG_R10 {
            return make_AsmReg(AST_AsmR10_t)
        }
        -> REG_R11 {
            return make_AsmReg(AST_AsmR11_t)
        }
        -> REG_R12 {
            return make_AsmReg(AST_AsmR12_t)
        }
        -> REG_R13 {
            return make_AsmReg(AST_AsmR13_t)
        }
        -> REG_R14 {
            return make_AsmReg(AST_AsmR14_t)
        }
        -> REG_R15 {
            return make_AsmReg(AST_AsmR15_t)
        }
        -> REG_Sp {
            return make_AsmReg(AST_AsmSp_t)
        }
        -> REG_Bp {
            return make_AsmReg(AST_AsmBp_t)
        }
        -> REG_Xmm0 {
            return make_AsmReg(AST_AsmXMM0_t)
        }
        -> REG_Xmm1 {
            return make_AsmReg(AST_AsmXMM1_t)
        }
        -> REG_Xmm2 {
            return make_AsmReg(AST_AsmXMM2_t)
        }
        -> REG_Xmm3 {
            return make_AsmReg(AST_AsmXMM3_t)
        }
        -> REG_Xmm4 {
            return make_AsmReg(AST_AsmXMM4_t)
        }
        -> REG_Xmm5 {
            return make_AsmReg(AST_AsmXMM5_t)
        }
        -> REG_Xmm6 {
            return make_AsmReg(AST_AsmXMM6_t)
        }
        -> REG_Xmm7 {
            return make_AsmReg(AST_AsmXMM7_t)
        }
        -> REG_Xmm8 {
            return make_AsmReg(AST_AsmXMM8_t)
        }
        -> REG_Xmm9 {
            return make_AsmReg(AST_AsmXMM9_t)
        }
        -> REG_Xmm10 {
            return make_AsmReg(AST_AsmXMM10_t)
        }
        -> REG_Xmm11 {
            return make_AsmReg(AST_AsmXMM11_t)
        }
        -> REG_Xmm12 {
            return make_AsmReg(AST_AsmXMM12_t)
        }
        -> REG_Xmm13 {
            return make_AsmReg(AST_AsmXMM13_t)
        }
        -> REG_Xmm14 {
            return make_AsmReg(AST_AsmXMM14_t)
        }
        -> REG_Xmm15 {
            return make_AsmReg(AST_AsmXMM15_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn gen_register(reg_kind: i32) *struc AsmOperand {
    reg: struc AsmReg = gen_reg(reg_kind)
    return make_AsmRegister(@reg)
}

pub fn gen_memory(reg_kind: i32, value: i64) *struc AsmOperand {
    reg: struc AsmReg = gen_reg(reg_kind)
    return make_AsmMemory(value, @reg)
}

pub fn gen_indexed(reg_kind_base: i32, reg_kind_idx: i32, scale: i64) *struc AsmOperand {
    reg_base: struc AsmReg = gen_reg(reg_kind_base)
    reg_index: struc AsmReg = gen_reg(reg_kind_idx)
    return make_AsmIndexed(scale, @reg_base, @reg_index)
}

pub fn register_mask_kind(node: *struc AsmReg) i32 {
    match node[].tag {
        -> AST_AsmAx_t {
            return REG_Ax
        }
        -> AST_AsmBx_t {
            return REG_Bx
        }
        -> AST_AsmCx_t {
            return REG_Cx
        }
        -> AST_AsmDx_t {
            return REG_Dx
        }
        -> AST_AsmDi_t {
            return REG_Di
        }
        -> AST_AsmSi_t {
            return REG_Si
        }
        -> AST_AsmR8_t {
            return REG_R8
        }
        -> AST_AsmR9_t {
            return REG_R9
        }
        -> AST_AsmR12_t {
            return REG_R12
        }
        -> AST_AsmR13_t {
            return REG_R13
        }
        -> AST_AsmR14_t {
            return REG_R14
        }
        -> AST_AsmR15_t {
            return REG_R15
        }
        -> AST_AsmXMM0_t {
            return REG_Xmm0
        }
        -> AST_AsmXMM1_t {
            return REG_Xmm1
        }
        -> AST_AsmXMM2_t {
            return REG_Xmm2
        }
        -> AST_AsmXMM3_t {
            return REG_Xmm3
        }
        -> AST_AsmXMM4_t {
            return REG_Xmm4
        }
        -> AST_AsmXMM5_t {
            return REG_Xmm5
        }
        -> AST_AsmXMM6_t {
            return REG_Xmm6
        }
        -> AST_AsmXMM7_t {
            return REG_Xmm7
        }
        -> AST_AsmXMM8_t {
            return REG_Xmm8
        }
        -> AST_AsmXMM9_t {
            return REG_Xmm9
        }
        -> AST_AsmXMM10_t {
            return REG_Xmm10
        }
        -> AST_AsmXMM11_t {
            return REG_Xmm11
        }
        -> AST_AsmXMM12_t {
            return REG_Xmm12
        }
        -> AST_AsmXMM13_t {
            return REG_Xmm13
        }
        -> AST_AsmSp_t {
            -> AST_AsmBp_t {
                return REG_Sp
            }
        }
        -> AST_AsmR10_t {
            -> AST_AsmR11_t {
                -> AST_AsmXMM14_t {
                    -> AST_AsmXMM15_t {
                        panic_sigabrt("abort")
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn register_mask_bit(reg_kind: i32) u64 {
    match reg_kind {
        -> REG_Ax {
            return 0
        }
        -> REG_Bx {
            return 1
        }
        -> REG_Cx {
            return 2
        }
        -> REG_Dx {
            return 3
        }
        -> REG_Di {
            return 4
        }
        -> REG_Si {
            return 5
        }
        -> REG_R8 {
            return 6
        }
        -> REG_R9 {
            return 7
        }
        -> REG_R12 {
            return 8
        }
        -> REG_R13 {
            return 9
        }
        -> REG_R14 {
            return 10
        }
        -> REG_R15 {
            return 11
        }
        -> REG_Xmm0 {
            return 12
        }
        -> REG_Xmm1 {
            return 13
        }
        -> REG_Xmm2 {
            return 14
        }
        -> REG_Xmm3 {
            return 15
        }
        -> REG_Xmm4 {
            return 16
        }
        -> REG_Xmm5 {
            return 17
        }
        -> REG_Xmm6 {
            return 18
        }
        -> REG_Xmm7 {
            return 19
        }
        -> REG_Xmm8 {
            return 20
        }
        -> REG_Xmm9 {
            return 21
        }
        -> REG_Xmm10 {
            return 22
        }
        -> REG_Xmm11 {
            return 23
        }
        -> REG_Xmm12 {
            return 24
        }
        -> REG_Xmm13 {
            return 25
        }
        -> REG_R10 {
            -> REG_R11 {
                -> REG_Sp {
                    -> REG_Bp {
                        -> REG_Xmm14 {
                            -> REG_Xmm15 {
                                panic_sigabrt("abort")
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn register_mask_get(reg_mask: u64, reg_kind: i32) i32 {
    return (reg_mask & ((cast<u64>(1ul)) << register_mask_bit(reg_kind))) > 0
}

pub fn register_mask_set(reg_mask: *u64, reg_kind: i32, value: i32) none {
    if value {
        reg_mask[] |= (cast<u64>(1ul)) << register_mask_bit(reg_kind)
    }
    else {
        reg_mask[] &= ~((cast<u64>(1ul)) << register_mask_bit(reg_kind))
    }
}
