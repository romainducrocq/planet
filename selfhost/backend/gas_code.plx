m4_include(`gas_code.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/fileio.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl





type struc AsmProgram;
type struc BackEndContext;
type struc FileIoContext;
type struc IdentifierContext;
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none;
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

type struc FileRead(len: u64, buf: string, fd: *struc FILE, filename: string)

type struc FileIoContext(errors: *struc ErrorsContext, fd_write: *struc FILE, write_buf: string, filename: string, file_reads: *struc FileRead)

pub fn find_file(filename: string) i32;
pub fn get_filename(ctx: *struc FileIoContext) string;
pub fn set_filename(ctx: *struc FileIoContext, filename: string) none;
pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32;
pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32;
pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32;
pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none;
pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32;
pub fn close_fwrite(ctx: *struc FileIoContext) none;
pub fn free_fileio(ctx: *struc FileIoContext) none;

type struc CConst;
type struc CStringLiteral;

type struc CConstInt(value: i32)

type struc CConstLong(value: i64)

type struc CConstUInt(value: u32)

type struc CConstULong(value: u64)

type struc CConstDouble(value: f64)

type struc CConstChar(value: i8)

type struc CConstUChar(value: u8)

type union _CConst(_CConstInt: struc CConstInt, _CConstLong: struc CConstLong, _CConstUInt: struc CConstUInt, _CConstULong: struc CConstULong, _CConstDouble: struc CConstDouble, _CConstChar: struc CConstChar, _CConstUChar: struc CConstUChar)

type struc CConst(_ref_count: u64, tag: i32, get: union _CConst)
pub fn make_CConst(none) *struc CConst;
pub fn make_CConstInt(value: i32) *struc CConst;
pub fn make_CConstLong(value: i64) *struc CConst;
pub fn make_CConstUInt(value: u32) *struc CConst;
pub fn make_CConstULong(value: u64) *struc CConst;
pub fn make_CConstDouble(value: f64) *struc CConst;
pub fn make_CConstChar(value: i8) *struc CConst;
pub fn make_CConstUChar(value: u8) *struc CConst;
pub fn free_CConst(self: **struc CConst) none;

type struc CStringLiteral(_ref_count: u64, tag: i32, value: *i8)
pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral;
pub fn free_CStringLiteral(self: **struc CStringLiteral) none;

type struc PairTIdentifierstring_t(key: u64, value: string)

type struc IdentifierContext(label_count: u32, var_count: u32, struct_count: u32, hash_table: *struc PairTIdentifierstring_t)

pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64;
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64;
m4_define(`UID_SEPARATOR', `TODO')m4_dnl
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
type struc Type;
type struc StaticInit;
type struc InitialValue;
type struc IdentifierAttr;
type struc Symbol;
type struc StructMember;
type struc StructTypedef;

type struc Char(_empty: char)

type struc SChar(_empty: char)

type struc UChar(_empty: char)

type struc Int(_empty: char)

type struc Long(_empty: char)

type struc UInt(_empty: char)

type struc ULong(_empty: char)

type struc Double(_empty: char)

type struc Void(_empty: char)

type struc FunType(param_reg_mask: u64, ret_reg_mask: u64, param_types: **struc Type, ret_type: *struc Type)

type struc Pointer(ref_type: *struc Type)

type struc Array(size: i64, elem_type: *struc Type)

type struc Structure(tag_name: u64, is_union: i32)

type union _Type(_Char: struc Char, _SChar: struc SChar, _UChar: struc UChar, _Int: struc Int, _Long: struc Long, _UInt: struc UInt, _ULong: struc ULong, _Double: struc Double, _Void: struc Void, _FunType: struc FunType, _Pointer: struc Pointer, _Array: struc Array, _Structure: struc Structure)

type struc Type(_ref_count: u64, tag: i32, get: union _Type)
pub fn make_Type(none) *struc Type;
pub fn make_Char(none) *struc Type;
pub fn make_SChar(none) *struc Type;
pub fn make_UChar(none) *struc Type;
pub fn make_Int(none) *struc Type;
pub fn make_Long(none) *struc Type;
pub fn make_UInt(none) *struc Type;
pub fn make_ULong(none) *struc Type;
pub fn make_Double(none) *struc Type;
pub fn make_Void(none) *struc Type;
pub fn make_FunType(param_types: ***struc Type, ret_type: **struc Type) *struc Type;
pub fn make_Pointer(ref_type: **struc Type) *struc Type;
pub fn make_Array(size: i64, elem_type: **struc Type) *struc Type;
pub fn make_Structure(tag_name: u64, is_union: i32) *struc Type;
pub fn free_Type(self: **struc Type) none;

type struc IntInit(value: i32)

type struc LongInit(value: i64)

type struc UIntInit(value: u32)

