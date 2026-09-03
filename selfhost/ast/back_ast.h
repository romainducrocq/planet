#ifndef _AST_BACK_AST_H
#define _AST_BACK_AST_H

#include "../lib/c_std.h"

#include "../ast/ast.h"
#include "../ast/back_symt.h"
#include "../ast/front_symt.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Backend abstract syntax tree

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct AsmReg;
struct AsmCondCode;
struct AsmOperand;
struct AsmBinaryOp;
struct AsmUnaryOp;
struct AsmInstruction;
struct AsmTopLevel;
struct AsmProgram;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// reg = AX
//     | BX
//     | CX
//     | DX
//     | DI
//     | SI
//     | R8
//     | R9
//     | R10
//     | R11
//     | R12
//     | R13
//     | R14
//     | R15
//     | SP
//     | BP
//     | XMM0
//     | XMM1
//     | XMM2
//     | XMM3
//     | XMM4
//     | XMM5
//     | XMM6
//     | XMM7
//     | XMM8
//     | XMM9
//     | XMM10
//     | XMM11
//     | XMM12
//     | XMM13
//     | XMM14
//     | XMM15

struct AsmReg {
    tagged_def_impl(AST_T);
};

struct AsmReg make_AsmReg(tagged_def_impl(AST_T));
#define init_AsmReg() tagged_def_init(AST, AsmReg, AsmReg)
#define init_AsmAx() tagged_def_init(AST, AsmReg, AsmAx)
#define init_AsmBx() tagged_def_init(AST, AsmReg, AsmBx)
#define init_AsmCx() tagged_def_init(AST, AsmReg, AsmCx)
#define init_AsmDx() tagged_def_init(AST, AsmReg, AsmDx)
#define init_AsmDi() tagged_def_init(AST, AsmReg, AsmDi)
#define init_AsmSi() tagged_def_init(AST, AsmReg, AsmSi)
#define init_AsmR8() tagged_def_init(AST, AsmReg, AsmR8)
#define init_AsmR9() tagged_def_init(AST, AsmReg, AsmR9)
#define init_AsmR10() tagged_def_init(AST, AsmReg, AsmR10)
#define init_AsmR11() tagged_def_init(AST, AsmReg, AsmR11)
#define init_AsmR12() tagged_def_init(AST, AsmReg, AsmR12)
#define init_AsmR13() tagged_def_init(AST, AsmReg, AsmR13)
#define init_AsmR14() tagged_def_init(AST, AsmReg, AsmR14)
#define init_AsmR15() tagged_def_init(AST, AsmReg, AsmR15)
#define init_AsmSp() tagged_def_init(AST, AsmReg, AsmSp)
#define init_AsmBp() tagged_def_init(AST, AsmReg, AsmBp)
#define init_AsmXMM0() tagged_def_init(AST, AsmReg, AsmXMM0)
#define init_AsmXMM1() tagged_def_init(AST, AsmReg, AsmXMM1)
#define init_AsmXMM2() tagged_def_init(AST, AsmReg, AsmXMM2)
#define init_AsmXMM3() tagged_def_init(AST, AsmReg, AsmXMM3)
#define init_AsmXMM4() tagged_def_init(AST, AsmReg, AsmXMM4)
#define init_AsmXMM5() tagged_def_init(AST, AsmReg, AsmXMM5)
#define init_AsmXMM6() tagged_def_init(AST, AsmReg, AsmXMM6)
#define init_AsmXMM7() tagged_def_init(AST, AsmReg, AsmXMM7)
#define init_AsmXMM8() tagged_def_init(AST, AsmReg, AsmXMM8)
#define init_AsmXMM9() tagged_def_init(AST, AsmReg, AsmXMM9)
#define init_AsmXMM10() tagged_def_init(AST, AsmReg, AsmXMM10)
#define init_AsmXMM11() tagged_def_init(AST, AsmReg, AsmXMM11)
#define init_AsmXMM12() tagged_def_init(AST, AsmReg, AsmXMM12)
#define init_AsmXMM13() tagged_def_init(AST, AsmReg, AsmXMM13)
#define init_AsmXMM14() tagged_def_init(AST, AsmReg, AsmXMM14)
#define init_AsmXMM15() tagged_def_init(AST, AsmReg, AsmXMM15)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// cond_code = E
//           | NE
//           | G
//           | GE
//           | L
//           | LE
//           | A
//           | AE
//           | B
//           | BE
//           | P

struct AsmCondCode {
    tagged_def_impl(AST_T);
};

