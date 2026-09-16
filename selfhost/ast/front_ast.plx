m4_include(`ast.plx.m4')m4_dnl
m4_include(`front_ast.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl







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

pub fn make_CUnaryOp(tag: i32) struc CUnaryOp {
    self: struc CUnaryOp = $(tag)
    match tag {
        -> AST_CUnaryOp_t {
            -> AST_CComplement_t {
                -> AST_CNegate_t {
                    -> AST_CNot_t {
                        -> AST_CPrefix_t {
                            -> AST_CPostfix_t {
                                return self
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

pub fn make_CBinaryOp(tag: i32) struc CBinaryOp {
    self: struc CBinaryOp = $(tag)
    match tag {
        -> AST_CBinaryOp_t {
            -> AST_CAdd_t {
                -> AST_CSubtract_t {
                    -> AST_CMultiply_t {
                        -> AST_CDivide_t {
                            -> AST_CRemainder_t {
                                -> AST_CBitAnd_t {
                                    -> AST_CBitOr_t {
                                        -> AST_CBitXor_t {
                                            -> AST_CBitShiftLeft_t {
                                                -> AST_CBitShiftRight_t {
                                                    -> AST_CBitShrArithmetic_t {
                                                        -> AST_CAnd_t {
                                                            -> AST_COr_t {
                                                                -> AST_CEqual_t {
                                                                    -> AST_CNotEqual_t {
                                                                        -> AST_CLessThan_t {
                                                                            -> AST_CLessOrEqual_t {
                                                                                -> AST_CGreaterThan_t {
                                                                                    -> AST_CGreaterOrEqual_t {
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
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CAbstractDeclarator, self)"
        free_CAbstractDeclarator(@self)
        self = cast<*struc CAbstractDeclarator>(malloc(sizeof<struc CAbstractDeclarator>))
        if not self {
            panic_sigabrt("alloc "                 "CAbstractDeclarator")
        }
    }
    self[].tag = AST_CAbstractDeclarator_t
    return self
}

pub fn make_CAbstractPointer(abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractPointer_t
    self[].get._CAbstractPointer.abstract_decltor = uptr_new()
    if abstract_decltor[] ~= self[].get._CAbstractPointer.abstract_decltor {
        "@MACRO@:uptr_move(CAbstractDeclarator, *abstract_decltor, self->get._CAbstractPointer.abstract_decltor)"
        free_CAbstractDeclarator(@self[].get._CAbstractPointer.abstract_decltor)
        self[].get._CAbstractPointer.abstract_decltor = abstract_decltor[]
        abstract_decltor[] = uptr_new()
    }
    return self
}

pub fn make_CAbstractArray(size: i64, abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractArray_t
    self[].get._CAbstractArray.size = size
    self[].get._CAbstractArray.abstract_decltor = uptr_new()
    if abstract_decltor[] ~= self[].get._CAbstractArray.abstract_decltor {
        "@MACRO@:uptr_move(CAbstractDeclarator, *abstract_decltor, self->get._CAbstractArray.abstract_decltor)"
        free_CAbstractDeclarator(@self[].get._CAbstractArray.abstract_decltor)
        self[].get._CAbstractArray.abstract_decltor = abstract_decltor[]
        abstract_decltor[] = uptr_new()
    }
    return self
}

pub fn make_CAbstractBase(none) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractBase_t
    return self
}

pub fn free_CAbstractDeclarator(self: **struc CAbstractDeclarator) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CAbstractDeclarator_t {
            break
        }
        -> AST_CAbstractPointer_t {
            free_CAbstractDeclarator(@(self[])[].get._CAbstractPointer.abstract_decltor)
        }
        break
        -> AST_CAbstractArray_t {
            free_CAbstractDeclarator(@(self[])[].get._CAbstractArray.abstract_decltor)
        }
        break
        -> AST_CAbstractBase_t {
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

pub fn make_CParam(decltor: **struc CDeclarator, param_type: **struc Type) *struc CParam {
    self: *struc CParam = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CParam, self)"
        free_CParam(@self)
        self = cast<*struc CParam>(malloc(sizeof<struc CParam>))
        if not self {
            panic_sigabrt("alloc "                 "CParam")
        }
    }
    self[].tag = AST_CParam_t
    self[].decltor = uptr_new()
    if decltor[] ~= self[].decltor {
        "@MACRO@:uptr_move(CDeclarator, *decltor, self->decltor)"
        free_CDeclarator(@self[].decltor)
        self[].decltor = decltor[]
        decltor[] = uptr_new()
    }
    self[].param_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *param_type, self->param_type)"
        if param_type[] ~= self[].param_type {
            "@MACRO@:uptr_move(Type, *param_type, self->param_type)"
            free_Type(@self[].param_type)
            self[].param_type = param_type[]
            param_type[] = uptr_new()
        }
    }
    return self
}

pub fn free_CParam(self: **struc CParam) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CParam_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_CDeclarator(@(self[])[].decltor)
    free_Type(@(self[])[].param_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CDeclarator(none) *struc CDeclarator {
    self: *struc CDeclarator = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CDeclarator, self)"
        free_CDeclarator(@self)
        self = cast<*struc CDeclarator>(malloc(sizeof<struc CDeclarator>))
        if not self {
            panic_sigabrt("alloc "                 "CDeclarator")
        }
    }
    self[].tag = AST_CDeclarator_t
    return self
}

pub fn make_CIdent(name: u64) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CIdent_t
    self[].get._CIdent.name = name
    return self
}

pub fn make_CPointerDeclarator(decltor: **struc CDeclarator) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CPointerDeclarator_t
    self[].get._CPointerDeclarator.decltor = uptr_new()
    if decltor[] ~= self[].get._CPointerDeclarator.decltor {
        "@MACRO@:uptr_move(CDeclarator, *decltor, self->get._CPointerDeclarator.decltor)"
        free_CDeclarator(@self[].get._CPointerDeclarator.decltor)
        self[].get._CPointerDeclarator.decltor = decltor[]
        decltor[] = uptr_new()
    }
    return self
}

pub fn make_CArrayDeclarator(size: i64, decltor: **struc CDeclarator) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CArrayDeclarator_t
    self[].get._CArrayDeclarator.size = size
    self[].get._CArrayDeclarator.decltor = uptr_new()
    if decltor[] ~= self[].get._CArrayDeclarator.decltor {
        "@MACRO@:uptr_move(CDeclarator, *decltor, self->get._CArrayDeclarator.decltor)"
        free_CDeclarator(@self[].get._CArrayDeclarator.decltor)
        self[].get._CArrayDeclarator.decltor = decltor[]
        decltor[] = uptr_new()
    }
    return self
}

pub fn make_CFunDeclarator(param_list: ***struc CParam, decltor: **struc CDeclarator) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CFunDeclarator_t
    self[].get._CFunDeclarator.param_list = vec_new()
    if param_list[] ~= self[].get._CFunDeclarator.param_list {
        "@MACRO@:vec_move(*param_list, self->get._CFunDeclarator.param_list)"
        if self[].get._CFunDeclarator.param_list {
            "@MACRO@:vec_delete(self->get._CFunDeclarator.param_list)"
            loop .. while 0 {
                cast<none>((? (self[].get._CFunDeclarator.param_list) then free((cast<*struc stbds_array_header>((self[].get._CFunDeclarator.param_list)) - 1)) else cast<none>(0)))
                (self[].get._CFunDeclarator.param_list) = nil
            }
            self[].get._CFunDeclarator.param_list = vec_new()
        }
        self[].get._CFunDeclarator.param_list = param_list[]
        param_list[] = vec_new()
    }
    self[].get._CFunDeclarator.decltor = uptr_new()
    if decltor[] ~= self[].get._CFunDeclarator.decltor {
        "@MACRO@:uptr_move(CDeclarator, *decltor, self->get._CFunDeclarator.decltor)"
        free_CDeclarator(@self[].get._CFunDeclarator.decltor)
        self[].get._CFunDeclarator.decltor = decltor[]
        decltor[] = uptr_new()
    }
    return self
}

pub fn free_CDeclarator(self: **struc CDeclarator) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CDeclarator_t {
            break
        }
        -> AST_CIdent_t {
            break
        }
        -> AST_CPointerDeclarator_t {
            free_CDeclarator(@(self[])[].get._CPointerDeclarator.decltor)
        }
        break
        -> AST_CArrayDeclarator_t {
            free_CDeclarator(@(self[])[].get._CArrayDeclarator.decltor)
        }
        break
        -> AST_CFunDeclarator_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CFunDeclarator.param_list) then (cast<*struc stbds_array_header>(((self[])[].get._CFunDeclarator.param_list)) - 1)[].length else 0) .. ++i {
                free_CParam(@(self[])[].get._CFunDeclarator.param_list[i])
            }
        }
        if (self[])[].get._CFunDeclarator.param_list {
            "@MACRO@:vec_delete((*self)->get._CFunDeclarator.param_list)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CFunDeclarator.param_list) then free((cast<*struc stbds_array_header>(((self[])[].get._CFunDeclarator.param_list)) - 1)) else cast<none>(0)))
                ((self[])[].get._CFunDeclarator.param_list) = nil
            }
            (self[])[].get._CFunDeclarator.param_list = vec_new()
        }
        free_CDeclarator(@(self[])[].get._CFunDeclarator.decltor)
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

pub fn make_CExp(info_at: u64) *struc CExp {
    self: *struc CExp = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CExp, self)"
        free_CExp(@self)
        self = cast<*struc CExp>(malloc(sizeof<struc CExp>))
        if not self {
            panic_sigabrt("alloc "                 "CExp")
        }
    }
    self[].tag = AST_CExp_t
    self[].exp_type = sptr_new()
    self[].info_at = info_at
    return self
}

pub fn make_CConstant(constant: **struc CConst, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CConstant_t
    self[].get._CConstant.constant = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(CConst, *constant, self->get._CConstant.constant)"
        if constant[] ~= self[].get._CConstant.constant {
            "@MACRO@:uptr_move(CConst, *constant, self->get._CConstant.constant)"
            free_CConst(@self[].get._CConstant.constant)
            self[].get._CConstant.constant = constant[]
            constant[] = uptr_new()
        }
    }
    self[].get._CConstant._base = self
    return self
}

pub fn make_CString(literal: **struc CStringLiteral, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CString_t
    self[].get._CString.literal = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(CStringLiteral, *literal, self->get._CString.literal)"
        if literal[] ~= self[].get._CString.literal {
            "@MACRO@:uptr_move(CStringLiteral, *literal, self->get._CString.literal)"
            free_CStringLiteral(@self[].get._CString.literal)
            self[].get._CString.literal = literal[]
            literal[] = uptr_new()
        }
    }
    self[].get._CString._base = self
    return self
}

pub fn make_CVar(name: u64, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CVar_t
    self[].get._CVar.name = name
    self[].get._CVar._base = self
    return self
}

pub fn make_CCast(exp: **struc CExp, target_type: **struc Type, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CCast_t
    self[].get._CCast.exp = uptr_new()
    if exp[] ~= self[].get._CCast.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CCast.exp)"
        free_CExp(@self[].get._CCast.exp)
        self[].get._CCast.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CCast.target_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *target_type, self->get._CCast.target_type)"
        if target_type[] ~= self[].get._CCast.target_type {
            "@MACRO@:uptr_move(Type, *target_type, self->get._CCast.target_type)"
            free_Type(@self[].get._CCast.target_type)
            self[].get._CCast.target_type = target_type[]
            target_type[] = uptr_new()
        }
    }
    self[].get._CCast._base = self
    return self
}

pub fn make_CUnary(unop: *struc CUnaryOp, exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CUnary_t
    self[].get._CUnary.unop = unop[]
    self[].get._CUnary.exp = uptr_new()
    if exp[] ~= self[].get._CUnary.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CUnary.exp)"
        free_CExp(@self[].get._CUnary.exp)
        self[].get._CUnary.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CUnary._base = self
    return self
}

pub fn make_CBinary(binop: *struc CBinaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CBinary_t
    self[].get._CBinary.binop = binop[]
    self[].get._CBinary.exp_left = uptr_new()
    if exp_left[] ~= self[].get._CBinary.exp_left {
        "@MACRO@:uptr_move(CExp, *exp_left, self->get._CBinary.exp_left)"
        free_CExp(@self[].get._CBinary.exp_left)
        self[].get._CBinary.exp_left = exp_left[]
        exp_left[] = uptr_new()
    }
    self[].get._CBinary.exp_right = uptr_new()
    if exp_right[] ~= self[].get._CBinary.exp_right {
        "@MACRO@:uptr_move(CExp, *exp_right, self->get._CBinary.exp_right)"
        free_CExp(@self[].get._CBinary.exp_right)
        self[].get._CBinary.exp_right = exp_right[]
        exp_right[] = uptr_new()
    }
    self[].get._CBinary._base = self
    return self
}

pub fn make_CAssignment(unop: *struc CUnaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CAssignment_t
    self[].get._CAssignment.unop = unop[]
    self[].get._CAssignment.exp_left = uptr_new()
    if exp_left[] ~= self[].get._CAssignment.exp_left {
        "@MACRO@:uptr_move(CExp, *exp_left, self->get._CAssignment.exp_left)"
        free_CExp(@self[].get._CAssignment.exp_left)
        self[].get._CAssignment.exp_left = exp_left[]
        exp_left[] = uptr_new()
    }
    self[].get._CAssignment.exp_right = uptr_new()
    if exp_right[] ~= self[].get._CAssignment.exp_right {
        "@MACRO@:uptr_move(CExp, *exp_right, self->get._CAssignment.exp_right)"
        free_CExp(@self[].get._CAssignment.exp_right)
        self[].get._CAssignment.exp_right = exp_right[]
        exp_right[] = uptr_new()
    }
    self[].get._CAssignment._base = self
    return self
}

pub fn make_CConditional(condition: **struc CExp, exp_middle: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CConditional_t
    self[].get._CConditional.condition = uptr_new()
    if condition[] ~= self[].get._CConditional.condition {
        "@MACRO@:uptr_move(CExp, *condition, self->get._CConditional.condition)"
        free_CExp(@self[].get._CConditional.condition)
        self[].get._CConditional.condition = condition[]
        condition[] = uptr_new()
    }
    self[].get._CConditional.exp_middle = uptr_new()
    if exp_middle[] ~= self[].get._CConditional.exp_middle {
        "@MACRO@:uptr_move(CExp, *exp_middle, self->get._CConditional.exp_middle)"
        free_CExp(@self[].get._CConditional.exp_middle)
        self[].get._CConditional.exp_middle = exp_middle[]
        exp_middle[] = uptr_new()
    }
    self[].get._CConditional.exp_right = uptr_new()
    if exp_right[] ~= self[].get._CConditional.exp_right {
        "@MACRO@:uptr_move(CExp, *exp_right, self->get._CConditional.exp_right)"
        free_CExp(@self[].get._CConditional.exp_right)
        self[].get._CConditional.exp_right = exp_right[]
        exp_right[] = uptr_new()
    }
    self[].get._CConditional._base = self
    return self
}

pub fn make_CFunctionCall(name: u64, args: ***struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CFunctionCall_t
    self[].get._CFunctionCall.name = name
    self[].get._CFunctionCall.args = vec_new()
    if args[] ~= self[].get._CFunctionCall.args {
        "@MACRO@:vec_move(*args, self->get._CFunctionCall.args)"
        if self[].get._CFunctionCall.args {
            "@MACRO@:vec_delete(self->get._CFunctionCall.args)"
            loop .. while 0 {
                cast<none>((? (self[].get._CFunctionCall.args) then free((cast<*struc stbds_array_header>((self[].get._CFunctionCall.args)) - 1)) else cast<none>(0)))
                (self[].get._CFunctionCall.args) = nil
            }
            self[].get._CFunctionCall.args = vec_new()
        }
        self[].get._CFunctionCall.args = args[]
        args[] = vec_new()
    }
    self[].get._CFunctionCall._base = self
    return self
}

pub fn make_CDereference(exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CDereference_t
    self[].get._CDereference.exp = uptr_new()
    if exp[] ~= self[].get._CDereference.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CDereference.exp)"
        free_CExp(@self[].get._CDereference.exp)
        self[].get._CDereference.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CDereference._base = self
    return self
}

pub fn make_CAddrOf(exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CAddrOf_t
    self[].get._CAddrOf.exp = uptr_new()
    if exp[] ~= self[].get._CAddrOf.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CAddrOf.exp)"
        free_CExp(@self[].get._CAddrOf.exp)
        self[].get._CAddrOf.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CAddrOf._base = self
    return self
}

pub fn make_CSubscript(primary_exp: **struc CExp, subscript_exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSubscript_t
    self[].get._CSubscript.primary_exp = uptr_new()
    if primary_exp[] ~= self[].get._CSubscript.primary_exp {
        "@MACRO@:uptr_move(CExp, *primary_exp, self->get._CSubscript.primary_exp)"
        free_CExp(@self[].get._CSubscript.primary_exp)
        self[].get._CSubscript.primary_exp = primary_exp[]
        primary_exp[] = uptr_new()
    }
    self[].get._CSubscript.subscript_exp = uptr_new()
    if subscript_exp[] ~= self[].get._CSubscript.subscript_exp {
        "@MACRO@:uptr_move(CExp, *subscript_exp, self->get._CSubscript.subscript_exp)"
        free_CExp(@self[].get._CSubscript.subscript_exp)
        self[].get._CSubscript.subscript_exp = subscript_exp[]
        subscript_exp[] = uptr_new()
    }
    self[].get._CSubscript._base = self
    return self
}

pub fn make_CSizeOf(exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSizeOf_t
    self[].get._CSizeOf.exp = uptr_new()
    if exp[] ~= self[].get._CSizeOf.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CSizeOf.exp)"
        free_CExp(@self[].get._CSizeOf.exp)
        self[].get._CSizeOf.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CSizeOf._base = self
    return self
}

pub fn make_CSizeOfT(target_type: **struc Type, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSizeOfT_t
    self[].get._CSizeOfT.target_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *target_type, self->get._CSizeOfT.target_type)"
        if target_type[] ~= self[].get._CSizeOfT.target_type {
            "@MACRO@:uptr_move(Type, *target_type, self->get._CSizeOfT.target_type)"
            free_Type(@self[].get._CSizeOfT.target_type)
            self[].get._CSizeOfT.target_type = target_type[]
            target_type[] = uptr_new()
        }
    }
    self[].get._CSizeOfT._base = self
    return self
}

pub fn make_CDot(member: u64, structure: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CDot_t
    self[].get._CDot.member = member
    self[].get._CDot.structure = uptr_new()
    if structure[] ~= self[].get._CDot.structure {
        "@MACRO@:uptr_move(CExp, *structure, self->get._CDot.structure)"
        free_CExp(@self[].get._CDot.structure)
        self[].get._CDot.structure = structure[]
        structure[] = uptr_new()
    }
    self[].get._CDot._base = self
    return self
}

pub fn make_CArrow(member: u64, pointer: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CArrow_t
    self[].get._CArrow.member = member
    self[].get._CArrow.pointer = uptr_new()
    if pointer[] ~= self[].get._CArrow.pointer {
        "@MACRO@:uptr_move(CExp, *pointer, self->get._CArrow.pointer)"
        free_CExp(@self[].get._CArrow.pointer)
        self[].get._CArrow.pointer = pointer[]
        pointer[] = uptr_new()
    }
    self[].get._CArrow._base = self
    return self
}

pub fn free_CExp(self: **struc CExp) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CExp_t {
            break
        }
        -> AST_CConstant_t {
            free_CConst(@(self[])[].get._CConstant.constant)
        }
        break
        -> AST_CString_t {
            free_CStringLiteral(@(self[])[].get._CString.literal)
        }
        break
        -> AST_CVar_t {
            break
        }
        -> AST_CCast_t {
            free_CExp(@(self[])[].get._CCast.exp)
        }
        free_Type(@(self[])[].get._CCast.target_type)
        break
        -> AST_CUnary_t {
            free_CExp(@(self[])[].get._CUnary.exp)
        }
        break
        -> AST_CBinary_t {
            free_CExp(@(self[])[].get._CBinary.exp_left)
        }
        free_CExp(@(self[])[].get._CBinary.exp_right)
        break
        -> AST_CAssignment_t {
            free_CExp(@(self[])[].get._CAssignment.exp_left)
        }
        free_CExp(@(self[])[].get._CAssignment.exp_right)
        break
        -> AST_CConditional_t {
            free_CExp(@(self[])[].get._CConditional.condition)
        }
        free_CExp(@(self[])[].get._CConditional.exp_middle)
        free_CExp(@(self[])[].get._CConditional.exp_right)
        break
        -> AST_CFunctionCall_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CFunctionCall.args) then (cast<*struc stbds_array_header>(((self[])[].get._CFunctionCall.args)) - 1)[].length else 0) .. ++i {
                free_CExp(@(self[])[].get._CFunctionCall.args[i])
            }
        }
        if (self[])[].get._CFunctionCall.args {
            "@MACRO@:vec_delete((*self)->get._CFunctionCall.args)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CFunctionCall.args) then free((cast<*struc stbds_array_header>(((self[])[].get._CFunctionCall.args)) - 1)) else cast<none>(0)))
                ((self[])[].get._CFunctionCall.args) = nil
            }
            (self[])[].get._CFunctionCall.args = vec_new()
        }
        break
        -> AST_CDereference_t {
            free_CExp(@(self[])[].get._CDereference.exp)
        }
        break
        -> AST_CAddrOf_t {
            free_CExp(@(self[])[].get._CAddrOf.exp)
        }
        break
        -> AST_CSubscript_t {
            free_CExp(@(self[])[].get._CSubscript.primary_exp)
        }
        free_CExp(@(self[])[].get._CSubscript.subscript_exp)
        break
        -> AST_CSizeOf_t {
            free_CExp(@(self[])[].get._CSizeOf.exp)
        }
        break
        -> AST_CSizeOfT_t {
            free_Type(@(self[])[].get._CSizeOfT.target_type)
        }
        break
        -> AST_CDot_t {
            free_CExp(@(self[])[].get._CDot.structure)
        }
        break
        -> AST_CArrow_t {
            free_CExp(@(self[])[].get._CArrow.pointer)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].exp_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CStatement(none) *struc CStatement {
    self: *struc CStatement = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CStatement, self)"
        free_CStatement(@self)
        self = cast<*struc CStatement>(malloc(sizeof<struc CStatement>))
        if not self {
            panic_sigabrt("alloc "                 "CStatement")
        }
    }
    self[].tag = AST_CStatement_t
    return self
}

