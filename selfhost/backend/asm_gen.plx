m4_include(`asm_gen.plx.m4')m4_dnl
m4_include(`registers.plx.m4')m4_dnl
m4_include(`stack_fix.plx.m4')m4_dnl
m4_include(`symt_cvt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl
m4_include(`../ast/interm_ast.plx.m4')m4_dnl





type struc TacProgram;
type struc AsmProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram;

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
type struc Type;
type struc AssemblyType;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) i32;
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType;
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none;
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
type struc ErrorsContext;
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: **i8) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: *i8) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;

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
type struc TacUnaryOp;
type struc TacBinaryOp;
type struc TacValue;
type struc TacExpResult;
type struc TacInstruction;
type struc TacTopLevel;
type struc TacProgram;

type struc TacUnaryOp(tag: i32)
pub fn make_TacUnaryOp(tag: i32) struc TacUnaryOp;
m4_define(`init_TacUnaryOp', `TODO')m4_dnl
m4_define(`init_TacComplement', `TODO')m4_dnl
m4_define(`init_TacNegate', `TODO')m4_dnl
m4_define(`init_TacNot', `TODO')m4_dnl

type struc TacBinaryOp(tag: i32)
pub fn make_TacBinaryOp(tag: i32) struc TacBinaryOp;
m4_define(`init_TacBinaryOp', `TODO')m4_dnl
m4_define(`init_TacAdd', `TODO')m4_dnl
m4_define(`init_TacSubtract', `TODO')m4_dnl
m4_define(`init_TacMultiply', `TODO')m4_dnl
m4_define(`init_TacDivide', `TODO')m4_dnl
m4_define(`init_TacRemainder', `TODO')m4_dnl
m4_define(`init_TacBitAnd', `TODO')m4_dnl
m4_define(`init_TacBitOr', `TODO')m4_dnl
m4_define(`init_TacBitXor', `TODO')m4_dnl
m4_define(`init_TacBitShiftLeft', `TODO')m4_dnl
m4_define(`init_TacBitShiftRight', `TODO')m4_dnl
m4_define(`init_TacBitShrArithmetic', `TODO')m4_dnl
m4_define(`init_TacEqual', `TODO')m4_dnl
m4_define(`init_TacNotEqual', `TODO')m4_dnl
m4_define(`init_TacLessThan', `TODO')m4_dnl
m4_define(`init_TacLessOrEqual', `TODO')m4_dnl
m4_define(`init_TacGreaterThan', `TODO')m4_dnl
m4_define(`init_TacGreaterOrEqual', `TODO')m4_dnl

type struc TacConstant(constant: *struc CConst)

type struc TacVariable(name: u64)

type union _TacValue(_TacConstant: struc TacConstant, _TacVariable: struc TacVariable)

type struc TacValue(_ref_count: u64, tag: i32, get: union _TacValue)
pub fn make_TacValue(none) *struc TacValue;
pub fn make_TacConstant(constant: **struc CConst) *struc TacValue;
pub fn make_TacVariable(name: u64) *struc TacValue;
pub fn free_TacValue(self: **struc TacValue) none;

type struc TacPlainOperand(val: *struc TacValue)

type struc TacDereferencedPointer(val: *struc TacValue)

type struc TacSubObject(base_name: u64, offset: i64)

type union _TacExpResult(_TacPlainOperand: struc TacPlainOperand, _TacDereferencedPointer: struc TacDereferencedPointer, _TacSubObject: struc TacSubObject)

type struc TacExpResult(tag: i32, get: union _TacExpResult)
pub fn make_TacExpResult(none) *struc TacExpResult;
pub fn make_TacPlainOperand(val: **struc TacValue) *struc TacExpResult;
pub fn make_TacDereferencedPointer(val: **struc TacValue) *struc TacExpResult;
pub fn make_TacSubObject(base_name: u64, offset: i64) *struc TacExpResult;
pub fn free_TacExpResult(self: **struc TacExpResult) none;

type struc TacReturn(val: *struc TacValue)

type struc TacSignExtend(src: *struc TacValue, dst: *struc TacValue)

type struc TacTruncate(src: *struc TacValue, dst: *struc TacValue)

type struc TacZeroExtend(src: *struc TacValue, dst: *struc TacValue)

type struc TacDoubleToInt(src: *struc TacValue, dst: *struc TacValue)

type struc TacDoubleToUInt(src: *struc TacValue, dst: *struc TacValue)

type struc TacIntToDouble(src: *struc TacValue, dst: *struc TacValue)

type struc TacUIntToDouble(src: *struc TacValue, dst: *struc TacValue)

type struc TacFunCall(name: u64, args: **struc TacValue, dst: *struc TacValue)

type struc TacUnary(unop: struc TacUnaryOp, src: *struc TacValue, dst: *struc TacValue)

type struc TacBinary(binop: struc TacBinaryOp, src1: *struc TacValue, src2: *struc TacValue, dst: *struc TacValue)

type struc TacCopy(src: *struc TacValue, dst: *struc TacValue)

type struc TacGetAddress(src: *struc TacValue, dst: *struc TacValue)

type struc TacLoad(src_ptr: *struc TacValue, dst: *struc TacValue)

type struc TacStore(src: *struc TacValue, dst_ptr: *struc TacValue)

type struc TacAddPtr(scale: i64, src_ptr: *struc TacValue, idx: *struc TacValue, dst: *struc TacValue)

type struc TacCopyToOffset(dst_name: u64, offset: i64, src: *struc TacValue)

type struc TacCopyFromOffset(src_name: u64, offset: i64, dst: *struc TacValue)

type struc TacJump(target: u64)

type struc TacJumpIfZero(target: u64, condition: *struc TacValue)

type struc TacJumpIfNotZero(target: u64, condition: *struc TacValue)

type struc TacLabel(name: u64)

type union _TacInstruction(_TacReturn: struc TacReturn, _TacSignExtend: struc TacSignExtend, _TacTruncate: struc TacTruncate, _TacZeroExtend: struc TacZeroExtend, _TacDoubleToInt: struc TacDoubleToInt, _TacDoubleToUInt: struc TacDoubleToUInt, _TacIntToDouble: struc TacIntToDouble, _TacUIntToDouble: struc TacUIntToDouble, _TacFunCall: struc TacFunCall, _TacUnary: struc TacUnary, _TacBinary: struc TacBinary, _TacCopy: struc TacCopy, _TacGetAddress: struc TacGetAddress, _TacLoad: struc TacLoad, _TacStore: struc TacStore, _TacAddPtr: struc TacAddPtr, _TacCopyToOffset: struc TacCopyToOffset, _TacCopyFromOffset: struc TacCopyFromOffset, _TacJump: struc TacJump, _TacJumpIfZero: struc TacJumpIfZero, _TacJumpIfNotZero: struc TacJumpIfNotZero, _TacLabel: struc TacLabel)

type struc TacInstruction(tag: i32, get: union _TacInstruction)
pub fn make_TacInstruction(none) *struc TacInstruction;
pub fn make_TacReturn(val: **struc TacValue) *struc TacInstruction;
pub fn make_TacSignExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacTruncate(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacZeroExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacDoubleToInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacDoubleToUInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacUIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacFunCall(name: u64, args: ***struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacUnary(unop: *struc TacUnaryOp, src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacBinary(binop: *struc TacBinaryOp, src1: **struc TacValue, src2: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacCopy(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacGetAddress(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacLoad(src_ptr: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacStore(src: **struc TacValue, dst_ptr: **struc TacValue) *struc TacInstruction;
pub fn make_TacAddPtr(scale: i64, src_ptr: **struc TacValue, idx: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacCopyToOffset(dst_name: u64, offset: i64, src: **struc TacValue) *struc TacInstruction;
pub fn make_TacCopyFromOffset(src_name: u64, offset: i64, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacJump(target: u64) *struc TacInstruction;
pub fn make_TacJumpIfZero(target: u64, condition: **struc TacValue) *struc TacInstruction;
pub fn make_TacJumpIfNotZero(target: u64, condition: **struc TacValue) *struc TacInstruction;
pub fn make_TacLabel(name: u64) *struc TacInstruction;
pub fn free_TacInstruction(self: **struc TacInstruction) none;

type struc TacFunction(name: u64, is_glob: i32, params: *u64, body: **struc TacInstruction)

type struc TacStaticVariable(name: u64, is_glob: i32, static_init_type: *struc Type, static_inits: **struc StaticInit)

type struc TacStaticConstant(name: u64, static_init_type: *struc Type, static_init: *struc StaticInit)

type union _TacTopLevel(_TacFunction: struc TacFunction, _TacStaticVariable: struc TacStaticVariable, _TacStaticConstant: struc TacStaticConstant)

type struc TacTopLevel(tag: i32, get: union _TacTopLevel)
pub fn make_TacTopLevel(none) *struc TacTopLevel;
pub fn make_TacFunction(name: u64, is_glob: i32, params: **u64, body: ***struc TacInstruction) *struc TacTopLevel;
pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: ***struc StaticInit) *struc TacTopLevel;
pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel;
pub fn free_TacTopLevel(self: **struc TacTopLevel) none;

type struc TacProgram(tag: i32, static_const_toplvls: **struc TacTopLevel, static_var_toplvls: **struc TacTopLevel, fun_toplvls: **struc TacTopLevel)
pub fn make_TacProgram(static_const_toplvls: ***struc TacTopLevel, static_var_toplvls: ***struc TacTopLevel, fun_toplvls: ***struc TacTopLevel) *struc TacProgram;
pub fn free_TacProgram(self: **struc TacProgram) none;
m4_define(`ASM_LABEL_KIND', `TODO')m4_dnl
m4_define(`LBL_Lcomisd_nan', `0')m4_dnl
m4_define(`LBL_Ldouble', `1')m4_dnl
m4_define(`LBL_Lsd2si_after', `2')m4_dnl
m4_define(`LBL_Lsd2si_out_of_range', `3')m4_dnl
m4_define(`LBL_Lsi2sd_after', `4')m4_dnl
m4_define(`LBL_Lsi2sd_out_of_range', `5')m4_dnl
m4_define(`STRUCT8B_CLASS', `TODO')m4_dnl
m4_define(`CLS_integer', `0')m4_dnl
m4_define(`CLS_sse', `1')m4_dnl
m4_define(`CLS_memory', `2')m4_dnl

type struc Struct8Bytes(size: u64, clss: [2]i32)

m4_define(`StStruct8Bytes', `TODO')m4_dnl

type struc PairTIdentifierStStruct8Bytes(key: u64, value: struc Struct8Bytes)

type struc AsmGenContext(frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext, p_fun_type: *struc FunType, arg_regs: [6]i32, sse_arg_regs: [8]i32, dbl_const_table: *struc PairTIdentifierTIdentifier, struct_8b_map: *struc PairTIdentifierStStruct8Bytes, p_instrs: ***struc AsmInstruction, p_static_consts: ***struc AsmTopLevel)

m4_define(`Ctx', `TODO')m4_dnl

fn char_imm_op(node: *struc CConstChar) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_neg: i32 = node[].value < 0
    return make_AsmImm(value, true, false, is_neg)
}

fn int_imm_op(node: *struc CConstInt) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_byte: i32 = node[].value <= 127 and node[].value >= -128
    is_neg: i32 = node[].value < 0
    return make_AsmImm(value, is_byte, false, is_neg)
}

fn long_imm_op(node: *struc CConstLong) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_byte: i32 = node[].value <= 127l and node[].value >= -128l
    is_quad: i32 = node[].value > 2147483647l or node[].value < -2147483648l
    is_neg: i32 = node[].value < 0l
    return make_AsmImm(value, is_byte, is_quad, is_neg)
}

fn uchar_imm(node: *struc CConstUChar) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    return make_AsmImm(value, true, false, false)
}

fn uint_imm_op(node: *struc CConstUInt) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_byte: i32 = node[].value <= 255u
    is_quad: i32 = node[].value > 2147483647u
    return make_AsmImm(value, is_byte, is_quad, false)
}

fn ulong_imm_op(node: *struc CConstULong) *struc AsmOperand {
    value: u64 = node[].value
    is_byte: i32 = node[].value <= 255ul
    is_quad: i32 = node[].value > 2147483647ul
    return make_AsmImm(value, is_byte, is_quad, false)
}

fn repr_asm_label(ctx: *struc AsmGenContext, asm_label_kind: i32) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match asm_label_kind {
        -> LBL_Lcomisd_nan {
            name = ? "comisd_nan" then sdsnew("comisd_nan") else nil
            break
        }
        -> LBL_Ldouble {
            name = ? "double" then sdsnew("double") else nil
            break
        }
        -> LBL_Lsd2si_after {
            name = ? "sd2si_after" then sdsnew("sd2si_after") else nil
            break
        }
        -> LBL_Lsd2si_out_of_range {
            name = ? "sd2si_out_of_range" then sdsnew("sd2si_out_of_range") else nil
            break
        }
        -> LBL_Lsi2sd_after {
            name = ? "si2sd_after" then sdsnew("si2sd_after") else nil
            break
        }
        -> LBL_Lsi2sd_out_of_range {
            name = ? "si2sd_out_of_range" then sdsnew("si2sd_out_of_range") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_label_identifier(ctx[].identifiers, @name)
}

fn dbl_static_const_toplvl(ctx: *struc AsmGenContext, identifier: u64, dbl_const: u64, byte: i32) none;

fn make_binary_identifier(ctx: *struc AsmGenContext, binary: u64) u64 {
    strto_binary: string = ? (binary) > 0 then sdsfromunsignedlong(cast<u64>((binary))) else sdsfromlong(cast<i64>((binary)))
    return make_string_identifier(ctx[].identifiers, @strto_binary)
}

fn dbl_static_const_op(ctx: *struc AsmGenContext, binary: u64, byte: i32) *struc AsmOperand {
    dbl_const_label: u64;
    {
        dbl_const: u64 = make_binary_identifier(ctx, binary)
        map_it: i64 = (? ((ctx[].dbl_const_table) = stbds_hmget_key((ctx[].dbl_const_table), sizeof((ctx[].dbl_const_table)[]), cast<*any>(@((dbl_const))), sizeof((ctx[].dbl_const_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].dbl_const_table) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            dbl_const_label = (ctx[].dbl_const_table[map_it]).value
        }
        else {
            dbl_const_label = repr_asm_label(ctx, LBL_Ldouble)
            loop .. while 0 {
                "@MACRO@:map_add(ctx->dbl_const_table, dbl_const, dbl_const_label)"
                loop .. while 0 {
                    (ctx[].dbl_const_table) = stbds_hmput_key((ctx[].dbl_const_table), sizeof((ctx[].dbl_const_table)[]), cast<*any>(@((dbl_const))), sizeof((ctx[].dbl_const_table)[].key), 0)
                    (ctx[].dbl_const_table)[(cast<*struc stbds_array_header>(((ctx[].dbl_const_table) - 1)) - 1)[].temp].key = (dbl_const)
                    (ctx[].dbl_const_table)[(cast<*struc stbds_array_header>(((ctx[].dbl_const_table) - 1)) - 1)[].temp].value = (dbl_const_label)
                }
            }
            dbl_static_const_toplvl(ctx, dbl_const_label, dbl_const, byte)
        }
    }
    return make_AsmData(dbl_const_label, 0l)
}

fn dbl_const_op(ctx: *struc AsmGenContext, node: *struc CConstDouble) *struc AsmOperand {
    binary: u64 = dbl_to_binary(node[].value)
    byte: i32 = ? binary == 9223372036854775808ul then 16 else 8
    return dbl_static_const_op(ctx, binary, byte)
}

fn const_op(ctx: *struc AsmGenContext, node: *struc TacConstant) *struc AsmOperand {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return char_imm_op(@node[].constant[].get._CConstChar)
        }
        -> AST_CConstInt_t {
            return int_imm_op(@node[].constant[].get._CConstInt)
        }
        -> AST_CConstLong_t {
            return long_imm_op(@node[].constant[].get._CConstLong)
        }
        -> AST_CConstDouble_t {
            return dbl_const_op(ctx, @node[].constant[].get._CConstDouble)
        }
        -> AST_CConstUChar_t {
            return uchar_imm(@node[].constant[].get._CConstUChar)
        }
        -> AST_CConstUInt_t {
            return uint_imm_op(@node[].constant[].get._CConstUInt)
        }
        -> AST_CConstULong_t {
            return ulong_imm_op(@node[].constant[].get._CConstULong)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn pseudo_op(node: *struc TacVariable) *struc AsmOperand {
    name: u64 = node[].name
    return make_AsmPseudo(name)
}

fn pseudo_mem_op(node: *struc TacVariable) *struc AsmOperand {
    name: u64 = node[].name
    return make_AsmPseudoMem(name, 0l)
}

fn var_op(ctx: *struc AsmGenContext, node: *struc TacVariable) *struc AsmOperand {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Array_t {
            -> AST_Structure_t {
                return pseudo_mem_op(node)
            }
        }
        otherwise {
            return pseudo_op(node)
        }
    }
}

fn gen_op(ctx: *struc AsmGenContext, node: *struc TacValue) *struc AsmOperand {
    match node[].tag {
        -> AST_TacConstant_t {
            return const_op(ctx, @node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return var_op(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn gen_signed_cond_code(node: *struc TacBinaryOp) struc AsmCondCode {
    match node[].tag {
        -> AST_TacEqual_t {
            return make_AsmCondCode(AST_AsmE_t)
        }
        -> AST_TacNotEqual_t {
            return make_AsmCondCode(AST_AsmNE_t)
        }
        -> AST_TacLessThan_t {
            return make_AsmCondCode(AST_AsmL_t)
        }
        -> AST_TacLessOrEqual_t {
            return make_AsmCondCode(AST_AsmLE_t)
        }
        -> AST_TacGreaterThan_t {
            return make_AsmCondCode(AST_AsmG_t)
        }
        -> AST_TacGreaterOrEqual_t {
            return make_AsmCondCode(AST_AsmGE_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn gen_unsigned_cond_code(node: *struc TacBinaryOp) struc AsmCondCode {
    match node[].tag {
        -> AST_TacEqual_t {
            return make_AsmCondCode(AST_AsmE_t)
        }
        -> AST_TacNotEqual_t {
            return make_AsmCondCode(AST_AsmNE_t)
        }
        -> AST_TacLessThan_t {
            return make_AsmCondCode(AST_AsmB_t)
        }
        -> AST_TacLessOrEqual_t {
            return make_AsmCondCode(AST_AsmBE_t)
        }
        -> AST_TacGreaterThan_t {
            return make_AsmCondCode(AST_AsmA_t)
        }
        -> AST_TacGreaterOrEqual_t {
            return make_AsmCondCode(AST_AsmAE_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn gen_unop(node: *struc TacUnaryOp) struc AsmUnaryOp {
    match node[].tag {
        -> AST_TacComplement_t {
            return make_AsmUnaryOp(AST_AsmNot_t)
        }
        -> AST_TacNegate_t {
            return make_AsmUnaryOp(AST_AsmNeg_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn gen_binop(node: *struc TacBinaryOp) struc AsmBinaryOp {
    match node[].tag {
        -> AST_TacAdd_t {
            return make_AsmBinaryOp(AST_AsmAdd_t)
        }
        -> AST_TacSubtract_t {
            return make_AsmBinaryOp(AST_AsmSub_t)
        }
        -> AST_TacMultiply_t {
            return make_AsmBinaryOp(AST_AsmMult_t)
        }
        -> AST_TacDivide_t {
            return make_AsmBinaryOp(AST_AsmDivDouble_t)
        }
        -> AST_TacBitAnd_t {
            return make_AsmBinaryOp(AST_AsmBitAnd_t)
        }
        -> AST_TacBitOr_t {
            return make_AsmBinaryOp(AST_AsmBitOr_t)
        }
        -> AST_TacBitXor_t {
            return make_AsmBinaryOp(AST_AsmBitXor_t)
        }
        -> AST_TacBitShiftLeft_t {
            return make_AsmBinaryOp(AST_AsmBitShiftLeft_t)
        }
        -> AST_TacBitShiftRight_t {
            return make_AsmBinaryOp(AST_AsmBitShiftRight_t)
        }
        -> AST_TacBitShrArithmetic_t {
            return make_AsmBinaryOp(AST_AsmBitShrArithmetic_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
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

fn is_var_signed(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
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

fn is_value_signed(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
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

fn is_const_1b(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            -> AST_CConstUChar_t {
                return true
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_var_1b(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_value_1b(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return is_const_1b(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return is_var_1b(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_const_4b(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstInt_t {
            -> AST_CConstUInt_t {
                return true
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_var_4b(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            -> AST_UInt_t {
                return true
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_value_4b(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return is_const_4b(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return is_var_4b(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_const_dbl(node: *struc TacConstant) i32 {
    return node[].constant[].tag == AST_CConstDouble_t
}

fn is_var_dbl(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
}

fn is_value_dbl(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return is_const_dbl(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return is_var_dbl(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_var_struct(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Structure_t
}

fn is_value_struct(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacVariable_t {
            return is_var_struct(ctx, @node[].get._TacVariable)
        }
        -> AST_TacConstant_t {
            return false
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn const_asm_type(node: *struc TacConstant) *struc AssemblyType {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            -> AST_CConstUChar_t {
                return make_Byte()
            }
        }
        -> AST_CConstInt_t {
            -> AST_CConstUInt_t {
                return make_LongWord()
            }
        }
        -> AST_CConstDouble_t {
            return make_BackendDouble()
        }
        -> AST_CConstLong_t {
            -> AST_CConstULong_t {
                return make_QuadWord()
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn var_asm_type(ctx: *struc AsmGenContext, node: *struc TacVariable) *struc AssemblyType {
    return cvt_backend_asm_type(ctx[].frontend, node[].name)
}

fn gen_asm_type(ctx: *struc AsmGenContext, node: *struc TacValue) *struc AssemblyType {
    match node[].tag {
        -> AST_TacConstant_t {
            return const_asm_type(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return var_asm_type(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn asm_type_8b(ctx: *struc AsmGenContext, struct_type: *struc Structure, offset: i64) *struc AssemblyType {
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size - offset
    if size >= 8l {
        return make_QuadWord()
    }
    match size {
        -> 1l {
            return make_Byte()
        }
        -> 4l {
            return make_LongWord()
        }
        otherwise {
            return make_ByteArray(size, 8)
        }
    }
}

fn struct_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none;

fn struct_1_reg_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none {
    struct_8b: struc Struct8Bytes = $(1, $(CLS_sse, CLS_memory))
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    members_front: u64 = ? struct_type[].is_union then (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) else 1
    loop i: u64 = 0 while i < members_front .. ++i {
        if struct_8b.clss[0] == CLS_integer {
            break
        }
        member_type: *struc Type = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)[].member_type
        loop while member_type[].tag == AST_Array_t {
            member_type = member_type[].get._Array.elem_type
        }
        if member_type[].tag == AST_Structure_t {
            member_struct_type: *struc Structure = @member_type[].get._Structure
            struct_8b_class(ctx, member_struct_type)
            if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == CLS_integer {
                struct_8b.clss[0] = CLS_integer
            }
        }
        elif member_type[].tag ~= AST_Double_t {
            struct_8b.clss[0] = CLS_integer
        }
    }
    loop .. while 0 {
        "@MACRO@:map_add(ctx->struct_8b_map, struct_type->tag_name, struct_8b)"
        loop .. while 0 {
            (ctx[].struct_8b_map) = stbds_hmput_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)
            (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].key = (struct_type[].tag_name)
            (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].value = (struct_8b)
        }
    }
}

fn struct_2_reg_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none {
    struct_8b: struc Struct8Bytes = $(2, $(CLS_sse, CLS_sse))
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    members_front: u64 = ? struct_type[].is_union then (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) else 1
    loop i: u64 = 0 while i < members_front .. ++i {
        if struct_8b.clss[0] == CLS_integer and struct_8b.clss[1] == CLS_integer {
            break
        }
        size: i64 = 1l
        member_type: *struc Type = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)[].member_type
        if member_type[].tag == AST_Array_t {
            loop .. while member_type[].tag == AST_Array_t {
                member_arr_type: *struc Array = @member_type[].get._Array
                member_type = member_arr_type[].elem_type
                size *= member_arr_type[].size
            }
        }
        if member_type[].tag == AST_Structure_t {
            size *= ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((member_type[].get._Structure.tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        }
        else {
            size *= gen_type_alignment(ctx[].frontend, member_type)
        }
        if size > 8l {
            if member_type[].tag == AST_Structure_t {
                member_struct_type: *struc Structure = @member_type[].get._Structure
                struct_8b_class(ctx, member_struct_type)
                member_struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
                if member_struct_8b[].size > 1 {
                    if member_struct_8b[].clss[0] == CLS_integer {
                        struct_8b.clss[0] = CLS_integer
                    }
                    if member_struct_8b[].clss[1] == CLS_integer {
                        struct_8b.clss[1] = CLS_integer
                    }
                }
                elif member_struct_8b[].clss[0] == CLS_integer {
                    struct_8b.clss[0] = CLS_integer
                    struct_8b.clss[1] = CLS_integer
                }
            }
            elif member_type[].tag ~= AST_Double_t {
                struct_8b.clss[0] = CLS_integer
                struct_8b.clss[1] = CLS_integer
            }
        }
        else {
            if member_type[].tag == AST_Structure_t {
                member_struct_type: *struc Structure = @member_type[].get._Structure
                struct_8b_class(ctx, member_struct_type)
                if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == CLS_integer {
                    struct_8b.clss[0] = CLS_integer
                }
            }
            elif member_type[].tag ~= AST_Double_t {
                struct_8b.clss[0] = CLS_integer
            }
            if not struct_type[].is_union {
                member_type = get_struct_typedef_back(ctx[].frontend, struct_type[].tag_name)[].member_type
                loop while member_type[].tag == AST_Array_t {
                    member_type = member_type[].get._Array.elem_type
                }
                if member_type[].tag == AST_Structure_t {
                    member_struct_type: *struc Structure = @member_type[].get._Structure
                    struct_8b_class(ctx, member_struct_type)
                    if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == CLS_integer {
                        struct_8b.clss[1] = CLS_integer
                    }
                }
                elif member_type[].tag ~= AST_Double_t {
                    struct_8b.clss[1] = CLS_integer
                }
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:map_add(ctx->struct_8b_map, struct_type->tag_name, struct_8b)"
        loop .. while 0 {
            (ctx[].struct_8b_map) = stbds_hmput_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)
            (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].key = (struct_type[].tag_name)
            (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].value = (struct_8b)
        }
    }
}

fn struct_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none {
    if (? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp) == -1 {
        size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        if size > 16l {
            struct_8b: struc Struct8Bytes = $(3, $(CLS_memory, CLS_memory))
            size -= 24l
            loop while size > 0l {
                struct_8b.size += 1
                size -= 8l
            }
            loop .. while 0 {
                "@MACRO@:map_add(ctx->struct_8b_map, struct_type->tag_name, struct_8b)"
                loop .. while 0 {
                    (ctx[].struct_8b_map) = stbds_hmput_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)
                    (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].key = (struct_type[].tag_name)
                    (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].value = (struct_8b)
                }
            }
        }
        elif size > 8l {
            struct_2_reg_8b_class(ctx, struct_type)
        }
        else {
            struct_1_reg_8b_class(ctx, struct_type)
        }
    }
}

fn fun_param_reg_mask(ctx: *struc AsmGenContext, fun_type: *struc FunType, reg_size: u64, sse_size: u64) none {
    if fun_type[].param_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].param_reg_mask = 0ul
        loop i: u64 = 0 while i < reg_size .. ++i {
            register_mask_set(@fun_type[].param_reg_mask, ctx[].arg_regs[i], true)
        }
        loop i: u64 = 0 while i < sse_size .. ++i {
            register_mask_set(@fun_type[].param_reg_mask, ctx[].sse_arg_regs[i], true)
        }
    }
}

fn ret_1_reg_mask(fun_type: *struc FunType, reg_size: i32) none {
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].ret_reg_mask = 0ul
        register_mask_set(@fun_type[].ret_reg_mask, ? reg_size then REG_Ax else REG_Xmm0, true)
    }
}

fn ret_2_reg_mask(fun_type: *struc FunType, reg_size: i32, sse_size: i32) none {
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].ret_reg_mask = 0ul
        if reg_size {
            register_mask_set(@fun_type[].ret_reg_mask, REG_Ax, true)
            register_mask_set(@fun_type[].ret_reg_mask, ? sse_size then REG_Xmm0 else REG_Dx, true)
        }
        elif sse_size {
            register_mask_set(@fun_type[].ret_reg_mask, REG_Xmm0, true)
            register_mask_set(@fun_type[].ret_reg_mask, REG_Xmm1, true)
        }
    }
}

fn push_instr(ctx: *struc AsmGenContext, instr: *struc AsmInstruction) none {
    loop .. while 0 {
        "@MACRO@:vec_move_back(*ctx->p_instrs, instr)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*ctx->p_instrs, instr)"
            loop .. while 0 {
                (? (not (ctx[].p_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].capacity) then (((ctx[].p_instrs[]) = stbds_arrgrowf((ctx[].p_instrs[]), sizeof((ctx[].p_instrs[])[]), (1), (0))) and 0) else 0)
                (ctx[].p_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length++] = (instr)
            }
        }
        instr = nil
    }
}

fn ret_int_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    src: *struc AsmOperand = gen_op(ctx, node[].val)
    dst: *struc AsmOperand = gen_register(REG_Ax)
    asm_type_val: *struc AssemblyType = gen_asm_type(ctx, node[].val)
    push_instr(ctx, make_AsmMov(@asm_type_val, @src, @dst))
    ret_1_reg_mask(ctx[].p_fun_type, true)
}

fn ret_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    src: *struc AsmOperand = gen_op(ctx, node[].val)
    dst: *struc AsmOperand = gen_register(REG_Xmm0)
    asm_type_val: *struc AssemblyType = make_BackendDouble()
    push_instr(ctx, make_AsmMov(@asm_type_val, @src, @dst))
    ret_1_reg_mask(ctx[].p_fun_type, false)
}

fn ret_8b_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    src_name: u64 = name
    dst: *struc AsmOperand = gen_register(arg_reg)
    asm_type_src: *struc AssemblyType = ? struct_type then asm_type_8b(ctx, struct_type, offset) else make_BackendDouble()
    if asm_type_src[].tag == AST_ByteArray_t {
        size: i64 = offset + 2l
        offset += asm_type_src[].get._ByteArray.size - 1l
        free_AssemblyType(@asm_type_src)
        asm_type_src = make_Byte()
        src_shl: *struc AsmOperand = make_AsmImm(8ul, true, false, false)
        asm_type_shl: *struc AssemblyType = make_QuadWord()
        loop while offset >= size {
            {
                src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
                dst_cp: *struc AsmOperand = sptr_new()
                if dst ~= dst_cp {
                    "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
                    free_AsmOperand(@dst_cp)
                    dst_cp = dst
                    (dst_cp)[]._ref_count++
                }
                asm_type_src_cp: *struc AssemblyType = sptr_new()
                if asm_type_src ~= asm_type_src_cp {
                    "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
                    free_AssemblyType(@asm_type_src_cp)
                    asm_type_src_cp = asm_type_src
                    (asm_type_src_cp)[]._ref_count++
                }
                push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst_cp))
            }
            {
                binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitShiftLeft_t)
                asm_type_shl_cp: *struc AssemblyType = sptr_new()
                if asm_type_shl ~= asm_type_shl_cp {
                    "@MACRO@:sptr_copy(AssemblyType, asm_type_shl, asm_type_shl_cp)"
                    free_AssemblyType(@asm_type_shl_cp)
                    asm_type_shl_cp = asm_type_shl
                    (asm_type_shl_cp)[]._ref_count++
                }
                src_shl_cp: *struc AsmOperand = sptr_new()
                if src_shl ~= src_shl_cp {
                    "@MACRO@:sptr_copy(AsmOperand, src_shl, src_shl_cp)"
                    free_AsmOperand(@src_shl_cp)
                    src_shl_cp = src_shl
                    (src_shl_cp)[]._ref_count++
                }
                dst_cp: *struc AsmOperand = sptr_new()
                if dst ~= dst_cp {
                    "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
                    free_AsmOperand(@dst_cp)
                    dst_cp = dst
                    (dst_cp)[]._ref_count++
                }
                push_instr(ctx, make_AsmBinary(@binop, @asm_type_shl_cp, @src_shl_cp, @dst_cp))
            }
            offset--
        }
        {
            src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
            dst_cp: *struc AsmOperand = sptr_new()
            if dst ~= dst_cp {
                "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
                free_AsmOperand(@dst_cp)
                dst_cp = dst
                (dst_cp)[]._ref_count++
            }
            asm_type_src_cp: *struc AssemblyType = sptr_new()
            if asm_type_src ~= asm_type_src_cp {
                "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
                free_AssemblyType(@asm_type_src_cp)
                asm_type_src_cp = asm_type_src
                (asm_type_src_cp)[]._ref_count++
            }
            push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst_cp))
        }
        {
            binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitShiftLeft_t)
            dst_cp: *struc AsmOperand = sptr_new()
            if dst ~= dst_cp {
                "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
                free_AsmOperand(@dst_cp)
                dst_cp = dst
                (dst_cp)[]._ref_count++
            }
            push_instr(ctx, make_AsmBinary(@binop, @asm_type_shl, @src_shl, @dst_cp))
        }
        offset--
        {
            src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
            push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
        }
    }
    else {
        src: *struc AsmOperand = sptr_new()
        {
            from_offset: i64 = offset
            src = make_AsmPseudoMem(src_name, from_offset)
        }

        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
}

fn ret_struct_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    name: u64 = node[].val[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    struct_8b_class(ctx, struct_type)
    struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
    if struct_8b[].clss[0] == CLS_memory {
        {
            src: *struc AsmOperand = gen_memory(REG_Bp, -8l)
            dst: *struc AsmOperand = gen_register(REG_Ax)
            asm_type_src: *struc AssemblyType = make_QuadWord()
            push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
            ret_1_reg_mask(ctx[].p_fun_type, true)
        }
        {
            size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
            offset: i64 = 0l
            loop while size > 0l {
                src: *struc AsmOperand = gen_op(ctx, node[].val)
                src[].get._AsmPseudoMem.offset = offset
                dst: *struc AsmOperand = gen_memory(REG_Ax, offset)
                asm_type_src: *struc AssemblyType = sptr_new()
                if size >= 8l {
                    asm_type_src = make_QuadWord()
                    size -= 8l
                    offset += 8l
                }
                elif size >= 4l {
                    asm_type_src = make_LongWord()
                    size -= 4l
                    offset += 4l
                }
                else {
                    asm_type_src = make_Byte()
                    size--
                    offset++
                }
                push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
            }
        }
    }
    else {
        reg_size: i32 = false
        match struct_8b[].clss[0] {
            -> CLS_integer {
                ret_8b_instr(ctx, name, 0l, struct_type, REG_Ax)
                reg_size = true
                break
            }
            -> CLS_sse {
                ret_8b_instr(ctx, name, 0l, nil, REG_Xmm0)
            }
            break
            otherwise {
                panic_sigabrt("abort")
            }
        }
        if struct_8b[].size == 2 {
            sse_size: i32 = not reg_size
            match struct_8b[].clss[1] {
                -> CLS_integer {
                    ret_8b_instr(ctx, name, 8l, struct_type, ? reg_size then REG_Dx else REG_Ax)
                }
                break
                -> CLS_sse {
                    ret_8b_instr(ctx, name, 8l, nil, ? sse_size then REG_Xmm1 else REG_Xmm0)
                    sse_size = true
                    break
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
            ret_2_reg_mask(ctx[].p_fun_type, reg_size, sse_size)
        }
        else {
            ret_1_reg_mask(ctx[].p_fun_type, reg_size)
        }
    }
}

fn ret_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    if node[].val {
        if is_value_dbl(ctx, node[].val) {
            ret_dbl_instr(ctx, node)
        }
        elif not is_value_struct(ctx, node[].val) {
            ret_int_instr(ctx, node)
        }
        else {
            ret_struct_instr(ctx, node)
        }
    }
    else {
        ret_2_reg_mask(ctx[].p_fun_type, false, false)
    }
    push_instr(ctx, make_AsmRet())
}

fn sign_extend_instr(ctx: *struc AsmGenContext, node: *struc TacSignExtend) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmMovSx(@asm_type_src, @asm_type_dst, @src, @dst))
}

fn truncate_imm_byte_instr(node: *struc AsmImm) none {
    if not node[].is_byte {
        node[].value %= 256ul
    }
}

fn truncate_byte_instr(ctx: *struc AsmGenContext, node: *struc TacTruncate) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_dst: *struc AssemblyType = make_Byte()
    if src[].tag == AST_AsmImm_t {
        truncate_imm_byte_instr(@src[].get._AsmImm)
    }
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}

fn truncate_imm_long_instr(node: *struc AsmImm) none {
    if node[].is_quad {
        node[].value -= 4294967296ul
    }
}

fn truncate_long_instr(ctx: *struc AsmGenContext, node: *struc TacTruncate) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_dst: *struc AssemblyType = make_LongWord()
    if src[].tag == AST_AsmImm_t {
        truncate_imm_long_instr(@src[].get._AsmImm)
    }
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}

fn truncate_instr(ctx: *struc AsmGenContext, node: *struc TacTruncate) none {
    if is_value_1b(ctx, node[].dst) {
        truncate_byte_instr(ctx, node)
    }
    else {
        truncate_long_instr(ctx, node)
    }
}

fn zero_extend_instr(ctx: *struc AsmGenContext, node: *struc TacZeroExtend) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmMovZeroExtend(@asm_type_src, @asm_type_dst, @src, @dst))
}

fn dbl_to_char_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToInt) none {
    src_dst: *struc AsmOperand = gen_register(REG_Ax)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @src_dst_cp))
    }

    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = make_Byte()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src_dst, @dst))
    }
}

fn dbl_to_long_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToInt) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @dst))
}

fn dbl_to_signed_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToInt) none {
    if is_value_1b(ctx, node[].dst) {
        dbl_to_char_instr(ctx, node)
    }
    else {
        dbl_to_long_instr(ctx, node)
    }
}

fn dbl_to_uchar_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    src_dst: *struc AsmOperand = gen_register(REG_Ax)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @src_dst_cp))
    }

    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = make_Byte()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src_dst, @dst))
    }
}

fn dbl_to_uint_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    src_dst: *struc AsmOperand = gen_register(REG_Ax)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @src_dst_cp))
    }

    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src_dst, @dst))
    }
}

fn dbl_to_ulong_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    target_out_of_range: u64 = repr_asm_label(ctx, LBL_Lsd2si_out_of_range)
    target_after: u64 = repr_asm_label(ctx, LBL_Lsd2si_after)
    upper_bound_sd: *struc AsmOperand = dbl_static_const_op(ctx, 4890909195324358656ul, 8)
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    dst_out_of_range_sd: *struc AsmOperand = gen_register(REG_Xmm1)
    asm_type_sd: *struc AssemblyType = make_BackendDouble()

    asm_type_si: *struc AssemblyType = make_QuadWord()
    {
        src_cp: *struc AsmOperand = sptr_new()
        if src ~= src_cp {
            "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        upper_bound_sd_cp: *struc AsmOperand = sptr_new()
        if upper_bound_sd ~= upper_bound_sd_cp {
            "@MACRO@:sptr_copy(AsmOperand, upper_bound_sd, upper_bound_sd_cp)"
            free_AsmOperand(@upper_bound_sd_cp)
            upper_bound_sd_cp = upper_bound_sd
            (upper_bound_sd_cp)[]._ref_count++
        }
        asm_type_sd_cp: *struc AssemblyType = sptr_new()
        if asm_type_sd ~= asm_type_sd_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_sd, asm_type_sd_cp)"
            free_AssemblyType(@asm_type_sd_cp)
            asm_type_sd_cp = asm_type_sd
            (asm_type_sd_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCmp(@asm_type_sd_cp, @upper_bound_sd_cp, @src_cp))
    }

    {
        cond_code_ae: struc AsmCondCode = make_AsmCondCode(AST_AsmAE_t)
        push_instr(ctx, make_AsmJmpCC(target_out_of_range, @cond_code_ae))
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
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_si_cp, @src_cp, @dst_cp))
    }
    push_instr(ctx, make_AsmJmp(target_after))
    push_instr(ctx, make_AsmLabel(target_out_of_range))
    {
        dst_out_of_range_sd_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_sd ~= dst_out_of_range_sd_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_sd, dst_out_of_range_sd_cp)"
            free_AsmOperand(@dst_out_of_range_sd_cp)
            dst_out_of_range_sd_cp = dst_out_of_range_sd
            (dst_out_of_range_sd_cp)[]._ref_count++
        }
        asm_type_sd_cp: *struc AssemblyType = sptr_new()
        if asm_type_sd ~= asm_type_sd_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_sd, asm_type_sd_cp)"
            free_AssemblyType(@asm_type_sd_cp)
            asm_type_sd_cp = asm_type_sd
            (asm_type_sd_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_sd_cp, @src, @dst_out_of_range_sd_cp))
    }
    {
        binop_out_of_range_sd_sub: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmSub_t)
        dst_out_of_range_sd_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_sd ~= dst_out_of_range_sd_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_sd, dst_out_of_range_sd_cp)"
            free_AsmOperand(@dst_out_of_range_sd_cp)
            dst_out_of_range_sd_cp = dst_out_of_range_sd
            (dst_out_of_range_sd_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_sd_sub, @asm_type_sd, @upper_bound_sd, @dst_out_of_range_sd_cp))
    }
    {
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_si_cp, @dst_out_of_range_sd, @dst_cp))
    }
    {
        binop_out_of_range_si_add: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmAdd_t)
        upper_bound_si: *struc AsmOperand = make_AsmImm(9223372036854775808ul, false, true, false)
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_si_add, @asm_type_si, @upper_bound_si, @dst))
    }
    push_instr(ctx, make_AsmLabel(target_after))
}

fn dbl_to_unsigned_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    if is_value_1b(ctx, node[].dst) {
        dbl_to_uchar_instr(ctx, node)
    }
    elif is_value_4b(ctx, node[].dst) {
        dbl_to_uint_instr(ctx, node)
    }
    else {
        dbl_to_ulong_instr(ctx, node)
    }
}

fn char_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacIntToDouble) none {
    src_dst: *struc AsmOperand = gen_register(REG_Ax)

    asm_type_dst: *struc AssemblyType = make_LongWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = make_Byte()
        asm_type_dst_cp: *struc AssemblyType = sptr_new()
        if asm_type_dst ~= asm_type_dst_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_dst, asm_type_dst_cp)"
            free_AssemblyType(@asm_type_dst_cp)
            asm_type_dst_cp = asm_type_dst
            (asm_type_dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMovSx(@asm_type_src, @asm_type_dst_cp, @src, @src_dst_cp))
    }

    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_dst, @src_dst, @dst))
    }
}

fn long_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacIntToDouble) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    push_instr(ctx, make_AsmCvtsi2sd(@asm_type_src, @src, @dst))
}

fn signed_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacIntToDouble) none {
    if is_value_1b(ctx, node[].src) {
        char_to_dbl_instr(ctx, node)
    }
    else {
        long_to_dbl_instr(ctx, node)
    }
}

fn uchar_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    src_dst: *struc AsmOperand = gen_register(REG_Ax)

    asm_type_dst: *struc AssemblyType = make_LongWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = make_Byte()
        asm_type_dst_cp: *struc AssemblyType = sptr_new()
        if asm_type_dst ~= asm_type_dst_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_dst, asm_type_dst_cp)"
            free_AssemblyType(@asm_type_dst_cp)
            asm_type_dst_cp = asm_type_dst
            (asm_type_dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMovZeroExtend(@asm_type_src, @asm_type_dst_cp, @src, @src_dst_cp))
    }

    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_dst, @src_dst, @dst))
    }
}

fn uint_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    src_dst: *struc AsmOperand = gen_register(REG_Ax)

    asm_type_dst: *struc AssemblyType = make_QuadWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = make_LongWord()
        asm_type_dst_cp: *struc AssemblyType = sptr_new()
        if asm_type_dst ~= asm_type_dst_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_dst, asm_type_dst_cp)"
            free_AssemblyType(@asm_type_dst_cp)
            asm_type_dst_cp = asm_type_dst
            (asm_type_dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMovZeroExtend(@asm_type_src, @asm_type_dst_cp, @src, @src_dst_cp))
    }

    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_dst, @src_dst, @dst))
    }
}

fn ulong_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    target_out_of_range: u64 = repr_asm_label(ctx, LBL_Lsi2sd_out_of_range)
    target_after: u64 = repr_asm_label(ctx, LBL_Lsi2sd_after)
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    dst_out_of_range_si: *struc AsmOperand = gen_register(REG_Ax)
    dst_out_of_range_si_shr: *struc AsmOperand = gen_register(REG_Dx)

    asm_type_si: *struc AssemblyType = make_QuadWord()
    {
        lower_bound_si: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        src_cp: *struc AsmOperand = sptr_new()
        if src ~= src_cp {
            "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCmp(@asm_type_si_cp, @lower_bound_si, @src_cp))
    }

    {
        cond_code_l: struc AsmCondCode = make_AsmCondCode(AST_AsmL_t)
        push_instr(ctx, make_AsmJmpCC(target_out_of_range, @cond_code_l))
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
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_si_cp, @src_cp, @dst_cp))
    }
    push_instr(ctx, make_AsmJmp(target_after))
    push_instr(ctx, make_AsmLabel(target_out_of_range))
    {
        dst_out_of_range_si_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_si ~= dst_out_of_range_si_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_si, dst_out_of_range_si_cp)"
            free_AsmOperand(@dst_out_of_range_si_cp)
            dst_out_of_range_si_cp = dst_out_of_range_si
            (dst_out_of_range_si_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_si_cp, @src, @dst_out_of_range_si_cp))
    }
    {
        dst_out_of_range_si_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_si ~= dst_out_of_range_si_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_si, dst_out_of_range_si_cp)"
            free_AsmOperand(@dst_out_of_range_si_cp)
            dst_out_of_range_si_cp = dst_out_of_range_si
            (dst_out_of_range_si_cp)[]._ref_count++
        }
        dst_out_of_range_si_shr_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_si_shr ~= dst_out_of_range_si_shr_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_si_shr, dst_out_of_range_si_shr_cp)"
            free_AsmOperand(@dst_out_of_range_si_shr_cp)
            dst_out_of_range_si_shr_cp = dst_out_of_range_si_shr
            (dst_out_of_range_si_shr_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_si_cp, @dst_out_of_range_si_cp, @dst_out_of_range_si_shr_cp))
    }
    {
        unop_out_of_range_si_shr: struc AsmUnaryOp = make_AsmUnaryOp(AST_AsmShr_t)
        dst_out_of_range_si_shr_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_si_shr ~= dst_out_of_range_si_shr_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_si_shr, dst_out_of_range_si_shr_cp)"
            free_AsmOperand(@dst_out_of_range_si_shr_cp)
            dst_out_of_range_si_shr_cp = dst_out_of_range_si_shr
            (dst_out_of_range_si_shr_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmUnary(@unop_out_of_range_si_shr, @asm_type_si_cp, @dst_out_of_range_si_shr_cp))
    }
    {
        binop_out_of_range_si_and: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitAnd_t)
        set_bit_si: *struc AsmOperand = make_AsmImm(1ul, true, false, false)
        dst_out_of_range_si_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_si ~= dst_out_of_range_si_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_si, dst_out_of_range_si_cp)"
            free_AsmOperand(@dst_out_of_range_si_cp)
            dst_out_of_range_si_cp = dst_out_of_range_si
            (dst_out_of_range_si_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_si_and, @asm_type_si_cp, @set_bit_si, @dst_out_of_range_si_cp))
    }
    {
        binop_out_of_range_si_or: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitOr_t)
        dst_out_of_range_si_shr_cp: *struc AsmOperand = sptr_new()
        if dst_out_of_range_si_shr ~= dst_out_of_range_si_shr_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_out_of_range_si_shr, dst_out_of_range_si_shr_cp)"
            free_AsmOperand(@dst_out_of_range_si_shr_cp)
            dst_out_of_range_si_shr_cp = dst_out_of_range_si_shr
            (dst_out_of_range_si_shr_cp)[]._ref_count++
        }
        asm_type_si_cp: *struc AssemblyType = sptr_new()
        if asm_type_si ~= asm_type_si_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_si, asm_type_si_cp)"
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_si_or, @asm_type_si_cp, @dst_out_of_range_si, @dst_out_of_range_si_shr_cp))
    }
    {
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_si, @dst_out_of_range_si_shr, @dst_cp))
    }
    {
        binop_out_of_range_sq_add: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmAdd_t)
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        asm_type_sq: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_sq_add, @asm_type_sq, @dst, @dst_cp))
    }
    push_instr(ctx, make_AsmLabel(target_after))
}

