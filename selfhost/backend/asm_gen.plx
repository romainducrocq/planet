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

type struc TacProgram;
type struc AsmProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram;

type struc AsmReg;
type struc AsmOperand;
pub fn gen_register(reg_kind: i32) *struc AsmOperand;
pub fn gen_memory(reg_kind: i32, value: i64) *struc AsmOperand;
pub fn gen_indexed(reg_kind_base: i32, reg_kind_idx: i32, scale: i64) *struc AsmOperand;
pub fn register_mask_kind(node: *struc AsmReg) i32;
pub fn register_mask_bit(reg_kind: i32) u64;
pub fn register_mask_get(reg_mask: u64, reg_kind: i32) i32;
pub fn register_mask_set(reg_mask: *u64, reg_kind: i32, value: i32) none;
type struc AsmInstruction;
type struc AsmProgram;
type struc BackEndContext;
pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction;
pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none;
type struc Type;
type struc AssemblyType;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn gen_type_alignment(ctx: *struc FrontEndContext, type: *struc Type) i32;
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType;
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none;
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
type struc AssemblyType;
type struc BackendSymbol;
type struc AsmOperand;
type struc Byte(    _empty: char    )
type struc LongWord(    _empty: char    )
type struc QuadWord(    _empty: char    )
type struc BackendDouble(    _empty: char    )
type struc ByteArray(    size: i64    , alignment: i32    )
type union _AssemblyType(    _Byte: struc Byte    , _LongWord: struc LongWord    , _QuadWord: struc QuadWord    , _BackendDouble: struc BackendDouble    , _ByteArray: struc ByteArray    )
type struc AssemblyType(    _ref_count: u64, type: i32    , get: union _AssemblyType    )
pub fn make_AssemblyType(none) *struc AssemblyType;
pub fn make_Byte(none) *struc AssemblyType;
pub fn make_LongWord(none) *struc AssemblyType;
pub fn make_QuadWord(none) *struc AssemblyType;
pub fn make_BackendDouble(none) *struc AssemblyType;
pub fn make_ByteArray(size: i64, alignment: i32) *struc AssemblyType;
pub fn free_AssemblyType(self: **struc AssemblyType) none;
type struc BackendObj(    is_static: i32    , is_const: i32    , asm_type: *struc AssemblyType    )
type struc BackendFun(    is_def: i32    , callee_saved_regs: **struc AsmOperand    )
type union _BackendSymbol(    _BackendObj: struc BackendObj    , _BackendFun: struc BackendFun    )
type struc BackendSymbol(    type: i32    , get: union _BackendSymbol    )
pub fn make_BackendSymbol(none) *struc BackendSymbol;
pub fn make_BackendObj(is_static: i32, is_const: i32, asm_type: **struc AssemblyType) *struc BackendSymbol;
pub fn make_BackendFun(is_def: i32) *struc BackendSymbol;
pub fn free_BackendSymbol(self: **struc BackendSymbol) none;
type struc PairTIdentifierUPtrBackendSymbol(key: u64, value: *struc BackendSymbol)
type struc BackEndContext(    symbol_table: *struc PairTIdentifierUPtrBackendSymbol    )
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
type struc AsmReg;
type struc AsmCondCode;
type struc AsmOperand;
type struc AsmBinaryOp;
type struc AsmUnaryOp;
type struc AsmInstruction;
type struc AsmTopLevel;
type struc AsmProgram;
type struc AsmReg(    type: i32    )
pub fn make_AsmReg(type: i32) struc AsmReg;
type struc AsmCondCode(    type: i32    )
pub fn make_AsmCondCode(type: i32) struc AsmCondCode;
type struc AsmImm(    value: u64    , is_byte: i32    , is_quad: i32    , is_neg: i32    )
type struc AsmRegister(    reg: struc AsmReg    )
type struc AsmPseudo(    name: u64    )
type struc AsmMemory(    value: i64    , reg: struc AsmReg    )
type struc AsmData(    name: u64    , offset: i64    )
type struc AsmPseudoMem(    name: u64    , offset: i64    )
type struc AsmIndexed(    scale: i64    , reg_base: struc AsmReg    , reg_index: struc AsmReg    )
type union _AsmOperand(    _AsmImm: struc AsmImm    , _AsmRegister: struc AsmRegister    , _AsmPseudo: struc AsmPseudo    , _AsmMemory: struc AsmMemory    , _AsmData: struc AsmData    , _AsmPseudoMem: struc AsmPseudoMem    , _AsmIndexed: struc AsmIndexed    )
type struc AsmOperand(    _ref_count: u64, type: i32    , get: union _AsmOperand    )
pub fn make_AsmOperand(none) *struc AsmOperand;
pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand;
pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmPseudo(name: u64) *struc AsmOperand;
pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand;
pub fn free_AsmOperand(self: **struc AsmOperand) none;
type struc AsmBinaryOp(    type: i32    )
pub fn make_AsmBinaryOp(type: i32) struc AsmBinaryOp;
type struc AsmUnaryOp(    type: i32    )
pub fn make_AsmUnaryOp(type: i32) struc AsmUnaryOp;
type struc AsmMov(    asm_type: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmMovSx(    asm_type_src: *struc AssemblyType    , asm_type_dst: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmMovZeroExtend(    asm_type_src: *struc AssemblyType    , asm_type_dst: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmLea(    src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmCvttsd2si(    asm_type: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmCvtsi2sd(    asm_type: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmUnary(    unop: struc AsmUnaryOp    , asm_type: *struc AssemblyType    , dst: *struc AsmOperand    )
type struc AsmBinary(    binop: struc AsmBinaryOp    , asm_type: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmCmp(    asm_type: *struc AssemblyType    , src: *struc AsmOperand    , dst: *struc AsmOperand    )
type struc AsmIdiv(    asm_type: *struc AssemblyType    , src: *struc AsmOperand    )
type struc AsmDiv(    asm_type: *struc AssemblyType    , src: *struc AsmOperand    )
type struc AsmCdq(    asm_type: *struc AssemblyType    )
type struc AsmJmp(    target: u64    )
type struc AsmJmpCC(    target: u64    , cond_code: struc AsmCondCode    )
type struc AsmSetCC(    cond_code: struc AsmCondCode    , dst: *struc AsmOperand    )
type struc AsmLabel(    name: u64    )
type struc AsmPush(    src: *struc AsmOperand    )
type struc AsmPop(    reg: struc AsmReg    )
type struc AsmCall(    name: u64    )
type struc AsmRet(    _empty: char    )
type union _AsmInstruction(    _AsmMov: struc AsmMov    , _AsmMovSx: struc AsmMovSx    , _AsmMovZeroExtend: struc AsmMovZeroExtend    , _AsmLea: struc AsmLea    , _AsmCvttsd2si: struc AsmCvttsd2si    , _AsmCvtsi2sd: struc AsmCvtsi2sd    , _AsmUnary: struc AsmUnary    , _AsmBinary: struc AsmBinary    , _AsmCmp: struc AsmCmp    , _AsmIdiv: struc AsmIdiv    , _AsmDiv: struc AsmDiv    , _AsmCdq: struc AsmCdq    , _AsmJmp: struc AsmJmp    , _AsmJmpCC: struc AsmJmpCC    , _AsmSetCC: struc AsmSetCC    , _AsmLabel: struc AsmLabel    , _AsmPush: struc AsmPush    , _AsmPop: struc AsmPop    , _AsmCall: struc AsmCall    , _AsmRet: struc AsmRet    )
type struc AsmInstruction(    type: i32    , get: union _AsmInstruction    )
pub fn make_AsmInstruction(none) *struc AsmInstruction;
pub fn make_AsmMov(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmMovSx(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmMovZeroExtend(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmLea(src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmCvttsd2si(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmCvtsi2sd(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: **struc AssemblyType, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmCmp(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction;

pub fn make_AsmIdiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmDiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmCdq(asm_type: **struc AssemblyType) *struc AsmInstruction;
pub fn make_AsmJmp(target: u64) *struc AsmInstruction;
pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction;
pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmLabel(name: u64) *struc AsmInstruction;
pub fn make_AsmPush(src: **struc AsmOperand) *struc AsmInstruction;
pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction;
pub fn make_AsmCall(name: u64) *struc AsmInstruction;
pub fn make_AsmRet(none) *struc AsmInstruction;
pub fn free_AsmInstruction(self: **struc AsmInstruction) none;
type struc AsmFunction(    name: u64    , is_glob: i32    , is_ret_memory: i32    , instructions: **struc AsmInstruction    )
type struc AsmStaticVariable(    name: u64    , alignment: i32    , is_glob: i32    , static_inits: **struc StaticInit    )
type struc AsmStaticConstant(    name: u64    , alignment: i32    , static_init: *struc StaticInit    )
type union _AsmTopLevel(    _AsmFunction: struc AsmFunction    , _AsmStaticVariable: struc AsmStaticVariable    , _AsmStaticConstant: struc AsmStaticConstant    )
type struc AsmTopLevel(    type: i32    , get: union _AsmTopLevel    )
pub fn make_AsmTopLevel(none) *struc AsmTopLevel;
pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: ***struc AsmInstruction) *struc AsmTopLevel;

pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: ***struc StaticInit) *struc AsmTopLevel;

pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel;

pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none;
type struc AsmProgram(    type: i32    , static_const_toplvls: **struc AsmTopLevel    , top_levels: **struc AsmTopLevel    )
pub fn make_AsmProgram(static_const_toplvls: ***struc AsmTopLevel, top_levels: ***struc AsmTopLevel) *struc AsmProgram;

pub fn free_AsmProgram(self: **struc AsmProgram) none;
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
type struc Struct8Bytes(    size: u64    , clss: [2]i32    )
type struc PairTIdentifierStStruct8Bytes(key: u64, value: struc Struct8Bytes)
type struc AsmGenContext(    frontend: *struc FrontEndContext    , identifiers: *struc IdentifierContext    , p_fun_type: *struc FunType    , arg_regs: [6]i32    , sse_arg_regs: [8]i32    , dbl_const_table: *struc PairTIdentifierTIdentifier    , struct_8b_map: *struc PairTIdentifierStStruct8Bytes    , p_instrs: ***struc AsmInstruction    , p_static_consts: ***struc AsmTopLevel    )
fn char_imm_op(node: *struc CConstChar) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_neg: i32 = node[].value < 0
    return make_AsmImm(value, 1, 0, is_neg)
}
fn int_imm_op(node: *struc CConstInt) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_byte: i32 = node[].value <= 127 and node[].value >= -128
    is_neg: i32 = node[].value < 0
    return make_AsmImm(value, is_byte, 0, is_neg)
}
fn long_imm_op(node: *struc CConstLong) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_byte: i32 = node[].value <= 127l and node[].value >= -128l
    is_quad: i32 = node[].value > 2147483647l or node[].value < -2147483648l
    is_neg: i32 = node[].value < 0l
    return make_AsmImm(value, is_byte, is_quad, is_neg)
}
fn uchar_imm(node: *struc CConstUChar) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    return make_AsmImm(value, 1, 0, 0)
}
fn uint_imm_op(node: *struc CConstUInt) *struc AsmOperand {
    value: u64 = cast<u64>(node[].value)
    is_byte: i32 = node[].value <= 255u
    is_quad: i32 = node[].value > 2147483647u
    return make_AsmImm(value, is_byte, is_quad, 0)
}
fn ulong_imm_op(node: *struc CConstULong) *struc AsmOperand {
    value: u64 = node[].value
    is_byte: i32 = node[].value <= 255ul
    is_quad: i32 = node[].value > 2147483647ul
    return make_AsmImm(value, is_byte, is_quad, 0)
}
fn repr_asm_label(ctx: *struc AsmGenContext, asm_label_kind: i32) u64 {
    name: string = ? 0 then sdsnew(0) else 0
    match asm_label_kind {
        -> 0 {
            name = ? "comisd_nan" then sdsnew("comisd_nan") else 0
            break
        }
        -> 1 {
            name = ? "double" then sdsnew("double") else 0
            break
        }
        -> 2 {
            name = ? "sd2si_after" then sdsnew("sd2si_after") else 0
            break
        }
        -> 3 {
            name = ? "sd2si_out_of_range" then sdsnew("sd2si_out_of_range") else 0
            break
        }
        -> 4 {
            name = ? "si2sd_after" then sdsnew("si2sd_after") else 0
            break
        }
        -> 5 {
            name = ? "si2sd_out_of_range" then sdsnew("si2sd_out_of_range") else 0
            break
        }
        otherwise {
            panic_sigabrt("abort", 125, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
    return make_label_identifier(ctx[].identifiers, @name)
}
fn dbl_static_const_toplvl(ctx: *struc AsmGenContext, identifier: u64, dbl_const: u64, byte: i32) none;
fn make_binary_identifier(ctx: *struc AsmGenContext, binary: u64) u64 {
    strto_binary: string = ? (binary) > 0 then sdsfromunsignedlong(cast<u64>((binary))) else sdsfromlong(cast<i64>((binary)))
    return make_string_identifier(ctx[].identifiers, @strto_binary)
}
fn dbl_static_const_op(ctx: *struc AsmGenContext, binary: u64, byte: i32) *struc AsmOperand {
    dbl_const_label: u64;
    {
        dbl_const: u64 = make_binary_identifier(ctx, binary)
        map_it: i64 = (? ((ctx[].dbl_const_table) = stbds_hmget_key((ctx[].dbl_const_table), sizeof((ctx[].dbl_const_table)[]), cast<*any>(@((dbl_const))), sizeof(ctx[].dbl_const_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].dbl_const_table) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            dbl_const_label = (ctx[].dbl_const_table[map_it]).value
        }
        else {
            dbl_const_label = repr_asm_label(ctx, 1)
            loop .. while 0 {
                (ctx[].dbl_const_table) = stbds_hmput_key((ctx[].dbl_const_table), sizeof((ctx[].dbl_const_table)[]), cast<*any>(@((dbl_const))), sizeof(ctx[].dbl_const_table)[].key, 0)
                (ctx[].dbl_const_table)[(cast<*struc stbds_array_header>(((ctx[].dbl_const_table) - 1)) - 1)[].temp].key = (dbl_const)
                (ctx[].dbl_const_table)[(cast<*struc stbds_array_header>(((ctx[].dbl_const_table) - 1)) - 1)[].temp].value = (dbl_const_label)
            }
            dbl_static_const_toplvl(ctx, dbl_const_label, dbl_const, byte)
        }
    }
    return make_AsmData(dbl_const_label, 0l)
}
fn dbl_const_op(ctx: *struc AsmGenContext, node: *struc CConstDouble) *struc AsmOperand {
    binary: u64 = dbl_to_binary(node[].value)
    byte: i32 = ? binary == 9223372036854775808ul then 16 else 8
    return dbl_static_const_op(ctx, binary, byte)
}
fn const_op(ctx: *struc AsmGenContext, node: *struc TacConstant) *struc AsmOperand {
    match node[].constant[].type {
        -> 52 {
            return char_imm_op(@node[].constant[].get._CConstChar)
        }
        -> 47 {
            return int_imm_op(@node[].constant[].get._CConstInt)
        }
        -> 48 {
            return long_imm_op(@node[].constant[].get._CConstLong)
        }
        -> 51 {
            return dbl_const_op(ctx, @node[].constant[].get._CConstDouble)
        }
        -> 53 {
            return uchar_imm(@node[].constant[].get._CConstUChar)
        }
        -> 49 {
            return uint_imm_op(@node[].constant[].get._CConstUInt)
        }
        -> 50 {
            return ulong_imm_op(@node[].constant[].get._CConstULong)
        }
        otherwise {
            panic_sigabrt("abort", 177, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn pseudo_op(node: *struc TacVariable) *struc AsmOperand {
    name: u64 = node[].name
    return make_AsmPseudo(name)
}
fn pseudo_mem_op(node: *struc TacVariable) *struc AsmOperand {
    name: u64 = node[].name
    return make_AsmPseudoMem(name, 0l)
}
fn var_op(ctx: *struc AsmGenContext, node: *struc TacVariable) *struc AsmOperand {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type {
        -> 12 {
            -> 13 {
                return pseudo_mem_op(node)
            }
        }
        otherwise {
            return pseudo_op(node)
        }
    }
}
fn gen_op(ctx: *struc AsmGenContext, node: *struc TacValue) *struc AsmOperand {
    match node[].type {
        -> 170 {
            return const_op(ctx, @node[].get._TacConstant)
        }
        -> 171 {
            return var_op(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort", 210, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn gen_signed_cond_code(node: *struc TacBinaryOp) struc AsmCondCode {
    match node[].type {
        -> 163 {
            return make_AsmCondCode(238)
        }
        -> 164 {
            return make_AsmCondCode(239)
        }
        -> 165 {
            return make_AsmCondCode(242)
        }
        -> 166 {
            return make_AsmCondCode(243)
        }
        -> 167 {
            return make_AsmCondCode(240)
        }
        -> 168 {
            return make_AsmCondCode(241)
        }
        otherwise {
            panic_sigabrt("abort", 230, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn gen_unsigned_cond_code(node: *struc TacBinaryOp) struc AsmCondCode {
    match node[].type {
        -> 163 {
            return make_AsmCondCode(238)
        }
        -> 164 {
            return make_AsmCondCode(239)
        }
        -> 165 {
            return make_AsmCondCode(246)
        }
        -> 166 {
            return make_AsmCondCode(247)
        }
        -> 167 {
            return make_AsmCondCode(244)
        }
        -> 168 {
            return make_AsmCondCode(245)
        }
        otherwise {
            panic_sigabrt("abort", 250, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn gen_unop(node: *struc TacUnaryOp) struc AsmUnaryOp {
    match node[].type {
        -> 148 {
            return make_AsmUnaryOp(269)
        }
        -> 149 {
            return make_AsmUnaryOp(270)
        }
        otherwise {
            panic_sigabrt("abort", 262, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn gen_binop(node: *struc TacBinaryOp) struc AsmBinaryOp {
    match node[].type {
        -> 152 {
            return make_AsmBinaryOp(258)
        }
        -> 153 {
            return make_AsmBinaryOp(259)
        }
        -> 154 {
            return make_AsmBinaryOp(260)
        }
        -> 155 {
            return make_AsmBinaryOp(261)
        }
        -> 157 {
            return make_AsmBinaryOp(262)
        }
        -> 158 {
            return make_AsmBinaryOp(263)
        }
        -> 159 {
            return make_AsmBinaryOp(264)
        }
        -> 160 {
            return make_AsmBinaryOp(265)
        }
        -> 161 {
            return make_AsmBinaryOp(266)
        }
        -> 162 {
            return make_AsmBinaryOp(267)
        }
        otherwise {
            panic_sigabrt("abort", 291, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn is_const_signed(node: *struc TacConstant) i32 {
    match node[].constant[].type {
        -> 52 {
            -> 47 {
                -> 48 {
                    return 1
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_var_signed(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type {
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
fn is_value_signed(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].type {
        -> 170 {
            return is_const_signed(@node[].get._TacConstant)
        }
        -> 171 {
            return is_var_signed(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort", 326, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn is_const_1b(node: *struc TacConstant) i32 {
    match node[].constant[].type {
        -> 52 {
            -> 53 {
                return 1
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_var_1b(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type {
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
fn is_value_1b(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].type {
        -> 170 {
            return is_const_1b(@node[].get._TacConstant)
        }
        -> 171 {
            return is_var_1b(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort", 358, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn is_const_4b(node: *struc TacConstant) i32 {
    match node[].constant[].type {
        -> 47 {
            -> 49 {
                return 1
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_var_4b(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type {
        -> 4 {
            -> 6 {
                return 1
            }
        }
        otherwise {
            return 0
        }
    }
}
fn is_value_4b(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].type {
        -> 170 {
            return is_const_4b(@node[].get._TacConstant)
        }
        -> 171 {
            return is_var_4b(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort", 389, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn is_const_dbl(node: *struc TacConstant) i32 {
    return node[].constant[].type == 51
}
fn is_var_dbl(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8
}
fn is_value_dbl(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].type {
        -> 170 {
            return is_const_dbl(@node[].get._TacConstant)
        }
        -> 171 {
            return is_var_dbl(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort", 406, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn is_var_struct(ctx: *struc AsmGenContext, node: *struc TacVariable) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 13
}
fn is_value_struct(ctx: *struc AsmGenContext, node: *struc TacValue) i32 {
    match node[].type {
        -> 171 {
            return is_var_struct(ctx, @node[].get._TacVariable)
        }
        -> 170 {
            return 0
        }
        otherwise {
            panic_sigabrt("abort", 421, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn const_asm_type(node: *struc TacConstant) *struc AssemblyType {
    match node[].constant[].type {
        -> 52 {
            -> 53 {
                return make_Byte()
            }
        }
        -> 47 {
            -> 49 {
                return make_LongWord()
            }
        }
        -> 51 {
            return make_BackendDouble()
        }
        -> 48 {
            -> 50 {
                return make_QuadWord()
            }
        }
        otherwise {
            panic_sigabrt("abort", 439, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn var_asm_type(ctx: *struc AsmGenContext, node: *struc TacVariable) *struc AssemblyType {
    return cvt_backend_asm_type(ctx[].frontend, node[].name)
}
fn gen_asm_type(ctx: *struc AsmGenContext, node: *struc TacValue) *struc AssemblyType {
    match node[].type {
        -> 170 {
            return const_asm_type(@node[].get._TacConstant)
        }
        -> 171 {
            return var_asm_type(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort", 454, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn asm_type_8b(ctx: *struc AsmGenContext, struct_type: *struc Structure, offset: i64) *struc AssemblyType {
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size - offset
    if size >= 8l {
        return make_QuadWord()
    }
    match size {
        -> 1l {
            return make_Byte()
        }
        -> 4l {
            return make_LongWord()
        }
        otherwise {
            return make_ByteArray(size, 8)
        }
    }
}
fn struct_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none;
fn struct_1_reg_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none {
    struct_8b: struc Struct8Bytes = $(1, $(1, 2))
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    members_front: u64 = ? struct_type[].is_union then (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) else 1
    loop i: u64 = 0 while i < members_front .. ++i {
        if struct_8b.clss[0] == 0 {
            break
        }
        member_type: *struc Type = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)[].member_type
        loop while member_type[].type == 12 {
            member_type = member_type[].get._Array.elem_type
        }
        if member_type[].type == 13 {
            member_struct_type: *struc Structure = @member_type[].get._Structure
            struct_8b_class(ctx, member_struct_type)
            if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == 0 {
                struct_8b.clss[0] = 0
            }
        }
        elif member_type[].type ~= 8 {
            struct_8b.clss[0] = 0
        }
    }
    loop .. while 0 {
        (ctx[].struct_8b_map) = stbds_hmput_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)
        (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].key = (struct_type[].tag)
        (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].value = (struct_8b)
    }
}
fn struct_2_reg_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none {
    struct_8b: struc Struct8Bytes = $(2, $(1, 1))
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    members_front: u64 = ? struct_type[].is_union then (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) else 1
    loop i: u64 = 0 while i < members_front .. ++i {
        if struct_8b.clss[0] == 0 and struct_8b.clss[1] == 0 {
            break
        }
        size: i64 = 1l
        member_type: *struc Type = get_struct_typedef_member(ctx[].frontend, struct_type[].tag, i)[].member_type
        if member_type[].type == 12 {
            loop .. while member_type[].type == 12 {
                member_arr_type: *struc Array = @member_type[].get._Array
                member_type = member_arr_type[].elem_type
                size *= member_arr_type[].size
            }            
        }
        if member_type[].type == 13 {
            size *= ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((member_type[].get._Structure.tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        }
        else {
            size *= gen_type_alignment(ctx[].frontend, member_type)
        }
        if size > 8l {
            if member_type[].type == 13 {
                member_struct_type: *struc Structure = @member_type[].get._Structure
                struct_8b_class(ctx, member_struct_type)
                member_struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
                if member_struct_8b[].size > 1 {
                    if member_struct_8b[].clss[0] == 0 {
                        struct_8b.clss[0] = 0
                    }
                    if member_struct_8b[].clss[1] == 0 {
                        struct_8b.clss[1] = 0
                    }
                }
                elif member_struct_8b[].clss[0] == 0 {
                    struct_8b.clss[0] = 0
                    struct_8b.clss[1] = 0
                }
            }
            elif member_type[].type ~= 8 {
                struct_8b.clss[0] = 0
                struct_8b.clss[1] = 0
            }
        }
        else {
            if member_type[].type == 13 {
                member_struct_type: *struc Structure = @member_type[].get._Structure
                struct_8b_class(ctx, member_struct_type)
                if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == 0 {
                    struct_8b.clss[0] = 0
                }
            }
            elif member_type[].type ~= 8 {
                struct_8b.clss[0] = 0
            }
            if not struct_type[].is_union {
                member_type = get_struct_typedef_back(ctx[].frontend, struct_type[].tag)[].member_type
                loop while member_type[].type == 12 {
                    member_type = member_type[].get._Array.elem_type
                }
                if member_type[].type == 13 {
                    member_struct_type: *struc Structure = @member_type[].get._Structure
                    struct_8b_class(ctx, member_struct_type)
                    if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((member_struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == 0 {
                        struct_8b.clss[1] = 0
                    }
                }
                elif member_type[].type ~= 8 {
                    struct_8b.clss[1] = 0
                }
            }
        }
    }
    loop .. while 0 {
        (ctx[].struct_8b_map) = stbds_hmput_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)
        (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].key = (struct_type[].tag)
        (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].value = (struct_8b)
    }
}
fn struct_8b_class(ctx: *struc AsmGenContext, struct_type: *struc Structure) none {
    if (? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp) == -1 {
        size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        if size > 16l {
            struct_8b: struc Struct8Bytes = $(3, $(2, 2))
            size -= 24l
            loop while size > 0l {
                struct_8b.size += 1
                size -= 8l
            }
            loop .. while 0 {
                (ctx[].struct_8b_map) = stbds_hmput_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)
                (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].key = (struct_type[].tag)
                (ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp].value = (struct_8b)
            }
        }
        elif size > 8l {
            struct_2_reg_8b_class(ctx, struct_type)
        }
        else {
            struct_1_reg_8b_class(ctx, struct_type)
        }
    }
}
fn fun_param_reg_mask(ctx: *struc AsmGenContext, fun_type: *struc FunType, reg_size: u64, sse_size: u64) none {
    if fun_type[].param_reg_mask == (cast<u8>(1u)) << 26 {
        fun_type[].param_reg_mask = 0ul
        loop i: u64 = 0 while i < reg_size .. ++i {
            register_mask_set(@fun_type[].param_reg_mask, ctx[].arg_regs[i], 1)
        }
        loop i: u64 = 0 while i < sse_size .. ++i {
            register_mask_set(@fun_type[].param_reg_mask, ctx[].sse_arg_regs[i], 1)
        }
    }
}
fn ret_1_reg_mask(fun_type: *struc FunType, reg_size: i32) none {
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << 26 {
        fun_type[].ret_reg_mask = 0ul
        register_mask_set(@fun_type[].ret_reg_mask, ? reg_size then 0 else 16, 1)
    }
}
fn ret_2_reg_mask(fun_type: *struc FunType, reg_size: i32, sse_size: i32) none {
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << 26 {
        fun_type[].ret_reg_mask = 0ul
        if reg_size {
            register_mask_set(@fun_type[].ret_reg_mask, 0, 1)
            register_mask_set(@fun_type[].ret_reg_mask, ? sse_size then 16 else 3, 1)
        }
        elif sse_size {
            register_mask_set(@fun_type[].ret_reg_mask, 16, 1)
            register_mask_set(@fun_type[].ret_reg_mask, 17, 1)
        }
    }
}
fn push_instr(ctx: *struc AsmGenContext, instr: *struc AsmInstruction) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].capacity) then (((ctx[].p_instrs[]) = stbds_arrgrowf((ctx[].p_instrs[]), sizeof((ctx[].p_instrs[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length++] = (instr)
        }
        instr = 0
    }
}
fn ret_int_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    src: *struc AsmOperand = gen_op(ctx, node[].val)
    dst: *struc AsmOperand = gen_register(0)
    asm_type_val: *struc AssemblyType = gen_asm_type(ctx, node[].val)
    push_instr(ctx, make_AsmMov(@asm_type_val, @src, @dst))
    ret_1_reg_mask(ctx[].p_fun_type, 1)
}
fn ret_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    src: *struc AsmOperand = gen_op(ctx, node[].val)
    dst: *struc AsmOperand = gen_register(16)
    asm_type_val: *struc AssemblyType = make_BackendDouble()
    push_instr(ctx, make_AsmMov(@asm_type_val, @src, @dst))
    ret_1_reg_mask(ctx[].p_fun_type, 0)
}
fn ret_8b_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    src_name: u64 = name
    dst: *struc AsmOperand = gen_register(arg_reg)
    asm_type_src: *struc AssemblyType = ? struct_type then asm_type_8b(ctx, struct_type, offset) else make_BackendDouble()
    if asm_type_src[].type == 42 {
        size: i64 = offset + 2l
        offset += asm_type_src[].get._ByteArray.size - 1l
        free_AssemblyType(@asm_type_src)
        asm_type_src = make_Byte()
        src_shl: *struc AsmOperand = make_AsmImm(8ul, 1, 0, 0)
        asm_type_shl: *struc AssemblyType = make_QuadWord()
        loop while offset >= size {
            {
                src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
                dst_cp: *struc AsmOperand = 0
                if dst ~= dst_cp {
                    free_AsmOperand(@dst_cp)
                    dst_cp = dst
                    (dst_cp)[]._ref_count++
                }
                ;
                asm_type_src_cp: *struc AssemblyType = 0
                if asm_type_src ~= asm_type_src_cp {
                    free_AssemblyType(@asm_type_src_cp)
                    asm_type_src_cp = asm_type_src
                    (asm_type_src_cp)[]._ref_count++
                }
                ;
                push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst_cp))
            }
            {
                binop: struc AsmBinaryOp = make_AsmBinaryOp(265)
                asm_type_shl_cp: *struc AssemblyType = 0
                if asm_type_shl ~= asm_type_shl_cp {
                    free_AssemblyType(@asm_type_shl_cp)
                    asm_type_shl_cp = asm_type_shl
                    (asm_type_shl_cp)[]._ref_count++
                }
                ;
                src_shl_cp: *struc AsmOperand = 0
                if src_shl ~= src_shl_cp {
                    free_AsmOperand(@src_shl_cp)
                    src_shl_cp = src_shl
                    (src_shl_cp)[]._ref_count++
                }
                ;
                dst_cp: *struc AsmOperand = 0
                if dst ~= dst_cp {
                    free_AsmOperand(@dst_cp)
                    dst_cp = dst
                    (dst_cp)[]._ref_count++
                }
                ;
                push_instr(ctx, make_AsmBinary(@binop, @asm_type_shl_cp, @src_shl_cp, @dst_cp))
            }
            offset--
        }
        {
            src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
            dst_cp: *struc AsmOperand = 0
            if dst ~= dst_cp {
                free_AsmOperand(@dst_cp)
                dst_cp = dst
                (dst_cp)[]._ref_count++
            }
            ;
            asm_type_src_cp: *struc AssemblyType = 0
            if asm_type_src ~= asm_type_src_cp {
                free_AssemblyType(@asm_type_src_cp)
                asm_type_src_cp = asm_type_src
                (asm_type_src_cp)[]._ref_count++
            }
            ;
            push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst_cp))
        }
        {
            binop: struc AsmBinaryOp = make_AsmBinaryOp(265)
            dst_cp: *struc AsmOperand = 0
            if dst ~= dst_cp {
                free_AsmOperand(@dst_cp)
                dst_cp = dst
                (dst_cp)[]._ref_count++
            }
            ;
            push_instr(ctx, make_AsmBinary(@binop, @asm_type_shl, @src_shl, @dst_cp))
        }
        offset--
        {
            src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
            push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
        }
    }
    else {
        src: *struc AsmOperand = 0
        {
            from_offset: i64 = offset
            src = make_AsmPseudoMem(src_name, from_offset)
        }
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
}
fn ret_struct_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    name: u64 = node[].val[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    struct_8b_class(ctx, struct_type)
    struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
    if struct_8b[].clss[0] == 2 {
        {
            src: *struc AsmOperand = gen_memory(15, -8l)
            dst: *struc AsmOperand = gen_register(0)
            asm_type_src: *struc AssemblyType = make_QuadWord()
            push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
            ret_1_reg_mask(ctx[].p_fun_type, 1)
        }
        {
            size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
            offset: i64 = 0l
            loop while size > 0l {
                src: *struc AsmOperand = gen_op(ctx, node[].val)
                ;
                src[].get._AsmPseudoMem.offset = offset
                dst: *struc AsmOperand = gen_memory(0, offset)
                asm_type_src: *struc AssemblyType = 0
                if size >= 8l {
                    asm_type_src = make_QuadWord()
                    size -= 8l
                    offset += 8l
                }
                elif size >= 4l {
                    asm_type_src = make_LongWord()
                    size -= 4l
                    offset += 4l
                }
                else {
                    asm_type_src = make_Byte()
                    size--
                    offset++
                }
                push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
            }
        }
    }
    else {
        reg_size: i32 = 0
        match struct_8b[].clss[0] {
            -> 0 {
                ret_8b_instr(ctx, name, 0l, struct_type, 0)
                reg_size = 1
                break
            }
            -> 1 {
                ret_8b_instr(ctx, name, 0l, 0, 16)
            }
            break
            otherwise {
                panic_sigabrt("abort", 769, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
            }
        }
        if struct_8b[].size == 2 {
            sse_size: i32 = not reg_size
            match struct_8b[].clss[1] {
                -> 0 {
                    ret_8b_instr(ctx, name, 8l, struct_type, ? reg_size then 3 else 0)
                }
                break
                -> 1 {
                    ret_8b_instr(ctx, name, 8l, 0, ? sse_size then 17 else 16)
                    sse_size = 1
                    break
                }
                otherwise {
                    panic_sigabrt("abort", 783, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
                }
            }
            ret_2_reg_mask(ctx[].p_fun_type, reg_size, sse_size)
        }
        else {
            ret_1_reg_mask(ctx[].p_fun_type, reg_size)
        }
    }
}
fn ret_instr(ctx: *struc AsmGenContext, node: *struc TacReturn) none {
    if node[].val {
        if is_value_dbl(ctx, node[].val) {
            ret_dbl_instr(ctx, node)
        }
        elif not is_value_struct(ctx, node[].val) {
            ret_int_instr(ctx, node)
        }
        else {
            ret_struct_instr(ctx, node)
        }
    }
    else {
        ret_2_reg_mask(ctx[].p_fun_type, 0, 0)
    }
    push_instr(ctx, make_AsmRet())
}
fn sign_extend_instr(ctx: *struc AsmGenContext, node: *struc TacSignExtend) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmMovSx(@asm_type_src, @asm_type_dst, @src, @dst))
}
fn truncate_imm_byte_instr(node: *struc AsmImm) none {
    if not node[].is_byte {
        node[].value %= 256ul
    }
}
fn truncate_byte_instr(ctx: *struc AsmGenContext, node: *struc TacTruncate) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_dst: *struc AssemblyType = make_Byte()
    if src[].type == 250 {
        truncate_imm_byte_instr(@src[].get._AsmImm)
    }
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}
fn truncate_imm_long_instr(node: *struc AsmImm) none {
    if node[].is_quad {
        node[].value -= 4294967296ul
    }
}
fn truncate_long_instr(ctx: *struc AsmGenContext, node: *struc TacTruncate) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_dst: *struc AssemblyType = make_LongWord()
    if src[].type == 250 {
        truncate_imm_long_instr(@src[].get._AsmImm)
    }
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}
fn truncate_instr(ctx: *struc AsmGenContext, node: *struc TacTruncate) none {
    if is_value_1b(ctx, node[].dst) {
        truncate_byte_instr(ctx, node)
    }
    else {
        truncate_long_instr(ctx, node)
    }
}
fn zero_extend_instr(ctx: *struc AsmGenContext, node: *struc TacZeroExtend) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmMovZeroExtend(@asm_type_src, @asm_type_dst, @src, @dst))
}
fn dbl_to_char_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToInt) none {
    src_dst: *struc AsmOperand = gen_register(0)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @src_dst_cp))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = make_Byte()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src_dst, @dst))
    }
}
fn dbl_to_long_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToInt) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @dst))
}
fn dbl_to_signed_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToInt) none {
    if is_value_1b(ctx, node[].dst) {
        dbl_to_char_instr(ctx, node)
    }
    else {
        dbl_to_long_instr(ctx, node)
    }
}
fn dbl_to_uchar_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    src_dst: *struc AsmOperand = gen_register(0)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @src_dst_cp))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = make_Byte()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src_dst, @dst))
    }
}
fn dbl_to_uint_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    src_dst: *struc AsmOperand = gen_register(0)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_src, @src, @src_dst_cp))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src_dst, @dst))
    }
}
fn dbl_to_ulong_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    target_out_of_range: u64 = repr_asm_label(ctx, 3)
    target_after: u64 = repr_asm_label(ctx, 2)
    upper_bound_sd: *struc AsmOperand = dbl_static_const_op(ctx, 4890909195324358656ul, 8)
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    dst_out_of_range_sd: *struc AsmOperand = gen_register(17)
    asm_type_sd: *struc AssemblyType = make_BackendDouble()
    asm_type_si: *struc AssemblyType = make_QuadWord()
    {
        src_cp: *struc AsmOperand = 0
        if src ~= src_cp {
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        ;
        upper_bound_sd_cp: *struc AsmOperand = 0
        if upper_bound_sd ~= upper_bound_sd_cp {
            free_AsmOperand(@upper_bound_sd_cp)
            upper_bound_sd_cp = upper_bound_sd
            (upper_bound_sd_cp)[]._ref_count++
        }
        ;
        asm_type_sd_cp: *struc AssemblyType = 0
        if asm_type_sd ~= asm_type_sd_cp {
            free_AssemblyType(@asm_type_sd_cp)
            asm_type_sd_cp = asm_type_sd
            (asm_type_sd_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCmp(@asm_type_sd_cp, @upper_bound_sd_cp, @src_cp))
    }
    {
        cond_code_ae: struc AsmCondCode = make_AsmCondCode(245)
        push_instr(ctx, make_AsmJmpCC(target_out_of_range, @cond_code_ae))
    }
    {
        src_cp: *struc AsmOperand = 0
        if src ~= src_cp {
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        ;
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_si_cp, @src_cp, @dst_cp))
    }
    push_instr(ctx, make_AsmJmp(target_after))
    push_instr(ctx, make_AsmLabel(target_out_of_range))
    {
        dst_out_of_range_sd_cp: *struc AsmOperand = 0
        if dst_out_of_range_sd ~= dst_out_of_range_sd_cp {
            free_AsmOperand(@dst_out_of_range_sd_cp)
            dst_out_of_range_sd_cp = dst_out_of_range_sd
            (dst_out_of_range_sd_cp)[]._ref_count++
        }
        ;
        asm_type_sd_cp: *struc AssemblyType = 0
        if asm_type_sd ~= asm_type_sd_cp {
            free_AssemblyType(@asm_type_sd_cp)
            asm_type_sd_cp = asm_type_sd
            (asm_type_sd_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_sd_cp, @src, @dst_out_of_range_sd_cp))
    }
    {
        binop_out_of_range_sd_sub: struc AsmBinaryOp = make_AsmBinaryOp(259)
        dst_out_of_range_sd_cp: *struc AsmOperand = 0
        if dst_out_of_range_sd ~= dst_out_of_range_sd_cp {
            free_AsmOperand(@dst_out_of_range_sd_cp)
            dst_out_of_range_sd_cp = dst_out_of_range_sd
            (dst_out_of_range_sd_cp)[]._ref_count++
        }
        ;
        push_instr(            ctx, make_AsmBinary(@binop_out_of_range_sd_sub, @asm_type_sd, @upper_bound_sd, @dst_out_of_range_sd_cp))
    }
    {
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCvttsd2si(@asm_type_si_cp, @dst_out_of_range_sd, @dst_cp))
    }
    {
        binop_out_of_range_si_add: struc AsmBinaryOp = make_AsmBinaryOp(258)
        upper_bound_si: *struc AsmOperand = make_AsmImm(9223372036854775808ul, 0, 1, 0)
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_si_add, @asm_type_si, @upper_bound_si, @dst))
    }
    push_instr(ctx, make_AsmLabel(target_after))
}
fn dbl_to_unsigned_instr(ctx: *struc AsmGenContext, node: *struc TacDoubleToUInt) none {
    if is_value_1b(ctx, node[].dst) {
        dbl_to_uchar_instr(ctx, node)
    }
    elif is_value_4b(ctx, node[].dst) {
        dbl_to_uint_instr(ctx, node)
    }
    else {
        dbl_to_ulong_instr(ctx, node)
    }
}
fn char_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacIntToDouble) none {
    src_dst: *struc AsmOperand = gen_register(0)
    asm_type_dst: *struc AssemblyType = make_LongWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = make_Byte()
        asm_type_dst_cp: *struc AssemblyType = 0
        if asm_type_dst ~= asm_type_dst_cp {
            free_AssemblyType(@asm_type_dst_cp)
            asm_type_dst_cp = asm_type_dst
            (asm_type_dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMovSx(@asm_type_src, @asm_type_dst_cp, @src, @src_dst_cp))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_dst, @src_dst, @dst))
    }
}
fn long_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacIntToDouble) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    push_instr(ctx, make_AsmCvtsi2sd(@asm_type_src, @src, @dst))
}
fn signed_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacIntToDouble) none {
    if is_value_1b(ctx, node[].src) {
        char_to_dbl_instr(ctx, node)
    }
    else {
        long_to_dbl_instr(ctx, node)
    }
}
fn uchar_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    src_dst: *struc AsmOperand = gen_register(0)
    asm_type_dst: *struc AssemblyType = make_LongWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = make_Byte()
        asm_type_dst_cp: *struc AssemblyType = 0
        if asm_type_dst ~= asm_type_dst_cp {
            free_AssemblyType(@asm_type_dst_cp)
            asm_type_dst_cp = asm_type_dst
            (asm_type_dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMovZeroExtend(@asm_type_src, @asm_type_dst_cp, @src, @src_dst_cp))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_dst, @src_dst, @dst))
    }
}
fn uint_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    src_dst: *struc AsmOperand = gen_register(0)
    asm_type_dst: *struc AssemblyType = make_QuadWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = make_LongWord()
        asm_type_dst_cp: *struc AssemblyType = 0
        if asm_type_dst ~= asm_type_dst_cp {
            free_AssemblyType(@asm_type_dst_cp)
            asm_type_dst_cp = asm_type_dst
            (asm_type_dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMovZeroExtend(@asm_type_src, @asm_type_dst_cp, @src, @src_dst_cp))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_dst, @src_dst, @dst))
    }
}
fn ulong_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    target_out_of_range: u64 = repr_asm_label(ctx, 5)
    target_after: u64 = repr_asm_label(ctx, 4)
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    dst_out_of_range_si: *struc AsmOperand = gen_register(0)
    dst_out_of_range_si_shr: *struc AsmOperand = gen_register(3)
    asm_type_si: *struc AssemblyType = make_QuadWord()
    {
        lower_bound_si: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        src_cp: *struc AsmOperand = 0
        if src ~= src_cp {
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCmp(@asm_type_si_cp, @lower_bound_si, @src_cp))
    }
    {
        cond_code_l: struc AsmCondCode = make_AsmCondCode(242)
        push_instr(ctx, make_AsmJmpCC(target_out_of_range, @cond_code_l))
    }
    {
        src_cp: *struc AsmOperand = 0
        if src ~= src_cp {
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        ;
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_si_cp, @src_cp, @dst_cp))
    }
    push_instr(ctx, make_AsmJmp(target_after))
    push_instr(ctx, make_AsmLabel(target_out_of_range))
    {
        dst_out_of_range_si_cp: *struc AsmOperand = 0
        if dst_out_of_range_si ~= dst_out_of_range_si_cp {
            free_AsmOperand(@dst_out_of_range_si_cp)
            dst_out_of_range_si_cp = dst_out_of_range_si
            (dst_out_of_range_si_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_si_cp, @src, @dst_out_of_range_si_cp))
    }
    {
        dst_out_of_range_si_cp: *struc AsmOperand = 0
        if dst_out_of_range_si ~= dst_out_of_range_si_cp {
            free_AsmOperand(@dst_out_of_range_si_cp)
            dst_out_of_range_si_cp = dst_out_of_range_si
            (dst_out_of_range_si_cp)[]._ref_count++
        }
        ;
        dst_out_of_range_si_shr_cp: *struc AsmOperand = 0
        if dst_out_of_range_si_shr ~= dst_out_of_range_si_shr_cp {
            free_AsmOperand(@dst_out_of_range_si_shr_cp)
            dst_out_of_range_si_shr_cp = dst_out_of_range_si_shr
            (dst_out_of_range_si_shr_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_si_cp, @dst_out_of_range_si_cp, @dst_out_of_range_si_shr_cp))
    }
    {
        unop_out_of_range_si_shr: struc AsmUnaryOp = make_AsmUnaryOp(271)
        dst_out_of_range_si_shr_cp: *struc AsmOperand = 0
        if dst_out_of_range_si_shr ~= dst_out_of_range_si_shr_cp {
            free_AsmOperand(@dst_out_of_range_si_shr_cp)
            dst_out_of_range_si_shr_cp = dst_out_of_range_si_shr
            (dst_out_of_range_si_shr_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmUnary(@unop_out_of_range_si_shr, @asm_type_si_cp, @dst_out_of_range_si_shr_cp))
    }
    {
        binop_out_of_range_si_and: struc AsmBinaryOp = make_AsmBinaryOp(262)
        set_bit_si: *struc AsmOperand = make_AsmImm(1ul, 1, 0, 0)
        dst_out_of_range_si_cp: *struc AsmOperand = 0
        if dst_out_of_range_si ~= dst_out_of_range_si_cp {
            free_AsmOperand(@dst_out_of_range_si_cp)
            dst_out_of_range_si_cp = dst_out_of_range_si
            (dst_out_of_range_si_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(            ctx, make_AsmBinary(@binop_out_of_range_si_and, @asm_type_si_cp, @set_bit_si, @dst_out_of_range_si_cp))
    }
    {
        binop_out_of_range_si_or: struc AsmBinaryOp = make_AsmBinaryOp(263)
        dst_out_of_range_si_shr_cp: *struc AsmOperand = 0
        if dst_out_of_range_si_shr ~= dst_out_of_range_si_shr_cp {
            free_AsmOperand(@dst_out_of_range_si_shr_cp)
            dst_out_of_range_si_shr_cp = dst_out_of_range_si_shr
            (dst_out_of_range_si_shr_cp)[]._ref_count++
        }
        ;
        asm_type_si_cp: *struc AssemblyType = 0
        if asm_type_si ~= asm_type_si_cp {
            free_AssemblyType(@asm_type_si_cp)
            asm_type_si_cp = asm_type_si
            (asm_type_si_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_si_or, @asm_type_si_cp, @dst_out_of_range_si,             @dst_out_of_range_si_shr_cp))
    }
    {
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCvtsi2sd(@asm_type_si, @dst_out_of_range_si_shr, @dst_cp))
    }
    {
        binop_out_of_range_sq_add: struc AsmBinaryOp = make_AsmBinaryOp(258)
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        asm_type_sq: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmBinary(@binop_out_of_range_sq_add, @asm_type_sq, @dst, @dst_cp))
    }
    push_instr(ctx, make_AsmLabel(target_after))
}
fn unsigned_to_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacUIntToDouble) none {
    if is_value_1b(ctx, node[].src) {
        uchar_to_dbl_instr(ctx, node)
    }
    elif is_value_4b(ctx, node[].src) {
        uint_to_dbl_instr(ctx, node)
    }
    else {
        ulong_to_dbl_instr(ctx, node)
    }
}
fn alloc_stack_instr(ctx: *struc AsmGenContext, byte: i64) none {
    push_instr(ctx, alloc_stack_bytes(byte))
}
fn dealloc_stack_instr(ctx: *struc AsmGenContext, byte: i64) none {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(258)
    asm_type: *struc AssemblyType = make_QuadWord()
    src: *struc AsmOperand = 0
    {
        value: u64 = cast<u64>(byte)
        is_byte: i32 = byte <= 127l and byte >= -128l
        is_quad: i32 = byte > 2147483647l or byte < -2147483648l
        is_neg: i32 = byte < 0l
        src = make_AsmImm(value, is_byte, is_quad, is_neg)
    }
    dst: *struc AsmOperand = gen_register(14)
    push_instr(ctx, make_AsmBinary(@binop, @asm_type, @src, @dst))
}
fn reg_arg_call_instr(ctx: *struc AsmGenContext, node: *struc TacValue, arg_reg: i32) none {
    src: *struc AsmOperand = gen_op(ctx, node)
    dst: *struc AsmOperand = gen_register(arg_reg)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node)
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}
fn stack_arg_call_instr(ctx: *struc AsmGenContext, node: *struc TacValue) none {
    src: *struc AsmOperand = gen_op(ctx, node)
    match src[].type {
        -> 251 {
            -> 250 {
                push_instr(ctx, make_AsmPush(@src))
            }
        }
        return none
        otherwise {
            break
        }
    }
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node)
    match asm_type_src[].type {
        -> 40 {
            -> 41 {
                push_instr(ctx, make_AsmPush(@src))
            }
        }
        free_AssemblyType(@asm_type_src)
        return none
        otherwise {
            break
        }
    }
    dst: *struc AsmOperand = gen_register(0)
    {
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmPush(@dst_cp))
    }
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}
fn reg_8b_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    ret_8b_instr(ctx, name, offset, struct_type, arg_reg)
}
fn quad_stack_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64) none {
    src: *struc AsmOperand = 0
    {
        src_name: u64 = name
        from_offset: i64 = offset
        src = make_AsmPseudoMem(src_name, from_offset)
    }
    push_instr(ctx, make_AsmPush(@src))
}
fn long_stack_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, asm_type: **struc AssemblyType) none {
    src: *struc AsmOperand = 0
    {
        src_name: u64 = name
        from_offset: i64 = offset
        src = make_AsmPseudoMem(src_name, from_offset)
    }
    dst: *struc AsmOperand = gen_register(0)
    {
        dst_cp: *struc AsmOperand = 0
        if dst ~= dst_cp {
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmPush(@dst_cp))
    }
    asm_type_src: *struc AssemblyType = 0
    if asm_type[] ~= asm_type_src {
        free_AssemblyType(@asm_type_src)
        asm_type_src = asm_type[]
        asm_type[] = 0
    }
    ;
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}
fn bytearr_stack_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, bytearr_type: *struc ByteArray) none {
    {
        to_offset: i64 = 0l
        size: i64 = bytearr_type[].size
        byte_instrs: **struc AsmInstruction = 0
        loop while size > 0l {
            byte_instr: *struc AsmInstruction = 0
            {
                src: *struc AsmOperand = make_AsmPseudoMem(name, offset)
                dst: *struc AsmOperand = gen_memory(14, to_offset)
                asm_type_src: *struc AssemblyType = 0
                if size >= 4l {
                    asm_type_src = make_LongWord()
                    size -= 4l
                    offset += 4l
                    to_offset += 4l
                }
                else {
                    asm_type_src = make_Byte()
                    size--
                    offset++
                    to_offset++
                }
                byte_instr = make_AsmMov(@asm_type_src, @src, @dst)
            }
            loop .. while 0 {
                loop .. while 0 {
                    (? (not (byte_instrs) or (cast<*struc stbds_array_header>((byte_instrs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((byte_instrs)) - 1)[].capacity) then (((byte_instrs) = stbds_arrgrowf((byte_instrs), sizeof((byte_instrs)[]), (1), (0))) and 0) else 0)
                    (byte_instrs)[(cast<*struc stbds_array_header>((byte_instrs)) - 1)[].length++] = (byte_instr)
                }
                byte_instr = 0
            }
        }
        loop i: u64 = (? (byte_instrs) then (cast<*struc stbds_array_header>((byte_instrs)) - 1)[].length else 0) while i-- > 0 {
            push_instr(ctx, byte_instrs[i])
            byte_instrs[i] = 0
        }
        if byte_instrs {
            loop .. while 0 {
                cast<none>((? (byte_instrs) then free((cast<*struc stbds_array_header>((byte_instrs)) - 1)) else cast<none>(0)))
                (byte_instrs) = 0
            }
            byte_instrs = 0
        }
        ;
    }
    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(259)
        src: *struc AsmOperand = make_AsmImm(8ul, 1, 0, 0)
        dst: *struc AsmOperand = gen_register(14)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src, @src, @dst))
    }
}
fn stack_8b_arg_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure) none {
    asm_type: *struc AssemblyType = asm_type_8b(ctx, struct_type, offset)
    match asm_type[].type {
        -> 40 {
            quad_stack_arg_call_instr(ctx, name, offset)
        }
        break
        -> 42 {
            bytearr_stack_arg_call_instr(ctx, name, offset, @asm_type[].get._ByteArray)
        }
        break
        otherwise {
            long_stack_arg_call_instr(ctx, name, offset, @asm_type)
        }
        break
    }
    free_AssemblyType(@asm_type)
}
fn arg_call_instr(ctx: *struc AsmGenContext, node: *struc TacFunCall, fun_type: *struc FunType, is_ret_memory: i32) i64 {
    reg_size: u64 = ? is_ret_memory then 1 else 0
    sse_size: u64 = 0
    stack_padding: i64 = 0l
    stack_instrs: **struc AsmInstruction = 0
    p_instrs: ***struc AsmInstruction = ctx[].p_instrs
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        arg: *struc TacValue = node[].args[i]
        if is_value_dbl(ctx, arg) {
            if sse_size < 8 {
                reg_arg_call_instr(ctx, arg, ctx[].sse_arg_regs[sse_size])
                sse_size++
            }
            else {
                ctx[].p_instrs = @stack_instrs
                stack_arg_call_instr(ctx, arg)
                ctx[].p_instrs = p_instrs
                stack_padding++
            }
        }
        elif not is_value_struct(ctx, arg) {
            if reg_size < 6 {
                reg_arg_call_instr(ctx, arg, ctx[].arg_regs[reg_size])
                reg_size++
            }
            else {
                ctx[].p_instrs = @stack_instrs
                stack_arg_call_instr(ctx, arg)
                ctx[].p_instrs = p_instrs
                stack_padding++
            }
        }
        else {
            struct_reg_size: u64 = 7
            struct_sse_size: u64 = 9
            name: u64 = arg[].get._TacVariable.name
            struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
            struct_8b_class(ctx, struct_type)
            struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
            if struct_8b[].clss[0] ~= 2 {
                struct_reg_size = 0
                struct_sse_size = 0
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == 1 {
                        struct_sse_size++
                    }
                    else {
                        struct_reg_size++
                    }
                }
            }
            if struct_reg_size + reg_size <= 6 and struct_sse_size + sse_size <= 8 {
                offset: i64 = 0l
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == 1 {
                        reg_8b_arg_call_instr(ctx, name, offset, 0, ctx[].sse_arg_regs[sse_size])
                        sse_size++
                    }
                    else {
                        reg_8b_arg_call_instr(ctx, name, offset, struct_type, ctx[].arg_regs[reg_size])
                        reg_size++
                    }
                    offset += 8l
                }
            }
            else {
                offset: i64 = 0l
                ctx[].p_instrs = @stack_instrs
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    stack_8b_arg_call_instr(ctx, name, offset, struct_type)
                    offset += 8l
                    stack_padding++
                }
                ctx[].p_instrs = p_instrs
            }
        }
    }
    fun_param_reg_mask(ctx, fun_type, reg_size, sse_size)
    if stack_padding % 2l == 1l {
        alloc_stack_instr(ctx, 8l)
        stack_padding++
    }
    stack_padding *= 8l
    loop i: u64 = (? (stack_instrs) then (cast<*struc stbds_array_header>((stack_instrs)) - 1)[].length else 0) while i-- > 0 {
        push_instr(ctx, stack_instrs[i])
        stack_instrs[i] = 0
    }
    if stack_instrs {
        loop .. while 0 {
            cast<none>((? (stack_instrs) then free((cast<*struc stbds_array_header>((stack_instrs)) - 1)) else cast<none>(0)))
            (stack_instrs) = 0
        }
        stack_instrs = 0
    }
    ;
    return stack_padding
}
fn ret_call_instr(ctx: *struc AsmGenContext, node: *struc TacValue, arg_reg: i32) none {
    src: *struc AsmOperand = gen_register(arg_reg)
    dst: *struc AsmOperand = gen_op(ctx, node)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}
fn ret_8b_call_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    dst_name: u64 = name
    src: *struc AsmOperand = gen_register(arg_reg)
    asm_type_dst: *struc AssemblyType = ? struct_type then asm_type_8b(ctx, struct_type, offset) else make_BackendDouble()
    if asm_type_dst[].type == 42 {
        size: i64 = asm_type_dst[].get._ByteArray.size + offset - 2l
        free_AssemblyType(@asm_type_dst)
        asm_type_dst = make_Byte()
        src_shr2op: *struc AsmOperand = make_AsmImm(8ul, 1, 0, 0)
        asm_type_shr2op: *struc AssemblyType = make_QuadWord()
        loop while offset < size {
            {
                src_cp: *struc AsmOperand = 0
                if src ~= src_cp {
                    free_AsmOperand(@src_cp)
                    src_cp = src
                    (src_cp)[]._ref_count++
                }
                ;
                dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
                asm_type_dst_cp: *struc AssemblyType = 0
                if asm_type_dst ~= asm_type_dst_cp {
                    free_AssemblyType(@asm_type_dst_cp)
                    asm_type_dst_cp = asm_type_dst
                    (asm_type_dst_cp)[]._ref_count++
                }
                ;
                push_instr(ctx, make_AsmMov(@asm_type_dst_cp, @src_cp, @dst))
            }
            {
                binop: struc AsmBinaryOp = make_AsmBinaryOp(266)
                src_shr2op_cp: *struc AsmOperand = 0
                if src_shr2op ~= src_shr2op_cp {
                    free_AsmOperand(@src_shr2op_cp)
                    src_shr2op_cp = src_shr2op
                    (src_shr2op_cp)[]._ref_count++
                }
                ;
                src_cp: *struc AsmOperand = 0
                if src ~= src_cp {
                    free_AsmOperand(@src_cp)
                    src_cp = src
                    (src_cp)[]._ref_count++
                }
                ;
                asm_type_shr2op_cp: *struc AssemblyType = 0
                if asm_type_shr2op ~= asm_type_shr2op_cp {
                    free_AssemblyType(@asm_type_shr2op_cp)
                    asm_type_shr2op_cp = asm_type_shr2op
                    (asm_type_shr2op_cp)[]._ref_count++
                }
                ;
                push_instr(ctx, make_AsmBinary(@binop, @asm_type_shr2op_cp, @src_shr2op_cp, @src_cp))
            }
            offset++
        }
        {
            src_cp: *struc AsmOperand = 0
            if src ~= src_cp {
                free_AsmOperand(@src_cp)
                src_cp = src
                (src_cp)[]._ref_count++
            }
            ;
            dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
            asm_type_dst_cp: *struc AssemblyType = 0
            if asm_type_dst ~= asm_type_dst_cp {
                free_AssemblyType(@asm_type_dst_cp)
                asm_type_dst_cp = asm_type_dst
                (asm_type_dst_cp)[]._ref_count++
            }
            ;
            push_instr(ctx, make_AsmMov(@asm_type_dst_cp, @src_cp, @dst))
        }
        {
            binop: struc AsmBinaryOp = make_AsmBinaryOp(266)
            src_cp: *struc AsmOperand = 0
            if src ~= src_cp {
                free_AsmOperand(@src_cp)
                src_cp = src
                (src_cp)[]._ref_count++
            }
            ;
            push_instr(ctx, make_AsmBinary(@binop, @asm_type_shr2op, @src_shr2op, @src_cp))
        }
        offset++
        {
            dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
    else {
        dst: *struc AsmOperand = 0
        {
            to_offset: i64 = offset
            dst = make_AsmPseudoMem(dst_name, to_offset)
        }
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}
fn call_instr(ctx: *struc AsmGenContext, node: *struc TacFunCall) none {
    is_ret_memory: i32 = 0
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    if node[].dst and is_value_struct(ctx, node[].dst) {
        name: u64 = node[].dst[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        struct_8b_class(ctx, struct_type)
        if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == 2 {
            is_ret_memory = 1
            {
                src: *struc AsmOperand = gen_op(ctx, node[].dst)
                dst: *struc AsmOperand = gen_register(4)
                push_instr(ctx, make_AsmLea(@src, @dst))
            }
        }
    }
    {
        stack_padding: i64 = arg_call_instr(ctx, node, fun_type, is_ret_memory)
        {
            name: u64 = node[].name
            push_instr(ctx, make_AsmCall(name))
        }
        if stack_padding > 0l {
            dealloc_stack_instr(ctx, stack_padding)
        }
    }
    if not node[].dst {
        ret_2_reg_mask(fun_type, 0, 0)
    }
    elif is_ret_memory {
        ret_1_reg_mask(fun_type, 1)
    }
    elif is_value_dbl(ctx, node[].dst) {
        ret_call_instr(ctx, node[].dst, 16)
        ret_1_reg_mask(fun_type, 0)
    }
    elif not is_value_struct(ctx, node[].dst) {
        ret_call_instr(ctx, node[].dst, 0)
        ret_1_reg_mask(fun_type, 1)
    }
    else {
        reg_size: i32 = 0
        name: u64 = node[].dst[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
        match struct_8b[].clss[0] {
            -> 0 {
                ret_8b_call_instr(ctx, name, 0l, struct_type, 0)
                reg_size = 1
                break
            }
            -> 1 {
                ret_8b_call_instr(ctx, name, 0l, 0, 16)
            }
            break
            otherwise {
                panic_sigabrt("abort", 1540, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
            }
        }
        if struct_8b[].size == 2 {
            sse_size: i32 = not reg_size
            match struct_8b[].clss[1] {
                -> 0 {
                    ret_8b_call_instr(ctx, name, 8l, struct_type, ? reg_size then 3 else 0)
                }
                break
                -> 1 {
                    ret_8b_call_instr(ctx, name, 8l, 0, ? sse_size then 17 else 16)
                    sse_size = 1
                    break
                }
                otherwise {
                    panic_sigabrt("abort", 1554, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
                }
            }
            ret_2_reg_mask(fun_type, reg_size, sse_size)
        }
        else {
            ret_1_reg_mask(fun_type, reg_size)
        }
    }
}
fn zero_xmm_reg_instr(ctx: *struc AsmGenContext) none {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(264)
    src: *struc AsmOperand = gen_register(16)
    src_cp: *struc AsmOperand = 0
    if src ~= src_cp {
        free_AsmOperand(@src_cp)
        src_cp = src
        (src_cp)[]._ref_count++
    }
    ;
    asm_type_src: *struc AssemblyType = make_BackendDouble()
    push_instr(ctx, make_AsmBinary(@binop, @asm_type_src, @src, @src_cp))
}
fn unop_int_arithmetic_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    src_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src_cp: *struc AssemblyType = 0
        if asm_type_src ~= asm_type_src_cp {
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @src_dst_cp))
    }
    {
        unop: struc AsmUnaryOp = gen_unop(@node[].unop)
        push_instr(ctx, make_AsmUnary(@unop, @asm_type_src, @src_dst))
    }
}
fn unop_dbl_neg_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    src1_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src1: *struc AssemblyType = make_BackendDouble()
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src)
        src1_dst_cp: *struc AsmOperand = 0
        if src1_dst ~= src1_dst_cp {
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }
    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(264)
        src2: *struc AsmOperand = dbl_static_const_op(ctx, 9223372036854775808ul, 16)
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src1, @src2, @src1_dst))
    }
}
fn unop_neg_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    if is_value_dbl(ctx, node[].src) {
        unop_dbl_neg_instr(ctx, node)
    }
    else {
        unop_int_arithmetic_instr(ctx, node)
    }
}
fn unop_int_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        imm_zero_cp: *struc AsmOperand = 0
        if imm_zero ~= imm_zero_cp {
            free_AsmOperand(@imm_zero_cp)
            imm_zero_cp = imm_zero
            (imm_zero_cp)[]._ref_count++
        }
        ;
        asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
        push_instr(ctx, make_AsmCmp(@asm_type_src, @imm_zero_cp, @src))
    }
    {
        cmp_dst_cp: *struc AsmOperand = 0
        if cmp_dst ~= cmp_dst_cp {
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        ;
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code_e: struc AsmCondCode = make_AsmCondCode(238)
        push_instr(ctx, make_AsmSetCC(@cond_code_e, @cmp_dst))
    }
}
fn unop_dbl_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    target_nan: u64 = repr_asm_label(ctx, 0)
    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    zero_xmm_reg_instr(ctx)
    {
        reg_zero: *struc AsmOperand = gen_register(16)
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        asm_type_src: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmCmp(@asm_type_src, @reg_zero, @src))
    }
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        cmp_dst_cp: *struc AsmOperand = 0
        if cmp_dst ~= cmp_dst_cp {
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        ;
        asm_type_dst: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(248)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        cond_code_e: struc AsmCondCode = make_AsmCondCode(238)
        push_instr(ctx, make_AsmSetCC(@cond_code_e, @cmp_dst))
    }
    push_instr(ctx, make_AsmLabel(target_nan))
}
fn unop_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    if is_value_dbl(ctx, node[].src) {
        unop_dbl_conditional_instr(ctx, node)
    }
    else {
        unop_int_conditional_instr(ctx, node)
    }
}
fn unary_instr(ctx: *struc AsmGenContext, node: *struc TacUnary) none {
    match node[].unop.type {
        -> 148 {
            unop_int_arithmetic_instr(ctx, node)
        }
        break
        -> 149 {
            unop_neg_instr(ctx, node)
        }
        break
        -> 150 {
            unop_conditional_instr(ctx, node)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1688, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn binop_arithmetic_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    src1_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst_cp: *struc AsmOperand = 0
        if src1_dst ~= src1_dst_cp {
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }
    {
        binop: struc AsmBinaryOp = gen_binop(@node[].binop)
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src1, @src2, @src1_dst))
    }
}
fn signed_divide_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    src1_dst: *struc AsmOperand = gen_register(0)
    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst_cp: *struc AsmOperand = 0
        if src1_dst ~= src1_dst_cp {
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }
    {
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCdq(@asm_type_src1_cp))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmIdiv(@asm_type_src1_cp, @src2))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @src1_dst, @dst))
    }
}
fn unsigned_divide_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    src1_dst: *struc AsmOperand = gen_register(0)
    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst_cp: *struc AsmOperand = 0
        if src1_dst ~= src1_dst_cp {
            free_AsmOperand(@src1_dst_cp)
            src1_dst_cp = src1_dst
            (src1_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst_cp))
    }
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        imm_zero_dst: *struc AsmOperand = gen_register(3)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @imm_zero, @imm_zero_dst))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmDiv(@asm_type_src1_cp, @src2))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @src1_dst, @dst))
    }
}
fn binop_divide_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    if is_value_dbl(ctx, node[].src1) {
        binop_arithmetic_instr(ctx, node)
    }
    elif is_value_signed(ctx, node[].src1) {
        signed_divide_instr(ctx, node)
    }
    else {
        unsigned_divide_instr(ctx, node)
    }
}
fn signed_remainder_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst: *struc AsmOperand = gen_register(0)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst))
    }
    {
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmCdq(@asm_type_src1_cp))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmIdiv(@asm_type_src1_cp, @src2))
    }
    {
        dst_src: *struc AsmOperand = gen_register(3)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @dst_src, @dst))
    }
}
fn unsigned_remainder_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    dst_src: *struc AsmOperand = gen_register(3)
    asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src1_dst: *struc AsmOperand = gen_register(0)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @src1, @src1_dst))
    }
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        dst_src_cp: *struc AsmOperand = 0
        if dst_src ~= dst_src_cp {
            free_AsmOperand(@dst_src_cp)
            dst_src_cp = dst_src
            (dst_src_cp)[]._ref_count++
        }
        ;
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src1_cp, @imm_zero, @dst_src_cp))
    }
    {
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1_cp: *struc AssemblyType = 0
        if asm_type_src1 ~= asm_type_src1_cp {
            free_AssemblyType(@asm_type_src1_cp)
            asm_type_src1_cp = asm_type_src1
            (asm_type_src1_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmDiv(@asm_type_src1_cp, @src2))
    }
    {
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_src1, @dst_src, @dst))
    }
}
fn binop_remainder_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    if is_value_signed(ctx, node[].src1) {
        signed_remainder_instr(ctx, node)
    }
    else {
        unsigned_remainder_instr(ctx, node)
    }
}
fn binop_int_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
        push_instr(ctx, make_AsmCmp(@asm_type_src1, @src2, @src1))
    }
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        cmp_dst_cp: *struc AsmOperand = 0
        if cmp_dst ~= cmp_dst_cp {
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        ;
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code: struc AsmCondCode = make_AsmCondCode(237)
        if is_value_signed(ctx, node[].src1) {
            cond_code = gen_signed_cond_code(@node[].binop)
        }
        else {
            cond_code = gen_unsigned_cond_code(@node[].binop)
        }
        push_instr(ctx, make_AsmSetCC(@cond_code, @cmp_dst))
    }
}
fn binop_dbl_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    target_nan: u64 = repr_asm_label(ctx, 0)
    cmp_dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    {
        src1: *struc AsmOperand = gen_op(ctx, node[].src1)
        src2: *struc AsmOperand = gen_op(ctx, node[].src2)
        asm_type_src1: *struc AssemblyType = gen_asm_type(ctx, node[].src1)
        push_instr(ctx, make_AsmCmp(@asm_type_src1, @src2, @src1))
    }
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        cmp_dst_cp: *struc AsmOperand = 0
        if cmp_dst ~= cmp_dst_cp {
            free_AsmOperand(@cmp_dst_cp)
            cmp_dst_cp = cmp_dst
            (cmp_dst_cp)[]._ref_count++
        }
        ;
        asm_type_dst: *struc AssemblyType = make_LongWord()
        push_instr(ctx, make_AsmMov(@asm_type_dst, @imm_zero, @cmp_dst_cp))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(248)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        cond_code: struc AsmCondCode = gen_unsigned_cond_code(@node[].binop)
        if cond_code.type == 239 {
            target_nan_ne: u64 = repr_asm_label(ctx, 0)
            {
                cmp_dst_cp: *struc AsmOperand = 0
                if cmp_dst ~= cmp_dst_cp {
                    free_AsmOperand(@cmp_dst_cp)
                    cmp_dst_cp = cmp_dst
                    (cmp_dst_cp)[]._ref_count++
                }
                ;
                push_instr(ctx, make_AsmSetCC(@cond_code, @cmp_dst_cp))
            }
            push_instr(ctx, make_AsmJmp(target_nan_ne))
            push_instr(ctx, make_AsmLabel(target_nan))
            {
                cond_code_e: struc AsmCondCode = make_AsmCondCode(238)
                push_instr(ctx, make_AsmSetCC(@cond_code_e, @cmp_dst))
            }
            push_instr(ctx, make_AsmLabel(target_nan_ne))
        }
        else {
            push_instr(ctx, make_AsmSetCC(@cond_code, @cmp_dst))
            push_instr(ctx, make_AsmLabel(target_nan))
        }
    }
}
fn binop_conditional_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    if is_value_dbl(ctx, node[].src1) {
        binop_dbl_conditional_instr(ctx, node)
    }
    else {
        binop_int_conditional_instr(ctx, node)
    }
}
fn binary_instr(ctx: *struc AsmGenContext, node: *struc TacBinary) none {
    match node[].binop.type {
        -> 152 {
            -> 153 {
                -> 154 {
                    -> 157 {
                        -> 158 {
                            -> 159 {
                                -> 160 {
                                    -> 161 {
                                        -> 162 {
                                            binop_arithmetic_instr(ctx, node)
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
        -> 155 {
            binop_divide_instr(ctx, node)
        }
        break
        -> 156 {
            binop_remainder_instr(ctx, node)
        }
        break
        -> 163 {
            -> 164 {
                -> 165 {
                    -> 166 {
                        -> 167 {
                            -> 168 {
                                binop_conditional_instr(ctx, node)
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 1954, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn copy_struct_instr(ctx: *struc AsmGenContext, node: *struc TacCopy) none {
    src_name: u64 = node[].src[].get._TacVariable.name
    dst_name: u64 = node[].dst[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    offset: i64 = 0l
    loop while size > 0l {
        src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
        dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
        asm_type_src: *struc AssemblyType = 0
        if size >= 8l {
            asm_type_src = make_QuadWord()
            size -= 8l
            offset += 8l
        }
        elif size >= 4l {
            asm_type_src = make_LongWord()
            size -= 4l
            offset += 4l
        }
        else {
            asm_type_src = make_Byte()
            size--
            offset++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
}
fn copy_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacCopy) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}
fn copy_instr(ctx: *struc AsmGenContext, node: *struc TacCopy) none {
    if is_value_struct(ctx, node[].src) {
        copy_struct_instr(ctx, node)
    }
    else {
        copy_scalar_instr(ctx, node)
    }
}
fn getaddr_instr(ctx: *struc AsmGenContext, node: *struc TacGetAddress) none {
    src: *struc AsmOperand = 0
    {
        if node[].src[].type == 171 {
            name: u64 = node[].src[].get._TacVariable.name
            loop .. while 0 {
                (ctx[].frontend[].addressed_set) = stbds_hmput_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].addressed_set)[].key, 0)
                (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].key = (name)
                (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].value = (0)
            }
            map_it: i64 = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
            if map_it ~= -1             and (ctx[].frontend[].symbol_table[map_it]).value[].attrs[].type == 32 {
                src = make_AsmData(name, 0l)
                jump Lpass
            }
        }
        src = gen_op(ctx, node[].src)
        label Lpass
        ;
    }
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    push_instr(ctx, make_AsmLea(@src, @dst))
}
fn load_struct_instr(ctx: *struc AsmGenContext, node: *struc TacLoad) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        name: u64 = node[].dst[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        offset: i64 = 0l
        loop while size > 0l {
            src: *struc AsmOperand = gen_memory(0, offset)
            dst: *struc AsmOperand = make_AsmPseudoMem(name, offset)
            asm_type_dst: *struc AssemblyType = 0
            if size >= 8l {
                asm_type_dst = make_QuadWord()
                size -= 8l
                offset += 8l
            }
            elif size >= 4l {
                asm_type_dst = make_LongWord()
                size -= 4l
                offset += 4l
            }
            else {
                asm_type_dst = make_Byte()
                size--
                offset++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
}
fn load_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacLoad) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_memory(0, 0l)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}
fn load_instr(ctx: *struc AsmGenContext, node: *struc TacLoad) none {
    if is_value_struct(ctx, node[].dst) {
        load_struct_instr(ctx, node)
    }
    else {
        load_scalar_instr(ctx, node)
    }
}
fn store_struct_instr(ctx: *struc AsmGenContext, node: *struc TacStore) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].dst_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        name: u64 = node[].src[].get._TacVariable.name
        struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
        size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
        offset: i64 = 0l
        loop while size > 0l {
            src: *struc AsmOperand = make_AsmPseudoMem(name, offset)
            dst: *struc AsmOperand = gen_memory(0, offset)
            asm_type_dst: *struc AssemblyType = 0
            if size >= 8l {
                asm_type_dst = make_QuadWord()
                size -= 8l
                offset += 8l
            }
            elif size >= 4l {
                asm_type_dst = make_LongWord()
                size -= 4l
                offset += 4l
            }
            else {
                asm_type_dst = make_Byte()
                size--
                offset++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
}
fn store_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacStore) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].dst_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src)
        dst: *struc AsmOperand = gen_memory(0, 0l)
        asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].src)
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}
fn store_instr(ctx: *struc AsmGenContext, node: *struc TacStore) none {
    if is_value_struct(ctx, node[].src) {
        store_struct_instr(ctx, node)
    }
    else {
        store_scalar_instr(ctx, node)
    }
}
fn const_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src: *struc AssemblyType = make_QuadWord()
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = 0
        {
            constant: *struc CConst = node[].idx[].get._TacConstant.constant
            ;
            src = gen_memory(0, constant[].get._CConstLong.value * node[].scale)
        }
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmLea(@src, @dst))
    }
}
fn scalar_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    asm_type_src: *struc AssemblyType = make_QuadWord()
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src_cp: *struc AssemblyType = 0
        if asm_type_src ~= asm_type_src_cp {
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_op(ctx, node[].idx)
        dst: *struc AsmOperand = gen_register(3)
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_indexed(0, 3, node[].scale)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmLea(@src, @dst))
    }
}
fn aggr_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    asm_type_src: *struc AssemblyType = make_QuadWord()
    src_dst: *struc AsmOperand = gen_register(3)
    {
        src: *struc AsmOperand = gen_op(ctx, node[].src_ptr)
        dst: *struc AsmOperand = gen_register(0)
        asm_type_src_cp: *struc AssemblyType = 0
        if asm_type_src ~= asm_type_src_cp {
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @dst))
    }
    {
        src: *struc AsmOperand = gen_op(ctx, node[].idx)
        src_dst_cp: *struc AsmOperand = 0
        if src_dst ~= src_dst_cp {
            free_AsmOperand(@src_dst_cp)
            src_dst_cp = src_dst
            (src_dst_cp)[]._ref_count++
        }
        ;
        asm_type_src_cp: *struc AssemblyType = 0
        if asm_type_src ~= asm_type_src_cp {
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        ;
        push_instr(ctx, make_AsmMov(@asm_type_src_cp, @src, @src_dst_cp))
    }
    {
        src: *struc AsmOperand = 0
        {
            value: u64 = cast<u64>(node[].scale)
            is_byte: i32 = node[].scale <= 127l and node[].scale >= -128l
            is_quad: i32 = node[].scale > 2147483647l or node[].scale < -2147483648l
            is_neg: i32 = node[].scale < 0l
            src = make_AsmImm(value, is_byte, is_quad, is_neg)
        }
        binop: struc AsmBinaryOp = make_AsmBinaryOp(260)
        push_instr(ctx, make_AsmBinary(@binop, @asm_type_src, @src, @src_dst))
    }
    {
        src: *struc AsmOperand = gen_indexed(0, 3, 1l)
        dst: *struc AsmOperand = gen_op(ctx, node[].dst)
        push_instr(ctx, make_AsmLea(@src, @dst))
    }
}
fn var_idx_add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    match node[].scale {
        -> 1l {
            -> 2l {
                -> 4l {
                    -> 8l {
                        scalar_idx_add_ptr_instr(ctx, node)
                    }
                }
            }
        }
        break
        otherwise {
            aggr_idx_add_ptr_instr(ctx, node)
        }
        break
    }
}
fn add_ptr_instr(ctx: *struc AsmGenContext, node: *struc TacAddPtr) none {
    match node[].idx[].type {
        -> 170 {
            const_idx_add_ptr_instr(ctx, node)
        }
        break
        -> 171 {
            var_idx_add_ptr_instr(ctx, node)
        }
        break
        otherwise {
            panic_sigabrt("abort", 2243, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn cp_to_offset_struct_instr(ctx: *struc AsmGenContext, node: *struc TacCopyToOffset) none {
    src_name: u64 = node[].src[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    offset: i64 = 0l
    loop while size > 0l {
        src: *struc AsmOperand = make_AsmPseudoMem(src_name, offset)
        dst: *struc AsmOperand = 0
        {
            dst_name: u64 = node[].dst_name
            to_offset: i64 = offset + node[].offset
            dst = make_AsmPseudoMem(dst_name, to_offset)
        }
        asm_type_src: *struc AssemblyType = 0
        if size >= 8l {
            asm_type_src = make_QuadWord()
            size -= 8l
            offset += 8l
        }
        elif size >= 4l {
            asm_type_src = make_LongWord()
            size -= 4l
            offset += 4l
        }
        else {
            asm_type_src = make_Byte()
            size--
            offset++
        }
        push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
    }
}
fn cp_to_offset_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacCopyToOffset) none {
    src: *struc AsmOperand = gen_op(ctx, node[].src)
    dst: *struc AsmOperand = 0
    {
        dst_name: u64 = node[].dst_name
        to_offset: i64 = node[].offset
        dst = make_AsmPseudoMem(dst_name, to_offset)
    }
    asm_type_src: *struc AssemblyType = gen_asm_type(ctx, node[].src)
    push_instr(ctx, make_AsmMov(@asm_type_src, @src, @dst))
}
fn cp_to_offset_instr(ctx: *struc AsmGenContext, node: *struc TacCopyToOffset) none {
    if is_value_struct(ctx, node[].src) {
        cp_to_offset_struct_instr(ctx, node)
    }
    else {
        cp_to_offset_scalar_instr(ctx, node)
    }
}
fn cp_from_offset_struct_instr(ctx: *struc AsmGenContext, node: *struc TacCopyFromOffset) none {
    dst_name: u64 = node[].dst[].get._TacVariable.name
    struct_type: *struc Structure = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Structure
    size: i64 = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].frontend[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    offset: i64 = 0l
    loop while size > 0l {
        src: *struc AsmOperand = 0
        {
            src_name: u64 = node[].src_name
            from_offset: i64 = offset + node[].offset
            src = make_AsmPseudoMem(src_name, from_offset)
        }
        dst: *struc AsmOperand = make_AsmPseudoMem(dst_name, offset)
        asm_type_dst: *struc AssemblyType = 0
        if size >= 8l {
            asm_type_dst = make_QuadWord()
            size -= 8l
            offset += 8l
        }
        elif size >= 4l {
            asm_type_dst = make_LongWord()
            size -= 4l
            offset += 4l
        }
        else {
            asm_type_dst = make_Byte()
            size--
            offset++
        }
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}
fn cp_from_offset_scalar_instr(ctx: *struc AsmGenContext, node: *struc TacCopyFromOffset) none {
    src: *struc AsmOperand = 0
    {
        src_name: u64 = node[].src_name
        from_offset: i64 = node[].offset
        src = make_AsmPseudoMem(src_name, from_offset)
    }
    dst: *struc AsmOperand = gen_op(ctx, node[].dst)
    asm_type_dst: *struc AssemblyType = gen_asm_type(ctx, node[].dst)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}
fn cp_from_offset_instr(ctx: *struc AsmGenContext, node: *struc TacCopyFromOffset) none {
    if is_value_struct(ctx, node[].dst) {
        cp_from_offset_struct_instr(ctx, node)
    }
    else {
        cp_from_offset_scalar_instr(ctx, node)
    }
}
fn jump_instr(ctx: *struc AsmGenContext, node: *struc TacJump) none {
    target: u64 = node[].target
    push_instr(ctx, make_AsmJmp(target))
}
fn jmp_eq_0_int_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfZero) none {
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        asm_type_cond: *struc AssemblyType = gen_asm_type(ctx, node[].condition)
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @imm_zero, @condition))
    }
    {
        target: u64 = node[].target
        cond_code_e: struc AsmCondCode = make_AsmCondCode(238)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_e))
    }
}
fn jmp_eq_0_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfZero) none {
    target_nan: u64 = repr_asm_label(ctx, 0)
    zero_xmm_reg_instr(ctx)
    {
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        reg_zero: *struc AsmOperand = gen_register(16)
        asm_type_cond: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @condition, @reg_zero))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(248)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        target: u64 = node[].target
        cond_code_e: struc AsmCondCode = make_AsmCondCode(238)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_e))
    }
    push_instr(ctx, make_AsmLabel(target_nan))
}
fn jmp_eq_0_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfZero) none {
    if is_value_dbl(ctx, node[].condition) {
        jmp_eq_0_dbl_instr(ctx, node)
    }
    else {
        jmp_eq_0_int_instr(ctx, node)
    }
}
fn jmp_ne_0_int_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfNotZero) none {
    {
        imm_zero: *struc AsmOperand = make_AsmImm(0ul, 1, 0, 0)
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        asm_type_cond: *struc AssemblyType = gen_asm_type(ctx, node[].condition)
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @imm_zero, @condition))
    }
    {
        target: u64 = node[].target
        cond_code_ne: struc AsmCondCode = make_AsmCondCode(239)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_ne))
    }
}
fn jmp_ne_0_dbl_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfNotZero) none {
    target: u64 = node[].target
    target_nan: u64 = repr_asm_label(ctx, 0)
    target_nan_ne: u64 = repr_asm_label(ctx, 0)
    zero_xmm_reg_instr(ctx)
    {
        condition: *struc AsmOperand = gen_op(ctx, node[].condition)
        reg_zero: *struc AsmOperand = gen_register(16)
        asm_type_cond: *struc AssemblyType = make_BackendDouble()
        push_instr(ctx, make_AsmCmp(@asm_type_cond, @condition, @reg_zero))
    }
    {
        cond_code_p: struc AsmCondCode = make_AsmCondCode(248)
        push_instr(ctx, make_AsmJmpCC(target_nan, @cond_code_p))
    }
    {
        cond_code_ne: struc AsmCondCode = make_AsmCondCode(239)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_ne))
    }
    push_instr(ctx, make_AsmJmp(target_nan_ne))
    push_instr(ctx, make_AsmLabel(target_nan))
    {
        cond_code_e: struc AsmCondCode = make_AsmCondCode(238)
        push_instr(ctx, make_AsmJmpCC(target, @cond_code_e))
    }
    push_instr(ctx, make_AsmLabel(target_nan_ne))
}
fn jmp_ne_0_instr(ctx: *struc AsmGenContext, node: *struc TacJumpIfNotZero) none {
    if is_value_dbl(ctx, node[].condition) {
        jmp_ne_0_dbl_instr(ctx, node)
    }
    else {
        jmp_ne_0_int_instr(ctx, node)
    }
}
fn label_instr(ctx: *struc AsmGenContext, node: *struc TacLabel) none {
    name: u64 = node[].name
    push_instr(ctx, make_AsmLabel(name))
}
fn gen_instr(ctx: *struc AsmGenContext, node: *struc TacInstruction) none {
    match node[].type {
        -> 177 {
            ret_instr(ctx, @node[].get._TacReturn)
        }
        break
        -> 178 {
            sign_extend_instr(ctx, @node[].get._TacSignExtend)
        }
        break
        -> 179 {
            truncate_instr(ctx, @node[].get._TacTruncate)
        }
        break
        -> 180 {
            zero_extend_instr(ctx, @node[].get._TacZeroExtend)
        }
        break
        -> 181 {
            dbl_to_signed_instr(ctx, @node[].get._TacDoubleToInt)
        }
        break
        -> 182 {
            dbl_to_unsigned_instr(ctx, @node[].get._TacDoubleToUInt)
        }
        break
        -> 183 {
            signed_to_dbl_instr(ctx, @node[].get._TacIntToDouble)
        }
        break
        -> 184 {
            unsigned_to_dbl_instr(ctx, @node[].get._TacUIntToDouble)
        }
        break
        -> 185 {
            call_instr(ctx, @node[].get._TacFunCall)
        }
        break
        -> 186 {
            unary_instr(ctx, @node[].get._TacUnary)
        }
        break
        -> 187 {
            binary_instr(ctx, @node[].get._TacBinary)
        }
        break
        -> 188 {
            copy_instr(ctx, @node[].get._TacCopy)
        }
        break
        -> 189 {
            getaddr_instr(ctx, @node[].get._TacGetAddress)
        }
        break
        -> 190 {
            load_instr(ctx, @node[].get._TacLoad)
        }
        break
        -> 191 {
            store_instr(ctx, @node[].get._TacStore)
        }
        break
        -> 192 {
            add_ptr_instr(ctx, @node[].get._TacAddPtr)
        }
        break
        -> 193 {
            cp_to_offset_instr(ctx, @node[].get._TacCopyToOffset)
        }
        break
        -> 194 {
            cp_from_offset_instr(ctx, @node[].get._TacCopyFromOffset)
        }
        break
        -> 195 {
            jump_instr(ctx, @node[].get._TacJump)
        }
        break
        -> 196 {
            jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero)
        }
        break
        -> 197 {
            jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero)
        }
        break
        -> 198 {
            label_instr(ctx, @node[].get._TacLabel)
        }
        break
        otherwise {
            panic_sigabrt("abort", 2529, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn gen_instr_list(ctx: *struc AsmGenContext, node_list: **struc TacInstruction) none {
    loop i: u64 = 0 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        if node_list[i] {
            gen_instr(ctx, node_list[i])
        }
    }
}
fn reg_fun_param_instr(ctx: *struc AsmGenContext, name: u64, arg_reg: i32) none {
    src: *struc AsmOperand = gen_register(arg_reg)
    dst: *struc AsmOperand = 0
    {
        dst_name: u64 = name
        dst = make_AsmPseudo(dst_name)
    }
    asm_type_dst: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, name)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}