pub fn make_CReturn(exp: **struc CExp, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CReturn_t
    self[].get._CReturn.exp = uptr_new()
    if exp[] ~= self[].get._CReturn.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CReturn.exp)"
        free_CExp(@self[].get._CReturn.exp)
        self[].get._CReturn.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CReturn.info_at = info_at
    return self
}

pub fn make_CExpression(exp: **struc CExp) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CExpression_t
    self[].get._CExpression.exp = uptr_new()
    if exp[] ~= self[].get._CExpression.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CExpression.exp)"
        free_CExp(@self[].get._CExpression.exp)
        self[].get._CExpression.exp = exp[]
        exp[] = uptr_new()
    }
    return self
}

pub fn make_CIf(condition: **struc CExp, then_fi: **struc CStatement, else_fi: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CIf_t
    self[].get._CIf.condition = uptr_new()
    if condition[] ~= self[].get._CIf.condition {
        "@MACRO@:uptr_move(CExp, *condition, self->get._CIf.condition)"
        free_CExp(@self[].get._CIf.condition)
        self[].get._CIf.condition = condition[]
        condition[] = uptr_new()
    }
    self[].get._CIf.then_fi = uptr_new()
    if then_fi[] ~= self[].get._CIf.then_fi {
        "@MACRO@:uptr_move(CStatement, *then_fi, self->get._CIf.then_fi)"
        free_CStatement(@self[].get._CIf.then_fi)
        self[].get._CIf.then_fi = then_fi[]
        then_fi[] = uptr_new()
    }
    self[].get._CIf.else_fi = uptr_new()
    if else_fi[] ~= self[].get._CIf.else_fi {
        "@MACRO@:uptr_move(CStatement, *else_fi, self->get._CIf.else_fi)"
        free_CStatement(@self[].get._CIf.else_fi)
        self[].get._CIf.else_fi = else_fi[]
        else_fi[] = uptr_new()
    }
    return self
}

pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CGoto_t
    self[].get._CGoto.target = target
    self[].get._CGoto.info_at = info_at
    return self
}

pub fn make_CLabel(target: u64, jump_to: **struc CStatement, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CLabel_t
    self[].get._CLabel.target = target
    self[].get._CLabel.jump_to = uptr_new()
    if jump_to[] ~= self[].get._CLabel.jump_to {
        "@MACRO@:uptr_move(CStatement, *jump_to, self->get._CLabel.jump_to)"
        free_CStatement(@self[].get._CLabel.jump_to)
        self[].get._CLabel.jump_to = jump_to[]
        jump_to[] = uptr_new()
    }
    self[].get._CLabel.info_at = info_at
    return self
}

pub fn make_CCompound(block: **struc CBlock) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CCompound_t
    self[].get._CCompound.block = uptr_new()
    if block[] ~= self[].get._CCompound.block {
        "@MACRO@:uptr_move(CBlock, *block, self->get._CCompound.block)"
        free_CBlock(@self[].get._CCompound.block)
        self[].get._CCompound.block = block[]
        block[] = uptr_new()
    }
    return self
}

pub fn make_CWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CWhile_t
    self[].get._CWhile.target = 0
    self[].get._CWhile.condition = uptr_new()
    if condition[] ~= self[].get._CWhile.condition {
        "@MACRO@:uptr_move(CExp, *condition, self->get._CWhile.condition)"
        free_CExp(@self[].get._CWhile.condition)
        self[].get._CWhile.condition = condition[]
        condition[] = uptr_new()
    }
    self[].get._CWhile.body = uptr_new()
    if body[] ~= self[].get._CWhile.body {
        "@MACRO@:uptr_move(CStatement, *body, self->get._CWhile.body)"
        free_CStatement(@self[].get._CWhile.body)
        self[].get._CWhile.body = body[]
        body[] = uptr_new()
    }
    return self
}

