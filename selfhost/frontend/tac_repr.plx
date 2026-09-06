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

type struc CExp;
type struc IdentifierContext;
pub fn rslv_label_identifier(ctx: *struc IdentifierContext, label: u64) u64;
pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64;
pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64;
pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64;
pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64;
pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64;
pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64;
type struc CProgram;
type struc TacProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram;

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
type struc TacUnaryOp;
type struc TacBinaryOp;
type struc TacValue;
type struc TacExpResult;
type struc TacInstruction;
type struc TacTopLevel;
type struc TacProgram;
type struc TacUnaryOp(    type: i32    )
pub fn make_TacUnaryOp(type: i32) struc TacUnaryOp;
type struc TacBinaryOp(    type: i32    )
pub fn make_TacBinaryOp(type: i32) struc TacBinaryOp;
type struc TacConstant(    constant: *struc CConst    )
type struc TacVariable(    name: u64    )
type union _TacValue(    _TacConstant: struc TacConstant    , _TacVariable: struc TacVariable    )
type struc TacValue(    _ref_count: u64, type: i32    , get: union _TacValue    )
pub fn make_TacValue(none) *struc TacValue;
pub fn make_TacConstant(constant: **struc CConst) *struc TacValue;
pub fn make_TacVariable(name: u64) *struc TacValue;
pub fn free_TacValue(self: **struc TacValue) none;
type struc TacPlainOperand(    val: *struc TacValue    )
type struc TacDereferencedPointer(    val: *struc TacValue    )
type struc TacSubObject(    base_name: u64    , offset: i64    )
type union _TacExpResult(    _TacPlainOperand: struc TacPlainOperand    , _TacDereferencedPointer: struc TacDereferencedPointer    , _TacSubObject: struc TacSubObject    )
type struc TacExpResult(    type: i32    , get: union _TacExpResult    )
pub fn make_TacExpResult(none) *struc TacExpResult;
pub fn make_TacPlainOperand(val: **struc TacValue) *struc TacExpResult;
pub fn make_TacDereferencedPointer(val: **struc TacValue) *struc TacExpResult;
pub fn make_TacSubObject(base_name: u64, offset: i64) *struc TacExpResult;
pub fn free_TacExpResult(self: **struc TacExpResult) none;
type struc TacReturn(    val: *struc TacValue    )
type struc TacSignExtend(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacTruncate(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacZeroExtend(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacDoubleToInt(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacDoubleToUInt(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacIntToDouble(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacUIntToDouble(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacFunCall(    name: u64    , args: **struc TacValue    , dst: *struc TacValue    )
type struc TacUnary(    unop: struc TacUnaryOp    , src: *struc TacValue    , dst: *struc TacValue    )
type struc TacBinary(    binop: struc TacBinaryOp    , src1: *struc TacValue    , src2: *struc TacValue    , dst: *struc TacValue    )
type struc TacCopy(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacGetAddress(    src: *struc TacValue    , dst: *struc TacValue    )
type struc TacLoad(    src_ptr: *struc TacValue    , dst: *struc TacValue    )
type struc TacStore(    src: *struc TacValue    , dst_ptr: *struc TacValue    )
type struc TacAddPtr(    scale: i64    , src_ptr: *struc TacValue    , idx: *struc TacValue    , dst: *struc TacValue    )
type struc TacCopyToOffset(    dst_name: u64    , offset: i64    , src: *struc TacValue    )
type struc TacCopyFromOffset(    src_name: u64    , offset: i64    , dst: *struc TacValue    )
type struc TacJump(    target: u64    )
type struc TacJumpIfZero(    target: u64    , condition: *struc TacValue    )
type struc TacJumpIfNotZero(    target: u64    , condition: *struc TacValue    )
type struc TacLabel(    name: u64    )
type union _TacInstruction(    _TacReturn: struc TacReturn    , _TacSignExtend: struc TacSignExtend    , _TacTruncate: struc TacTruncate    , _TacZeroExtend: struc TacZeroExtend    , _TacDoubleToInt: struc TacDoubleToInt    , _TacDoubleToUInt: struc TacDoubleToUInt    , _TacIntToDouble: struc TacIntToDouble    , _TacUIntToDouble: struc TacUIntToDouble    , _TacFunCall: struc TacFunCall    , _TacUnary: struc TacUnary    , _TacBinary: struc TacBinary    , _TacCopy: struc TacCopy    , _TacGetAddress: struc TacGetAddress    , _TacLoad: struc TacLoad    , _TacStore: struc TacStore    , _TacAddPtr: struc TacAddPtr    , _TacCopyToOffset: struc TacCopyToOffset    , _TacCopyFromOffset: struc TacCopyFromOffset    , _TacJump: struc TacJump    , _TacJumpIfZero: struc TacJumpIfZero    , _TacJumpIfNotZero: struc TacJumpIfNotZero    , _TacLabel: struc TacLabel    )
type struc TacInstruction(    type: i32    , get: union _TacInstruction    )
pub fn make_TacInstruction(none) *struc TacInstruction;
pub fn make_TacReturn(val: **struc TacValue) *struc TacInstruction;
pub fn make_TacSignExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacTruncate(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacZeroExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacDoubleToInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacDoubleToUInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacUIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacFunCall(name: u64, args: ***struc TacValue, dst: **struc TacValue) *struc TacInstruction;

pub fn make_TacUnary(unop: *struc TacUnaryOp, src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;

pub fn make_TacBinary(binop: *struc TacBinaryOp, src1: **struc TacValue, src2: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;

pub fn make_TacCopy(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacGetAddress(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacLoad(src_ptr: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacStore(src: **struc TacValue, dst_ptr: **struc TacValue) *struc TacInstruction;
pub fn make_TacAddPtr(scale: i64, src_ptr: **struc TacValue, idx: **struc TacValue, dst: **struc TacValue) *struc TacInstruction;

pub fn make_TacCopyToOffset(dst_name: u64, offset: i64, src: **struc TacValue) *struc TacInstruction;
pub fn make_TacCopyFromOffset(src_name: u64, offset: i64, dst: **struc TacValue) *struc TacInstruction;
pub fn make_TacJump(target: u64) *struc TacInstruction;
pub fn make_TacJumpIfZero(target: u64, condition: **struc TacValue) *struc TacInstruction;
pub fn make_TacJumpIfNotZero(target: u64, condition: **struc TacValue) *struc TacInstruction;
pub fn make_TacLabel(name: u64) *struc TacInstruction;
pub fn free_TacInstruction(self: **struc TacInstruction) none;
type struc TacFunction(    name: u64    , is_glob: i32    , params: *u64    , body: **struc TacInstruction    )
type struc TacStaticVariable(    name: u64    , is_glob: i32    , static_init_type: *struc Type    , static_inits: **struc StaticInit    )
type struc TacStaticConstant(    name: u64    , static_init_type: *struc Type    , static_init: *struc StaticInit    )
type union _TacTopLevel(    _TacFunction: struc TacFunction    , _TacStaticVariable: struc TacStaticVariable    , _TacStaticConstant: struc TacStaticConstant    )
type struc TacTopLevel(    type: i32    , get: union _TacTopLevel    )
pub fn make_TacTopLevel(none) *struc TacTopLevel;
pub fn make_TacFunction(name: u64, is_glob: i32, params: **u64, body: ***struc TacInstruction) *struc TacTopLevel;

pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: ***struc StaticInit) *struc TacTopLevel;

pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel;

pub fn free_TacTopLevel(self: **struc TacTopLevel) none;
type struc TacProgram(    type: i32    , static_const_toplvls: **struc TacTopLevel    , static_var_toplvls: **struc TacTopLevel    , fun_toplvls: **struc TacTopLevel    )
pub fn make_TacProgram(static_const_toplvls: ***struc TacTopLevel, static_var_toplvls: ***struc TacTopLevel, fun_toplvls: ***struc TacTopLevel) *struc TacProgram;

pub fn free_TacProgram(self: **struc TacProgram) none;
type struc TacReprContext(    frontend: *struc FrontEndContext    , identifiers: *struc IdentifierContext    , p_instrs: ***struc TacInstruction    , p_toplvls: ***struc TacTopLevel    , p_static_consts: ***struc TacTopLevel    )
fn repr_unop(node: *struc CUnaryOp) struc TacUnaryOp {
    match node[].type {
        -> 56 {
            return make_TacUnaryOp(148)
        }
        -> 57 {
            return make_TacUnaryOp(149)
        }
        -> 58 {
            return make_TacUnaryOp(150)
        }
        otherwise {
            panic_sigabrt("abort", 39, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn repr_binop(node: *struc CBinaryOp) struc TacBinaryOp {
    match node[].type {
        -> 62 {
            return make_TacBinaryOp(152)
        }
        -> 63 {
            return make_TacBinaryOp(153)
        }
        -> 64 {
            return make_TacBinaryOp(154)
        }
        -> 65 {
            return make_TacBinaryOp(155)
        }
        -> 66 {
            return make_TacBinaryOp(156)
        }
        -> 67 {
            return make_TacBinaryOp(157)
        }
        -> 68 {
            return make_TacBinaryOp(158)
        }
        -> 69 {
            return make_TacBinaryOp(159)
        }
        -> 70 {
            return make_TacBinaryOp(160)
        }
        -> 71 {
            return make_TacBinaryOp(161)
        }
        -> 72 {
            return make_TacBinaryOp(162)
        }
        -> 75 {
            return make_TacBinaryOp(163)
        }
        -> 76 {
            return make_TacBinaryOp(164)
        }
        -> 77 {
            return make_TacBinaryOp(165)
        }
        -> 78 {
            return make_TacBinaryOp(166)
        }
        -> 79 {
            return make_TacBinaryOp(167)
        }
        -> 80 {
            return make_TacBinaryOp(168)
        }
        otherwise {
            panic_sigabrt("abort", 83, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn const_value(node: *struc CConstant) *struc TacValue {
    constant: *struc CConst = 0
    if node[].constant ~= constant {
        free_CConst(@constant)
        constant = node[].constant
        (constant)[]._ref_count++
    }
    ;
    return make_TacConstant(@constant)
}
fn var_value(node: *struc CVar) *struc TacValue {
    name: u64 = node[].name
    return make_TacVariable(name)
}
fn exp_inner_value(ctx: *struc TacReprContext, node: *struc CExp, is_ptr: i32) *struc TacValue {
    inner_name: u64 = repr_var_identifier(ctx[].identifiers, node)
    if (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((inner_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp) == -1 {
        inner_type: *struc Type = 0
        if is_ptr {
            inner_type = make_Long()
        }
        else {
            if node[].exp_type ~= inner_type {
                free_Type(@inner_type)
                inner_type = node[].exp_type
                (inner_type)[]._ref_count++
            }
            ;
        }
        inner_attrs: *struc IdentifierAttr = make_LocalAttr()
        symbol: *struc Symbol = make_Symbol(@inner_type, @inner_attrs)
        loop .. while 0 {
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((inner_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (inner_name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }
            symbol = 0
        }
    }
    return make_TacVariable(inner_name)
}
fn plain_inner_value(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    return exp_inner_value(ctx, node, 0)
}
fn ptr_inner_value(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    return exp_inner_value(ctx, node, 1)
}
fn repr_value(node: *struc CExp) *struc TacValue {
    match node[].type {
        -> 92 {
            return const_value(@node[].get._CConstant)
        }
        -> 94 {
            return var_value(@node[].get._CVar)
        }
        otherwise {
            panic_sigabrt("abort", 129, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn push_instr(ctx: *struc TacReprContext, instr: *struc TacInstruction) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].capacity) then (((ctx[].p_instrs[]) = stbds_arrgrowf((ctx[].p_instrs[]), sizeof((ctx[].p_instrs[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length++] = (instr)
        }
        instr = 0
    }
}
fn repr_res_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacExpResult;
fn repr_exp_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue;
fn const_res_instr(node: *struc CConstant) *struc TacExpResult {
    val: *struc TacValue = repr_value(node[]._base)
    return make_TacPlainOperand(@val)
}
fn make_literal_identifier(ctx: *struc TacReprContext, node: *struc CStringLiteral) u64 {
    value: string = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}
fn string_res_instr(ctx: *struc TacReprContext, node: *struc CString) *struc TacExpResult {
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
    val: *struc TacValue = make_TacVariable(string_const_label)
    return make_TacPlainOperand(@val)
}
fn var_res_instr(node: *struc CVar) *struc TacExpResult {
    val: *struc TacValue = repr_value(node[]._base)
    return make_TacPlainOperand(@val)
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
            panic_sigabrt("abort", 216, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn get_type_scale(ctx: *struc TacReprContext, type: *struc Type) i64;
fn get_arr_scale(ctx: *struc TacReprContext, arr_type: *struc Array) i64 {
    size: i64 = arr_type[].size
    loop while arr_type[].elem_type[].type == 12 {
        arr_type = @arr_type[].elem_type[].get._Array
        size *= arr_type[].size
    }
    return get_type_scale(ctx, arr_type[].elem_type) * size
}
fn get_struct_scale(ctx: *struc TacReprContext, struct_type: *struc Structure) i64 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
}
fn get_type_scale(ctx: *struc TacReprContext, type: *struc Type) i64 {
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
fn cast_complete_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    if node[].target_type[].type == node[].exp[].exp_type[].type {
        return make_TacPlainOperand(@src)
    }
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    if node[].exp[].exp_type[].type == 8 {
        if is_type_signed(node[].target_type) {
            push_instr(ctx, make_TacDoubleToInt(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacDoubleToUInt(@src, @dst_cp))
        }
    }
    elif node[].target_type[].type == 8 {
        if is_type_signed(node[].exp[].exp_type) {
            push_instr(ctx, make_TacIntToDouble(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacUIntToDouble(@src, @dst_cp))
        }
    }
    else {
        target_type_size: i32 = get_scalar_size(node[].target_type)
        inner_type_size: i32 = get_scalar_size(node[].exp[].exp_type)
        if target_type_size == inner_type_size {
            push_instr(ctx, make_TacCopy(@src, @dst_cp))
        }
        elif target_type_size < inner_type_size {
            push_instr(ctx, make_TacTruncate(@src, @dst_cp))
        }
        elif is_type_signed(node[].exp[].exp_type) {
            push_instr(ctx, make_TacSignExtend(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacZeroExtend(@src, @dst_cp))
        }
    }
    return make_TacPlainOperand(@dst)
}
fn cast_void_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    dst: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    free_TacValue(@dst)
    return make_TacPlainOperand(@dst)
}
fn cast_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    if node[].target_type[].type == 9 {
        return cast_void_res_instr(ctx, node)
    }
    else {
        return cast_complete_res_instr(ctx, node)
    }
}
fn unary_res_instr(ctx: *struc TacReprContext, node: *struc CUnary) *struc TacExpResult {
    src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    unop: struc TacUnaryOp = repr_unop(@node[].unop)
    push_instr(ctx, make_TacUnary(@unop, @src, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_any_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult;
fn binary_add_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    scale: i64;
    src_ptr: *struc TacValue = 0
    idx: *struc TacValue = 0
    if node[].exp_left[].exp_type[].type == 11 {
        scale = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].exp_left)
        idx = repr_exp_instr(ctx, node[].exp_right)
    }
    else {
        scale = get_type_scale(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].exp_right)
        idx = repr_exp_instr(ctx, node[].exp_left)
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_add_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    if node[].exp_left[].exp_type[].type == 11 or node[].exp_right[].exp_type[].type == 11 {
        return binary_add_ptr_res_instr(ctx, node)
    }
    else {
        return binary_any_res_instr(ctx, node)
    }
}
fn binary_sub_to_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    scale: i64 = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
    src_ptr: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
    idx: *struc TacValue = 0
    {
        idx = repr_exp_instr(ctx, node[].exp_right)
        dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        unop: struc TacUnaryOp = make_TacUnaryOp(149)
        push_instr(ctx, make_TacUnary(@unop, @idx, @dst_cp))
        if dst ~= idx {
            free_TacValue(@idx)
            idx = dst
            dst = 0
        }
        ;
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_subtract_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    src_1: *struc TacValue = 0
    {
        src_1 = repr_exp_instr(ctx, node[].exp_left)
        src_2: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        binop: struc TacBinaryOp = make_TacBinaryOp(153)
        push_instr(ctx, make_TacBinary(@binop, @src_1, @src_2, @dst_cp))
        if dst ~= src_1 {
            free_TacValue(@src_1)
            src_1 = dst
            dst = 0
        }
        ;
    }
    src_2: *struc TacValue = 0
    {
        value: i64 = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
        constant: *struc CConst = make_CConstLong(value)
        src_2 = make_TacConstant(@constant)
    }
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    binop: struc TacBinaryOp = make_TacBinaryOp(155)
    push_instr(ctx, make_TacBinary(@binop, @src_1, @src_2, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_subtract_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    if node[].exp_left[].exp_type[].type == 11 {
        if node[].exp_right[].exp_type[].type == 11 {
            return binary_subtract_ptr_res_instr(ctx, node)
        }
        else {
            return binary_sub_to_ptr_res_instr(ctx, node)
        }
    }
    else {
        return binary_any_res_instr(ctx, node)
    }
}
fn binary_and_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    target_false: u64 = repr_label_identifier(ctx[].identifiers, 0)
    target_true: u64 = repr_label_identifier(ctx[].identifiers, 1)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition_left: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition_left))
    }
    {
        condition_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition_right))
    }
    {
        constant: *struc CConst = make_CConstInt(1)
        src_true: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacCopy(@src_true, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_true))
    push_instr(ctx, make_TacLabel(target_false))
    {
        constant: *struc CConst = make_CConstInt(0)
        src_false: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacCopy(@src_false, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_true))
    return make_TacPlainOperand(@dst)
}
fn binary_or_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    target_true: u64 = repr_label_identifier(ctx[].identifiers, 13)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, 12)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition_left: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
        push_instr(ctx, make_TacJumpIfNotZero(target_true, @condition_left))
    }
    {
        condition_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        push_instr(ctx, make_TacJumpIfNotZero(target_true, @condition_right))
    }
    {
        constant: *struc CConst = make_CConstInt(0)
        src_false: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacCopy(@src_false, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_true))
    {
        constant: *struc CConst = make_CConstInt(1)
        src_true: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacCopy(@src_true, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}
fn binary_any_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    src1: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
    src2: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    binop: struc TacBinaryOp = repr_binop(@node[].binop)
    push_instr(ctx, make_TacBinary(@binop, @src1, @src2, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    match node[].binop.type {
        -> 62 {
            return binary_add_res_instr(ctx, node)
        }
        -> 63 {
            return binary_subtract_res_instr(ctx, node)
        }
        -> 73 {
            return binary_and_res_instr(ctx, node)
        }
        -> 74 {
            return binary_or_res_instr(ctx, node)
        }
        otherwise {
            return binary_any_res_instr(ctx, node)
        }
    }
}
fn plain_op_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, dst: **struc TacValue) none {
    src: *struc TacValue = 0
    if res[].val ~= src {
        free_TacValue(@src)
        src = res[].val
        (src)[]._ref_count++
    }
    ;
    dst_cp: *struc TacValue = 0
    if dst[] ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacCopy(@src, @dst_cp))
}
fn deref_ptr_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, dst: **struc TacValue) none {
    src: *struc TacValue = 0
    if res[].val ~= src {
        free_TacValue(@src)
        src = res[].val
        (src)[]._ref_count++
    }
    ;
    dst_cp: *struc TacValue = 0
    if dst[] ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacLoad(@src, @dst_cp))
}
fn sub_obj_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, dst: **struc TacValue) none {
    src_name: u64 = res[].base_name
    offset: i64 = res[].offset
    dst_cp: *struc TacValue = 0
    if dst[] ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacCopyFromOffset(src_name, offset, @dst_cp))
}
fn plain_op_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, src: **struc TacValue) none {
    dst: *struc TacValue = 0
    if res[].val ~= dst {
        free_TacValue(@dst)
        dst = res[].val
        (dst)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacCopy(src, @dst))
}
fn deref_ptr_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, src: **struc TacValue, exp_res: **struc TacExpResult) none {
    src_cp: *struc TacValue = 0
    if src[] ~= src_cp {
        free_TacValue(@src_cp)
        src_cp = src[]
        (src_cp)[]._ref_count++
    }
    ;
    dst: *struc TacValue = 0
    if res[].val ~= dst {
        free_TacValue(@dst)
        dst = res[].val
        res[].val = 0
    }
    ;
    push_instr(ctx, make_TacStore(@src_cp, @dst))
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(src)
}
fn sub_obj_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, src: **struc TacValue, exp_res: **struc TacExpResult) none {
    dst_name: u64 = res[].base_name
    offset: i64 = res[].offset
    src_cp: *struc TacValue = 0
    if src[] ~= src_cp {
        free_TacValue(@src_cp)
        src_cp = src[]
        (src_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src_cp))
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(src)
}
fn assign_res_instr(ctx: *struc TacReprContext, node: *struc CAssignment) *struc TacExpResult {
    src: *struc TacValue = 0
    res: *struc TacExpResult = 0
    res_postfix: *struc TacExpResult = 0
    if node[].exp_left {
        src = repr_exp_instr(ctx, node[].exp_right)
        res = repr_res_instr(ctx, node[].exp_left)
    }
    else {
        label_count_1: u32 = ctx[].identifiers[].label_count
        var_count_1: u32 = ctx[].identifiers[].var_count
        struct_count_1: u32 = ctx[].identifiers[].struct_count
        src = repr_exp_instr(ctx, node[].exp_right)
        label_count_2: u32 = ctx[].identifiers[].label_count
        var_count_2: u32 = ctx[].identifiers[].var_count
        struct_count_2: u32 = ctx[].identifiers[].struct_count
        ctx[].identifiers[].label_count = label_count_1
        ctx[].identifiers[].var_count = var_count_1
        ctx[].identifiers[].struct_count = struct_count_1
        {
            exp_left: *struc CExp = node[].exp_right
            if exp_left[].type == 95 {
                exp_left = exp_left[].get._CCast.exp
            }
            exp_left = exp_left[].get._CBinary.exp_left
            if exp_left[].type == 95 {
                exp_left = exp_left[].get._CCast.exp
            }
            {
                noeval_instrs: **struc TacInstruction = 0
                p_instrs: ***struc TacInstruction = ctx[].p_instrs
                ctx[].p_instrs = @noeval_instrs
                res = repr_res_instr(ctx, exp_left)
                ctx[].p_instrs = p_instrs
                loop i: u64 = 0 while i < (? (noeval_instrs) then (cast<*struc stbds_array_header>((noeval_instrs)) - 1)[].length else 0) .. ++i {
                    free_TacInstruction(@noeval_instrs[i])
                }
                if noeval_instrs {
                    loop .. while 0 {
                        cast<none>((? (noeval_instrs) then free((cast<*struc stbds_array_header>((noeval_instrs)) - 1)) else cast<none>(0)))
                        (noeval_instrs) = 0
                    }
                    noeval_instrs = 0
                }
                ;
            }
            ctx[].identifiers[].label_count = label_count_2
            ctx[].identifiers[].var_count = var_count_2
            ctx[].identifiers[].struct_count = struct_count_2
            if node[].unop.type == 60 {
                dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
                match res[].type {
                    -> 173 {
                        plain_op_postfix_exp_instr(ctx, @res[].get._TacPlainOperand, @dst)
                    }
                    break
                    -> 174 {
                        deref_ptr_postfix_exp_instr(ctx, @res[].get._TacDereferencedPointer, @dst)
                    }
                    break
                    -> 175 {
                        sub_obj_postfix_exp_instr(ctx, @res[].get._TacSubObject, @dst)
                    }
                    break
                    otherwise {
                        panic_sigabrt("abort", 611, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
                    }
                }
                res_postfix = make_TacPlainOperand(@dst)
            }
        }
    }
    match res[].type {
        -> 173 {
            plain_op_assign_res_instr(ctx, @res[].get._TacPlainOperand, @src)
        }
        break
        -> 174 {
            deref_ptr_assign_res_instr(ctx, @res[].get._TacDereferencedPointer, @src, @res)
        }
        break
        -> 175 {
            sub_obj_assign_res_instr(ctx, @res[].get._TacSubObject, @src, @res)
        }
        break
        otherwise {
            panic_sigabrt("abort", 628, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
    if node[].unop.type == 60 {
        free_TacExpResult(@res)
        return res_postfix
    }
    else {
        return res
    }
}
fn conditional_complete_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, 16)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, 17)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }
    {
        src_middle: *struc TacValue = repr_exp_instr(ctx, node[].exp_middle)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacCopy(@src_middle, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    {
        src_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacCopy(@src_right, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}
fn conditional_void_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, 16)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, 17)
    dst: *struc TacValue = 0
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }
    dst = repr_exp_instr(ctx, node[].exp_middle)
    free_TacValue(@dst)
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    dst = repr_exp_instr(ctx, node[].exp_right)
    free_TacValue(@dst)
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}
fn conditional_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    if node[].exp_middle[].exp_type[].type == 9 {
        return conditional_void_res_instr(ctx, node)
    }
    else {
        return conditional_complete_res_instr(ctx, node)
    }
}
fn call_res_instr(ctx: *struc TacReprContext, node: *struc CFunctionCall) *struc TacExpResult {
    name: u64 = node[].name
    args: **struc TacValue = 0
    (((args) = stbds_arrgrowf((args), sizeof((args)[]), (0), ((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        arg: *struc TacValue = repr_exp_instr(ctx, node[].args[i])
        loop .. while 0 {
            loop .. while 0 {
                (? (not (args) or (cast<*struc stbds_array_header>((args)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args)) - 1)[].capacity) then (((args) = stbds_arrgrowf((args), sizeof((args)[]), (1), (0))) and 0) else 0)
                (args)[(cast<*struc stbds_array_header>((args)) - 1)[].length++] = (arg)
            }
            arg = 0
        }
    }
    dst: *struc TacValue = 0
    if node[]._base[].exp_type[].type ~= 9 {
        dst = plain_inner_value(ctx, node[]._base)
    }
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacFunCall(name, @args, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn deref_res_instr(ctx: *struc TacReprContext, node: *struc CDereference) *struc TacExpResult {
    val: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    return make_TacDereferencedPointer(@val)
}
fn plain_op_addrof_res_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, node: *struc CAddrOf) none {
    src: *struc TacValue = 0
    if res[].val ~= src {
        free_TacValue(@src)
        src = res[].val
        res[].val = 0
    }
    ;
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacGetAddress(@src, @dst_cp))
    if dst ~= res[].val {
        free_TacValue(@res[].val)
        res[].val = dst
        dst = 0
    }
    ;
}
fn deref_ptr_addrof_res_instr(res: *struc TacDereferencedPointer, exp_res: **struc TacExpResult) none {
    val: *struc TacValue = 0
    if res[].val ~= val {
        free_TacValue(@val)
        val = res[].val
        res[].val = 0
    }
    ;
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(@val)
}
fn sub_obj_addrof_res_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, node: *struc CAddrOf, exp_res: **struc TacExpResult) none {
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    {
        name: u64 = res[].base_name
        src: *struc TacValue = make_TacVariable(name)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacGetAddress(@src, @dst_cp))
    }
    if res[].offset > 0l {
        src_ptr: *struc TacValue = 0
        if dst ~= src_ptr {
            free_TacValue(@src_ptr)
            src_ptr = dst
            (src_ptr)[]._ref_count++
        }
        ;
        idx: *struc TacValue = 0
        {
            offset: i64 = res[].offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacAddPtr(1l, @src_ptr, @idx, @dst_cp))
    }
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(@dst)
}
fn addrof_res_instr(ctx: *struc TacReprContext, node: *struc CAddrOf) *struc TacExpResult {
    res: *struc TacExpResult = repr_res_instr(ctx, node[].exp)
    match res[].type {
        -> 173 {
            plain_op_addrof_res_instr(ctx, @res[].get._TacPlainOperand, node)
        }
        break
        -> 174 {
            deref_ptr_addrof_res_instr(@res[].get._TacDereferencedPointer, @res)
        }
        break
        -> 175 {
            sub_obj_addrof_res_instr(ctx, @res[].get._TacSubObject, node, @res)
        }
        break
        otherwise {
            panic_sigabrt("abort", 772, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
    return res
}
fn subscript_res_instr(ctx: *struc TacReprContext, node: *struc CSubscript) *struc TacExpResult {
    scale: i64;
    src_ptr: *struc TacValue = 0
    idx: *struc TacValue = 0
    if node[].primary_exp[].exp_type[].type == 11 {
        scale = get_type_scale(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].primary_exp)
        idx = repr_exp_instr(ctx, node[].subscript_exp)
    }
    else {
        scale = get_type_scale(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].subscript_exp)
        idx = repr_exp_instr(ctx, node[].primary_exp)
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacDereferencedPointer(@dst)
}
fn sizeof_res_instr(ctx: *struc TacReprContext, node: *struc CSizeOf) *struc TacExpResult {
    constant: *struc CConst = 0
    {
        value: u64 = cast<u64>(get_type_scale(ctx, node[].exp[].exp_type))
        constant = make_CConstULong(value)
    }
    val: *struc TacValue = make_TacConstant(@constant)
    return make_TacPlainOperand(@val)
}
fn sizeoft_res_instr(ctx: *struc TacReprContext, node: *struc CSizeOfT) *struc TacExpResult {
    constant: *struc CConst = 0
    {
        value: u64 = cast<u64>(get_type_scale(ctx, node[].target_type))
        constant = make_CConstULong(value)
    }
    val: *struc TacValue = make_TacConstant(@constant)
    return make_TacPlainOperand(@val)
}
fn plain_op_dot_res_instr(res: *struc TacPlainOperand, member_offset: i64, exp_res: **struc TacExpResult) none {
    ;
    base_name: u64 = res[].val[].get._TacVariable.name
    offset: i64 = member_offset
    free_TacExpResult(exp_res)
    exp_res[] = make_TacSubObject(base_name, offset)
}
fn deref_ptr_dot_res_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, node: *struc CDot, member_offset: i64) none {
    if member_offset > 0l {
        src_ptr: *struc TacValue = 0
        if res[].val ~= src_ptr {
            free_TacValue(@src_ptr)
            src_ptr = res[].val
            res[].val = 0
        }
        ;
        idx: *struc TacValue = 0
        {
            offset: i64 = member_offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacAddPtr(1l, @src_ptr, @idx, @dst_cp))
        if dst ~= res[].val {
            free_TacValue(@res[].val)
            res[].val = dst
            dst = 0
        }
        ;
    }
}
fn sub_obj_dot_res_instr(res: *struc TacSubObject, member_offset: i64) none {
    res[].offset += member_offset
}
fn dot_res_instr(ctx: *struc TacReprContext, node: *struc CDot) *struc TacExpResult {
    ;
    struct_type: *struc Structure = @node[].structure[].exp_type[].get._Structure
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    member_offset: i64 = ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof(struct_typedef[].members)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)[].offset
    res: *struc TacExpResult = repr_res_instr(ctx, node[].structure)
    match res[].type {
        -> 173 {
            plain_op_dot_res_instr(@res[].get._TacPlainOperand, member_offset, @res)
        }
        break
        -> 174 {
            deref_ptr_dot_res_instr(ctx, @res[].get._TacDereferencedPointer, node, member_offset)
        }
        break
        -> 175 {
            sub_obj_dot_res_instr(@res[].get._TacSubObject, member_offset)
        }
        break
        otherwise {
            panic_sigabrt("abort", 865, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
    return res
}
fn arrow_res_instr(ctx: *struc TacReprContext, node: *struc CArrow) *struc TacExpResult {
    ;
    ptr_type: *struc Pointer = @node[].pointer[].exp_type[].get._Pointer
    ;
    struct_type: *struc Structure = @ptr_type[].ref_type[].get._Structure
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    member_offset: i64 = ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof(struct_typedef[].members)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)[].offset
    val: *struc TacValue = repr_exp_instr(ctx, node[].pointer)
    if member_offset > 0l {
        idx: *struc TacValue = 0
        {
            offset: i64 = member_offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = 0
        if dst ~= dst_cp {
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_TacAddPtr(1l, @val, @idx, @dst_cp))
        if dst ~= val {
            free_TacValue(@val)
            val = dst
            dst = 0
        }
        ;
    }
    return make_TacDereferencedPointer(@val)
}
fn repr_res_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacExpResult {
    match node[].type {
        -> 92 {
            return const_res_instr(@node[].get._CConstant)
        }
        -> 93 {
            return string_res_instr(ctx, @node[].get._CString)
        }
        -> 94 {
            return var_res_instr(@node[].get._CVar)
        }
        -> 95 {
            return cast_res_instr(ctx, @node[].get._CCast)
        }
        -> 96 {
            return unary_res_instr(ctx, @node[].get._CUnary)
        }
        -> 97 {
            return binary_res_instr(ctx, @node[].get._CBinary)
        }
        -> 98 {
            return assign_res_instr(ctx, @node[].get._CAssignment)
        }
        -> 99 {
            return conditional_res_instr(ctx, @node[].get._CConditional)
        }
        -> 100 {
            return call_res_instr(ctx, @node[].get._CFunctionCall)
        }
        -> 101 {
            return deref_res_instr(ctx, @node[].get._CDereference)
        }
        -> 102 {
            return addrof_res_instr(ctx, @node[].get._CAddrOf)
        }
        -> 103 {
            return subscript_res_instr(ctx, @node[].get._CSubscript)
        }
        -> 104 {
            return sizeof_res_instr(ctx, @node[].get._CSizeOf)
        }
        -> 105 {
            return sizeoft_res_instr(ctx, @node[].get._CSizeOfT)
        }
        -> 106 {
            return dot_res_instr(ctx, @node[].get._CDot)
        }
        -> 107 {
            return arrow_res_instr(ctx, @node[].get._CArrow)
        }
        otherwise {
            panic_sigabrt("abort", 929, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn plain_op_exp_instr(res: *struc TacPlainOperand) *struc TacValue {
    dst: *struc TacValue = 0
    if res[].val ~= dst {
        free_TacValue(@dst)
        dst = res[].val
        res[].val = 0
    }
    ;
    return dst
}
fn deref_ptr_exp_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, node: *struc CExp) *struc TacValue {
    src: *struc TacValue = 0
    if res[].val ~= src {
        free_TacValue(@src)
        src = res[].val
        res[].val = 0
    }
    ;
    dst: *struc TacValue = plain_inner_value(ctx, node)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacLoad(@src, @dst_cp))
    return dst
}
fn sub_obj_exp_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, node: *struc CExp) *struc TacValue {
    src_name: u64 = res[].base_name
    offset: i64 = res[].offset
    dst: *struc TacValue = plain_inner_value(ctx, node)
    dst_cp: *struc TacValue = 0
    if dst ~= dst_cp {
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    ;
    push_instr(ctx, make_TacCopyFromOffset(src_name, offset, @dst_cp))
    return dst
}
fn repr_exp_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    val: *struc TacValue = 0
    res: *struc TacExpResult = repr_res_instr(ctx, node)
    match res[].type {
        -> 173 {
            val = plain_op_exp_instr(@res[].get._TacPlainOperand)
            break
        }
        -> 174 {
            val = deref_ptr_exp_instr(ctx, @res[].get._TacDereferencedPointer, node)
            break
        }
        -> 175 {
            val = sub_obj_exp_instr(ctx, @res[].get._TacSubObject, node)
            break
        }
        otherwise {
            panic_sigabrt("abort", 977, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
    free_TacExpResult(@res)
    return val
}
fn repr_block(ctx: *struc TacReprContext, node: *struc CBlock) none;
fn statement_instr(ctx: *struc TacReprContext, node: *struc CStatement) none;
fn var_decl_instr(ctx: *struc TacReprContext, node: *struc CVariableDeclaration) none;
fn ret_statement_instr(ctx: *struc TacReprContext, node: *struc CReturn) none {
    val: *struc TacValue = 0
    if node[].exp {
        val = repr_exp_instr(ctx, node[].exp)
    }
    push_instr(ctx, make_TacReturn(@val))
}
fn exp_statement_instr(ctx: *struc TacReprContext, node: *struc CExpression) none {
    res: *struc TacExpResult = repr_res_instr(ctx, node[].exp)
    free_TacExpResult(@res)
}
fn if_only_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    target_false: u64 = repr_label_identifier(ctx[].identifiers, 11)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition))
    }
    statement_instr(ctx, node[].then)
    push_instr(ctx, make_TacLabel(target_false))
}
fn if_else_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, 10)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, 11)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }
    statement_instr(ctx, node[].then)
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    statement_instr(ctx, node[].else_fi)
    push_instr(ctx, make_TacLabel(target_false))
}
fn if_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    if node[].else_fi {
        if_else_statement_instr(ctx, node)
    }
    else {
        if_only_statement_instr(ctx, node)
    }
}
fn goto_statement_instr(ctx: *struc TacReprContext, node: *struc CGoto) none {
    target_label: u64 = node[].target
    push_instr(ctx, make_TacJump(target_label))
}
fn label_statement_instr(ctx: *struc TacReprContext, node: *struc CLabel) none {
    target_label: u64 = node[].target
    push_instr(ctx, make_TacLabel(target_label))
    statement_instr(ctx, node[].jump_to)
}
fn statement_compound_instr(ctx: *struc TacReprContext, node: *struc CCompound) none {
    repr_block(ctx, node[].block)
}
fn while_statement_instr(ctx: *struc TacReprContext, node: *struc CWhile) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, 2, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, 4, node[].target)
    push_instr(ctx, make_TacLabel(target_continue))
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_break, @condition))
    }
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacJump(target_continue))
    push_instr(ctx, make_TacLabel(target_break))
}
fn do_while_statement_instr(ctx: *struc TacReprContext, node: *struc CDoWhile) none {
    target_do_while_start: u64 = repr_label_identifier(ctx[].identifiers, 7)
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, 2, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, 4, node[].target)
    push_instr(ctx, make_TacLabel(target_do_while_start))
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacLabel(target_continue))
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfNotZero(target_do_while_start, @condition))
    }
    push_instr(ctx, make_TacLabel(target_break))
}
fn for_init_decl_instr(ctx: *struc TacReprContext, node: *struc CInitDecl) none {
    if node[].init and node[].init[].init {
        var_decl_instr(ctx, node[].init)
    }
}
fn for_init_exp_instr(ctx: *struc TacReprContext, node: *struc CInitExp) none {
    if node[].init {
        res: *struc TacExpResult = repr_res_instr(ctx, node[].init)
        free_TacExpResult(@res)
    }
}
fn for_init_statement_instr(ctx: *struc TacReprContext, node: *struc CForInit) none {
    match node[].type {
        -> 125 {
            for_init_decl_instr(ctx, @node[].get._CInitDecl)
        }
        break
        -> 126 {
            for_init_exp_instr(ctx, @node[].get._CInitExp)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1096, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn for_statement_instr(ctx: *struc TacReprContext, node: *struc CFor) none {
    target_for_start: u64 = repr_label_identifier(ctx[].identifiers, 9)
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, 2, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, 4, node[].target)
    for_init_statement_instr(ctx, node[].init)
    push_instr(ctx, make_TacLabel(target_for_start))
    if node[].condition {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_break, @condition))
    }
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacLabel(target_continue))
    if node[].post {
        res: *struc TacExpResult = repr_res_instr(ctx, node[].post)
        free_TacExpResult(@res)
    }
    push_instr(ctx, make_TacJump(target_for_start))
    push_instr(ctx, make_TacLabel(target_break))
}
fn switch_statement_instr(ctx: *struc TacReprContext, node: *struc CSwitch) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, 2, node[].target)
    {
        match: *struc TacValue = repr_exp_instr(ctx, node[].match)
        loop i: u64 = 0 while i < (? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0) .. ++i {
            target_case: u64 = repr_case_identifier(ctx[].identifiers, node[].target, 1, i)
            case_match: *struc TacValue = 0
            {
                match_cp: *struc TacValue = 0
                if match ~= match_cp {
                    free_TacValue(@match_cp)
                    match_cp = match
                    (match_cp)[]._ref_count++
                }
                ;
                esac: *struc TacValue = repr_exp_instr(ctx, node[].cases[i])
                case_match = plain_inner_value(ctx, node[].cases[i])
                case_match_cp: *struc TacValue = 0
                if case_match ~= case_match_cp {
                    free_TacValue(@case_match_cp)
                    case_match_cp = case_match
                    (case_match_cp)[]._ref_count++
                }
                ;
                binop: struc TacBinaryOp = make_TacBinaryOp(163)
                push_instr(ctx, make_TacBinary(@binop, @match_cp, @esac, @case_match_cp))
            }
            push_instr(ctx, make_TacJumpIfNotZero(target_case, @case_match))
        }
        free_TacValue(@match)
    }
    if node[].is_default {
        target_default: u64 = repr_loop_identifier(ctx[].identifiers, 5, node[].target)
        push_instr(ctx, make_TacJump(target_default))
        statement_instr(ctx, node[].body)
    }
    elif not ((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0) == 0) {
        push_instr(ctx, make_TacJump(target_break))
        statement_instr(ctx, node[].body)
    }
    push_instr(ctx, make_TacLabel(target_break))
}
fn case_statement_instr(ctx: *struc TacReprContext, node: *struc CCase) none {
    target_case: u64 = repr_loop_identifier(ctx[].identifiers, 3, node[].target)
    push_instr(ctx, make_TacLabel(target_case))
    statement_instr(ctx, node[].jump_to)
}
fn default_statement_instr(ctx: *struc TacReprContext, node: *struc CDefault) none {
    target_default: u64 = repr_loop_identifier(ctx[].identifiers, 5, node[].target)
    push_instr(ctx, make_TacLabel(target_default))
    statement_instr(ctx, node[].jump_to)
}
fn break_statement_instr(ctx: *struc TacReprContext, node: *struc CBreak) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, 2, node[].target)
    push_instr(ctx, make_TacJump(target_break))
}
fn continue_statement_instr(ctx: *struc TacReprContext, node: *struc CContinue) none {
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, 4, node[].target)
    push_instr(ctx, make_TacJump(target_continue))
}
fn statement_instr(ctx: *struc TacReprContext, node: *struc CStatement) none {
    match node[].type {
        -> 109 {
            ret_statement_instr(ctx, @node[].get._CReturn)
        }
        break
        -> 110 {
            exp_statement_instr(ctx, @node[].get._CExpression)
        }
        break
        -> 111 {
            if_statement_instr(ctx, @node[].get._CIf)
        }
        break
        -> 112 {
            goto_statement_instr(ctx, @node[].get._CGoto)
        }
        break
        -> 113 {
            label_statement_instr(ctx, @node[].get._CLabel)
        }
        break
        -> 114 {
            statement_compound_instr(ctx, @node[].get._CCompound)
        }
        break
        -> 115 {
            while_statement_instr(ctx, @node[].get._CWhile)
        }
        break
        -> 116 {
            do_while_statement_instr(ctx, @node[].get._CDoWhile)
        }
        break
        -> 117 {
            for_statement_instr(ctx, @node[].get._CFor)
        }
        break
        -> 118 {
            switch_statement_instr(ctx, @node[].get._CSwitch)
        }
        break
        -> 119 {
            case_statement_instr(ctx, @node[].get._CCase)
        }
        break
        -> 120 {
            default_statement_instr(ctx, @node[].get._CDefault)
        }
        break
        -> 121 {
            break_statement_instr(ctx, @node[].get._CBreak)
        }
        break
        -> 122 {
            continue_statement_instr(ctx, @node[].get._CContinue)
        }
        break
        -> 123 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 1222, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn compound_init_instr(ctx: *struc TacReprContext, node: *struc CInitializer, init_type: *struc Type, symbol: u64, size: *i64) none;

fn string_single_init_instr(ctx: *struc TacReprContext, node: *struc CString, arr_type: *struc Array, symbol: u64, size: i64) none {
    byte_at: u64 = 0
    bytes_size: u64 = cast<u64>(arr_type[].size)
    bytes_copy: u64 = ? arr_type[].size > cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0)) then (? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0) else bytes_size
    loop while byte_at < bytes_copy {
        dst_name: u64 = symbol
        offset: i64 = size + (cast<i64>(byte_at))
        src: *struc TacValue = 0
        {
            constant: *struc CConst = 0
            {
                bytes_left: u64 = bytes_size - byte_at
                if bytes_left < 4 {
                    value: i8 = string_bytes_to_int8(node[].literal[].value, byte_at)
                    constant = make_CConstChar(value)
                    byte_at++
                }
                elif bytes_left < 8 {
                    value: i32 = string_bytes_to_int32(node[].literal[].value, byte_at)
                    constant = make_CConstInt(value)
                    byte_at += 4
                }
                else {
                    value: i64 = string_bytes_to_int64(node[].literal[].value, byte_at)
                    constant = make_CConstLong(value)
                    byte_at += 8
                }
            }
            src = make_TacConstant(@constant)
        }
        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
    loop while byte_at < bytes_size {
        dst_name: u64 = symbol
        offset: i64 = size + (cast<i64>(byte_at))
        src: *struc TacValue = 0
        {
            constant: *struc CConst = 0
            {
                bytes_left: u64 = bytes_size - byte_at
                if bytes_left < 4 {
                    constant = make_CConstChar(0)
                    byte_at++
                }
                elif bytes_left < 8 {
                    constant = make_CConstInt(0)
                    byte_at += 4
                }
                else {
                    constant = make_CConstLong(0l)
                    byte_at += 8
                }
            }
            src = make_TacConstant(@constant)
        }
        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
}
fn single_init_instr(ctx: *struc TacReprContext, node: *struc CSingleInit, init_type: *struc Type, symbol: u64) none {
    if node[].exp[].type == 93 and init_type[].type == 12 {
        string_single_init_instr(ctx, @node[].exp[].get._CString, @init_type[].get._Array, symbol, 0l)
    }
    else {
        src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
        dst: *struc TacValue = 0
        {
            name: u64 = symbol
            exp: *struc CExp = make_CVar(name, 0)
            dst = repr_value(exp)
            free_CExp(@exp)
        }
        push_instr(ctx, make_TacCopy(@src, @dst))
    }
}
fn scalar_compound_init_instr(ctx: *struc TacReprContext, node: *struc CSingleInit, init_type: *struc Type, symbol: u64, size: i64) none {
    if node[].exp[].type == 93 and init_type[].type == 12 {
        string_single_init_instr(ctx, @node[].exp[].get._CString, @init_type[].get._Array, symbol, size)
    }
    else {
        dst_name: u64 = symbol
        offset: i64 = size
        src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
}
fn arr_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, arr_type: *struc Array, symbol: u64, size: *i64) none {
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        compound_init_instr(ctx, node[].initializers[i], arr_type[].elem_type, symbol, size)
        if node[].initializers[i][].type == 136 {
            size[] += get_type_scale(ctx, arr_type[].elem_type)
        }
    }
}
fn struct_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, struct_type: *struc Structure, symbol: u64, size: *i64) none {
    loop i: u64 = (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) while i-- > 0 {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)
        offset: i64 = size[] + member[].offset
        compound_init_instr(ctx, node[].initializers[i], member[].member_type, symbol, @offset)
    }
    size[] += get_struct_scale(ctx, struct_type)
}
fn aggr_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, init_type: *struc Type, symbol: u64, size: *i64) none {
    match init_type[].type {
        -> 12 {
            arr_compound_init_instr(ctx, node, @init_type[].get._Array, symbol, size)
        }
        break
        -> 13 {
            struct_compound_init_instr(ctx, node, @init_type[].get._Structure, symbol, size)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1353, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn compound_init_instr(ctx: *struc TacReprContext, node: *struc CInitializer, init_type: *struc Type, symbol: u64, size: *i64) none {
    match node[].type {
        -> 136 {
            scalar_compound_init_instr(ctx, @node[].get._CSingleInit, init_type, symbol, size[])
        }
        break
        -> 137 {
            aggr_compound_init_instr(ctx, @node[].get._CCompoundInit, init_type, symbol, size)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1367, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn var_decl_instr(ctx: *struc TacReprContext, node: *struc CVariableDeclaration) none {
    init_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    match node[].init[].type {
        -> 136 {
            single_init_instr(ctx, @node[].init[].get._CSingleInit, init_type, node[].name)
        }
        break
        -> 137 {
            size: i64 = 0l
            aggr_compound_init_instr(ctx, @node[].init[].get._CCompoundInit, init_type, node[].name, @size)
            break
        }
        otherwise {
            panic_sigabrt("abort", 1383, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn var_declaration_instr(ctx: *struc TacReprContext, node: *struc CVarDecl) none {
    if node[].var_decl[].init     and ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].var_decl[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].type ~= 31 {
        var_decl_instr(ctx, node[].var_decl)
    }
}
fn declaration_instr(ctx: *struc TacReprContext, node: *struc CDeclaration) none {
    match node[].type {
        -> 143 {
            -> 145 {
                break
            }
        }
        -> 144 {
            var_declaration_instr(ctx, @node[].get._CVarDecl)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1403, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn repr_instr_list(ctx: *struc TacReprContext, node_list: **struc CBlockItem) none {
    loop i: u64 = 0 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        match node_list[i][].type {
            -> 130 {
                statement_instr(ctx, node_list[i][].get._CS.statement)
            }
            break
            -> 131 {
                declaration_instr(ctx, node_list[i][].get._CD.declaration)
            }
            break
            otherwise {
                panic_sigabrt("abort", 1424, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
            }
        }
    }
}
fn repr_block(ctx: *struc TacReprContext, node: *struc CBlock) none {
    if node[].type == 128 {
        repr_instr_list(ctx, node[].get._CB.block_items)
    }
    else {
        panic_sigabrt("abort", 1434, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
    }
}
fn repr_fun_toplvl(ctx: *struc TacReprContext, node: *struc CFunctionDeclaration) *struc TacTopLevel {
    name: u64 = node[].name
    is_glob: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].get._FunAttr.is_glob
    params: *u64 = 0
    loop .. while 0 {
        (? (? (params) then (cast<*struc stbds_array_header>((params)) - 1)[].capacity else 0) < cast<u64>(((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))) then ((((params)) = stbds_arrgrowf(((params)), sizeof(((params))[]), (0), (cast<u64>(((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))))))) and 0 else 0)
        ?         (params) then (cast<*struc stbds_array_header>((params)) - 1)[].length = cast<u64>(((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))) else 0
    }
    memcpy(params, node[].params, sizeof<u64> * (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))
    body: **struc TacInstruction = 0
    {
        ctx[].p_instrs = @body
        repr_block(ctx, node[].body)
        {
            constant: *struc CConst = make_CConstInt(0)
            val: *struc TacValue = make_TacConstant(@constant)
            push_instr(ctx, make_TacReturn(@val))
        }
        ctx[].p_instrs = 0
    }
    return make_TacFunction(name, is_glob, @params, @body)
}
fn push_toplvl(ctx: *struc TacReprContext, top_level: *struc TacTopLevel) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_toplvls[]) or (cast<*struc stbds_array_header>((ctx[].p_toplvls[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_toplvls[])) - 1)[].capacity) then (((ctx[].p_toplvls[]) = stbds_arrgrowf((ctx[].p_toplvls[]), sizeof((ctx[].p_toplvls[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_toplvls[])[(cast<*struc stbds_array_header>((ctx[].p_toplvls[])) - 1)[].length++] = (top_level)
        }
        top_level = 0
    }
}
fn fun_decl_toplvl(ctx: *struc TacReprContext, node: *struc CFunDecl) none {
    if node[].fun_decl[].body {
        push_toplvl(ctx, repr_fun_toplvl(ctx, node[].fun_decl))
    }
}
fn declaration_toplvl(ctx: *struc TacReprContext, node: *struc CDeclaration) none {
    match node[].type {
        -> 143 {
            fun_decl_toplvl(ctx, @node[].get._CFunDecl)
        }
        break
        -> 144 {
            -> 145 {
                break
            }
        }
        otherwise {
            panic_sigabrt("abort", 1479, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
}
fn tentative_static_toplvl(ctx: *struc TacReprContext, static_init_type: *struc Type) **struc StaticInit {
    static_inits: **struc StaticInit = 0
    {
        byte: i64 = get_type_scale(ctx, static_init_type)
        static_init: *struc StaticInit = make_ZeroInit(byte)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (static_inits) or (cast<*struc stbds_array_header>((static_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_inits)) - 1)[].capacity) then (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (1), (0))) and 0) else 0)
                (static_inits)[(cast<*struc stbds_array_header>((static_inits)) - 1)[].length++] = (static_init)
            }
            static_init = 0
        }
    }
    return static_inits
}
fn initial_static_toplvl(node: *struc Initial) **struc StaticInit {
    static_inits: **struc StaticInit = 0
    (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (0), ((? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0) .. ++i {
        static_init: *struc StaticInit = 0
        if node[].static_inits[i] ~= static_init {
            free_StaticInit(@static_init)
            static_init = node[].static_inits[i]
            (static_init)[]._ref_count++
        }
        ;
        loop .. while 0 {
            loop .. while 0 {
                (? (not (static_inits) or (cast<*struc stbds_array_header>((static_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_inits)) - 1)[].capacity) then (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (1), (0))) and 0) else 0)
                (static_inits)[(cast<*struc stbds_array_header>((static_inits)) - 1)[].length++] = (static_init)
            }
            static_init = 0
        }
    }
    return static_inits
}
fn repr_static_var_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    static_attr: *struc StaticAttr = @node[].attrs[].get._StaticAttr
    if static_attr[].init[].type == 28 {
        return none
    }
    name: u64 = symbol
    is_glob: i32 = static_attr[].is_glob
    static_init_type: *struc Type = 0
    if node[].type_t ~= static_init_type {
        free_Type(@static_init_type)
        static_init_type = node[].type_t
        (static_init_type)[]._ref_count++
    }
    ;
    static_inits: **struc StaticInit = 0
    match static_attr[].init[].type {
        -> 26 {
            static_inits = tentative_static_toplvl(ctx, static_init_type)
        }
        break
        -> 27 {
            static_inits = initial_static_toplvl(@static_attr[].init[].get._Initial)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1523, "/home/romain/proj/planet/selfhost/wheelcc/frontend/tac_repr.c")
        }
    }
    push_toplvl(ctx, make_TacStaticVariable(name, is_glob, @static_init_type, @static_inits))
}
fn push_static_const_toplvl(ctx: *struc TacReprContext, static_const_toplvls: *struc TacTopLevel) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_static_consts[]) or (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].capacity) then (((ctx[].p_static_consts[]) = stbds_arrgrowf((ctx[].p_static_consts[]), sizeof((ctx[].p_static_consts[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_static_consts[])[(cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length++] = (static_const_toplvls)
        }
        static_const_toplvls = 0
    }
}
fn repr_static_const_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    name: u64 = symbol
    static_init_type: *struc Type = 0
    if node[].type_t ~= static_init_type {
        free_Type(@static_init_type)
        static_init_type = node[].type_t
        (static_init_type)[]._ref_count++
    }
    ;
    static_init: *struc StaticInit = 0
    if node[].attrs[].get._ConstantAttr.static_init ~= static_init {
        free_StaticInit(@static_init)
        static_init = node[].attrs[].get._ConstantAttr.static_init
        (static_init)[]._ref_count++
    }
    ;
    push_static_const_toplvl(ctx, make_TacStaticConstant(name, @static_init_type, @static_init))
}
fn symbol_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    match node[].attrs[].type {
        -> 31 {
            repr_static_var_toplvl(ctx, node, symbol)
        }
        break
        -> 32 {
            repr_static_const_toplvl(ctx, node, symbol)
        }
        break
        otherwise {
            break
        }
    }
}
fn repr_program(ctx: *struc TacReprContext, node: *struc CProgram) *struc TacProgram {
    fun_toplvls: **struc TacTopLevel = 0
    {
        ctx[].p_toplvls = @fun_toplvls
        loop i: u64 = 0 while i < (? (node[].declarations) then (cast<*struc stbds_array_header>((node[].declarations)) - 1)[].length else 0) .. ++i {
            declaration_toplvl(ctx, node[].declarations[i])
        }
        ctx[].p_toplvls = 0
    }
    static_var_toplvls: **struc TacTopLevel = 0
    static_const_toplvls: **struc TacTopLevel = 0
    {
        ctx[].p_toplvls = @static_var_toplvls
        ctx[].p_static_consts = @static_const_toplvls
        loop i: u64 = 0 while i < (? (ctx[].frontend[].symbol_table) then (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
            symbol: *struc PairTIdentifierUPtrSymbol = @ctx[].frontend[].symbol_table[i]
            symbol_toplvl(ctx, (symbol[]).value, (symbol[]).key)
        }
        ctx[].p_toplvls = 0
        ctx[].p_static_consts = 0
    }
    return make_TacProgram(@static_const_toplvls, @static_var_toplvls, @fun_toplvls)
}
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram {
    ctx: struc TacReprContext;
    {
        ctx.frontend = frontend
        ctx.identifiers = identifiers
    }
    tac_ast: *struc TacProgram = repr_program(@ctx, c_ast[])
    free_CProgram(c_ast)
    ;
    return tac_ast
}