fn unsigned_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    if is_value_1b(ctx, node[].src) {
        uchar_to_dbl_instr(ctx, node)
    }
    elif is_value_4b(ctx, node[].src) {
        uint_to_dbl_instr(ctx, node)
    }
    else {
        ulong_to_dbl_instr(ctx, node)
    }
}

fn alloc_stack_instr(ctx: *struc AsmGenContext, byte: i64) none {
    push_instr(ctx, alloc_stack_bytes(byte))
}

fn dealloc_stack_instr(ctx: *struc AsmGenContext, byte: i64) none {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmAdd_t)
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
    push_instr(ctx, make_AsmBinary(@binop, @asm_type, @src, @dst))
}

fn reg_arg_call_instr(ctx: *struc AsmGenContext, node: *struc TacValue, arg_reg: i32) none {
    src: *struc AsmOperand = gen_op(ctx, node)
    dst: *struc AsmOperand = gen_register(arg_reg)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node)
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}

fn stack_arg_call_instr(ctx: *struc AsmGenContext, node: *struc TacValue) none {
    src: *struc AsmOperand = gen_op(ctx, node)
    match src[].tag {
        -> AST_AsmRegister_t {
            -> AST_AsmImm_t {
                push_instr(ctx, make_AsmPush(@src))
            }
        }
        return none
        otherwise {
            break
        }
    }
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node)
    match asm_type_src[].tag {
        -> AST_QuadWord_t {
            -> AST_BackendDouble_t {
                push_instr(ctx, make_AsmPush(@src))
            }
        }
        free_AssemblyType(@asm_type_src)
        return none
        otherwise {
            break
        }
    }

    dst: *struc AsmOperand = gen_register(REG_Ax)
    {
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmPush(@dst_cp))
    }

    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}