pub fn make_CDoWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CDoWhile_t
    self[].get._CDoWhile.target = 0
    self[].get._CDoWhile.condition = uptr_new()
    if condition[] ~= self[].get._CDoWhile.condition {
        "@MACRO@:uptr_move(CExp, *condition, self->get._CDoWhile.condition)"
        free_CExp(@self[].get._CDoWhile.condition)
        self[].get._CDoWhile.condition = condition[]
        condition[] = uptr_new()
    }
    self[].get._CDoWhile.body = uptr_new()
    if body[] ~= self[].get._CDoWhile.body {
        "@MACRO@:uptr_move(CStatement, *body, self->get._CDoWhile.body)"
        free_CStatement(@self[].get._CDoWhile.body)
        self[].get._CDoWhile.body = body[]
        body[] = uptr_new()
    }
    return self
}

pub fn make_CFor(init: **struc CForInit, condition: **struc CExp, post: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CFor_t
    self[].get._CFor.target = 0
    self[].get._CFor.init = uptr_new()
    if init[] ~= self[].get._CFor.init {
        "@MACRO@:uptr_move(CForInit, *init, self->get._CFor.init)"
        free_CForInit(@self[].get._CFor.init)
        self[].get._CFor.init = init[]
        init[] = uptr_new()
    }
    self[].get._CFor.condition = uptr_new()
    if condition[] ~= self[].get._CFor.condition {
        "@MACRO@:uptr_move(CExp, *condition, self->get._CFor.condition)"
        free_CExp(@self[].get._CFor.condition)
        self[].get._CFor.condition = condition[]
        condition[] = uptr_new()
    }
    self[].get._CFor.post = uptr_new()
    if post[] ~= self[].get._CFor.post {
        "@MACRO@:uptr_move(CExp, *post, self->get._CFor.post)"
        free_CExp(@self[].get._CFor.post)
        self[].get._CFor.post = post[]
        post[] = uptr_new()
    }
    self[].get._CFor.body = uptr_new()
    if body[] ~= self[].get._CFor.body {
        "@MACRO@:uptr_move(CStatement, *body, self->get._CFor.body)"
        free_CStatement(@self[].get._CFor.body)
        self[].get._CFor.body = body[]
        body[] = uptr_new()
    }
    return self
}