struct AsmCondCode make_AsmCondCode(tagged_def_impl(AST_T));
#define init_AsmCondCode() tagged_def_init(AST, AsmCondCode, AsmCondCode)
#define init_AsmE() tagged_def_init(AST, AsmCondCode, AsmE)
#define init_AsmNE() tagged_def_init(AST, AsmCondCode, AsmNE)
#define init_AsmG() tagged_def_init(AST, AsmCondCode, AsmG)
#define init_AsmGE() tagged_def_init(AST, AsmCondCode, AsmGE)
#define init_AsmL() tagged_def_init(AST, AsmCondCode, AsmL)
#define init_AsmLE() tagged_def_init(AST, AsmCondCode, AsmLE)
#define init_AsmA() tagged_def_init(AST, AsmCondCode, AsmA)
#define init_AsmAE() tagged_def_init(AST, AsmCondCode, AsmAE)
#define init_AsmB() tagged_def_init(AST, AsmCondCode, AsmB)
#define init_AsmBE() tagged_def_init(AST, AsmCondCode, AsmBE)
#define init_AsmP() tagged_def_init(AST, AsmCondCode, AsmP)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// operand = Imm(int, bool, bool, bool)
//         | Reg(reg)
//         | Pseudo(identifier)
//         | Memory(int, reg)
//         | Data(identifier, int)
//         | PseudoMem(identifier, int)
//         | Indexed(int, reg, reg)

struct AsmImm {
    TULong value;
    bool is_byte;
    bool is_quad;
    bool is_neg;
};

struct AsmRegister {
    struct AsmReg reg;
};

struct AsmPseudo {
    TIdentifier name;
};

struct AsmMemory {
    TLong value;
    struct AsmReg reg;
};

struct AsmData {
    TIdentifier name;
    TLong offset;
};

struct AsmPseudoMem {
    TIdentifier name;
    TLong offset;
};

struct AsmIndexed {
    TLong scale;
    struct AsmReg reg_base;
    struct AsmReg reg_index;
};

union _AsmOperand {
    struct AsmImm _AsmImm;
    struct AsmRegister _AsmRegister;
    struct AsmPseudo _AsmPseudo;
    struct AsmMemory _AsmMemory;
    struct AsmData _AsmData;
    struct AsmPseudoMem _AsmPseudoMem;
    struct AsmIndexed _AsmIndexed;
};

struct AsmOperand {
    shared_ptr_impl(AST_T);
    union _AsmOperand get;
};

