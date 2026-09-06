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
type struc CProgram;
type struc ErrorsContext;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32;

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
type struc PairTIdentifierStStructure(key: u64, value: struc Structure)
type struc SemanticContext(    errors: *struc ErrorsContext    , frontend: *struc FrontEndContext    , identifiers: *struc IdentifierContext    , extern_scope_map: *struc PairTIdentifierulong_t    , goto_map: *struc PairTIdentifierTIdentifier    , scoped_identifier_maps: **struc PairTIdentifierTIdentifier    , scoped_struct_maps: **struc PairTIdentifierStStructure    , label_set: *struc ElementTIdentifier    , break_loop_labels: *u64    , continue_loop_labels: *u64    , fun_def_name: u64    , p_switch_statement: *struc CSwitch    , fun_def_set: *struc ElementTIdentifier    , struct_def_set: *struc ElementTIdentifier    , union_def_set: *struc ElementTIdentifier    , p_static_inits: ***struc StaticInit    )
fn is_same_type(type_1: *struc Type, type_2: *struc Type) i32;
fn is_same_ptr(ptr_type_1: *struc Pointer, ptr_type_2: *struc Pointer) i32 {
    return is_same_type(ptr_type_1[].ref_type, ptr_type_2[].ref_type)
}
fn is_same_arr(arr_type_1: *struc Array, arr_type_2: *struc Array) i32 {
    return arr_type_1[].size == arr_type_2[].size and is_same_type(arr_type_1[].elem_type, arr_type_2[].elem_type)
}
fn is_same_struct(struct_type_1: *struc Structure, struct_type_2: *struc Structure) i32 {
    return struct_type_1[].tag == struct_type_2[].tag
}
fn is_same_type(type_1: *struc Type, type_2: *struc Type) i32 {
    if type_1[].type == type_2[].type {
        match type_1[].type {
            -> 11 {
                return is_same_ptr(@type_1[].get._Pointer, @type_2[].get._Pointer)
            }
            -> 12 {
                return is_same_arr(@type_1[].get._Array, @type_2[].get._Array)
            }
            -> 13 {
                return is_same_struct(@type_1[].get._Structure, @type_2[].get._Structure)
            }
            -> 10 {
                panic_sigabrt("abort", 73, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            }
            otherwise {
                return 1
            }
        }
    }
    return 0
}
fn is_same_fun_type(fun_type_1: *struc FunType, fun_type_2: *struc FunType) i32 {
    if (? (fun_type_1[].param_types) then (cast<*struc stbds_array_header>((fun_type_1[].param_types)) - 1)[].length else 0) ~= (? (fun_type_2[].param_types) then (cast<*struc stbds_array_header>((fun_type_2[].param_types)) - 1)[].length else 0)     or not is_same_type(fun_type_1[].ret_type, fun_type_2[].ret_type) {
        return 0
    }
    loop i: u64 = 0 while i < (? (fun_type_1[].param_types) then (cast<*struc stbds_array_header>((fun_type_1[].param_types)) - 1)[].length else 0) .. ++i {
        if not is_same_type(fun_type_1[].param_types[i], fun_type_2[].param_types[i]) {
            return 0
        }
    }
    return 1
}
fn is_type_signed(type: *struc Type) i32 {
    match type[].type {
        -> 1 {
            -> 2 {
                -> 4 {
                    -> 5 {
                        -> 8 {
                            return 1
                        }
                    }
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_type_char(type: *struc Type) i32 {
    match type[].type {
        -> 1 {
            -> 2 {
                -> 3 {
                    return 1
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_type_int(type: *struc Type) i32 {
    match type[].type {
        -> 1 {
            -> 2 {
                -> 4 {
                    -> 5 {
                        -> 3 {
                            -> 6 {
                                -> 7 {
                                    return 1
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_type_arithmetic(type: *struc Type) i32 {
    match type[].type {
        -> 1 {
            -> 2 {
                -> 4 {
                    -> 5 {
                        -> 8 {
                            -> 3 {
                                -> 6 {
                                    -> 7 {
                                        return 1
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_type_scalar(type: *struc Type) i32 {
    match type[].type {
        -> 1 {
            -> 2 {
                -> 4 {
                    -> 5 {
                        -> 8 {
                            -> 3 {
                                -> 6 {
                                    -> 7 {
                                        -> 11 {
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
        otherwise {
            return 0
        }
    }
}
fn is_struct_complete(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    return (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp) ~= -1
}
fn is_type_complete(ctx: *struc SemanticContext, type: *struc Type) i32 {
    match type[].type {
        -> 9 {
            return 0
        }
        -> 13 {
            return is_struct_complete(ctx, @type[].get._Structure)
        }
        otherwise {
            return 1
        }
    }
}
fn is_valid_type(ctx: *struc SemanticContext, type: *struc Type) i32;
fn is_valid_ptr(ctx: *struc SemanticContext, ptr_type: *struc Pointer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = is_valid_type(ctx, ptr_type[].ref_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn is_valid_arr(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_complete(ctx, arr_type[].elem_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(501), "501", "", get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, arr_type[].elem_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort", 196, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = is_valid_type(ctx, arr_type[].elem_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn is_valid_type(ctx: *struc SemanticContext, type: *struc Type) i32 {
    _errval: i32 = 0
    match type[].type {
        -> 11 {
            loop .. while 0 {
                _errval = is_valid_ptr(ctx, @type[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 12 {
            loop .. while 0 {
                _errval = is_valid_arr(ctx, @type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 10 {
            panic_sigabrt("abort", 217, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn is_exp_lvalue(node: *struc CExp) i32;
fn is_dot_exp_lvalue(node: *struc CDot) i32 {
    return is_exp_lvalue(node[].structure)
}
fn is_exp_lvalue(node: *struc CExp) i32 {
    match node[].type {
        -> 93 {
            -> 94 {
                -> 101 {
                    -> 103 {
                        -> 107 {
                            return 1
                        }
                    }
                }
            }
        }
        -> 106 {
            return is_dot_exp_lvalue(@node[].get._CDot)
        }
        otherwise {
            return 0
        }
    }
}
fn is_const_null_ptr(node: *struc CConstant) i32 {
    match node[].constant[].type {
        -> 47 {
            return node[].constant[].get._CConstInt.value == 0
        }
        -> 48 {
            return node[].constant[].get._CConstLong.value == 0l
        }
        -> 49 {
            return node[].constant[].get._CConstUInt.value == 0u
        }
        -> 50 {
            return node[].constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            return 0
        }
    }
}
fn get_scalar_size(type: *struc Type) i32 {
    match type[].type {
        -> 1 {
            -> 2 {
                -> 3 {
                    return 1
                }
            }
        }
        -> 4 {
            -> 6 {
                return 4
            }
        }
        -> 5 {
            -> 8 {
                -> 7 {
                    -> 11 {
                        return 8
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort", 274, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_type_scale(ctx: *struc SemanticContext, type: *struc Type) i64;
fn get_arr_scale(ctx: *struc SemanticContext, arr_type: *struc Array) i64 {
    size: i64 = arr_type[].size
    loop while arr_type[].elem_type[].type == 12 {
        arr_type = @arr_type[].elem_type[].get._Array
        size *= arr_type[].size
    }
    return get_type_scale(ctx, arr_type[].elem_type) * size
}
fn get_struct_scale(ctx: *struc SemanticContext, struct_type: *struc Structure) i64 {
    ;
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
}
fn get_type_scale(ctx: *struc SemanticContext, type: *struc Type) i64 {
    match type[].type {
        -> 12 {
            return get_arr_scale(ctx, @type[].get._Array)
        }
        -> 13 {
            return get_struct_scale(ctx, @type[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type)
        }
    }
}
fn get_type_alignment(ctx: *struc SemanticContext, type: *struc Type) i32;
fn get_arr_alignment(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    return get_type_alignment(ctx, arr_type[].elem_type)
}
fn get_struct_alignment(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    ;
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].alignment
}
fn get_type_alignment(ctx: *struc SemanticContext, type: *struc Type) i32 {
    match type[].type {
        -> 12 {
            return get_arr_alignment(ctx, @type[].get._Array)
        }
        -> 13 {
            return get_struct_alignment(ctx, @type[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type)
        }
    }
}
fn get_joint_type(node_1: *struc CExp, node_2: *struc CExp) *struc Type {
    joint_type: *struc Type = 0
    if is_type_char(node_1[].exp_type) {
        exp_type: *struc Type = 0
        if node_1[].exp_type ~= exp_type {
            free_Type(@exp_type)
            exp_type = node_1[].exp_type
            node_1[].exp_type = 0
        }
        ;
        node_1[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        if exp_type ~= node_1[].exp_type {
            free_Type(@node_1[].exp_type)
            node_1[].exp_type = exp_type
            exp_type = 0
        }
        ;
    }
    elif is_type_char(node_2[].exp_type) {
        exp_type: *struc Type = 0
        if node_2[].exp_type ~= exp_type {
            free_Type(@exp_type)
            exp_type = node_2[].exp_type
            node_2[].exp_type = 0
        }
        ;
        node_2[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        if exp_type ~= node_2[].exp_type {
            free_Type(@node_2[].exp_type)
            node_2[].exp_type = exp_type
            exp_type = 0
        }
        ;
    }
    elif is_same_type(node_1[].exp_type, node_2[].exp_type) {
        if node_1[].exp_type ~= joint_type {
            free_Type(@joint_type)
            joint_type = node_1[].exp_type
            (joint_type)[]._ref_count++
        }
        ;
    }
    elif node_1[].exp_type[].type == 8 or node_2[].exp_type[].type == 8 {
        joint_type = make_Double()
    }
    else {
        type_size_1: i32 = get_scalar_size(node_1[].exp_type)
        type_size_2: i32 = get_scalar_size(node_2[].exp_type)
        if type_size_1 == type_size_2 {
            if is_type_signed(node_1[].exp_type) {
                if node_2[].exp_type ~= joint_type {
                    free_Type(@joint_type)
                    joint_type = node_2[].exp_type
                    (joint_type)[]._ref_count++
                }
                ;
            }
            else {
                if node_1[].exp_type ~= joint_type {
                    free_Type(@joint_type)
                    joint_type = node_1[].exp_type
                    (joint_type)[]._ref_count++
                }
                ;
            }
        }
        elif type_size_1 > type_size_2 {
            if node_1[].exp_type ~= joint_type {
                free_Type(@joint_type)
                joint_type = node_1[].exp_type
                (joint_type)[]._ref_count++
            }
            ;
        }
        else {
            if node_2[].exp_type ~= joint_type {
                free_Type(@joint_type)
                joint_type = node_2[].exp_type
                (joint_type)[]._ref_count++
            }
            ;
        }
    }
    return joint_type
}
fn get_joint_ptr_type(ctx: *struc SemanticContext, node_1: *struc CExp, node_2: *struc CExp, joint_type: **struc Type) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if is_same_type(node_1[].exp_type, node_2[].exp_type) {
        if node_1[].exp_type ~= joint_type[] {
            free_Type(@joint_type[])
            joint_type[] = node_1[].exp_type
            (joint_type[])[]._ref_count++
        }
        ;
    }
    elif node_1[].type == 92 and is_const_null_ptr(@node_1[].get._CConstant) {
        if node_2[].exp_type ~= joint_type[] {
            free_Type(@joint_type[])
            joint_type[] = node_2[].exp_type
            (joint_type[])[]._ref_count++
        }
        ;
    }
    elif (node_2[].type == 92 and is_const_null_ptr(@node_2[].get._CConstant))     or (node_1[].exp_type[].type == 11 and node_1[].exp_type[].get._Pointer.ref_type[].type == 9         and node_2[].exp_type[].type == 11) {
        if node_1[].exp_type ~= joint_type[] {
            free_Type(@joint_type[])
            joint_type[] = node_1[].exp_type
            (joint_type[])[]._ref_count++
        }
        ;
    }
    elif node_2[].exp_type[].type == 11 and node_2[].exp_type[].get._Pointer.ref_type[].type == 9     and node_1[].exp_type[].type == 11 {
        if node_2[].exp_type ~= joint_type[] {
            free_Type(@joint_type[])
            joint_type[] = node_2[].exp_type
            (joint_type[])[]._ref_count++
        }
        ;
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(502), "502", "", get_type_fmt(ctx[].identifiers, node_1[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node_2[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node_1[].info_at)) else panic_sigabrt("abort", 388, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn get_const_char_value(node: *struc CConstant) i8 {
    match node[].constant[].type {
        -> 52 {
            return node[].constant[].get._CConstChar.value
        }
        -> 47 {
            return cast<i8>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return cast<i8>(node[].constant[].get._CConstLong.value)
        }
        -> 51 {
            return cast<i8>(node[].constant[].get._CConstDouble.value)
        }
        -> 53 {
            return cast<i8>(node[].constant[].get._CConstUChar.value)
        }
        -> 49 {
            return cast<i8>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return cast<i8>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort", 415, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_int_value(node: *struc CConstant) i32 {
    match node[].constant[].type {
        -> 52 {
            return cast<i32>(node[].constant[].get._CConstChar.value)
        }
        -> 47 {
            return node[].constant[].get._CConstInt.value
        }
        -> 48 {
            return cast<i32>(node[].constant[].get._CConstLong.value)
        }
        -> 51 {
            return cast<i32>(node[].constant[].get._CConstDouble.value)
        }
        -> 53 {
            return cast<i32>(node[].constant[].get._CConstUChar.value)
        }
        -> 49 {
            return cast<i32>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return cast<i32>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort", 436, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_long_value(node: *struc CConstant) i64 {
    match node[].constant[].type {
        -> 52 {
            return cast<i64>(node[].constant[].get._CConstChar.value)
        }
        -> 47 {
            return cast<i64>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return node[].constant[].get._CConstLong.value
        }
        -> 51 {
            return cast<i64>(node[].constant[].get._CConstDouble.value)
        }
        -> 53 {
            return cast<i64>(node[].constant[].get._CConstUChar.value)
        }
        -> 49 {
            return cast<i64>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return cast<i64>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort", 457, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_dbl_value(node: *struc CConstant) f64 {
    match node[].constant[].type {
        -> 52 {
            return cast<f64>(node[].constant[].get._CConstChar.value)
        }
        -> 47 {
            return cast<f64>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return cast<f64>(node[].constant[].get._CConstLong.value)
        }
        -> 51 {
            return node[].constant[].get._CConstDouble.value
        }
        -> 53 {
            return cast<f64>(node[].constant[].get._CConstUChar.value)
        }
        -> 49 {
            return cast<f64>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return cast<f64>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort", 478, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_uchar_value(node: *struc CConstant) u8 {
    match node[].constant[].type {
        -> 52 {
            return cast<u8>(node[].constant[].get._CConstChar.value)
        }
        -> 47 {
            return cast<u8>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return cast<u8>(node[].constant[].get._CConstLong.value)
        }
        -> 51 {
            return cast<u8>(node[].constant[].get._CConstDouble.value)
        }
        -> 53 {
            return node[].constant[].get._CConstUChar.value
        }
        -> 49 {
            return cast<u8>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return cast<u8>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort", 499, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_uint_value(node: *struc CConstant) u32 {
    match node[].constant[].type {
        -> 52 {
            return cast<u32>(node[].constant[].get._CConstChar.value)
        }
        -> 47 {
            return cast<u32>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return cast<u32>(node[].constant[].get._CConstLong.value)
        }
        -> 51 {
            return cast<u32>(node[].constant[].get._CConstDouble.value)
        }
        -> 53 {
            return cast<u32>(node[].constant[].get._CConstUChar.value)
        }
        -> 49 {
            return node[].constant[].get._CConstUInt.value
        }
        -> 50 {
            return cast<u32>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort", 520, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_ulong_value(node: *struc CConstant) u64 {
    match node[].constant[].type {
        -> 52 {
            return cast<u64>(node[].constant[].get._CConstChar.value)
        }
        -> 47 {
            return cast<u64>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return cast<u64>(node[].constant[].get._CConstLong.value)
        }
        -> 51 {
            return cast<u64>(node[].constant[].get._CConstDouble.value)
        }
        -> 53 {
            return cast<u64>(node[].constant[].get._CConstUChar.value)
        }
        -> 49 {
            return cast<u64>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return node[].constant[].get._CConstULong.value
        }
        otherwise {
            panic_sigabrt("abort", 541, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_const_ptr_value(node: *struc CConstant) u64 {
    match node[].constant[].type {
        -> 47 {
            return cast<u64>(node[].constant[].get._CConstInt.value)
        }
        -> 48 {
            return cast<u64>(node[].constant[].get._CConstLong.value)
        }
        -> 49 {
            return cast<u64>(node[].constant[].get._CConstUInt.value)
        }
        -> 50 {
            return node[].constant[].get._CConstULong.value
        }
        otherwise {
            panic_sigabrt("abort", 556, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn get_compound_info_at(node: *struc CCompoundInit) u64 {
    ;
    initializer: *struc CInitializer = node[].initializers[0]
    loop while initializer[].type == 137 {
        node = @initializer[].get._CCompoundInit
        ;
        initializer = node[].initializers[0]
    }
    ;
    return initializer[].get._CSingleInit.exp[].info_at
}
fn reslv_struct_type(ctx: *struc SemanticContext, type: *struc Type) i32;
fn check_const_exp(node: *struc CConstant) none {
    match node[].constant[].type {
        -> 52 {
            node[]._base[].exp_type = make_Char()
            break
        }
        -> 47 {
            node[]._base[].exp_type = make_Int()
            break
        }
        -> 48 {
            node[]._base[].exp_type = make_Long()
            break
        }
        -> 51 {
            node[]._base[].exp_type = make_Double()
            break
        }
        -> 53 {
            node[]._base[].exp_type = make_UChar()
            break
        }
        -> 49 {
            node[]._base[].exp_type = make_UInt()
            break
        }
        -> 50 {
            node[]._base[].exp_type = make_ULong()
            break
        }
        otherwise {
            panic_sigabrt("abort", 605, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
}
fn check_string_exp(node: *struc CString) none {
    size: i64 = (cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))) + 1l
    elem_type: *struc Type = make_Char()
    node[]._base[].exp_type = make_Array(size, @elem_type)
}
fn check_var_exp(ctx: *struc SemanticContext, node: *struc CVar) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    var_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    if var_type[].type == 10 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(503), "503", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 620, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if var_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = var_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].target_type[].type ~= 9     and ((node[].exp[].exp_type[].type == 8 and node[].target_type[].type == 11)         or (node[].exp[].exp_type[].type == 11 and node[].target_type[].type == 8)         or not is_type_scalar(node[].exp[].exp_type) or not is_type_scalar(node[].target_type)) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(504), "504", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].target_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 639, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = is_valid_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].target_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].target_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn cast_exp(ctx: *struc SemanticContext, exp_type: **struc Type, exp: **struc CExp) i32 {
    exp_type_cp: *struc Type = 0
    _errval: i32 = 0
    info_at: u64 = (exp[])[].info_at
    if exp_type[] ~= exp_type_cp {
        free_Type(@exp_type_cp)
        exp_type_cp = exp_type[]
        (exp_type_cp)[]._ref_count++
    }
    ;
    exp[] = make_CCast(exp, @exp_type_cp, info_at)
    loop .. while 0 {
        _errval = check_cast_exp(ctx, @(exp[])[].get._CCast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    free_Type(@exp_type_cp)
    return _errval
}
fn cast_assign(ctx: *struc SemanticContext, exp_type: **struc Type, exp: **struc CExp) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if (is_type_arithmetic((exp[])[].exp_type) and is_type_arithmetic(exp_type[]))     or ((exp[])[].type == 92 and (exp_type[])[].type == 11         and is_const_null_ptr(@(exp[])[].get._CConstant))     or ((exp_type[])[].type == 11 and (exp_type[])[].get._Pointer.ref_type[].type == 9         and (exp[])[].exp_type[].type == 11)     or ((exp[])[].exp_type[].type == 11 and (exp[])[].exp_type[].get._Pointer.ref_type[].type == 9         and (exp_type[])[].type == 11) {
        loop .. while 0 {
            _errval = cast_exp(ctx, exp_type, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(504), "504", "", get_type_fmt(ctx[].identifiers, (exp[])[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, exp_type[], @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, (exp[])[].info_at)) else panic_sigabrt("abort", 677, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn promote_char_to_int(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    promote_type: *struc Type = 0
    _errval: i32 = 0
    promote_type = make_Int()
    loop .. while 0 {
        _errval = cast_exp(ctx, @promote_type, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    free_Type(@promote_type)
    return _errval
}
fn check_unary_complement_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(505), "505", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 701, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].exp[].exp_type[].type {
        -> 8 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(505), "505", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 707, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        -> 1 {
            -> 2 {
                -> 3 {
                    loop .. while 0 {
                        _errval = promote_char_to_int(ctx, @node[].exp)
                        if _errval ~= 0 {
                            jump _Lfinally
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
    if node[].exp[].exp_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_unary_neg_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(505), "505", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 727, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].exp[].exp_type[].type {
        -> 1 {
            -> 2 {
                -> 3 {
                    loop .. while 0 {
                        _errval = promote_char_to_int(ctx, @node[].exp)
                        if _errval ~= 0 {
                            jump _Lfinally
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
    if node[].exp[].exp_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_unary_not_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_scalar(node[].exp[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(505), "505", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 750, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    _errval: i32 = 0
    match node[].unop.type {
        -> 56 {
            loop .. while 0 {
                _errval = check_unary_complement_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 57 {
            loop .. while 0 {
                _errval = check_unary_neg_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 58 {
            loop .. while 0 {
                _errval = check_unary_not_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 773, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn check_binary_add_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].type == 11     and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)     and is_type_int(node[].exp_right[].exp_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_right[].exp_type, common_type) {
            loop .. while 0 {
                _errval = cast_exp(ctx, @common_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        ;
        jump _Lfinally
    }
    elif is_type_int(node[].exp_left[].exp_type) and node[].exp_right[].exp_type[].type == 11     and is_type_complete(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_left[].exp_type, common_type) {
            loop .. while 0 {
                _errval = cast_exp(ctx, @common_type, @node[].exp_left)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_right[].exp_type ~= node[]._base[].exp_type {
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_right[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        ;
        jump _Lfinally
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 807, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if common_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = common_type
        common_type = 0
    }
    ;
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_binary_subtract_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].type == 11     and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) {
        if is_type_int(node[].exp_right[].exp_type) {
            common_type = make_Long()
            if not is_same_type(node[].exp_right[].exp_type, common_type) {
                loop .. while 0 {
                    _errval = cast_exp(ctx, @common_type, @node[].exp_right)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
                free_Type(@node[]._base[].exp_type)
                node[]._base[].exp_type = node[].exp_left[].exp_type
                (node[]._base[].exp_type)[]._ref_count++
            }
            ;
            jump _Lfinally
        }
        elif is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type)         and not (node[].exp_left[].type == 92 and is_const_null_ptr(@node[].exp_left[].get._CConstant)) {
            common_type = make_Long()
            if common_type ~= node[]._base[].exp_type {
                free_Type(@node[]._base[].exp_type)
                node[]._base[].exp_type = common_type
                common_type = 0
            }
            ;
            jump _Lfinally
        }
        else {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 851, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 858, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if common_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = common_type
        common_type = 0
    }
    ;
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_multiply_divide_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 883, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if common_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = common_type
        common_type = 0
    }
    ;
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_remainder_bitwise_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 909, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if common_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = common_type
        common_type = 0
    }
    ;
    if node[]._base[].exp_type[].type == 8 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(506), "506", "", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[]._base[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 923, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_binary_bitshift_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_int(node[].exp_right[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 938, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif is_type_char(node[].exp_left[].exp_type) {
        loop .. while 0 {
            _errval = promote_char_to_int(ctx, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @node[].exp_left[].exp_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp_left[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    if node[]._base[].exp_type[].type == 8 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(506), "506", "", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[]._base[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 951, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_bitshift_right_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = check_binary_bitshift_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if is_type_signed(node[].exp_left[].exp_type) {
        node[].binop = make_CBinaryOp(72)
    }
    label _Lfinally
    ;
    return _errval
}
fn check_binary_logical_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 975, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_binary_equality_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if node[].exp_left[].exp_type[].type == 11 or node[].exp_right[].exp_type[].type == 11 {
        loop .. while 0 {
            _errval = get_joint_ptr_type(ctx, node[].exp_left, node[].exp_right, @common_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    elif is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 999, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_binary_relational_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type)     or (node[].exp_left[].exp_type[].type == 11         and (not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type)         or (node[].exp_left[].type == 92 and is_const_null_ptr(@node[].exp_left[].get._CConstant))         or (node[].exp_right[].type == 92         and is_const_null_ptr(@node[].exp_right[].get._CConstant)))) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(507), "507", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1029, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    match node[].binop.type {
        -> 62 {
            loop .. while 0 {
                _errval = check_binary_add_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 63 {
            loop .. while 0 {
                _errval = check_binary_subtract_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 64 {
            -> 65 {
                loop .. while 0 {
                    _errval = check_multiply_divide_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> 66 {
            -> 67 {
                -> 68 {
                    -> 69 {
                        loop .. while 0 {
                            _errval = check_remainder_bitwise_exp(ctx, node)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        -> 70 {
            loop .. while 0 {
                _errval = check_binary_bitshift_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 71 {
            loop .. while 0 {
                _errval = check_bitshift_right_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 73 {
            -> 74 {
                loop .. while 0 {
                    _errval = check_binary_logical_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> 75 {
            -> 76 {
                loop .. while 0 {
                    _errval = check_binary_equality_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> 77 {
            -> 78 {
                -> 79 {
                    -> 80 {
                        loop .. while 0 {
                            _errval = check_binary_relational_exp(ctx, node)
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
            panic_sigabrt("abort", 1089, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn check_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) i32 {
    _errval: i32 = 0
    if node[].exp_left {
        if node[].exp_left[].exp_type[].type == 9 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(508), "508", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1099, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_exp_lvalue(node[].exp_left) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(509), "509", "", "", get_assign_fmt(0, @node[].unop)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1102, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_same_type(node[].exp_right[].exp_type, node[].exp_left[].exp_type) {
            loop .. while 0 {
                _errval = cast_assign(ctx, @node[].exp_left[].exp_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        ;
    }
    else {
        ;
        exp_left: *struc CExp = node[].exp_right[].get._CBinary.exp_left
        if exp_left[].type == 95 {
            exp_left = exp_left[].get._CCast.exp
        }
        if not is_exp_lvalue(exp_left) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(509), "509", "", "", get_assign_fmt(@node[].exp_right[].get._CBinary.binop, @node[].unop)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1117, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_same_type(node[].exp_right[].exp_type, exp_left[].exp_type) {
            loop .. while 0 {
                _errval = cast_assign(ctx, @exp_left[].exp_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if exp_left[].exp_type ~= node[]._base[].exp_type {
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        ;
    }
    label _Lfinally
    ;
    return _errval
}
fn check_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    common_type: *struc Type = 0
    _errval: i32 = 0
    if not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(510), "510", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1136, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif node[].exp_middle[].exp_type[].type == 9 and node[].exp_right[].exp_type[].type == 9 {
        if node[].exp_middle[].exp_type ~= node[]._base[].exp_type {
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_middle[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        ;
        jump _Lfinally
    }
    elif node[].exp_middle[].exp_type[].type == 13     or node[].exp_right[].exp_type[].type == 13 {
        if not is_same_type(node[].exp_middle[].exp_type, node[].exp_right[].exp_type) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(511), "511", "", get_type_fmt(ctx[].identifiers, node[].exp_middle[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1146, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        if node[].exp_middle[].exp_type ~= node[]._base[].exp_type {
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_middle[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        ;
        jump _Lfinally
    }
    if is_type_arithmetic(node[].exp_middle[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_middle, node[].exp_right)
    }
    elif node[].exp_middle[].exp_type[].type == 11 or node[].exp_right[].exp_type[].type == 11 {
        loop .. while 0 {
            _errval = get_joint_ptr_type(ctx, node[].exp_middle, node[].exp_right, @common_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(511), "511", "", get_type_fmt(ctx[].identifiers, node[].exp_middle[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1161, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_middle[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_middle)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if common_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = common_type
        common_type = 0
    }
    ;
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@common_type)
    return _errval
}
fn check_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    strto_fmt_1: string = ? 0 then sdsnew(0) else 0
    strto_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    fun_symbol: *struc Symbol = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)
    fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
    if fun_symbol[].type_t[].type ~= 10 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(512), "512", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1187, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) ~= (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) {
        strto_fmt_1 = ? ((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0))))
        strto_fmt_2 = ? ((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0))))
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(513), "513", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1193, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        if not is_same_type(node[].args[i][].exp_type, fun_type[].param_types[i]) {
            loop .. while 0 {
                _errval = cast_assign(ctx, @fun_type[].param_types[i], @node[].args[i])
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
    }
    if fun_type[].ret_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = fun_type[].ret_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if node[].exp[].exp_type[].type ~= 11 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(514), "514", "", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1213, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].exp[].exp_type[].get._Pointer.ref_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type[].get._Pointer.ref_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_addrof_exp(ctx: *struc SemanticContext, node: *struc CAddrOf) i32 {
    ref_type: *struc Type = 0
    _errval: i32 = 0
    if not is_exp_lvalue(node[].exp) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(515), "515", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1226, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].exp[].exp_type ~= ref_type {
        free_Type(@ref_type)
        ref_type = node[].exp[].exp_type
        (ref_type)[]._ref_count++
    }
    ;
    node[]._base[].exp_type = make_Pointer(@ref_type)
    label _Lfinally
    ;
    free_Type(@ref_type)
    return _errval
}
fn check_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) i32 {
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    ref_type: *struc Type = 0
    subscript_type: *struc Type = 0
    _errval: i32 = 0
    if node[].primary_exp[].exp_type[].type == 11     and is_type_complete(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type)     and is_type_int(node[].subscript_exp[].exp_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].subscript_exp[].exp_type, subscript_type) {
            loop .. while 0 {
                _errval = cast_exp(ctx, @subscript_type, @node[].subscript_exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].primary_exp[].exp_type[].get._Pointer.ref_type ~= ref_type {
            free_Type(@ref_type)
            ref_type = node[].primary_exp[].exp_type[].get._Pointer.ref_type
            (ref_type)[]._ref_count++
        }
        ;
    }
    elif is_type_int(node[].primary_exp[].exp_type) and node[].subscript_exp[].exp_type[].type == 11     and is_type_complete(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].primary_exp[].exp_type, subscript_type) {
            loop .. while 0 {
                _errval = cast_exp(ctx, @subscript_type, @node[].primary_exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].subscript_exp[].exp_type[].get._Pointer.ref_type ~= ref_type {
            free_Type(@ref_type)
            ref_type = node[].subscript_exp[].exp_type[].get._Pointer.ref_type
            (ref_type)[]._ref_count++
        }
        ;
    }
    else {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(516), "516", "", get_type_fmt(ctx[].identifiers, node[].primary_exp[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].subscript_exp[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1259, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if ref_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = ref_type
        ref_type = 0
    }
    ;
    label _Lfinally
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_Type(@ref_type)
    free_Type(@subscript_type)
    return _errval
}
fn check_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_complete(ctx, node[].exp[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(517), "517", "", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1276, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_ULong()
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if not is_type_complete(ctx, node[].target_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(517), "517", "", "", get_type_fmt(ctx[].identifiers, node[].target_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1291, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = is_valid_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_ULong()
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].structure[].exp_type[].type ~= 13 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(518), "518", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].structure[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1310, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_type = @node[].structure[].exp_type[].get._Structure
    struct_typedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    map_it = (? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof(struct_typedef[].members)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(519), "519", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_name_fmt(ctx[].identifiers, node[].member, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1318, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    member_type = (struct_typedef[].members[map_it]).value[].member_type
    if member_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = member_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    ptr_type: *struc Pointer;
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].pointer[].exp_type[].type ~= 11 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(520), "520", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].pointer[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1340, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    ptr_type = @node[].pointer[].exp_type[].get._Pointer
    if ptr_type[].ref_type[].type ~= 13 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(520), "520", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].pointer[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1346, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_type = @ptr_type[].ref_type[].get._Structure
    map_it = (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(521), "521", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1353, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_typedef = (ctx[].frontend[].struct_typedef_table[map_it]).value
    map_it = (? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof(struct_typedef[].members)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(519), "519", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_name_fmt(ctx[].identifiers, node[].member, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1360, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    member_type = (struct_typedef[].members[map_it]).value[].member_type
    if member_type ~= node[]._base[].exp_type {
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = member_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_arr_typed_exp(addrof: **struc CExp) none {
    {
        ref_type: *struc Type = 0
        if (addrof[])[].exp_type[].get._Array.elem_type ~= ref_type {
            free_Type(@ref_type)
            ref_type = (addrof[])[].exp_type[].get._Array.elem_type
            (ref_type)[]._ref_count++
        }
        ;
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = make_Pointer(@ref_type)
    }
    info_at: u64 = (addrof[])[].info_at
    addrof[] = make_CAddrOf(addrof, info_at)
    if (addrof[])[].get._CAddrOf.exp[].exp_type ~= (addrof[])[].exp_type {
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = (addrof[])[].get._CAddrOf.exp[].exp_type
        ((addrof[])[].exp_type)[]._ref_count++
    }
    ;
}
fn check_struct_typed_exp(ctx: *struc SemanticContext, node: *struc CExp) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_struct_complete(ctx, @node[].exp_type[].get._Structure) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(522), "522", "", "", get_type_fmt(ctx[].identifiers, node[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1388, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    match (exp[])[].exp_type[].type {
        -> 12 {
            check_arr_typed_exp(exp)
        }
        break
        -> 13 {
            loop .. while 0 {
                _errval = check_struct_typed_exp(ctx, exp[])
                if _errval ~= 0 {
                    jump _Lfinally
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
fn check_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((ctx[].fun_def_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    if fun_type[].ret_type[].type == 9 {
        if node[].exp {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(523), "523", "", "", get_name_fmt(ctx[].identifiers, ctx[].fun_def_name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1418, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    elif not node[].exp {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(524), "524", "", get_name_fmt(ctx[].identifiers, ctx[].fun_def_name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1424, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif not is_same_type(node[].exp[].exp_type, fun_type[].ret_type) {
        loop .. while 0 {
            _errval = cast_assign(ctx, @fun_type[].ret_type, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = check_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_if_statement(ctx: *struc SemanticContext, node: *struc CIf) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(525), "525", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort", 1443, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(526), "526", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort", 1455, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(527), "527", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort", 1467, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_for_statement(ctx: *struc SemanticContext, node: *struc CFor) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(528), "528", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort", 1479, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_switch_int_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? 0 then sdsnew(0) else 0
    values: *i32 = 0
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ?         (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        ;
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_int_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(530), "530", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort", 1499, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstInt(values[i])
        if node[].match[].exp_type ~= esac[]._base[].exp_type {
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].match[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
        ;
    }
    label _Lfinally
    ;
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = 0
        }
        values = 0
    }
    ;
    return _errval
}
fn check_switch_long_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? 0 then sdsnew(0) else 0
    values: *i64 = 0
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ?         (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        ;
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_long_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(530), "530", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort", 1524, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstLong(values[i])
        if node[].match[].exp_type ~= esac[]._base[].exp_type {
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].match[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
        ;
    }
    label _Lfinally
    ;
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = 0
        }
        values = 0
    }
    ;
    return _errval
}
fn check_switch_uint_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? 0 then sdsnew(0) else 0
    values: *u32 = 0
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ?         (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        ;
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_uint_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(530), "530", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort", 1549, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstUInt(values[i])
        if node[].match[].exp_type ~= esac[]._base[].exp_type {
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].match[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
        ;
    }
    label _Lfinally
    ;
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = 0
        }
        values = 0
    }
    ;
    return _errval
}
fn check_switch_ulong_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? 0 then sdsnew(0) else 0
    values: *u64 = 0
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ?         (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        ;
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_ulong_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(530), "530", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort", 1574, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstULong(values[i])
        if node[].match[].exp_type ~= esac[]._base[].exp_type {
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].match[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
        ;
    }
    label _Lfinally
    ;
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = 0
        }
        values = 0
    }
    ;
    return _errval
}
fn check_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_int(node[].match[].exp_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(529), "529", "", "", get_type_fmt(ctx[].identifiers, node[].match[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].match[].info_at)) else panic_sigabrt("abort", 1591, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].match[].exp_type[].type {
        -> 1 {
            -> 2 {
                -> 3 {
                    loop .. while 0 {
                        _errval = promote_char_to_int(ctx, @node[].match)
                        if _errval ~= 0 {
                            jump _Lfinally
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
    match node[].match[].exp_type[].type {
        -> 4 {
            loop .. while 0 {
                _errval = check_switch_int_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 5 {
            loop .. while 0 {
                _errval = check_switch_long_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 6 {
            loop .. while 0 {
                _errval = check_switch_uint_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 7 {
            loop .. while 0 {
                _errval = check_switch_ulong_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 1617, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_bound_string_init(ctx: *struc SemanticContext, node: *struc CString, arr_type: *struc Array) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    strto_fmt_1: string = ? 0 then sdsnew(0) else 0
    strto_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_type_char(arr_type[].elem_type) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(531), "531", "", "", get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1630, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif (? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        strto_fmt_2 = ? ((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))))
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(532), "532", "", strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 1636, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) i32 {
    _errval: i32 = 0
    if not is_same_type(node[].exp[].exp_type, init_type[]) {
        loop .. while 0 {
            _errval = cast_assign(ctx, init_type, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
    ;
    label _Lfinally
    ;
    return _errval
}
fn check_string_init(node: *struc CSingleInit, init_type: **struc Type) none {
    if init_type[] ~= node[].exp[].exp_type {
        free_Type(@node[].exp[].exp_type)
        node[].exp[].exp_type = init_type[]
        (node[].exp[].exp_type)[]._ref_count++
    }
    ;
    if init_type[] ~= node[]._base[].init_type {
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
    ;
}
fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer;
fn check_single_zero_init(elem_type: *struc Type) *struc CInitializer {
    exp: *struc CExp = 0
    {
        constant: *struc CConst = 0
        match elem_type[].type {
            -> 1 {
                -> 2 {
                    constant = make_CConstChar(0)
                    break
                }
            }
            -> 4 {
                constant = make_CConstInt(0)
                break
            }
            -> 5 {
                constant = make_CConstLong(0l)
                break
            }
            -> 8 {
                constant = make_CConstDouble(0.0)
                break
            }
            -> 3 {
                constant = make_CConstUChar(0u)
                break
            }
            -> 6 {
                constant = make_CConstUInt(0u)
                break
            }
            -> 7 {
                -> 11 {
                    constant = make_CConstULong(0ul)
                    break
                }
            }
            otherwise {
                panic_sigabrt("abort", 1698, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            }
        }
        exp = make_CConstant(@constant, 0)
    }
    return make_CSingleInit(@exp)
}
fn check_arr_zero_init(ctx: *struc SemanticContext, arr_type: *struc Array) *struc CInitializer {
    zero_inits: **struc CInitializer = 0
    arr_type_size: u64 = cast<u64>(arr_type[].size)
    (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (0), (arr_type_size))))
    loop i: u64 = 0 while i < arr_type_size .. ++i {
        initializer: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (zero_inits) or (cast<*struc stbds_array_header>((zero_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((zero_inits)) - 1)[].capacity) then (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (1), (0))) and 0) else 0)
                (zero_inits)[(cast<*struc stbds_array_header>((zero_inits)) - 1)[].length++] = (initializer)
            }
            initializer = 0
        }
    }
    return make_CCompoundInit(@zero_inits)
}
fn check_struct_zero_init(ctx: *struc SemanticContext, struct_type: *struc Structure) *struc CInitializer {
    zero_inits: **struc CInitializer = 0
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (0), ((? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)
        initializer: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (zero_inits) or (cast<*struc stbds_array_header>((zero_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((zero_inits)) - 1)[].capacity) then (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (1), (0))) and 0) else 0)
                (zero_inits)[(cast<*struc stbds_array_header>((zero_inits)) - 1)[].length++] = (initializer)
            }
            initializer = 0
        }
    }
    return make_CCompoundInit(@zero_inits)
}
fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer {
    match init_type[].type {
        -> 12 {
            return check_arr_zero_init(ctx, @init_type[].get._Array)
        }
        -> 13 {
            return check_struct_zero_init(ctx, @init_type[].get._Structure)
        }
        otherwise {
            return check_single_zero_init(init_type)
        }
    }
}
fn check_bound_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    strto_fmt_1: string = ? 0 then sdsnew(0) else 0
    strto_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        strto_fmt_2 = ? ((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0))))
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(533), "533", strto_fmt_1, get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt), strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort", 1747, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_bound_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    strto_fmt_1: string = ? 0 then sdsnew(0) else 0
    strto_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    bound: u64 = ? struct_type[].is_union then 1 else (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0)
    if (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) > bound {
        strto_fmt_1 = ? ((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0))))
        strto_fmt_2 = ? (bound) > 0 then sdsfromunsignedlong(cast<u64>((bound))) else sdsfromlong(cast<i64>((bound)))
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(534), "534", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort", 1767, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) none {
    loop while (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) < cast<u64>(arr_type[].size) {
        zero_init: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (node[].initializers) or (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].capacity) then (((node[].initializers) = stbds_arrgrowf((node[].initializers), sizeof((node[].initializers)[]), (1), (0))) and 0) else 0)
                (node[].initializers)[(cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length++] = (zero_init)
            }
            zero_init = 0
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
    ;
}
fn check_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) none {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    loop i: u64 = (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) while i < (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)
        zero_init: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (node[].initializers) or (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].capacity) then (((node[].initializers) = stbds_arrgrowf((node[].initializers), sizeof((node[].initializers)[]), (1), (0))) and 0) else 0)
                (node[].initializers)[(cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length++] = (zero_init)
            }
            zero_init = 0
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
    ;
}
fn check_ret_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, fun_type[].ret_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = is_valid_type(ctx, fun_type[].ret_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match fun_type[].ret_type[].type {
        -> 12 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(535), "535", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1809, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        -> 13 {
            if node[].body and not is_struct_complete(ctx, @fun_type[].ret_type[].get._Structure) {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(536), "536", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1813, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
            break
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_arr_param_decl(fun_type: *struc FunType, i: u64) none {
    ref_type: *struc Type = 0
    if fun_type[].param_types[i][].get._Array.elem_type ~= ref_type {
        free_Type(@ref_type)
        ref_type = fun_type[].param_types[i][].get._Array.elem_type
        (ref_type)[]._ref_count++
    }
    ;
    free_Type(@fun_type[].param_types[i])
    fun_type[].param_types[i] = make_Pointer(@ref_type)
}
fn check_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt_1: string = ? 0 then sdsnew(0) else 0
    name_fmt_2: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    param_attrs: *struc IdentifierAttr = 0
    symbol: *struc Symbol = 0
    param_type: *struc Type = 0
    _errval: i32 = 0
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    loop i: u64 = 0 while i < (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) .. ++i {
        ctx[].errors[].info_at_buf = node[].info_at
        loop .. while 0 {
            _errval = reslv_struct_type(ctx, fun_type[].param_types[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if fun_type[].param_types[i][].type == 9 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(537), "537", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].params[i], @name_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1848, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = is_valid_type(ctx, fun_type[].param_types[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if fun_type[].param_types[i][].type == 12 {
            check_arr_param_decl(fun_type, i)
        }
        if node[].body {
            if fun_type[].param_types[i][].type == 13             and not is_struct_complete(ctx, @fun_type[].param_types[i][].get._Structure) {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(538), "538", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].params[i], @name_fmt_2), get_type_fmt(ctx[].identifiers, fun_type[].param_types[i], @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1859, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
            if fun_type[].param_types[i] ~= param_type {
                free_Type(@param_type)
                param_type = fun_type[].param_types[i]
                (param_type)[]._ref_count++
            }
            ;
            param_attrs = make_LocalAttr()
            ;
            symbol = make_Symbol(@param_type, @param_attrs)
            loop .. while 0 {
                loop .. while 0 {
                    (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].params[i]))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].params[i])
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
                }
                symbol = 0
            }
        }
    }
    label _Lfinally
    ;
    if name_fmt_1 {
        sdsfree(name_fmt_1)
        name_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if name_fmt_2 {
        sdsfree(name_fmt_2)
        name_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    free_IdentifierAttr(@param_attrs)
    free_Symbol(@symbol)
    free_Type(@param_type)
    return _errval
}
fn check_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    glob_fun_attrs: *struc IdentifierAttr = 0
    symbol: *struc Symbol = 0
    glob_fun_type: *struc Type = 0
    _errval: i32 = 0
    ;
    is_def: i32 = (? ((ctx[].fun_def_set) = stbds_hmget_key((ctx[].fun_def_set), sizeof((ctx[].fun_def_set)[]), cast<*any>(@((node[].name))), sizeof(ctx[].fun_def_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp) ~= -1
    is_glob: i32 = node[].storage_class.type ~= 133
    map_it: i64 = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        fun_symbol: *struc Symbol = (ctx[].frontend[].symbol_table[map_it]).value
        fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
        if not (fun_symbol[].type_t[].type == 10 and (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) == (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0)             and is_same_fun_type(@node[].fun_type[].get._FunType, fun_type)) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(539), "539", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].fun_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, fun_symbol[].type_t, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1899, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        elif is_def and node[].body {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(540), "540", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].fun_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1904, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        fun_attrs: *struc FunAttr = @fun_symbol[].attrs[].get._FunAttr
        if not is_glob and fun_attrs[].is_glob {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(541), "541", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 1910, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        is_glob = fun_attrs[].is_glob
        free_Symbol(@fun_symbol)
    }
    if node[].body {
        loop .. while 0 {
            (ctx[].fun_def_set) = stbds_hmput_key((ctx[].fun_def_set), sizeof((ctx[].fun_def_set)[]), cast<*any>(@((node[].name))), sizeof(ctx[].fun_def_set)[].key, 0)
            (ctx[].fun_def_set)[(cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].fun_def_set)[(cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp].value = (0)
        }
        is_def = 1
        ctx[].fun_def_name = node[].name
    }
    if node[].fun_type ~= glob_fun_type {
        free_Type(@glob_fun_type)
        glob_fun_type = node[].fun_type
        (glob_fun_type)[]._ref_count++
    }
    ;
    glob_fun_attrs = make_FunAttr(is_def, is_glob)
    symbol = make_Symbol(@glob_fun_type, @glob_fun_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = 0
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_IdentifierAttr(@glob_fun_attrs)
    free_Symbol(@symbol)
    free_Type(@glob_fun_type)
    return _errval
}
fn push_static_init(ctx: *struc SemanticContext, static_init: *struc StaticInit) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_static_inits[]) or (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].capacity) then (((ctx[].p_static_inits[]) = stbds_arrgrowf((ctx[].p_static_inits[]), sizeof((ctx[].p_static_inits[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_static_inits[])[(cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length++] = (static_init)
        }
        static_init = 0
    }
}
fn push_zero_static_init(ctx: *struc SemanticContext, byte: i64) none {
    if not ((? (ctx[].p_static_inits[]) then (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length else 0) == 0) and (ctx[].p_static_inits[])[(? (ctx[].p_static_inits[]) then (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length else 0) - 1][].type == 22 {
        (ctx[].p_static_inits[])[(? (ctx[].p_static_inits[]) then (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length else 0) - 1][].get._ZeroInit.byte += byte
    }
    else {
        push_static_init(ctx, make_ZeroInit(byte))
    }
}
fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) i32;
fn check_static_no_init(ctx: *struc SemanticContext, static_init_type: *struc Type, size: i64) none {
    byte: i64 = ? static_init_type == 0 then size else get_type_scale(ctx, static_init_type) * size
    push_zero_static_init(ctx, byte)
}
fn check_no_initializer(ctx: *struc SemanticContext, static_init_type: *struc Type) *struc InitialValue {
    static_inits: **struc StaticInit = 0
    {
        ctx[].p_static_inits = @static_inits
        check_static_no_init(ctx, static_init_type, 1l)
        ctx[].p_static_inits = 0
    }
    return make_Initial(@static_inits)
}
fn make_binary_identifier(ctx: *struc SemanticContext, binary: u64) u64 {
    strto_binary: string = ? (binary) > 0 then sdsfromunsignedlong(cast<u64>((binary))) else sdsfromlong(cast<i64>((binary)))
    return make_string_identifier(ctx[].identifiers, @strto_binary)
}
fn check_static_const_init(ctx: *struc SemanticContext, node: *struc CConstant, static_init_type: *struc Type) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    strto_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    match static_init_type[].type {
        -> 1 {
            -> 2 {
                value: i8 = get_const_char_value(node)
                if value == 0 {
                    push_zero_static_init(ctx, 1l)
                }
                else {
                    push_static_init(ctx, make_CharInit(value))
                }
                break
            }
        }
        -> 4 {
            value: i32 = get_const_int_value(node)
            if value == 0 {
                push_zero_static_init(ctx, 4l)
            }
            else {
                push_static_init(ctx, make_IntInit(value))
            }
            break
        }
        -> 5 {
            value: i64 = get_const_long_value(node)
            if value == 0l {
                push_zero_static_init(ctx, 8l)
            }
            else {
                push_static_init(ctx, make_LongInit(value))
            }
            break
        }
        -> 8 {
            value: f64 = get_const_dbl_value(node)
            binary: u64 = dbl_to_binary(value)
            if binary == 0ul {
                push_zero_static_init(ctx, 8l)
            }
            else {
                dbl_const: u64 = make_binary_identifier(ctx, binary)
                push_static_init(ctx, make_DoubleInit(dbl_const))
            }
            break
        }
        -> 3 {
            value: u8 = get_const_uchar_value(node)
            if value == 0u {
                push_zero_static_init(ctx, 1l)
            }
            else {
                push_static_init(ctx, make_UCharInit(value))
            }
            break
        }
        -> 6 {
            value: u32 = get_const_uint_value(node)
            if value == 0u {
                push_zero_static_init(ctx, 4l)
            }
            else {
                push_static_init(ctx, make_UIntInit(value))
            }
            break
        }
        -> 7 {
            value: u64 = get_const_ulong_value(node)
            if value == 0ul {
                push_zero_static_init(ctx, 8l)
            }
            else {
                push_static_init(ctx, make_ULongInit(value))
            }
            break
        }
        -> 11 {
            match node[].constant[].type {
                -> 52 {
                    -> 51 {
                        -> 53 {
                            loop .. while 0 {
                                ?                                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(542), "542", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt), get_const_fmt(node[].constant)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 2055, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
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
            value: u64 = get_const_ptr_value(node)
            if value ~= 0ul {
                strto_fmt = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(543), "543", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt), strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 2064, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
            push_zero_static_init(ctx, 8l)
            break
        }
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(544), "544", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 2071, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_literal_string_init(ctx: *struc SemanticContext, node: *struc CString, static_ptr_type: *struc Pointer) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if static_ptr_type[].ref_type[].type ~= 1 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(545), "545", "", "", get_ptr_fmt(ctx[].identifiers, static_ptr_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 2084, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn make_literal_identifier(ctx: *struc SemanticContext, node: *struc CStringLiteral) u64 {
    value: string = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}
fn check_static_ptr_string_init(ctx: *struc SemanticContext, node: *struc CString) none {
    string_const_label: u64;
    {
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        map_it: i64 = (? ((ctx[].frontend[].string_const_table) = stbds_hmget_key((ctx[].frontend[].string_const_table), sizeof((ctx[].frontend[].string_const_table)[]), cast<*any>(@((string_const))), sizeof(ctx[].frontend[].string_const_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            string_const_label = (ctx[].frontend[].string_const_table[map_it]).value
        }
        else {
            string_const_label = repr_label_identifier(ctx[].identifiers, 14)
            loop .. while 0 {
                (ctx[].frontend[].string_const_table) = stbds_hmput_key((ctx[].frontend[].string_const_table), sizeof((ctx[].frontend[].string_const_table)[]), cast<*any>(@((string_const))), sizeof(ctx[].frontend[].string_const_table)[].key, 0)
                (ctx[].frontend[].string_const_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp].key = (string_const)
                (ctx[].frontend[].string_const_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp].value = (string_const_label)
            }
            constant_type: *struc Type = 0
            {
                size: i64 = (cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))) + 1l
                elem_type: *struc Type = make_Char()
                constant_type = make_Array(size, @elem_type)
            }
            constant_attrs: *struc IdentifierAttr = 0
            {
                static_init: *struc StaticInit = 0
                {
                    literal: *struc CStringLiteral = 0
                    if node[].literal ~= literal {
                        free_CStringLiteral(@literal)
                        literal = node[].literal
                        (literal)[]._ref_count++
                    }
                    ;
                    static_init = make_StringInit(string_const, 1, @literal)
                }
                constant_attrs = make_ConstantAttr(@static_init)
            }
            symbol: *struc Symbol = make_Symbol(@constant_type, @constant_attrs)
            loop .. while 0 {
                loop .. while 0 {
                    (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((string_const_label))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (string_const_label)
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
                }
                symbol = 0
            }
        }
    }
    push_static_init(ctx, make_PointerInit(string_const_label))
}
fn check_static_arr_string_init(ctx: *struc SemanticContext, node: *struc CString, static_arr_type: *struc Array) i32 {
    literal: *struc CStringLiteral = 0
    _errval: i32 = 0
    byte: i64;
    loop .. while 0 {
        _errval = check_bound_string_init(ctx, node, static_arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    byte = static_arr_type[].size - (cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))) - 1l
    {
        is_null_term: i32 = byte >= 0l
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        if node[].literal ~= literal {
            free_CStringLiteral(@literal)
            literal = node[].literal
            (literal)[]._ref_count++
        }
        ;
        push_static_init(ctx, make_StringInit(string_const, is_null_term, @literal))
    }
    if byte > 0l {
        push_zero_static_init(ctx, byte)
    }
    label _Lfinally
    ;
    free_CStringLiteral(@literal)
    return _errval
}
fn check_static_string_init(ctx: *struc SemanticContext, node: *struc CString, static_init_type: *struc Type) i32 {
    _errval: i32 = 0
    match static_init_type[].type {
        -> 11 {
            loop .. while 0 {
                _errval = check_literal_string_init(ctx, node, @static_init_type[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        check_static_ptr_string_init(ctx, node)
        break
        -> 12 {
            loop .. while 0 {
                _errval = check_static_arr_string_init(ctx, node, @static_init_type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 2162, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn check_single_static_init(ctx: *struc SemanticContext, node: *struc CSingleInit, static_init_type: *struc Type) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    match node[].exp[].type {
        -> 92 {
            loop .. while 0 {
                _errval = check_static_const_init(ctx, @node[].exp[].get._CConstant, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 93 {
            loop .. while 0 {
                _errval = check_static_string_init(ctx, @node[].exp[].get._CString, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(546), "546", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].exp[].info_at)) else panic_sigabrt("abort", 2179, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_static_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = check_bound_arr_init(ctx, node, arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            _errval = check_static_init(ctx, node[].initializers[i], arr_type[].elem_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if cast<u64>(arr_type[].size) > (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) {
        check_static_no_init(ctx, arr_type[].elem_type, arr_type[].size - (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0))
    }
    label _Lfinally
    ;
    return _errval
}
fn check_static_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) i32 {
    _errval: i32 = 0
    size: i64;
    loop .. while 0 {
        _errval = check_bound_struct_init(ctx, node, struct_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    size = 0l
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)
        if member[].offset ~= size {
            check_static_no_init(ctx, 0, member[].offset - size)
            size = member[].offset
        }
        loop .. while 0 {
            _errval = check_static_init(ctx, node[].initializers[i], member[].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        size += get_type_scale(ctx, member[].member_type)
    }
    size -= ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    if size ~= 0l {
        check_static_no_init(ctx, 0, -1l * size)
    }
    label _Lfinally
    ;
    return _errval
}
fn check_static_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, static_init_type: *struc Type) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    match static_init_type[].type {
        -> 12 {
            loop .. while 0 {
                _errval = check_static_arr_init(ctx, node, @static_init_type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 13 {
            loop .. while 0 {
                _errval = check_static_struct_init(ctx, node, @static_init_type[].get._Structure)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(547), "547", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort", 2235, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) i32 {
    _errval: i32 = 0
    match node[].type {
        -> 136 {
            loop .. while 0 {
                _errval = check_single_static_init(ctx, @node[].get._CSingleInit, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 137 {
            loop .. while 0 {
                _errval = check_static_compound_init(ctx, @node[].get._CCompoundInit, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 2253, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn check_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type, init_value: **struc InitialValue) i32 {
    static_inits: **struc StaticInit = 0
    _errval: i32 = 0
    {
        ctx[].p_static_inits = @static_inits
        loop .. while 0 {
            _errval = check_static_init(ctx, node, static_init_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].p_static_inits = 0
    }
    init_value[] = make_Initial(@static_inits)
    label _Lfinally
    ;
    loop i: u64 = 0 while i < (? (static_inits) then (cast<*struc stbds_array_header>((static_inits)) - 1)[].length else 0) .. ++i {
        free_StaticInit(@static_inits[i])
    }
    if static_inits {
        loop .. while 0 {
            cast<none>((? (static_inits) then free((cast<*struc stbds_array_header>((static_inits)) - 1)) else cast<none>(0)))
            (static_inits) = 0
        }
        static_inits = 0
    }
    ;
    return _errval
}
fn check_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    glob_var_attrs: *struc IdentifierAttr = 0
    symbol: *struc Symbol = 0
    init_value: *struc InitialValue = 0
    glob_var_type: *struc Type = 0
    _errval: i32 = 0
    is_glob: i32;
    map_it: i64;
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].var_type[].type == 9 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(548), "548", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2291, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = is_valid_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    is_glob = node[].storage_class.type ~= 133
    if node[].init {
        if node[].var_type[].type == 13 and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(549), "549", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2299, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = check_initializer(ctx, node[].init, node[].var_type, @init_value)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        if node[].storage_class.type == 134 {
            init_value = make_NoInitializer()
        }
        else {
            if node[].var_type[].type == 13 and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(549), "549", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2311, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
            init_value = make_Tentative()
        }
    }
    map_it = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        var_symbol: *struc Symbol = (ctx[].frontend[].symbol_table[map_it]).value
        if not is_same_type(var_symbol[].type_t, node[].var_type) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(550), "550", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, var_symbol[].type_t, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2323, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        var_attrs: *struc StaticAttr = @var_symbol[].attrs[].get._StaticAttr
        if node[].storage_class.type == 134 {
            is_glob = var_attrs[].is_glob
        }
        elif is_glob ~= var_attrs[].is_glob {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(551), "551", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2333, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        if var_attrs[].init[].type == 27 {
            if init_value[].type == 27 {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(551), "551", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2339, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
            else {
                if var_attrs[].init ~= init_value {
                    free_InitialValue(@init_value)
                    init_value = var_attrs[].init
                    (init_value)[]._ref_count++
                }
                ;
            }
        }
        free_Symbol(@var_symbol)
    }
    if node[].var_type ~= glob_var_type {
        free_Type(@glob_var_type)
        glob_var_type = node[].var_type
        (glob_var_type)[]._ref_count++
    }
    ;
    glob_var_attrs = make_StaticAttr(is_glob, @init_value)
    symbol = make_Symbol(@glob_var_type, @glob_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = 0
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_IdentifierAttr(@glob_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@glob_var_type)
    return _errval
}
fn check_extern_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt_1: string = ? 0 then sdsnew(0) else 0
    type_fmt_2: string = ? 0 then sdsnew(0) else 0
    local_var_attrs: *struc IdentifierAttr = 0
    symbol: *struc Symbol = 0
    init_value: *struc InitialValue = 0
    local_var_type: *struc Type = 0
    _errval: i32 = 0
    map_it: i64;
    if node[].init {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(552), "552", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2375, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    map_it = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        var_type: *struc Type = (ctx[].frontend[].symbol_table[map_it]).value[].type_t
        if not is_same_type(var_type, node[].var_type) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(550), "550", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, var_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2381, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    if node[].var_type ~= local_var_type {
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    ;
    init_value = make_NoInitializer()
    local_var_attrs = make_StaticAttr(1, @init_value)
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = 0
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    return _errval
}
fn check_static_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    local_var_attrs: *struc IdentifierAttr = 0
    symbol: *struc Symbol = 0
    init_value: *struc InitialValue = 0
    local_var_type: *struc Type = 0
    _errval: i32 = 0
    ;
    if node[].init {
        loop .. while 0 {
            _errval = check_initializer(ctx, node[].init, node[].var_type, @init_value)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        init_value = check_no_initializer(ctx, node[].var_type)
    }
    if node[].var_type ~= local_var_type {
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    ;
    local_var_attrs = make_StaticAttr(0, @init_value)
    ;
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = 0
    }
    label _Lfinally
    ;
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    return _errval
}
fn check_auto_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    local_var_attrs: *struc IdentifierAttr = 0
    symbol: *struc Symbol = 0
    local_var_type: *struc Type = 0
    _errval: i32 = 0
    if node[].var_type[].type == 13 and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(549), "549", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2441, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].var_type ~= local_var_type {
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    ;
    local_var_attrs = make_LocalAttr()
    ;
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = 0
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_Type(@local_var_type)
    return _errval
}
fn check_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].var_type[].type == 9 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(548), "548", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2465, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = is_valid_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match node[].storage_class.type {
        -> 132 {
            loop .. while 0 {
                _errval = check_auto_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 134 {
            loop .. while 0 {
                _errval = check_extern_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 133 {
            loop .. while 0 {
                _errval = check_static_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 2480, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    struct_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) .. ++i {
        loop j: u64 = i + 1 while j < (? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) .. ++j {
            if node[].members[i][].member_name == node[].members[j][].member_name {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(553), "553", "", get_struct_name_fmt(ctx[].identifiers, node[].tag, node[].is_union, @struct_fmt), get_name_fmt(ctx[].identifiers, node[].members[i][].member_name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].members[i][].info_at)) else panic_sigabrt("abort", 2495, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        ;
        ctx[].errors[].info_at_buf = node[].members[i][].info_at
        loop .. while 0 {
            _errval = reslv_struct_type(ctx, node[].members[i][].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if not is_type_complete(ctx, node[].members[i][].member_type) {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(554), "554", get_struct_name_fmt(ctx[].identifiers, node[].tag, node[].is_union, @struct_fmt), get_name_fmt(ctx[].identifiers, node[].members[i][].member_name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].members[i][].member_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].members[i][].info_at)) else panic_sigabrt("abort", 2505, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = is_valid_type(ctx, node[].members[i][].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if struct_fmt {
        sdsfree(struct_fmt)
        struct_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn check_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    struct_fmt: string = ? 0 then sdsnew(0) else 0
    struct_member: *struc StructMember = 0
    struct_typedef: *struc StructTypedef = 0
    member_type: *struc Type = 0
    member_names: *u64 = 0
    members: *struc PairTIdentifierUPtrStructMember = 0
    _errval: i32 = 0
    alignment: i32;
    size: i64;
    if (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((node[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp) ~= -1 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(555), "555", "", "", get_struct_name_fmt(ctx[].identifiers, node[].tag, node[].is_union, @struct_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2530, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    alignment = 0
    size = 0l
    (((member_names) = stbds_arrgrowf((member_names), sizeof((member_names)[]), (0), ((? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) .. ++i {
        {
            name: u64 = node[].members[i][].member_name
            loop .. while 0 {
                (? (not (member_names) or (cast<*struc stbds_array_header>((member_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((member_names)) - 1)[].capacity) then (((member_names) = stbds_arrgrowf((member_names), sizeof((member_names)[]), (1), (0))) and 0) else 0)
                (member_names)[(cast<*struc stbds_array_header>((member_names)) - 1)[].length++] = (name)
            }
        }
        member_alignment: i32 = get_type_alignment(ctx, node[].members[i][].member_type)
        member_size: i64 = get_type_scale(ctx, node[].members[i][].member_type)
        {
            offset: i64 = 0l
            if node[].is_union {
                if size < member_size {
                    size = member_size
                }
            }
            else {
                offset = size % member_alignment
                if offset ~= 0l {
                    size += member_alignment - offset
                }
                offset = size
                size += member_size
            }
            if node[].members[i][].member_type ~= member_type {
                free_Type(@member_type)
                member_type = node[].members[i][].member_type
                (member_type)[]._ref_count++
            }
            ;
            ;
            struct_member = make_StructMember(offset, @member_type)
            loop .. while 0 {
                loop .. while 0 {
                    (members) = stbds_hmput_key((members), sizeof((members)[]), cast<*any>(@(((member_names)[(? (member_names) then (cast<*struc stbds_array_header>((member_names)) - 1)[].length else 0) - 1]))), sizeof(members)[].key, 0)
                    (members)[(cast<*struc stbds_array_header>(((members) - 1)) - 1)[].temp].key = ((member_names)[(? (member_names) then (cast<*struc stbds_array_header>((member_names)) - 1)[].length else 0) - 1])
                    (members)[(cast<*struc stbds_array_header>(((members) - 1)) - 1)[].temp].value = (struct_member)
                }
                struct_member = 0
            }
        }
        if alignment < member_alignment {
            alignment = member_alignment
        }
    }
    {
        offset: i64 = size % alignment
        if offset ~= 0l {
            size += alignment - offset
        }
    }
    struct_typedef = make_StructTypedef(alignment, size, @member_names, @members)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].struct_typedef_table) = stbds_hmput_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((node[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)
            (ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp].key = (node[].tag)
            (ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp].value = (struct_typedef)
        }
        struct_typedef = 0
    }
    label _Lfinally
    ;
    if struct_fmt {
        sdsfree(struct_fmt)
        struct_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    free_StructMember(@struct_member)
    free_StructTypedef(@struct_typedef)
    free_Type(@member_type)
    if member_names {
        loop .. while 0 {
            cast<none>((? (member_names) then free((cast<*struc stbds_array_header>((member_names)) - 1)) else cast<none>(0)))
            (member_names) = 0
        }
        member_names = 0
    }
    ;
    loop i: u64 = 0 while i < (? (members) then (cast<*struc stbds_array_header>(((members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@(members[i]).value)
    }
    if members {
        loop .. while 0 {
            cast<none>((? (members) ~= 0 then stbds_hmfree_func((members) - 1, sizeof((members)[])) else cast<none>(0)))
            (members) = 0
        }
        members = 0
    }
    ;
    return _errval
}
fn annotate_goto_label(ctx: *struc SemanticContext, node: *struc CLabel) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if (? ((ctx[].label_set) = stbds_hmget_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@((node[].target))), sizeof(ctx[].label_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp) ~= -1 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(567), "567", "", "", get_name_fmt(ctx[].identifiers, node[].target, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2597, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        (ctx[].label_set) = stbds_hmput_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@((node[].target))), sizeof(ctx[].label_set)[].key, 0)
        (ctx[].label_set)[(cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp].key = (node[].target)
        (ctx[].label_set)[(cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp].value = (0)
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn annotate_while_loop(ctx: *struc SemanticContext, node: *struc CWhile) none {
    node[].target = repr_label_identifier(ctx[].identifiers, 18)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
    loop .. while 0 {
        (? (not (ctx[].continue_loop_labels) or (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].capacity) then (((ctx[].continue_loop_labels) = stbds_arrgrowf((ctx[].continue_loop_labels), sizeof((ctx[].continue_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].continue_loop_labels)[(cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length++] = (node[].target)
    }
}
fn annotate_do_while_loop(ctx: *struc SemanticContext, node: *struc CDoWhile) none {
    node[].target = repr_label_identifier(ctx[].identifiers, 6)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
    loop .. while 0 {
        (? (not (ctx[].continue_loop_labels) or (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].capacity) then (((ctx[].continue_loop_labels) = stbds_arrgrowf((ctx[].continue_loop_labels), sizeof((ctx[].continue_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].continue_loop_labels)[(cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length++] = (node[].target)
    }
}
fn annotate_for_loop(ctx: *struc SemanticContext, node: *struc CFor) none {
    node[].target = repr_label_identifier(ctx[].identifiers, 8)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
    loop .. while 0 {
        (? (not (ctx[].continue_loop_labels) or (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].capacity) then (((ctx[].continue_loop_labels) = stbds_arrgrowf((ctx[].continue_loop_labels), sizeof((ctx[].continue_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].continue_loop_labels)[(cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length++] = (node[].target)
    }
}
fn annotate_switch_lookup(ctx: *struc SemanticContext, node: *struc CSwitch) none {
    node[].is_default = 0
    node[].target = repr_label_identifier(ctx[].identifiers, 15)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
}
fn annotate_case_jump(ctx: *struc SemanticContext, node: *struc CCase) i32 {
    _errval: i32 = 0
    if not ctx[].p_switch_statement {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(556), "556", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].value[].info_at)) else panic_sigabrt("abort", 2633, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = repr_case_identifier(        ctx[].identifiers, ctx[].p_switch_statement[].target, 0, (? (ctx[].p_switch_statement[].cases) then (cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].length else 0))
    label _Lfinally
    ;
    return _errval
}
fn annotate_default_jump(ctx: *struc SemanticContext, node: *struc CDefault) i32 {
    _errval: i32 = 0
    if not ctx[].p_switch_statement {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(557), "557", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2644, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].p_switch_statement[].is_default {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(558), "558", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2647, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = ctx[].p_switch_statement[].target
    ctx[].p_switch_statement[].is_default = 1
    label _Lfinally
    ;
    return _errval
}
fn annotate_break_jump(ctx: *struc SemanticContext, node: *struc CBreak) i32 {
    _errval: i32 = 0
    if ((? (ctx[].break_loop_labels) then (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(559), "559", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2658, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = (ctx[].break_loop_labels)[(? (ctx[].break_loop_labels) then (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length else 0) - 1]
    label _Lfinally
    ;
    return _errval
}
fn annotate_continue_jump(ctx: *struc SemanticContext, node: *struc CContinue) i32 {
    _errval: i32 = 0
    if ((? (ctx[].continue_loop_labels) then (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(560), "560", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 2668, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = (ctx[].continue_loop_labels)[(? (ctx[].continue_loop_labels) then (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length else 0) - 1]
    label _Lfinally
    ;
    return _errval
}
fn deannotate_loop(ctx: *struc SemanticContext) none {
    ((cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length--)
    ((cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length--)
}
fn deannotate_lookup(ctx: *struc SemanticContext) none {
    ((cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length--)
}
fn is_file_scope(ctx: *struc SemanticContext) i32 {
    return (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) == 1
}
fn enter_scope(ctx: *struc SemanticContext) none {
    loop .. while 0 {
        (? (not (ctx[].scoped_identifier_maps) or (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].capacity) then (((ctx[].scoped_identifier_maps) = stbds_arrgrowf((ctx[].scoped_identifier_maps), sizeof((ctx[].scoped_identifier_maps)[]), (1), (0))) and 0) else 0)
        (ctx[].scoped_identifier_maps)[(cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length++] = (0)
    }
    loop .. while 0 {
        (? (not (ctx[].scoped_struct_maps) or (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].capacity) then (((ctx[].scoped_struct_maps) = stbds_arrgrowf((ctx[].scoped_struct_maps), sizeof((ctx[].scoped_struct_maps)[]), (1), (0))) and 0) else 0)
        (ctx[].scoped_struct_maps)[(cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length++] = (0)
    }
}
fn exit_scope(ctx: *struc SemanticContext) none {
    loop i: u64 = 0 while i < (? ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) then (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].length - 1 else 0) .. ++i {
        identifier: u64 = ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1][i]).key
        map_it: i64 = (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((identifier))), sizeof(ctx[].extern_scope_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp)
        if map_it ~= -1         and (ctx[].extern_scope_map[map_it]).value == (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) {
            (? ((ctx[].extern_scope_map) = stbds_hmdel_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((identifier))), sizeof(ctx[].extern_scope_map)[].key, (cast<string>(@((ctx[].extern_scope_map))[].key) - cast<string>(((ctx[].extern_scope_map)))), 0)) then (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp else 0)
        }
    }
    if (ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1] {
        loop .. while 0 {
            cast<none>((? ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) ~= 0 then stbds_hmfree_func(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1, sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[])) else cast<none>(0)))
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = 0
        }
        (ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1] = 0
    }
    ;
    ((cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length--)
    if (ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1] {
        loop .. while 0 {
            cast<none>((? ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) ~= 0 then stbds_hmfree_func(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1, sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[])) else cast<none>(0)))
            ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = 0
        }
        (ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1] = 0
    }
    ;
    ((cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length--)
}
fn reslv_label(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt_1: string = ? 0 then sdsnew(0) else 0
    name_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (ctx[].goto_map) then (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (? ((ctx[].label_set) = stbds_hmget_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@(((ctx[].goto_map[i]).key))), sizeof(ctx[].label_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp) == -1 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(561), "561", "", get_name_fmt(ctx[].identifiers, (ctx[].goto_map[i]).key, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ((? ((? ((ctx[].errors[].info_at_map) = stbds_hmget_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@(((ctx[].goto_map[i]).value))), sizeof(ctx[].errors[].info_at_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp])[].value))) else panic_sigabrt("abort", 2714, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if name_fmt_1 {
        sdsfree(name_fmt_1)
        name_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if name_fmt_2 {
        sdsfree(name_fmt_2)
        name_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_ptr_struct(ctx: *struc SemanticContext, ptr_type: *struc Pointer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, ptr_type[].ref_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_arr_struct(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_struct_type(ctx, arr_type[].elem_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_struct(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    struct_fmt: string = ? 0 then sdsnew(0) else 0
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if struct_type[].is_union {
        if (? ((ctx[].union_def_set) = stbds_hmget_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].union_def_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp) ~= -1 {
            jump _Lfinally
        }
    }
    elif (? ((ctx[].struct_def_set) = stbds_hmget_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_def_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp) ~= -1 {
        jump _Lfinally
    }
    loop i: u64 = (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_struct_maps[i]) = stbds_hmget_key((ctx[].scoped_struct_maps[i]), sizeof((ctx[].scoped_struct_maps[i])[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].scoped_struct_maps[i])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_struct_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            structure: *struc Structure = @(ctx[].scoped_struct_maps[i][map_it]).value
            if structure[].is_union ~= struct_type[].is_union {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(562), "562", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_struct_name_fmt(ctx[].identifiers, struct_type[].tag, not struct_type[].is_union, @struct_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort", 2756, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
            struct_type[].tag = structure[].tag
            jump _Lfinally
        }
    }
    loop .. while 0 {
        ?         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(563), "563", "", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort", 2764, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        _errval = 1
        jump _Lfinally
    }
    label _Lfinally
    ;
    if struct_fmt {
        sdsfree(struct_fmt)
        struct_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_struct_type(ctx: *struc SemanticContext, type: *struc Type) i32 {
    _errval: i32 = 0
    match type[].type {
        -> 11 {
            loop .. while 0 {
                _errval = reslv_ptr_struct(ctx, @type[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 12 {
            loop .. while 0 {
                _errval = reslv_arr_struct(ctx, @type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 13 {
            loop .. while 0 {
                _errval = reslv_struct(ctx, @type[].get._Structure)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 10 {
            panic_sigabrt("abort", 2785, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) i32;
fn reslv_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32;
fn reslv_const_exp(node: *struc CConstant) none {
    check_const_exp(node)
}
fn reslv_string_exp(node: *struc CString) none {
    check_string_exp(node)
}
fn reslv_var_exp(ctx: *struc SemanticContext, node: *struc CVar) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    loop i: u64 = (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_identifier_maps[i]) = stbds_hmget_key((ctx[].scoped_identifier_maps[i]), sizeof((ctx[].scoped_identifier_maps[i])[]), cast<*any>(@((node[].name))), sizeof(ctx[].scoped_identifier_maps[i])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_identifier_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            node[].name = (ctx[].scoped_identifier_maps[i][map_it]).value
            jump Lelse
        }
    }
    loop .. while 0 {
        ?         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(564), "564", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 2810, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        _errval = 1
        jump _Lfinally
    }
    label Lelse
    loop .. while 0 {
        _errval = check_var_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_cast_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_unary_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_binary_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) i32 {
    _errval: i32 = 0
    if node[].exp_left {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_assign_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp_middle)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_conditional_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    loop i: u64 = (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_identifier_maps[i]) = stbds_hmget_key((ctx[].scoped_identifier_maps[i]), sizeof((ctx[].scoped_identifier_maps[i])[]), cast<*any>(@((node[].name))), sizeof(ctx[].scoped_identifier_maps[i])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_identifier_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            node[].name = (ctx[].scoped_identifier_maps[i][map_it]).value
            jump Lelse
        }
    }
    loop .. while 0 {
        ?         snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(565), "565", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort", 2876, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        _errval = 1
        jump _Lfinally
    }
    label Lelse
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].args[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = check_call_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_deref_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_addrof_expr(ctx: *struc SemanticContext, node: *struc CAddrOf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_exp(ctx, node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_addrof_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].primary_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].subscript_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_subscript_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_exp(ctx, node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_sizeof_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = check_sizeoft_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].structure)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_dot_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].pointer)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_arrow_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) i32 {
    _errval: i32 = 0
    match node[].type {
        -> 92 {
            reslv_const_exp(@node[].get._CConstant)
        }
        break
        -> 93 {
            reslv_string_exp(@node[].get._CString)
        }
        break
        -> 94 {
            loop .. while 0 {
                _errval = reslv_var_exp(ctx, @node[].get._CVar)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 95 {
            loop .. while 0 {
                _errval = reslv_cast_exp(ctx, @node[].get._CCast)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 96 {
            loop .. while 0 {
                _errval = reslv_unary_exp(ctx, @node[].get._CUnary)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 97 {
            loop .. while 0 {
                _errval = reslv_binary_exp(ctx, @node[].get._CBinary)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 98 {
            loop .. while 0 {
                _errval = reslv_assign_exp(ctx, @node[].get._CAssignment)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 99 {
            loop .. while 0 {
                _errval = reslv_conditional_exp(ctx, @node[].get._CConditional)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 100 {
            loop .. while 0 {
                _errval = reslv_call_exp(ctx, @node[].get._CFunctionCall)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 101 {
            loop .. while 0 {
                _errval = reslv_deref_exp(ctx, @node[].get._CDereference)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 102 {
            loop .. while 0 {
                _errval = reslv_addrof_expr(ctx, @node[].get._CAddrOf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 103 {
            loop .. while 0 {
                _errval = reslv_subscript_exp(ctx, @node[].get._CSubscript)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 104 {
            loop .. while 0 {
                _errval = reslv_sizeof_exp(ctx, @node[].get._CSizeOf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 105 {
            loop .. while 0 {
                _errval = reslv_sizeoft_exp(ctx, @node[].get._CSizeOfT)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 106 {
            loop .. while 0 {
                _errval = reslv_dot_exp(ctx, @node[].get._CDot)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 107 {
            loop .. while 0 {
                _errval = reslv_arrow_exp(ctx, @node[].get._CArrow)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 2997, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_exp(ctx, exp[])
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = check_typed_exp(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) i32;
fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32;
fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) i32;
fn reslv_for_init_decl(ctx: *struc SemanticContext, node: *struc CInitDecl) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if node[].init[].storage_class.type ~= 132 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(566), "566", "", get_name_fmt(ctx[].identifiers, node[].init[].name, @name_fmt), get_storage_class_fmt(@node[].init[].storage_class)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].init[].info_at)) else panic_sigabrt("abort", 3020, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_block_var_decl(ctx, node[].init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_for_init_exp(ctx: *struc SemanticContext, node: *struc CInitExp) i32 {
    _errval: i32 = 0
    if node[].init {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].init)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_for_init(ctx: *struc SemanticContext, node: *struc CForInit) i32 {
    _errval: i32 = 0
    match node[].type {
        -> 125 {
            loop .. while 0 {
                _errval = reslv_for_init_decl(ctx, @node[].get._CInitDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 126 {
            loop .. while 0 {
                _errval = reslv_for_init_exp(ctx, @node[].get._CInitExp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
        }
        otherwise {
            panic_sigabrt("abort", 3050, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) i32 {
    _errval: i32 = 0
    if node[].exp {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = check_ret_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_exp_statement(ctx: *struc SemanticContext, node: *struc CExpression) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_if_statement(ctx: *struc SemanticContext, node: *struc CIf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].then)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].else_fi {
        loop .. while 0 {
            _errval = reslv_statement(ctx, node[].else_fi)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = check_if_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_goto_statement(ctx: *struc SemanticContext, node: *struc CGoto) none {
    map_it: i64 = (? ((ctx[].goto_map) = stbds_hmget_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].goto_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].target = (ctx[].goto_map[map_it]).value
        loop .. while 0 {
            (ctx[].errors[].info_at_map) = stbds_hmput_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].errors[].info_at_map)[].key, 0)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].value = (node[].info_at)
        }
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        loop .. while 0 {
            (ctx[].goto_map) = stbds_hmput_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].goto_map)[].key, 0)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].value = (target)
        }
        node[].target = target
        loop .. while 0 {
            (ctx[].errors[].info_at_map) = stbds_hmput_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].errors[].info_at_map)[].key, 0)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].value = (node[].info_at)
        }
    }
}
fn reslv_label_statement(ctx: *struc SemanticContext, node: *struc CLabel) i32 {
    _errval: i32 = 0
    map_it: i64;
    loop .. while 0 {
        _errval = annotate_goto_label(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    map_it = (? ((ctx[].goto_map) = stbds_hmget_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].goto_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].target = (ctx[].goto_map[map_it]).value
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        loop .. while 0 {
            (ctx[].goto_map) = stbds_hmput_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].goto_map)[].key, 0)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].value = (target)
        }
        node[].target = target
    }
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_compound_statement(ctx: *struc SemanticContext, node: *struc CCompound) i32 {
    _errval: i32 = 0
    enter_scope(ctx)
    loop .. while 0 {
        _errval = reslv_block(ctx, node[].block)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exit_scope(ctx)
    label _Lfinally
    ;
    return _errval
}
fn reslv_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) i32 {
    _errval: i32 = 0
    annotate_while_loop(ctx, node)
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    deannotate_loop(ctx)
    loop .. while 0 {
        _errval = check_while_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) i32 {
    _errval: i32 = 0
    annotate_do_while_loop(ctx, node)
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    deannotate_loop(ctx)
    loop .. while 0 {
        _errval = check_do_while_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_for_statement(ctx: *struc SemanticContext, node: *struc CFor) i32 {
    _errval: i32 = 0
    annotate_for_loop(ctx, node)
    enter_scope(ctx)
    loop .. while 0 {
        _errval = reslv_for_init(ctx, node[].init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].condition {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].condition)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if node[].post {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].post)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exit_scope(ctx)
    deannotate_loop(ctx)
    loop .. while 0 {
        _errval = check_for_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    _errval: i32 = 0
    annotate_switch_lookup(ctx, node)
    enter_scope(ctx)
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].match)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        p_switch_statement: *struc CSwitch = ctx[].p_switch_statement
        ctx[].p_switch_statement = node
        loop .. while 0 {
            _errval = reslv_statement(ctx, node[].body)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].p_switch_statement = p_switch_statement
    }
    exit_scope(ctx)
    deannotate_lookup(ctx)
    loop .. while 0 {
        _errval = check_switch_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_case_statement(ctx: *struc SemanticContext, node: *struc CCase) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = annotate_case_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_typed_exp(ctx, @node[].value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_switch_statement[].cases) or (cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].capacity) then (((ctx[].p_switch_statement[].cases) = stbds_arrgrowf((ctx[].p_switch_statement[].cases), sizeof((ctx[].p_switch_statement[].cases)[]), (1), (0))) and 0) else 0)
            (ctx[].p_switch_statement[].cases)[(cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].length++] = (node[].value)
        }
        node[].value = 0
    }
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_default_statement(ctx: *struc SemanticContext, node: *struc CDefault) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = annotate_default_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_break_statement(ctx: *struc SemanticContext, node: *struc CBreak) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = annotate_break_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_continue_statement(ctx: *struc SemanticContext, node: *struc CContinue) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = annotate_continue_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) i32 {
    _errval: i32 = 0
    match node[].type {
        -> 109 {
            loop .. while 0 {
                _errval = reslv_ret_statement(ctx, @node[].get._CReturn)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 110 {
            loop .. while 0 {
                _errval = reslv_exp_statement(ctx, @node[].get._CExpression)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 111 {
            loop .. while 0 {
                _errval = reslv_if_statement(ctx, @node[].get._CIf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 112 {
            reslv_goto_statement(ctx, @node[].get._CGoto)
        }
        break
        -> 113 {
            loop .. while 0 {
                _errval = reslv_label_statement(ctx, @node[].get._CLabel)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 114 {
            loop .. while 0 {
                _errval = reslv_compound_statement(ctx, @node[].get._CCompound)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 115 {
            loop .. while 0 {
                _errval = reslv_while_statement(ctx, @node[].get._CWhile)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 116 {
            loop .. while 0 {
                _errval = reslv_do_while_statement(ctx, @node[].get._CDoWhile)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 117 {
            loop .. while 0 {
                _errval = reslv_for_statement(ctx, @node[].get._CFor)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 118 {
            loop .. while 0 {
                _errval = reslv_switch_statement(ctx, @node[].get._CSwitch)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 119 {
            loop .. while 0 {
                _errval = reslv_case_statement(ctx, @node[].get._CCase)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 120 {
            loop .. while 0 {
                _errval = reslv_default_statement(ctx, @node[].get._CDefault)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 121 {
            loop .. while 0 {
                _errval = reslv_break_statement(ctx, @node[].get._CBreak)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 122 {
            loop .. while 0 {
                _errval = reslv_continue_statement(ctx, @node[].get._CContinue)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 123 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 3265, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) i32;
fn reslv_block_items(ctx: *struc SemanticContext, node_list: **struc CBlockItem) i32 {
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        match node_list[i][].type {
            -> 130 {
                loop .. while 0 {
                    _errval = reslv_statement(ctx, node_list[i][].get._CS.statement)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            -> 131 {
                loop .. while 0 {
                    _errval = reslv_declaration(ctx, node_list[i][].get._CD.declaration)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            otherwise {
                panic_sigabrt("abort", 3284, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) i32 {
    _errval: i32 = 0
    ;
    loop .. while 0 {
        _errval = reslv_block_items(ctx, node[].get._CB.block_items)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) i32;
fn reslv_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) i32 {
    _errval: i32 = 0
    if node[].exp[].type == 93 and (init_type[])[].type == 12 {
        loop .. while 0 {
            _errval = check_bound_string_init(ctx, @node[].exp[].get._CString, @(init_type[])[].get._Array)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        check_string_init(node, init_type)
    }
    else {
        loop .. while 0 {
            _errval = reslv_typed_exp(ctx, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = check_single_init(ctx, node, init_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = check_bound_arr_init(ctx, node, arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            _errval = reslv_initializer(ctx, node[].initializers[i], @arr_type[].elem_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    check_arr_init(ctx, node, arr_type, init_type)
    label _Lfinally
    ;
    return _errval
}
fn reslv_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = check_bound_struct_init(ctx, node, struct_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)
        loop .. while 0 {
            _errval = reslv_initializer(ctx, node[].initializers[i], @member[].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    check_struct_init(ctx, node, struct_type, init_type)
    label _Lfinally
    ;
    return _errval
}
fn reslv_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, init_type: **struc Type) i32 {
    type_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    match (init_type[])[].type {
        -> 12 {
            loop .. while 0 {
                _errval = reslv_arr_init(ctx, node, @(init_type[])[].get._Array, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 13 {
            loop .. while 0 {
                _errval = reslv_struct_init(ctx, node, @(init_type[])[].get._Structure, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(547), "547", "", "", get_type_fmt(ctx[].identifiers, init_type[], @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort", 3353, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) i32 {
    _errval: i32 = 0
    match node[].type {
        -> 136 {
            loop .. while 0 {
                _errval = reslv_single_init(ctx, @node[].get._CSingleInit, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 137 {
            loop .. while 0 {
                _errval = reslv_compound_init(ctx, @node[].get._CCompoundInit, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 3371, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) .. ++i {
        param: u64 = node[].params[i]
        if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((param))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(568), "568", "", "", get_name_fmt(ctx[].identifiers, param, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3383, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        param = rslv_var_identifier(ctx[].identifiers, param)
        loop .. while 0 {
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].params[i]))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].params[i])
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (param)
        }
        node[].params[i] = param
    }
    loop .. while 0 {
        _errval = check_fun_params_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_fun_declaration(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if not is_file_scope(ctx) {
        if node[].body {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(569), "569", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3400, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        elif node[].storage_class.type == 133 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(570), "570", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3403, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    if (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].extern_scope_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) == -1 {
        if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(571), "571", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3410, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            (ctx[].extern_scope_map) = stbds_hmput_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].extern_scope_map)[].key, 0)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].value = ((? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0))
        }
    }
    loop .. while 0 {
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (node[].name)
    }
    loop .. while 0 {
        _errval = check_ret_fun_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    enter_scope(ctx)
    if not ((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            _errval = reslv_fun_params_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        _errval = check_fun_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].body {
        loop .. while 0 {
            _errval = reslv_block(ctx, node[].body)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    exit_scope(ctx)
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    _errval: i32 = 0
    if (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].extern_scope_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            (ctx[].extern_scope_map) = stbds_hmput_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].extern_scope_map)[].key, 0)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].value = ((? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0))
        }
    }
    loop .. while 0 {
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (node[].name)
    }
    if is_file_scope(ctx) {
        loop .. while 0 {
            _errval = check_file_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = check_block_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1     and not ((? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].extern_scope_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) ~= -1 and node[].storage_class.type == 134) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(568), "568", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3456, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif node[].storage_class.type == 134 {
        loop .. while 0 {
            _errval = reslv_file_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    {
        name: u64 = rslv_var_identifier(ctx[].identifiers, node[].name)
        loop .. while 0 {
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key, 0)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (name)
        }
        node[].name = name
    }
    loop .. while 0 {
        _errval = check_block_var_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].init and node[].storage_class.type == 132 {
        loop .. while 0 {
            _errval = reslv_initializer(ctx, node[].init, @node[].var_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = check_struct_members_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_struct_declaration(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    struct_fmt_1: string = ? 0 then sdsnew(0) else 0
    struct_fmt_2: string = ? 0 then sdsnew(0) else 0
    _errval: i32 = 0
    map_it: i64 = (? (((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].tag))), sizeof((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].tag = ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1][map_it]).value.tag
        if node[].is_union {
            if (? ((ctx[].union_def_set) = stbds_hmget_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((node[].tag))), sizeof(ctx[].union_def_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp) == -1 {
                loop .. while 0 {
                    ?                     snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(562), "562", "", get_struct_name_fmt(ctx[].identifiers, node[].tag, node[].is_union, @struct_fmt_1), get_struct_name_fmt(ctx[].identifiers, node[].tag, not node[].is_union, @struct_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3495, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        elif (? ((ctx[].struct_def_set) = stbds_hmget_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((node[].tag))), sizeof(ctx[].struct_def_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp) == -1 {
            loop .. while 0 {
                ?                 snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_semantic_msg(562), "562", "", get_struct_name_fmt(ctx[].identifiers, node[].tag, node[].is_union, @struct_fmt_1), get_struct_name_fmt(ctx[].identifiers, node[].tag, not node[].is_union, @struct_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort", 3501, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    else {
        {
            structure: struc Structure = $(rslv_struct_tag(ctx[].identifiers, node[].tag), node[].is_union)
            loop .. while 0 {
                ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].tag))), sizeof((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[].key, 0)
                ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].tag)
                ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (structure)
            }
            node[].tag = structure.tag
        }
        if node[].is_union {
            loop .. while 0 {
                (ctx[].union_def_set) = stbds_hmput_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((node[].tag))), sizeof(ctx[].union_def_set)[].key, 0)
                (ctx[].union_def_set)[(cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp].key = (node[].tag)
                (ctx[].union_def_set)[(cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp].value = (0)
            }
        }
        else {
            loop .. while 0 {
                (ctx[].struct_def_set) = stbds_hmput_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((node[].tag))), sizeof(ctx[].struct_def_set)[].key, 0)
                (ctx[].struct_def_set)[(cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp].key = (node[].tag)
                (ctx[].struct_def_set)[(cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp].value = (0)
            }
        }
    }
    if not ((? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            _errval = reslv_struct_members_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            _errval = check_struct_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    if struct_fmt_1 {
        sdsfree(struct_fmt_1)
        struct_fmt_1 = ? 0 then sdsnew(0) else 0
    }
    ;
    if struct_fmt_2 {
        sdsfree(struct_fmt_2)
        struct_fmt_2 = ? 0 then sdsnew(0) else 0
    }
    ;
    return _errval
}
fn reslv_fun_decl(ctx: *struc SemanticContext, node: *struc CFunDecl) i32 {
    _errval: i32 = 0
    if is_file_scope(ctx) {
        if ctx[].goto_map {
            loop .. while 0 {
                cast<none>((? (ctx[].goto_map) ~= 0 then stbds_hmfree_func((ctx[].goto_map) - 1, sizeof((ctx[].goto_map)[])) else cast<none>(0)))
                (ctx[].goto_map) = 0
            }
            ctx[].goto_map = 0
        }
        ;
        if ctx[].label_set {
            loop .. while 0 {
                cast<none>((? (ctx[].label_set) ~= 0 then stbds_hmfree_func((ctx[].label_set) - 1, sizeof((ctx[].label_set)[])) else cast<none>(0)))
                (ctx[].label_set) = 0
            }
            ctx[].label_set = 0
        }
        ;
        if ctx[].break_loop_labels {
            (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length = 0
        }
        ;
        if ctx[].continue_loop_labels {
            (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length = 0
        }
        ;
        ctx[].p_switch_statement = 0
    }
    loop .. while 0 {
        _errval = reslv_fun_declaration(ctx, node[].fun_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if is_file_scope(ctx) {
        loop .. while 0 {
            _errval = reslv_label(ctx, node[].fun_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_var_decl(ctx: *struc SemanticContext, node: *struc CVarDecl) i32 {
    _errval: i32 = 0
    if is_file_scope(ctx) {
        loop .. while 0 {
            _errval = reslv_file_var_decl(ctx, node[].var_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            _errval = reslv_block_var_decl(ctx, node[].var_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDecl) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        _errval = reslv_struct_declaration(ctx, node[].struct_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) i32 {
    _errval: i32 = 0
    match node[].type {
        -> 143 {
            loop .. while 0 {
                _errval = reslv_fun_decl(ctx, @node[].get._CFunDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 144 {
            loop .. while 0 {
                _errval = reslv_var_decl(ctx, @node[].get._CVarDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> 145 {
            loop .. while 0 {
                _errval = reslv_struct_decl(ctx, @node[].get._CStructDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 3578, "/home/romain/proj/planet/selfhost/wheelcc/frontend/semantic.c")
        }
    }
    label _Lfinally
    ;
    return _errval
}
fn resolve_program(ctx: *struc SemanticContext, node: *struc CProgram) i32 {
    _errval: i32 = 0
    enter_scope(ctx)
    loop i: u64 = 0 while i < (? (node[].declarations) then (cast<*struc stbds_array_header>((node[].declarations)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            _errval = reslv_declaration(ctx, node[].declarations[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    ;
    return _errval
}
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32 {
    ctx: struc SemanticContext;
    {
        ctx.errors = errors
        ctx.frontend = frontend
        ctx.identifiers = identifiers
        ctx.extern_scope_map = 0
        ctx.goto_map = 0
        ctx.scoped_identifier_maps = 0
        ctx.scoped_struct_maps = 0
        ctx.label_set = 0
        ctx.break_loop_labels = 0
        ctx.continue_loop_labels = 0
        ctx.fun_def_set = 0
        ctx.struct_def_set = 0
        ctx.union_def_set = 0
    }
    _errval: i32 = 0
    loop .. while 0 {
        _errval = resolve_program(@ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if ctx.extern_scope_map {
        loop .. while 0 {
            cast<none>((? (ctx.extern_scope_map) ~= 0 then stbds_hmfree_func((ctx.extern_scope_map) - 1, sizeof((ctx.extern_scope_map)[])) else cast<none>(0)))
            (ctx.extern_scope_map) = 0
        }
        ctx.extern_scope_map = 0
    }
    ;
    if ctx.goto_map {
        loop .. while 0 {
            cast<none>((? (ctx.goto_map) ~= 0 then stbds_hmfree_func((ctx.goto_map) - 1, sizeof((ctx.goto_map)[])) else cast<none>(0)))
            (ctx.goto_map) = 0
        }
        ctx.goto_map = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx.scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx.scoped_identifier_maps)) - 1)[].length else 0) .. ++i {
        if ctx.scoped_identifier_maps[i] {
            loop .. while 0 {
                cast<none>((? (ctx.scoped_identifier_maps[i]) ~= 0 then stbds_hmfree_func((ctx.scoped_identifier_maps[i]) - 1, sizeof((ctx.scoped_identifier_maps[i])[])) else cast<none>(0)))
                (ctx.scoped_identifier_maps[i]) = 0
            }
            ctx.scoped_identifier_maps[i] = 0
        }
        ;
    }
    if ctx.scoped_identifier_maps {
        loop .. while 0 {
            cast<none>((? (ctx.scoped_identifier_maps) then free((cast<*struc stbds_array_header>((ctx.scoped_identifier_maps)) - 1)) else cast<none>(0)))
            (ctx.scoped_identifier_maps) = 0
        }
        ctx.scoped_identifier_maps = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx.scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx.scoped_struct_maps)) - 1)[].length else 0) .. ++i {
        if ctx.scoped_struct_maps[i] {
            loop .. while 0 {
                cast<none>((? (ctx.scoped_struct_maps[i]) ~= 0 then stbds_hmfree_func((ctx.scoped_struct_maps[i]) - 1, sizeof((ctx.scoped_struct_maps[i])[])) else cast<none>(0)))
                (ctx.scoped_struct_maps[i]) = 0
            }
            ctx.scoped_struct_maps[i] = 0
        }
        ;
    }
    if ctx.scoped_struct_maps {
        loop .. while 0 {
            cast<none>((? (ctx.scoped_struct_maps) then free((cast<*struc stbds_array_header>((ctx.scoped_struct_maps)) - 1)) else cast<none>(0)))
            (ctx.scoped_struct_maps) = 0
        }
        ctx.scoped_struct_maps = 0
    }
    ;
    if ctx.label_set {
        loop .. while 0 {
            cast<none>((? (ctx.label_set) ~= 0 then stbds_hmfree_func((ctx.label_set) - 1, sizeof((ctx.label_set)[])) else cast<none>(0)))
            (ctx.label_set) = 0
        }
        ctx.label_set = 0
    }
    ;
    if ctx.break_loop_labels {
        loop .. while 0 {
            cast<none>((? (ctx.break_loop_labels) then free((cast<*struc stbds_array_header>((ctx.break_loop_labels)) - 1)) else cast<none>(0)))
            (ctx.break_loop_labels) = 0
        }
        ctx.break_loop_labels = 0
    }
    ;
    if ctx.continue_loop_labels {
        loop .. while 0 {
            cast<none>((? (ctx.continue_loop_labels) then free((cast<*struc stbds_array_header>((ctx.continue_loop_labels)) - 1)) else cast<none>(0)))
            (ctx.continue_loop_labels) = 0
        }
        ctx.continue_loop_labels = 0
    }
    ;
    if ctx.fun_def_set {
        loop .. while 0 {
            cast<none>((? (ctx.fun_def_set) ~= 0 then stbds_hmfree_func((ctx.fun_def_set) - 1, sizeof((ctx.fun_def_set)[])) else cast<none>(0)))
            (ctx.fun_def_set) = 0
        }
        ctx.fun_def_set = 0
    }
    ;
    if ctx.struct_def_set {
        loop .. while 0 {
            cast<none>((? (ctx.struct_def_set) ~= 0 then stbds_hmfree_func((ctx.struct_def_set) - 1, sizeof((ctx.struct_def_set)[])) else cast<none>(0)))
            (ctx.struct_def_set) = 0
        }
        ctx.struct_def_set = 0
    }
    ;
    if ctx.union_def_set {
        loop .. while 0 {
            cast<none>((? (ctx.union_def_set) ~= 0 then stbds_hmfree_func((ctx.union_def_set) - 1, sizeof((ctx.union_def_set)[])) else cast<none>(0)))
            (ctx.union_def_set) = 0
        }
        ctx.union_def_set = 0
    }
    ;
    if errors[].info_at_map {
        loop .. while 0 {
            cast<none>((? (errors[].info_at_map) ~= 0 then stbds_hmfree_func((errors[].info_at_map) - 1, sizeof((errors[].info_at_map)[])) else cast<none>(0)))
            (errors[].info_at_map) = 0
        }
        errors[].info_at_map = 0
    }
    ;
    loop i: u64 = 0 while i < (? (errors[].fopen_lines) then (cast<*struc stbds_array_header>((errors[].fopen_lines)) - 1)[].length else 0) .. ++i {
        if errors[].fopen_lines[i].filename {
            sdsfree(errors[].fopen_lines[i].filename)
            errors[].fopen_lines[i].filename = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    if errors[].fopen_lines {
        loop .. while 0 {
            cast<none>((? (errors[].fopen_lines) then free((cast<*struc stbds_array_header>((errors[].fopen_lines)) - 1)) else cast<none>(0)))
            (errors[].fopen_lines) = 0
        }
        errors[].fopen_lines = 0
    }
    ;
    if errors[].token_infos {
        loop .. while 0 {
            cast<none>((? (errors[].token_infos) then free((cast<*struc stbds_array_header>((errors[].token_infos)) - 1)) else cast<none>(0)))
            (errors[].token_infos) = 0
        }
        errors[].token_infos = 0
    }
    ;
    return _errval
}
