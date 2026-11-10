m4_ifdef(`_AST_FRONT_AST_M4', `', `
m4_define(`_AST_FRONT_AST_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

type struc CUnaryOp;
type struc CBinaryOp;
type struc CAbstractDeclarator;
type struc CParam;
type struc CDeclarator;
type struc CExp;
type struc CStatement;
type struc CForInit;
type struc CBlock;
type struc CBlockItem;
type struc CStorageClass;
type struc CInitializer;
type struc CMemberDeclaration;
type struc CStructDeclaration;
type struc CFunctionDeclaration;
type struc CVariableDeclaration;
type struc CDeclaration;
type struc CProgram;

type struc CUnaryOp(tagged_def_impl(AST_T))
pub fn make_CUnaryOp(tagged_def_impl(AST_T)) struc CUnaryOp;
m4_define(`init_CUnaryOp', `tagged_def_init(AST, CUnaryOp, CUnaryOp)')m4_dnl
m4_define(`init_CComplement', `tagged_def_init(AST, CUnaryOp, CComplement)')m4_dnl
m4_define(`init_CNegate', `tagged_def_init(AST, CUnaryOp, CNegate)')m4_dnl
m4_define(`init_CNot', `tagged_def_init(AST, CUnaryOp, CNot)')m4_dnl
m4_define(`init_CPrefix', `tagged_def_init(AST, CUnaryOp, CPrefix)')m4_dnl
m4_define(`init_CPostfix', `tagged_def_init(AST, CUnaryOp, CPostfix)')m4_dnl

type struc CBinaryOp(tagged_def_impl(AST_T))
pub fn make_CBinaryOp(tagged_def_impl(AST_T)) struc CBinaryOp;
m4_define(`init_CBinaryOp', `tagged_def_init(AST, CBinaryOp, CBinaryOp)')m4_dnl
m4_define(`init_CAdd', `tagged_def_init(AST, CBinaryOp, CAdd)')m4_dnl
m4_define(`init_CSubtract', `tagged_def_init(AST, CBinaryOp, CSubtract)')m4_dnl
m4_define(`init_CMultiply', `tagged_def_init(AST, CBinaryOp, CMultiply)')m4_dnl
m4_define(`init_CDivide', `tagged_def_init(AST, CBinaryOp, CDivide)')m4_dnl
m4_define(`init_CRemainder', `tagged_def_init(AST, CBinaryOp, CRemainder)')m4_dnl
m4_define(`init_CBitAnd', `tagged_def_init(AST, CBinaryOp, CBitAnd)')m4_dnl
m4_define(`init_CBitOr', `tagged_def_init(AST, CBinaryOp, CBitOr)')m4_dnl
m4_define(`init_CBitXor', `tagged_def_init(AST, CBinaryOp, CBitXor)')m4_dnl
m4_define(`init_CBitShiftLeft', `tagged_def_init(AST, CBinaryOp, CBitShiftLeft)')m4_dnl
m4_define(`init_CBitShiftRight', `tagged_def_init(AST, CBinaryOp, CBitShiftRight)')m4_dnl
m4_define(`init_CBitShrArithmetic', `tagged_def_init(AST, CBinaryOp, CBitShrArithmetic)')m4_dnl
m4_define(`init_CAnd', `tagged_def_init(AST, CBinaryOp, CAnd)')m4_dnl
m4_define(`init_COr', `tagged_def_init(AST, CBinaryOp, COr)')m4_dnl
m4_define(`init_CEqual', `tagged_def_init(AST, CBinaryOp, CEqual)')m4_dnl
m4_define(`init_CNotEqual', `tagged_def_init(AST, CBinaryOp, CNotEqual)')m4_dnl
m4_define(`init_CLessThan', `tagged_def_init(AST, CBinaryOp, CLessThan)')m4_dnl
m4_define(`init_CLessOrEqual', `tagged_def_init(AST, CBinaryOp, CLessOrEqual)')m4_dnl
m4_define(`init_CGreaterThan', `tagged_def_init(AST, CBinaryOp, CGreaterThan)')m4_dnl
m4_define(`init_CGreaterOrEqual', `tagged_def_init(AST, CBinaryOp, CGreaterOrEqual)')m4_dnl

type struc CAbstractPointer(abstract_decltor: unique_ptr_t(CAbstractDeclarator))

type struc CAbstractArray(size: TLong, abstract_decltor: unique_ptr_t(CAbstractDeclarator))

type struc CAbstractBase(_empty: char)

type union _CAbstractDeclarator(_CAbstractPointer: struc CAbstractPointer, _CAbstractArray: struc CAbstractArray, _CAbstractBase: struc CAbstractBase)

type struc CAbstractDeclarator(unique_ptr_impl(AST_T)
    get: union _CAbstractDeclarator)
pub fn make_CAbstractDeclarator(none) unique_ptr_t(CAbstractDeclarator);
pub fn make_CAbstractPointer(abstract_decltor: *unique_ptr_t(CAbstractDeclarator)) unique_ptr_t(CAbstractDeclarator);
pub fn make_CAbstractArray(size: TLong, abstract_decltor: *unique_ptr_t(CAbstractDeclarator)) unique_ptr_t(CAbstractDeclarator);
pub fn make_CAbstractBase(none) unique_ptr_t(CAbstractDeclarator);
pub fn free_CAbstractDeclarator(self: *unique_ptr_t(CAbstractDeclarator)) none;

type struc CParam(unique_ptr_impl(AST_T)
    decltor: unique_ptr_t(CDeclarator), param_type: shared_ptr_t(Type))
pub fn make_CParam(decltor: *unique_ptr_t(CDeclarator), param_type: *shared_ptr_t(Type)) unique_ptr_t(CParam);
pub fn free_CParam(self: *unique_ptr_t(CParam)) none;

type struc CIdent(name: TIdentifier)

type struc CPointerDeclarator(decltor: unique_ptr_t(CDeclarator))

type struc CArrayDeclarator(size: TLong, decltor: unique_ptr_t(CDeclarator))

type struc CFunDeclarator(param_list: vector_t(unique_ptr_t(CParam)), decltor: unique_ptr_t(CDeclarator))

type union _CDeclarator(_CIdent: struc CIdent, _CPointerDeclarator: struc CPointerDeclarator, _CArrayDeclarator: struc CArrayDeclarator, _CFunDeclarator: struc CFunDeclarator)

type struc CDeclarator(unique_ptr_impl(AST_T)
    get: union _CDeclarator)
pub fn make_CDeclarator(none) unique_ptr_t(CDeclarator);
pub fn make_CIdent(name: TIdentifier) unique_ptr_t(CDeclarator);
pub fn make_CPointerDeclarator(decltor: *unique_ptr_t(CDeclarator)) unique_ptr_t(CDeclarator);
pub fn make_CArrayDeclarator(size: TLong, decltor: *unique_ptr_t(CDeclarator)) unique_ptr_t(CDeclarator);
pub fn make_CFunDeclarator(param_list: *vector_t(unique_ptr_t(CParam)), decltor: *unique_ptr_t(CDeclarator)) unique_ptr_t(CDeclarator);
pub fn free_CDeclarator(self: *unique_ptr_t(CDeclarator)) none;

type struc CConstant(constant: shared_ptr_t(CConst), _base: *struc CExp)

type struc CString(literal: shared_ptr_t(CStringLiteral), _base: *struc CExp)

type struc CVar(name: TIdentifier, _base: *struc CExp)

type struc CCast(exp: unique_ptr_t(CExp), target_type: shared_ptr_t(Type), _base: *struc CExp)

type struc CUnary(unop: struc CUnaryOp, exp: unique_ptr_t(CExp), _base: *struc CExp)

type struc CBinary(binop: struc CBinaryOp, exp_left: unique_ptr_t(CExp), exp_right: unique_ptr_t(CExp), _base: *struc CExp)

type struc CAssignment(unop: struc CUnaryOp, exp_left: unique_ptr_t(CExp), exp_right: unique_ptr_t(CExp), _base: *struc CExp)

type struc CConditional(condition: unique_ptr_t(CExp), exp_middle: unique_ptr_t(CExp), exp_right: unique_ptr_t(CExp), _base: *struc CExp)

type struc CFunctionCall(name: TIdentifier, args: vector_t(unique_ptr_t(CExp)), _base: *struc CExp)

type struc CDereference(exp: unique_ptr_t(CExp), _base: *struc CExp)

type struc CAddrOf(exp: unique_ptr_t(CExp), _base: *struc CExp)

type struc CSubscript(primary_exp: unique_ptr_t(CExp), subscript_exp: unique_ptr_t(CExp), _base: *struc CExp)

type struc CSizeOf(exp: unique_ptr_t(CExp), _base: *struc CExp)

type struc CSizeOfT(target_type: shared_ptr_t(Type), _base: *struc CExp)

type struc CDot(member: TIdentifier, structure: unique_ptr_t(CExp), _base: *struc CExp)

type struc CArrow(member: TIdentifier, pointer: unique_ptr_t(CExp), _base: *struc CExp)

type union _CExp(_CConstant: struc CConstant, _CString: struc CString, _CVar: struc CVar, _CCast: struc CCast, _CUnary: struc CUnary, _CBinary: struc CBinary, _CAssignment: struc CAssignment, _CConditional: struc CConditional, _CFunctionCall: struc CFunctionCall, _CDereference: struc CDereference, _CAddrOf: struc CAddrOf, _CSubscript: struc CSubscript, _CSizeOf: struc CSizeOf, _CSizeOfT: struc CSizeOfT, _CDot: struc CDot, _CArrow: struc CArrow)

type struc CExp(unique_ptr_impl(AST_T)
    exp_type: shared_ptr_t(Type), info_at: u64, get: union _CExp)
pub fn make_CExp(info_at: u64) unique_ptr_t(CExp);
pub fn make_CConstant(constant: *shared_ptr_t(CConst), info_at: u64) unique_ptr_t(CExp);
pub fn make_CString(literal: *shared_ptr_t(CStringLiteral), info_at: u64) unique_ptr_t(CExp);
pub fn make_CVar(name: TIdentifier, info_at: u64) unique_ptr_t(CExp);
pub fn make_CCast(exp: *unique_ptr_t(CExp), target_type: *shared_ptr_t(Type), info_at: u64) unique_ptr_t(CExp);
pub fn make_CUnary(unop: *struc CUnaryOp, exp: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CBinary(binop: *struc CBinaryOp, exp_left: *unique_ptr_t(CExp), exp_right: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CAssignment(unop: *struc CUnaryOp, exp_left: *unique_ptr_t(CExp), exp_right: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CConditional(condition: *unique_ptr_t(CExp), exp_middle: *unique_ptr_t(CExp), exp_right: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CFunctionCall(name: TIdentifier, args: *vector_t(unique_ptr_t(CExp)), info_at: u64) unique_ptr_t(CExp);
pub fn make_CDereference(exp: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CAddrOf(exp: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CSubscript(primary_exp: *unique_ptr_t(CExp), subscript_exp: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CSizeOf(exp: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CSizeOfT(target_type: *shared_ptr_t(Type), info_at: u64) unique_ptr_t(CExp);
pub fn make_CDot(member: TIdentifier, structure: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn make_CArrow(member: TIdentifier, pointer: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CExp);
pub fn free_CExp(self: *unique_ptr_t(CExp)) none;

type struc CReturn(exp: unique_ptr_t(CExp), info_at: u64)

type struc CExpression(exp: unique_ptr_t(CExp))

type struc CIf(condition: unique_ptr_t(CExp), then_fi: unique_ptr_t(CStatement), else_fi: unique_ptr_t(CStatement))

type struc CGoto(target: TIdentifier, info_at: u64)

type struc CLabel(target: TIdentifier, jump_to: unique_ptr_t(CStatement), info_at: u64)

type struc CCompound(block: unique_ptr_t(CBlock))

type struc CWhile(target: TIdentifier, condition: unique_ptr_t(CExp), body: unique_ptr_t(CStatement))

type struc CDoWhile(target: TIdentifier, condition: unique_ptr_t(CExp), body: unique_ptr_t(CStatement))

type struc CFor(target: TIdentifier, init: unique_ptr_t(CForInit), condition: unique_ptr_t(CExp), post: unique_ptr_t(CExp), body: unique_ptr_t(CStatement))

type struc CSwitch(target: TIdentifier, is_default: bool, lookup: unique_ptr_t(CExp), body: unique_ptr_t(CStatement), cases: vector_t(unique_ptr_t(CExp)))

type struc CCase(target: TIdentifier, value: unique_ptr_t(CExp), jump_to: unique_ptr_t(CStatement))

type struc CDefault(target: TIdentifier, jump_to: unique_ptr_t(CStatement), info_at: u64)

type struc CBreak(target: TIdentifier, info_at: u64)

type struc CContinue(target: TIdentifier, info_at: u64)

type struc CNull(_empty: char)

type union _CStatement(_CReturn: struc CReturn, _CExpression: struc CExpression, _CIf: struc CIf, _CGoto: struc CGoto, _CLabel: struc CLabel, _CCompound: struc CCompound, _CWhile: struc CWhile, _CDoWhile: struc CDoWhile, _CFor: struc CFor, _CSwitch: struc CSwitch, _CCase: struc CCase, _CDefault: struc CDefault, _CBreak: struc CBreak, _CContinue: struc CContinue, _CNull: struc CNull)

type struc CStatement(unique_ptr_impl(AST_T)
    get: union _CStatement)
pub fn make_CStatement(none) unique_ptr_t(CStatement);
pub fn make_CReturn(exp: *unique_ptr_t(CExp), info_at: u64) unique_ptr_t(CStatement);
pub fn make_CExpression(exp: *unique_ptr_t(CExp)) unique_ptr_t(CStatement);
pub fn make_CIf(condition: *unique_ptr_t(CExp), then_fi: *unique_ptr_t(CStatement), else_fi: *unique_ptr_t(CStatement)) unique_ptr_t(CStatement);
pub fn make_CGoto(target: TIdentifier, info_at: u64) unique_ptr_t(CStatement);
pub fn make_CLabel(target: TIdentifier, jump_to: *unique_ptr_t(CStatement), info_at: u64) unique_ptr_t(CStatement);
pub fn make_CCompound(block: *unique_ptr_t(CBlock)) unique_ptr_t(CStatement);
pub fn make_CWhile(condition: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) unique_ptr_t(CStatement);
pub fn make_CDoWhile(condition: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) unique_ptr_t(CStatement);
pub fn make_CFor(init: *unique_ptr_t(CForInit), condition: *unique_ptr_t(CExp), post: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) unique_ptr_t(CStatement);
pub fn make_CSwitch(lookup: *unique_ptr_t(CExp), body: *unique_ptr_t(CStatement)) unique_ptr_t(CStatement);
pub fn make_CCase(value: *unique_ptr_t(CExp), jump_to: *unique_ptr_t(CStatement)) unique_ptr_t(CStatement);
pub fn make_CDefault(jump_to: *unique_ptr_t(CStatement), info_at: u64) unique_ptr_t(CStatement);
pub fn make_CBreak(info_at: u64) unique_ptr_t(CStatement);
pub fn make_CContinue(info_at: u64) unique_ptr_t(CStatement);
pub fn make_CNull(none) unique_ptr_t(CStatement);
pub fn free_CStatement(self: *unique_ptr_t(CStatement)) none;

type struc CInitDecl(init: unique_ptr_t(CVariableDeclaration))

type struc CInitExp(init: unique_ptr_t(CExp))

type union _CForInit(_CInitDecl: struc CInitDecl, _CInitExp: struc CInitExp)

type struc CForInit(unique_ptr_impl(AST_T)
    get: union _CForInit)
pub fn make_CForInit(none) unique_ptr_t(CForInit);
pub fn make_CInitDecl(init: *unique_ptr_t(CVariableDeclaration)) unique_ptr_t(CForInit);
pub fn make_CInitExp(init: *unique_ptr_t(CExp)) unique_ptr_t(CForInit);
pub fn free_CForInit(self: *unique_ptr_t(CForInit)) none;

type struc CB(block_items: vector_t(unique_ptr_t(CBlockItem)))

type union _CBlock(_CB: struc CB)

type struc CBlock(unique_ptr_impl(AST_T)
    get: union _CBlock)
pub fn make_CBlock(none) unique_ptr_t(CBlock);
pub fn make_CB(block_items: *vector_t(unique_ptr_t(CBlockItem))) unique_ptr_t(CBlock);
pub fn free_CBlock(self: *unique_ptr_t(CBlock)) none;

type struc CS(statement: unique_ptr_t(CStatement))

type struc CD(declaration: unique_ptr_t(CDeclaration))

type union _CBlockItem(_CS: struc CS, _CD: struc CD)

type struc CBlockItem(unique_ptr_impl(AST_T)
    get: union _CBlockItem)
pub fn make_CBlockItem(none) unique_ptr_t(CBlockItem);
pub fn make_CS(statement: *unique_ptr_t(CStatement)) unique_ptr_t(CBlockItem);
pub fn make_CD(declaration: *unique_ptr_t(CDeclaration)) unique_ptr_t(CBlockItem);
pub fn free_CBlockItem(self: *unique_ptr_t(CBlockItem)) none;

type struc CStorageClass(tagged_def_impl(AST_T))
pub fn make_CStorageClass(tagged_def_impl(AST_T)) struc CStorageClass;
m4_define(`init_CStorageClass', `tagged_def_init(AST, CStorageClass, CStorageClass)')m4_dnl
m4_define(`init_CStatic', `tagged_def_init(AST, CStorageClass, CStatic)')m4_dnl
m4_define(`init_CExtern', `tagged_def_init(AST, CStorageClass, CExtern)')m4_dnl

type struc CSingleInit(exp: unique_ptr_t(CExp), _base: *struc CInitializer)

type struc CCompoundInit(initializers: vector_t(unique_ptr_t(CInitializer)), _base: *struc CInitializer)

type union _CInitializer(_CSingleInit: struc CSingleInit, _CCompoundInit: struc CCompoundInit)

type struc CInitializer(unique_ptr_impl(AST_T)
    init_type: shared_ptr_t(Type), get: union _CInitializer)
pub fn make_CInitializer(none) unique_ptr_t(CInitializer);
pub fn make_CSingleInit(exp: *unique_ptr_t(CExp)) unique_ptr_t(CInitializer);
pub fn make_CCompoundInit(initializers: *vector_t(unique_ptr_t(CInitializer))) unique_ptr_t(CInitializer);
pub fn free_CInitializer(self: *unique_ptr_t(CInitializer)) none;

type struc CMemberDeclaration(unique_ptr_impl(AST_T)
    member_name: TIdentifier, member_type: shared_ptr_t(Type), info_at: u64)
pub fn make_CMemberDeclaration(member_name: TIdentifier, member_type: *shared_ptr_t(Type), info_at: u64) unique_ptr_t(CMemberDeclaration);
pub fn free_CMemberDeclaration(self: *unique_ptr_t(CMemberDeclaration)) none;

type struc CStructDeclaration(unique_ptr_impl(AST_T)
    tag_name: TIdentifier, is_union: bool, members: vector_t(unique_ptr_t(CMemberDeclaration)), info_at: u64)
pub fn make_CStructDeclaration(tag_name: TIdentifier, is_union: bool, members: *vector_t(unique_ptr_t(CMemberDeclaration)), info_at: u64) unique_ptr_t(CStructDeclaration);
pub fn free_CStructDeclaration(self: *unique_ptr_t(CStructDeclaration)) none;

type struc CFunctionDeclaration(unique_ptr_impl(AST_T)
    name: TIdentifier, params: vector_t(TIdentifier), body: unique_ptr_t(CBlock), fun_type: shared_ptr_t(Type), storage_class: struc CStorageClass, info_at: u64)
pub fn make_CFunctionDeclaration(name: TIdentifier, params: *vector_t(TIdentifier), body: *unique_ptr_t(CBlock), fun_type: *shared_ptr_t(Type), storage_class: *struc CStorageClass, info_at: u64) unique_ptr_t(CFunctionDeclaration);
pub fn free_CFunctionDeclaration(self: *unique_ptr_t(CFunctionDeclaration)) none;

type struc CVariableDeclaration(unique_ptr_impl(AST_T)
    name: TIdentifier, init: unique_ptr_t(CInitializer), var_type: shared_ptr_t(Type), storage_class: struc CStorageClass, info_at: u64)
pub fn make_CVariableDeclaration(name: TIdentifier, init: *unique_ptr_t(CInitializer), var_type: *shared_ptr_t(Type), storage_class: *struc CStorageClass, info_at: u64) unique_ptr_t(CVariableDeclaration);
pub fn free_CVariableDeclaration(self: *unique_ptr_t(CVariableDeclaration)) none;

type struc CFunDecl(fun_decl: unique_ptr_t(CFunctionDeclaration))

type struc CVarDecl(var_decl: unique_ptr_t(CVariableDeclaration))

type struc CStructDecl(struct_decl: unique_ptr_t(CStructDeclaration))

type union _CDeclaration(_CFunDecl: struc CFunDecl, _CVarDecl: struc CVarDecl, _CStructDecl: struc CStructDecl)

type struc CDeclaration(unique_ptr_impl(AST_T)
    get: union _CDeclaration)
pub fn make_CDeclaration(none) unique_ptr_t(CDeclaration);
pub fn make_CFunDecl(fun_decl: *unique_ptr_t(CFunctionDeclaration)) unique_ptr_t(CDeclaration);
pub fn make_CVarDecl(var_decl: *unique_ptr_t(CVariableDeclaration)) unique_ptr_t(CDeclaration);
pub fn make_CStructDecl(struct_decl: *unique_ptr_t(CStructDeclaration)) unique_ptr_t(CDeclaration);
pub fn free_CDeclaration(self: *unique_ptr_t(CDeclaration)) none;

type struc CProgram(unique_ptr_impl(AST_T)
    declarations: vector_t(unique_ptr_t(CDeclaration)))
pub fn make_CProgram(declarations: *vector_t(unique_ptr_t(CDeclaration))) unique_ptr_t(CProgram);
pub fn free_CProgram(self: *unique_ptr_t(CProgram)) none;

')m4_dnl