fn reg_8b_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    ret_8b_instr(ctx, name, offset, struct_type, arg_reg)
}

fn quad_stack_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64) none {
    src: *struc AsmOperand = sptr_new()
    {
        src_name: u64 = name
        from_offset: i64 = offset
        src = make_AsmPseudoMem(src_name, from_offset)
    }

    push_instr(ctx, make_AsmPush(@src))
}

fn long_stack_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, asm_type: **struc AssemblyType) none {
    src: *struc AsmOperand = sptr_new()
    {
        src_name: u64 = name
        from_offset: i64 = offset
        src = make_AsmPseudoMem(src_name, from_offset)
    }

    dst: *struc AsmOperand = gen_register(REG_Ax)
    {
        dst_cp: *struc AsmOperand = sptr_new()
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmPush(@dst_cp))
    }
    asm_type_src: *struc AssemblyType = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, asm_type_src)"
        if asm_type[] ~= asm_type_src {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, asm_type_src)"
            free_AssemblyType(@asm_type_src)
            asm_type_src = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}

fn bytearr_stack_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, bytearr_type: *struc ByteArray) none {
    {
        to_offset: i64 = 0l
        size: i64 = bytearr_type[].size
        byte_instrs: **struc AsmInstruction = vec_new()
        loop while size > 0l {
            byte_instr: *struc AsmInstruction = uptr_new()
            {
                src: *struc AsmOperand = make_AsmPseudoMem(name, offset)
                dst: *struc AsmOperand = gen_memory(REG_Sp, to_offset)
                asm_type_src: *struc AssemblyType = sptr_new()
                if size >= 4l {
                    asm_type_src = make_LongWord()
                    size -= 4l
                    offset += 4l
                    to_offset += 4l
                }
                else {
                    asm_type_src = make_Byte()
                    size--
                    offset++
                    to_offset++
                }
                byte_instr = make_AsmMov(@asm_type_src, @src, @dst)
            }

            loop .. while 0 {
                "@MACRO@:vec_move_back(byte_instrs, byte_instr)"
                loop .. while 0 {
                    "@MACRO@:vec_push_back(byte_instrs, byte_instr)"
                    loop .. while 0 {
                        (? (not (byte_instrs) or (cast<*struc stbds_array_header>((byte_instrs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((byte_instrs)) - 1)[].capacity) then (((byte_instrs) = stbds_arrgrowf((byte_instrs), sizeof((byte_instrs)[]), (1), (0))) and 0) else 0)
                        (byte_instrs)[(cast<*struc stbds_array_header>((byte_instrs)) - 1)[].length++] = (byte_instr)
                    }
                }
                byte_instr = nil
            }
        }
        loop i: u64 = (? (byte_instrs) then (cast<*struc stbds_array_header>((byte_instrs)) - 1)[].length else 0) while i-- > 0 {
            push_instr(ctx, byte_instrs[i])
            byte_instrs[i] = uptr_new()
        }
        if byte_instrs {
            "@MACRO@:vec_delete(byte_instrs)"
            loop .. while 0 {
                cast<none>((? (byte_instrs) then free((cast<*struc stbds_array_header>((byte_instrs)) - 1)) else cast<none>(0)))
                (byte_instrs) = nil
            }
            byte_instrs = vec_new()
        }
    }
    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmSub_t)
        src: *struc AsmOperand = make_AsmImm(8ul, true, false, false)
        dst: *struc AsmOperand = gen_register(REG_Sp)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src, @src, @dst))
    }
}

