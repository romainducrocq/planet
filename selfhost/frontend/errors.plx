extrn fn strtoimax(nptr: string, endptr: *string, base: i32) i64;
extrn fn strtoumax(nptr: string, endptr: *string, base: i32) u64;
type struc FILE;
extrn fn fclose(stream: *struc FILE) i32;
extrn fn fflush(stream: *struc FILE) i32;
extrn fn fopen(filename: string, mode: string) *struc FILE;
extrn fn fwrite(ptr: *any, size: u64, nmemb: u64, stream: *struc FILE) u64;
extrn fn printf(format: string, arg1: string) i32;
extrn fn snprintf(s: string, n: u64, format: string, arg1: string, arg2: string, arg3: string, arg4: string) i32;
extrn fn sprintf(s: string, format: string, arg1: u32) i32;
extrn fn getline(lineptr: *string, n: *u64, stream: *struc FILE) i64;
extrn fn write(fildes: i32, buf: *any, nbyte: u64) i64;
extrn fn strtod(nptr: string, endptr: *string) f64;
extrn fn strtol(nptr: string, endptr: *string, base: i32) i64;
extrn fn free(ptr: *any) none;
extrn fn malloc(size: u64) *any;
extrn fn realloc(ptr: *any, size: u64) *any;
extrn fn abort(none) none;
extrn fn memcpy(s1: *any, s2: *any, n: u64) *any;
extrn fn memmove(s1: *any, s2: *any, n: u64) *any;
extrn fn memcmp(s1: *any, s2: *any, n: u64) i32;
extrn fn strcmp(s1: string, s2: string) i32;
extrn fn memset(s: *any, c: i32, n: u64) *any;
extrn fn strlen(s: string) u64;
pub fn sdslen(s: string) u64;
pub fn sdsnew(init: string) string;
pub fn sdsdup(s: string) string;
pub fn sdsfree(s: string) none;
pub fn sdsgrowzero(s: string, len: u64) string;
pub fn sdscat(s: string, t: string) string;
pub fn sdsrange(s: string, start: i64, end: i64) none;
pub fn sdsclear(s: string) none;
pub fn sdsfromlong(value: i64) string;
pub fn sdsfromunsignedlong(value: u64) string;
pub fn sdsMakeRoomFor(s: string, addlen: u64) string;
type struc stbds_array_header(    length: u64    , capacity: u64    , hash_table: *any    , temp: i64    )
extrn fn stbds_hash_string(str: string, seed: u64) u64;
extrn fn stbds_arrgrowf(a: *any, elemsize: u64, addlen: u64, min_cap: u64) *any;
extrn fn stbds_hmfree_func(p: *any, elemsize: u64) none;
extrn fn stbds_hmget_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmput_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmdel_key(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32) *any;

type struc Token;
type struc FunType;
type struc Pointer;
type struc Array;
type struc Structure;
type struc Type;
type struc CConst;
type struc CUnaryOp;
type struc CBinaryOp;
type struc CStorageClass;
type struc IdentifierContext;
pub fn get_tok_kind_fmt(tok_kind: i32) string;
pub fn get_tok_fmt(ctx: *struc IdentifierContext, token: *struc Token) string;
pub fn get_const_fmt(node: *struc CConst) string;
pub fn get_storage_class_fmt(node: *struc CStorageClass) string;
pub fn get_unop_fmt(node: *struc CUnaryOp) string;
pub fn get_binop_fmt(node: *struc CBinaryOp) string;
pub fn get_assign_fmt(node: *struc CBinaryOp, unop: *struc CUnaryOp) string;
pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string) string;
pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string) string;
pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string) string;
pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string) string;
pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string) string;
pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string) string;
pub fn get_type_fmt(ctx: *struc IdentifierContext, type: *struc Type, type_fmt: *string) string;
pub fn get_fatal_msg(msg: i32) string;
pub fn get_arg_msg(msg: i32) string;
pub fn get_util_msg(msg: i32) string;
pub fn get_lexer_msg(msg: i32) string;
pub fn get_parser_msg(msg: i32) string;
pub fn get_semantic_msg(msg: i32) string;
type struc FileIoContext;
type struc Pairhash_thash_t(key: u64, value: u64)
type struc FileOpenLine(    linenum: u64    , total_linenum: u64    , filename: string    )
type struc TokenInfo(    tok_pos: i32    , tok_len: i32    , total_linenum: u64    )
type struc ErrorsContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , msg: [1024]char    , is_stdout: i32    , info_at_buf: u64    , info_at_map: *struc Pairhash_thash_t    , fopen_lines: *struc FileOpenLine    , token_infos: *struc TokenInfo    )
pub fn panic_sigabrt(msg: string, line: i32, file: string) none;
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
type struc ErrorsContext;
type struc FileIoContext;
type struc IdentifierContext;
type struc Token(    tok_kind: i32    , tok: u64    , info_at: u64    )
pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32;


