#ifndef _AST_FRONT_AST_H
#define _AST_FRONT_AST_H

#include "../lib/c_std.h"

#include "../ast/ast.h"
#include "../ast/front_symt.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Frontend abstract syntax tree

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

struct CUnaryOp;
struct CBinaryOp;
struct CAbstractDeclarator;
struct CParam;
struct CDeclarator;
struct CExp;
struct CStatement;
struct CForInit;
struct CBlock;
struct CBlockItem;
struct CStorageClass;
struct CInitializer;
struct CMemberDeclaration;
struct CStructDeclaration;
struct CFunctionDeclaration;
struct CVariableDeclaration;
struct CDeclaration;
struct CProgram;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// unary_operator = Complement
//                | Negate
//                | Not
//                | Prefix
//                | Postfix

struct CUnaryOp {
    tagged_def_impl(AST_T);
};

struct CUnaryOp make_CUnaryOp(tagged_def_impl(AST_T));
#define init_CUnaryOp() tagged_def_init(AST, CUnaryOp, CUnaryOp)
#define init_CComplement() tagged_def_init(AST, CUnaryOp, CComplement)
#define init_CNegate() tagged_def_init(AST, CUnaryOp, CNegate)
#define init_CNot() tagged_def_init(AST, CUnaryOp, CNot)
#define init_CPrefix() tagged_def_init(AST, CUnaryOp, CPrefix)
#define init_CPostfix() tagged_def_init(AST, CUnaryOp, CPostfix)

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
//                 | And
//                 | Or
//                 | Equal
//                 | NotEqual
//                 | LessThan
//                 | LessOrEqual
//                 | GreaterThan
//                 | GreaterOrEqual

struct CBinaryOp {
    tagged_def_impl(AST_T);
};

struct CBinaryOp make_CBinaryOp(tagged_def_impl(AST_T));
#define init_CBinaryOp() tagged_def_init(AST, CBinaryOp, CBinaryOp)
#define init_CAdd() tagged_def_init(AST, CBinaryOp, CAdd)
#define init_CSubtract() tagged_def_init(AST, CBinaryOp, CSubtract)
#define init_CMultiply() tagged_def_init(AST, CBinaryOp, CMultiply)
#define init_CDivide() tagged_def_init(AST, CBinaryOp, CDivide)
#define init_CRemainder() tagged_def_init(AST, CBinaryOp, CRemainder)
#define init_CBitAnd() tagged_def_init(AST, CBinaryOp, CBitAnd)
#define init_CBitOr() tagged_def_init(AST, CBinaryOp, CBitOr)
#define init_CBitXor() tagged_def_init(AST, CBinaryOp, CBitXor)
#define init_CBitShiftLeft() tagged_def_init(AST, CBinaryOp, CBitShiftLeft)
#define init_CBitShiftRight() tagged_def_init(AST, CBinaryOp, CBitShiftRight)
#define init_CBitShrArithmetic() tagged_def_init(AST, CBinaryOp, CBitShrArithmetic)
#define init_CAnd() tagged_def_init(AST, CBinaryOp, CAnd)
#define init_COr() tagged_def_init(AST, CBinaryOp, COr)
#define init_CEqual() tagged_def_init(AST, CBinaryOp, CEqual)
#define init_CNotEqual() tagged_def_init(AST, CBinaryOp, CNotEqual)
#define init_CLessThan() tagged_def_init(AST, CBinaryOp, CLessThan)
#define init_CLessOrEqual() tagged_def_init(AST, CBinaryOp, CLessOrEqual)
#define init_CGreaterThan() tagged_def_init(AST, CBinaryOp, CGreaterThan)
#define init_CGreaterOrEqual() tagged_def_init(AST, CBinaryOp, CGreaterOrEqual)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// abstract_declarator = AbstractPointer(abstract_declarator)
//                     | AbstractArray(int, abstract_declarator)
//                     | AbstractBase

struct CAbstractPointer {
    unique_ptr_t(CAbstractDeclarator) abstract_decltor;
};

struct CAbstractArray {
    TLong size;
    unique_ptr_t(CAbstractDeclarator) abstract_decltor;
};

struct CAbstractBase {
    char _empty;
};

union _CAbstractDeclarator {
    struct CAbstractPointer _CAbstractPointer;
    struct CAbstractArray _CAbstractArray;
    struct CAbstractBase _CAbstractBase;
};