fn stack_8b_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure) none {
    asm_type: *struc AssemblyType = asm_type_8b(ctx, struct_type, offset)
    match asm_type[].tag {
        -> AST_QuadWord_t {
            quad_stack_arg_call_instr(ctx, name, offset)
        }
        break
        -> AST_ByteArray_t {
            bytearr_stack_arg_call_instr(ctx, name, offset, @asm_type[].get._ByteArray)
        }
        break
        otherwise {
            long_stack_arg_call_instr(ctx, name, offset, @asm_type)
        }
        break
    }
    free_AssemblyType(@asm_type)
}

fn arg_call_instr(ctx: *struc AsmGenContext, node: *struc TacFunCall, fun_type: *struc FunType, is_ret_memory: i32) i64 {
    reg_size: u64 = ? is_ret_memory then 1 else 0
    sse_size: u64 = 0
    stack_padding: i64 = 0l
    stack_instrs: **struc AsmInstruction = vec_new()
    p_instrs: ***struc AsmInstruction = ctx[].p_instrs
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        arg: *struc TacValue = node[].args[i]
        if is_value_dbl(ctx, arg) {
            if sse_size < 8 {
                reg_arg_call_instr(ctx, arg, ctx[].sse_arg_regs[sse_size])
                sse_size++
            }
            else {
                ctx[].p_instrs = @stack_instrs
                stack_arg_call_instr(ctx, arg)
                ctx[].p_instrs = p_instrs
                stack_padding++
            }
        }
        elif not is_value_struct(ctx, arg) {
            if reg_size < 6 {
                reg_arg_call_instr(ctx, arg, ctx[].arg_regs[reg_size])
                reg_size++
            }
            else {
                ctx[].p_instrs = @stack_instrs
                stack_arg_call_instr(ctx, arg)
                ctx[].p_instrs = p_instrs
                stack_padding++
            }
        }
        else {
            struct_reg_size: u64 = 7
            struct_sse_size: u64 = 9
            name: u64 = arg[].get._TacVariable.name
            struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
            struct_8b_class(ctx, struct_type)
            struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
            if struct_8b[].clss[0] ~= CLS_memory {
                struct_reg_size = 0
                struct_sse_size = 0
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == CLS_sse {
                        struct_sse_size++
                    }
                    else {
                        struct_reg_size++
                    }
                }
            }
            if struct_reg_size + reg_size <= 6 and struct_sse_size + sse_size <= 8 {
                offset: i64 = 0l
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == CLS_sse {
                        reg_8b_arg_call_instr(ctx, name, offset, nil, ctx[].sse_arg_regs[sse_size])
                        sse_size++
                    }
                    else {
                        reg_8b_arg_call_instr(ctx, name, offset, struct_type, ctx[].arg_regs[reg_size])
                        reg_size++
                    }
                    offset += 8l
                }
            }
            else {
                offset: i64 = 0l
                ctx[].p_instrs = @stack_instrs
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    stack_8b_arg_call_instr(ctx, name, offset, struct_type)
                    offset += 8l
                    stack_padding++
                }
                ctx[].p_instrs = p_instrs
            }
        }
    }
    fun_param_reg_mask(ctx, fun_type, reg_size, sse_size)
    if stack_padding % 2l == 1l {
        alloc_stack_instr(ctx, 8l)
        stack_padding++
    }
    stack_padding *= 8l
    loop i: u64 = (? (stack_instrs) then (cast<*struc stbds_array_header>((stack_instrs)) - 1)[].length else 0) while i-- > 0 {
        push_instr(ctx, stack_instrs[i])
        stack_instrs[i] = uptr_new()
    }
    if stack_instrs {
        "@MACRO@:vec_delete(stack_instrs)"
        loop .. while 0 {
            cast<none>((? (stack_instrs) then free((cast<*struc stbds_array_header>((stack_instrs)) - 1)) else cast<none>(0)))
            (stack_instrs) = nil
        }
        stack_instrs = vec_new()
    }
    return stack_padding
}

