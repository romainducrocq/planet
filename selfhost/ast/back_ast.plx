m4_include(`ast.plx.m4')m4_dnl
m4_include(`back_ast.plx.m4')m4_dnl
m4_include(`back_symt.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl






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

pub fn make_AsmReg(tag: i32) struc AsmReg {
    self: struc AsmReg = $(tag)
    match tag {
        -> AST_AsmReg_t {
            -> AST_AsmAx_t {
                -> AST_AsmBx_t {
                    -> AST_AsmCx_t {
                        -> AST_AsmDx_t {
                            -> AST_AsmDi_t {
                                -> AST_AsmSi_t {
                                    -> AST_AsmR8_t {
                                        -> AST_AsmR9_t {
                                            -> AST_AsmR10_t {
                                                -> AST_AsmR11_t {
                                                    -> AST_AsmR12_t {
                                                        -> AST_AsmR13_t {
                                                            -> AST_AsmR14_t {
                                                                -> AST_AsmR15_t {
                                                                    -> AST_AsmSp_t {
                                                                        -> AST_AsmBp_t {
                                                                            -> AST_AsmXMM0_t {
                                                                                -> AST_AsmXMM1_t {
                                                                                    -> AST_AsmXMM2_t {
                                                                                        -> AST_AsmXMM3_t {
                                                                                            -> AST_AsmXMM4_t {
                                                                                                -> AST_AsmXMM5_t {
                                                                                                    -> AST_AsmXMM6_t {
                                                                                                        -> AST_AsmXMM7_t {
                                                                                                            -> AST_AsmXMM8_t {
                                                                                                                -> AST_AsmXMM9_t {
                                                                                                                    -> AST_AsmXMM10_t {
                                                                                                                        -> AST_AsmXMM11_t {
                                                                                                                            -> AST_AsmXMM12_t {
                                                                                                                                -> AST_AsmXMM13_t {
                                                                                                                                    -> AST_AsmXMM14_t {
                                                                                                                                        -> AST_AsmXMM15_t {
                                                                                                                                            return self
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
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_AsmCondCode(tag: i32) struc AsmCondCode {
    self: struc AsmCondCode = $(tag)
    match tag {
        -> AST_AsmCondCode_t {
            -> AST_AsmE_t {
                -> AST_AsmNE_t {
                    -> AST_AsmG_t {
                        -> AST_AsmGE_t {
                            -> AST_AsmL_t {
                                -> AST_AsmLE_t {
                                    -> AST_AsmA_t {
                                        -> AST_AsmAE_t {
                                            -> AST_AsmB_t {
                                                -> AST_AsmBE_t {
                                                    -> AST_AsmP_t {
                                                        return self
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
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_AsmOperand(none) *struc AsmOperand {
    self: *struc AsmOperand = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_alloc(AsmOperand, self)"
        loop .. while 0 {
            "@MACRO@:uptr_alloc(AsmOperand, self)"
            free_AsmOperand(@self)
            self = cast<*struc AsmOperand>(malloc(sizeof<struc AsmOperand>))
            if not self {
                panic_sigabrt("alloc "                     "AsmOperand")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_AsmOperand_t
    return self
}

pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmImm_t
    self[].get._AsmImm.value = value
    self[].get._AsmImm.is_byte = is_byte
    self[].get._AsmImm.is_quad = is_quad
    self[].get._AsmImm.is_neg = is_neg
    return self
}

pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmRegister_t
    self[].get._AsmRegister.reg = reg[]
    return self
}

pub fn make_AsmPseudo(name: u64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmPseudo_t
    self[].get._AsmPseudo.name = name
    return self
}

pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmMemory_t
    self[].get._AsmMemory.value = value
    self[].get._AsmMemory.reg = reg[]
    return self
}

pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmData_t
    self[].get._AsmData.name = name
    self[].get._AsmData.offset = offset
    return self
}

pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmPseudoMem_t
    self[].get._AsmPseudoMem.name = name
    self[].get._AsmPseudoMem.offset = offset
    return self
}

pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmIndexed_t
    self[].get._AsmIndexed.scale = scale
    self[].get._AsmIndexed.reg_base = reg_base[]
    self[].get._AsmIndexed.reg_index = reg_index[]
    return self
}

pub fn free_AsmOperand(self: **struc AsmOperand) none {
    loop .. while 0 {
        "@MACRO@:sptr_delete(*self)"
        if not self[] {
            "@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_AsmOperand_t {
            -> AST_AsmImm_t {
                break
            }
        }
        -> AST_AsmRegister_t {
            break
        }
        -> AST_AsmPseudo_t {
            break
        }
        -> AST_AsmMemory_t {
            break
        }
        -> AST_AsmData_t {
            break
        }
        -> AST_AsmPseudoMem_t {
            break
        }
        -> AST_AsmIndexed_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_free(*self)"
        if self[] {
            "@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_AsmBinaryOp(tag: i32) struc AsmBinaryOp {
    self: struc AsmBinaryOp = $(tag)
    match tag {
        -> AST_AsmBinaryOp_t {
            -> AST_AsmAdd_t {
                -> AST_AsmSub_t {
                    -> AST_AsmMult_t {
                        -> AST_AsmDivDouble_t {
                            -> AST_AsmBitAnd_t {
                                -> AST_AsmBitOr_t {
                                    -> AST_AsmBitXor_t {
                                        -> AST_AsmBitShiftLeft_t {
                                            -> AST_AsmBitShiftRight_t {
                                                -> AST_AsmBitShrArithmetic_t {
                                                    return self
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
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_AsmUnaryOp(tag: i32) struc AsmUnaryOp {
    self: struc AsmUnaryOp = $(tag)
    match tag {
        -> AST_AsmUnaryOp_t {
            -> AST_AsmNot_t {
                -> AST_AsmNeg_t {
                    -> AST_AsmShr_t {
                        return self
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_AsmInstruction(none) *struc AsmInstruction {
    self: *struc AsmInstruction = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(AsmInstruction, self)"
        free_AsmInstruction(@self)
        self = cast<*struc AsmInstruction>(malloc(sizeof<struc AsmInstruction>))
        if not self {
            panic_sigabrt("alloc "                 "AsmInstruction")
        }
    }
    self[].tag = AST_AsmInstruction_t
    return self
}

pub fn make_AsmMov(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMov_t
    self[].get._AsmMov.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmMov.asm_type)"
        if asm_type[] ~= self[].get._AsmMov.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmMov.asm_type)"
            free_AssemblyType(@self[].get._AsmMov.asm_type)
            self[].get._AsmMov.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmMov.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmMov.src)"
        if src[] ~= self[].get._AsmMov.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmMov.src)"
            free_AsmOperand(@self[].get._AsmMov.src)
            self[].get._AsmMov.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmMov.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmMov.dst)"
        if dst[] ~= self[].get._AsmMov.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmMov.dst)"
            free_AsmOperand(@self[].get._AsmMov.dst)
            self[].get._AsmMov.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmMovSx(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMovSx_t
    self[].get._AsmMovSx.asm_type_src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_src, self->get._AsmMovSx.asm_type_src)"
        if asm_type_src[] ~= self[].get._AsmMovSx.asm_type_src {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_src, self->get._AsmMovSx.asm_type_src)"
            free_AssemblyType(@self[].get._AsmMovSx.asm_type_src)
            self[].get._AsmMovSx.asm_type_src = asm_type_src[]
            asm_type_src[] = uptr_new()
        }
    }
    self[].get._AsmMovSx.asm_type_dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovSx.asm_type_dst)"
        if asm_type_dst[] ~= self[].get._AsmMovSx.asm_type_dst {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovSx.asm_type_dst)"
            free_AssemblyType(@self[].get._AsmMovSx.asm_type_dst)
            self[].get._AsmMovSx.asm_type_dst = asm_type_dst[]
            asm_type_dst[] = uptr_new()
        }
    }
    self[].get._AsmMovSx.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmMovSx.src)"
        if src[] ~= self[].get._AsmMovSx.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmMovSx.src)"
            free_AsmOperand(@self[].get._AsmMovSx.src)
            self[].get._AsmMovSx.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmMovSx.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmMovSx.dst)"
        if dst[] ~= self[].get._AsmMovSx.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmMovSx.dst)"
            free_AsmOperand(@self[].get._AsmMovSx.dst)
            self[].get._AsmMovSx.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmMovZeroExtend(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMovZeroExtend_t
    self[].get._AsmMovZeroExtend.asm_type_src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_src, self->get._AsmMovZeroExtend.asm_type_src)"
        if asm_type_src[] ~= self[].get._AsmMovZeroExtend.asm_type_src {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_src, self->get._AsmMovZeroExtend.asm_type_src)"
            free_AssemblyType(@self[].get._AsmMovZeroExtend.asm_type_src)
            self[].get._AsmMovZeroExtend.asm_type_src = asm_type_src[]
            asm_type_src[] = uptr_new()
        }
    }
    self[].get._AsmMovZeroExtend.asm_type_dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovZeroExtend.asm_type_dst)"
        if asm_type_dst[] ~= self[].get._AsmMovZeroExtend.asm_type_dst {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovZeroExtend.asm_type_dst)"
            free_AssemblyType(@self[].get._AsmMovZeroExtend.asm_type_dst)
            self[].get._AsmMovZeroExtend.asm_type_dst = asm_type_dst[]
            asm_type_dst[] = uptr_new()
        }
    }
    self[].get._AsmMovZeroExtend.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmMovZeroExtend.src)"
        if src[] ~= self[].get._AsmMovZeroExtend.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmMovZeroExtend.src)"
            free_AsmOperand(@self[].get._AsmMovZeroExtend.src)
            self[].get._AsmMovZeroExtend.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmMovZeroExtend.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmMovZeroExtend.dst)"
        if dst[] ~= self[].get._AsmMovZeroExtend.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmMovZeroExtend.dst)"
            free_AsmOperand(@self[].get._AsmMovZeroExtend.dst)
            self[].get._AsmMovZeroExtend.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmLea(src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmLea_t
    self[].get._AsmLea.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmLea.src)"
        if src[] ~= self[].get._AsmLea.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmLea.src)"
            free_AsmOperand(@self[].get._AsmLea.src)
            self[].get._AsmLea.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmLea.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmLea.dst)"
        if dst[] ~= self[].get._AsmLea.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmLea.dst)"
            free_AsmOperand(@self[].get._AsmLea.dst)
            self[].get._AsmLea.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmCvttsd2si(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCvttsd2si_t
    self[].get._AsmCvttsd2si.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCvttsd2si.asm_type)"
        if asm_type[] ~= self[].get._AsmCvttsd2si.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCvttsd2si.asm_type)"
            free_AssemblyType(@self[].get._AsmCvttsd2si.asm_type)
            self[].get._AsmCvttsd2si.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmCvttsd2si.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmCvttsd2si.src)"
        if src[] ~= self[].get._AsmCvttsd2si.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmCvttsd2si.src)"
            free_AsmOperand(@self[].get._AsmCvttsd2si.src)
            self[].get._AsmCvttsd2si.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmCvttsd2si.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmCvttsd2si.dst)"
        if dst[] ~= self[].get._AsmCvttsd2si.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmCvttsd2si.dst)"
            free_AsmOperand(@self[].get._AsmCvttsd2si.dst)
            self[].get._AsmCvttsd2si.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmCvtsi2sd(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCvtsi2sd_t
    self[].get._AsmCvtsi2sd.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCvtsi2sd.asm_type)"
        if asm_type[] ~= self[].get._AsmCvtsi2sd.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCvtsi2sd.asm_type)"
            free_AssemblyType(@self[].get._AsmCvtsi2sd.asm_type)
            self[].get._AsmCvtsi2sd.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmCvtsi2sd.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmCvtsi2sd.src)"
        if src[] ~= self[].get._AsmCvtsi2sd.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmCvtsi2sd.src)"
            free_AsmOperand(@self[].get._AsmCvtsi2sd.src)
            self[].get._AsmCvtsi2sd.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmCvtsi2sd.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmCvtsi2sd.dst)"
        if dst[] ~= self[].get._AsmCvtsi2sd.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmCvtsi2sd.dst)"
            free_AsmOperand(@self[].get._AsmCvtsi2sd.dst)
            self[].get._AsmCvtsi2sd.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: **struc AssemblyType, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmUnary_t
    self[].get._AsmUnary.unop = unop[]
    self[].get._AsmUnary.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmUnary.asm_type)"
        if asm_type[] ~= self[].get._AsmUnary.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmUnary.asm_type)"
            free_AssemblyType(@self[].get._AsmUnary.asm_type)
            self[].get._AsmUnary.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmUnary.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmUnary.dst)"
        if dst[] ~= self[].get._AsmUnary.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmUnary.dst)"
            free_AsmOperand(@self[].get._AsmUnary.dst)
            self[].get._AsmUnary.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmBinary_t
    self[].get._AsmBinary.binop = binop[]
    self[].get._AsmBinary.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmBinary.asm_type)"
        if asm_type[] ~= self[].get._AsmBinary.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmBinary.asm_type)"
            free_AssemblyType(@self[].get._AsmBinary.asm_type)
            self[].get._AsmBinary.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmBinary.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmBinary.src)"
        if src[] ~= self[].get._AsmBinary.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmBinary.src)"
            free_AsmOperand(@self[].get._AsmBinary.src)
            self[].get._AsmBinary.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmBinary.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmBinary.dst)"
        if dst[] ~= self[].get._AsmBinary.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmBinary.dst)"
            free_AsmOperand(@self[].get._AsmBinary.dst)
            self[].get._AsmBinary.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmCmp(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCmp_t
    self[].get._AsmCmp.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCmp.asm_type)"
        if asm_type[] ~= self[].get._AsmCmp.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCmp.asm_type)"
            free_AssemblyType(@self[].get._AsmCmp.asm_type)
            self[].get._AsmCmp.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmCmp.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmCmp.src)"
        if src[] ~= self[].get._AsmCmp.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmCmp.src)"
            free_AsmOperand(@self[].get._AsmCmp.src)
            self[].get._AsmCmp.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._AsmCmp.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmCmp.dst)"
        if dst[] ~= self[].get._AsmCmp.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmCmp.dst)"
            free_AsmOperand(@self[].get._AsmCmp.dst)
            self[].get._AsmCmp.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmIdiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmIdiv_t
    self[].get._AsmIdiv.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmIdiv.asm_type)"
        if asm_type[] ~= self[].get._AsmIdiv.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmIdiv.asm_type)"
            free_AssemblyType(@self[].get._AsmIdiv.asm_type)
            self[].get._AsmIdiv.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmIdiv.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmIdiv.src)"
        if src[] ~= self[].get._AsmIdiv.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmIdiv.src)"
            free_AsmOperand(@self[].get._AsmIdiv.src)
            self[].get._AsmIdiv.src = src[]
            src[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmDiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmDiv_t
    self[].get._AsmDiv.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmDiv.asm_type)"
        if asm_type[] ~= self[].get._AsmDiv.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmDiv.asm_type)"
            free_AssemblyType(@self[].get._AsmDiv.asm_type)
            self[].get._AsmDiv.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    self[].get._AsmDiv.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmDiv.src)"
        if src[] ~= self[].get._AsmDiv.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmDiv.src)"
            free_AsmOperand(@self[].get._AsmDiv.src)
            self[].get._AsmDiv.src = src[]
            src[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmCdq(asm_type: **struc AssemblyType) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCdq_t
    self[].get._AsmCdq.asm_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCdq.asm_type)"
        if asm_type[] ~= self[].get._AsmCdq.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCdq.asm_type)"
            free_AssemblyType(@self[].get._AsmCdq.asm_type)
            self[].get._AsmCdq.asm_type = asm_type[]
            asm_type[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmJmp(target: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmJmp_t
    self[].get._AsmJmp.target = target
    return self
}

pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmJmpCC_t
    self[].get._AsmJmpCC.target = target
    self[].get._AsmJmpCC.cond_code = cond_code[]
    return self
}

pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmSetCC_t
    self[].get._AsmSetCC.cond_code = cond_code[]
    self[].get._AsmSetCC.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmSetCC.dst)"
        if dst[] ~= self[].get._AsmSetCC.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmSetCC.dst)"
            free_AsmOperand(@self[].get._AsmSetCC.dst)
            self[].get._AsmSetCC.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmLabel(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmLabel_t
    self[].get._AsmLabel.name = name
    return self
}

pub fn make_AsmPush(src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmPush_t
    self[].get._AsmPush.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmPush.src)"
        if src[] ~= self[].get._AsmPush.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmPush.src)"
            free_AsmOperand(@self[].get._AsmPush.src)
            self[].get._AsmPush.src = src[]
            src[] = uptr_new()
        }
    }
    return self
}

pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmPop_t
    self[].get._AsmPop.reg = reg[]
    return self
}

pub fn make_AsmCall(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCall_t
    self[].get._AsmCall.name = name
    return self
}

pub fn make_AsmRet(none) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmRet_t
    return self
}

pub fn free_AsmInstruction(self: **struc AsmInstruction) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_AsmInstruction_t {
            break
        }
        -> AST_AsmMov_t {
            free_AssemblyType(@(self[])[].get._AsmMov.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmMov.src)
        free_AsmOperand(@(self[])[].get._AsmMov.dst)
        break
        -> AST_AsmMovSx_t {
            free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovSx.src)
        free_AsmOperand(@(self[])[].get._AsmMovSx.dst)
        break
        -> AST_AsmMovZeroExtend_t {
            free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.src)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.dst)
        break
        -> AST_AsmLea_t {
            free_AsmOperand(@(self[])[].get._AsmLea.src)
        }
        free_AsmOperand(@(self[])[].get._AsmLea.dst)
        break
        -> AST_AsmCvttsd2si_t {
            free_AssemblyType(@(self[])[].get._AsmCvttsd2si.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.src)
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.dst)
        break
        -> AST_AsmCvtsi2sd_t {
            free_AssemblyType(@(self[])[].get._AsmCvtsi2sd.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.src)
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.dst)
        break
        -> AST_AsmUnary_t {
            free_AssemblyType(@(self[])[].get._AsmUnary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmUnary.dst)
        break
        -> AST_AsmBinary_t {
            free_AssemblyType(@(self[])[].get._AsmBinary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmBinary.src)
        free_AsmOperand(@(self[])[].get._AsmBinary.dst)
        break
        -> AST_AsmCmp_t {
            free_AssemblyType(@(self[])[].get._AsmCmp.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCmp.src)
        free_AsmOperand(@(self[])[].get._AsmCmp.dst)
        break
        -> AST_AsmIdiv_t {
            free_AssemblyType(@(self[])[].get._AsmIdiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmIdiv.src)
        break
        -> AST_AsmDiv_t {
            free_AssemblyType(@(self[])[].get._AsmDiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmDiv.src)
        break
        -> AST_AsmCdq_t {
            free_AssemblyType(@(self[])[].get._AsmCdq.asm_type)
        }
        break
        -> AST_AsmJmp_t {
            break
        }
        -> AST_AsmJmpCC_t {
            break
        }
        -> AST_AsmSetCC_t {
            free_AsmOperand(@(self[])[].get._AsmSetCC.dst)
        }
        break
        -> AST_AsmLabel_t {
            break
        }
        -> AST_AsmPush_t {
            free_AsmOperand(@(self[])[].get._AsmPush.src)
        }
        break
        -> AST_AsmPop_t {
            break
        }
        -> AST_AsmCall_t {
            break
        }
        -> AST_AsmRet_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_AsmTopLevel(none) *struc AsmTopLevel {
    self: *struc AsmTopLevel = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(AsmTopLevel, self)"
        free_AsmTopLevel(@self)
        self = cast<*struc AsmTopLevel>(malloc(sizeof<struc AsmTopLevel>))
        if not self {
            panic_sigabrt("alloc "                 "AsmTopLevel")
        }
    }
    self[].tag = AST_AsmTopLevel_t
    return self
}

pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: ***struc AsmInstruction) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmFunction_t
    self[].get._AsmFunction.name = name
    self[].get._AsmFunction.is_glob = is_glob
    self[].get._AsmFunction.is_ret_memory = is_ret_memory
    self[].get._AsmFunction.instructions = vec_new()
    if instructions[] ~= self[].get._AsmFunction.instructions {
        "@MACRO@:vec_move(*instructions, self->get._AsmFunction.instructions)"
        if self[].get._AsmFunction.instructions {
            "@MACRO@:vec_delete(self->get._AsmFunction.instructions)"
            loop .. while 0 {
                cast<none>((? (self[].get._AsmFunction.instructions) then free((cast<*struc stbds_array_header>((self[].get._AsmFunction.instructions)) - 1)) else cast<none>(0)))
                (self[].get._AsmFunction.instructions) = nil
            }
            self[].get._AsmFunction.instructions = vec_new()
        }
        self[].get._AsmFunction.instructions = instructions[]
        instructions[] = vec_new()
    }
    return self
}

pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: ***struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmStaticVariable_t
    self[].get._AsmStaticVariable.name = name
    self[].get._AsmStaticVariable.alignment = alignment
    self[].get._AsmStaticVariable.is_glob = is_glob
    self[].get._AsmStaticVariable.static_inits = vec_new()
    if static_inits[] ~= self[].get._AsmStaticVariable.static_inits {
        "@MACRO@:vec_move(*static_inits, self->get._AsmStaticVariable.static_inits)"
        if self[].get._AsmStaticVariable.static_inits {
            "@MACRO@:vec_delete(self->get._AsmStaticVariable.static_inits)"
            loop .. while 0 {
                cast<none>((? (self[].get._AsmStaticVariable.static_inits) then free((cast<*struc stbds_array_header>((self[].get._AsmStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._AsmStaticVariable.static_inits) = nil
            }
            self[].get._AsmStaticVariable.static_inits = vec_new()
        }
        self[].get._AsmStaticVariable.static_inits = static_inits[]
        static_inits[] = vec_new()
    }
    return self
}

pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmStaticConstant_t
    self[].get._AsmStaticConstant.name = name
    self[].get._AsmStaticConstant.alignment = alignment
    self[].get._AsmStaticConstant.static_init = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(StaticInit, *static_init, self->get._AsmStaticConstant.static_init)"
        if static_init[] ~= self[].get._AsmStaticConstant.static_init {
            "@MACRO@:uptr_move(StaticInit, *static_init, self->get._AsmStaticConstant.static_init)"
            free_StaticInit(@self[].get._AsmStaticConstant.static_init)
            self[].get._AsmStaticConstant.static_init = static_init[]
            static_init[] = uptr_new()
        }
    }
    return self
}

pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_AsmTopLevel_t {
            break
        }
        -> AST_AsmFunction_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._AsmFunction.instructions) then (cast<*struc stbds_array_header>(((self[])[].get._AsmFunction.instructions)) - 1)[].length else 0) .. ++i {
                free_AsmInstruction(@(self[])[].get._AsmFunction.instructions[i])
            }
        }
        if (self[])[].get._AsmFunction.instructions {
            "@MACRO@:vec_delete((*self)->get._AsmFunction.instructions)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._AsmFunction.instructions) then free((cast<*struc stbds_array_header>(((self[])[].get._AsmFunction.instructions)) - 1)) else cast<none>(0)))
                ((self[])[].get._AsmFunction.instructions) = nil
            }
            (self[])[].get._AsmFunction.instructions = vec_new()
        }
        break
        -> AST_AsmStaticVariable_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._AsmStaticVariable.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._AsmStaticVariable.static_inits)) - 1)[].length else 0) .. ++i {
                free_StaticInit(@(self[])[].get._AsmStaticVariable.static_inits[i])
            }
        }
        if (self[])[].get._AsmStaticVariable.static_inits {
            "@MACRO@:vec_delete((*self)->get._AsmStaticVariable.static_inits)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._AsmStaticVariable.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._AsmStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._AsmStaticVariable.static_inits) = nil
            }
            (self[])[].get._AsmStaticVariable.static_inits = vec_new()
        }
        break
        -> AST_AsmStaticConstant_t {
            free_StaticInit(@(self[])[].get._AsmStaticConstant.static_init)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_AsmProgram(static_const_toplvls: ***struc AsmTopLevel, top_levels: ***struc AsmTopLevel) *struc AsmProgram {
    self: *struc AsmProgram = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(AsmProgram, self)"
        free_AsmProgram(@self)
        self = cast<*struc AsmProgram>(malloc(sizeof<struc AsmProgram>))
        if not self {
            panic_sigabrt("alloc "                 "AsmProgram")
        }
    }
    self[].tag = AST_AsmProgram_t
    self[].static_const_toplvls = vec_new()
    if static_const_toplvls[] ~= self[].static_const_toplvls {
        "@MACRO@:vec_move(*static_const_toplvls, self->static_const_toplvls)"
        if self[].static_const_toplvls {
            "@MACRO@:vec_delete(self->static_const_toplvls)"
            loop .. while 0 {
                cast<none>((? (self[].static_const_toplvls) then free((cast<*struc stbds_array_header>((self[].static_const_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_const_toplvls) = nil
            }
            self[].static_const_toplvls = vec_new()
        }
        self[].static_const_toplvls = static_const_toplvls[]
        static_const_toplvls[] = vec_new()
    }
    self[].top_levels = vec_new()
    if top_levels[] ~= self[].top_levels {
        "@MACRO@:vec_move(*top_levels, self->top_levels)"
        if self[].top_levels {
            "@MACRO@:vec_delete(self->top_levels)"
            loop .. while 0 {
                cast<none>((? (self[].top_levels) then free((cast<*struc stbds_array_header>((self[].top_levels)) - 1)) else cast<none>(0)))
                (self[].top_levels) = nil
            }
            self[].top_levels = vec_new()
        }
        self[].top_levels = top_levels[]
        top_levels[] = vec_new()
    }
    return self
}

pub fn free_AsmProgram(self: **struc AsmProgram) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_AsmProgram_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_const_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        free_AsmTopLevel(@(self[])[].static_const_toplvls[i])
    }
    if (self[])[].static_const_toplvls {
        "@MACRO@:vec_delete((*self)->static_const_toplvls)"
        loop .. while 0 {
            cast<none>((? ((self[])[].static_const_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_const_toplvls) = nil
        }
        (self[])[].static_const_toplvls = vec_new()
    }
    loop i: u64 = 0 while i < (? ((self[])[].top_levels) then (cast<*struc stbds_array_header>(((self[])[].top_levels)) - 1)[].length else 0) .. ++i {
        free_AsmTopLevel(@(self[])[].top_levels[i])
    }
    if (self[])[].top_levels {
        "@MACRO@:vec_delete((*self)->top_levels)"
        loop .. while 0 {
            cast<none>((? ((self[])[].top_levels) then free((cast<*struc stbds_array_header>(((self[])[].top_levels)) - 1)) else cast<none>(0)))
            ((self[])[].top_levels) = nil
        }
        (self[])[].top_levels = vec_new()
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}