type struc ULongInit(value: u64)

type struc CharInit(value: i8)

type struc UCharInit(value: u8)

type struc DoubleInit(dbl_const: u64)

type struc ZeroInit(byte: i64)

type struc StringInit(string_const: u64, is_null_term: i32, literal: *struc CStringLiteral)

type struc PointerInit(name: u64)

type union _StaticInit(_IntInit: struc IntInit, _LongInit: struc LongInit, _UIntInit: struc UIntInit, _ULongInit: struc ULongInit, _CharInit: struc CharInit, _UCharInit: struc UCharInit, _DoubleInit: struc DoubleInit, _ZeroInit: struc ZeroInit, _StringInit: struc StringInit, _PointerInit: struc PointerInit)

type struc StaticInit(_ref_count: u64, tag: i32, get: union _StaticInit)
pub fn make_StaticInit(none) *struc StaticInit;
pub fn make_IntInit(value: i32) *struc StaticInit;
pub fn make_LongInit(value: i64) *struc StaticInit;
pub fn make_UIntInit(value: u32) *struc StaticInit;
pub fn make_ULongInit(value: u64) *struc StaticInit;
pub fn make_CharInit(value: i8) *struc StaticInit;
pub fn make_UCharInit(value: u8) *struc StaticInit;
pub fn make_DoubleInit(dbl_const: u64) *struc StaticInit;
pub fn make_ZeroInit(byte: i64) *struc StaticInit;
pub fn make_StringInit(string_const: u64, is_null_term: i32, literal: **struc CStringLiteral) *struc StaticInit;
pub fn make_PointerInit(name: u64) *struc StaticInit;
pub fn free_StaticInit(self: **struc StaticInit) none;

type struc Tentative(_empty: char)

type struc Initial(static_inits: **struc StaticInit)

type struc NoInitializer(_empty: char)

type union _InitialValue(_Tentative: struc Tentative, _Initial: struc Initial, _NoInitializer: struc NoInitializer)

type struc InitialValue(_ref_count: u64, tag: i32, get: union _InitialValue)
pub fn make_InitialValue(none) *struc InitialValue;
pub fn make_Tentative(none) *struc InitialValue;
pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue;
pub fn make_NoInitializer(none) *struc InitialValue;
pub fn free_InitialValue(self: **struc InitialValue) none;

type struc FunAttr(is_def: i32, is_glob: i32)

type struc StaticAttr(is_glob: i32, init: *struc InitialValue)

type struc ConstantAttr(static_init: *struc StaticInit)

type struc LocalAttr(_empty: char)

type union _IdentifierAttr(_FunAttr: struc FunAttr, _StaticAttr: struc StaticAttr, _ConstantAttr: struc ConstantAttr, _LocalAttr: struc LocalAttr)

type struc IdentifierAttr(tag: i32, get: union _IdentifierAttr)
pub fn make_IdentifierAttr(none) *struc IdentifierAttr;
pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr;
pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr;
pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr;
pub fn make_LocalAttr(none) *struc IdentifierAttr;
pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none;

type struc Symbol(tag: i32, type_t: *struc Type, attrs: *struc IdentifierAttr)
pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol;
pub fn free_Symbol(self: **struc Symbol) none;

type struc StructMember(tag: i32, offset: i64, member_type: *struc Type)
pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember;
pub fn free_StructMember(self: **struc StructMember) none;
m4_define(`UPtrStructMember', `TODO')m4_dnl

type struc PairTIdentifierUPtrStructMember(key: u64, value: *struc StructMember)

type struc StructTypedef(tag: i32, alignment: i32, size: i64, member_names: *u64, members: *struc PairTIdentifierUPtrStructMember)
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef;
pub fn free_StructTypedef(self: **struc StructTypedef) none;
m4_define(`ulong_t', `TODO')m4_dnl

type struc PairTIdentifierulong_t(key: u64, value: u64)

type struc PairTIdentifierTIdentifier(key: u64, value: u64)

m4_define(`UPtrStructTypedef', `TODO')m4_dnl

type struc PairTIdentifierUPtrStructTypedef(key: u64, value: *struc StructTypedef)

m4_define(`UPtrSymbol', `TODO')m4_dnl

type struc PairTIdentifierUPtrSymbol(key: u64, value: *struc Symbol)

type struc ElementTIdentifier(key: u64, value: char)

type struc FrontEndContext(string_const_table: *struc PairTIdentifierTIdentifier, struct_typedef_table: *struc PairTIdentifierUPtrStructTypedef, symbol_table: *struc PairTIdentifierUPtrSymbol, addressed_set: *struc ElementTIdentifier)
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag_name: u64, member_name: u64) *struc StructMember;
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag_name: u64) *struc StructMember;
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