fn ret_call_instr(ctx: *struc AsmGenContext, node: *struc TacValue, arg_reg: i32) none {
    src: *struc AsmOperand = gen_register(arg_reg)
    dst: *struc AsmOperand = gen_op(ctx, node)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}

fn ret_8b_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    dst_name: u64 = name
    src: *struc AsmOperand = gen_register(arg_reg)
    asm_type_dst: *struc AssemblyType = ? struct_type then asm_type_8b(ctx, struct_type, offset) else make_BackendDouble()
    if asm_type_dst[].tag == AST_ByteArray_t {
        size: i64 = asm_type_dst[].get._ByteArray.size + offset - 2l
        free_AssemblyType(@asm_type_dst)
        asm_type_dst = make_Byte()
        src_shr2op: *struc AsmOperand = make_AsmImm(8ul, true, false, false)
        asm_type_shr2op: *struc AssemblyType = make_QuadWord()
        loop while offset < size {
            {
                src_cp: *struc AsmOperand = sptr_new()
                if src ~= src_cp {
                    "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
                    free_AsmOperand(@src_cp)
                    src_cp = src
                    (src_cp)[]._ref_count++
                }
                dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
                asm_type_dst_cp: *struc AssemblyType = sptr_new()
                if asm_type_dst ~= asm_type_dst_cp {
                    "@MACRO@:sptr_copy(AssemblyType, asm_type_dst, asm_type_dst_cp)"
                    free_AssemblyType(@asm_type_dst_cp)
                    asm_type_dst_cp = asm_type_dst
                    (asm_type_dst_cp)[]._ref_count++
                }
                push_instr(ctx, make_AsmMov(@asm_type_dst_cp, @src_cp, @dst))
            }
            {
                binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitShiftRight_t)
                src_shr2op_cp: *struc AsmOperand = sptr_new()
                if src_shr2op ~= src_shr2op_cp {
                    "@MACRO@:sptr_copy(AsmOperand, src_shr2op, src_shr2op_cp)"
                    free_AsmOperand(@src_shr2op_cp)
                    src_shr2op_cp = src_shr2op
                    (src_shr2op_cp)[]._ref_count++
                }
                src_cp: *struc AsmOperand = sptr_new()
                if src ~= src_cp {
                    "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
                    free_AsmOperand(@src_cp)
                    src_cp = src
                    (src_cp)[]._ref_count++
                }
                asm_type_shr2op_cp: *struc AssemblyType = sptr_new()
                if asm_type_shr2op ~= asm_type_shr2op_cp {
                    "@MACRO@:sptr_copy(AssemblyType, asm_type_shr2op, asm_type_shr2op_cp)"
                    free_AssemblyType(@asm_type_shr2op_cp)
                    asm_type_shr2op_cp = asm_type_shr2op
                    (asm_type_shr2op_cp)[]._ref_count++
                }
                push_instr(ctx, make_AsmBinary(@binop, @asm_type_shr2op_cp, @src_shr2op_cp, @src_cp))
            }
            offset++
        }
        {
            src_cp: *struc AsmOperand = sptr_new()
            if src ~= src_cp {
                "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
                free_AsmOperand(@src_cp)
                src_cp = src
                (src_cp)[]._ref_count++
            }
            dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
            asm_type_dst_cp: *struc AssemblyType = sptr_new()
            if asm_type_dst ~= asm_type_dst_cp {
                "@MACRO@:sptr_copy(AssemblyType, asm_type_dst, asm_type_dst_cp)"
                free_AssemblyType(@asm_type_dst_cp)
                asm_type_dst_cp = asm_type_dst
                (asm_type_dst_cp)[]._ref_count++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst_cp, @src_cp, @dst))
        }
        {
            binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitShiftRight_t)
            src_cp: *struc AsmOperand = sptr_new()
            if src ~= src_cp {
                "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
                free_AsmOperand(@src_cp)
                src_cp = src
                (src_cp)[]._ref_count++
            }
            push_instr(ctx, make_AsmBinary(@binop, @asm_type_shr2op, @src_shr2op, @src_cp))
        }
        offset++
        {
            dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
    else {
        dst: *struc AsmOperand = sptr_new()
        {
            to_offset: i64 = offset
            dst = make_AsmPseudoMem(dst_name, to_offset)
        }

        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}

fn call_instr(ctx: *struc AsmGenContext, node: *struc TacFunCall) none {
    is_ret_memory: i32 = false
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    if node[].dst and is_value_struct(ctx, node[].dst) {
        name: u64 = node[].dst[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        struct_8b_class(ctx, struct_type)
        if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == CLS_memory {
            is_ret_memory = true
            {
                src: *struc AsmOperand = gen_op(ctx, node[].dst)
                dst: *struc AsmOperand = gen_register(REG_Di)
                push_instr(ctx, make_AsmLea(@src, @dst))
            }
        }
    }
    {
        stack_padding: i64 = arg_call_instr(ctx, node, fun_type, is_ret_memory)
        {
            name: u64 = node[].name
            push_instr(ctx, make_AsmCall(name))
        }
        if stack_padding > 0l {
            dealloc_stack_instr(ctx, stack_padding)
        }
    }
    if not node[].dst {
        ret_2_reg_mask(fun_type, false, false)
    }
    elif is_ret_memory {
        ret_1_reg_mask(fun_type, true)
    }
    elif is_value_dbl(ctx, node[].dst) {
        ret_call_instr(ctx, node[].dst, REG_Xmm0)
        ret_1_reg_mask(fun_type, false)
    }
    elif not is_value_struct(ctx, node[].dst) {
        ret_call_instr(ctx, node[].dst, REG_Ax)
        ret_1_reg_mask(fun_type, true)
    }
    else {
        reg_size: i32 = false
        name: u64 = node[].dst[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
        match struct_8b[].clss[0] {
            -> CLS_integer {
                ret_8b_call_instr(ctx, name, 0l, struct_type, REG_Ax)
                reg_size = true
                break
            }
            -> CLS_sse {
                ret_8b_call_instr(ctx, name, 0l, nil, REG_Xmm0)
            }
            break
            otherwise {
                panic_sigabrt("abort")
            }
        }
        if struct_8b[].size == 2 {
            sse_size: i32 = not reg_size
            match struct_8b[].clss[1] {
                -> CLS_integer {
                    ret_8b_call_instr(ctx, name, 8l, struct_type, ? reg_size then REG_Dx else REG_Ax)
                }
                break
                -> CLS_sse {
                    ret_8b_call_instr(ctx, name, 8l, nil, ? sse_size then REG_Xmm1 else REG_Xmm0)
                    sse_size = true
                    break
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
            ret_2_reg_mask(fun_type, reg_size, sse_size)
        }
        else {
            ret_1_reg_mask(fun_type, reg_size)
        }
    }
}

fn zero_xmm_reg_instr(ctx: *struc AsmGenContext) none {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitXor_t)
    src: *struc AsmOperand = gen_register(REG_Xmm0)
    src_cp: *struc AsmOperand = sptr_new()
    if src ~= src_cp {
        "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
        free_AsmOperand(@src_cp)
        src_cp = src
        (src_cp)[]._ref_count++
    }
    asm_type_src: *struc AssemblyType = make_BackendDouble()
    push_instr(ctx, make_AsmBinary(@binop, @asm_type_src, @src, @src_cp))
}

fn unop_int_arithmetic_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    src_dst: *struc AsmOperand = gen_op(ctx, node[].dst)

    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src_cp: *struc AssemblyType = sptr_new()
        if asm_type_src ~= asm_type_src_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @src_dst_cp))
    }

    {
        unop: struc AsmUnaryOp = gen_unop(@node[].unop)
        push_instr(ctx, make_AsmUnary(@unop, @asm_type_src, @src_dst))
    }
}

fn unop_dbl_neg_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    src1_dst: *struc AsmOperand = gen_op(ctx, node[].dst)

    asm_type_src1: *struc AssemblyType = make_BackendDouble()
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src)
        src1_dst_cp: *struc AsmOperand = sptr_new()
        if src1_dst ~= src1_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src1_dst, src1_dst_cp)"
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }

    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmBitXor_t)
        src2: *struc AsmOperand = dbl_static_const_op(ctx, 9223372036854775808ul, 16)
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src1, @src2, @src1_dst))
    }
}

