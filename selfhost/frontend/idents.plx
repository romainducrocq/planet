m4_include(`idents.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl






m4_define(`LABEL_KIND', `TODO')m4_dnl
m4_define(`LBL_Land_false', `0')m4_dnl
m4_define(`LBL_Land_true', `1')m4_dnl
m4_define(`LBL_Lbreak', `2')m4_dnl
m4_define(`LBL_Lcase', `3')m4_dnl
m4_define(`LBL_Lcontinue', `4')m4_dnl
m4_define(`LBL_Ldefault', `5')m4_dnl
m4_define(`LBL_Ldo_while', `6')m4_dnl
m4_define(`LBL_Ldo_while_start', `7')m4_dnl
m4_define(`LBL_Lfor', `8')m4_dnl
m4_define(`LBL_Lfor_start', `9')m4_dnl
m4_define(`LBL_Lif_else', `10')m4_dnl
m4_define(`LBL_Lif_false', `11')m4_dnl
m4_define(`LBL_Lor_false', `12')m4_dnl
m4_define(`LBL_Lor_true', `13')m4_dnl
m4_define(`LBL_Lstring', `14')m4_dnl
m4_define(`LBL_Lswitch', `15')m4_dnl
m4_define(`LBL_Lternary_else', `16')m4_dnl
m4_define(`LBL_Lternary_false', `17')m4_dnl
m4_define(`LBL_Lwhile', `18')m4_dnl
type struc CExp;
type struc IdentifierContext;
pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: u64) u64;
pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64;
pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64;
pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64;
pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64;
pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64;
pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64;
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

type struc CUnaryOp(tag: i32)
pub fn make_CUnaryOp(tag: i32) struc CUnaryOp;
m4_define(`init_CUnaryOp', `TODO')m4_dnl
m4_define(`init_CComplement', `TODO')m4_dnl
m4_define(`init_CNegate', `TODO')m4_dnl
m4_define(`init_CNot', `TODO')m4_dnl
m4_define(`init_CPrefix', `TODO')m4_dnl
m4_define(`init_CPostfix', `TODO')m4_dnl

type struc CBinaryOp(tag: i32)
pub fn make_CBinaryOp(tag: i32) struc CBinaryOp;
m4_define(`init_CBinaryOp', `TODO')m4_dnl
m4_define(`init_CAdd', `TODO')m4_dnl
m4_define(`init_CSubtract', `TODO')m4_dnl
m4_define(`init_CMultiply', `TODO')m4_dnl
m4_define(`init_CDivide', `TODO')m4_dnl
m4_define(`init_CRemainder', `TODO')m4_dnl
m4_define(`init_CBitAnd', `TODO')m4_dnl
m4_define(`init_CBitOr', `TODO')m4_dnl
m4_define(`init_CBitXor', `TODO')m4_dnl
m4_define(`init_CBitShiftLeft', `TODO')m4_dnl
m4_define(`init_CBitShiftRight', `TODO')m4_dnl
m4_define(`init_CBitShrArithmetic', `TODO')m4_dnl
m4_define(`init_CAnd', `TODO')m4_dnl
m4_define(`init_COr', `TODO')m4_dnl
m4_define(`init_CEqual', `TODO')m4_dnl
m4_define(`init_CNotEqual', `TODO')m4_dnl
m4_define(`init_CLessThan', `TODO')m4_dnl
m4_define(`init_CLessOrEqual', `TODO')m4_dnl
m4_define(`init_CGreaterThan', `TODO')m4_dnl
m4_define(`init_CGreaterOrEqual', `TODO')m4_dnl

type struc CAbstractPointer(abstract_decltor: *struc CAbstractDeclarator)

type struc CAbstractArray(size: i64, abstract_decltor: *struc CAbstractDeclarator)

type struc CAbstractBase(_empty: char)

type union _CAbstractDeclarator(_CAbstractPointer: struc CAbstractPointer, _CAbstractArray: struc CAbstractArray, _CAbstractBase: struc CAbstractBase)

type struc CAbstractDeclarator(tag: i32, get: union _CAbstractDeclarator)
pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator;
pub fn make_CAbstractPointer(abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractArray(size: i64, abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractBase(none) *struc CAbstractDeclarator;
pub fn free_CAbstractDeclarator(self: **struc CAbstractDeclarator) none;

type struc CParam(tag: i32, decltor: *struc CDeclarator, param_type: *struc Type)
pub fn make_CParam(decltor: **struc CDeclarator, param_type: **struc Type) *struc CParam;
pub fn free_CParam(self: **struc CParam) none;

type struc CIdent(name: u64)

type struc CPointerDeclarator(decltor: *struc CDeclarator)

type struc CArrayDeclarator(size: i64, decltor: *struc CDeclarator)

type struc CFunDeclarator(param_list: **struc CParam, decltor: *struc CDeclarator)

type union _CDeclarator(_CIdent: struc CIdent, _CPointerDeclarator: struc CPointerDeclarator, _CArrayDeclarator: struc CArrayDeclarator, _CFunDeclarator: struc CFunDeclarator)

type struc CDeclarator(tag: i32, get: union _CDeclarator)
pub fn make_CDeclarator(none) *struc CDeclarator;
pub fn make_CIdent(name: u64) *struc CDeclarator;
pub fn make_CPointerDeclarator(decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CArrayDeclarator(size: i64, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CFunDeclarator(param_list: ***struc CParam, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn free_CDeclarator(self: **struc CDeclarator) none;

type struc CConstant(constant: *struc CConst, _base: *struc CExp)

type struc CString(literal: *struc CStringLiteral, _base: *struc CExp)

type struc CVar(name: u64, _base: *struc CExp)

type struc CCast(exp: *struc CExp, target_type: *struc Type, _base: *struc CExp)

type struc CUnary(unop: struc CUnaryOp, exp: *struc CExp, _base: *struc CExp)

type struc CBinary(binop: struc CBinaryOp, exp_left: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CAssignment(unop: struc CUnaryOp, exp_left: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CConditional(condition: *struc CExp, exp_middle: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CFunctionCall(name: u64, args: **struc CExp, _base: *struc CExp)

type struc CDereference(exp: *struc CExp, _base: *struc CExp)

type struc CAddrOf(exp: *struc CExp, _base: *struc CExp)

type struc CSubscript(primary_exp: *struc CExp, subscript_exp: *struc CExp, _base: *struc CExp)

type struc CSizeOf(exp: *struc CExp, _base: *struc CExp)

type struc CSizeOfT(target_type: *struc Type, _base: *struc CExp)

type struc CDot(member: u64, structure: *struc CExp, _base: *struc CExp)

type struc CArrow(member: u64, pointer: *struc CExp, _base: *struc CExp)

type union _CExp(_CConstant: struc CConstant, _CString: struc CString, _CVar: struc CVar, _CCast: struc CCast, _CUnary: struc CUnary, _CBinary: struc CBinary, _CAssignment: struc CAssignment, _CConditional: struc CConditional, _CFunctionCall: struc CFunctionCall, _CDereference: struc CDereference, _CAddrOf: struc CAddrOf, _CSubscript: struc CSubscript, _CSizeOf: struc CSizeOf, _CSizeOfT: struc CSizeOfT, _CDot: struc CDot, _CArrow: struc CArrow)

type struc CExp(tag: i32, exp_type: *struc Type, info_at: u64, get: union _CExp)
pub fn make_CExp(info_at: u64) *struc CExp;
pub fn make_CConstant(constant: **struc CConst, info_at: u64) *struc CExp;
pub fn make_CString(literal: **struc CStringLiteral, info_at: u64) *struc CExp;
pub fn make_CVar(name: u64, info_at: u64) *struc CExp;
pub fn make_CCast(exp: **struc CExp, target_type: **struc Type, info_at: u64) *struc CExp;
pub fn make_CUnary(unop: *struc CUnaryOp, exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CBinary(binop: *struc CBinaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CAssignment(unop: *struc CUnaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CConditional(condition: **struc CExp, exp_middle: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CFunctionCall(name: u64, args: ***struc CExp, info_at: u64) *struc CExp;
pub fn make_CDereference(exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CAddrOf(exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CSubscript(primary_exp: **struc CExp, subscript_exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CSizeOf(exp: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CSizeOfT(target_type: **struc Type, info_at: u64) *struc CExp;
pub fn make_CDot(member: u64, structure: **struc CExp, info_at: u64) *struc CExp;
pub fn make_CArrow(member: u64, pointer: **struc CExp, info_at: u64) *struc CExp;
pub fn free_CExp(self: **struc CExp) none;

type struc CReturn(exp: *struc CExp, info_at: u64)

type struc CExpression(exp: *struc CExp)

type struc CIf(condition: *struc CExp, then_fi: *struc CStatement, else_fi: *struc CStatement)

type struc CGoto(target: u64, info_at: u64)

type struc CLabel(target: u64, jump_to: *struc CStatement, info_at: u64)

type struc CCompound(block: *struc CBlock)

type struc CWhile(target: u64, condition: *struc CExp, body: *struc CStatement)

type struc CDoWhile(target: u64, condition: *struc CExp, body: *struc CStatement)

type struc CFor(target: u64, init: *struc CForInit, condition: *struc CExp, post: *struc CExp, body: *struc CStatement)

type struc CSwitch(target: u64, is_default: i32, lookup: *struc CExp, body: *struc CStatement, cases: **struc CExp)

type struc CCase(target: u64, value: *struc CExp, jump_to: *struc CStatement)

type struc CDefault(target: u64, jump_to: *struc CStatement, info_at: u64)

type struc CBreak(target: u64, info_at: u64)

type struc CContinue(target: u64, info_at: u64)

type struc CNull(_empty: char)

type union _CStatement(_CReturn: struc CReturn, _CExpression: struc CExpression, _CIf: struc CIf, _CGoto: struc CGoto, _CLabel: struc CLabel, _CCompound: struc CCompound, _CWhile: struc CWhile, _CDoWhile: struc CDoWhile, _CFor: struc CFor, _CSwitch: struc CSwitch, _CCase: struc CCase, _CDefault: struc CDefault, _CBreak: struc CBreak, _CContinue: struc CContinue, _CNull: struc CNull)

type struc CStatement(tag: i32, get: union _CStatement)
pub fn make_CStatement(none) *struc CStatement;
pub fn make_CReturn(exp: **struc CExp, info_at: u64) *struc CStatement;
pub fn make_CExpression(exp: **struc CExp) *struc CStatement;
pub fn make_CIf(condition: **struc CExp, then_fi: **struc CStatement, else_fi: **struc CStatement) *struc CStatement;
pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement;
pub fn make_CLabel(target: u64, jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CCompound(block: **struc CBlock) *struc CStatement;
pub fn make_CWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CDoWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CFor(init: **struc CForInit, condition: **struc CExp, post: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CSwitch(lookup: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CCase(value: **struc CExp, jump_to: **struc CStatement) *struc CStatement;
pub fn make_CDefault(jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CBreak(info_at: u64) *struc CStatement;
pub fn make_CContinue(info_at: u64) *struc CStatement;
pub fn make_CNull(none) *struc CStatement;
pub fn free_CStatement(self: **struc CStatement) none;

type struc CInitDecl(init: *struc CVariableDeclaration)

type struc CInitExp(init: *struc CExp)

type union _CForInit(_CInitDecl: struc CInitDecl, _CInitExp: struc CInitExp)

type struc CForInit(tag: i32, get: union _CForInit)
pub fn make_CForInit(none) *struc CForInit;
pub fn make_CInitDecl(init: **struc CVariableDeclaration) *struc CForInit;
pub fn make_CInitExp(init: **struc CExp) *struc CForInit;
pub fn free_CForInit(self: **struc CForInit) none;

type struc CB(block_items: **struc CBlockItem)

type union _CBlock(_CB: struc CB)

type struc CBlock(tag: i32, get: union _CBlock)
pub fn make_CBlock(none) *struc CBlock;
pub fn make_CB(block_items: ***struc CBlockItem) *struc CBlock;
pub fn free_CBlock(self: **struc CBlock) none;

type struc CS(statement: *struc CStatement)

type struc CD(declaration: *struc CDeclaration)

type union _CBlockItem(_CS: struc CS, _CD: struc CD)

type struc CBlockItem(tag: i32, get: union _CBlockItem)
pub fn make_CBlockItem(none) *struc CBlockItem;
pub fn make_CS(statement: **struc CStatement) *struc CBlockItem;
pub fn make_CD(declaration: **struc CDeclaration) *struc CBlockItem;
pub fn free_CBlockItem(self: **struc CBlockItem) none;

type struc CStorageClass(tag: i32)
pub fn make_CStorageClass(tag: i32) struc CStorageClass;
m4_define(`init_CStorageClass', `TODO')m4_dnl
m4_define(`init_CStatic', `TODO')m4_dnl
m4_define(`init_CExtern', `TODO')m4_dnl

type struc CSingleInit(exp: *struc CExp, _base: *struc CInitializer)

type struc CCompoundInit(initializers: **struc CInitializer, _base: *struc CInitializer)

type union _CInitializer(_CSingleInit: struc CSingleInit, _CCompoundInit: struc CCompoundInit)

type struc CInitializer(tag: i32, init_type: *struc Type, get: union _CInitializer)
pub fn make_CInitializer(none) *struc CInitializer;
pub fn make_CSingleInit(exp: **struc CExp) *struc CInitializer;
pub fn make_CCompoundInit(initializers: ***struc CInitializer) *struc CInitializer;
pub fn free_CInitializer(self: **struc CInitializer) none;

type struc CMemberDeclaration(tag: i32, member_name: u64, member_type: *struc Type, info_at: u64)
pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration;
pub fn free_CMemberDeclaration(self: **struc CMemberDeclaration) none;

type struc CStructDeclaration(tag: i32, tag_name: u64, is_union: i32, members: **struc CMemberDeclaration, info_at: u64)
pub fn make_CStructDeclaration(tag_name: u64, is_union: i32, members: ***struc CMemberDeclaration, info_at: u64) *struc CStructDeclaration;
pub fn free_CStructDeclaration(self: **struc CStructDeclaration) none;

type struc CFunctionDeclaration(tag: i32, name: u64, params: *u64, body: *struc CBlock, fun_type: *struc Type, storage_class: struc CStorageClass, info_at: u64)
pub fn make_CFunctionDeclaration(name: u64, params: **u64, body: **struc CBlock, fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration;
pub fn free_CFunctionDeclaration(self: **struc CFunctionDeclaration) none;

type struc CVariableDeclaration(tag: i32, name: u64, init: *struc CInitializer, var_type: *struc Type, storage_class: struc CStorageClass, info_at: u64)
pub fn make_CVariableDeclaration(name: u64, init: **struc CInitializer, var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration;
pub fn free_CVariableDeclaration(self: **struc CVariableDeclaration) none;

type struc CFunDecl(fun_decl: *struc CFunctionDeclaration)

type struc CVarDecl(var_decl: *struc CVariableDeclaration)

type struc CStructDecl(struct_decl: *struc CStructDeclaration)

type union _CDeclaration(_CFunDecl: struc CFunDecl, _CVarDecl: struc CVarDecl, _CStructDecl: struc CStructDecl)

type struc CDeclaration(tag: i32, get: union _CDeclaration)
pub fn make_CDeclaration(none) *struc CDeclaration;
pub fn make_CFunDecl(fun_decl: **struc CFunctionDeclaration) *struc CDeclaration;
pub fn make_CVarDecl(var_decl: **struc CVariableDeclaration) *struc CDeclaration;
pub fn make_CStructDecl(struct_decl: **struc CStructDeclaration) *struc CDeclaration;
pub fn free_CDeclaration(self: **struc CDeclaration) none;

type struc CProgram(tag: i32, declarations: **struc CDeclaration)
pub fn make_CProgram(declarations: ***struc CDeclaration) *struc CProgram;
pub fn free_CProgram(self: **struc CProgram) none;
m4_define(`Ctx', `TODO')m4_dnl

pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((target))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name {
        "@MACRO@:str_copy(value, name)"
        if name {
            "@MACRO@:str_delete(name)"
            sdsfree(name)
            name = ? nil then sdsnew(nil) else nil
        }
        name = sdsdup(value)
    }
    return make_label_identifier(ctx, @name)
}

pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((variable))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name {
        "@MACRO@:str_copy(value, name)"
        if name {
            "@MACRO@:str_delete(name)"
            sdsfree(name)
            name = ? nil then sdsnew(nil) else nil
        }
        name = sdsdup(value)
    }
    return make_var_identifier(ctx, @name)
}

pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((structure))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name {
        "@MACRO@:str_copy(value, name)"
        if name {
            "@MACRO@:str_delete(name)"
            sdsfree(name)
            name = ? nil then sdsnew(nil) else nil
        }
        name = sdsdup(value)
    }
    return make_struct_identifier(ctx, @name)
}

pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match label_kind {
        -> LBL_Land_false {
            name = ? "and_false" then sdsnew("and_false") else nil
            break
        }
        -> LBL_Land_true {
            name = ? "and_true" then sdsnew("and_true") else nil
            break
        }
        -> LBL_Ldo_while {
            name = ? "do_while" then sdsnew("do_while") else nil
            break
        }
        -> LBL_Ldo_while_start {
            name = ? "do_while_start" then sdsnew("do_while_start") else nil
            break
        }
        -> LBL_Lfor {
            name = ? "for" then sdsnew("for") else nil
            break
        }
        -> LBL_Lswitch {
            name = ? "switch" then sdsnew("switch") else nil
            break
        }
        -> LBL_Lfor_start {
            name = ? "for_start" then sdsnew("for_start") else nil
            break
        }
        -> LBL_Lif_else {
            name = ? "if_else" then sdsnew("if_else") else nil
            break
        }
        -> LBL_Lif_false {
            name = ? "if_false" then sdsnew("if_false") else nil
            break
        }
        -> LBL_Lor_false {
            name = ? "or_false" then sdsnew("or_false") else nil
            break
        }
        -> LBL_Lor_true {
            name = ? "or_true" then sdsnew("or_true") else nil
            break
        }
        -> LBL_Lstring {
            name = ? "string" then sdsnew("string") else nil
            break
        }
        -> LBL_Lternary_else {
            name = ? "ternary_else" then sdsnew("ternary_else") else nil
            break
        }
        -> LBL_Lternary_false {
            name = ? "ternary_false" then sdsnew("ternary_false") else nil
            break
        }
        -> LBL_Lwhile {
            name = ? "while" then sdsnew("while") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_label_identifier(ctx, @name)
}

pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match label_kind {
        -> LBL_Lbreak {
            name = ? "break_" then sdsnew("break_") else nil
            break
        }
        -> LBL_Lcase {
            name = ? "case_" then sdsnew("case_") else nil
            break
        }
        -> LBL_Lcontinue {
            name = ? "continue_" then sdsnew("continue_") else nil
            break
        }
        -> LBL_Ldefault {
            name = ? "default_" then sdsnew("default_") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:str_append(name, map_get(ctx->hash_table, target))"
        name = sdscat(name, ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((target))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value))
    }
    return make_string_identifier(ctx, @name)
}

pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64 {
    name: string = ? is_label then ? "case_" then sdsnew("case_") else nil else ? "" then sdsnew("") else nil
    {
        strto_i: string = ? (i) > 0 then sdsfromunsignedlong(cast<u64>((i))) else sdsfromlong(cast<i64>((i)))
        loop .. while 0 {
            "@MACRO@:str_append(name, strto_i)"
            name = sdscat(name, strto_i)
        }
        if strto_i {
            "@MACRO@:str_delete(strto_i)"
            sdsfree(strto_i)
            strto_i = ? nil then sdsnew(nil) else nil
        }
    }
    loop .. while 0 {
        "@MACRO@:str_append(name, map_get(ctx->hash_table, target))"
        name = sdscat(name, ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((target))), sizeof((ctx[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value))
    }
    return make_string_identifier(ctx, @name)
}

pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64 {
    name: string = ? nil then sdsnew(nil) else nil
    match node[].tag {
        -> AST_CConstant_t {
            name = ? "const" then sdsnew("const") else nil
            break
        }
        -> AST_CString_t {
            name = ? "string" then sdsnew("string") else nil
            break
        }
        -> AST_CVar_t {
            name = ? "var" then sdsnew("var") else nil
            break
        }
        -> AST_CCast_t {
            name = ? "cast" then sdsnew("cast") else nil
            break
        }
        -> AST_CUnary_t {
            name = ? "unop" then sdsnew("unop") else nil
            break
        }
        -> AST_CBinary_t {
            name = ? "binop" then sdsnew("binop") else nil
            break
        }
        -> AST_CAssignment_t {
            name = ? "assign" then sdsnew("assign") else nil
            break
        }
        -> AST_CConditional_t {
            name = ? "ternop" then sdsnew("ternop") else nil
            break
        }
        -> AST_CFunctionCall_t {
            name = ? "call" then sdsnew("call") else nil
            break
        }
        -> AST_CDereference_t {
            name = ? "deref" then sdsnew("deref") else nil
            break
        }
        -> AST_CAddrOf_t {
            name = ? "addr" then sdsnew("addr") else nil
            break
        }
        -> AST_CSubscript_t {
            name = ? "subscr" then sdsnew("subscr") else nil
            break
        }
        -> AST_CDot_t {
            name = ? "smem" then sdsnew("smem") else nil
            break
        }
        -> AST_CArrow_t {
            name = ? "sptr" then sdsnew("sptr") else nil
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_var_identifier(ctx, @name)
}