struct CAbstractDeclarator {
    unique_ptr_impl(AST_T);
    union _CAbstractDeclarator get;
};

unique_ptr_t(CAbstractDeclarator) make_CAbstractDeclarator(void);
unique_ptr_t(CAbstractDeclarator) make_CAbstractPointer(unique_ptr_t(CAbstractDeclarator) * abstract_decltor);
unique_ptr_t(CAbstractDeclarator) make_CAbstractArray(TLong size, unique_ptr_t(CAbstractDeclarator) * abstract_decltor);
unique_ptr_t(CAbstractDeclarator) make_CAbstractBase(void);
void free_CAbstractDeclarator(unique_ptr_t(CAbstractDeclarator) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// param_info = Param(type, declarator)

struct CParam {
    unique_ptr_impl(AST_T);
    unique_ptr_t(CDeclarator) decltor;
    shared_ptr_t(Type) param_type;
};

unique_ptr_t(CParam) make_CParam(unique_ptr_t(CDeclarator) * decltor, shared_ptr_t(Type) * param_type);
void free_CParam(unique_ptr_t(CParam) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// declarator = Ident(identifier)
//            | PointerDeclarator(declarator)
//            | ArrayDeclarator(int, declarator)
//            | FunDeclarator(param_info*, declarator)

struct CIdent {
    TIdentifier name;
};

struct CPointerDeclarator {
    unique_ptr_t(CDeclarator) decltor;
};

struct CArrayDeclarator {
    TLong size;
    unique_ptr_t(CDeclarator) decltor;
};

struct CFunDeclarator {
    vector_t(unique_ptr_t(CParam)) param_list;
    unique_ptr_t(CDeclarator) decltor;
};

union _CDeclarator {
    struct CIdent _CIdent;
    struct CPointerDeclarator _CPointerDeclarator;
    struct CArrayDeclarator _CArrayDeclarator;
    struct CFunDeclarator _CFunDeclarator;
};

struct CDeclarator {
    unique_ptr_impl(AST_T);
    union _CDeclarator get;
};

unique_ptr_t(CDeclarator) make_CDeclarator(void);
unique_ptr_t(CDeclarator) make_CIdent(TIdentifier name);
unique_ptr_t(CDeclarator) make_CPointerDeclarator(unique_ptr_t(CDeclarator) * decltor);
unique_ptr_t(CDeclarator) make_CArrayDeclarator(TLong size, unique_ptr_t(CDeclarator) * decltor);
unique_ptr_t(CDeclarator)
    make_CFunDeclarator(vector_t(unique_ptr_t(CParam)) * param_list, unique_ptr_t(CDeclarator) * decltor);
void free_CDeclarator(unique_ptr_t(CDeclarator) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// exp = Constant(const, type)
//     | String(string, type)
//     | Var(identifier, type)
//     | Cast(type, exp, type)
//     | Unary(unary_operator, exp, type)
//     | Binary(binary_operator, exp, exp, type)
//     | Assignment(unary_operator, exp, exp, type)
//     | Conditional(exp, exp, exp, type)
//     | FunctionCall(identifier, exp*, type)
//     | Dereference(exp, type)
//     | AddrOf(exp, type)
//     | Subscript(exp, exp, type)
//     | SizeOf(exp, type)
//     | SizeOfT(type, type)
//     | Dot(exp, identifier, type)
//     | Arrow(exp, identifier, type)

struct CConstant {
    shared_ptr_t(CConst) constant;
    struct CExp* _base;
};

struct CString {
    shared_ptr_t(CStringLiteral) literal;
    struct CExp* _base;
};

struct CVar {
    TIdentifier name;
    struct CExp* _base;
};

struct CCast {
    unique_ptr_t(CExp) exp;
    shared_ptr_t(Type) target_type;
    struct CExp* _base;
};

struct CUnary {
    struct CUnaryOp unop;
    unique_ptr_t(CExp) exp;
    struct CExp* _base;
};

struct CBinary {
    struct CBinaryOp binop;
    unique_ptr_t(CExp) exp_left;
    unique_ptr_t(CExp) exp_right;
    struct CExp* _base;
};

struct CAssignment {
    struct CUnaryOp unop;
    unique_ptr_t(CExp) exp_left;
    unique_ptr_t(CExp) exp_right;
    struct CExp* _base;
};

struct CConditional {
    unique_ptr_t(CExp) condition;
    unique_ptr_t(CExp) exp_middle;
    unique_ptr_t(CExp) exp_right;
    struct CExp* _base;
};

struct CFunctionCall {
    TIdentifier name;
    vector_t(unique_ptr_t(CExp)) args;
    struct CExp* _base;
};

struct CDereference {
    unique_ptr_t(CExp) exp;
    struct CExp* _base;
};

struct CAddrOf {
    unique_ptr_t(CExp) exp;
    struct CExp* _base;
};

struct CSubscript {
    unique_ptr_t(CExp) primary_exp;
    unique_ptr_t(CExp) subscript_exp;
    struct CExp* _base;
};

struct CSizeOf {
    unique_ptr_t(CExp) exp;
    struct CExp* _base;
};

struct CSizeOfT {
    shared_ptr_t(Type) target_type;
    struct CExp* _base;
};

struct CDot {
    TIdentifier member;
    unique_ptr_t(CExp) structure;
    struct CExp* _base;
};

struct CArrow {
    TIdentifier member;
    unique_ptr_t(CExp) pointer;
    struct CExp* _base;
};

union _CExp {
    struct CConstant _CConstant;
    struct CString _CString;
    struct CVar _CVar;
    struct CCast _CCast;
    struct CUnary _CUnary;
    struct CBinary _CBinary;
    struct CAssignment _CAssignment;
    struct CConditional _CConditional;
    struct CFunctionCall _CFunctionCall;
    struct CDereference _CDereference;
    struct CAddrOf _CAddrOf;
    struct CSubscript _CSubscript;
    struct CSizeOf _CSizeOf;
    struct CSizeOfT _CSizeOfT;
    struct CDot _CDot;
    struct CArrow _CArrow;
};

struct CExp {
    unique_ptr_impl(AST_T);
    shared_ptr_t(Type) exp_type;
    unsigned long info_at;
    union _CExp get;
};

unique_ptr_t(CExp) make_CExp(unsigned long info_at);
unique_ptr_t(CExp) make_CConstant(shared_ptr_t(CConst) * constant, unsigned long info_at);
unique_ptr_t(CExp) make_CString(shared_ptr_t(CStringLiteral) * literal, unsigned long info_at);
unique_ptr_t(CExp) make_CVar(TIdentifier name, unsigned long info_at);
unique_ptr_t(CExp) make_CCast(unique_ptr_t(CExp) * exp, shared_ptr_t(Type) * target_type, unsigned long info_at);
unique_ptr_t(CExp) make_CUnary(struct CUnaryOp* unop, unique_ptr_t(CExp) * exp, unsigned long info_at);
unique_ptr_t(CExp) make_CBinary(
    struct CBinaryOp* binop, unique_ptr_t(CExp) * exp_left, unique_ptr_t(CExp) * exp_right, unsigned long info_at);
unique_ptr_t(CExp) make_CAssignment(
    struct CUnaryOp* unop, unique_ptr_t(CExp) * exp_left, unique_ptr_t(CExp) * exp_right, unsigned long info_at);
unique_ptr_t(CExp) make_CConditional(unique_ptr_t(CExp) * condition, unique_ptr_t(CExp) * exp_middle,
    unique_ptr_t(CExp) * exp_right, unsigned long info_at);
unique_ptr_t(CExp) make_CFunctionCall(TIdentifier name, vector_t(unique_ptr_t(CExp)) * args, unsigned long info_at);
unique_ptr_t(CExp) make_CDereference(unique_ptr_t(CExp) * exp, unsigned long info_at);
unique_ptr_t(CExp) make_CAddrOf(unique_ptr_t(CExp) * exp, unsigned long info_at);
unique_ptr_t(CExp)
    make_CSubscript(unique_ptr_t(CExp) * primary_exp, unique_ptr_t(CExp) * subscript_exp, unsigned long info_at);
unique_ptr_t(CExp) make_CSizeOf(unique_ptr_t(CExp) * exp, unsigned long info_at);
unique_ptr_t(CExp) make_CSizeOfT(shared_ptr_t(Type) * target_type, unsigned long info_at);
unique_ptr_t(CExp) make_CDot(TIdentifier member, unique_ptr_t(CExp) * structure, unsigned long info_at);
unique_ptr_t(CExp) make_CArrow(TIdentifier member, unique_ptr_t(CExp) * pointer, unsigned long info_at);
void free_CExp(unique_ptr_t(CExp) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// statement = Return(exp?)
//           | Expression(exp)
//           | If(exp, statement, statement?)
//           | Goto(identifier)
//           | Label(identifier, target)
//           | Compound(block)
//           | While(exp, statement, identifier)
//           | DoWhile(statement, exp, identifier)
//           | For(for_init, exp?, exp?, statement, identifier)
//           | Switch(identifier, bool, exp, statement, exp*)
//           | Case(identifier, exp, statement)
//           | Default(identifier, statement)
//           | Break(identifier)
//           | Continue(identifier)
//           | Null

struct CReturn {
    unique_ptr_t(CExp) exp;
    unsigned long info_at;
};

struct CExpression {
    unique_ptr_t(CExp) exp;
};

struct CIf {
    unique_ptr_t(CExp) condition;
    unique_ptr_t(CStatement) then;
    unique_ptr_t(CStatement) else_fi;
};

struct CGoto {
    TIdentifier target;
    unsigned long info_at;
};

struct CLabel {
    TIdentifier target;
    unique_ptr_t(CStatement) jump_to;
    unsigned long info_at;
};

struct CCompound {
    unique_ptr_t(CBlock) block;
};

struct CWhile {
    TIdentifier target;
    unique_ptr_t(CExp) condition;
    unique_ptr_t(CStatement) body;
};

struct CDoWhile {
    TIdentifier target;
    unique_ptr_t(CExp) condition;
    unique_ptr_t(CStatement) body;
};

struct CFor {
    TIdentifier target;
    unique_ptr_t(CForInit) init;
    unique_ptr_t(CExp) condition;
    unique_ptr_t(CExp) post;
    unique_ptr_t(CStatement) body;
};

struct CSwitch {
    TIdentifier target;
    bool is_default;
    unique_ptr_t(CExp) match;
    unique_ptr_t(CStatement) body;
    vector_t(unique_ptr_t(CExp)) cases;
};

struct CCase {
    TIdentifier target;
    unique_ptr_t(CExp) value;
    unique_ptr_t(CStatement) jump_to;
};

struct CDefault {
    TIdentifier target;
    unique_ptr_t(CStatement) jump_to;
    unsigned long info_at;
};

struct CBreak {
    TIdentifier target;
    unsigned long info_at;
};

struct CContinue {
    TIdentifier target;
    unsigned long info_at;
};

struct CNull {
    char _empty;
};

union _CStatement {
    struct CReturn _CReturn;
    struct CExpression _CExpression;
    struct CIf _CIf;
    struct CGoto _CGoto;
    struct CLabel _CLabel;
    struct CCompound _CCompound;
    struct CWhile _CWhile;
    struct CDoWhile _CDoWhile;
    struct CFor _CFor;
    struct CSwitch _CSwitch;
    struct CCase _CCase;
    struct CDefault _CDefault;
    struct CBreak _CBreak;
    struct CContinue _CContinue;
    struct CNull _CNull;
};

struct CStatement {
    unique_ptr_impl(AST_T);
    union _CStatement get;
};

unique_ptr_t(CStatement) make_CStatement(void);
unique_ptr_t(CStatement) make_CReturn(unique_ptr_t(CExp) * exp, unsigned long info_at);
unique_ptr_t(CStatement) make_CExpression(unique_ptr_t(CExp) * exp);
unique_ptr_t(CStatement)
    make_CIf(unique_ptr_t(CExp) * condition, unique_ptr_t(CStatement) * then, unique_ptr_t(CStatement) * else_fi);
unique_ptr_t(CStatement) make_CGoto(TIdentifier target, unsigned long info_at);
unique_ptr_t(CStatement) make_CLabel(TIdentifier target, unique_ptr_t(CStatement) * jump_to, unsigned long info_at);
unique_ptr_t(CStatement) make_CCompound(unique_ptr_t(CBlock) * block);
unique_ptr_t(CStatement) make_CWhile(unique_ptr_t(CExp) * condition, unique_ptr_t(CStatement) * body);
unique_ptr_t(CStatement) make_CDoWhile(unique_ptr_t(CExp) * condition, unique_ptr_t(CStatement) * body);
unique_ptr_t(CStatement) make_CFor(unique_ptr_t(CForInit) * init, unique_ptr_t(CExp) * condition,
    unique_ptr_t(CExp) * post, unique_ptr_t(CStatement) * body);
unique_ptr_t(CStatement) make_CSwitch(unique_ptr_t(CExp) * match, unique_ptr_t(CStatement) * body);
unique_ptr_t(CStatement) make_CCase(unique_ptr_t(CExp) * value, unique_ptr_t(CStatement) * jump_to);
unique_ptr_t(CStatement) make_CDefault(unique_ptr_t(CStatement) * jump_to, unsigned long info_at);
unique_ptr_t(CStatement) make_CBreak(unsigned long info_at);
unique_ptr_t(CStatement) make_CContinue(unsigned long info_at);
unique_ptr_t(CStatement) make_CNull(void);
void free_CStatement(unique_ptr_t(CStatement) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// for_init = InitDecl(variable_declaration)
//          | InitExp(exp?)

struct CInitDecl {
    unique_ptr_t(CVariableDeclaration) init;
};

struct CInitExp {
    unique_ptr_t(CExp) init;
};

union _CForInit {
    struct CInitDecl _CInitDecl;
    struct CInitExp _CInitExp;
};

struct CForInit {
    unique_ptr_impl(AST_T);
    union _CForInit get;
};

unique_ptr_t(CForInit) make_CForInit(void);
unique_ptr_t(CForInit) make_CInitDecl(unique_ptr_t(CVariableDeclaration) * init);
unique_ptr_t(CForInit) make_CInitExp(unique_ptr_t(CExp) * init);
void free_CForInit(unique_ptr_t(CForInit) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// block = B(block_item*)

struct CB {
    vector_t(unique_ptr_t(CBlockItem)) block_items;
};

union _CBlock {
    struct CB _CB;
};

struct CBlock {
    unique_ptr_impl(AST_T);
    union _CBlock get;
};

unique_ptr_t(CBlock) make_CBlock(void);
unique_ptr_t(CBlock) make_CB(vector_t(unique_ptr_t(CBlockItem)) * block_items);
void free_CBlock(unique_ptr_t(CBlock) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// block_item = S(statement)
//            | D(declaration)

struct CS {
    unique_ptr_t(CStatement) statement;
};

struct CD {
    unique_ptr_t(CDeclaration) declaration;
};

union _CBlockItem {
    struct CS _CS;
    struct CD _CD;
};

struct CBlockItem {
    unique_ptr_impl(AST_T);
    union _CBlockItem get;
};

unique_ptr_t(CBlockItem) make_CBlockItem(void);
unique_ptr_t(CBlockItem) make_CS(unique_ptr_t(CStatement) * statement);
unique_ptr_t(CBlockItem) make_CD(unique_ptr_t(CDeclaration) * declaration);
void free_CBlockItem(unique_ptr_t(CBlockItem) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// storage_class = Static
//               | Extern

struct CStorageClass {
    tagged_def_impl(AST_T);
};

struct CStorageClass make_CStorageClass(tagged_def_impl(AST_T));
#define init_CStorageClass() tagged_def_init(AST, CStorageClass, CStorageClass)
#define init_CStatic() tagged_def_init(AST, CStorageClass, CStatic)
#define init_CExtern() tagged_def_init(AST, CStorageClass, CExtern)

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// initializer = SingleInit(exp)
//             | CompoundInit(initializer*)

struct CSingleInit {
    unique_ptr_t(CExp) exp;
    struct CInitializer* _base;
};

struct CCompoundInit {
    vector_t(unique_ptr_t(CInitializer)) initializers;
    struct CInitializer* _base;
};

union _CInitializer {
    struct CSingleInit _CSingleInit;
    struct CCompoundInit _CCompoundInit;
};

struct CInitializer {
    unique_ptr_impl(AST_T);
    shared_ptr_t(Type) init_type;
    union _CInitializer get;
};

unique_ptr_t(CInitializer) make_CInitializer(void);
unique_ptr_t(CInitializer) make_CSingleInit(unique_ptr_t(CExp) * exp);
unique_ptr_t(CInitializer) make_CCompoundInit(vector_t(unique_ptr_t(CInitializer)) * initializers);
void free_CInitializer(unique_ptr_t(CInitializer) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// member_declaration = MemberDeclaration(identifier, type)

struct CMemberDeclaration {
    unique_ptr_impl(AST_T);
    TIdentifier member_name;
    shared_ptr_t(Type) member_type;
    unsigned long info_at;
};

unique_ptr_t(CMemberDeclaration)
    make_CMemberDeclaration(TIdentifier member_name, shared_ptr_t(Type) * member_type, unsigned long info_at);
void free_CMemberDeclaration(unique_ptr_t(CMemberDeclaration) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// struct_declaration = StructDeclaration(identifier, bool, member_declaration*)

struct CStructDeclaration {
    unique_ptr_impl(AST_T);
    TIdentifier tag;
    bool is_union;
    vector_t(unique_ptr_t(CMemberDeclaration)) members;
    unsigned long info_at;
};

unique_ptr_t(CStructDeclaration) make_CStructDeclaration(
    TIdentifier tag, bool is_union, vector_t(unique_ptr_t(CMemberDeclaration)) * members, unsigned long info_at);
void free_CStructDeclaration(unique_ptr_t(CStructDeclaration) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// function_declaration = FunctionDeclaration(identifier, identifier*, block?, type, storage_class?)

struct CFunctionDeclaration {
    unique_ptr_impl(AST_T);
    TIdentifier name;
    vector_t(TIdentifier) params;
    unique_ptr_t(CBlock) body;
    shared_ptr_t(Type) fun_type;
    struct CStorageClass storage_class;
    unsigned long info_at;
};

unique_ptr_t(CFunctionDeclaration)
    make_CFunctionDeclaration(TIdentifier name, vector_t(TIdentifier) * params, unique_ptr_t(CBlock) * body,
        shared_ptr_t(Type) * fun_type, struct CStorageClass* storage_class, unsigned long info_at);
void free_CFunctionDeclaration(unique_ptr_t(CFunctionDeclaration) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// variable_declaration = VariableDeclaration(identifier, initializer?, type, storage_class?)

struct CVariableDeclaration {
    unique_ptr_impl(AST_T);
    TIdentifier name;
    unique_ptr_t(CInitializer) init;
    shared_ptr_t(Type) var_type;
    struct CStorageClass storage_class;
    unsigned long info_at;
};

unique_ptr_t(CVariableDeclaration) make_CVariableDeclaration(TIdentifier name, unique_ptr_t(CInitializer) * init,
    shared_ptr_t(Type) * var_type, struct CStorageClass* storage_class, unsigned long info_at);
void free_CVariableDeclaration(unique_ptr_t(CVariableDeclaration) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// declaration = FunDecl(function_declaration)
//             | VarDecl(variable_declaration)
//             | StructDecl(struct_declaration)

struct CFunDecl {
    unique_ptr_t(CFunctionDeclaration) fun_decl;
};

struct CVarDecl {
    unique_ptr_t(CVariableDeclaration) var_decl;
};

struct CStructDecl {
    unique_ptr_t(CStructDeclaration) struct_decl;
};

union _CDeclaration {
    struct CFunDecl _CFunDecl;
    struct CVarDecl _CVarDecl;
    struct CStructDecl _CStructDecl;
};

struct CDeclaration {
    unique_ptr_impl(AST_T);
    union _CDeclaration get;
};

unique_ptr_t(CDeclaration) make_CDeclaration(void);
unique_ptr_t(CDeclaration) make_CFunDecl(unique_ptr_t(CFunctionDeclaration) * fun_decl);
unique_ptr_t(CDeclaration) make_CVarDecl(unique_ptr_t(CVariableDeclaration) * var_decl);
unique_ptr_t(CDeclaration) make_CStructDecl(unique_ptr_t(CStructDeclaration) * struct_decl);
void free_CDeclaration(unique_ptr_t(CDeclaration) * self);

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// AST = Program(declaration*)

struct CProgram {
    unique_ptr_impl(AST_T);
    vector_t(unique_ptr_t(CDeclaration)) declarations;
};

unique_ptr_t(CProgram) make_CProgram(vector_t(unique_ptr_t(CDeclaration)) * declarations);
void free_CProgram(unique_ptr_t(CProgram) * self);

#endif