shared_ptr_t(AsmOperand) make_AsmOperand(void);
shared_ptr_t(AsmOperand) make_AsmImm(TULong value, bool is_byte, bool is_quad, bool is_neg);
shared_ptr_t(AsmOperand) make_AsmRegister(struct AsmReg* reg);
shared_ptr_t(AsmOperand) make_AsmPseudo(TIdentifier name);
shared_ptr_t(AsmOperand) make_AsmMemory(TLong value, struct AsmReg* reg);
shared_ptr_t(AsmOperand) make_AsmData(TIdentifier name, TLong offset);
shared_ptr_t(AsmOperand) make_AsmPseudoMem(TIdentifier name, TLong offset);
shared_ptr_t(AsmOperand) make_AsmIndexed(TLong scale, struct AsmReg* reg_base, struct AsmReg* reg_index);
void free_AsmOperand(shared_ptr_t(AsmOperand) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// binary_operator = Add
//                 | Sub
//                 | Mult
//                 | DivDouble
//                 | BitAnd
//                 | BitOr
//                 | BitXor
//                 | BitShiftLeft
//                 | BitShiftRight
//                 | BitShrArithmetic

struct AsmBinaryOp {
    tagged_def_impl(AST_T);
};

struct AsmBinaryOp make_AsmBinaryOp(tagged_def_impl(AST_T));
#define init_AsmBinaryOp() tagged_def_init(AST, AsmBinaryOp, AsmBinaryOp)
#define init_AsmAdd() tagged_def_init(AST, AsmBinaryOp, AsmAdd)
#define init_AsmSub() tagged_def_init(AST, AsmBinaryOp, AsmSub)
#define init_AsmMult() tagged_def_init(AST, AsmBinaryOp, AsmMult)
#define init_AsmDivDouble() tagged_def_init(AST, AsmBinaryOp, AsmDivDouble)
#define init_AsmBitAnd() tagged_def_init(AST, AsmBinaryOp, AsmBitAnd)
#define init_AsmBitOr() tagged_def_init(AST, AsmBinaryOp, AsmBitOr)
#define init_AsmBitXor() tagged_def_init(AST, AsmBinaryOp, AsmBitXor)
#define init_AsmBitShiftLeft() tagged_def_init(AST, AsmBinaryOp, AsmBitShiftLeft)
#define init_AsmBitShiftRight() tagged_def_init(AST, AsmBinaryOp, AsmBitShiftRight)
#define init_AsmBitShrArithmetic() tagged_def_init(AST, AsmBinaryOp, AsmBitShrArithmetic)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// unary_operator = Not
//                | Neg
//                | Shr

struct AsmUnaryOp {
    tagged_def_impl(AST_T);
};

struct AsmUnaryOp make_AsmUnaryOp(tagged_def_impl(AST_T));
#define init_AsmUnaryOp() tagged_def_init(AST, AsmUnaryOp, AsmUnaryOp)
#define init_AsmNot() tagged_def_init(AST, AsmUnaryOp, AsmNot)
#define init_AsmNeg() tagged_def_init(AST, AsmUnaryOp, AsmNeg)
#define init_AsmShr() tagged_def_init(AST, AsmUnaryOp, AsmShr)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// instruction = Mov(assembly_type, operand, operand)
//             | MovSx(assembly_type, assembly_type, operand, operand)
//             | MovZeroExtend(assembly_type, assembly_type, operand, operand)
//             | Lea(operand, operand)
//             | Cvttsd2si(assembly_type, operand, operand)
//             | Cvtsi2sd(assembly_type, operand, operand)
//             | Unary(unary_operator, assembly_type, operand)
//             | Binary(binary_operator, assembly_type, operand, operand)
//             | Cmp(assembly_type, operand, operand)
//             | Idiv(assembly_type, operand)
//             | Div(assembly_type, operand)
//             | Cdq(assembly_type)
//             | Jmp(identifier)
//             | JmpCC(cond_code, identifier)
//             | SetCC(cond_code, operand)
//             | Label(identifier)
//             | Push(operand)
//             | Pop(reg)
//             | Call(identifier)
//             | Ret

struct AsmMov {
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmMovSx {
    shared_ptr_t(AssemblyType) asm_type_src;
    shared_ptr_t(AssemblyType) asm_type_dst;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmMovZeroExtend {
    shared_ptr_t(AssemblyType) asm_type_src;
    shared_ptr_t(AssemblyType) asm_type_dst;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmLea {
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmCvttsd2si {
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmCvtsi2sd {
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmUnary {
    struct AsmUnaryOp unop;
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmBinary {
    struct AsmBinaryOp binop;
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmCmp {
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmIdiv {
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
};

struct AsmDiv {
    shared_ptr_t(AssemblyType) asm_type;
    shared_ptr_t(AsmOperand) src;
};

struct AsmCdq {
    shared_ptr_t(AssemblyType) asm_type;
};

struct AsmJmp {
    TIdentifier target;
};

struct AsmJmpCC {
    TIdentifier target;
    struct AsmCondCode cond_code;
};

struct AsmSetCC {
    struct AsmCondCode cond_code;
    shared_ptr_t(AsmOperand) dst;
};

struct AsmLabel {
    TIdentifier name;
};

struct AsmPush {
    shared_ptr_t(AsmOperand) src;
};

struct AsmPop {
    struct AsmReg reg;
};

struct AsmCall {
    TIdentifier name;
};

struct AsmRet {
    char _empty;
};

union _AsmInstruction {
    struct AsmMov _AsmMov;
    struct AsmMovSx _AsmMovSx;
    struct AsmMovZeroExtend _AsmMovZeroExtend;
    struct AsmLea _AsmLea;
    struct AsmCvttsd2si _AsmCvttsd2si;
    struct AsmCvtsi2sd _AsmCvtsi2sd;
    struct AsmUnary _AsmUnary;
    struct AsmBinary _AsmBinary;
    struct AsmCmp _AsmCmp;
    struct AsmIdiv _AsmIdiv;
    struct AsmDiv _AsmDiv;
    struct AsmCdq _AsmCdq;
    struct AsmJmp _AsmJmp;
    struct AsmJmpCC _AsmJmpCC;
    struct AsmSetCC _AsmSetCC;
    struct AsmLabel _AsmLabel;
    struct AsmPush _AsmPush;
    struct AsmPop _AsmPop;
    struct AsmCall _AsmCall;
    struct AsmRet _AsmRet;
};

struct AsmInstruction {
    unique_ptr_impl(AST_T);
    union _AsmInstruction get;
};

unique_ptr_t(AsmInstruction) make_AsmInstruction(void);
unique_ptr_t(AsmInstruction)
    make_AsmMov(shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmMovSx(shared_ptr_t(AssemblyType) * asm_type_src,
    shared_ptr_t(AssemblyType) * asm_type_dst, shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmMovZeroExtend(shared_ptr_t(AssemblyType) * asm_type_src,
    shared_ptr_t(AssemblyType) * asm_type_dst, shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmLea(shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmCvttsd2si(
    shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmCvtsi2sd(
    shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction)
    make_AsmUnary(struct AsmUnaryOp* unop, shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmBinary(struct AsmBinaryOp* binop, shared_ptr_t(AssemblyType) * asm_type,
    shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction)
    make_AsmCmp(shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * src, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmIdiv(shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * src);
unique_ptr_t(AsmInstruction) make_AsmDiv(shared_ptr_t(AssemblyType) * asm_type, shared_ptr_t(AsmOperand) * src);
unique_ptr_t(AsmInstruction) make_AsmCdq(shared_ptr_t(AssemblyType) * asm_type);
unique_ptr_t(AsmInstruction) make_AsmJmp(TIdentifier target);
unique_ptr_t(AsmInstruction) make_AsmJmpCC(TIdentifier target, struct AsmCondCode* cond_code);
unique_ptr_t(AsmInstruction) make_AsmSetCC(struct AsmCondCode* cond_code, shared_ptr_t(AsmOperand) * dst);
unique_ptr_t(AsmInstruction) make_AsmLabel(TIdentifier name);
unique_ptr_t(AsmInstruction) make_AsmPush(shared_ptr_t(AsmOperand) * src);
unique_ptr_t(AsmInstruction) make_AsmPop(struct AsmReg* reg);
unique_ptr_t(AsmInstruction) make_AsmCall(TIdentifier name);
unique_ptr_t(AsmInstruction) make_AsmRet(void);
void free_AsmInstruction(unique_ptr_t(AsmInstruction) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// top_level = Function(identifier, bool, bool, instruction*)
//           | StaticVariable(identifier, bool, int, static_init*)
//           | StaticConstant(identifier, int, static_init)

struct AsmFunction {
    TIdentifier name;
    bool is_glob;
    bool is_ret_memory;
    vector_t(unique_ptr_t(AsmInstruction)) instructions;
};

struct AsmStaticVariable {
    TIdentifier name;
    TInt alignment;
    bool is_glob;
    vector_t(shared_ptr_t(StaticInit)) static_inits;
};

struct AsmStaticConstant {
    TIdentifier name;
    TInt alignment;
    shared_ptr_t(StaticInit) static_init;
};

union _AsmTopLevel {
    struct AsmFunction _AsmFunction;
    struct AsmStaticVariable _AsmStaticVariable;
    struct AsmStaticConstant _AsmStaticConstant;
};

struct AsmTopLevel {
    unique_ptr_impl(AST_T);
    union _AsmTopLevel get;
};

unique_ptr_t(AsmTopLevel) make_AsmTopLevel(void);
unique_ptr_t(AsmTopLevel) make_AsmFunction(
    TIdentifier name, bool is_glob, bool is_ret_memory, vector_t(unique_ptr_t(AsmInstruction)) * instructions);
unique_ptr_t(AsmTopLevel) make_AsmStaticVariable(
    TIdentifier name, TInt alignment, bool is_glob, vector_t(shared_ptr_t(StaticInit)) * static_inits);
unique_ptr_t(AsmTopLevel)
    make_AsmStaticConstant(TIdentifier name, TInt alignment, shared_ptr_t(StaticInit) * static_init);
void free_AsmTopLevel(unique_ptr_t(AsmTopLevel) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// AST = Program(top_level*, top_level*)

struct AsmProgram {
    unique_ptr_impl(AST_T);
    vector_t(unique_ptr_t(AsmTopLevel)) static_const_toplvls;
    vector_t(unique_ptr_t(AsmTopLevel)) top_levels;
};

unique_ptr_t(AsmProgram) make_AsmProgram(
    vector_t(unique_ptr_t(AsmTopLevel)) * static_const_toplvls, vector_t(unique_ptr_t(AsmTopLevel)) * top_levels);
void free_AsmProgram(unique_ptr_t(AsmProgram) * self);

#endif
