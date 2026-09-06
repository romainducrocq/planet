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
type struc SymtCvtContext(    backend: *struc BackEndContext    , frontend: *struc FrontEndContext    , symbol: u64    )
fn get_scalar_alignment(type: *struc Type) i32 {
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
            panic_sigabrt("abort", 41, "/home/romain/proj/planet/selfhost/wheelcc/backend/symt_cvt.c")
        }
    }
}
fn get_arr_alignment(ctx: *struc FrontEndContext, arr_type: *struc Array, size: *i64) i32 {
    size[] = arr_type[].size
    loop while arr_type[].elem_type[].type == 12 {
        arr_type = @arr_type[].elem_type[].get._Array
        size[] *= arr_type[].size
    }
    alignment: i32 = gen_type_alignment(ctx, arr_type[].elem_type)
    if arr_type[].elem_type[].type == 13 {
        struct_type: *struc Structure = @arr_type[].elem_type[].get._Structure
        size[] *= ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    }
    else {
        size[] *= alignment
    }
    if size[] >= 16l {
        alignment = 16
    }
    return alignment
}
fn get_struct_alignment(ctx: *struc FrontEndContext, struct_type: *struc Structure) i32 {
    return ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].alignment
}
pub fn gen_type_alignment(ctx: *struc FrontEndContext, type: *struc Type) i32 {
    match type[].type {
        -> 12 {
            size: i64;
            return get_arr_alignment(ctx, @type[].get._Array, @size)
        }
        -> 13 {
            return get_struct_alignment(ctx, @type[].get._Structure)
        }
        otherwise {
            return get_scalar_alignment(type)
        }
    }
}
fn arr_asm_type(ctx: *struc FrontEndContext, arr_type: *struc Array) *struc AssemblyType {
    size: i64;
    alignment: i32 = get_arr_alignment(ctx, arr_type, @size)
    return make_ByteArray(size, alignment)
}
fn struct_asm_type(ctx: *struc FrontEndContext, struct_type: *struc Structure) *struc AssemblyType {
    size: i64;
    alignment: i32;
    map_it: i64 = (? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag))), sizeof(ctx[].struct_typedef_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        struct_typedef: *struc StructTypedef = (ctx[].struct_typedef_table[map_it]).value
        size = struct_typedef[].size
        alignment = struct_typedef[].alignment
    }
    else {
        size = -1l
        alignment = -1
    }
    return make_ByteArray(size, alignment)
}
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType {
    symbol_type: *struc Type = ((? ((? ((ctx[].symbol_table) = stbds_hmget_key((ctx[].symbol_table), sizeof((ctx[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    match symbol_type[].type {
        -> 1 {
            -> 2 {
                -> 3 {
                    return make_Byte()
                }
            }
        }
        -> 4 {
            -> 6 {
                return make_LongWord()
            }
        }
        -> 5 {
            -> 7 {
                -> 11 {
                    return make_QuadWord()
                }
            }
        }
        -> 8 {
            return make_BackendDouble()
        }
        -> 12 {
            return arr_asm_type(ctx, @symbol_type[].get._Array)
        }
        -> 13 {
            return struct_asm_type(ctx, @symbol_type[].get._Structure)
        }
        otherwise {
            panic_sigabrt("abort", 125, "/home/romain/proj/planet/selfhost/wheelcc/backend/symt_cvt.c")
        }
    }
}
fn cvt_backend_symbol(ctx: *struc SymtCvtContext, node: *struc BackendSymbol) none {
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].backend[].symbol_table) = stbds_hmput_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((ctx[].symbol))), sizeof(ctx[].backend[].symbol_table)[].key, 0)
            (ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp].key = (ctx[].symbol)
            (ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp].value = (node)
        }
        node = 0
    }
}
fn dbl_static_const(ctx: *struc SymtCvtContext) none {
    asm_type: *struc AssemblyType = make_BackendDouble()
    cvt_backend_symbol(ctx, make_BackendObj(1, 1, @asm_type))
}
fn string_static_const(ctx: *struc SymtCvtContext, arr_type: *struc Array) none {
    asm_type: *struc AssemblyType = arr_asm_type(ctx[].frontend, arr_type)
    cvt_backend_symbol(ctx, make_BackendObj(1, 1, @asm_type))
}
fn cvt_static_const_toplvl(ctx: *struc SymtCvtContext, node: *struc AsmStaticConstant) none {
    ctx[].symbol = node[].name
    match node[].static_init[].type {
        -> 21 {
            dbl_static_const(ctx)
        }
        break
        -> 23 {
            string_static_const(ctx, @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Array)
        }
        break
        otherwise {
            panic_sigabrt("abort", 153, "/home/romain/proj/planet/selfhost/wheelcc/backend/symt_cvt.c")
        }
    }
}
fn cvt_toplvl(ctx: *struc SymtCvtContext, node: *struc AsmTopLevel) none {
    if node[].type == 296 {
        cvt_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
    }
    else {
        panic_sigabrt("abort", 162, "/home/romain/proj/planet/selfhost/wheelcc/backend/symt_cvt.c")
    }
}
fn cvt_fun_type(ctx: *struc SymtCvtContext, node: *struc FunAttr, fun_type: *struc FunType) none {
    if fun_type[].param_reg_mask == (cast<u8>(1u)) << 26 {
        ;
        fun_type[].param_reg_mask = 0ul
    }
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << 26 {
        fun_type[].ret_reg_mask = 0ul
    }
    is_def: i32 = node[].is_def
    cvt_backend_symbol(ctx, make_BackendFun(is_def))
}
fn cvt_obj_type(ctx: *struc SymtCvtContext, node: *struc IdentifierAttr) none {
    if node[].type ~= 32 {
        asm_type: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, ctx[].symbol)
        is_static: i32 = node[].type == 31
        cvt_backend_symbol(ctx, make_BackendObj(is_static, 0, @asm_type))
    }
}
fn cvt_program(ctx: *struc SymtCvtContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (ctx[].frontend[].symbol_table) then (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        symbol: *struc PairTIdentifierUPtrSymbol = @ctx[].frontend[].symbol_table[i]
        ctx[].symbol = (symbol[]).key
        if (symbol[]).value[].type_t[].type == 10 {
            cvt_fun_type(ctx, @(symbol[]).value[].attrs[].get._FunAttr, @(symbol[]).value[].type_t[].get._FunType)
        }
        else {
            cvt_obj_type(ctx, (symbol[]).value[].attrs)
        }
    }
    loop i: u64 = 0 while i < (? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        cvt_toplvl(ctx, node[].static_const_toplvls[i])
    }
}
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none {
    ctx: struc SymtCvtContext;
    {
        ctx.backend = backend
        ctx.frontend = frontend
    }
    cvt_program(@ctx, node)
}
