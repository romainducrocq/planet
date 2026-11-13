m4_ifdef(`_AST_INTERM_AST_M4', `', `
m4_define(`_AST_INTERM_AST_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

########################################################################################################################

# Intermediate abstract syntax tree

########################################################################################################################

type struc TacUnaryOp;
type struc TacBinaryOp;
type struc TacValue;
type struc TacExpResult;
type struc TacInstruction;
type struc TacTopLevel;
type struc TacProgram;

########################################################################################################################

# unary_operator = Complement
#                | Negate
#                | Not

type struc TacUnaryOp(tagged_def_impl(AST_T))
pub fn make_TacUnaryOp(tagged_def_impl(AST_T)) struc TacUnaryOp;
m4_define(`init_TacUnaryOp', `tagged_def_init(AST, TacUnaryOp, TacUnaryOp)')m4_dnl
m4_define(`init_TacComplement', `tagged_def_init(AST, TacUnaryOp, TacComplement)')m4_dnl
m4_define(`init_TacNegate', `tagged_def_init(AST, TacUnaryOp, TacNegate)')m4_dnl
m4_define(`init_TacNot', `tagged_def_init(AST, TacUnaryOp, TacNot)')m4_dnl

########################################################################################################################

# binary_operator = Add
#                 | Subtract
#                 | Multiply
#                 | Divide
#                 | Remainder
#                 | BitAnd
#                 | BitOr
#                 | BitXor
#                 | BitShiftLeft
#                 | BitShiftRight
#                 | BitShrArithmetic
#                 | Equal
#                 | NotEqual
#                 | LessThan
#                 | LessOrEqual
#                 | GreaterThan
#                 | GreaterOrEqual

type struc TacBinaryOp(tagged_def_impl(AST_T))
pub fn make_TacBinaryOp(tagged_def_impl(AST_T)) struc TacBinaryOp;
m4_define(`init_TacBinaryOp', `tagged_def_init(AST, TacBinaryOp, TacBinaryOp)')m4_dnl
m4_define(`init_TacAdd', `tagged_def_init(AST, TacBinaryOp, TacAdd)')m4_dnl
m4_define(`init_TacSubtract', `tagged_def_init(AST, TacBinaryOp, TacSubtract)')m4_dnl
m4_define(`init_TacMultiply', `tagged_def_init(AST, TacBinaryOp, TacMultiply)')m4_dnl
m4_define(`init_TacDivide', `tagged_def_init(AST, TacBinaryOp, TacDivide)')m4_dnl
m4_define(`init_TacRemainder', `tagged_def_init(AST, TacBinaryOp, TacRemainder)')m4_dnl
m4_define(`init_TacBitAnd', `tagged_def_init(AST, TacBinaryOp, TacBitAnd)')m4_dnl
m4_define(`init_TacBitOr', `tagged_def_init(AST, TacBinaryOp, TacBitOr)')m4_dnl
m4_define(`init_TacBitXor', `tagged_def_init(AST, TacBinaryOp, TacBitXor)')m4_dnl
m4_define(`init_TacBitShiftLeft', `tagged_def_init(AST, TacBinaryOp, TacBitShiftLeft)')m4_dnl
m4_define(`init_TacBitShiftRight', `tagged_def_init(AST, TacBinaryOp, TacBitShiftRight)')m4_dnl
m4_define(`init_TacBitShrArithmetic', `tagged_def_init(AST, TacBinaryOp, TacBitShrArithmetic)')m4_dnl
m4_define(`init_TacEqual', `tagged_def_init(AST, TacBinaryOp, TacEqual)')m4_dnl
m4_define(`init_TacNotEqual', `tagged_def_init(AST, TacBinaryOp, TacNotEqual)')m4_dnl
m4_define(`init_TacLessThan', `tagged_def_init(AST, TacBinaryOp, TacLessThan)')m4_dnl
m4_define(`init_TacLessOrEqual', `tagged_def_init(AST, TacBinaryOp, TacLessOrEqual)')m4_dnl
m4_define(`init_TacGreaterThan', `tagged_def_init(AST, TacBinaryOp, TacGreaterThan)')m4_dnl
m4_define(`init_TacGreaterOrEqual', `tagged_def_init(AST, TacBinaryOp, TacGreaterOrEqual)')m4_dnl

########################################################################################################################

# val = Constant(int)
#     | Var(identifier)

type struc TacConstant(constant: shared_ptr_t(CConst))
type struc TacVariable(name: TIdentifier)
type union _TacValue(
    _TacConstant: struc TacConstant,
    _TacVariable: struc TacVariable
)

type struc TacValue(shared_ptr_impl(AST_T)
    get: union _TacValue
)
pub fn make_TacValue(none) shared_ptr_t(TacValue);
pub fn make_TacConstant(constant: *shared_ptr_t(CConst)) shared_ptr_t(TacValue);
pub fn make_TacVariable(name: TIdentifier) shared_ptr_t(TacValue);
pub fn free_TacValue(self: *shared_ptr_t(TacValue)) none;

########################################################################################################################

# exp_result = PlainOperand(val)
#            | DereferencedPointer(val)
#            | SubObject(identifier, int)

type struc TacPlainOperand(val: shared_ptr_t(TacValue))
type struc TacDereferencedPointer(val: shared_ptr_t(TacValue))
type struc TacSubObject(base_name: TIdentifier, offset: TLong)
type union _TacExpResult(
    _TacPlainOperand: struc TacPlainOperand,
    _TacDereferencedPointer: struc TacDereferencedPointer,
    _TacSubObject: struc TacSubObject
)

type struc TacExpResult(unique_ptr_impl(AST_T)
    get: union _TacExpResult
)
pub fn make_TacExpResult(none) unique_ptr_t(TacExpResult);
pub fn make_TacPlainOperand(val: *shared_ptr_t(TacValue)) unique_ptr_t(TacExpResult);
pub fn make_TacDereferencedPointer(val: *shared_ptr_t(TacValue)) unique_ptr_t(TacExpResult);
pub fn make_TacSubObject(base_name: TIdentifier, offset: TLong) unique_ptr_t(TacExpResult);
pub fn free_TacExpResult(self: *unique_ptr_t(TacExpResult)) none;

########################################################################################################################

# instruction = Return(val?)
#             | SignExtend(val, val)
#             | Truncate(val, val)
#             | ZeroExtend(val, val)
#             | DoubleToInt(val, val)
#             | DoubleToUInt(val, val)
#             | IntToDouble(val, val)
#             | UIntToDouble(val, val)
#             | FunCall(identifier, val*, val?)
#             | Unary(unary_operator, val, val)
#             | Binary(binary_operator, val, val, val)
#             | Copy(val, val)
#             | GetAddress(val, val)
#             | Load(val, val)
#             | Store(val, val)
#             | AddPtr(int, val, val, val)
#             | CopyToOffset(identifier, int, val)
#             | CopyFromOffset(identifier, int, val)
#             | Jump(identifier)
#             | JumpIfZero(val, identifier)
#             | JumpIfNotZero(val, identifier)
#             | Label(identifier)

type struc TacReturn(val: shared_ptr_t(TacValue))
type struc TacSignExtend(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacTruncate(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacZeroExtend(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacDoubleToInt(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacDoubleToUInt(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacIntToDouble(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacUIntToDouble(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacFunCall(name: TIdentifier, args: vector_t(shared_ptr_t(TacValue)), dst: shared_ptr_t(TacValue))
type struc TacUnary(unop: struc TacUnaryOp, src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacBinary(
    binop: struc TacBinaryOp, src1: shared_ptr_t(TacValue), src2: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue)
)
type struc TacCopy(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacGetAddress(src: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacLoad(src_ptr: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue))
type struc TacStore(src: shared_ptr_t(TacValue), dst_ptr: shared_ptr_t(TacValue))
type struc TacAddPtr(
    scale: TLong, src_ptr: shared_ptr_t(TacValue), idx: shared_ptr_t(TacValue), dst: shared_ptr_t(TacValue)
)
type struc TacCopyToOffset(dst_name: TIdentifier, offset: TLong, src: shared_ptr_t(TacValue))
type struc TacCopyFromOffset(src_name: TIdentifier, offset: TLong, dst: shared_ptr_t(TacValue))
type struc TacJump(target: TIdentifier)
type struc TacJumpIfZero(target: TIdentifier, condition: shared_ptr_t(TacValue))
type struc TacJumpIfNotZero(target: TIdentifier, condition: shared_ptr_t(TacValue))
type struc TacLabel(name: TIdentifier)
type union _TacInstruction(
    _TacReturn: struc TacReturn,
    _TacSignExtend: struc TacSignExtend,
    _TacTruncate: struc TacTruncate,
    _TacZeroExtend: struc TacZeroExtend,
    _TacDoubleToInt: struc TacDoubleToInt,
    _TacDoubleToUInt: struc TacDoubleToUInt,
    _TacIntToDouble: struc TacIntToDouble,
    _TacUIntToDouble: struc TacUIntToDouble,
    _TacFunCall: struc TacFunCall,
    _TacUnary: struc TacUnary,
    _TacBinary: struc TacBinary,
    _TacCopy: struc TacCopy,
    _TacGetAddress: struc TacGetAddress,
    _TacLoad: struc TacLoad,
    _TacStore: struc TacStore,
    _TacAddPtr: struc TacAddPtr,
    _TacCopyToOffset: struc TacCopyToOffset,
    _TacCopyFromOffset: struc TacCopyFromOffset,
    _TacJump: struc TacJump,
    _TacJumpIfZero: struc TacJumpIfZero,
    _TacJumpIfNotZero: struc TacJumpIfNotZero,
    _TacLabel: struc TacLabel
)

type struc TacInstruction(unique_ptr_impl(AST_T)
    get: union _TacInstruction
)
pub fn make_TacInstruction(none) unique_ptr_t(TacInstruction);
pub fn make_TacReturn(val: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacSignExtend(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacTruncate(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacZeroExtend(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacDoubleToInt(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacDoubleToUInt(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacIntToDouble(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacUIntToDouble(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacFunCall(
    name: TIdentifier, args: *vector_t(shared_ptr_t(TacValue)), dst: *shared_ptr_t(TacValue)
) unique_ptr_t(TacInstruction);
pub fn make_TacUnary(
    unop: *struc TacUnaryOp, src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)
) unique_ptr_t(TacInstruction);
pub fn make_TacBinary(
    binop: *struc TacBinaryOp, src1: *shared_ptr_t(TacValue), src2: *shared_ptr_t(TacValue),
    dst: *shared_ptr_t(TacValue)
) unique_ptr_t(TacInstruction);
pub fn make_TacCopy(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacGetAddress(src: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacLoad(src_ptr: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacStore(src: *shared_ptr_t(TacValue), dst_ptr: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacAddPtr(
    scale: TLong, src_ptr: *shared_ptr_t(TacValue), idx: *shared_ptr_t(TacValue), dst: *shared_ptr_t(TacValue)
) unique_ptr_t(TacInstruction);
pub fn make_TacCopyToOffset(
    dst_name: TIdentifier, offset: TLong, src: *shared_ptr_t(TacValue)
) unique_ptr_t(TacInstruction);
pub fn make_TacCopyFromOffset(
    src_name: TIdentifier, offset: TLong, dst: *shared_ptr_t(TacValue)
) unique_ptr_t(TacInstruction);
pub fn make_TacJump(target: TIdentifier) unique_ptr_t(TacInstruction);
pub fn make_TacJumpIfZero(target: TIdentifier, condition: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacJumpIfNotZero(target: TIdentifier, condition: *shared_ptr_t(TacValue)) unique_ptr_t(TacInstruction);
pub fn make_TacLabel(name: TIdentifier) unique_ptr_t(TacInstruction);
pub fn free_TacInstruction(self: *unique_ptr_t(TacInstruction)) none;

########################################################################################################################

# top_level = Function(identifier, bool, identifier*, instruction*)
#           | StaticVariable(identifier, bool, type, static_init*)
#           | StaticConstant(identifier, type, static_init)

type struc TacFunction(
    name: TIdentifier, is_glob: bool, params: vector_t(TIdentifier), body: vector_t(unique_ptr_t(TacInstruction))
)
type struc TacStaticVariable(
    name: TIdentifier, is_glob: bool, static_init_type: shared_ptr_t(Type),
    static_inits: vector_t(shared_ptr_t(StaticInit))
)
type struc TacStaticConstant(
    name: TIdentifier, static_init_type: shared_ptr_t(Type), static_init: shared_ptr_t(StaticInit)
)
type union _TacTopLevel(
    _TacFunction: struc TacFunction,
    _TacStaticVariable: struc TacStaticVariable,
    _TacStaticConstant: struc TacStaticConstant
)

type struc TacTopLevel(unique_ptr_impl(AST_T)
    get: union _TacTopLevel
)
pub fn make_TacTopLevel(none) unique_ptr_t(TacTopLevel);
pub fn make_TacFunction(
    name: TIdentifier, is_glob: bool, params: *vector_t(TIdentifier), body: *vector_t(unique_ptr_t(TacInstruction))
) unique_ptr_t(TacTopLevel);
pub fn make_TacStaticVariable(
    name: TIdentifier, is_glob: bool, static_init_type: *shared_ptr_t(Type),
    static_inits: *vector_t(shared_ptr_t(StaticInit))
) unique_ptr_t(TacTopLevel);
pub fn make_TacStaticConstant(
    name: TIdentifier, static_init_type: *shared_ptr_t(Type), static_init: *shared_ptr_t(StaticInit)
) unique_ptr_t(TacTopLevel);
pub fn free_TacTopLevel(self: *unique_ptr_t(TacTopLevel)) none;

########################################################################################################################

# AST = Program(top_level*, top_level*, top_level*)

type struc TacProgram(unique_ptr_impl(AST_T)
    static_const_toplvls: vector_t(unique_ptr_t(TacTopLevel)), static_var_toplvls: vector_t(unique_ptr_t(TacTopLevel)),
    fun_toplvls: vector_t(unique_ptr_t(TacTopLevel))
)
pub fn make_TacProgram(static_const_toplvls: *vector_t(unique_ptr_t(TacTopLevel)),
    static_var_toplvls: *vector_t(unique_ptr_t(TacTopLevel)), fun_toplvls: *vector_t(unique_ptr_t(TacTopLevel))
) unique_ptr_t(TacProgram);
pub fn free_TacProgram(self: *unique_ptr_t(TacProgram)) none;

')m4_dnl
