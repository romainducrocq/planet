#ifndef _AST_INTERM_AST_H
#define _AST_INTERM_AST_H

#include "../lib/c_std.h"

#include "../ast/ast.h"
#include "../ast/front_symt.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Intermediate abstract syntax tree

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct TacUnaryOp;
struct TacBinaryOp;
struct TacValue;
struct TacExpResult;
struct TacInstruction;
struct TacTopLevel;
struct TacProgram;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// unary_operator = Complement
//                | Negate
//                | Not

struct TacUnaryOp {
    tagged_def_impl(AST_T);
};

struct TacUnaryOp make_TacUnaryOp(tagged_def_impl(AST_T));
#define init_TacUnaryOp() tagged_def_init(AST, TacUnaryOp, TacUnaryOp)
#define init_TacComplement() tagged_def_init(AST, TacUnaryOp, TacComplement)
#define init_TacNegate() tagged_def_init(AST, TacUnaryOp, TacNegate)
#define init_TacNot() tagged_def_init(AST, TacUnaryOp, TacNot)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// binary_operator = Add
//                 | Subtract
//                 | Multiply
//                 | Divide
//                 | Remainder
//                 | BitAnd
//                 | BitOr
//                 | BitXor
//                 | BitShiftLeft
//                 | BitShiftRight
//                 | BitShrArithmetic
//                 | Equal
//                 | NotEqual
//                 | LessThan
//                 | LessOrEqual
//                 | GreaterThan
//                 | GreaterOrEqual

struct TacBinaryOp {
    tagged_def_impl(AST_T);
};

struct TacBinaryOp make_TacBinaryOp(tagged_def_impl(AST_T));
#define init_TacBinaryOp() tagged_def_init(AST, TacBinaryOp, TacBinaryOp)
#define init_TacAdd() tagged_def_init(AST, TacBinaryOp, TacAdd)
#define init_TacSubtract() tagged_def_init(AST, TacBinaryOp, TacSubtract)
#define init_TacMultiply() tagged_def_init(AST, TacBinaryOp, TacMultiply)
#define init_TacDivide() tagged_def_init(AST, TacBinaryOp, TacDivide)
#define init_TacRemainder() tagged_def_init(AST, TacBinaryOp, TacRemainder)
#define init_TacBitAnd() tagged_def_init(AST, TacBinaryOp, TacBitAnd)
#define init_TacBitOr() tagged_def_init(AST, TacBinaryOp, TacBitOr)
#define init_TacBitXor() tagged_def_init(AST, TacBinaryOp, TacBitXor)
#define init_TacBitShiftLeft() tagged_def_init(AST, TacBinaryOp, TacBitShiftLeft)
#define init_TacBitShiftRight() tagged_def_init(AST, TacBinaryOp, TacBitShiftRight)
#define init_TacBitShrArithmetic() tagged_def_init(AST, TacBinaryOp, TacBitShrArithmetic)
#define init_TacEqual() tagged_def_init(AST, TacBinaryOp, TacEqual)
#define init_TacNotEqual() tagged_def_init(AST, TacBinaryOp, TacNotEqual)
#define init_TacLessThan() tagged_def_init(AST, TacBinaryOp, TacLessThan)
#define init_TacLessOrEqual() tagged_def_init(AST, TacBinaryOp, TacLessOrEqual)
#define init_TacGreaterThan() tagged_def_init(AST, TacBinaryOp, TacGreaterThan)
#define init_TacGreaterOrEqual() tagged_def_init(AST, TacBinaryOp, TacGreaterOrEqual)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// val = Constant(int)
//     | Var(identifier)

struct TacConstant {
    shared_ptr_t(CConst) constant;
};

struct TacVariable {
    TIdentifier name;
};

union _TacValue {
    struct TacConstant _TacConstant;
    struct TacVariable _TacVariable;
};

struct TacValue {
    shared_ptr_impl(AST_T);
    union _TacValue get;
};