pub fn make_CSwitch(lookup: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CSwitch_t
    self[].get._CSwitch.target = 0
    self[].get._CSwitch.is_default = false
    self[].get._CSwitch.lookup = uptr_new()
    if lookup[] ~= self[].get._CSwitch.lookup {
        "@MACRO@:uptr_move(CExp, *lookup, self->get._CSwitch.lookup)"
        free_CExp(@self[].get._CSwitch.lookup)
        self[].get._CSwitch.lookup = lookup[]
        lookup[] = uptr_new()
    }
    self[].get._CSwitch.body = uptr_new()
    if body[] ~= self[].get._CSwitch.body {
        "@MACRO@:uptr_move(CStatement, *body, self->get._CSwitch.body)"
        free_CStatement(@self[].get._CSwitch.body)
        self[].get._CSwitch.body = body[]
        body[] = uptr_new()
    }
    self[].get._CSwitch.cases = vec_new()
    return self
}

pub fn make_CCase(value: **struc CExp, jump_to: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CCase_t
    self[].get._CCase.target = 0
    self[].get._CCase.value = uptr_new()
    if value[] ~= self[].get._CCase.value {
        "@MACRO@:uptr_move(CExp, *value, self->get._CCase.value)"
        free_CExp(@self[].get._CCase.value)
        self[].get._CCase.value = value[]
        value[] = uptr_new()
    }
    self[].get._CCase.jump_to = uptr_new()
    if jump_to[] ~= self[].get._CCase.jump_to {
        "@MACRO@:uptr_move(CStatement, *jump_to, self->get._CCase.jump_to)"
        free_CStatement(@self[].get._CCase.jump_to)
        self[].get._CCase.jump_to = jump_to[]
        jump_to[] = uptr_new()
    }
    return self
}

pub fn make_CDefault(jump_to: **struc CStatement, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CDefault_t
    self[].get._CDefault.target = 0
    self[].get._CDefault.jump_to = uptr_new()
    if jump_to[] ~= self[].get._CDefault.jump_to {
        "@MACRO@:uptr_move(CStatement, *jump_to, self->get._CDefault.jump_to)"
        free_CStatement(@self[].get._CDefault.jump_to)
        self[].get._CDefault.jump_to = jump_to[]
        jump_to[] = uptr_new()
    }
    self[].get._CDefault.info_at = info_at
    return self
}

pub fn make_CBreak(info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CBreak_t
    self[].get._CBreak.target = 0
    self[].get._CBreak.info_at = info_at
    return self
}

pub fn make_CContinue(info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CContinue_t
    self[].get._CContinue.target = 0
    self[].get._CContinue.info_at = info_at
    return self
}

pub fn make_CNull(none) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CNull_t
    return self
}

pub fn free_CStatement(self: **struc CStatement) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CStatement_t {
            break
        }
        -> AST_CReturn_t {
            free_CExp(@(self[])[].get._CReturn.exp)
        }
        break
        -> AST_CExpression_t {
            free_CExp(@(self[])[].get._CExpression.exp)
        }
        break
        -> AST_CIf_t {
            free_CExp(@(self[])[].get._CIf.condition)
        }
        free_CStatement(@(self[])[].get._CIf.then_fi)
        free_CStatement(@(self[])[].get._CIf.else_fi)
        break
        -> AST_CGoto_t {
            break
        }
        -> AST_CLabel_t {
            free_CStatement(@(self[])[].get._CLabel.jump_to)
        }
        break
        -> AST_CCompound_t {
            free_CBlock(@(self[])[].get._CCompound.block)
        }
        break
        -> AST_CWhile_t {
            free_CExp(@(self[])[].get._CWhile.condition)
        }
        free_CStatement(@(self[])[].get._CWhile.body)
        break
        -> AST_CDoWhile_t {
            free_CExp(@(self[])[].get._CDoWhile.condition)
        }
        free_CStatement(@(self[])[].get._CDoWhile.body)
        break
        -> AST_CFor_t {
            free_CForInit(@(self[])[].get._CFor.init)
        }
        free_CExp(@(self[])[].get._CFor.condition)
        free_CExp(@(self[])[].get._CFor.post)
        free_CStatement(@(self[])[].get._CFor.body)
        break
        -> AST_CSwitch_t {
            free_CExp(@(self[])[].get._CSwitch.lookup)
        }
        free_CStatement(@(self[])[].get._CSwitch.body)
        loop i: u64 = 0 while i < (? ((self[])[].get._CSwitch.cases) then (cast<*struc stbds_array_header>(((self[])[].get._CSwitch.cases)) - 1)[].length else 0) .. ++i {
            free_CExp(@(self[])[].get._CSwitch.cases[i])
        }
        if (self[])[].get._CSwitch.cases {
            "@MACRO@:vec_delete((*self)->get._CSwitch.cases)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CSwitch.cases) then free((cast<*struc stbds_array_header>(((self[])[].get._CSwitch.cases)) - 1)) else cast<none>(0)))
                ((self[])[].get._CSwitch.cases) = nil
            }
            (self[])[].get._CSwitch.cases = vec_new()
        }
        break
        -> AST_CCase_t {
            free_CExp(@(self[])[].get._CCase.value)
        }
        free_CStatement(@(self[])[].get._CCase.jump_to)
        break
        -> AST_CDefault_t {
            free_CStatement(@(self[])[].get._CDefault.jump_to)
        }
        break
        -> AST_CBreak_t {
            break
        }
        -> AST_CContinue_t {
            break
        }
        -> AST_CNull_t {
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

pub fn make_CForInit(none) *struc CForInit {
    self: *struc CForInit = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CForInit, self)"
        free_CForInit(@self)
        self = cast<*struc CForInit>(malloc(sizeof<struc CForInit>))
        if not self {
            panic_sigabrt("alloc "                 "CForInit")
        }
    }
    self[].tag = AST_CForInit_t
    return self
}

