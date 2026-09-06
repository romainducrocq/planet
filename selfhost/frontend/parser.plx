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
type struc CExp;
type struc IdentifierContext;
pub fn rslv_label_identifier(ctx: *struc IdentifierContext, label: u64) u64;
pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64;
pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64;
pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64;
pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64;
pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64;
pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64;
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


type struc Token;
type struc CProgram;
type struc ErrorsContext;
type struc IdentifierContext;
pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32;

type struc ErrorsContext;
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: **i8) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: *i8) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;
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
type struc ParserContext(    errors: *struc ErrorsContext    , identifiers: *struc IdentifierContext    , pop_idx: u64    , next_tok: *struc Token    , peek_tok: *struc Token    , peek_tok_i: *struc Token    , p_toks: **struc Token    )
fn expect_next(ctx: *struc ParserContext, next_tok: *struc Token, expect_tok: i32) i32 {
    _errval: i32 = 0
    if next_tok[].tok_kind ~= expect_tok {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(401), "401", "", get_tok_fmt(ctx[].identifiers, next_tok), get_tok_kind_fmt(expect_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, next_tok[].info_at)) else panic_sigabrt("abort", 35, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn pop_next(ctx: *struc ParserContext) i32 {
    _errval: i32 = 0
    if ctx[].pop_idx >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(402), "402", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort", 45, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].next_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    ctx[].pop_idx++
    label _Lfinally
    ;
    return _errval
}
fn peek_next(ctx: *struc ParserContext) i32 {
    _errval: i32 = 0
    if ctx[].pop_idx >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(402), "402", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort", 57, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].peek_tok = @(ctx[].p_toks[])[ctx[].pop_idx]
    label _Lfinally
    ;
    return _errval
}
fn peek_next_i(ctx: *struc ParserContext, i: u64) i32 {
    _errval: i32 = 0
    if i == 0 {
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].peek_tok_i = ctx[].peek_tok
        jump _Lfinally
    }
    if ctx[].pop_idx + i >= (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(402), "402", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, (ctx[].p_toks[])[(? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) - 1].info_at)) else panic_sigabrt("abort", 73, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].peek_tok_i = @(ctx[].p_toks[])[ctx[].pop_idx + i]
    label _Lfinally
    ;
    return _errval
}
fn parse_identifier(ctx: *struc ParserContext, identifier: *u64) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    identifier[] = ctx[].next_tok[].tok
    label _Lfinally
    ;
    return _errval
}
fn parse_string_literal(ctx: *struc ParserContext, literal: **struc CStringLiteral) i32 {
    value: *i8 = 0
    _errval: i32 = 0
    string_to_literal(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), @value)
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == 87 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        string_to_literal(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), @value)
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    literal[] = make_CStringLiteral(@value)
    label _Lfinally
    ;
    if value {
        loop .. while 0 {
            cast<none>((? (value) then free((cast<*struc stbds_array_header>((value)) - 1)) else cast<none>(0)))
            (value) = 0
        }
        value = 0
    }
    ;
    return _errval
}
fn parse_int_const(intmax: i64) *struc CConst {
    value: i32 = cast<i32>(intmax)
    return make_CConstInt(value)
}
fn parse_char_const(ctx: *struc ParserContext) *struc CConst {
    value: i32 = string_to_char_ascii(((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value))
    return make_CConstInt(value)
}
fn parse_long_const(intmax: i64) *struc CConst {
    value: i64 = cast<i64>(intmax)
    return make_CConstLong(value)
}
fn parse_dbl_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: f64;
    loop .. while 0 {
        _errval = string_to_dbl(ctx[].errors, ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value), ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant[] = make_CConstDouble(value)
    label _Lfinally
    ;
    return _errval
}
fn parse_uint_const(uintmax: u64) *struc CConst {
    value: u32 = cast<u32>(uintmax)
    return make_CConstUInt(value)
}
fn parse_ulong_const(uintmax: u64) *struc CConst {
    value: u64 = cast<u64>(uintmax)
    return make_CConstULong(value)
}
fn parse_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: i64;
    strto_value: string;
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 84 {
            constant[] = make_CConstInt(1)
            jump _Lfinally
        }
        -> 85 {
            constant[] = make_CConstInt(0)
            jump _Lfinally
        }
        -> 88 {
            constant[] = parse_char_const(ctx)
            jump _Lfinally
        }
        -> 93 {
            loop .. while 0 {
                _errval = parse_dbl_const(ctx, constant)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        jump _Lfinally
        otherwise {
            break
        }
    }
    strto_value = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    loop .. while 0 {
        _errval = string_to_long(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if value > 9223372036854775807l {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(403), "403", "", "", strto_value) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 180, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].next_tok[].tok_kind == 89 and value <= 2147483647l {
        constant[] = parse_int_const(value)
    }
    else {
        constant[] = parse_long_const(value)
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_unsigned_const(ctx: *struc ParserContext, constant: **struc CConst) i32 {
    _errval: i32 = 0
    value: u64;
    strto_value: string;
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    strto_value = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((ctx[].next_tok[].tok))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    loop .. while 0 {
        _errval = string_to_ulong(ctx[].errors, strto_value, ctx[].next_tok[].info_at, @value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if value > 18446744073709551615ul {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(404), "404", "", "", strto_value) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 203, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].next_tok[].tok_kind == 91 and value <= 4294967295ul {
        constant[] = parse_uint_const(value)
    }
    else {
        constant[] = parse_ulong_const(value)
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_unop(ctx: *struc ParserContext, unop: *struc CUnaryOp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 10 {
            unop[] = make_CUnaryOp(56)
            break
        }
        -> 11 {
            unop[] = make_CUnaryOp(57)
            break
        }
        -> 12 {
            unop[] = make_CUnaryOp(58)
            break
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(405), "405", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 234, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_binop(ctx: *struc ParserContext, binop: *struc CBinaryOp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 16 {
            -> 35 {
                -> 14 {
                    binop[] = make_CBinaryOp(62)
                    break
                }
            }
        }
        -> 11 {
            -> 36 {
                -> 15 {
                    binop[] = make_CBinaryOp(63)
                    break
                }
            }
        }
        -> 17 {
            -> 37 {
                binop[] = make_CBinaryOp(64)
                break
            }
        }
        -> 18 {
            -> 38 {
                binop[] = make_CBinaryOp(65)
                break
            }
        }
        -> 19 {
            -> 39 {
                binop[] = make_CBinaryOp(66)
                break
            }
        }
        -> 20 {
            -> 40 {
                binop[] = make_CBinaryOp(67)
                break
            }
        }
        -> 21 {
            -> 41 {
                binop[] = make_CBinaryOp(68)
                break
            }
        }
        -> 22 {
            -> 42 {
                binop[] = make_CBinaryOp(69)
                break
            }
        }
        -> 23 {
            -> 43 {
                binop[] = make_CBinaryOp(70)
                break
            }
        }
        -> 24 {
            -> 44 {
                binop[] = make_CBinaryOp(71)
                break
            }
        }
        -> 25 {
            binop[] = make_CBinaryOp(73)
            break
        }
        -> 26 {
            binop[] = make_CBinaryOp(74)
            break
        }
        -> 27 {
            binop[] = make_CBinaryOp(75)
            break
        }
        -> 28 {
            binop[] = make_CBinaryOp(76)
            break
        }
        -> 29 {
            binop[] = make_CBinaryOp(77)
            break
        }
        -> 30 {
            binop[] = make_CBinaryOp(78)
            break
        }
        -> 31 {
            binop[] = make_CBinaryOp(79)
            break
        }
        -> 32 {
            binop[] = make_CBinaryOp(80)
            break
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(406), "406", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 335, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) i32;
fn parse_datatype_specifier(ctx: *struc ParserContext, tag: *u64, is_union: *i32) i32 {
    _errval: i32 = 0
    match ctx[].next_tok[].tok_kind {
        -> 63 {
            is_union[] = 0
            break
        }
        -> 64 {
            is_union[] = 1
            break
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(407), "407", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 356, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].peek_tok, 86)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_identifier(ctx, tag)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_type_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 51 {
            type_specifier[] = make_Char()
            break
        }
        -> 52 {
            type_specifier[] = make_Char()
            type_specifier[] = make_Pointer(type_specifier)
            break
        }
        -> 53 {
            type_specifier[] = make_Int()
            break
        }
        -> 54 {
            type_specifier[] = make_Long()
            break
        }
        -> 55 {
            type_specifier[] = make_SChar()
            break
        }
        -> 56 {
            type_specifier[] = make_Double()
            break
        }
        -> 57 {
            type_specifier[] = make_UInt()
            break
        }
        -> 58 {
            type_specifier[] = make_ULong()
            break
        }
        -> 59 {
            type_specifier[] = make_UChar()
            break
        }
        -> 60 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(417), "417", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 410, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
        -> 63 {
            -> 64 {
                is_union: i32;
                tag: u64;
                loop .. while 0 {
                    _errval = parse_datatype_specifier(ctx, @tag, @is_union)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                type_specifier[] = make_Structure(tag, is_union)
                break
            }
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(408), "408", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 421, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_arr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    constant: *struc CConst = 0
    _errval: i32 = 0
    size: i64 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 84 {
            -> 85 {
                -> 89 {
                    -> 90 {
                        -> 88 {
                            loop .. while 0 {
                                _errval = parse_const(ctx, @constant)
                                if _errval ~= 0 {
                                    jump _Lfinally
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> 91 {
            -> 92 {
                loop .. while 0 {
                    _errval = parse_unsigned_const(ctx, @constant)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(418), "418", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 446, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 7)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match constant[].type {
        -> 47 {
            size = cast<i64>(constant[].get._CConstInt.value)
            break
        }
        -> 48 {
            size = constant[].get._CConstLong.value
            break
        }
        -> 49 {
            size = cast<i64>(constant[].get._CConstUInt.value)
            break
        }
        -> 50 {
            size = cast<i64>(constant[].get._CConstULong.value)
            break
        }
        otherwise {
            panic_sigabrt("abort", 469, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 60 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        type_specifier[] = make_Void()
    }
    else {
        loop .. while 0 {
            _errval = parse_type_name(ctx, type_specifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    type_specifier[] = make_Array(size, type_specifier)
    label _Lfinally
    ;
    free_CConst(@constant)
    return _errval
}
fn parse_ptr_specifier(ctx: *struc ParserContext, type_specifier: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 60 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        type_specifier[] = make_Void()
    }
    else {
        loop .. while 0 {
            _errval = parse_type_name(ctx, type_specifier)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    type_specifier[] = make_Pointer(type_specifier)
    label _Lfinally
    ;
    return _errval
}
fn parse_type_name(ctx: *struc ParserContext, type_name: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 6 {
            loop .. while 0 {
                _errval = parse_arr_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 17 {
            loop .. while 0 {
                _errval = parse_ptr_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                _errval = parse_type_specifier(ctx, type_name)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_maybe_type(ctx: *struc ParserContext, maybe_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 51 {
            -> 52 {
                -> 53 {
                    -> 54 {
                        -> 55 {
                            -> 56 {
                                -> 57 {
                                    -> 58 {
                                        -> 59 {
                                            -> 60 {
                                                -> 63 {
                                                    -> 64 {
                                                        -> 6 {
                                                            -> 17 {
                                                                loop .. while 0 {
                                                                    _errval = parse_type_name(ctx, maybe_type)
                                                                    if _errval ~= 0 {
                                                                        jump _Lfinally
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
        break
        -> 61 {
            loop .. while 0 {
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            maybe_type[] = make_Void()
            break
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(409), "409", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 547, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32;
fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) i32;
fn parse_arg_list(ctx: *struc ParserContext, args: ***struc CExp) i32 {
    arg: *struc CExp = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @arg)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (args[]) or (cast<*struc stbds_array_header>((args[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args[])) - 1)[].capacity) then (((args[]) = stbds_arrgrowf((args[]), sizeof((args[])[]), (1), (0))) and 0) else 0)
            (args[])[(cast<*struc stbds_array_header>((args[])) - 1)[].length++] = (arg)
        }
        arg = 0
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == 8 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = parse_exp(ctx, 0, @arg)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (args[]) or (cast<*struc stbds_array_header>((args[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args[])) - 1)[].capacity) then (((args[]) = stbds_arrgrowf((args[]), sizeof((args[])[]), (1), (0))) and 0) else 0)
                (args[])[(cast<*struc stbds_array_header>((args[])) - 1)[].length++] = (arg)
            }
            arg = 0
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    free_CExp(@arg)
    return _errval
}
fn parse_const_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    constant: *struc CConst = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = parse_const(ctx, @constant)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConstant(@constant, info_at)
    label _Lfinally
    ;
    free_CConst(@constant)
    return _errval
}
fn parse_unsigned_const_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    constant: *struc CConst = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = parse_unsigned_const(ctx, @constant)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConstant(@constant, info_at)
    label _Lfinally
    ;
    free_CConst(@constant)
    return _errval
}
fn parse_string_literal_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    literal: *struc CStringLiteral = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_string_literal(ctx, @literal)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CString(@literal, info_at)
    label _Lfinally
    ;
    free_CStringLiteral(@literal)
    return _errval
}
fn parse_var_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CVar(name, info_at)
    label _Lfinally
    ;
    return _errval
}
fn parse_call_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    args: **struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind ~= 3 {
        loop .. while 0 {
            _errval = parse_arg_list(ctx, @args)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CFunctionCall(name, @args, info_at)
    label _Lfinally
    ;
    loop i: u64 = 0 while i < (? (args) then (cast<*struc stbds_array_header>((args)) - 1)[].length else 0) .. ++i {
        free_CExp(@args[i])
    }
    if args {
        loop .. while 0 {
            cast<none>((? (args) then free((cast<*struc stbds_array_header>((args)) - 1)) else cast<none>(0)))
            (args) = 0
        }
        args = 0
    }
    ;
    return _errval
}
fn parse_cast_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = 0
    target_type: *struc Type = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 29)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_maybe_type(ctx, @target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 31)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 2)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CCast(@cast_exp, @target_type, info_at)
    label _Lfinally
    ;
    free_CExp(@cast_exp)
    free_Type(@target_type)
    return _errval
}
fn parse_inner_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_deref_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 48 {
        info_at = ctx[].peek_tok[].info_at
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = expect_next(ctx, ctx[].peek_tok, 86)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        member: u64;
        loop .. while 0 {
            _errval = parse_identifier(ctx, @member)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        exp[] = make_CArrow(member, exp, info_at)
    }
    else {
        exp[] = make_CDereference(exp, info_at)
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_subscript_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    subscript_exp: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @subscript_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 7)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSubscript(exp, @subscript_exp, info_at)
    label _Lfinally
    ;
    free_CExp(@subscript_exp)
    return _errval
}
fn parse_arr_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 7 {
        loop .. while 0 {
            _errval = parse_deref_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = parse_subscript_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_dot_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].peek_tok, 86)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    member: u64;
    loop .. while 0 {
        _errval = parse_identifier(ctx, @member)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CDot(member, exp, info_at)
    label _Lfinally
    ;
    return _errval
}
fn parse_postfix_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_right: *struc CExp = 0
    exp_right_1: *struc CExp = 0
    constant: *struc CConst = 0
    _errval: i32 = 0
    exp_null: *struc CExp = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(60)
    binop: struc CBinaryOp = make_CBinaryOp(61)
    loop .. while 0 {
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, exp, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    label _Lfinally
    ;
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    return _errval
}
fn parse_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(55)
    loop .. while 0 {
        _errval = parse_unop(ctx, @unop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_unary_exp_factor(ctx, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CUnary(@unop, @cast_exp, info_at)
    label _Lfinally
    ;
    free_CExp(@cast_exp)
    return _errval
}
fn parse_incr_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_left: *struc CExp = 0
    exp_right: *struc CExp = 0
    exp_left_1: *struc CExp = 0
    exp_right_1: *struc CExp = 0
    constant: *struc CConst = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(59)
    binop: struc CBinaryOp = make_CBinaryOp(61)
    loop .. while 0 {
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_unary_exp_factor(ctx, @exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    constant = make_CConstInt(1)
    exp_right = make_CConstant(@constant, info_at)
    exp_right_1 = make_CBinary(@binop, @exp_left, @exp_right, info_at)
    exp[] = make_CAssignment(@unop, @exp_left_1, @exp_right_1, info_at)
    label _Lfinally
    ;
    free_CExp(@exp_left)
    free_CExp(@exp_right)
    free_CExp(@exp_left_1)
    free_CExp(@exp_right_1)
    free_CConst(@constant)
    return _errval
}
fn parse_addrof_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    cast_exp: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_unary_exp_factor(ctx, @cast_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CAddrOf(@cast_exp, info_at)
    label _Lfinally
    ;
    free_CExp(@cast_exp)
    return _errval
}
fn parse_sizeoft_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    target_type: *struc Type = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].next_tok[].info_at
    loop .. while 0 {
        _errval = parse_type_name(ctx, @target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 31)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSizeOfT(@target_type, info_at)
    label _Lfinally
    ;
    free_Type(@target_type)
    return _errval
}
fn parse_sizeof_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    unary_exp: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].next_tok[].info_at
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @unary_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CSizeOf(@unary_exp, info_at)
    label _Lfinally
    ;
    free_CExp(@unary_exp)
    return _errval
}
fn parse_sizeof_unary_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 29 {
            loop .. while 0 {
                _errval = parse_sizeoft_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 2 {
            loop .. while 0 {
                _errval = parse_sizeof_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(410), "410", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 843, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_primary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 84 {
            -> 85 {
                -> 89 {
                    -> 90 {
                        -> 88 {
                            -> 93 {
                                loop .. while 0 {
                                    _errval = parse_const_factor(ctx, exp)
                                    if _errval ~= 0 {
                                        jump _Lfinally
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> 91 {
            -> 92 {
                loop .. while 0 {
                    _errval = parse_unsigned_const_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> 87 {
            loop .. while 0 {
                _errval = parse_string_literal_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 68 {
            loop .. while 0 {
                _errval = parse_cast_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 86 {
            loop .. while 0 {
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == 2 {
                loop .. while 0 {
                    _errval = parse_call_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            else {
                loop .. while 0 {
                    _errval = parse_var_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
        }
        -> 2 {
            loop .. while 0 {
                _errval = parse_inner_exp_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(411), "411", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 888, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_postfix_op_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 6 {
            loop .. while 0 {
                _errval = parse_arr_unary_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 48 {
            loop .. while 0 {
                _errval = parse_dot_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 14 {
            -> 15 {
                loop .. while 0 {
                    _errval = parse_postfix_incr_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_postfix_op_exp_factor(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_postfix_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_primary_exp_factor(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 6 {
            -> 48 {
                -> 14 {
                    -> 15 {
                        loop .. while 0 {
                            _errval = parse_postfix_op_exp_factor(ctx, exp)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_unary_exp_factor(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 10 {
            -> 11 {
                -> 12 {
                    loop .. while 0 {
                        _errval = parse_unary_factor(ctx, exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        -> 14 {
            -> 15 {
                loop .. while 0 {
                    _errval = parse_incr_factor(ctx, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> 13 {
            loop .. while 0 {
                _errval = parse_addrof_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 66 {
            loop .. while 0 {
                _errval = parse_sizeof_unary_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                _errval = parse_postfix_exp_factor(ctx, exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_assign_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(55)
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, precedence, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_left[] = make_CAssignment(@unop, exp_left, @exp_right, info_at)
    label _Lfinally
    ;
    free_CExp(@exp_right)
    return _errval
}
fn parse_assign_compound_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = 0
    exp_right_1: *struc CExp = 0
    _errval: i32 = 0
    exp_null: *struc CExp = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    unop: struc CUnaryOp = make_CUnaryOp(55)
    binop: struc CBinaryOp = make_CBinaryOp(61)
    loop .. while 0 {
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, precedence, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_right_1 = make_CBinary(@binop, exp_left, @exp_right, info_at)
    exp_left[] = make_CAssignment(@unop, @exp_null, @exp_right_1, info_at)
    label _Lfinally
    ;
    free_CExp(@exp_right)
    free_CExp(@exp_right_1)
    return _errval
}
fn parse_binary_exp(ctx: *struc ParserContext, precedence: i32, exp_left: **struc CExp) i32 {
    exp_right: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    binop: struc CBinaryOp = make_CBinaryOp(61)
    loop .. while 0 {
        _errval = parse_binop(ctx, @binop)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, precedence + 1, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp_left[] = make_CBinary(@binop, exp_left, @exp_right, info_at)
    label _Lfinally
    ;
    free_CExp(@exp_right)
    return _errval
}
fn parse_ternary_exp(ctx: *struc ParserContext, exp: **struc CExp) i32 {
    exp_left: *struc CExp = 0
    exp_middle: *struc CExp = 0
    exp_right: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 72)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @exp_middle)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 71)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exp[] = make_CConditional(@exp_left, @exp_middle, @exp_right, info_at)
    label _Lfinally
    ;
    free_CExp(@exp_left)
    free_CExp(@exp_middle)
    free_CExp(@exp_right)
    return _errval
}
fn get_tok_precedence(tok_kind: i32) i32 {
    match tok_kind {
        -> 17 {
            -> 18 {
                -> 19 {
                    return 50
                }
            }
        }
        -> 11 {
            -> 16 {
                return 45
            }
        }
        -> 23 {
            -> 24 {
                return 40
            }
        }
        -> 29 {
            -> 30 {
                -> 31 {
                    -> 32 {
                        return 35
                    }
                }
            }
        }
        -> 27 {
            -> 28 {
                return 30
            }
        }
        -> 20 {
            return 25
        }
        -> 22 {
            return 20
        }
        -> 21 {
            return 15
        }
        -> 25 {
            return 10
        }
        -> 26 {
            return 5
        }
        -> 33 {
            -> 35 {
                -> 36 {
                    -> 37 {
                        -> 38 {
                            -> 39 {
                                -> 40 {
                                    -> 41 {
                                        -> 42 {
                                            -> 43 {
                                                -> 44 {
                                                    return 1
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
            return -1
        }
    }
}
fn parse_exp(ctx: *struc ParserContext, min_precedence: i32, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 46 {
        loop .. while 0 {
            _errval = parse_ternary_exp(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = parse_unary_exp_factor(ctx, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop while 1 {
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        precedence: i32 = get_tok_precedence(ctx[].peek_tok[].tok_kind)
        if precedence < min_precedence {
            break
        }
        match ctx[].peek_tok[].tok_kind {
            -> 16 {
                -> 11 {
                    -> 17 {
                        -> 18 {
                            -> 19 {
                                -> 20 {
                                    -> 21 {
                                        -> 22 {
                                            -> 23 {
                                                -> 24 {
                                                    -> 29 {
                                                        -> 30 {
                                                            -> 31 {
                                                                -> 32 {
                                                                    -> 27 {
                                                                        -> 28 {
                                                                            -> 25 {
                                                                                -> 26 {
                                                                                    loop .. while 0 {
                                                                                        _errval = parse_binary_exp(ctx, precedence, exp)
                                                                                        if _errval ~= 0 {
                                                                                            jump _Lfinally
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
            break
            -> 33 {
                loop .. while 0 {
                    _errval = parse_assign_exp(ctx, precedence, exp)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            -> 35 {
                -> 36 {
                    -> 37 {
                        -> 38 {
                            -> 39 {
                                -> 40 {
                                    -> 41 {
                                        -> 42 {
                                            -> 43 {
                                                -> 44 {
                                                    loop .. while 0 {
                                                        _errval = parse_assign_compound_exp(ctx, precedence, exp)
                                                        if _errval ~= 0 {
                                                            jump _Lfinally
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
            break
            otherwise {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(406), "406", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1137, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) i32;
fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) i32;

fn parse_ret_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    exp: *struc CExp = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 61 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = parse_exp(ctx, 0, @exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    statement[] = make_CReturn(@exp, info_at)
    label _Lfinally
    ;
    free_CExp(@exp)
    return _errval
}
fn parse_exp_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    exp: *struc CExp = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CExpression(@exp)
    label _Lfinally
    ;
    free_CExp(@exp)
    return _errval
}
fn parse_compound_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    block: *struc CBlock = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_block(ctx, @block)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if block {
        statement[] = make_CCompound(@block)
    }
    else {
        statement[] = make_CNull()
    }
    label _Lfinally
    ;
    free_CBlock(@block)
    return _errval
}
fn parse_if_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    condition: *struc CExp = 0
    then: *struc CStatement = 0
    else_fi: *struc CStatement = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_compound_statement(ctx, @then)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 1 {
        loop .. while 0 {
            _errval = peek_next_i(ctx, 1)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        match ctx[].peek_tok_i[].tok_kind {
            -> 70 {
                loop .. while 0 {
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            loop .. while 0 {
                _errval = parse_if_statement(ctx, @else_fi)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
            -> 71 {
                loop .. while 0 {
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            loop .. while 0 {
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                _errval = parse_compound_statement(ctx, @else_fi)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
            otherwise {
                break
            }
        }
    }
    statement[] = make_CIf(@condition, @then, @else_fi)
    label _Lfinally
    ;
    free_CExp(@condition)
    free_CStatement(@then)
    free_CStatement(@else_fi)
    return _errval
}
fn parse_jump_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].peek_tok, 86)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    target: u64;
    loop .. while 0 {
        _errval = parse_identifier(ctx, @target)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CGoto(target, info_at)
    label _Lfinally
    ;
    return _errval
}
fn parse_label_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    jump_to: *struc CStatement = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].peek_tok, 86)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    target: u64;
    loop .. while 0 {
        _errval = parse_identifier(ctx, @target)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    jump_to = make_CNull()
    statement[] = make_CLabel(target, @jump_to, info_at)
    label _Lfinally
    ;
    free_CStatement(@jump_to)
    return _errval
}
fn parse_loop_init_decl(ctx: *struc ParserContext, for_init: **struc CForInit) i32 {
    var_decl: *struc CVariableDeclaration = 0
    _errval: i32 = 0
    storage_class: struc CStorageClass = make_CStorageClass(132)
    loop .. while 0 {
        _errval = parse_var_declaration(ctx, @storage_class, @var_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    for_init[] = make_CInitDecl(@var_decl)
    label _Lfinally
    ;
    free_CVariableDeclaration(@var_decl)
    return _errval
}
fn parse_loop_init_exp(ctx: *struc ParserContext, for_init: **struc CForInit) i32 {
    init: *struc CExp = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    for_init[] = make_CInitExp(@init)
    label _Lfinally
    ;
    free_CExp(@init)
    return _errval
}
fn parse_loop_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    for_init: *struc CForInit = 0
    condition: *struc CExp = 0
    post: *struc CExp = 0
    body: *struc CStatement = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 4 {
            jump Lbreak
        }
        -> 9 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(422), "422", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1288, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
        -> 49 {
            loop .. while 0 {
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                _errval = peek_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok[].tok_kind == 76 {
                loop .. while 0 {
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    _errval = parse_exp(ctx, 0, @condition)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    _errval = parse_compound_statement(ctx, @body)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                statement[] = make_CDoWhile(@condition, @body)
                jump _Lfinally
            }
            else {
                loop .. while 0 {
                    _errval = parse_exp(ctx, 0, @post)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump Lbreak
            }
        }
        -> 76 {
            loop .. while 0 {
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                _errval = parse_exp(ctx, 0, @condition)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            loop .. while 0 {
                _errval = peek_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok[].tok_kind == 49 {
                loop .. while 0 {
                    _errval = pop_next(ctx)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                loop .. while 0 {
                    _errval = parse_exp(ctx, 0, @post)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump Lbreak
            }
            else {
                loop .. while 0 {
                    _errval = parse_compound_statement(ctx, @body)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                statement[] = make_CWhile(@condition, @body)
                jump _Lfinally
            }
        }
        -> 81 {
            -> 82 {
                -> 83 {
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(423), "423", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1322, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
        }
        -> 86 {
            loop .. while 0 {
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == 34 {
                loop .. while 0 {
                    _errval = parse_loop_init_decl(ctx, @for_init)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            else {
                loop .. while 0 {
                    _errval = parse_loop_init_exp(ctx, @for_init)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
        }
        otherwise {
            loop .. while 0 {
                _errval = parse_loop_init_exp(ctx, @for_init)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 76 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = parse_exp(ctx, 0, @condition)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if ctx[].peek_tok[].tok_kind == 49 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = parse_exp(ctx, 0, @post)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label Lbreak
    if not for_init {
        exp_null: *struc CExp = 0
        for_init = make_CInitExp(@exp_null)
    }
    if not condition {
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == 9 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(422), "422", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1356, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = parse_compound_statement(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CFor(@for_init, @condition, @post, @body)
    label _Lfinally
    ;
    free_CForInit(@for_init)
    free_CExp(@condition)
    free_CExp(@post)
    free_CStatement(@body)
    return _errval
}
fn parse_match_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    match: *struc CExp = 0
    body: *struc CStatement = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @match)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_compound_statement(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CSwitch(@match, @body)
    label _Lfinally
    ;
    free_CExp(@match)
    free_CStatement(@body)
    return _errval
}
fn parse_with_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    value: *struc CExp = 0
    jump_to: *struc CStatement = 0
    constant: *struc CConst = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 84 {
            -> 85 {
                -> 89 {
                    -> 90 {
                        -> 88 {
                            loop .. while 0 {
                                _errval = parse_const(ctx, @constant)
                                if _errval ~= 0 {
                                    jump _Lfinally
                                }
                            }
                        }
                    }
                }
            }
        }
        break
        -> 91 {
            -> 92 {
                loop .. while 0 {
                    _errval = parse_unsigned_const(ctx, @constant)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(419), "419", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1404, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    value = make_CConstant(@constant, info_at)
    loop .. while 0 {
        _errval = parse_compound_statement(ctx, @jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CCase(@value, @jump_to)
    label _Lfinally
    ;
    free_CExp(@value)
    free_CStatement(@jump_to)
    free_CConst(@constant)
    return _errval
}
fn parse_otherwise_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    jump_to: *struc CStatement = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_compound_statement(ctx, @jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CDefault(@jump_to, info_at)
    label _Lfinally
    ;
    free_CStatement(@jump_to)
    return _errval
}
fn parse_break_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CBreak(info_at)
    label _Lfinally
    ;
    return _errval
}
fn parse_continue_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CContinue(info_at)
    label _Lfinally
    ;
    return _errval
}
fn parse_null_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    statement[] = make_CNull()
    label _Lfinally
    ;
    return _errval
}
fn parse_statement(ctx: *struc ParserContext, statement: **struc CStatement) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> 67 {
            loop .. while 0 {
                _errval = parse_ret_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        jump _Lfinally
        -> 69 {
            loop .. while 0 {
                _errval = parse_if_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 73 {
            loop .. while 0 {
                _errval = parse_jump_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 74 {
            loop .. while 0 {
                _errval = parse_label_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 4 {
            loop .. while 0 {
                _errval = parse_compound_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 75 {
            loop .. while 0 {
                _errval = parse_loop_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 77 {
            loop .. while 0 {
                _errval = parse_match_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 50 {
            loop .. while 0 {
                _errval = parse_with_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 78 {
            loop .. while 0 {
                _errval = parse_otherwise_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 79 {
            loop .. while 0 {
                _errval = parse_break_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 80 {
            loop .. while 0 {
                _errval = parse_continue_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 9 {
            loop .. while 0 {
                _errval = parse_null_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                _errval = parse_exp_statement(ctx, statement)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32;

fn parse_s_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    statement: *struc CStatement = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_statement(ctx, @statement)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block_item[] = make_CS(@statement)
    label _Lfinally
    ;
    free_CStatement(@statement)
    return _errval
}
fn parse_d_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    declaration: *struc CDeclaration = 0
    _errval: i32 = 0
    storage_class: struc CStorageClass = make_CStorageClass(132)
    loop .. while 0 {
        _errval = parse_declaration(ctx, @storage_class, @declaration)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block_item[] = make_CD(@declaration)
    label _Lfinally
    ;
    free_CDeclaration(@declaration)
    return _errval
}
fn parse_block_item(ctx: *struc ParserContext, block_item: **struc CBlockItem) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> 81 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(426), "426", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1541, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
        -> 82 {
            -> 83 {
                -> 62 {
                    -> 65 {
                        loop .. while 0 {
                            _errval = parse_d_block_item(ctx, block_item)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        jump _Lfinally
        -> 86 {
            loop .. while 0 {
                _errval = peek_next_i(ctx, 1)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            if ctx[].peek_tok_i[].tok_kind == 34 {
                loop .. while 0 {
                    _errval = parse_d_block_item(ctx, block_item)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
                jump _Lfinally
            }
            break
        }
        otherwise {
            break
        }
    }
    loop .. while 0 {
        _errval = parse_s_block_item(ctx, block_item)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_b_block(ctx: *struc ParserContext, block: **struc CBlock) i32 {
    block_item: *struc CBlockItem = 0
    block_items: **struc CBlockItem = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 1 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if ctx[].peek_tok[].tok_kind == 5 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(420), "420", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1574, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_block_item(ctx, @block_item)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (block_items) or (cast<*struc stbds_array_header>((block_items)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((block_items)) - 1)[].capacity) then (((block_items) = stbds_arrgrowf((block_items), sizeof((block_items)[]), (1), (0))) and 0) else 0)
            (block_items)[(cast<*struc stbds_array_header>((block_items)) - 1)[].length++] = (block_item)
        }
        block_item = 0
    }
    loop while 1 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].next_tok[].tok_kind == 5 {
            break
        }
        loop .. while 0 {
            _errval = expect_next(ctx, ctx[].next_tok, 1)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == 5 {
            loop .. while 0 {
                _errval = pop_next(ctx)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
        }
        loop .. while 0 {
            _errval = parse_block_item(ctx, @block_item)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (block_items) or (cast<*struc stbds_array_header>((block_items)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((block_items)) - 1)[].capacity) then (((block_items) = stbds_arrgrowf((block_items), sizeof((block_items)[]), (1), (0))) and 0) else 0)
                (block_items)[(cast<*struc stbds_array_header>((block_items)) - 1)[].length++] = (block_item)
            }
            block_item = 0
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 5)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    block[] = make_CB(@block_items)
    label _Lfinally
    ;
    free_CBlockItem(@block_item)
    loop i: u64 = 0 while i < (? (block_items) then (cast<*struc stbds_array_header>((block_items)) - 1)[].length else 0) .. ++i {
        free_CBlockItem(@block_items[i])
    }
    if block_items {
        loop .. while 0 {
            cast<none>((? (block_items) then free((cast<*struc stbds_array_header>((block_items)) - 1)) else cast<none>(0)))
            (block_items) = 0
        }
        block_items = 0
    }
    ;
    return _errval
}
fn parse_block(ctx: *struc ParserContext, block: **struc CBlock) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 9 {
            break
        }
        -> 4 {
            loop .. while 0 {
                _errval = parse_b_block(ctx, block)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(414), "414", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 1615, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) i32;
fn parse_single_init(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    exp: *struc CExp = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_exp(ctx, 0, @exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    initializer[] = make_CSingleInit(@exp)
    label _Lfinally
    ;
    free_CExp(@exp)
    return _errval
}
fn parse_compound_init(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    initializers: **struc CInitializer = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 2)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 3 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(421), "421", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1641, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_initializer(ctx, initializer)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (initializers) or (cast<*struc stbds_array_header>((initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((initializers)) - 1)[].capacity) then (((initializers) = stbds_arrgrowf((initializers), sizeof((initializers)[]), (1), (0))) and 0) else 0)
            (initializers)[(cast<*struc stbds_array_header>((initializers)) - 1)[].length++] = (initializer[])
        }
        initializer[] = 0
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].next_tok[].tok_kind == 8 {
        loop .. while 0 {
            _errval = parse_initializer(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (initializers) or (cast<*struc stbds_array_header>((initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((initializers)) - 1)[].capacity) then (((initializers) = stbds_arrgrowf((initializers), sizeof((initializers)[]), (1), (0))) and 0) else 0)
                (initializers)[(cast<*struc stbds_array_header>((initializers)) - 1)[].length++] = (initializer[])
            }
            initializer[] = 0
        }
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    initializer[] = make_CCompoundInit(@initializers)
    label _Lfinally
    ;
    loop i: u64 = 0 while i < (? (initializers) then (cast<*struc stbds_array_header>((initializers)) - 1)[].length else 0) .. ++i {
        free_CInitializer(@initializers[i])
    }
    if initializers {
        loop .. while 0 {
            cast<none>((? (initializers) then free((cast<*struc stbds_array_header>((initializers)) - 1)) else cast<none>(0)))
            (initializers) = 0
        }
        initializers = 0
    }
    ;
    return _errval
}
fn parse_initializer(ctx: *struc ParserContext, initializer: **struc CInitializer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 47 {
        loop .. while 0 {
            _errval = parse_compound_init(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = parse_single_init(ctx, initializer)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].peek_tok, 86)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_identifier(ctx, name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 34)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_type_name(ctx, derived_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_item_decltor(ctx: *struc ParserContext, name: *u64, derived_type: **struc Type) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> 81 {
            -> 82 {
                -> 83 {
                    loop .. while 0 {
                        ?                         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(424), "424", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1694, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                        _errval = 1
                        jump _Lfinally
                    }
                }
            }
        }
        otherwise {
            break
        }
    }
    loop .. while 0 {
        _errval = parse_decltor(ctx, name, derived_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_decltor_list(ctx: *struc ParserContext, params: **u64, param_types: ***struc Type) i32 {
    param_type: *struc Type = 0
    _errval: i32 = 0
    param: u64;
    loop .. while 0 {
        _errval = parse_item_decltor(ctx, @param, @param_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        (? (not (params[]) or (cast<*struc stbds_array_header>((params[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((params[])) - 1)[].capacity) then (((params[]) = stbds_arrgrowf((params[]), sizeof((params[])[]), (1), (0))) and 0) else 0)
        (params[])[(cast<*struc stbds_array_header>((params[])) - 1)[].length++] = (param)
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (param_types[]) or (cast<*struc stbds_array_header>((param_types[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((param_types[])) - 1)[].capacity) then (((param_types[]) = stbds_arrgrowf((param_types[]), sizeof((param_types[])[]), (1), (0))) and 0) else 0)
            (param_types[])[(cast<*struc stbds_array_header>((param_types[])) - 1)[].length++] = (param_type)
        }
        param_type = 0
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].peek_tok[].tok_kind == 8 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = parse_item_decltor(ctx, @param, @param_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            (? (not (params[]) or (cast<*struc stbds_array_header>((params[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((params[])) - 1)[].capacity) then (((params[]) = stbds_arrgrowf((params[]), sizeof((params[])[]), (1), (0))) and 0) else 0)
            (params[])[(cast<*struc stbds_array_header>((params[])) - 1)[].length++] = (param)
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (param_types[]) or (cast<*struc stbds_array_header>((param_types[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((param_types[])) - 1)[].capacity) then (((param_types[]) = stbds_arrgrowf((param_types[]), sizeof((param_types[])[]), (1), (0))) and 0) else 0)
                (param_types[])[(cast<*struc stbds_array_header>((param_types[])) - 1)[].length++] = (param_type)
            }
            param_type = 0
        }
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    free_Type(@param_type)
    return _errval
}
fn parse_fun_decltor(ctx: *struc ParserContext, fun_type: **struc Type, params: **u64) i32 {
    param_types: **struc Type = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 2)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 61 {
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = parse_decltor_list(ctx, params, @param_types)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_maybe_type(ctx, fun_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    fun_type[] = make_FunType(@param_types, fun_type)
    label _Lfinally
    ;
    loop i: u64 = 0 while i < (? (param_types) then (cast<*struc stbds_array_header>((param_types)) - 1)[].length else 0) .. ++i {
        free_Type(@param_types[i])
    }
    if param_types {
        loop .. while 0 {
            cast<none>((? (param_types) then free((cast<*struc stbds_array_header>((param_types)) - 1)) else cast<none>(0)))
            (param_types) = 0
        }
        param_types = 0
    }
    ;
    return _errval
}
fn parse_fun_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, fun_decl: **struc CFunctionDeclaration) i32 {
    body: *struc CBlock = 0
    fun_type: *struc Type = 0
    params: *u64 = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].peek_tok, 86)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    name: u64;
    loop .. while 0 {
        _errval = parse_identifier(ctx, @name)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_fun_decltor(ctx, @fun_type, @params)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_block(ctx, @body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    fun_decl[] = make_CFunctionDeclaration(name, @params, @body, @fun_type, storage_class, info_at)
    label _Lfinally
    ;
    free_CBlock(@body)
    free_Type(@fun_type)
    if params {
        loop .. while 0 {
            cast<none>((? (params) then free((cast<*struc stbds_array_header>((params)) - 1)) else cast<none>(0)))
            (params) = 0
        }
        params = 0
    }
    ;
    return _errval
}
fn parse_var_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, var_decl: **struc CVariableDeclaration) i32 {
    initializer: *struc CInitializer = 0
    var_type: *struc Type = 0
    _errval: i32 = 0
    info_at: u64 = ctx[].peek_tok[].info_at
    name: u64;
    loop .. while 0 {
        _errval = parse_decltor(ctx, @name, @var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 9 {
            break
        }
        -> 33 {
            loop .. while 0 {
                _errval = parse_initializer(ctx, @initializer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(412), "412", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 1793, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    var_decl[] = make_CVariableDeclaration(name, @initializer, @var_type, storage_class, info_at)
    label _Lfinally
    ;
    free_CInitializer(@initializer)
    free_Type(@var_type)
    return _errval
}
fn parse_member_declaration(ctx: *struc ParserContext, member_decl: **struc CMemberDeclaration) i32 {
    member_type: *struc Type = 0
    _errval: i32 = 0
    info_at: u64;
    member_name: u64;
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    info_at = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = parse_item_decltor(ctx, @member_name, @member_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    member_decl[] = make_CMemberDeclaration(member_name, @member_type, info_at)
    label _Lfinally
    ;
    free_Type(@member_type)
    return _errval
}
fn parse_member_list(ctx: *struc ParserContext, members: ***struc CMemberDeclaration) i32 {
    member: *struc CMemberDeclaration = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_member_declaration(ctx, @member)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (members[]) or (cast<*struc stbds_array_header>((members[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((members[])) - 1)[].capacity) then (((members[]) = stbds_arrgrowf((members[]), sizeof((members[])[]), (1), (0))) and 0) else 0)
            (members[])[(cast<*struc stbds_array_header>((members[])) - 1)[].length++] = (member)
        }
        member = 0
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop while ctx[].next_tok[].tok_kind == 8 {
        loop .. while 0 {
            _errval = parse_member_declaration(ctx, @member)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (members[]) or (cast<*struc stbds_array_header>((members[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((members[])) - 1)[].capacity) then (((members[]) = stbds_arrgrowf((members[]), sizeof((members[])[]), (1), (0))) and 0) else 0)
                (members[])[(cast<*struc stbds_array_header>((members[])) - 1)[].length++] = (member)
            }
            member = 0
        }
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = expect_next(ctx, ctx[].next_tok, 3)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    free_CMemberDeclaration(@member)
    return _errval
}
fn parse_type_declaration(ctx: *struc ParserContext, struct_decl: **struc CStructDeclaration) i32 {
    members: **struc CMemberDeclaration = 0
    _errval: i32 = 0
    is_union: i32;
    tag: u64;
    info_at: u64 = ctx[].peek_tok[].info_at
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = parse_datatype_specifier(ctx, @tag, @is_union)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].next_tok[].tok_kind {
        -> 9 {
            break
        }
        -> 2 {
            loop .. while 0 {
                _errval = parse_member_list(ctx, @members)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(413), "413", "", "", get_tok_fmt(ctx[].identifiers, ctx[].next_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].next_tok[].info_at)) else panic_sigabrt("abort", 1853, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    struct_decl[] = make_CStructDeclaration(tag, is_union, @members, info_at)
    label _Lfinally
    ;
    loop i: u64 = 0 while i < (? (members) then (cast<*struc stbds_array_header>((members)) - 1)[].length else 0) .. ++i {
        free_CMemberDeclaration(@members[i])
    }
    if members {
        loop .. while 0 {
            cast<none>((? (members) then free((cast<*struc stbds_array_header>((members)) - 1)) else cast<none>(0)))
            (members) = 0
        }
        members = 0
    }
    ;
    return _errval
}
fn parse_fun_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    fun_decl: *struc CFunctionDeclaration = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_fun_declaration(ctx, storage_class, @fun_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CFunDecl(@fun_decl)
    label _Lfinally
    ;
    free_CFunctionDeclaration(@fun_decl)
    return _errval
}
fn parse_var_decl(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    var_decl: *struc CVariableDeclaration = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_var_declaration(ctx, storage_class, @var_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CVarDecl(@var_decl)
    label _Lfinally
    ;
    free_CVariableDeclaration(@var_decl)
    return _errval
}
fn parse_type_decl(ctx: *struc ParserContext, declaration: **struc CDeclaration) i32 {
    struct_decl: *struc CStructDeclaration = 0
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_type_declaration(ctx, @struct_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    declaration[] = make_CStructDecl(@struct_decl)
    label _Lfinally
    ;
    free_CStructDeclaration(@struct_decl)
    return _errval
}
fn parse_storage_class(ctx: *struc ParserContext, storage_class: *struc CStorageClass) i32 {
    _errval: i32 = 0
    match ctx[].peek_tok[].tok_kind {
        -> 81 {
            storage_class[] = make_CStorageClass(132)
            break
        }
        -> 82 {
            storage_class[] = make_CStorageClass(133)
            break
        }
        -> 83 {
            storage_class[] = make_CStorageClass(134)
            break
        }
        -> 62 {
            -> 86 {
                -> 65 {
                    jump _Lfinally
                }
            }
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(416), "416", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1916, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = pop_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = peek_next(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if ctx[].peek_tok[].tok_kind == 65 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(425), "425", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1922, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_declaration(ctx: *struc ParserContext, storage_class: *struc CStorageClass, declaration: **struc CDeclaration) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_storage_class(ctx, storage_class)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match ctx[].peek_tok[].tok_kind {
        -> 62 {
            loop .. while 0 {
                _errval = parse_fun_decl(ctx, storage_class, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 86 {
            loop .. while 0 {
                _errval = parse_var_decl(ctx, storage_class, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 65 {
            loop .. while 0 {
                _errval = parse_type_decl(ctx, declaration)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(415), "415", "", "", get_tok_fmt(ctx[].identifiers, ctx[].peek_tok)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1945, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn parse_program(ctx: *struc ParserContext, c_ast: **struc CProgram) i32 {
    declaration: *struc CDeclaration = 0
    declarations: **struc CDeclaration = 0
    _errval: i32 = 0
    loop while ctx[].pop_idx < (? (ctx[].p_toks[]) then (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length else 0) {
        storage_class: struc CStorageClass = make_CStorageClass(133)
        loop .. while 0 {
            _errval = peek_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if ctx[].peek_tok[].tok_kind == 82 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_parser_msg(427), "427", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].peek_tok[].info_at)) else panic_sigabrt("abort", 1962, "/home/romain/proj/planet/selfhost/wheelcc/frontend/parser.c")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = parse_declaration(ctx, @storage_class, @declaration)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (declarations) or (cast<*struc stbds_array_header>((declarations)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((declarations)) - 1)[].capacity) then (((declarations) = stbds_arrgrowf((declarations), sizeof((declarations)[]), (1), (0))) and 0) else 0)
                (declarations)[(cast<*struc stbds_array_header>((declarations)) - 1)[].length++] = (declaration)
            }
            declaration = 0
        }
        loop .. while 0 {
            _errval = pop_next(ctx)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = expect_next(ctx, ctx[].next_tok, 1)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    c_ast[] = make_CProgram(@declarations)
    label _Lfinally
    ;
    free_CDeclaration(@declaration)
    loop i: u64 = 0 while i < (? (declarations) then (cast<*struc stbds_array_header>((declarations)) - 1)[].length else 0) .. ++i {
        free_CDeclaration(@declarations[i])
    }
    if declarations {
        loop .. while 0 {
            cast<none>((? (declarations) then free((cast<*struc stbds_array_header>((declarations)) - 1)) else cast<none>(0)))
            (declarations) = 0
        }
        declarations = 0
    }
    ;
    return _errval
}
pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32 {
    ctx: struc ParserContext;
    {
        ctx.errors = errors
        ctx.identifiers = identifiers
        ctx.pop_idx = 0
        ctx.p_toks = tokens
    }
    _errval: i32 = 0
    loop .. while 0 {
        _errval = parse_program(@ctx, c_ast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    ;
    ;
    label _Lfinally
    ;
    if tokens[] {
        loop .. while 0 {
            cast<none>((? (tokens[]) then free((cast<*struc stbds_array_header>((tokens[])) - 1)) else cast<none>(0)))
            (tokens[]) = 0
        }
        tokens[] = 0
    }
    ;
    return _errval
}
