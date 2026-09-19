m4_ifdef(`_AST_INTERM_AST_M4', `', `
m4_define(`_AST_INTERM_AST_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

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

type struc TacFunCall(name: u64, args: vector_t(shared_ptr_t(TacValue)), dst: *struc TacValue)

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
pub fn make_TacFunCall(name: u64, args: *vector_t(shared_ptr_t(TacValue)), dst: **struc TacValue) *struc TacInstruction;
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

type struc TacFunction(name: u64, is_glob: i32, params: vector_t(TIdentifier), body: vector_t(unique_ptr_t(TacInstruction)))

type struc TacStaticVariable(name: u64, is_glob: i32, static_init_type: *struc Type, static_inits: vector_t(shared_ptr_t(StaticInit)))

type struc TacStaticConstant(name: u64, static_init_type: *struc Type, static_init: *struc StaticInit)

type union _TacTopLevel(_TacFunction: struc TacFunction, _TacStaticVariable: struc TacStaticVariable, _TacStaticConstant: struc TacStaticConstant)

type struc TacTopLevel(tag: i32, get: union _TacTopLevel)
pub fn make_TacTopLevel(none) *struc TacTopLevel;
pub fn make_TacFunction(name: u64, is_glob: i32, params: *vector_t(TIdentifier), body: *vector_t(unique_ptr_t(TacInstruction))) *struc TacTopLevel;
pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: *vector_t(shared_ptr_t(StaticInit))) *struc TacTopLevel;
pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel;
pub fn free_TacTopLevel(self: **struc TacTopLevel) none;

type struc TacProgram(tag: i32, static_const_toplvls: vector_t(unique_ptr_t(TacTopLevel)), static_var_toplvls: vector_t(unique_ptr_t(TacTopLevel)), fun_toplvls: vector_t(unique_ptr_t(TacTopLevel)))
pub fn make_TacProgram(static_const_toplvls: *vector_t(unique_ptr_t(TacTopLevel)), static_var_toplvls: *vector_t(unique_ptr_t(TacTopLevel)), fun_toplvls: *vector_t(unique_ptr_t(TacTopLevel))) *struc TacProgram;
pub fn free_TacProgram(self: **struc TacProgram) none;

')m4_dnl