pub fn make_CInitDecl(init: **struc CVariableDeclaration) *struc CForInit {
    self: *struc CForInit = make_CForInit()
    self[].tag = AST_CInitDecl_t
    self[].get._CInitDecl.init = uptr_new()
    if init[] ~= self[].get._CInitDecl.init {
        "@MACRO@:uptr_move(CVariableDeclaration, *init, self->get._CInitDecl.init)"
        free_CVariableDeclaration(@self[].get._CInitDecl.init)
        self[].get._CInitDecl.init = init[]
        init[] = uptr_new()
    }
    return self
}

pub fn make_CInitExp(init: **struc CExp) *struc CForInit {
    self: *struc CForInit = make_CForInit()
    self[].tag = AST_CInitExp_t
    self[].get._CInitExp.init = uptr_new()
    if init[] ~= self[].get._CInitExp.init {
        "@MACRO@:uptr_move(CExp, *init, self->get._CInitExp.init)"
        free_CExp(@self[].get._CInitExp.init)
        self[].get._CInitExp.init = init[]
        init[] = uptr_new()
    }
    return self
}

pub fn free_CForInit(self: **struc CForInit) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CForInit_t {
            break
        }
        -> AST_CInitDecl_t {
            free_CVariableDeclaration(@(self[])[].get._CInitDecl.init)
        }
        break
        -> AST_CInitExp_t {
            free_CExp(@(self[])[].get._CInitExp.init)
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

pub fn make_CBlock(none) *struc CBlock {
    self: *struc CBlock = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CBlock, self)"
        free_CBlock(@self)
        self = cast<*struc CBlock>(malloc(sizeof<struc CBlock>))
        if not self {
            panic_sigabrt("alloc "                 "CBlock")
        }
    }
    self[].tag = AST_CBlock_t
    return self
}

pub fn make_CB(block_items: ***struc CBlockItem) *struc CBlock {
    self: *struc CBlock = make_CBlock()
    self[].tag = AST_CB_t
    self[].get._CB.block_items = vec_new()
    if block_items[] ~= self[].get._CB.block_items {
        "@MACRO@:vec_move(*block_items, self->get._CB.block_items)"
        if self[].get._CB.block_items {
            "@MACRO@:vec_delete(self->get._CB.block_items)"
            loop .. while 0 {
                cast<none>((? (self[].get._CB.block_items) then free((cast<*struc stbds_array_header>((self[].get._CB.block_items)) - 1)) else cast<none>(0)))
                (self[].get._CB.block_items) = nil
            }
            self[].get._CB.block_items = vec_new()
        }
        self[].get._CB.block_items = block_items[]
        block_items[] = vec_new()
    }
    return self
}

pub fn free_CBlock(self: **struc CBlock) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CBlock_t {
            break
        }
        -> AST_CB_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CB.block_items) then (cast<*struc stbds_array_header>(((self[])[].get._CB.block_items)) - 1)[].length else 0) .. ++i {
                free_CBlockItem(@(self[])[].get._CB.block_items[i])
            }
        }
        if (self[])[].get._CB.block_items {
            "@MACRO@:vec_delete((*self)->get._CB.block_items)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CB.block_items) then free((cast<*struc stbds_array_header>(((self[])[].get._CB.block_items)) - 1)) else cast<none>(0)))
                ((self[])[].get._CB.block_items) = nil
            }
            (self[])[].get._CB.block_items = vec_new()
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

pub fn make_CBlockItem(none) *struc CBlockItem {
    self: *struc CBlockItem = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CBlockItem, self)"
        free_CBlockItem(@self)
        self = cast<*struc CBlockItem>(malloc(sizeof<struc CBlockItem>))
        if not self {
            panic_sigabrt("alloc "                 "CBlockItem")
        }
    }
    self[].tag = AST_CBlockItem_t
    return self
}

pub fn make_CS(statement: **struc CStatement) *struc CBlockItem {
    self: *struc CBlockItem = make_CBlockItem()
    self[].tag = AST_CS_t
    self[].get._CS.statement = uptr_new()
    if statement[] ~= self[].get._CS.statement {
        "@MACRO@:uptr_move(CStatement, *statement, self->get._CS.statement)"
        free_CStatement(@self[].get._CS.statement)
        self[].get._CS.statement = statement[]
        statement[] = uptr_new()
    }
    return self
}

pub fn make_CD(declaration: **struc CDeclaration) *struc CBlockItem {
    self: *struc CBlockItem = make_CBlockItem()
    self[].tag = AST_CD_t
    self[].get._CD.declaration = uptr_new()
    if declaration[] ~= self[].get._CD.declaration {
        "@MACRO@:uptr_move(CDeclaration, *declaration, self->get._CD.declaration)"
        free_CDeclaration(@self[].get._CD.declaration)
        self[].get._CD.declaration = declaration[]
        declaration[] = uptr_new()
    }
    return self
}