type struc CConst;
type struc CStringLiteral;
type struc CConstInt(    value: i32    )
type struc CConstLong(    value: i64    )
type struc CConstUInt(    value: u32    )
type struc CConstULong(    value: u64    )
type struc CConstDouble(    value: f64    )
type struc CConstChar(    value: i8    )
type struc CConstUChar(    value: u8    )
type union _CConst(    _CConstInt: struc CConstInt    , _CConstLong: struc CConstLong    , _CConstUInt: struc CConstUInt    , _CConstULong: struc CConstULong    , _CConstDouble: struc CConstDouble    , _CConstChar: struc CConstChar    , _CConstUChar: struc CConstUChar    )
type struc CConst(    _ref_count: u64, type: i32    , get: union _CConst    )
pub fn make_CConst(none) *struc CConst;
pub fn make_CConstInt(value: i32) *struc CConst;
pub fn make_CConstLong(value: i64) *struc CConst;
pub fn make_CConstUInt(value: u32) *struc CConst;
pub fn make_CConstULong(value: u64) *struc CConst;
pub fn make_CConstDouble(value: f64) *struc CConst;
pub fn make_CConstChar(value: i8) *struc CConst;
pub fn make_CConstUChar(value: u8) *struc CConst;
pub fn free_CConst(self: **struc CConst) none;
type struc CStringLiteral(    _ref_count: u64, type: i32    , value: *i8    )
pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral;
pub fn free_CStringLiteral(self: **struc CStringLiteral) none;
type struc PairTIdentifierstring_t(key: u64, value: string)
type struc IdentifierContext(    label_count: u32    , var_count: u32    , struct_count: u32    , hash_table: *struc PairTIdentifierstring_t    )
pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64;
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64;
type struc Type;
type struc StaticInit;
type struc InitialValue;
type struc IdentifierAttr;
type struc Symbol;
type struc StructMember;
type struc StructTypedef;
type struc Char(    _empty: char    )
type struc SChar(    _empty: char    )
type struc UChar(    _empty: char    )
type struc Int(    _empty: char    )
type struc Long(    _empty: char    )
type struc UInt(    _empty: char    )
type struc ULong(    _empty: char    )
type struc Double(    _empty: char    )
type struc Void(    _empty: char    )
type struc FunType(    param_reg_mask: u64    , ret_reg_mask: u64    , param_types: **struc Type    , ret_type: *struc Type    )
type struc Pointer(    ref_type: *struc Type    )
type struc Array(    size: i64    , elem_type: *struc Type    )
type struc Structure(    tag: u64    , is_union: i32    )
type union _Type(    _Char: struc Char    , _SChar: struc SChar    , _UChar: struc UChar    , _Int: struc Int    , _Long: struc Long    , _UInt: struc UInt    , _ULong: struc ULong    , _Double: struc Double    , _Void: struc Void    , _FunType: struc FunType    , _Pointer: struc Pointer    , _Array: struc Array    , _Structure: struc Structure    )
type struc Type(    _ref_count: u64, type: i32    , get: union _Type    )
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
pub fn make_Structure(tag: u64, is_union: i32) *struc Type;
pub fn free_Type(self: **struc Type) none;
type struc IntInit(    value: i32    )
type struc LongInit(    value: i64    )
type struc UIntInit(    value: u32    )
type struc ULongInit(    value: u64    )
type struc CharInit(    value: i8    )
type struc UCharInit(    value: u8    )
type struc DoubleInit(    dbl_const: u64    )
type struc ZeroInit(    byte: i64    )
type struc StringInit(    string_const: u64    , is_null_term: i32    , literal: *struc CStringLiteral    )
type struc PointerInit(    name: u64    )
type union _StaticInit(    _IntInit: struc IntInit    , _LongInit: struc LongInit    , _UIntInit: struc UIntInit    , _ULongInit: struc ULongInit    , _CharInit: struc CharInit    , _UCharInit: struc UCharInit    , _DoubleInit: struc DoubleInit    , _ZeroInit: struc ZeroInit    , _StringInit: struc StringInit    , _PointerInit: struc PointerInit    )
type struc StaticInit(    _ref_count: u64, type: i32    , get: union _StaticInit    )
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
type struc Tentative(    _empty: char    )
type struc Initial(    static_inits: **struc StaticInit    )
type struc NoInitializer(    _empty: char    )
type union _InitialValue(    _Tentative: struc Tentative    , _Initial: struc Initial    , _NoInitializer: struc NoInitializer    )
type struc InitialValue(    _ref_count: u64, type: i32    , get: union _InitialValue    )
pub fn make_InitialValue(none) *struc InitialValue;
pub fn make_Tentative(none) *struc InitialValue;
pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue;
pub fn make_NoInitializer(none) *struc InitialValue;
pub fn free_InitialValue(self: **struc InitialValue) none;
type struc FunAttr(    is_def: i32    , is_glob: i32    )
type struc StaticAttr(    is_glob: i32    , init: *struc InitialValue    )
type struc ConstantAttr(    static_init: *struc StaticInit    )
type struc LocalAttr(    _empty: char    )
type union _IdentifierAttr(    _FunAttr: struc FunAttr    , _StaticAttr: struc StaticAttr    , _ConstantAttr: struc ConstantAttr    , _LocalAttr: struc LocalAttr    )
type struc IdentifierAttr(    type: i32    , get: union _IdentifierAttr    )
pub fn make_IdentifierAttr(none) *struc IdentifierAttr;
pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr;
pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr;
pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr;
pub fn make_LocalAttr(none) *struc IdentifierAttr;
pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none;
type struc Symbol(    type: i32    , type_t: *struc Type    , attrs: *struc IdentifierAttr    )
pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol;
pub fn free_Symbol(self: **struc Symbol) none;
type struc StructMember(    type: i32    , offset: i64    , member_type: *struc Type    )
pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember;
pub fn free_StructMember(self: **struc StructMember) none;
type struc PairTIdentifierUPtrStructMember(key: u64, value: *struc StructMember)
type struc StructTypedef(    type: i32    , alignment: i32    , size: i64    , member_names: *u64    , members: *struc PairTIdentifierUPtrStructMember    )
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef;