fn unop_neg_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    if is_value_dbl(ctx, node[].src) {
        unop_dbl_neg_instr(ctx, node)
    }
    else {
        unop_int_arithmetic_instr(ctx, node)
    }
}

fn unop_int_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)

    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        imm_zero_cp: *struc AsmOperand = sptr_new()
        if imm_zero ~= imm_zero_cp {
            "@MACRO@:sptr_copy(AsmOperand, imm_zero, imm_zero_cp)"
            free_AsmOperand(@imm_zero_cp)
            imm_zero_cp = imm_zero
            (imm_zero_cp)[]._ref_count++
        }
        asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
        push_instr(ctx, make_AsmCmp(@asm_type_src, @imm_zero_cp, @src))
    }

    {
        cmp_dst_cp: *struc AsmOperand = sptr_new()
        if cmp_dst ~= cmp_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, cmp_dst, cmp_dst_cp)"
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code_e: struc AsmCondCode = make_AsmCondCode(AST_AsmE_t)
        push_instr(ctx, make_AsmSetCC(@cond_code_e, @cmp_dst))
    }
}

fn unop_dbl_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    target_nan: u64 = repr_asm_label(ctx, LBL_Lcomisd_nan)
    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    zero_xmm_reg_instr(ctx)
    {
        reg_zero: *struc AsmOperand = gen_register(REG_Xmm0)
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        asm_type_src: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmCmp(@asm_type_src, @reg_zero, @src))
    }
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        cmp_dst_cp: *struc AsmOperand = sptr_new()
        if cmp_dst ~= cmp_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, cmp_dst, cmp_dst_cp)"
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        asm_type_dst: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(AST_AsmP_t)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        cond_code_e: struc AsmCondCode = make_AsmCondCode(AST_AsmE_t)
        push_instr(ctx, make_AsmSetCC(@cond_code_e, @cmp_dst))
    }
    push_instr(ctx, make_AsmLabel(target_nan))
}

fn unop_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    if is_value_dbl(ctx, node[].src) {
        unop_dbl_conditional_instr(ctx, node)
    }
    else {
        unop_int_conditional_instr(ctx, node)
    }
}

fn unary_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    match node[].unop.tag {
        -> AST_TacComplement_t {
            unop_int_arithmetic_instr(ctx, node)
        }
        break
        -> AST_TacNegate_t {
            unop_neg_instr(ctx, node)
        }
        break
        -> AST_TacNot_t {
            unop_conditional_instr(ctx, node)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn binop_arithmetic_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    src1_dst: *struc AsmOperand = gen_op(ctx, node[].dst)

    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst_cp: *struc AsmOperand = sptr_new()
        if src1_dst ~= src1_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src1_dst, src1_dst_cp)"
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }

    {
        binop: struc AsmBinaryOp = gen_binop(@node[].binop)
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src1, @src2, @src1_dst))
    }
}

fn signed_divide_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    src1_dst: *struc AsmOperand = gen_register(REG_Ax)

    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst_cp: *struc AsmOperand = sptr_new()
        if src1_dst ~= src1_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src1_dst, src1_dst_cp)"
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }

    {
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCdq(@asm_type_src1_cp))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmIdiv(@asm_type_src1_cp, @src2))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @src1_dst, @dst))
    }
}

fn unsigned_divide_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    src1_dst: *struc AsmOperand = gen_register(REG_Ax)

    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst_cp: *struc AsmOperand = sptr_new()
        if src1_dst ~= src1_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src1_dst, src1_dst_cp)"
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }

    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        imm_zero_dst: *struc AsmOperand = gen_register(REG_Dx)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @imm_zero, @imm_zero_dst))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmDiv(@asm_type_src1_cp, @src2))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @src1_dst, @dst))
    }
}

fn binop_divide_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    if is_value_dbl(ctx, node[].src1) {
        binop_arithmetic_instr(ctx, node)
    }
    elif is_value_signed(ctx, node[].src1) {
        signed_divide_instr(ctx, node)
    }
    else {
        unsigned_divide_instr(ctx, node)
    }
}

fn signed_remainder_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst))
    }

    {
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmCdq(@asm_type_src1_cp))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmIdiv(@asm_type_src1_cp, @src2))
    }
    {
        dst_src: *struc AsmOperand = gen_register(REG_Dx)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @dst_src, @dst))
    }
}

fn unsigned_remainder_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    dst_src: *struc AsmOperand = gen_register(REG_Dx)

    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst))
    }

    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        dst_src_cp: *struc AsmOperand = sptr_new()
        if dst_src ~= dst_src_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst_src, dst_src_cp)"
            free_AsmOperand(@dst_src_cp)
            dst_src_cp = dst_src
            (dst_src_cp)[]._ref_count++
        }
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @imm_zero, @dst_src_cp))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = sptr_new()
        if asm_type_src1 ~= asm_type_src1_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src1, asm_type_src1_cp)"
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmDiv(@asm_type_src1_cp, @src2))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @dst_src, @dst))
    }
}

fn binop_remainder_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    if is_value_signed(ctx, node[].src1) {
        signed_remainder_instr(ctx, node)
    }
    else {
        unsigned_remainder_instr(ctx, node)
    }
}

fn binop_int_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
        push_instr(ctx, make_AsmCmp(@asm_type_src1, @src2, @src1))
    }

    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        cmp_dst_cp: *struc AsmOperand = sptr_new()
        if cmp_dst ~= cmp_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, cmp_dst, cmp_dst_cp)"
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code: struc AsmCondCode = make_AsmCondCode(AST_AsmCondCode_t)
        if is_value_signed(ctx, node[].src1) {
            cond_code = gen_signed_cond_code(@node[].binop)
        }
        else {
            cond_code = gen_unsigned_cond_code(@node[].binop)
        }
        push_instr(ctx, make_AsmSetCC(@cond_code, @cmp_dst))
    }
}

fn binop_dbl_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    target_nan: u64 = repr_asm_label(ctx, LBL_Lcomisd_nan)

    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
        push_instr(ctx, make_AsmCmp(@asm_type_src1, @src2, @src1))
    }

    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        cmp_dst_cp: *struc AsmOperand = sptr_new()
        if cmp_dst ~= cmp_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, cmp_dst, cmp_dst_cp)"
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        asm_type_dst: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(AST_AsmP_t)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        cond_code: struc AsmCondCode = gen_unsigned_cond_code(@node[].binop)
        if cond_code.tag == AST_AsmNE_t {
            target_nan_ne: u64 = repr_asm_label(ctx, LBL_Lcomisd_nan)
            {
                cmp_dst_cp: *struc AsmOperand = sptr_new()
                if cmp_dst ~= cmp_dst_cp {
                    "@MACRO@:sptr_copy(AsmOperand, cmp_dst, cmp_dst_cp)"
                    free_AsmOperand(@cmp_dst_cp)
                    cmp_dst_cp = cmp_dst
                    (cmp_dst_cp)[]._ref_count++
                }
                push_instr(ctx, make_AsmSetCC(@cond_code, @cmp_dst_cp))
            }
            push_instr(ctx, make_AsmJmp(target_nan_ne))
            push_instr(ctx, make_AsmLabel(target_nan))
            {
                cond_code_e: struc AsmCondCode = make_AsmCondCode(AST_AsmE_t)
                push_instr(ctx, make_AsmSetCC(@cond_code_e, @cmp_dst))
            }
            push_instr(ctx, make_AsmLabel(target_nan_ne))
        }
        else {
            push_instr(ctx, make_AsmSetCC(@cond_code, @cmp_dst))
            push_instr(ctx, make_AsmLabel(target_nan))
        }
    }
}

fn binop_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    if is_value_dbl(ctx, node[].src1) {
        binop_dbl_conditional_instr(ctx, node)
    }
    else {
        binop_int_conditional_instr(ctx, node)
    }
}

fn binary_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    match node[].binop.tag {
        -> AST_TacAdd_t {
            -> AST_TacSubtract_t {
                -> AST_TacMultiply_t {
                    -> AST_TacBitAnd_t {
                        -> AST_TacBitOr_t {
                            -> AST_TacBitXor_t {
                                -> AST_TacBitShiftLeft_t {
                                    -> AST_TacBitShiftRight_t {
                                        -> AST_TacBitShrArithmetic_t {
                                            binop_arithmetic_instr(ctx, node)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> AST_TacDivide_t {
            binop_divide_instr(ctx, node)
        }
        break
        -> AST_TacRemainder_t {
            binop_remainder_instr(ctx, node)
        }
        break
        -> AST_TacEqual_t {
            -> AST_TacNotEqual_t {
                -> AST_TacLessThan_t {
                    -> AST_TacLessOrEqual_t {
                        -> AST_TacGreaterThan_t {
                            -> AST_TacGreaterOrEqual_t {
                                binop_conditional_instr(ctx, node)
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn copy_struct_instr(ctx: *struc AsmGenContext, node: *struc TacCopy) none {
    src_name: u64 = node[].src[].get._TacVariable.name
    dst_name: u64 = node[].dst[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    offset: i64 = 0l
    loop while size > 0l {
        src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
        dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
        asm_type_src: *struc AssemblyType = sptr_new()
        if size >= 8l {
            asm_type_src = make_QuadWord()
            size -= 8l
            offset += 8l
        }
        elif size >= 4l {
            asm_type_src = make_LongWord()
            size -= 4l
            offset += 4l
        }
        else {
            asm_type_src = make_Byte()
            size--
            offset++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
}

fn copy_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacCopy) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}

fn copy_instr(ctx: *struc AsmGenContext, node: *struc TacCopy) none {
    if is_value_struct(ctx, node[].src) {
        copy_struct_instr(ctx, node)
    }
    else {
        copy_scalar_instr(ctx, node)
    }
}

fn getaddr_instr(ctx: *struc AsmGenContext, node: *struc TacGetAddress) none {
    src: *struc AsmOperand = sptr_new()
    {
        if node[].src[].tag == AST_TacVariable_t {
            name: u64 = node[].src[].get._TacVariable.name
            loop .. while 0 {
                "@MACRO@:set_insert(ctx->frontend->addressed_set, name)"
                loop .. while 0 {
                    "@MACRO@:map_add(ctx->frontend->addressed_set, name, 0)"
                    loop .. while 0 {
                        (ctx[].frontend[].addressed_set) = stbds_hmput_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)
                        (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].key = (name)
                        (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].value = (0)
                    }
                }
            }
            map_it: i64 = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
            if map_it ~= -1 and (ctx[].frontend[].symbol_table[map_it]).value[].attrs[].tag == AST_ConstantAttr_t {
                src = make_AsmData(name, 0l)
                jump Lpass
            }
        }
        src = gen_op(ctx, node[].src)
        label Lpass
    }
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    push_instr(ctx, make_AsmLea(@src, @dst))
}

fn load_struct_instr(ctx: *struc AsmGenContext, node: *struc TacLoad) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        name: u64 = node[].dst[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        offset: i64 = 0l
        loop while size > 0l {
            src: *struc AsmOperand = gen_memory(REG_Ax, offset)
            dst: *struc AsmOperand = make_AsmPseudoMem(name, offset)
            asm_type_dst: *struc AssemblyType = sptr_new()
            if size >= 8l {
                asm_type_dst = make_QuadWord()
                size -= 8l
                offset += 8l
            }
            elif size >= 4l {
                asm_type_dst = make_LongWord()
                size -= 4l
                offset += 4l
            }
            else {
                asm_type_dst = make_Byte()
                size--
                offset++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
}

fn load_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacLoad) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_memory(REG_Ax, 0l)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}

fn load_instr(ctx: *struc AsmGenContext, node: *struc TacLoad) none {
    if is_value_struct(ctx, node[].dst) {
        load_struct_instr(ctx, node)
    }
    else {
        load_scalar_instr(ctx, node)
    }
}

fn store_struct_instr(ctx: *struc AsmGenContext, node: *struc TacStore) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].dst_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        name: u64 = node[].src[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        offset: i64 = 0l
        loop while size > 0l {
            src: *struc AsmOperand = make_AsmPseudoMem(name, offset)
            dst: *struc AsmOperand = gen_memory(REG_Ax, offset)
            asm_type_dst: *struc AssemblyType = sptr_new()
            if size >= 8l {
                asm_type_dst = make_QuadWord()
                size -= 8l
                offset += 8l
            }
            elif size >= 4l {
                asm_type_dst = make_LongWord()
                size -= 4l
                offset += 4l
            }
            else {
                asm_type_dst = make_Byte()
                size--
                offset++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
}

fn store_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacStore) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].dst_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        dst: *struc AsmOperand = gen_memory(REG_Ax, 0l)
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].src)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}

fn store_instr(ctx: *struc AsmGenContext, node: *struc TacStore) none {
    if is_value_struct(ctx, node[].src) {
        store_struct_instr(ctx, node)
    }
    else {
        store_scalar_instr(ctx, node)
    }
}

fn const_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = sptr_new()
        {
            constant: *struc CConst = node[].idx[].get._TacConstant.constant
            src = gen_memory(REG_Ax, constant[].get._CConstLong.value * node[].scale)
        }
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmLea(@src, @dst))
    }
}

fn scalar_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    asm_type_src: *struc AssemblyType = make_QuadWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src_cp: *struc AssemblyType = sptr_new()
        if asm_type_src ~= asm_type_src_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst))
    }

    {
        src: *struc AsmOperand = gen_op(ctx, node[].idx)
        dst: *struc AsmOperand = gen_register(REG_Dx)
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_indexed(REG_Ax, REG_Dx, node[].scale)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmLea(@src, @dst))
    }
}

fn aggr_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    asm_type_src: *struc AssemblyType = make_QuadWord()

    src_dst: *struc AsmOperand = gen_register(REG_Dx)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(REG_Ax)
        asm_type_src_cp: *struc AssemblyType = sptr_new()
        if asm_type_src ~= asm_type_src_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst))
    }

    {
        src: *struc AsmOperand = gen_op(ctx, node[].idx)
        src_dst_cp: *struc AsmOperand = sptr_new()
        if src_dst ~= src_dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, src_dst, src_dst_cp)"
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        asm_type_src_cp: *struc AssemblyType = sptr_new()
        if asm_type_src ~= asm_type_src_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @src_dst_cp))
    }
    {
        src: *struc AsmOperand = sptr_new()
        {
            value: u64 = cast<u64>(node[].scale)
            is_byte: i32 = node[].scale <= 127l and node[].scale >= -128l
            is_quad: i32 = node[].scale > 2147483647l or node[].scale < -2147483648l
            is_neg: i32 = node[].scale < 0l
            src = make_AsmImm(value, is_byte, is_quad, is_neg)
        }
        binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmMult_t)
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src, @src, @src_dst))
    }
    {
        src: *struc AsmOperand = gen_indexed(REG_Ax, REG_Dx, 1l)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmLea(@src, @dst))
    }
}