pub fn free_CBlockItem(self: **struc CBlockItem) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CBlockItem_t {
            break
        }
        -> AST_CS_t {
            free_CStatement(@(self[])[].get._CS.statement)
        }
        break
        -> AST_CD_t {
            free_CDeclaration(@(self[])[].get._CD.declaration)
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

pub fn make_CStorageClass(tag: i32) struc CStorageClass {
    self: struc CStorageClass = $(tag)
    match tag {
        -> AST_CStorageClass_t {
            -> AST_CStatic_t {
                -> AST_CExtern_t {
                    return self
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_CInitializer(none) *struc CInitializer {
    self: *struc CInitializer = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CInitializer, self)"
        free_CInitializer(@self)
        self = cast<*struc CInitializer>(malloc(sizeof<struc CInitializer>))
        if not self {
            panic_sigabrt("alloc "                 "CInitializer")
        }
    }
    self[].tag = AST_CInitializer_t
    self[].init_type = sptr_new()
    return self
}

pub fn make_CSingleInit(exp: **struc CExp) *struc CInitializer {
    self: *struc CInitializer = make_CInitializer()
    self[].tag = AST_CSingleInit_t
    self[].get._CSingleInit.exp = uptr_new()
    if exp[] ~= self[].get._CSingleInit.exp {
        "@MACRO@:uptr_move(CExp, *exp, self->get._CSingleInit.exp)"
        free_CExp(@self[].get._CSingleInit.exp)
        self[].get._CSingleInit.exp = exp[]
        exp[] = uptr_new()
    }
    self[].get._CSingleInit._base = self
    return self
}

pub fn make_CCompoundInit(initializers: ***struc CInitializer) *struc CInitializer {
    self: *struc CInitializer = make_CInitializer()
    self[].tag = AST_CCompoundInit_t
    self[].get._CCompoundInit.initializers = vec_new()
    if initializers[] ~= self[].get._CCompoundInit.initializers {
        "@MACRO@:vec_move(*initializers, self->get._CCompoundInit.initializers)"
        if self[].get._CCompoundInit.initializers {
            "@MACRO@:vec_delete(self->get._CCompoundInit.initializers)"
            loop .. while 0 {
                cast<none>((? (self[].get._CCompoundInit.initializers) then free((cast<*struc stbds_array_header>((self[].get._CCompoundInit.initializers)) - 1)) else cast<none>(0)))
                (self[].get._CCompoundInit.initializers) = nil
            }
            self[].get._CCompoundInit.initializers = vec_new()
        }
        self[].get._CCompoundInit.initializers = initializers[]
        initializers[] = vec_new()
    }
    self[].get._CCompoundInit._base = self
    return self
}

pub fn free_CInitializer(self: **struc CInitializer) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CInitializer_t {
            break
        }
        -> AST_CSingleInit_t {
            free_CExp(@(self[])[].get._CSingleInit.exp)
        }
        break
        -> AST_CCompoundInit_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CCompoundInit.initializers) then (cast<*struc stbds_array_header>(((self[])[].get._CCompoundInit.initializers)) - 1)[].length else 0) .. ++i {
                free_CInitializer(@(self[])[].get._CCompoundInit.initializers[i])
            }
        }
        if (self[])[].get._CCompoundInit.initializers {
            "@MACRO@:vec_delete((*self)->get._CCompoundInit.initializers)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CCompoundInit.initializers) then free((cast<*struc stbds_array_header>(((self[])[].get._CCompoundInit.initializers)) - 1)) else cast<none>(0)))
                ((self[])[].get._CCompoundInit.initializers) = nil
            }
            (self[])[].get._CCompoundInit.initializers = vec_new()
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].init_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration {
    self: *struc CMemberDeclaration = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CMemberDeclaration, self)"
        free_CMemberDeclaration(@self)
        self = cast<*struc CMemberDeclaration>(malloc(sizeof<struc CMemberDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CMemberDeclaration")
        }
    }
    self[].tag = AST_CMemberDeclaration_t
    self[].member_name = member_name
    self[].member_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *member_type, self->member_type)"
        if member_type[] ~= self[].member_type {
            "@MACRO@:uptr_move(Type, *member_type, self->member_type)"
            free_Type(@self[].member_type)
            self[].member_type = member_type[]
            member_type[] = uptr_new()
        }
    }
    self[].info_at = info_at
    return self
}

pub fn free_CMemberDeclaration(self: **struc CMemberDeclaration) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CMemberDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].member_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CStructDeclaration(tag_name: u64, is_union: i32, members: ***struc CMemberDeclaration, info_at: u64) *struc CStructDeclaration {
    self: *struc CStructDeclaration = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CStructDeclaration, self)"
        free_CStructDeclaration(@self)
        self = cast<*struc CStructDeclaration>(malloc(sizeof<struc CStructDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CStructDeclaration")
        }
    }
    self[].tag = AST_CStructDeclaration_t
    self[].tag_name = tag_name
    self[].is_union = is_union
    self[].members = vec_new()
    if members[] ~= self[].members {
        "@MACRO@:vec_move(*members, self->members)"
        if self[].members {
            "@MACRO@:vec_delete(self->members)"
            loop .. while 0 {
                cast<none>((? (self[].members) then free((cast<*struc stbds_array_header>((self[].members)) - 1)) else cast<none>(0)))
                (self[].members) = nil
            }
            self[].members = vec_new()
        }
        self[].members = members[]
        members[] = vec_new()
    }
    self[].info_at = info_at
    return self
}

pub fn free_CStructDeclaration(self: **struc CStructDeclaration) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CStructDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].members) then (cast<*struc stbds_array_header>(((self[])[].members)) - 1)[].length else 0) .. ++i {
        free_CMemberDeclaration(@(self[])[].members[i])
    }
    if (self[])[].members {
        "@MACRO@:vec_delete((*self)->members)"
        loop .. while 0 {
            cast<none>((? ((self[])[].members) then free((cast<*struc stbds_array_header>(((self[])[].members)) - 1)) else cast<none>(0)))
            ((self[])[].members) = nil
        }
        (self[])[].members = vec_new()
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CFunctionDeclaration(name: u64, params: **u64, body: **struc CBlock, fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration {
    self: *struc CFunctionDeclaration = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CFunctionDeclaration, self)"
        free_CFunctionDeclaration(@self)
        self = cast<*struc CFunctionDeclaration>(malloc(sizeof<struc CFunctionDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CFunctionDeclaration")
        }
    }
    self[].tag = AST_CFunctionDeclaration_t
    self[].name = name
    self[].params = vec_new()
    if params[] ~= self[].params {
        "@MACRO@:vec_move(*params, self->params)"
        if self[].params {
            "@MACRO@:vec_delete(self->params)"
            loop .. while 0 {
                cast<none>((? (self[].params) then free((cast<*struc stbds_array_header>((self[].params)) - 1)) else cast<none>(0)))
                (self[].params) = nil
            }
            self[].params = vec_new()
        }
        self[].params = params[]
        params[] = vec_new()
    }
    self[].body = uptr_new()
    if body[] ~= self[].body {
        "@MACRO@:uptr_move(CBlock, *body, self->body)"
        free_CBlock(@self[].body)
        self[].body = body[]
        body[] = uptr_new()
    }
    self[].fun_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *fun_type, self->fun_type)"
        if fun_type[] ~= self[].fun_type {
            "@MACRO@:uptr_move(Type, *fun_type, self->fun_type)"
            free_Type(@self[].fun_type)
            self[].fun_type = fun_type[]
            fun_type[] = uptr_new()
        }
    }
    self[].storage_class = storage_class[]
    self[].info_at = info_at
    return self
}