pub fn free_StructTypedef(self: **struc StructTypedef) none;
type struc PairTIdentifierulong_t(key: u64, value: u64)
type struc PairTIdentifierTIdentifier(key: u64, value: u64)
type struc PairTIdentifierUPtrStructTypedef(key: u64, value: *struc StructTypedef)
type struc PairTIdentifierUPtrSymbol(key: u64, value: *struc Symbol)
type struc ElementTIdentifier(key: u64, value: char)
type struc FrontEndContext(    string_const_table: *struc PairTIdentifierTIdentifier    , struct_typedef_table: *struc PairTIdentifierUPtrStructTypedef    , symbol_table: *struc PairTIdentifierUPtrSymbol    , addressed_set: *struc ElementTIdentifier    )
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag: u64, member_name: u64) *struc StructMember;
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag: u64) *struc StructMember;
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
type struc CUnaryOp(    type: i32    )
pub fn make_CUnaryOp(type: i32) struc CUnaryOp;
type struc CBinaryOp(    type: i32    )
pub fn make_CBinaryOp(type: i32) struc CBinaryOp;
type struc CAbstractPointer(    abstract_decltor: *struc CAbstractDeclarator    )
type struc CAbstractArray(    size: i64    , abstract_decltor: *struc CAbstractDeclarator    )
type struc CAbstractBase(    _empty: char    )
type union _CAbstractDeclarator(    _CAbstractPointer: struc CAbstractPointer    , _CAbstractArray: struc CAbstractArray    , _CAbstractBase: struc CAbstractBase    )
type struc CAbstractDeclarator(    type: i32    , get: union _CAbstractDeclarator    )
pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator;
pub fn make_CAbstractPointer(abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractArray(size: i64, abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractBase(none) *struc CAbstractDeclarator;
pub fn free_CAbstractDeclarator(self: **struc CAbstractDeclarator) none;
type struc CParam(    type: i32    , decltor: *struc CDeclarator    , param_type: *struc Type    )
pub fn make_CParam(decltor: **struc CDeclarator, param_type: **struc Type) *struc CParam;
pub fn free_CParam(self: **struc CParam) none;
type struc CIdent(    name: u64    )
type struc CPointerDeclarator(    decltor: *struc CDeclarator    )
type struc CArrayDeclarator(    size: i64    , decltor: *struc CDeclarator    )
type struc CFunDeclarator(    param_list: **struc CParam    , decltor: *struc CDeclarator    )
type union _CDeclarator(    _CIdent: struc CIdent    , _CPointerDeclarator: struc CPointerDeclarator    , _CArrayDeclarator: struc CArrayDeclarator    , _CFunDeclarator: struc CFunDeclarator    )
type struc CDeclarator(    type: i32    , get: union _CDeclarator    )
pub fn make_CDeclarator(none) *struc CDeclarator;
pub fn make_CIdent(name: u64) *struc CDeclarator;
pub fn make_CPointerDeclarator(decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CArrayDeclarator(size: i64, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CFunDeclarator(param_list: ***struc CParam, decltor: **struc CDeclarator) *struc CDeclarator;

pub fn free_CDeclarator(self: **struc CDeclarator) none;
type struc CConstant(    constant: *struc CConst    , _base: *struc CExp    )
type struc CString(    literal: *struc CStringLiteral    , _base: *struc CExp    )
type struc CVar(    name: u64    , _base: *struc CExp    )
type struc CCast(    exp: *struc CExp    , target_type: *struc Type    , _base: *struc CExp    )
type struc CUnary(    unop: struc CUnaryOp    , exp: *struc CExp    , _base: *struc CExp    )
type struc CBinary(    binop: struc CBinaryOp    , exp_left: *struc CExp    , exp_right: *struc CExp    , _base: *struc CExp    )
type struc CAssignment(    unop: struc CUnaryOp    , exp_left: *struc CExp    , exp_right: *struc CExp    , _base: *struc CExp    )
type struc CConditional(    condition: *struc CExp    , exp_middle: *struc CExp    , exp_right: *struc CExp    , _base: *struc CExp    )
type struc CFunctionCall(    name: u64    , args: **struc CExp    , _base: *struc CExp    )
type struc CDereference(    exp: *struc CExp    , _base: *struc CExp    )
type struc CAddrOf(    exp: *struc CExp    , _base: *struc CExp    )
type struc CSubscript(    primary_exp: *struc CExp    , subscript_exp: *struc CExp    , _base: *struc CExp    )
type struc CSizeOf(    exp: *struc CExp    , _base: *struc CExp    )
type struc CSizeOfT(    target_type: *struc Type    , _base: *struc CExp    )
type struc CDot(    member: u64    , structure: *struc CExp    , _base: *struc CExp    )
type struc CArrow(    member: u64    , pointer: *struc CExp    , _base: *struc CExp    )
type union _CExp(    _CConstant: struc CConstant    , _CString: struc CString    , _CVar: struc CVar    , _CCast: struc CCast    , _CUnary: struc CUnary    , _CBinary: struc CBinary    , _CAssignment: struc CAssignment    , _CConditional: struc CConditional    , _CFunctionCall: struc CFunctionCall    , _CDereference: struc CDereference    , _CAddrOf: struc CAddrOf    , _CSubscript: struc CSubscript    , _CSizeOf: struc CSizeOf    , _CSizeOfT: struc CSizeOfT    , _CDot: struc CDot    , _CArrow: struc CArrow    )
type struc CExp(    type: i32    , exp_type: *struc Type    , info_at: u64    , get: union _CExp    )
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
type struc CReturn(    exp: *struc CExp    , info_at: u64    )
type struc CExpression(    exp: *struc CExp    )
type struc CIf(    condition: *struc CExp    , then: *struc CStatement    , else_fi: *struc CStatement    )
type struc CGoto(    target: u64    , info_at: u64    )
type struc CLabel(    target: u64    , jump_to: *struc CStatement    , info_at: u64    )
type struc CCompound(    block: *struc CBlock    )
type struc CWhile(    target: u64    , condition: *struc CExp    , body: *struc CStatement    )
type struc CDoWhile(    target: u64    , condition: *struc CExp    , body: *struc CStatement    )
type struc CFor(    target: u64    , init: *struc CForInit    , condition: *struc CExp    , post: *struc CExp    , body: *struc CStatement    )
type struc CSwitch(    target: u64    , is_default: i32    , match: *struc CExp    , body: *struc CStatement    , cases: **struc CExp    )
type struc CCase(    target: u64    , value: *struc CExp    , jump_to: *struc CStatement    )
type struc CDefault(    target: u64    , jump_to: *struc CStatement    , info_at: u64    )
type struc CBreak(    target: u64    , info_at: u64    )
type struc CContinue(    target: u64    , info_at: u64    )
type struc CNull(    _empty: char    )
type union _CStatement(    _CReturn: struc CReturn    , _CExpression: struc CExpression    , _CIf: struc CIf    , _CGoto: struc CGoto    , _CLabel: struc CLabel    , _CCompound: struc CCompound    , _CWhile: struc CWhile    , _CDoWhile: struc CDoWhile    , _CFor: struc CFor    , _CSwitch: struc CSwitch    , _CCase: struc CCase    , _CDefault: struc CDefault    , _CBreak: struc CBreak    , _CContinue: struc CContinue    , _CNull: struc CNull    )
type struc CStatement(    type: i32    , get: union _CStatement    )
pub fn make_CStatement(none) *struc CStatement;
pub fn make_CReturn(exp: **struc CExp, info_at: u64) *struc CStatement;
pub fn make_CExpression(exp: **struc CExp) *struc CStatement;
pub fn make_CIf(condition: **struc CExp, then: **struc CStatement, else_fi: **struc CStatement) *struc CStatement;

pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement;
pub fn make_CLabel(target: u64, jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CCompound(block: **struc CBlock) *struc CStatement;
pub fn make_CWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CDoWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CFor(init: **struc CForInit, condition: **struc CExp, post: **struc CExp, body: **struc CStatement) *struc CStatement;

pub fn make_CSwitch(match: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CCase(value: **struc CExp, jump_to: **struc CStatement) *struc CStatement;
pub fn make_CDefault(jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CBreak(info_at: u64) *struc CStatement;
pub fn make_CContinue(info_at: u64) *struc CStatement;
pub fn make_CNull(none) *struc CStatement;
pub fn free_CStatement(self: **struc CStatement) none;
type struc CInitDecl(    init: *struc CVariableDeclaration    )
type struc CInitExp(    init: *struc CExp    )
type union _CForInit(    _CInitDecl: struc CInitDecl    , _CInitExp: struc CInitExp    )
type struc CForInit(    type: i32    , get: union _CForInit    )
pub fn make_CForInit(none) *struc CForInit;
pub fn make_CInitDecl(init: **struc CVariableDeclaration) *struc CForInit;
pub fn make_CInitExp(init: **struc CExp) *struc CForInit;
pub fn free_CForInit(self: **struc CForInit) none;
type struc CB(    block_items: **struc CBlockItem    )
type union _CBlock(    _CB: struc CB    )
type struc CBlock(    type: i32    , get: union _CBlock    )
pub fn make_CBlock(none) *struc CBlock;
pub fn make_CB(block_items: ***struc CBlockItem) *struc CBlock;
pub fn free_CBlock(self: **struc CBlock) none;
type struc CS(    statement: *struc CStatement    )
type struc CD(    declaration: *struc CDeclaration    )
type union _CBlockItem(    _CS: struc CS    , _CD: struc CD    )
type struc CBlockItem(    type: i32    , get: union _CBlockItem    )
pub fn make_CBlockItem(none) *struc CBlockItem;
pub fn make_CS(statement: **struc CStatement) *struc CBlockItem;
pub fn make_CD(declaration: **struc CDeclaration) *struc CBlockItem;
pub fn free_CBlockItem(self: **struc CBlockItem) none;
type struc CStorageClass(    type: i32    )
pub fn make_CStorageClass(type: i32) struc CStorageClass;
type struc CSingleInit(    exp: *struc CExp    , _base: *struc CInitializer    )
type struc CCompoundInit(    initializers: **struc CInitializer    , _base: *struc CInitializer    )
type union _CInitializer(    _CSingleInit: struc CSingleInit    , _CCompoundInit: struc CCompoundInit    )
type struc CInitializer(    type: i32    , init_type: *struc Type    , get: union _CInitializer    )
pub fn make_CInitializer(none) *struc CInitializer;
pub fn make_CSingleInit(exp: **struc CExp) *struc CInitializer;
pub fn make_CCompoundInit(initializers: ***struc CInitializer) *struc CInitializer;
pub fn free_CInitializer(self: **struc CInitializer) none;
type struc CMemberDeclaration(    type: i32    , member_name: u64    , member_type: *struc Type    , info_at: u64    )
pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration;

pub fn free_CMemberDeclaration(self: **struc CMemberDeclaration) none;
type struc CStructDeclaration(    type: i32    , tag: u64    , is_union: i32    , members: **struc CMemberDeclaration    , info_at: u64    )
pub fn make_CStructDeclaration(tag: u64, is_union: i32, members: ***struc CMemberDeclaration, info_at: u64) *struc CStructDeclaration;

pub fn free_CStructDeclaration(self: **struc CStructDeclaration) none;
type struc CFunctionDeclaration(    type: i32    , name: u64    , params: *u64    , body: *struc CBlock    , fun_type: *struc Type    , storage_class: struc CStorageClass    , info_at: u64    )
pub fn make_CFunctionDeclaration(name: u64, params: **u64, body: **struc CBlock, fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration;


pub fn free_CFunctionDeclaration(self: **struc CFunctionDeclaration) none;
type struc CVariableDeclaration(    type: i32    , name: u64    , init: *struc CInitializer    , var_type: *struc Type    , storage_class: struc CStorageClass    , info_at: u64    )
pub fn make_CVariableDeclaration(name: u64, init: **struc CInitializer, var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration;

pub fn free_CVariableDeclaration(self: **struc CVariableDeclaration) none;
type struc CFunDecl(    fun_decl: *struc CFunctionDeclaration    )
type struc CVarDecl(    var_decl: *struc CVariableDeclaration    )
type struc CStructDecl(    struct_decl: *struc CStructDeclaration    )
type union _CDeclaration(    _CFunDecl: struc CFunDecl    , _CVarDecl: struc CVarDecl    , _CStructDecl: struc CStructDecl    )
type struc CDeclaration(    type: i32    , get: union _CDeclaration    )
pub fn make_CDeclaration(none) *struc CDeclaration;
pub fn make_CFunDecl(fun_decl: **struc CFunctionDeclaration) *struc CDeclaration;
pub fn make_CVarDecl(var_decl: **struc CVariableDeclaration) *struc CDeclaration;
pub fn make_CStructDecl(struct_decl: **struc CStructDeclaration) *struc CDeclaration;
pub fn free_CDeclaration(self: **struc CDeclaration) none;
type struc CProgram(    type: i32    , declarations: **struc CDeclaration    )
pub fn make_CProgram(declarations: ***struc CDeclaration) *struc CProgram;
pub fn free_CProgram(self: **struc CProgram) none;
pub fn get_tok_kind_fmt(tok_kind: i32) string {
    match tok_kind {
        -> 1 {
            return "line break"
        }
        -> 2 {
            return "("
        }
        -> 3 {
            return ")"
        }
        -> 4 {
            return "{"
        }
        -> 5 {
            return "}"
        }
        -> 6 {
            return "["
        }
        -> 7 {
            return "]"
        }
        -> 8 {
            return ","
        }
        -> 9 {
            return ";"
        }
        -> 10 {
            return "~"
        }
        -> 11 {
            return "-"
        }
        -> 12 {
            return "not"
        }
        -> 13 {
            return "@"
        }
        -> 14 {
            return "++"
        }
        -> 15 {
            return "--"
        }
        -> 16 {
            return "+"
        }
        -> 17 {
            return "*"
        }
        -> 18 {
            return "/"
        }
        -> 19 {
            return "%"
        }
        -> 20 {
            return "&"
        }
        -> 21 {
            return "|"
        }
        -> 22 {
            return "^"
        }
        -> 23 {
            return "<<"
        }
        -> 24 {
            return ">>"
        }
        -> 25 {
            return "and"
        }
        -> 26 {
            return "or"
        }
        -> 27 {
            return "=="
        }
        -> 28 {
            return "~="
        }
        -> 29 {
            return "<"
        }
        -> 30 {
            return "<="
        }
        -> 31 {
            return ">"
        }
        -> 32 {
            return ">="
        }
        -> 33 {
            return "="
        }
        -> 34 {
            return ":"
        }
        -> 35 {
            return "+="
        }
        -> 36 {
            return "-="
        }
        -> 37 {
            return "*="
        }
        -> 38 {
            return "/="
        }
        -> 39 {
            return "%="
        }
        -> 40 {
            return "&="
        }
        -> 41 {
            return "|="
        }
        -> 42 {
            return "^="
        }
        -> 43 {
            return "<<="
        }
        -> 44 {
            return ">>="
        }
        -> 45 {
            return "!"
        }
        -> 46 {
            return "?"
        }
        -> 47 {
            return "$"
        }
        -> 48 {
            return "."
        }
        -> 49 {
            return ".."
        }
        -> 50 {
            return "->"
        }
        -> 51 {
            return "char"
        }
        -> 52 {
            return "string"
        }
        -> 53 {
            return "i32"
        }
        -> 54 {
            return "i64"
        }
        -> 55 {
            return "i8"
        }
        -> 56 {
            return "f64"
        }
        -> 57 {
            return "u32"
        }
        -> 58 {
            return "u64"
        }
        -> 59 {
            return "u8"
        }
        -> 60 {
            return "any"
        }
        -> 61 {
            return "none"
        }
        -> 62 {
            return "fn"
        }
        -> 63 {
            return "struc"
        }
        -> 64 {
            return "union"
        }
        -> 65 {
            return "type"
        }
        -> 66 {
            return "sizeof"
        }
        -> 67 {
            return "return"
        }
        -> 68 {
            return "cast"
        }
        -> 69 {
            return "if"
        }
        -> 70 {
            return "elif"
        }
        -> 71 {
            return "else"
        }
        -> 72 {
            return "then"
        }
        -> 73 {
            return "jump"
        }
        -> 74 {
            return "label"
        }
        -> 75 {
            return "loop"
        }
        -> 76 {
            return "while"
        }
        -> 77 {
            return "match"
        }
        -> 78 {
            return "otherwise"
        }
        -> 79 {
            return "break"
        }
        -> 80 {
            return "continue"
        }
        -> 81 {
            return "pub"
        }
        -> 82 {
            return "data"
        }
        -> 83 {
            return "extrn"
        }
        -> 84 {
            return "true"
        }
        -> 85 {
            return "false"
        }
        -> 86 {
            return "identifier"
        }
        -> 87 {
            return "const string"
        }
        -> 88 {
            return "const char"
        }
        -> 89 {
            return "const i32"
        }
        -> 90 {
            return "const i64"
        }
        -> 91 {
            return "const u32"
        }
        -> 92 {
            return "const u64"
        }
        -> 93 {
            return "const f64"
        }
        otherwise {
            panic_sigabrt("abort", 205, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_tok_fmt(ctx: *struc IdentifierContext, token: *struc Token) string {
    match token[].tok_kind {
        -> 86 {
            -> 87 {
                -> 88 {
                    -> 89 {
                        -> 90 {
                            -> 91 {
                                -> 92 {
                                    -> 93 {
                                        return ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((token[].tok))), sizeof(ctx[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return get_tok_kind_fmt(token[].tok_kind)
        }
    }
}
pub fn get_const_fmt(node: *struc CConst) string {
    match node[].type {
        -> 47 {
            return "i32"
        }
        -> 48 {
            return "i64"
        }
        -> 49 {
            return "u32"
        }
        -> 50 {
            return "u64"
        }
        -> 51 {
            return "f64"
        }
        -> 52 {
            return "char"
        }
        -> 53 {
            return "u8"
        }
        otherwise {
            panic_sigabrt("abort", 242, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_storage_class_fmt(node: *struc CStorageClass) string {
    match node[].type {
        -> 133 {
            return "data"
        }
        -> 134 {
            return "extrn"
        }
        otherwise {
            panic_sigabrt("abort", 253, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_unop_fmt(node: *struc CUnaryOp) string {
    match node[].type {
        -> 56 {
            return "~"
        }
        -> 57 {
            return "-"
        }
        -> 58 {
            return "not"
        }
        otherwise {
            panic_sigabrt("abort", 266, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_binop_fmt(node: *struc CBinaryOp) string {
    match node[].type {
        -> 62 {
            return "+"
        }
        -> 63 {
            return "-"
        }
        -> 64 {
            return "*"
        }
        -> 65 {
            return "/"
        }
        -> 66 {
            return "%"
        }
        -> 67 {
            return "&"
        }
        -> 68 {
            return "|"
        }
        -> 69 {
            return "^"
        }
        -> 70 {
            return "<<"
        }
        -> 71 {
            return ">>"
        }
        -> 72 {
            return ">>"
        }
        -> 73 {
            return "and"
        }
        -> 74 {
            return "or"
        }
        -> 75 {
            return "=="
        }
        -> 76 {
            return "~="
        }
        -> 77 {
            return "<"
        }
        -> 78 {
            return "<="
        }
        -> 79 {
            return ">"
        }
        -> 80 {
            return ">="
        }
        otherwise {
            panic_sigabrt("abort", 311, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_assign_fmt(node: *struc CBinaryOp, unop: *struc CUnaryOp) string {
    if not node {
        return "="
    }
    match unop[].type {
        -> 55 {
            break
        }
        -> 59 {
            match node[].type {
                -> 62 {
                    return "prefix ++"
                }
                -> 63 {
                    return "prefix --"
                }
                otherwise {
                    panic_sigabrt("abort", 329, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
                }
            }
        }
        -> 60 {
            match node[].type {
                -> 62 {
                    return "postfix ++"
                }
                -> 63 {
                    return "postfix --"
                }
                otherwise {
                    panic_sigabrt("abort", 340, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
                }
            }
        }
        otherwise {
            panic_sigabrt("abort", 345, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
    match node[].type {
        -> 62 {
            return "+="
        }
        -> 63 {
            return "-="
        }
        -> 64 {
            return "*="
        }
        -> 65 {
            return "/="
        }
        -> 66 {
            return "%="
        }
        -> 67 {
            return "&="
        }
        -> 68 {
            return "|="
        }
        -> 69 {
            return "^="
        }
        -> 70 {
            return "<<="
        }
        -> 71 {
            return ">>="
        }
        -> 72 {
            return ">>="
        }
        otherwise {
            panic_sigabrt("abort", 371, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_name_fmt(ctx: *struc IdentifierContext, name: u64, name_fmt: *string) string {
    value: string = ((? ((? ((ctx[].hash_table) = stbds_hmget_key((ctx[].hash_table), sizeof((ctx[].hash_table)[]), cast<*any>(@((name))), sizeof(ctx[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].hash_table) - 1)) - 1)[].temp])[].value)
    if value ~= name_fmt[] {
        if name_fmt[] {
            sdsfree(name_fmt[])
            name_fmt[] = ? 0 then sdsnew(0) else 0
        }
        ;
        name_fmt[] = sdsdup(value)
    }
    ;
    loop i: u64 = sdslen(name_fmt[]) while i-- > 0 {
        if (name_fmt[])[i] == "."[0] {
            sdsrange(name_fmt[], 0, i - 1)
            break
        }
    }
    return name_fmt[]
}
pub fn get_struct_name_fmt(ctx: *struc IdentifierContext, name: u64, is_union: i32, struct_fmt: *string) string {
    struct_fmt[] = ? is_union then ? "union " then sdsnew("union ") else 0 else ? "struc " then sdsnew("struc ") else 0
    {
        name_fmt: string = ? 0 then sdsnew(0) else 0
        loop .. while 0 {
            struct_fmt[] = sdscat(struct_fmt[], get_name_fmt(ctx, name, @name_fmt))
        }
        if name_fmt {
            sdsfree(name_fmt)
            name_fmt = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    return struct_fmt[]
}
pub fn get_fun_fmt(ctx: *struc IdentifierContext, fun_type: *struc FunType, fun_fmt: *string) string {
    fun_fmt[] = ? "(" then sdsnew("(") else 0
    if ((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            fun_fmt[] = sdscat(fun_fmt[], "none")
        }
    }
    else {
        type_fmt: string = ? 0 then sdsnew(0) else 0
        loop .. while 0 {
            fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[0], @type_fmt))
        }
        if type_fmt {
            sdsfree(type_fmt)
            type_fmt = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    loop i: u64 = 1 while i < (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            fun_fmt[] = sdscat(fun_fmt[], ", ")
        }
        {
            type_fmt: string = ? 0 then sdsnew(0) else 0
            loop .. while 0 {
                fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].param_types[i], @type_fmt))
            }
            if type_fmt {
                sdsfree(type_fmt)
                type_fmt = ? 0 then sdsnew(0) else 0
            }
            ;
        }
    }
    loop .. while 0 {
        fun_fmt[] = sdscat(fun_fmt[], ") -> ")
    }
    {
        type_fmt: string = ? 0 then sdsnew(0) else 0
        loop .. while 0 {
            fun_fmt[] = sdscat(fun_fmt[], get_type_fmt(ctx, fun_type[].ret_type, @type_fmt))
        }
        if type_fmt {
            sdsfree(type_fmt)
            type_fmt = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    return fun_fmt[]
}
pub fn get_ptr_fmt(ctx: *struc IdentifierContext, ptr_type: *struc Pointer, ptr_fmt: *string) string {
    ptr_fmt[] = ? "*" then sdsnew("*") else 0
    loop while ptr_type[].ref_type[].type == 11 {
        ptr_type = @ptr_type[].ref_type[].get._Pointer
        loop .. while 0 {
            ptr_fmt[] = sdscat(ptr_fmt[], "*")
        }
    }
    if ptr_type[].ref_type[].type == 9 {
        loop .. while 0 {
            ptr_fmt[] = sdscat(ptr_fmt[], "any")
        }
    }
    else {
        type_fmt: string = ? 0 then sdsnew(0) else 0
        loop .. while 0 {
            ptr_fmt[] = sdscat(ptr_fmt[], get_type_fmt(ctx, ptr_type[].ref_type, @type_fmt))
        }
        if type_fmt {
            sdsfree(type_fmt)
            type_fmt = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    return ptr_fmt[]
}
pub fn get_arr_fmt(ctx: *struc IdentifierContext, arr_type: *struc Array, arr_fmt: *string) string {
    arr_fmt[] = ? "[" then sdsnew("[") else 0
    {
        strto_size: string = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        loop .. while 0 {
            arr_fmt[] = sdscat(arr_fmt[], strto_size)
        }
        if strto_size {
            sdsfree(strto_size)
            strto_size = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    loop .. while 0 {
        arr_fmt[] = sdscat(arr_fmt[], "]")
    }
    loop while arr_type[].elem_type[].type == 12 {
        arr_type = @arr_type[].elem_type[].get._Array
        loop .. while 0 {
            arr_fmt[] = sdscat(arr_fmt[], "[")
        }
        {
            strto_size: string = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
            loop .. while 0 {
                arr_fmt[] = sdscat(arr_fmt[], strto_size)
            }
            if strto_size {
                sdsfree(strto_size)
                strto_size = ? 0 then sdsnew(0) else 0
            }
            ;
        }
        loop .. while 0 {
            arr_fmt[] = sdscat(arr_fmt[], "]")
        }
    }
    if arr_type[].elem_type[].type == 9 {
        loop .. while 0 {
            arr_fmt[] = sdscat(arr_fmt[], "any")
        }
    }
    else {
        type_fmt: string = ? 0 then sdsnew(0) else 0
        loop .. while 0 {
            arr_fmt[] = sdscat(arr_fmt[], get_type_fmt(ctx, arr_type[].elem_type, @type_fmt))
        }
        if type_fmt {
            sdsfree(type_fmt)
            type_fmt = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    return arr_fmt[]
}
pub fn get_struct_fmt(ctx: *struc IdentifierContext, struct_type: *struc Structure, struct_fmt: *string) string {
    return get_struct_name_fmt(ctx, struct_type[].tag, struct_type[].is_union, struct_fmt)
}
pub fn get_type_fmt(ctx: *struc IdentifierContext, type: *struc Type, type_fmt: *string) string {
    match type[].type {
        -> 1 {
            return "char"
        }
        -> 2 {
            return "i8"
        }
        -> 3 {
            return "u8"
        }
        -> 4 {
            return "i32"
        }
        -> 5 {
            return "i64"
        }
        -> 6 {
            return "u32"
        }
        -> 7 {
            return "u64"
        }
        -> 8 {
            return "f64"
        }
        -> 9 {
            return "none"
        }
        -> 10 {
            return get_fun_fmt(ctx, @type[].get._FunType, type_fmt)
        }
        -> 11 {
            return get_ptr_fmt(ctx, @type[].get._Pointer, type_fmt)
        }
        -> 12 {
            return get_arr_fmt(ctx, @type[].get._Array, type_fmt)
        }
        -> 13 {
            return get_struct_fmt(ctx, @type[].get._Structure, type_fmt)
        }
        otherwise {
            panic_sigabrt("abort", 503, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_fatal_msg(msg: i32) string {
    match msg {
        -> 1 {
            return "(no. %s) " "%s%s"             "‘%s’" " operating system is not supported, requires " "‘" "GNU/Linux" "’" " (x86_64) or "             "‘" "MacOS" "’"
        }
        -> 2 {
            return "(no. %s) " "%s%s" "‘%s’" " architecture is not supported, requires " "‘" "x86_64" "’"
        }
        -> 3 {
            return "(no. %s) " "%s%s" "‘%s’" " compiler is not supported, requires " "‘" "gcc" "’" " >= 8.1.0"
        }
        -> 4 {
            return "(no. %s) " "" "‘" "gcc" "’" " %s.%s.%s is not supported, requires " "‘" "gcc" "’" " >= 8.1.0"
        }
        otherwise {
            panic_sigabrt("abort", 545, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_arg_msg(msg: i32) string {
    match msg {
        -> 101 {
            return "(no. %s) " "%s%s"             "Usage: %s [--help] Debug OptimL1 OptimL2 FILE StdlibDir SourceDir [IncludeDir...]\n"             "    [--help]:         print help and exit\n"             "    Debug:            print debug info (0..1|251..255)\n"             "    OptimL1:          optimization level 1 mask (0..15)\n"             "    OptimL2:          optimization level 2 enum (0..2)\n"             "    FILE:             source file to compile\n"             "    StdlibDir:        standard lib include path\n"             "    SourceDir:        source file include path\n"             "    [IncludeDir...]:  add a list of paths to include path\n"             "see " "‘" "driver.sh" "’"
        }
        -> 102 {
            return "(no. %s) " "%s%s%s" "no debug code passed in first argument, see " "‘" "--help" "’"
        }
        -> 103 {
            return "(no. %s) " "%s%s" "invalid debug code " "‘%s’" " passed in first argument, see " "‘" "--help" "’"
        }
        -> 104 {
            return "(no. %s) " "%s%s%s" "no level 1 optimization mask passed in second argument, see " "‘" "--help" "’"
        }
        -> 105 {
            return "(no. %s) " "%s%s"             "invalid level 1 optimization mask " "‘%s’" " passed in second argument, see " "‘" "--help" "’"
        }
        -> 106 {
            return "(no. %s) " "%s%s%s" "no level 2 optimization code passed in third argument, see " "‘" "--help" "’"
        }
        -> 107 {
            return "(no. %s) " "%s%s" "invalid level 2 optimization code " "‘%s’" " passed in third argument, see " "‘" "--help" "’"
        }
        -> 108 {
            return "(no. %s) " "%s%s%s" "no input file passed in fourth argument, see " "‘" "--help" "’"
        }
        -> 109 {
            return "(no. %s) " "%s%s%s" "no standard lib directory passed in fifth argument, see " "‘" "--help" "’"
        }
        -> 110 {
            return "(no. %s) " "%s%s%s" "no include directories passed in sixth argument, see " "‘" "--help" "’"
        }
        otherwise {
            panic_sigabrt("abort", 583, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_util_msg(msg: i32) string {
    match msg {
        -> 201 {
            return "(no. %s) " "%s%s" "cannot read input file " "‘%s’"
        }
        -> 202 {
            return "(no. %s) " "%s%s" "cannot write output file " "‘%s’"
        }
        -> 203 {
            return "(no. %s) " "%s%s" "cannot interpret string " "‘%s’" " to an integer value"
        }
        -> 204 {
            return "(no. %s) " "%s%s" "cannot interpret string " "‘%s’" " to an unsigned integer value"
        }
        -> 205 {
            return "(no. %s) " "%s%s" "cannot interpret string " "‘%s’" " to a floating point value"
        }
        otherwise {
            panic_sigabrt("abort", 600, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_lexer_msg(msg: i32) string {
    match msg {
        -> 301 {
            return "(no. %s) " "%s%s" "found invalid token " "‘%s’"
        }
        -> 304 {
            return "(no. %s) " "%s%s" "cannot find " "‘%s’" " header file in " "‘" "import" "’" " directive search"
        }
        -> 305 {
            return "(no. %s) " "%s%s" "cannot find " "‘%s’" " header file in " "‘" "use" "’" " directive search"
        }
        -> 302 {
            return "(no. %s) " "%s%s" "cannot search " "‘%s’" " in a line, " "‘" "import" "’" " requires its own line"
        }
        -> 303 {
            return "(no. %s) " "%s%s" "cannot search " "‘%s’" " in a line, " "‘" "use" "’" " requires its own line"
        }
        -> 306 {
            return "(no. %s) " "%s%s" "found m4 macro " "‘%s’" ", preprocess with " "‘" "-E" "’" " or see " "‘" "--help" "’"
        }
        -> 307 {
            return "(no. %s) " "%s%s" "found unmatched bracket " "‘%s’"
        }
        otherwise {
            panic_sigabrt("abort", 621, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_parser_msg(msg: i32) string {
    match msg {
        -> 401 {
            return "(no. %s) " "%s" "found token " "‘%s’" ", but expected " "‘%s’" " next"
        }
        -> 402 {
            return "(no. %s) " "%s%s%s" "reached end of file, but expected declaration or statement next"
        }
        -> 403 {
            return "(no. %s) " "%s%s" "cannot represent " "‘%s’" " as a 64 bits signed integer constant, very large number"
        }
        -> 404 {
            return "(no. %s) " "%s%s" "cannot represent " "‘%s’" " as a 64 bits unsigned integer constant, very large number"
        }
        -> 405 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected unary operator " "‘" "~" "’" ", " "‘" "-" "’"             " or " "‘" "not" "’" " next"
        }
        -> 406 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected binary operator " "‘" "=" "’" ", " "‘" "+" "’" ", "             "‘" "+=" "’" ", " "‘" "-" "’" ", " "‘" "-=" "’" ", " "‘" "*" "’" ", " "‘" "*=" "’" ", "             "‘" "/" "’" ", " "‘" "/=" "’" ", " "‘" "%" "’" ", " "‘" "%=" "’" ", " "‘" "&" "’" ", "             "‘" "&=" "’" ", " "‘" "|" "’" ", " "‘" "|=" "’" ", " "‘" "^" "’" ", " "‘" "^=" "’" ", "             "‘" "<<" "’" ", " "‘" "<<=" "’" ", " "‘" ">>" "’" ", " "‘" ">>=" "’" ", " "‘" "and" "’" ", "             "‘" "or" "’" ", " "‘" "==" "’" ", " "‘" "~=" "’" ", " "‘" "<" "’" ", " "‘" "<=" "’" ", "             "‘" ">" "’" " or " "‘" ">=" "’" " next"
        }
        -> 407 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected datatype specifier " "‘" "struc" "’" " or "             "‘" "union" "’" " next"
        }
        -> 408 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected type specifier " "‘" "char" "’" ", " "‘" "string" "’"             ", " "‘" "bool" "’" ", " "‘" "i32" "’" ", " "‘" "i64" "’" ", " "‘" "i8" "’" ", " "‘" "f64" "’"             ", " "‘" "u32" "’" ", " "‘" "u64" "’" ", " "‘" "u8" "’" ", " "‘" "struc" "’" ", "             "‘" "union" "’" ", " "‘" "*" "’" ", " "‘" "*any" "’" " or " "‘" "[" "’" " next"
        }
        -> 409 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected maybe type specifier " "‘" "none" "’" ", "             "‘" "char" "’" ", " "‘" "string" "’" ", " "‘" "bool" "’" ", " "‘" "i32" "’" ", " "‘" "i64" "’"             ", " "‘" "i8" "’" ", " "‘" "f64" "’" ", " "‘" "u32" "’" ", " "‘" "u64" "’" ", " "‘" "u8" "’"             ", " "‘" "struc" "’" ", " "‘" "union" "’" ", " "‘" "*" "’" ", " "‘" "*any" "’" " or "             "‘" "[" "’" " next"
        }
        -> 410 {
            return "(no. %s) " "%s%s" "found token " "‘%s’" ", but expected sizeof " "‘" "<" "’" " or " "‘" "(" "’" " next"
        }
        -> 411 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected expression " "‘" "?" "’" ", " "‘" "~" "’" ", "             "‘" "-" "’" ", " "‘" "not" "’" ", " "‘" "++" "’" ", " "‘" "--" "’" ", " "‘" "@" "’" ", "             "‘" "sizeof" "’" ", " "‘" "cast" "’" ", " "‘" "identifier" "’" ", " "‘" "identifier(" "’" ", "             "‘" "(" "’" ", " "‘" "const string" "’" ", " "‘" "const char" "’" ", " "‘" "const i32" "’" ", "             "‘" "const i64" "’" ", " "‘" "const u32" "’" ", " "‘" "const u64" "’" ", " "‘" "const f64" "’"             ", " "‘" "true" "’" ", " "‘" "false" "’" " or " "‘" "nil" "’" " next"
        }
        -> 412 {
            return "(no. %s) " "%s%s" "found token " "‘%s’" ", but expected assignment " "‘" "=" "’" " or " "‘" ";" "’" " next"
        }
        -> 413 {
            return "(no. %s) " "%s%s" "found token " "‘%s’" ", but expected member list " "‘" "(" "’" " or " "‘" ";" "’" " next"
        }
        -> 414 {
            return "(no. %s) " "%s%s" "found token " "‘%s’" ", but expected block " "‘" "{" "’" " or " "‘" ";" "’" " next"
        }
        -> 415 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected declaration " "‘" "identifier" "’" ", " "‘" "fn" "’"             " or " "‘" "type" "’" " next"
        }
        -> 416 {
            return "(no. %s) " "%s%s"             "found token " "‘%s’" ", but expected storage class " "‘" "pub" "’" ", " "‘" "data" "’" ", "             "‘" "extrn" "’" ", " "‘" "identifier" "’" ", " "‘" "fn" "’" " or " "‘" "type" "’" " next"
        }
        -> 417 {
            return "(no. %s) " "%s%s%s" "incomplete type " "‘" "any" "’" " requires a pointer, or use " "‘" "none" "’" " instead"
        }
        -> 418 {
            return "(no. %s) " "%s%s" "illegal array size " "‘%s’" ", requires a constant integer"
        }
        -> 419 {
            return "(no. %s) " "%s%s" "illegal " "‘" "->" "’" " value " "‘%s’" ", requires a constant integer"
        }
        -> 420 {
            return "(no. %s) " "%s%s%s" "empty block requires at least one item, or use " "‘" ";" "’" " instead"
        }
        -> 421 {
            return "(no. %s) " "%s%s%s" "empty compound initializer requires at least one initializer"
        }
        -> 422 {
            return "(no. %s) " "%s%s%s" "cannot exit " "‘" "loop" "’" ", infinite loop requires at least one statement"
        }
        -> 423 {
            return "(no. %s) " "%s%s" "illegal storage " "‘%s’" ", cannot use storage class in " "‘" "loop" "’" " initialization"
        }
        -> 424 {
            return "(no. %s) " "%s%s" "illegal storage " "‘%s’" ", cannot use storage class in list declaration"
        }
        -> 425 {
            return "(no. %s) " "%s%s" "illegal storage " "‘%s’" ", cannot use storage class in type declaration"
        }
        -> 426 {
            return "(no. %s) " "%s%s%s" "illegal storage class, cannot use " "‘" "pub" "’" " declaration in block"
        }
        -> 427 {
            return "(no. %s) " "%s%s%s" "illegal storage class, cannot use " "‘" "data" "’" " declaration at top level"
        }
        otherwise {
            panic_sigabrt("abort", 712, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
pub fn get_semantic_msg(msg: i32) string {
    match msg {
        -> 501 {
            return "(no. %s) " "%s" "array type " "‘%s’" " of incomplete type " "‘%s’" ", requires a complete type"
        }
        -> 502 {
            return "(no. %s) " "%s" "pointer type mismatch " "‘%s’" " and " "‘%s’" " in operator"
        }
        -> 503 {
            return "(no. %s) " "%s%s" "function " "‘%s’" " used as a variable"
        }
        -> 504 {
            return "(no. %s) " "%s" "illegal cast, cannot convert expression from type " "‘%s’" " to " "‘%s’"
        }
        -> 505 {
            return "(no. %s) " "%s" "cannot apply unary operator " "‘%s’" " on operand type " "‘%s’"
        }
        -> 506 {
            return "(no. %s) " "%s" "cannot apply binary operator " "‘%s’" " on operand type " "‘%s’"
        }
        -> 507 {
            return "(no. %s) " "" "cannot apply binary operator " "‘%s’" " on operand types " "‘%s’" " and " "‘%s’"
        }
        -> 508 {
            return "(no. %s) " "%s%s%s" "cannot assign " "‘" "=" "’" " to left operand type " "‘" "none" "’"
        }
        -> 509 {
            return "(no. %s) " "%s%s" "assignment " "‘%s’" " requires lvalue left operand, but got rvalue"
        }
        -> 510 {
            return "(no. %s) " "%s%s" "cannot apply conditional " "‘" "then" "’" " on condition operand type " "‘%s’"
        }
        -> 511 {
            return "(no. %s) " "%s" "cannot apply ternary operator " "‘" "else" "’" " on operand types " "‘%s’" " and " "‘%s’"
        }
        -> 512 {
            return "(no. %s) " "%s%s" "variable " "‘%s’" " used as a function"
        }
        -> 513 {
            return "(no. %s) " "" "function " "‘%s’" " called with " "‘%s’" " arguments instead of " "‘%s’"
        }
        -> 514 {
            return "(no. %s) " "%s%s" "cannot apply dereference operator " "‘" "[]" "’" " on non-pointer type " "‘%s’"
        }
        -> 515 {
            return "(no. %s) " "%s%s%s" "addresssing " "‘" "@" "’" " requires lvalue operand, but got rvalue"
        }
        -> 516 {
            return "(no. %s) " "%s"             "cannot subscript array with operand types " "‘%s’" " and "             "‘%s’" ", requires a complete pointer and an integer types"
        }
        -> 517 {
            return "(no. %s) " "%s%s" "cannot get size with " "‘" "sizeof" "’" " operator on incomplete type " "‘%s’"
        }
        -> 518 {
            return "(no. %s) " "%s"             "cannot access datatype member " "‘%s’" " with dot operator " "‘" "." "’"             " on non-datatype " "‘%s’"
        }
        -> 519 {
            return "(no. %s) " "%s" "datatype " "‘%s’" " has no member named " "‘%s’"
        }
        -> 520 {
            return "(no. %s) " "%s"             "cannot access datatype member " "‘%s’" " with dereferenced dot operator "             "‘" "[]." "’" " on non-pointer-to-datatype " "‘%s’"
        }
        -> 521 {
            return "(no. %s) " "%s"             "cannot access datatype member " "‘%s’" " with dereferenced dot operator "             "‘" "[]." "’" " on incomplete datatype " "‘%s’"
        }
        -> 522 {
            return "(no. %s) " "%s%s" "incomplete datatype " "‘%s’" " in expression"
        }
        -> 523 {
            return "(no. %s) " "%s%s" "found " "‘" "return" "’" " value in function " "‘%s’" " returning type " "‘" "none" "’"
        }
        -> 524 {
            return "(no. %s) " "%s" "found " "‘" "return" "’" " with no value in function " "‘%s’" " returning type " "‘%s’"
        }
        -> 525 {
            return "(no. %s) " "%s%s" "cannot use " "‘" "if" "’" " statement with condition expression type " "‘%s’"
        }
        -> 526 {
            return "(no. %s) " "%s%s" "cannot use " "‘" "loop while" "’" " statement with condition expression type " "‘%s’"
        }
        -> 527 {
            return "(no. %s) " "%s%s" "cannot use " "‘" "loop .. while" "’" " statement with post-condition expression type " "‘%s’"
        }
        -> 528 {
            return "(no. %s) " "%s%s"             "cannot use " "‘" "loop" "’" " statement with " "‘" "while" "’"             " condition expression type " "‘%s’"
        }
        -> 529 {
            return "(no. %s) " "%s%s"             "cannot use " "‘" "match" "’" " statement with match expression type "             "‘%s’" ", requires an integer type"
        }
        -> 530 {
            return "(no. %s) " "%s%s" "found duplicate " "‘" "->" "’" " value " "‘%s’" " in " "‘" "match" "’" " statement"
        }
        -> 531 {
            return "(no. %s) " "%s%s" "non-character array type " "‘%s’" " initialized from string constant"
        }
        -> 532 {
            return "(no. %s) " "%s" "size " "‘%s’" " string constant initialized with " "‘%s’" " characters"
        }
        -> 533 {
            return "(no. %s) " "" "size " "‘%s’" " array type " "‘%s’" " initialized with " "‘%s’" " initializers"
        }
        -> 534 {
            return "(no. %s) " "" "datatype " "‘%s’" " initialized with " "‘%s’" " members instead of " "‘%s’"
        }
        -> 535 {
            return "(no. %s) " "%s" "function " "‘%s’" " returns array type " "‘%s’" ", instead of pointer type"
        }
        -> 536 {
            return "(no. %s) " "%s" "function " "‘%s’" " returns incomplete datatype " "‘%s’"
        }
        -> 537 {
            return "(no. %s) " "%s" "function " "‘%s’" " declared with parameter " "‘%s’" " with type " "‘" "none" "’"
        }
        -> 538 {
            return "(no. %s) " "" "function " "‘%s’" " defined with parameter " "‘%s’" " with incomplete datatype " "‘%s’"
        }
        -> 539 {
            return "(no. %s) " ""             "function " "‘%s’" " redeclared with function type "             "‘%s’" ", but previous declaration has function type " "‘%s’"
        }
        -> 540 {
            return "(no. %s) " "%s" "function " "‘%s’" " already defined with function type " "‘%s’"
        }
        -> 541 {
            return "(no. %s) " "%s%s" "function " "‘%s’" " with " "‘" "data" "’" " storage class already declared non-static"
        }
        -> 542 {
            return "(no. %s) " "%s"             "cannot statically initialize pointer type " "‘%s’" " from constant "             "‘%s’" ", requires a constant integer"
        }
        -> 543 {
            return "(no. %s) " "%s" "cannot statically initialize pointer type " "‘%s’" " from non-zero value " "‘%s’"
        }
        -> 544 {
            return "(no. %s) " "%s%s" "aggregate type " "‘%s’" " statically initialized with single initializer"
        }
        -> 545 {
            return "(no. %s) " "%s%s" "non-character pointer type " "‘%s’" " statically initialized from string constant"
        }
        -> 546 {
            return "(no. %s) " "%s%s" "cannot statically initialize variable from non-constant type " "‘%s’" ", requires a constant"
        }
        -> 547 {
            return "(no. %s) " "%s%s" "cannot initialize scalar type " "‘%s’" " with compound initializer"
        }
        -> 548 {
            return "(no. %s) " "%s%s" "variable " "‘%s’" " declared with type " "‘" "none" "’"
        }
        -> 549 {
            return "(no. %s) " "%s" "variable " "‘%s’" " declared with incomplete datatype " "‘%s’"
        }
        -> 550 {
            return "(no. %s) " ""             "variable " "‘%s’" " redeclared with conflicting type "             "‘%s’" ", but previously declared with type " "‘%s’"
        }
        -> 551 {
            return "(no. %s) " "%s%s" "variable " "‘%s’" " redeclared with conflicting storage class"
        }
        -> 552 {
            return "(no. %s) " "%s%s"             "illegal initializer, can only declare variable " "‘%s’" " with " "‘" "extrn" "’"             " storage class"
        }
        -> 553 {
            return "(no. %s) " "%s" "datatype " "‘%s’" " declared with duplicate member name " "‘%s’"
        }
        -> 554 {
            return "(no. %s) " "" "datatype " "‘%s’" " declared with member " "‘%s’" " with incomplete type " "‘%s’"
        }
        -> 555 {
            return "(no. %s) " "%s%s" "datatype " "‘%s’" " already declared in this scope"
        }
        -> 556 {
            return "(no. %s) " "%s%s%s" "found " "‘" "->" "’" " statement outside of " "‘" "match" "’"
        }
        -> 557 {
            return "(no. %s) " "%s%s%s" "found " "‘" "otherwise" "’" " statement outside of " "‘" "match" "’"
        }
        -> 558 {
            return "(no. %s) " "%s%s%s" "found more than one " "‘" "otherwise" "’" " statement in " "‘" "match" "’"
        }
        -> 559 {
            return "(no. %s) " "%s%s%s" "found " "‘" "break" "’" " statement outside of " "‘" "loop" "’" " or " "‘" "match" "’"
        }
        -> 560 {
            return "(no. %s) " "%s%s%s" "found " "‘" "continue" "’" " statement outside of " "‘" "loop" "’"
        }
        -> 561 {
            return "(no. %s) " "%s"             "found " "‘" "jump" "’" " statement, but " "‘" "label" "’" " with target "             "‘%s’" " not defined in function " "‘%s’"
        }
        -> 562 {
            return "(no. %s) " "%s" "‘%s’" " conflicts with datatype " "‘%s’" " previously declared or defined in this scope"
        }
        -> 563 {
            return "(no. %s) " "%s%s" "datatype " "‘%s’" " not defined in this scope"
        }
        -> 564 {
            return "(no. %s) " "%s%s" "variable " "‘%s’" " not declared in this scope"
        }
        -> 565 {
            return "(no. %s) " "%s%s" "function " "‘%s’" " not declared in this scope"
        }
        -> 566 {
            return "(no. %s) " "%s"             "variable " "‘%s’" " declared with " "‘%s’" " storage class in " "‘" "loop" "’"             " initialization"
        }
        -> 567 {
            return "(no. %s) " "%s%s" "‘" "label" "’" " with target " "‘%s’" " already defined in this scope"
        }
        -> 568 {
            return "(no. %s) " "%s%s" "variable " "‘%s’" " already declared in this scope"
        }
        -> 569 {
            return "(no. %s) " "%s%s"             "function "             "‘%s’" " defined inside another function, but nested function definition are not permitted"
        }
        -> 570 {
            return "(no. %s) " "%s%s"             "cannot declare nested function " "‘%s’" " in another function with " "‘" "data" "’"             " storage class"
        }
        -> 571 {
            return "(no. %s) " "%s%s" "function " "‘%s’" " already declared in this scope"
        }
        otherwise {
            panic_sigabrt("abort", 889, "/home/romain/proj/planet/selfhost/wheelcc/frontend/errors.c")
        }
    }
}