fn stack_fun_param_instr(ctx: *struc AsmGenContext, name: u64, stack_bytes: i64) none {
    src: *struc AsmOperand = gen_memory(15, stack_bytes)
    dst: *struc AsmOperand = 0
    {
        dst_name: u64 = name
        dst = make_AsmPseudo(dst_name)
    }
    asm_type_dst: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, name)
    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
}
fn reg_8b_fun_param_instr(ctx: *struc AsmGenContext, name: u64, offset: i64, struct_type: *struc Structure, arg_reg: i32) none {
    ret_8b_call_instr(ctx, name, offset, struct_type, arg_reg)
}
fn stack_8b_fun_param_instr(ctx: *struc AsmGenContext, name: u64, stack_bytes: i64, offset: i64, struct_type: *struc Structure) none {
    asm_type_dst: *struc AssemblyType = asm_type_8b(ctx, struct_type, offset)
    if asm_type_dst[].type == 42 {
        size: i64 = asm_type_dst[].get._ByteArray.size
        free_AssemblyType(@asm_type_dst)
        loop while size > 0l {
            src: *struc AsmOperand = gen_memory(15, stack_bytes)
            dst: *struc AsmOperand = make_AsmPseudoMem(name, offset)
            if size >= 4l {
                asm_type_dst = make_LongWord()
                size -= 4l
                offset += 4l
                stack_bytes += 4l
            }
            else {
                asm_type_dst = make_Byte()
                size--
                offset++
                stack_bytes++
            }
            push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
        }
    }
    else {
        src: *struc AsmOperand = gen_memory(15, stack_bytes)
        dst: *struc AsmOperand = 0
        {
            dst_name: u64 = name
            to_offset: i64 = offset
            dst = make_AsmPseudoMem(dst_name, to_offset)
        }
        push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
    }
}
fn fun_param_toplvl(ctx: *struc AsmGenContext, node: *struc TacFunction, fun_type: *struc FunType, is_ret_memory: i32) none {
    reg_size: u64 = ? is_ret_memory then 1 else 0
    sse_size: u64 = 0
    stack_bytes: i64 = 16l
    loop i: u64 = 0 while i < (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) .. ++i {
        param: u64 = node[].params[i]
        param_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((param))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
        if param_type[].type == 8 {
            if sse_size < 8 {
                reg_fun_param_instr(ctx, param, ctx[].sse_arg_regs[sse_size])
                sse_size++
            }
            else {
                stack_fun_param_instr(ctx, param, stack_bytes)
                stack_bytes += 8l
            }
        }
        elif param_type[].type ~= 13 {
            if reg_size < 6 {
                reg_fun_param_instr(ctx, param, ctx[].arg_regs[reg_size])
                reg_size++
            }
            else {
                stack_fun_param_instr(ctx, param, stack_bytes)
                stack_bytes += 8l
            }
        }
        else {
            struct_reg_size: u64 = 7
            struct_sse_size: u64 = 9
            struct_type: *struc Structure = @param_type[].get._Structure
            struct_8b_class(ctx, struct_type)
            struct_8b: *struc Struct8Bytes = @((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value)
            if struct_8b[].clss[0] ~= 2 {
                struct_reg_size = 0
                struct_sse_size = 0
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == 1 {
                        struct_sse_size++
                    }
                    else {
                        struct_reg_size++
                    }
                }
            }
            if struct_reg_size + reg_size <= 6 and struct_sse_size + sse_size <= 8 {
                offset: i64 = 0l
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    if struct_8b[].clss[j] == 1 {
                        reg_8b_fun_param_instr(ctx, param, offset, 0, ctx[].sse_arg_regs[sse_size])
                        sse_size++
                    }
                    else {
                        reg_8b_fun_param_instr(ctx, param, offset, struct_type, ctx[].arg_regs[reg_size])
                        reg_size++
                    }
                    offset += 8l
                }
            }
            else {
                offset: i64 = 0l
                loop j: u64 = 0 while j < struct_8b[].size .. ++j {
                    stack_8b_fun_param_instr(ctx, param, stack_bytes, offset, struct_type)
                    stack_bytes += 8l
                    offset += 8l
                }
            }
        }
    }
    fun_param_reg_mask(ctx, fun_type, reg_size, sse_size)
}
fn gen_fun_toplvl(ctx: *struc AsmGenContext, node: *struc TacFunction) *struc AsmTopLevel {
    name: u64 = node[].name
    is_glob: i32 = node[].is_glob
    is_ret_memory: i32 = 0
    body: **struc AsmInstruction = 0
    (((body) = stbds_arrgrowf((body), sizeof((body)[]), (0), ((? (node[].body) then (cast<*struc stbds_array_header>((node[].body)) - 1)[].length else 0)))))
    {
        ctx[].p_instrs = @body
        fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
        if fun_type[].ret_type[].type == 13 {
            struct_type: *struc Structure = @fun_type[].ret_type[].get._Structure
            struct_8b_class(ctx, struct_type)
            if ((? ((? ((ctx[].struct_8b_map) = stbds_hmget_key((ctx[].struct_8b_map), sizeof((ctx[].struct_8b_map)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_8b_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_8b_map)[(cast<*struc stbds_array_header>(((ctx[].struct_8b_map) - 1)) - 1)[].temp])[].value).clss[0] == 2 {
                is_ret_memory = 1
                {
                    src: *struc AsmOperand = gen_register(4)
                    dst: *struc AsmOperand = gen_memory(15, -8l)
                    asm_type_dst: *struc AssemblyType = make_QuadWord()
                    push_instr(ctx, make_AsmMov(@asm_type_dst, @src, @dst))
                }
            }
        }
        fun_param_toplvl(ctx, node, fun_type, is_ret_memory)
        ctx[].p_fun_type = fun_type
        gen_instr_list(ctx, node[].body)
        ctx[].p_fun_type = 0
        ctx[].p_instrs = 0
    }
    return make_AsmFunction(name, is_glob, is_ret_memory, @body)
}
fn gen_static_var_toplvl(ctx: *struc AsmGenContext, node: *struc TacStaticVariable) *struc AsmTopLevel {
    name: u64 = node[].name
    is_glob: i32 = node[].is_glob
    alignment: i32 = gen_type_alignment(ctx[].frontend, node[].static_init_type)
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
    return make_AsmStaticVariable(name, alignment, is_glob, @static_inits)
}
fn push_static_const_toplvl(ctx: *struc AsmGenContext, static_const_toplvls: *struc AsmTopLevel) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_static_consts[]) or (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].capacity) then (((ctx[].p_static_consts[]) = stbds_arrgrowf((ctx[].p_static_consts[]), sizeof((ctx[].p_static_consts[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_static_consts[])[(cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length++] = (static_const_toplvls)
        }
        static_const_toplvls = 0
    }
}
fn dbl_static_const_toplvl(ctx: *struc AsmGenContext, identifier: u64, dbl_const: u64, byte: i32) none {
    name: u64 = identifier
    alignment: i32 = byte
    static_init: *struc StaticInit = make_DoubleInit(dbl_const)
    push_static_const_toplvl(ctx, make_AsmStaticConstant(name, alignment, @static_init))
}
fn gen_static_const_toplvl(ctx: *struc AsmGenContext, node: *struc TacStaticConstant) *struc AsmTopLevel {
    name: u64 = node[].name
    alignment: i32 = gen_type_alignment(ctx[].frontend, node[].static_init_type)
    static_init: *struc StaticInit = 0
    if node[].static_init ~= static_init {
        free_StaticInit(@static_init)
        static_init = node[].static_init
        (static_init)[]._ref_count++
    }
    ;
    return make_AsmStaticConstant(name, alignment, @static_init)
}
fn gen_toplvl(ctx: *struc AsmGenContext, node: *struc TacTopLevel) *struc AsmTopLevel {
    match node[].type {
        -> 200 {
            return gen_fun_toplvl(ctx, @node[].get._TacFunction)
        }
        -> 201 {
            return gen_static_var_toplvl(ctx, @node[].get._TacStaticVariable)
        }
        -> 202 {
            return gen_static_const_toplvl(ctx, @node[].get._TacStaticConstant)
        }
        otherwise {
            panic_sigabrt("abort", 2762, "/home/romain/proj/planet/selfhost/wheelcc/backend/asm_gen.c")
        }
    }
}
fn gen_program(ctx: *struc AsmGenContext, node: *struc TacProgram) *struc AsmProgram {
    static_const_toplvls: **struc AsmTopLevel = 0
    (((static_const_toplvls) = stbds_arrgrowf((static_const_toplvls), sizeof((static_const_toplvls)[]), (0), ((? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        static_const_toplvl: *struc AsmTopLevel = gen_toplvl(ctx, node[].static_const_toplvls[i])
        loop .. while 0 {
            loop .. while 0 {
                (? (not (static_const_toplvls) or (cast<*struc stbds_array_header>((static_const_toplvls)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_const_toplvls)) - 1)[].capacity) then (((static_const_toplvls) = stbds_arrgrowf((static_const_toplvls), sizeof((static_const_toplvls)[]), (1), (0))) and 0) else 0)
                (static_const_toplvls)[(cast<*struc stbds_array_header>((static_const_toplvls)) - 1)[].length++] = (static_const_toplvl)
            }
            static_const_toplvl = 0
        }
    }
    top_levels: **struc AsmTopLevel = 0
    (((top_levels) = stbds_arrgrowf((top_levels), sizeof((top_levels)[]), (0), ((? (node[].static_var_toplvls) then (cast<*struc stbds_array_header>((node[].static_var_toplvls)) - 1)[].length else 0) + (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0)))))
    {
        ctx[].p_static_consts = @static_const_toplvls
        loop i: u64 = 0 while i < (? (node[].static_var_toplvls) then (cast<*struc stbds_array_header>((node[].static_var_toplvls)) - 1)[].length else 0) .. ++i {
            static_var_toplvl: *struc AsmTopLevel = gen_toplvl(ctx, node[].static_var_toplvls[i])
            loop .. while 0 {
                loop .. while 0 {
                    (? (not (top_levels) or (cast<*struc stbds_array_header>((top_levels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((top_levels)) - 1)[].capacity) then (((top_levels) = stbds_arrgrowf((top_levels), sizeof((top_levels)[]), (1), (0))) and 0) else 0)
                    (top_levels)[(cast<*struc stbds_array_header>((top_levels)) - 1)[].length++] = (static_var_toplvl)
                }
                static_var_toplvl = 0
            }
        }
        loop i: u64 = 0 while i < (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0) .. ++i {
            fun_toplvl: *struc AsmTopLevel = gen_toplvl(ctx, node[].fun_toplvls[i])
            loop .. while 0 {
                loop .. while 0 {
                    (? (not (top_levels) or (cast<*struc stbds_array_header>((top_levels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((top_levels)) - 1)[].capacity) then (((top_levels) = stbds_arrgrowf((top_levels), sizeof((top_levels)[]), (1), (0))) and 0) else 0)
                    (top_levels)[(cast<*struc stbds_array_header>((top_levels)) - 1)[].length++] = (fun_toplvl)
                }
                fun_toplvl = 0
            }
        }
        ctx[].p_static_consts = 0
    }
    return make_AsmProgram(@static_const_toplvls, @top_levels)
}
pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram {
    ctx: struc AsmGenContext;
    {
        ctx.frontend = frontend
        ctx.identifiers = identifiers
        ctx.arg_regs[0] = 4
        ctx.arg_regs[1] = 5
        ctx.arg_regs[2] = 3
        ctx.arg_regs[3] = 2
        ctx.arg_regs[4] = 6
        ctx.arg_regs[5] = 7
        ctx.sse_arg_regs[0] = 16
        ctx.sse_arg_regs[1] = 17
        ctx.sse_arg_regs[2] = 18
        ctx.sse_arg_regs[3] = 19
        ctx.sse_arg_regs[4] = 20
        ctx.sse_arg_regs[5] = 21
        ctx.sse_arg_regs[6] = 22
        ctx.sse_arg_regs[7] = 23
        ctx.dbl_const_table = 0
        ctx.struct_8b_map = 0
    }
    asm_ast: *struc AsmProgram = gen_program(@ctx, tac_ast[])
    free_TacProgram(tac_ast)
    ;
    if ctx.dbl_const_table {
        loop .. while 0 {
            cast<none>((? (ctx.dbl_const_table) ~= 0 then stbds_hmfree_func((ctx.dbl_const_table) - 1, sizeof((ctx.dbl_const_table)[])) else cast<none>(0)))
            (ctx.dbl_const_table) = 0
        }
        ctx.dbl_const_table = 0
    }
    ;
    if ctx.struct_8b_map {
        loop .. while 0 {
            cast<none>((? (ctx.struct_8b_map) ~= 0 then stbds_hmfree_func((ctx.struct_8b_map) - 1, sizeof((ctx.struct_8b_map)[])) else cast<none>(0)))
            (ctx.struct_8b_map) = 0
        }
        ctx.struct_8b_map = 0
    }
    ;
    return asm_ast
}