pub fn free_CFunctionDeclaration(self: **struc CFunctionDeclaration) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CFunctionDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if (self[])[].params {
        "@MACRO@:vec_delete((*self)->params)"
        loop .. while 0 {
            cast<none>((? ((self[])[].params) then free((cast<*struc stbds_array_header>(((self[])[].params)) - 1)) else cast<none>(0)))
            ((self[])[].params) = nil
        }
        (self[])[].params = vec_new()
    }
    free_CBlock(@(self[])[].body)
    free_Type(@(self[])[].fun_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CVariableDeclaration(name: u64, init: **struc CInitializer, var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration {
    self: *struc CVariableDeclaration = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CVariableDeclaration, self)"
        free_CVariableDeclaration(@self)
        self = cast<*struc CVariableDeclaration>(malloc(sizeof<struc CVariableDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CVariableDeclaration")
        }
    }
    self[].tag = AST_CVariableDeclaration_t
    self[].name = name
    self[].init = uptr_new()
    if init[] ~= self[].init {
        "@MACRO@:uptr_move(CInitializer, *init, self->init)"
        free_CInitializer(@self[].init)
        self[].init = init[]
        init[] = uptr_new()
    }
    self[].var_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *var_type, self->var_type)"
        if var_type[] ~= self[].var_type {
            "@MACRO@:uptr_move(Type, *var_type, self->var_type)"
            free_Type(@self[].var_type)
            self[].var_type = var_type[]
            var_type[] = uptr_new()
        }
    }
    self[].storage_class = storage_class[]
    self[].info_at = info_at
    return self
}

pub fn free_CVariableDeclaration(self: **struc CVariableDeclaration) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CVariableDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_CInitializer(@(self[])[].init)
    free_Type(@(self[])[].var_type)
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_CDeclaration(none) *struc CDeclaration {
    self: *struc CDeclaration = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CDeclaration, self)"
        free_CDeclaration(@self)
        self = cast<*struc CDeclaration>(malloc(sizeof<struc CDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CDeclaration")
        }
    }
    self[].tag = AST_CDeclaration_t
    return self
}

pub fn make_CFunDecl(fun_decl: **struc CFunctionDeclaration) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CFunDecl_t
    self[].get._CFunDecl.fun_decl = uptr_new()
    if fun_decl[] ~= self[].get._CFunDecl.fun_decl {
        "@MACRO@:uptr_move(CFunctionDeclaration, *fun_decl, self->get._CFunDecl.fun_decl)"
        free_CFunctionDeclaration(@self[].get._CFunDecl.fun_decl)
        self[].get._CFunDecl.fun_decl = fun_decl[]
        fun_decl[] = uptr_new()
    }
    return self
}

pub fn make_CVarDecl(var_decl: **struc CVariableDeclaration) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CVarDecl_t
    self[].get._CVarDecl.var_decl = uptr_new()
    if var_decl[] ~= self[].get._CVarDecl.var_decl {
        "@MACRO@:uptr_move(CVariableDeclaration, *var_decl, self->get._CVarDecl.var_decl)"
        free_CVariableDeclaration(@self[].get._CVarDecl.var_decl)
        self[].get._CVarDecl.var_decl = var_decl[]
        var_decl[] = uptr_new()
    }
    return self
}

pub fn make_CStructDecl(struct_decl: **struc CStructDeclaration) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CStructDecl_t
    self[].get._CStructDecl.struct_decl = uptr_new()
    if struct_decl[] ~= self[].get._CStructDecl.struct_decl {
        "@MACRO@:uptr_move(CStructDeclaration, *struct_decl, self->get._CStructDecl.struct_decl)"
        free_CStructDeclaration(@self[].get._CStructDecl.struct_decl)
        self[].get._CStructDecl.struct_decl = struct_decl[]
        struct_decl[] = uptr_new()
    }
    return self
}

pub fn free_CDeclaration(self: **struc CDeclaration) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CDeclaration_t {
            break
        }
        -> AST_CFunDecl_t {
            free_CFunctionDeclaration(@(self[])[].get._CFunDecl.fun_decl)
        }
        break
        -> AST_CVarDecl_t {
            free_CVariableDeclaration(@(self[])[].get._CVarDecl.var_decl)
        }
        break
        -> AST_CStructDecl_t {
            free_CStructDeclaration(@(self[])[].get._CStructDecl.struct_decl)
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

pub fn make_CProgram(declarations: ***struc CDeclaration) *struc CProgram {
    self: *struc CProgram = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(CProgram, self)"
        free_CProgram(@self)
        self = cast<*struc CProgram>(malloc(sizeof<struc CProgram>))
        if not self {
            panic_sigabrt("alloc "                 "CProgram")
        }
    }
    self[].tag = AST_CProgram_t
    self[].declarations = vec_new()
    if declarations[] ~= self[].declarations {
        "@MACRO@:vec_move(*declarations, self->declarations)"
        if self[].declarations {
            "@MACRO@:vec_delete(self->declarations)"
            loop .. while 0 {
                cast<none>((? (self[].declarations) then free((cast<*struc stbds_array_header>((self[].declarations)) - 1)) else cast<none>(0)))
                (self[].declarations) = nil
            }
            self[].declarations = vec_new()
        }
        self[].declarations = declarations[]
        declarations[] = vec_new()
    }
    return self
}

pub fn free_CProgram(self: **struc CProgram) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_CProgram_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].declarations) then (cast<*struc stbds_array_header>(((self[])[].declarations)) - 1)[].length else 0) .. ++i {
        free_CDeclaration(@(self[])[].declarations[i])
    }
    if (self[])[].declarations {
        "@MACRO@:vec_delete((*self)->declarations)"
        loop .. while 0 {
            cast<none>((? ((self[])[].declarations) then free((cast<*struc stbds_array_header>(((self[])[].declarations)) - 1)) else cast<none>(0)))
            ((self[])[].declarations) = nil
        }
        (self[])[].declarations = vec_new()
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}
