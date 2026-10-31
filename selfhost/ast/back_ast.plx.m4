m4_ifdef(`_AST_BACK_AST_M4', `', `
m4_define(`_AST_BACK_AST_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

type struc AsmReg;
type struc AsmCondCode;
type struc AsmOperand;
type struc AsmBinaryOp;
type struc AsmUnaryOp;
type struc AsmInstruction;
type struc AsmTopLevel;
type struc AsmProgram;

type struc AsmReg(tagged_def_impl(AST_T))
pub fn make_AsmReg(tagged_def_impl(AST_T)) struc AsmReg;
m4_define(`init_AsmReg', `tagged_def_init(AST, AsmReg, AsmReg)')m4_dnl
m4_define(`init_AsmAx', `tagged_def_init(AST, AsmReg, AsmAx)')m4_dnl
m4_define(`init_AsmBx', `tagged_def_init(AST, AsmReg, AsmBx)')m4_dnl
m4_define(`init_AsmCx', `tagged_def_init(AST, AsmReg, AsmCx)')m4_dnl
m4_define(`init_AsmDx', `tagged_def_init(AST, AsmReg, AsmDx)')m4_dnl
m4_define(`init_AsmDi', `tagged_def_init(AST, AsmReg, AsmDi)')m4_dnl
m4_define(`init_AsmSi', `tagged_def_init(AST, AsmReg, AsmSi)')m4_dnl
m4_define(`init_AsmR8', `tagged_def_init(AST, AsmReg, AsmR8)')m4_dnl
m4_define(`init_AsmR9', `tagged_def_init(AST, AsmReg, AsmR9)')m4_dnl
m4_define(`init_AsmR10', `tagged_def_init(AST, AsmReg, AsmR10)')m4_dnl
m4_define(`init_AsmR11', `tagged_def_init(AST, AsmReg, AsmR11)')m4_dnl
m4_define(`init_AsmR12', `tagged_def_init(AST, AsmReg, AsmR12)')m4_dnl
m4_define(`init_AsmR13', `tagged_def_init(AST, AsmReg, AsmR13)')m4_dnl
m4_define(`init_AsmR14', `tagged_def_init(AST, AsmReg, AsmR14)')m4_dnl
m4_define(`init_AsmR15', `tagged_def_init(AST, AsmReg, AsmR15)')m4_dnl
m4_define(`init_AsmSp', `tagged_def_init(AST, AsmReg, AsmSp)')m4_dnl
m4_define(`init_AsmBp', `tagged_def_init(AST, AsmReg, AsmBp)')m4_dnl
m4_define(`init_AsmXMM0', `tagged_def_init(AST, AsmReg, AsmXMM0)')m4_dnl
m4_define(`init_AsmXMM1', `tagged_def_init(AST, AsmReg, AsmXMM1)')m4_dnl
m4_define(`init_AsmXMM2', `tagged_def_init(AST, AsmReg, AsmXMM2)')m4_dnl
m4_define(`init_AsmXMM3', `tagged_def_init(AST, AsmReg, AsmXMM3)')m4_dnl
m4_define(`init_AsmXMM4', `tagged_def_init(AST, AsmReg, AsmXMM4)')m4_dnl
m4_define(`init_AsmXMM5', `tagged_def_init(AST, AsmReg, AsmXMM5)')m4_dnl
m4_define(`init_AsmXMM6', `tagged_def_init(AST, AsmReg, AsmXMM6)')m4_dnl
m4_define(`init_AsmXMM7', `tagged_def_init(AST, AsmReg, AsmXMM7)')m4_dnl
m4_define(`init_AsmXMM8', `tagged_def_init(AST, AsmReg, AsmXMM8)')m4_dnl
m4_define(`init_AsmXMM9', `tagged_def_init(AST, AsmReg, AsmXMM9)')m4_dnl
m4_define(`init_AsmXMM10', `tagged_def_init(AST, AsmReg, AsmXMM10)')m4_dnl
m4_define(`init_AsmXMM11', `tagged_def_init(AST, AsmReg, AsmXMM11)')m4_dnl
m4_define(`init_AsmXMM12', `tagged_def_init(AST, AsmReg, AsmXMM12)')m4_dnl
m4_define(`init_AsmXMM13', `tagged_def_init(AST, AsmReg, AsmXMM13)')m4_dnl
m4_define(`init_AsmXMM14', `tagged_def_init(AST, AsmReg, AsmXMM14)')m4_dnl
m4_define(`init_AsmXMM15', `tagged_def_init(AST, AsmReg, AsmXMM15)')m4_dnl

type struc AsmCondCode(tagged_def_impl(AST_T))
pub fn make_AsmCondCode(tagged_def_impl(AST_T)) struc AsmCondCode;
m4_define(`init_AsmCondCode', `tagged_def_init(AST, AsmCondCode, AsmCondCode)')m4_dnl
m4_define(`init_AsmE', `tagged_def_init(AST, AsmCondCode, AsmE)')m4_dnl
m4_define(`init_AsmNE', `tagged_def_init(AST, AsmCondCode, AsmNE)')m4_dnl
m4_define(`init_AsmG', `tagged_def_init(AST, AsmCondCode, AsmG)')m4_dnl
m4_define(`init_AsmGE', `tagged_def_init(AST, AsmCondCode, AsmGE)')m4_dnl
m4_define(`init_AsmL', `tagged_def_init(AST, AsmCondCode, AsmL)')m4_dnl
m4_define(`init_AsmLE', `tagged_def_init(AST, AsmCondCode, AsmLE)')m4_dnl
m4_define(`init_AsmA', `tagged_def_init(AST, AsmCondCode, AsmA)')m4_dnl
m4_define(`init_AsmAE', `tagged_def_init(AST, AsmCondCode, AsmAE)')m4_dnl
m4_define(`init_AsmB', `tagged_def_init(AST, AsmCondCode, AsmB)')m4_dnl
m4_define(`init_AsmBE', `tagged_def_init(AST, AsmCondCode, AsmBE)')m4_dnl
m4_define(`init_AsmP', `tagged_def_init(AST, AsmCondCode, AsmP)')m4_dnl

type struc AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32)

type struc AsmRegister(reg: struc AsmReg)

type struc AsmPseudo(name: u64)

type struc AsmMemory(value: i64, reg: struc AsmReg)

type struc AsmData(name: u64, offset: i64)

type struc AsmPseudoMem(name: u64, offset: i64)

type struc AsmIndexed(scale: i64, reg_base: struc AsmReg, reg_index: struc AsmReg)

type union _AsmOperand(_AsmImm: struc AsmImm, _AsmRegister: struc AsmRegister, _AsmPseudo: struc AsmPseudo, _AsmMemory: struc AsmMemory, _AsmData: struc AsmData, _AsmPseudoMem: struc AsmPseudoMem, _AsmIndexed: struc AsmIndexed)

type struc AsmOperand(shared_ptr_impl(AST_T)
    get: union _AsmOperand)
pub fn make_AsmOperand(none) *struc AsmOperand;
pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand;
pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmPseudo(name: u64) *struc AsmOperand;
pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand;
pub fn free_AsmOperand(self: *shared_ptr_t(AsmOperand)) none;

type struc AsmBinaryOp(tagged_def_impl(AST_T))
pub fn make_AsmBinaryOp(tagged_def_impl(AST_T)) struc AsmBinaryOp;
m4_define(`init_AsmBinaryOp', `tagged_def_init(AST, AsmBinaryOp, AsmBinaryOp)')m4_dnl
m4_define(`init_AsmAdd', `tagged_def_init(AST, AsmBinaryOp, AsmAdd)')m4_dnl
m4_define(`init_AsmSub', `tagged_def_init(AST, AsmBinaryOp, AsmSub)')m4_dnl
m4_define(`init_AsmMult', `tagged_def_init(AST, AsmBinaryOp, AsmMult)')m4_dnl
m4_define(`init_AsmDivDouble', `tagged_def_init(AST, AsmBinaryOp, AsmDivDouble)')m4_dnl
m4_define(`init_AsmBitAnd', `tagged_def_init(AST, AsmBinaryOp, AsmBitAnd)')m4_dnl
m4_define(`init_AsmBitOr', `tagged_def_init(AST, AsmBinaryOp, AsmBitOr)')m4_dnl
m4_define(`init_AsmBitXor', `tagged_def_init(AST, AsmBinaryOp, AsmBitXor)')m4_dnl
m4_define(`init_AsmBitShiftLeft', `tagged_def_init(AST, AsmBinaryOp, AsmBitShiftLeft)')m4_dnl
m4_define(`init_AsmBitShiftRight', `tagged_def_init(AST, AsmBinaryOp, AsmBitShiftRight)')m4_dnl
m4_define(`init_AsmBitShrArithmetic', `tagged_def_init(AST, AsmBinaryOp, AsmBitShrArithmetic)')m4_dnl

type struc AsmUnaryOp(tagged_def_impl(AST_T))
pub fn make_AsmUnaryOp(tagged_def_impl(AST_T)) struc AsmUnaryOp;
m4_define(`init_AsmUnaryOp', `tagged_def_init(AST, AsmUnaryOp, AsmUnaryOp)')m4_dnl
m4_define(`init_AsmNot', `tagged_def_init(AST, AsmUnaryOp, AsmNot)')m4_dnl
m4_define(`init_AsmNeg', `tagged_def_init(AST, AsmUnaryOp, AsmNeg)')m4_dnl
m4_define(`init_AsmShr', `tagged_def_init(AST, AsmUnaryOp, AsmShr)')m4_dnl

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

type struc AsmInstruction(unique_ptr_impl(AST_T)
    get: union _AsmInstruction)
pub fn make_AsmInstruction(none) *struc AsmInstruction;
pub fn make_AsmMov(asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmMovSx(asm_type_src: *shared_ptr_t(AssemblyType), asm_type_dst: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmMovZeroExtend(asm_type_src: *shared_ptr_t(AssemblyType), asm_type_dst: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmLea(src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmCvttsd2si(asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmCvtsi2sd(asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: *shared_ptr_t(AssemblyType), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmCmp(asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand), dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmIdiv(asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmDiv(asm_type: *shared_ptr_t(AssemblyType), src: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmCdq(asm_type: *shared_ptr_t(AssemblyType)) *struc AsmInstruction;
pub fn make_AsmJmp(target: u64) *struc AsmInstruction;
pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction;
pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmLabel(name: u64) *struc AsmInstruction;
pub fn make_AsmPush(src: *shared_ptr_t(AsmOperand)) *struc AsmInstruction;
pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction;
pub fn make_AsmCall(name: u64) *struc AsmInstruction;
pub fn make_AsmRet(none) *struc AsmInstruction;
pub fn free_AsmInstruction(self: *unique_ptr_t(AsmInstruction)) none;

type struc AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: vector_t(unique_ptr_t(AsmInstruction)))

type struc AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: vector_t(shared_ptr_t(StaticInit)))

type struc AsmStaticConstant(name: u64, alignment: i32, static_init: *struc StaticInit)

type union _AsmTopLevel(_AsmFunction: struc AsmFunction, _AsmStaticVariable: struc AsmStaticVariable, _AsmStaticConstant: struc AsmStaticConstant)

type struc AsmTopLevel(unique_ptr_impl(AST_T)
    get: union _AsmTopLevel)
pub fn make_AsmTopLevel(none) *struc AsmTopLevel;
pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: *vector_t(unique_ptr_t(AsmInstruction))) *struc AsmTopLevel;
pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: *vector_t(shared_ptr_t(StaticInit))) *struc AsmTopLevel;
pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: *shared_ptr_t(StaticInit)) *struc AsmTopLevel;
pub fn free_AsmTopLevel(self: *unique_ptr_t(AsmTopLevel)) none;

type struc AsmProgram(unique_ptr_impl(AST_T)
    static_const_toplvls: vector_t(unique_ptr_t(AsmTopLevel)), top_levels: vector_t(unique_ptr_t(AsmTopLevel)))
pub fn make_AsmProgram(static_const_toplvls: *vector_t(unique_ptr_t(AsmTopLevel)), top_levels: *vector_t(unique_ptr_t(AsmTopLevel))) *struc AsmProgram;
pub fn free_AsmProgram(self: *unique_ptr_t(AsmProgram)) none;

')m4_dnl