fn var_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    match node[].scale {
        -> 1l {
            -> 2l {
                -> 4l {
                    -> 8l {
                        scalar_idx_add_ptr_instr(ctx, node)
                    }
                }
            }
        }
        break
        otherwise {
            aggr_idx_add_ptr_instr(ctx, node)
        }
        break
    }
}

fn add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    match node[].idx[].tag {
        -> AST_TacConstant_t {
            const_idx_add_ptr_instr(ctx, node)
        }
        break
        -> AST_TacVariable_t {
            var_idx_add_ptr_instr(ctx, node)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn cp_to_offset_struct_instr(ctx: *struc AsmGenContext, node: *struc TacCopyToOffset) none {
    src_name: u64 = node[].src[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    offset: i64 = 0l
    loop while size > 0l {
        src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)

        dst: *struc AsmOperand = sptr_new()
        {
            dst_name: u64 = node[].dst_name
            to_offset: i64 = offset + node[].offset
            dst = make_AsmPseudoMem(dst_name, to_offset)
        }
        asm_type_src: *struc AssemblyType = sptr_new()
        if size >= 8l {
            asm_type_src = make_QuadWord()
            size -= 8l
            offset += 8l
        }
        elif size >= 4l {
            asm_type_src = make_LongWord()
            size -= 4l
            offset += 4l
        }
        else {
            asm_type_src = make_Byte()
            size--
            offset++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
}

fn cp_to_offset_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacCopyToOffset) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)

    dst: *struc AsmOperand = sptr_new()
    {
        dst_name: u64 = node[].dst_name
        to_offset: i64 = node[].offset
        dst = make_AsmPseudoMem(dst_name, to_offset)
    }
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}

fn cp_to_offset_instr(ctx: *struc AsmGenContext, node: *struc TacCopyToOffset) none {
    if is_value_struct(ctx, node[].src) {
        cp_to_offset_struct_instr(ctx, node)
    }
    else {
        cp_to_offset_scalar_instr(ctx, node)
    }
}

fn cp_from_offset_struct_instr(ctx: *struc AsmGenContext, node: *struc TacCopyFromOffset) none {
    dst_name: u64 = node[].dst[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    offset: i64 = 0l
    loop while size > 0l {
        src: *struc AsmOperand = sptr_new()
        {
            src_name: u64 = node[].src_name
            from_offset: i64 = offset + node[].offset
            src = make_AsmPseudoMem(src_name, from_offset)
        }
        dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
        asm_type_dst: *struc AssemblyType = sptr_new()
        if size >= 8l {
            asm_type_dst = make_QuadWord()
            size -= 8l
            offset += 8l
        }
        elif size >= 4l {
            asm_type_dst = make_LongWord()
            size -= 4l
            offset += 4l
        }
        else {
            asm_type_dst = make_Byte()
            size--
            offset++
        }
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}

fn cp_from_offset_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacCopyFromOffset) none {
    src: *struc AsmOperand = sptr_new()
    {
        src_name: u64 = node[].src_name
        from_offset: i64 = node[].offset
        src = make_AsmPseudoMem(src_name, from_offset)
    }
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}

fn cp_from_offset_instr(ctx: *struc AsmGenContext, node: *struc TacCopyFromOffset) none {
    if is_value_struct(ctx, node[].dst) {
        cp_from_offset_struct_instr(ctx, node)
    }
    else {
        cp_from_offset_scalar_instr(ctx, node)
    }
}

fn jump_instr(ctx: *struc AsmGenContext, node: *struc TacJump) none {
    target: u64 = node[].target
    push_instr(ctx, make_AsmJmp(target))
}

fn jmp_eq_0_int_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfZero) none {
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        asm_type_cond: *struc AssemblyType = gen_asm_type(ctx, node[].condition)
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @imm_zero, @condition))
    }
    {
        target: u64 = node[].target
        cond_code_e: struc AsmCondCode = make_AsmCondCode(AST_AsmE_t)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_e))
    }
}

fn jmp_eq_0_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfZero) none {
    target_nan: u64 = repr_asm_label(ctx, LBL_Lcomisd_nan)
    zero_xmm_reg_instr(ctx)
    {
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        reg_zero: *struc AsmOperand = gen_register(REG_Xmm0)
        asm_type_cond: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @condition, @reg_zero))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(AST_AsmP_t)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        target: u64 = node[].target
        cond_code_e: struc AsmCondCode = make_AsmCondCode(AST_AsmE_t)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_e))
    }
    push_instr(ctx, make_AsmLabel(target_nan))
}

fn jmp_eq_0_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfZero) none {
    if is_value_dbl(ctx, node[].condition) {
        jmp_eq_0_dbl_instr(ctx, node)
    }
    else {
        jmp_eq_0_int_instr(ctx, node)
    }
}

fn jmp_ne_0_int_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfNotZero) none {
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, true, false, false)
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        asm_type_cond: *struc AssemblyType = gen_asm_type(ctx, node[].condition)
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @imm_zero, @condition))
    }
    {
        target: u64 = node[].target
        cond_code_ne: struc AsmCondCode = make_AsmCondCode(AST_AsmNE_t)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_ne))
    }
}

fn jmp_ne_0_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfNotZero) none {
    target: u64 = node[].target
    target_nan: u64 = repr_asm_label(ctx, LBL_Lcomisd_nan)
    target_nan_ne: u64 = repr_asm_label(ctx, LBL_Lcomisd_nan)
    zero_xmm_reg_instr(ctx)
    {
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        reg_zero: *struc AsmOperand = gen_register(REG_Xmm0)
        asm_type_cond: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @condition, @reg_zero))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(AST_AsmP_t)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        cond_code_ne: struc AsmCondCode = make_AsmCondCode(AST_AsmNE_t)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_ne))
    }
    push_instr(ctx, make_AsmJmp(target_nan_ne))
    push_instr(ctx, make_AsmLabel(target_nan))
    {
        cond_code_e: struc AsmCondCode = make_AsmCondCode(AST_AsmE_t)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_e))
    }
    push_instr(ctx, make_AsmLabel(target_nan_ne))
}

fn jmp_ne_0_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfNotZero) none {
    if is_value_dbl(ctx, node[].condition) {
        jmp_ne_0_dbl_instr(ctx, node)
    }
    else {
        jmp_ne_0_int_instr(ctx, node)
    }
}

fn label_instr(ctx: *struc AsmGenContext, node: *struc TacLabel) none {
    name: u64 = node[].name
    push_instr(ctx, make_AsmLabel(name))
}

fn gen_instr(ctx: *struc AsmGenContext, node: *struc TacInstruction) none {
    match node[].tag {
        -> AST_TacReturn_t {
            ret_instr(ctx, @node[].get._TacReturn)
        }
        break
        -> AST_TacSignExtend_t {
            sign_extend_instr(ctx, @node[].get._TacSignExtend)
        }
        break
        -> AST_TacTruncate_t {
            truncate_instr(ctx, @node[].get._TacTruncate)
        }
        break
        -> AST_TacZeroExtend_t {
            zero_extend_instr(ctx, @node[].get._TacZeroExtend)
        }
        break
        -> AST_TacDoubleToInt_t {
            dbl_to_signed_instr(ctx, @node[].get._TacDoubleToInt)
        }
        break
        -> AST_TacDoubleToUInt_t {
            dbl_to_unsigned_instr(ctx, @node[].get._TacDoubleToUInt)
        }
        break
        -> AST_TacIntToDouble_t {
            signed_to_dbl_instr(ctx, @node[].get._TacIntToDouble)
        }
        break
        -> AST_TacUIntToDouble_t {
            unsigned_to_dbl_instr(ctx, @node[].get._TacUIntToDouble)
        }
        break
        -> AST_TacFunCall_t {
            call_instr(ctx, @node[].get._TacFunCall)
        }
        break
        -> AST_TacUnary_t {
            unary_instr(ctx, @node[].get._TacUnary)
        }
        break
        -> AST_TacBinary_t {
            binary_instr(ctx, @node[].get._TacBinary)
        }
        break
        -> AST_TacCopy_t {
            copy_instr(ctx, @node[].get._TacCopy)
        }
        break
        -> AST_TacGetAddress_t {
            getaddr_instr(ctx, @node[].get._TacGetAddress)
        }
        break
        -> AST_TacLoad_t {
            load_instr(ctx, @node[].get._TacLoad)
        }
        break
        -> AST_TacStore_t {
            store_instr(ctx, @node[].get._TacStore)
        }
        break
        -> AST_TacAddPtr_t {
            add_ptr_instr(ctx, @node[].get._TacAddPtr)
        }
        break
        -> AST_TacCopyToOffset_t {
            cp_to_offset_instr(ctx, @node[].get._TacCopyToOffset)
        }
        break
        -> AST_TacCopyFromOffset_t {
            cp_from_offset_instr(ctx, @node[].get._TacCopyFromOffset)
        }
        break
        -> AST_TacJump_t {
            jump_instr(ctx, @node[].get._TacJump)
        }
        break
        -> AST_TacJumpIfZero_t {
            jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero)
        }
        break
        -> AST_TacLabel_t {
            label_instr(ctx, @node[].get._TacLabel)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn gen_instr_list(ctx: *struc AsmGenContext, node_list: **struc TacInstruction) none {
    loop i: u64 = 0 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        if node_list[i] {
            gen_instr(ctx, node_list[i])
        }
    }
}

fn reg_fun_param_instr(ctx: *struc AsmGenContext, name: u64, arg_reg: i32) none {
    src: *struc AsmOperand = gen_register(arg_reg)

    dst: *struc AsmOperand = sptr_new()
    {
        dst_name: u64 = name
        dst = make_AsmPseudo(dst_name)
    }
    asm_type_dst: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, name)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}

fn stack_fun_param_instr(ctx: *struc AsmGenContext, name: u64, stack_bytes: i64) none {
    src: *struc AsmOperand = gen_memory(REG_Bp, stack_bytes)

    dst: *struc AsmOperand = sptr_new()
    {
        dst_name: u64 = name
        dst = make_AsmPseudo(dst_name)
    }
    asm_type_dst: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, name)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}

fn reg_8b_fun_param_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    ret_8b_call_instr(ctx, name, offset, struct_type, arg_reg)
}