shared_ptr_t(TacValue) make_TacValue(void);
shared_ptr_t(TacValue) make_TacConstant(shared_ptr_t(CConst) * constant);
shared_ptr_t(TacValue) make_TacVariable(TIdentifier name);
void free_TacValue(shared_ptr_t(TacValue) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// exp_result = PlainOperand(val)
//            | DereferencedPointer(val)
//            | SubObject(identifier, int)

struct TacPlainOperand {
    shared_ptr_t(TacValue) val;
};

struct TacDereferencedPointer {
    shared_ptr_t(TacValue) val;
};

struct TacSubObject {
    TIdentifier base_name;
    TLong offset;
};

union _TacExpResult {
    struct TacPlainOperand _TacPlainOperand;
    struct TacDereferencedPointer _TacDereferencedPointer;
    struct TacSubObject _TacSubObject;
};

struct TacExpResult {
    unique_ptr_impl(AST_T);
    union _TacExpResult get;
};

unique_ptr_t(TacExpResult) make_TacExpResult(void);
unique_ptr_t(TacExpResult) make_TacPlainOperand(shared_ptr_t(TacValue) * val);
unique_ptr_t(TacExpResult) make_TacDereferencedPointer(shared_ptr_t(TacValue) * val);
unique_ptr_t(TacExpResult) make_TacSubObject(TIdentifier base_name, TLong offset);
void free_TacExpResult(unique_ptr_t(TacExpResult) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// instruction = Return(val?)
//             | SignExtend(val, val)
//             | Truncate(val, val)
//             | ZeroExtend(val, val)
//             | DoubleToInt(val, val)
//             | DoubleToUInt(val, val)
//             | IntToDouble(val, val)
//             | UIntToDouble(val, val)
//             | FunCall(identifier, val*, val?)
//             | Unary(unary_operator, val, val)
//             | Binary(binary_operator, val, val, val)
//             | Copy(val, val)
//             | GetAddress(val, val)
//             | Load(val, val)
//             | Store(val, val)
//             | AddPtr(int, val, val, val)
//             | CopyToOffset(identifier, int, val)
//             | CopyFromOffset(identifier, int, val)
//             | Jump(identifier)
//             | JumpIfZero(val, identifier)
//             | JumpIfNotZero(val, identifier)
//             | Label(identifier)

struct TacReturn {
    shared_ptr_t(TacValue) val;
};

struct TacSignExtend {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacTruncate {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacZeroExtend {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacDoubleToInt {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacDoubleToUInt {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacIntToDouble {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacUIntToDouble {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacFunCall {
    TIdentifier name;
    vector_t(shared_ptr_t(TacValue)) args;
    shared_ptr_t(TacValue) dst;
};

struct TacUnary {
    struct TacUnaryOp unop;
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacBinary {
    struct TacBinaryOp binop;
    shared_ptr_t(TacValue) src1;
    shared_ptr_t(TacValue) src2;
    shared_ptr_t(TacValue) dst;
};

struct TacCopy {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacGetAddress {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst;
};

struct TacLoad {
    shared_ptr_t(TacValue) src_ptr;
    shared_ptr_t(TacValue) dst;
};

struct TacStore {
    shared_ptr_t(TacValue) src;
    shared_ptr_t(TacValue) dst_ptr;
};

struct TacAddPtr {
    TLong scale;
    shared_ptr_t(TacValue) src_ptr;
    shared_ptr_t(TacValue) idx;
    shared_ptr_t(TacValue) dst;
};

struct TacCopyToOffset {
    TIdentifier dst_name;
    TLong offset;
    shared_ptr_t(TacValue) src;
};

struct TacCopyFromOffset {
    TIdentifier src_name;
    TLong offset;
    shared_ptr_t(TacValue) dst;
};

struct TacJump {
    TIdentifier target;
};

struct TacJumpIfZero {
    TIdentifier target;
    shared_ptr_t(TacValue) condition;
};

struct TacJumpIfNotZero {
    TIdentifier target;
    shared_ptr_t(TacValue) condition;
};

struct TacLabel {
    TIdentifier name;
};

union _TacInstruction {
    struct TacReturn _TacReturn;
    struct TacSignExtend _TacSignExtend;
    struct TacTruncate _TacTruncate;
    struct TacZeroExtend _TacZeroExtend;
    struct TacDoubleToInt _TacDoubleToInt;
    struct TacDoubleToUInt _TacDoubleToUInt;
    struct TacIntToDouble _TacIntToDouble;
    struct TacUIntToDouble _TacUIntToDouble;
    struct TacFunCall _TacFunCall;
    struct TacUnary _TacUnary;
    struct TacBinary _TacBinary;
    struct TacCopy _TacCopy;
    struct TacGetAddress _TacGetAddress;
    struct TacLoad _TacLoad;
    struct TacStore _TacStore;
    struct TacAddPtr _TacAddPtr;
    struct TacCopyToOffset _TacCopyToOffset;
    struct TacCopyFromOffset _TacCopyFromOffset;
    struct TacJump _TacJump;
    struct TacJumpIfZero _TacJumpIfZero;
    struct TacJumpIfNotZero _TacJumpIfNotZero;
    struct TacLabel _TacLabel;
};

struct TacInstruction {
    unique_ptr_impl(AST_T);
    union _TacInstruction get;
};

unique_ptr_t(TacInstruction) make_TacInstruction(void);
unique_ptr_t(TacInstruction) make_TacReturn(shared_ptr_t(TacValue) * val);
unique_ptr_t(TacInstruction) make_TacSignExtend(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacTruncate(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacZeroExtend(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacDoubleToInt(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacDoubleToUInt(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacIntToDouble(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacUIntToDouble(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction)
    make_TacFunCall(TIdentifier name, vector_t(shared_ptr_t(TacValue)) * args, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction)
    make_TacUnary(struct TacUnaryOp* unop, shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacBinary(struct TacBinaryOp* binop, shared_ptr_t(TacValue) * src1,
    shared_ptr_t(TacValue) * src2, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacCopy(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacGetAddress(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacLoad(shared_ptr_t(TacValue) * src_ptr, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacStore(shared_ptr_t(TacValue) * src, shared_ptr_t(TacValue) * dst_ptr);
unique_ptr_t(TacInstruction) make_TacAddPtr(
    TLong scale, shared_ptr_t(TacValue) * src_ptr, shared_ptr_t(TacValue) * idx, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacCopyToOffset(TIdentifier dst_name, TLong offset, shared_ptr_t(TacValue) * src);
unique_ptr_t(TacInstruction) make_TacCopyFromOffset(TIdentifier src_name, TLong offset, shared_ptr_t(TacValue) * dst);
unique_ptr_t(TacInstruction) make_TacJump(TIdentifier target);
unique_ptr_t(TacInstruction) make_TacJumpIfZero(TIdentifier target, shared_ptr_t(TacValue) * condition);
unique_ptr_t(TacInstruction) make_TacJumpIfNotZero(TIdentifier target, shared_ptr_t(TacValue) * condition);
unique_ptr_t(TacInstruction) make_TacLabel(TIdentifier name);
void free_TacInstruction(unique_ptr_t(TacInstruction) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// top_level = Function(identifier, bool, identifier*, instruction*)
//           | StaticVariable(identifier, bool, type, static_init*)
//           | StaticConstant(identifier, type, static_init)

struct TacFunction {
    TIdentifier name;
    bool is_glob;
    vector_t(TIdentifier) params;
    vector_t(unique_ptr_t(TacInstruction)) body;
};

struct TacStaticVariable {
    TIdentifier name;
    bool is_glob;
    shared_ptr_t(Type) static_init_type;
    vector_t(shared_ptr_t(StaticInit)) static_inits;
};

struct TacStaticConstant {
    TIdentifier name;
    shared_ptr_t(Type) static_init_type;
    shared_ptr_t(StaticInit) static_init;
};

union _TacTopLevel {
    struct TacFunction _TacFunction;
    struct TacStaticVariable _TacStaticVariable;
    struct TacStaticConstant _TacStaticConstant;
};

struct TacTopLevel {
    unique_ptr_impl(AST_T);
    union _TacTopLevel get;
};

unique_ptr_t(TacTopLevel) make_TacTopLevel(void);
unique_ptr_t(TacTopLevel) make_TacFunction(
    TIdentifier name, bool is_glob, vector_t(TIdentifier) * params, vector_t(unique_ptr_t(TacInstruction)) * body);
unique_ptr_t(TacTopLevel) make_TacStaticVariable(TIdentifier name, bool is_glob, shared_ptr_t(Type) * static_init_type,
    vector_t(shared_ptr_t(StaticInit)) * static_inits);
unique_ptr_t(TacTopLevel) make_TacStaticConstant(
    TIdentifier name, shared_ptr_t(Type) * static_init_type, shared_ptr_t(StaticInit) * static_init);
void free_TacTopLevel(unique_ptr_t(TacTopLevel) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// AST = Program(top_level*, top_level*, top_level*)

struct TacProgram {
    unique_ptr_impl(AST_T);
    vector_t(unique_ptr_t(TacTopLevel)) static_const_toplvls;
    vector_t(unique_ptr_t(TacTopLevel)) static_var_toplvls;
    vector_t(unique_ptr_t(TacTopLevel)) fun_toplvls;
};

unique_ptr_t(TacProgram) make_TacProgram(vector_t(unique_ptr_t(TacTopLevel)) * static_const_toplvls,
    vector_t(unique_ptr_t(TacTopLevel)) * static_var_toplvls, vector_t(unique_ptr_t(TacTopLevel)) * fun_toplvls);
void free_TacProgram(unique_ptr_t(TacProgram) * self);

#endif