fn stack_8b_fun_param_instr(ctx: *struc AsmGenContext, name: u64, stack_bytes: i64, offset: i64, struct_type: *struc Structure) none {
    asm_type_dst: *struc AssemblyType = asm_type_8b(ctx, struct_type, offset)
    if asm_type_dst[].tag == AST_ByteArray_t {
        size: i64 = asm_type_dst[].get._ByteArray.size
        free_AssemblyType(@asm_type_dst)
        loop while size > 0l {
            src: *struc AsmOperand = gen_memory(REG_Bp, stack_bytes)
            dst: *struc AsmOperand = make_AsmPseudoMem(name, offset)
            if size >= 4l {
                asm_type_dst = make_LongWord()
                size -= 4l
                offset += 4l
                stack_bytes += 4l
            }
            else {
                asm_type_dst = make_Byte()
                size--
                offset++
                stack_bytes++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
    else {
        src: *struc AsmOperand = gen_memory(REG_Bp, stack_bytes)

        dst: *struc AsmOperand = sptr_new()
        {
            dst_name: u64 = name
            to_offset: i64 = offset
            dst = make_AsmPseudoMem(dst_name, to_offset)
        }

        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}

fn fun_param_toplvl(ctx: *struc AsmGenContext, node: *struc TacFunction, fun_type: *struc FunType, is_ret_memory: i32) none {
    reg_size: u64 = ? is_ret_memory then 1 else 0
    sse_size: u64 = 0
    stack_bytes: i64 = 16l
    loop i: u64 = 0 while i < (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) .. ++i {
        param: u64 = node[].params[i]
        param_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((param))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
        if param_type[].tag == AST_Double_t {
            if sse_size < 8 {
                reg_fun_param_instr(ctx, param, ctx[].sse_arg_regs[sse_size])
                sse_size++
            }
            else {
                stack_fun_param_instr(ctx, param, stack_bytes)
                stack_bytes += 8l
            }
        }
        elif param_type[].tag ~= AST_Structure_t {
            if reg_size < 6 {
                reg_fun_param_instr(ctx, param, ctx[].arg_regs[reg_size])
                reg_size++
            }
            else {
                stack_fun_param_instr(ctx, param, stack_bytes)
                stack_bytes += 8l
            }
        }
        else {
            struct_reg_size: u64 = 7
            struct_sse_size: u64 = 9
            struct_type: *struc Structure = @param_type[].get._Structure
            struct_8b_class(ctx, struct_type)
            struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
            if struct_8b[].clss[0] ~= CLS_memory {
                struct_reg_size = 0
                struct_sse_size = 0
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == CLS_sse {
                        struct_sse_size++
                    }
                    else {
                        struct_reg_size++
                    }
                }
            }
            if struct_reg_size + reg_size <= 6 and struct_sse_size + sse_size <= 8 {
                offset: i64 = 0l
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == CLS_sse {
                        reg_8b_fun_param_instr(ctx, param, offset, nil, ctx[].sse_arg_regs[sse_size])
                        sse_size++
                    }
                    else {
                        reg_8b_fun_param_instr(ctx, param, offset, struct_type, ctx[].arg_regs[reg_size])
                        reg_size++
                    }
                    offset += 8l
                }
            }
            else {
                offset: i64 = 0l
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    stack_8b_fun_param_instr(ctx, param, stack_bytes, offset, struct_type)
                    stack_bytes += 8l
                    offset += 8l
                }
            }
        }
    }
    fun_param_reg_mask(ctx, fun_type, reg_size, sse_size)
}

fn gen_fun_toplvl(ctx: *struc AsmGenContext, node: *struc TacFunction) *struc AsmTopLevel {
    name: u64 = node[].name
    is_glob: i32 = node[].is_glob
    is_ret_memory: i32 = false
    body: **struc AsmInstruction = vec_new()
    loop .. while 0 {
        "@MACRO@:vec_reserve(body, vec_size(node->body))"
        (((body) = stbds_arrgrowf((body), sizeof((body)[]), (0), ((? (node[].body) then (cast<*struc stbds_array_header>((node[].body)) - 1)[].length else 0)))))
    }
    {
        ctx[].p_instrs = @body
        fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
        if fun_type[].ret_type[].tag == AST_Structure_t {
            struct_type: *struc Structure = @fun_type[].ret_type[].get._Structure
            struct_8b_class(ctx, struct_type)
            if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_8b_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == CLS_memory {
                is_ret_memory = true
                {
                    src: *struc AsmOperand = gen_register(REG_Di)
                    dst: *struc AsmOperand = gen_memory(REG_Bp, -8l)
                    asm_type_dst: *struc AssemblyType = make_QuadWord()
                    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
                }
            }
        }
        fun_param_toplvl(ctx, node, fun_type, is_ret_memory)
        ctx[].p_fun_type = fun_type
        gen_instr_list(ctx, node[].body)
        ctx[].p_fun_type = nil
        ctx[].p_instrs = nil
    }
    return make_AsmFunction(name, is_glob, is_ret_memory, @body)
}

fn gen_static_var_toplvl(ctx: *struc AsmGenContext, node: *struc TacStaticVariable) *struc AsmTopLevel {
    name: u64 = node[].name
    is_glob: i32 = node[].is_glob
    alignment: i32 = gen_type_alignment(ctx[].frontend, node[].static_init_type)
    static_inits: **struc StaticInit = vec_new()
    loop .. while 0 {
        "@MACRO@:vec_reserve(static_inits, vec_size(node->static_inits))"
        (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (0), ((? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0)))))
    }
    loop i: u64 = 0 while i < (? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0) .. ++i {
        static_init: *struc StaticInit = sptr_new()
        if node[].static_inits[i] ~= static_init {
            "@MACRO@:sptr_copy(StaticInit, node->static_inits[i], static_init)"
            free_StaticInit(@static_init)
            static_init = node[].static_inits[i]
            (static_init)[]._ref_count++
        }
        loop .. while 0 {
            "@MACRO@:vec_move_back(static_inits, static_init)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(static_inits, static_init)"
                loop .. while 0 {
                    (? (not (static_inits) or (cast<*struc stbds_array_header>((static_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_inits)) - 1)[].capacity) then (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (1), (0))) and 0) else 0)
                    (static_inits)[(cast<*struc stbds_array_header>((static_inits)) - 1)[].length++] = (static_init)
                }
            }
            static_init = nil
        }
    }
    return make_AsmStaticVariable(name, alignment, is_glob, @static_inits)
}

fn push_static_const_toplvl(ctx: *struc AsmGenContext, static_const_toplvls: *struc AsmTopLevel) none {
    loop .. while 0 {
        "@MACRO@:vec_move_back(*ctx->p_static_consts, static_const_toplvls)"
        loop .. while 0 {
            "@MACRO@:vec_push_back(*ctx->p_static_consts, static_const_toplvls)"
            loop .. while 0 {
                (? (not (ctx[].p_static_consts[]) or (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].capacity) then (((ctx[].p_static_consts[]) = stbds_arrgrowf((ctx[].p_static_consts[]), sizeof((ctx[].p_static_consts[])[]), (1), (0))) and 0) else 0)
                (ctx[].p_static_consts[])[(cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length++] = (static_const_toplvls)
            }
        }
        static_const_toplvls = nil
    }
}

fn dbl_static_const_toplvl(ctx: *struc AsmGenContext, identifier: u64, dbl_const: u64, byte: i32) none {
    name: u64 = identifier
    alignment: i32 = byte
    static_init: *struc StaticInit = make_DoubleInit(dbl_const)
    push_static_const_toplvl(ctx, make_AsmStaticConstant(name, alignment, @static_init))
}

fn gen_static_const_toplvl(ctx: *struc AsmGenContext, node: *struc TacStaticConstant) *struc AsmTopLevel {
    name: u64 = node[].name
    alignment: i32 = gen_type_alignment(ctx[].frontend, node[].static_init_type)
    static_init: *struc StaticInit = sptr_new()
    if node[].static_init ~= static_init {
        "@MACRO@:sptr_copy(StaticInit, node->static_init, static_init)"
        free_StaticInit(@static_init)
        static_init = node[].static_init
        (static_init)[]._ref_count++
    }
    return make_AsmStaticConstant(name, alignment, @static_init)
}

fn gen_toplvl(ctx: *struc AsmGenContext, node: *struc TacTopLevel) *struc AsmTopLevel {
    match node[].tag {
        -> AST_TacFunction_t {
            return gen_fun_toplvl(ctx, @node[].get._TacFunction)
        }
        -> AST_TacStaticVariable_t {
            return gen_static_var_toplvl(ctx, @node[].get._TacStaticVariable)
        }
        -> AST_TacStaticConstant_t {
            return gen_static_const_toplvl(ctx, @node[].get._TacStaticConstant)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn gen_program(ctx: *struc AsmGenContext, node: *struc TacProgram) *struc AsmProgram {
    static_const_toplvls: **struc AsmTopLevel = vec_new()
    loop .. while 0 {
        "@MACRO@:vec_reserve(static_const_toplvls, vec_size(node->static_const_toplvls))"
        (((static_const_toplvls) = stbds_arrgrowf((static_const_toplvls), sizeof((static_const_toplvls)[]), (0), ((? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0)))))
    }
    loop i: u64 = 0 while i < (? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        static_const_toplvl: *struc AsmTopLevel = gen_toplvl(ctx, node[].static_const_toplvls[i])
        loop .. while 0 {
            "@MACRO@:vec_move_back(static_const_toplvls, static_const_toplvl)"
            loop .. while 0 {
                "@MACRO@:vec_push_back(static_const_toplvls, static_const_toplvl)"
                loop .. while 0 {
                    (? (not (static_const_toplvls) or (cast<*struc stbds_array_header>((static_const_toplvls)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_const_toplvls)) - 1)[].capacity) then (((static_const_toplvls) = stbds_arrgrowf((static_const_toplvls), sizeof((static_const_toplvls)[]), (1), (0))) and 0) else 0)
                    (static_const_toplvls)[(cast<*struc stbds_array_header>((static_const_toplvls)) - 1)[].length++] = (static_const_toplvl)
                }
            }
            static_const_toplvl = nil
        }
    }
    top_levels: **struc AsmTopLevel = vec_new()
    loop .. while 0 {
        "@MACRO@:vec_reserve(top_levels, vec_size(node->static_var_toplvls) + vec_size(node->fun_toplvls))"
        (((top_levels) = stbds_arrgrowf((top_levels), sizeof((top_levels)[]), (0), ((? (node[].static_var_toplvls) then (cast<*struc stbds_array_header>((node[].static_var_toplvls)) - 1)[].length else 0) + (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0)))))
    }
    {
        ctx[].p_static_consts = @static_const_toplvls
        loop i: u64 = 0 while i < (? (node[].static_var_toplvls) then (cast<*struc stbds_array_header>((node[].static_var_toplvls)) - 1)[].length else 0) .. ++i {
            static_var_toplvl: *struc AsmTopLevel = gen_toplvl(ctx, node[].static_var_toplvls[i])
            loop .. while 0 {
                "@MACRO@:vec_move_back(top_levels, static_var_toplvl)"
                loop .. while 0 {
                    "@MACRO@:vec_push_back(top_levels, static_var_toplvl)"
                    loop .. while 0 {
                        (? (not (top_levels) or (cast<*struc stbds_array_header>((top_levels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((top_levels)) - 1)[].capacity) then (((top_levels) = stbds_arrgrowf((top_levels), sizeof((top_levels)[]), (1), (0))) and 0) else 0)
                        (top_levels)[(cast<*struc stbds_array_header>((top_levels)) - 1)[].length++] = (static_var_toplvl)
                    }
                }
                static_var_toplvl = nil
            }
        }
        loop i: u64 = 0 while i < (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0) .. ++i {
            fun_toplvl: *struc AsmTopLevel = gen_toplvl(ctx, node[].fun_toplvls[i])
            loop .. while 0 {
                "@MACRO@:vec_move_back(top_levels, fun_toplvl)"
                loop .. while 0 {
                    "@MACRO@:vec_push_back(top_levels, fun_toplvl)"
                    loop .. while 0 {
                        (? (not (top_levels) or (cast<*struc stbds_array_header>((top_levels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((top_levels)) - 1)[].capacity) then (((top_levels) = stbds_arrgrowf((top_levels), sizeof((top_levels)[]), (1), (0))) and 0) else 0)
                        (top_levels)[(cast<*struc stbds_array_header>((top_levels)) - 1)[].length++] = (fun_toplvl)
                    }
                }
                fun_toplvl = nil
            }
        }
        ctx[].p_static_consts = nil
    }
    return make_AsmProgram(@static_const_toplvls, @top_levels)
}

pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram {
    ctx: struc AsmGenContext;
    {
        ctx.frontend = frontend
        ctx.identifiers = identifiers
        ctx.arg_regs[0] = REG_Di
        ctx.arg_regs[1] = REG_Si
        ctx.arg_regs[2] = REG_Dx
        ctx.arg_regs[3] = REG_Cx
        ctx.arg_regs[4] = REG_R8
        ctx.arg_regs[5] = REG_R9
        ctx.sse_arg_regs[0] = REG_Xmm0
        ctx.sse_arg_regs[1] = REG_Xmm1
        ctx.sse_arg_regs[2] = REG_Xmm2
        ctx.sse_arg_regs[3] = REG_Xmm3
        ctx.sse_arg_regs[4] = REG_Xmm4
        ctx.sse_arg_regs[5] = REG_Xmm5
        ctx.sse_arg_regs[6] = REG_Xmm6
        ctx.sse_arg_regs[7] = REG_Xmm7
        ctx.dbl_const_table = map_new()
        ctx.struct_8b_map = map_new()
    }
    asm_ast: *struc AsmProgram = gen_program(@ctx, tac_ast[])
    free_TacProgram(tac_ast)
    if ctx.dbl_const_table {
        "@MACRO@:map_delete(ctx.dbl_const_table)"
        loop .. while 0 {
            cast<none>((? (ctx.dbl_const_table) ~= nil then stbds_hmfree_func((ctx.dbl_const_table) - 1, sizeof((ctx.dbl_const_table)[])) else cast<none>(0)))
            (ctx.dbl_const_table) = nil
        }
        ctx.dbl_const_table = map_new()
    }
    if ctx.struct_8b_map {
        "@MACRO@:map_delete(ctx.struct_8b_map)"
        loop .. while 0 {
            cast<none>((? (ctx.struct_8b_map) ~= nil then stbds_hmfree_func((ctx.struct_8b_map) - 1, sizeof((ctx.struct_8b_map)[])) else cast<none>(0)))
            (ctx.struct_8b_map) = nil
        }
        ctx.struct_8b_map = map_new()
    }
    return asm_ast
}
