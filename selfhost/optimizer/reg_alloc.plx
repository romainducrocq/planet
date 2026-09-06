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

type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none;

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
type struc AsmReg;
type struc AsmOperand;
pub fn gen_register(reg_kind: i32) *struc AsmOperand;
pub fn gen_memory(reg_kind: i32, value: i64) *struc AsmOperand;
pub fn gen_indexed(reg_kind_base: i32, reg_kind_idx: i32, scale: i64) *struc AsmOperand;
pub fn register_mask_kind(node: *struc AsmReg) i32;
pub fn register_mask_bit(reg_kind: i32) u64;
pub fn register_mask_get(reg_mask: u64, reg_kind: i32) i32;
pub fn register_mask_set(reg_mask: *u64, reg_kind: i32, value: i32) none;
type struc ControlFlowGraph;
type struc DataFlowAnalysis;
type struc DataFlowAnalysisO2;
type struc InferenceRegister(    color: i32    , reg_kind: i32    , degree: u64    , spill_cost: u64    , linked_hard_mask: u64    , linked_pseudo_names: *u64    )
type struc PairTIdentifierStInferenceRegister(key: u64, value: struc InferenceRegister)
type struc InferenceGraph(    k: u64    , offset: u64    , hard_reg_mask: u64    , unpruned_hard_mask_bits: *u64    , unpruned_pseudo_names: *u64    , pseudo_reg_map: *struc PairTIdentifierStInferenceRegister    )
type struc RegAllocContext(    backend: *struc BackEndContext    , frontend: *struc FrontEndContext    , callee_saved_reg_mask: u64    , p_backend_fun: *struc BackendFun    , p_infer_graph: *struc InferenceGraph    , reg_color_map: [26]i32    , hard_regs: [26]struc InferenceRegister    , cfg: *struc ControlFlowGraph    , dfa: *struc DataFlowAnalysis    , dfa_o2: *struc DataFlowAnalysisO2    , infer_graph: *struc InferenceGraph    , sse_infer_graph: *struc InferenceGraph    , p_instrs: ***struc AsmInstruction    , is_with_coal: i32    )
fn free_InferenceGraph(self: **struc InferenceGraph) none {
    if not self[] {
        return none
    }
    ;
    if (self[])[].unpruned_hard_mask_bits {
        loop .. while 0 {
            cast<none>((? ((self[])[].unpruned_hard_mask_bits) then free((cast<*struc stbds_array_header>(((self[])[].unpruned_hard_mask_bits)) - 1)) else cast<none>(0)))
            ((self[])[].unpruned_hard_mask_bits) = 0
        }
        (self[])[].unpruned_hard_mask_bits = 0
    }
    ;
    if (self[])[].unpruned_pseudo_names {
        loop .. while 0 {
            cast<none>((? ((self[])[].unpruned_pseudo_names) then free((cast<*struc stbds_array_header>(((self[])[].unpruned_pseudo_names)) - 1)) else cast<none>(0)))
            ((self[])[].unpruned_pseudo_names) = 0
        }
        (self[])[].unpruned_pseudo_names = 0
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].pseudo_reg_map) then (cast<*struc stbds_array_header>((((self[])[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if ((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? (((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names) then free((cast<*struc stbds_array_header>((((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names)) - 1)) else cast<none>(0)))
                (((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names) = 0
            }
            ((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names = 0
        }
        ;
    }
    if (self[])[].pseudo_reg_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].pseudo_reg_map) ~= 0 then stbds_hmfree_func(((self[])[].pseudo_reg_map) - 1, sizeof(((self[])[].pseudo_reg_map)[])) else cast<none>(0)))
            ((self[])[].pseudo_reg_map) = 0
        }
        (self[])[].pseudo_reg_map = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
fn make_InferenceGraph(is_sse: i32) *struc InferenceGraph {
    self: *struc InferenceGraph = 0
    loop .. while 0 {
        free_InferenceGraph(@self)
        self = cast<*struc InferenceGraph>(malloc(sizeof<struc InferenceGraph>))
        if not self {
            panic_sigabrt("alloc " "InferenceGraph", 73, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
        }
    }
    self[].hard_reg_mask = 0ul
    self[].unpruned_hard_mask_bits = 0
    self[].unpruned_pseudo_names = 0
    self[].pseudo_reg_map = 0
    if is_sse {
        self[].k = 14
        self[].offset = 12
        register_mask_set(@self[].hard_reg_mask, 16, 1)
        register_mask_set(@self[].hard_reg_mask, 17, 1)
        register_mask_set(@self[].hard_reg_mask, 18, 1)
        register_mask_set(@self[].hard_reg_mask, 19, 1)
        register_mask_set(@self[].hard_reg_mask, 20, 1)
        register_mask_set(@self[].hard_reg_mask, 21, 1)
        register_mask_set(@self[].hard_reg_mask, 22, 1)
        register_mask_set(@self[].hard_reg_mask, 23, 1)
        register_mask_set(@self[].hard_reg_mask, 24, 1)
        register_mask_set(@self[].hard_reg_mask, 25, 1)
        register_mask_set(@self[].hard_reg_mask, 26, 1)
        register_mask_set(@self[].hard_reg_mask, 27, 1)
        register_mask_set(@self[].hard_reg_mask, 28, 1)
        register_mask_set(@self[].hard_reg_mask, 29, 1)
    }
    else {
        self[].k = 12
        self[].offset = 0
        register_mask_set(@self[].hard_reg_mask, 0, 1)
        register_mask_set(@self[].hard_reg_mask, 1, 1)
        register_mask_set(@self[].hard_reg_mask, 2, 1)
        register_mask_set(@self[].hard_reg_mask, 3, 1)
        register_mask_set(@self[].hard_reg_mask, 4, 1)
        register_mask_set(@self[].hard_reg_mask, 5, 1)
        register_mask_set(@self[].hard_reg_mask, 6, 1)
        register_mask_set(@self[].hard_reg_mask, 7, 1)
        register_mask_set(@self[].hard_reg_mask, 10, 1)
        register_mask_set(@self[].hard_reg_mask, 11, 1)
        register_mask_set(@self[].hard_reg_mask, 12, 1)
        register_mask_set(@self[].hard_reg_mask, 13, 1)
    }
    return self
}
type struc ControlFlowBlock(    size: u64    , instrs_front_idx: u64    , instrs_back_idx: u64    , pred_ids: *u64    , succ_ids: *u64    )
type struc ControlFlowGraph(    entry_id: u64    , exit_id: u64    , entry_succ_ids: *u64    , exit_pred_ids: *u64    , reaching_code: *i32    , blocks: *struc ControlFlowBlock    , identifier_id_map: *struc PairTIdentifierulong_t    )
type struc DataFlowAnalysis(    set_size: u64    , mask_size: u64    , incoming_idx: u64    , static_idx: u64    , open_data_map: *u64    , instr_idx_map: *u64    , blocks_mask_sets: *u64    , instrs_mask_sets: *u64    )
type struc DataFlowAnalysisO2(    data_name_map: *u64    )
fn free_ControlFlowGraph(self: **struc ControlFlowGraph) none {
    if not self[] {
        return none
    }
    ;
    if (self[])[].entry_succ_ids {
        loop .. while 0 {
            cast<none>((? ((self[])[].entry_succ_ids) then free((cast<*struc stbds_array_header>(((self[])[].entry_succ_ids)) - 1)) else cast<none>(0)))
            ((self[])[].entry_succ_ids) = 0
        }
        (self[])[].entry_succ_ids = 0
    }
    ;
    if (self[])[].exit_pred_ids {
        loop .. while 0 {
            cast<none>((? ((self[])[].exit_pred_ids) then free((cast<*struc stbds_array_header>(((self[])[].exit_pred_ids)) - 1)) else cast<none>(0)))
            ((self[])[].exit_pred_ids) = 0
        }
        (self[])[].exit_pred_ids = 0
    }
    ;
    if (self[])[].reaching_code {
        loop .. while 0 {
            cast<none>((? ((self[])[].reaching_code) then free((cast<*struc stbds_array_header>(((self[])[].reaching_code)) - 1)) else cast<none>(0)))
            ((self[])[].reaching_code) = 0
        }
        (self[])[].reaching_code = 0
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].blocks) then (cast<*struc stbds_array_header>(((self[])[].blocks)) - 1)[].length else 0) .. ++i {
        if (self[])[].blocks[i].pred_ids {
            loop .. while 0 {
                cast<none>((? ((self[])[].blocks[i].pred_ids) then free((cast<*struc stbds_array_header>(((self[])[].blocks[i].pred_ids)) - 1)) else cast<none>(0)))
                ((self[])[].blocks[i].pred_ids) = 0
            }
            (self[])[].blocks[i].pred_ids = 0
        }
        ;
        if (self[])[].blocks[i].succ_ids {
            loop .. while 0 {
                cast<none>((? ((self[])[].blocks[i].succ_ids) then free((cast<*struc stbds_array_header>(((self[])[].blocks[i].succ_ids)) - 1)) else cast<none>(0)))
                ((self[])[].blocks[i].succ_ids) = 0
            }
            (self[])[].blocks[i].succ_ids = 0
        }
        ;
    }
    if (self[])[].blocks {
        loop .. while 0 {
            cast<none>((? ((self[])[].blocks) then free((cast<*struc stbds_array_header>(((self[])[].blocks)) - 1)) else cast<none>(0)))
            ((self[])[].blocks) = 0
        }
        (self[])[].blocks = 0
    }
    ;
    if (self[])[].identifier_id_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].identifier_id_map) ~= 0 then stbds_hmfree_func(((self[])[].identifier_id_map) - 1, sizeof(((self[])[].identifier_id_map)[])) else cast<none>(0)))
            ((self[])[].identifier_id_map) = 0
        }
        (self[])[].identifier_id_map = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
fn make_ControlFlowGraph(none) *struc ControlFlowGraph {
    self: *struc ControlFlowGraph = 0
    loop .. while 0 {
        free_ControlFlowGraph(@self)
        self = cast<*struc ControlFlowGraph>(malloc(sizeof<struc ControlFlowGraph>))
        if not self {
            panic_sigabrt("alloc " "ControlFlowGraph", 83, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
        }
    }
    self[].entry_id = 0
    self[].exit_id = 0
    self[].entry_succ_ids = 0
    self[].exit_pred_ids = 0
    self[].reaching_code = 0
    self[].blocks = 0
    self[].identifier_id_map = 0
    return self
}
fn free_DataFlowAnalysis(self: **struc DataFlowAnalysis) none {
    if not self[] {
        return none
    }
    ;
    if (self[])[].open_data_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].open_data_map) then free((cast<*struc stbds_array_header>(((self[])[].open_data_map)) - 1)) else cast<none>(0)))
            ((self[])[].open_data_map) = 0
        }
        (self[])[].open_data_map = 0
    }
    ;
    if (self[])[].instr_idx_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].instr_idx_map) then free((cast<*struc stbds_array_header>(((self[])[].instr_idx_map)) - 1)) else cast<none>(0)))
            ((self[])[].instr_idx_map) = 0
        }
        (self[])[].instr_idx_map = 0
    }
    ;
    if (self[])[].blocks_mask_sets {
        loop .. while 0 {
            cast<none>((? ((self[])[].blocks_mask_sets) then free((cast<*struc stbds_array_header>(((self[])[].blocks_mask_sets)) - 1)) else cast<none>(0)))
            ((self[])[].blocks_mask_sets) = 0
        }
        (self[])[].blocks_mask_sets = 0
    }
    ;
    if (self[])[].instrs_mask_sets {
        loop .. while 0 {
            cast<none>((? ((self[])[].instrs_mask_sets) then free((cast<*struc stbds_array_header>(((self[])[].instrs_mask_sets)) - 1)) else cast<none>(0)))
            ((self[])[].instrs_mask_sets) = 0
        }
        (self[])[].instrs_mask_sets = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
fn make_DataFlowAnalysis(none) *struc DataFlowAnalysis {
    self: *struc DataFlowAnalysis = 0
    loop .. while 0 {
        free_DataFlowAnalysis(@self)
        self = cast<*struc DataFlowAnalysis>(malloc(sizeof<struc DataFlowAnalysis>))
        if not self {
            panic_sigabrt("alloc " "DataFlowAnalysis", 105, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
        }
    }
    self[].set_size = 0
    self[].mask_size = 0
    self[].incoming_idx = 0
    self[].static_idx = 0
    self[].open_data_map = 0
    self[].instr_idx_map = 0
    self[].blocks_mask_sets = 0
    self[].instrs_mask_sets = 0
    return self
}
fn free_DataFlowAnalysisO2(self: **struc DataFlowAnalysisO2) none {
    if not self[] {
        return none
    }
    ;
    if (self[])[].data_name_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].data_name_map) then free((cast<*struc stbds_array_header>(((self[])[].data_name_map)) - 1)) else cast<none>(0)))
            ((self[])[].data_name_map) = 0
        }
        (self[])[].data_name_map = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
fn make_DataFlowAnalysisO2(none) *struc DataFlowAnalysisO2 {
    self: *struc DataFlowAnalysisO2 = 0
    loop .. while 0 {
        free_DataFlowAnalysisO2(@self)
        self = cast<*struc DataFlowAnalysisO2>(malloc(sizeof<struc DataFlowAnalysisO2>))
        if not self {
            panic_sigabrt("alloc " "DataFlowAnalysisO2", 145, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
        }
    }
    self[].data_name_map = 0
    return self
}
fn set_instr(ctx: *struc RegAllocContext, instr: *struc AsmInstruction, instr_idx: u64) none {
    if instr {
        if instr ~= (ctx[].p_instrs[])[instr_idx] {
            free_AsmInstruction(@(ctx[].p_instrs[])[instr_idx])
            (ctx[].p_instrs[])[instr_idx] = instr
            instr = 0
        }
        ;
    }
    else {
        free_AsmInstruction(@(ctx[].p_instrs[])[instr_idx])
    }
}
fn find_size_t(xs: *u64, x: u64) i32 {
    loop i: u64 = 0 while i < (? (xs) then (cast<*struc stbds_array_header>((xs)) - 1)[].length else 0) .. ++i {
        if xs[i] == x {
            return 1
        }
    }
    return 0
}
fn cfg_add_edge(succ_ids: **u64, pred_ids: **u64, succ_id: u64, pred_id: u64) none {
    if not find_size_t(succ_ids[], succ_id) {
        loop .. while 0 {
            (? (not (succ_ids[]) or (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].capacity) then (((succ_ids[]) = stbds_arrgrowf((succ_ids[]), sizeof((succ_ids[])[]), (1), (0))) and 0) else 0)
            (succ_ids[])[(cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length++] = (succ_id)
        }
    }
    if not find_size_t(pred_ids[], pred_id) {
        loop .. while 0 {
            (? (not (pred_ids[]) or (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].capacity) then (((pred_ids[]) = stbds_arrgrowf((pred_ids[]), sizeof((pred_ids[])[]), (1), (0))) and 0) else 0)
            (pred_ids[])[(cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length++] = (pred_id)
        }
    }
}
fn cfg_add_succ_edge(ctx: *struc RegAllocContext, block_id: u64, succ_id: u64) none {
    if succ_id < ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].blocks[succ_id].pred_ids, succ_id, block_id)
    }
    elif succ_id == ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].exit_pred_ids, succ_id, block_id)
    }
    else {
        panic_sigabrt("abort", 194, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
    }
}
fn cfg_add_pred_edge(ctx: *struc RegAllocContext, block_id: u64, pred_id: u64) none {
    if pred_id < ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[pred_id].succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id)
    }
    elif pred_id == ctx[].cfg[].entry_id {
        cfg_add_edge(@ctx[].cfg[].entry_succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id)
    }
    else {
        panic_sigabrt("abort", 206, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
    }
}
fn cfg_rm_edge(succ_ids: **u64, pred_ids: **u64, succ_id: u64, pred_id: u64, is_reachable: i32) none {
    if is_reachable {
        loop i: u64 = (? (succ_ids[]) then (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length else 0) while i-- > 0 {
            if (succ_ids[])[i] == succ_id {
                loop .. while 0 {
                    (succ_ids[])[i] = ((succ_ids[])[(cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length - 1])
                    (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length -= 1
                }
                break
            }
        }
    }
    loop i: u64 = (? (pred_ids[]) then (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length else 0) while i-- > 0 {
        if (pred_ids[])[i] == pred_id {
            loop .. while 0 {
                (pred_ids[])[i] = ((pred_ids[])[(cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length - 1])
                (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length -= 1
            }
            break
        }
    }
}
fn cfg_rm_succ_edge(ctx: *struc RegAllocContext, block_id: u64, succ_id: u64, is_reachable: i32) none {
    if succ_id < ctx[].cfg[].exit_id {
        cfg_rm_edge(            @ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].blocks[succ_id].pred_ids, succ_id, block_id, is_reachable)
    }
    elif succ_id == ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].exit_pred_ids, succ_id, block_id, is_reachable)
    }
    else {
        panic_sigabrt("abort", 237, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
    }
}
fn cfg_rm_pred_edge(ctx: *struc RegAllocContext, block_id: u64, pred_id: u64) none {
    if pred_id < ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[pred_id].succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id, 1)
    }
    elif pred_id == ctx[].cfg[].entry_id {
        cfg_rm_edge(@ctx[].cfg[].entry_succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id, 1)
    }
    else {
        panic_sigabrt("abort", 249, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
    }
}
fn cfg_rm_empty_block(ctx: *struc RegAllocContext, block_id: u64, is_reachable: i32) none {
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
        succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[i]
        if is_reachable {
            loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++j {
                pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[j]
                if pred_id == ctx[].cfg[].entry_id {
                    cfg_add_pred_edge(ctx, succ_id, pred_id)
                }
                else {
                    cfg_add_succ_edge(ctx, pred_id, succ_id)
                }
            }
        }
        cfg_rm_succ_edge(ctx, block_id, succ_id, is_reachable)
    }
    if is_reachable {
        loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++i {
            pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[i]
            cfg_rm_pred_edge(ctx, block_id, pred_id)
        }
    }
    ctx[].cfg[].blocks[block_id].instrs_front_idx = ctx[].cfg[].exit_id
    ctx[].cfg[].blocks[block_id].instrs_back_idx = ctx[].cfg[].exit_id
}
fn cfg_rm_block_instr(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) none {
    if (ctx[].p_instrs[])[instr_idx] {
        set_instr(ctx, 0, instr_idx)
        ctx[].cfg[].blocks[block_id].size--
        if ctx[].cfg[].blocks[block_id].size == 0 {
            cfg_rm_empty_block(ctx, block_id, 1)
        }
        elif instr_idx == ctx[].cfg[].blocks[block_id].instrs_front_idx {
            loop  while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    ctx[].cfg[].blocks[block_id].instrs_front_idx = instr_idx
                    break
                }
            }
        }
        elif instr_idx == ctx[].cfg[].blocks[block_id].instrs_back_idx {
            instr_idx++
            loop  while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    ctx[].cfg[].blocks[block_id].instrs_back_idx = instr_idx
                    break
                }
            }
        }
    }
}
fn cfg_init_label_block(ctx: *struc RegAllocContext, node: *struc AsmLabel) none {
    loop .. while 0 {
        (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)
        (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (node[].name)
        (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1)
    }
}
fn cfg_init_block(ctx: *struc RegAllocContext, instr_idx: u64, instrs_back_idx: *u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].type {
        -> 288        {
            if instrs_back_idx[] ~= (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instrs_back_idx[]
                block: struc ControlFlowBlock = $(0, instr_idx, 0, 0, 0)
                loop .. while 0 {
                    (? (not (ctx[].cfg[].blocks) or (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].capacity) then (((ctx[].cfg[].blocks) = stbds_arrgrowf((ctx[].cfg[].blocks), sizeof((ctx[].cfg[].blocks)[]), (1), (0))) and 0) else 0)
                    (ctx[].cfg[].blocks)[(cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length++] = (block)
                }
            }
            cfg_init_label_block(ctx, @node[].get._AsmLabel)
            instrs_back_idx[] = instr_idx
            break
        }
        -> 285 {
            -> 286 {
                -> 292                {
                    (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instr_idx
                    instrs_back_idx[] = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
                    break
                }
            }
        }
        otherwise {
            instrs_back_idx[] = instr_idx
            break
        }
    }
}
fn cfg_init_jmp_edges(ctx: *struc RegAllocContext, node: *struc AsmJmp, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
}
fn cfg_init_jmp_cc_edges(ctx: *struc RegAllocContext, node: *struc AsmJmpCC, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}
fn cfg_init_edges(ctx: *struc RegAllocContext, block_id: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].type {
        -> 292 {
            cfg_add_succ_edge(ctx, block_id, ctx[].cfg[].exit_id)
        }
        break
        -> 285 {
            cfg_init_jmp_edges(ctx, @node[].get._AsmJmp, block_id)
        }
        break
        -> 286 {
            cfg_init_jmp_cc_edges(ctx, @node[].get._AsmJmpCC, block_id)
        }
        break
        otherwise {
            cfg_add_succ_edge(ctx, block_id, block_id + 1)
        }
        break
    }
}
fn init_control_flow_graph(ctx: *struc RegAllocContext) none {
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].pred_ids {
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].blocks[block_id].pred_ids) then free((cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)) else cast<none>(0)))
                (ctx[].cfg[].blocks[block_id].pred_ids) = 0
            }
            ctx[].cfg[].blocks[block_id].pred_ids = 0
        }
        ;
        if ctx[].cfg[].blocks[block_id].succ_ids {
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].blocks[block_id].succ_ids) then free((cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)) else cast<none>(0)))
                (ctx[].cfg[].blocks[block_id].succ_ids) = 0
            }
            ctx[].cfg[].blocks[block_id].succ_ids = 0
        }
        ;
    }
    if ctx[].cfg[].blocks {
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length = 0
    }
    ;
    if ctx[].cfg[].identifier_id_map {
        loop .. while 0 {
            cast<none>((? (ctx[].cfg[].identifier_id_map) ~= 0 then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
            (ctx[].cfg[].identifier_id_map) = 0
        }
        ctx[].cfg[].identifier_id_map = 0
    }
    ;
    {
        instrs_back_idx: u64 = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
        loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] {
                if instrs_back_idx == (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                    block: struc ControlFlowBlock = $(0, instr_idx, 0, 0, 0)
                    loop .. while 0 {
                        (? (not (ctx[].cfg[].blocks) or (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].capacity) then (((ctx[].cfg[].blocks) = stbds_arrgrowf((ctx[].cfg[].blocks), sizeof((ctx[].cfg[].blocks)[]), (1), (0))) and 0) else 0)
                        (ctx[].cfg[].blocks)[(cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length++] = (block)
                    }
                }
                cfg_init_block(ctx, instr_idx, @instrs_back_idx)
                (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].size++
            }
        }
        if instrs_back_idx ~= (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
            (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instrs_back_idx
        }
    }
    ctx[].cfg[].exit_id = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    ctx[].cfg[].entry_id = ctx[].cfg[].exit_id + 1
    if ctx[].cfg[].entry_succ_ids {
        (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length = 0
    }
    ;
    if ctx[].cfg[].exit_pred_ids {
        (cast<*struc stbds_array_header>((ctx[].cfg[].exit_pred_ids)) - 1)[].length = 0
    }
    ;
    if not ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) == 0) {
        cfg_add_pred_edge(ctx, 0, ctx[].cfg[].entry_id)
        loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
            cfg_init_edges(ctx, block_id)
        }
    }
}
fn mask_get(mask: u64, bit: u64) i32 {
    if bit > 63 {
        bit %= 64
    }
    return (mask & ((cast<u64>(1ul)) << bit)) > 0
}
fn mask_set(mask: *u64, bit: u64, value: i32) none {
    if bit > 63 {
        bit %= 64
    }
    if value {
        mask[] |= (cast<u64>(1ul)) << bit
    }
    else {
        mask[] &= ~((cast<u64>(1ul)) << bit)
    }
}
fn is_transfer_instr(ctx: *struc RegAllocContext, instr_idx: u64) i32 {
    match (ctx[].p_instrs[])[instr_idx][].type {
        -> 273 {
            -> 274 {
                -> 275 {
                    -> 276 {
                        -> 277 {
                            -> 278 {
                                -> 279 {
                                    -> 280 {
                                        -> 281 {
                                            -> 282 {
                                                -> 283 {
                                                    -> 284 {
                                                        -> 287 {
                                                            -> 289 {
                                                                -> 291 {
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
                    }
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn infer_transfer_live_regs(ctx: *struc RegAllocContext, instr_idx: u64, next_instr_idx: u64) none;
fn dfa_backward_transfer_block(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) u64 {
    if instr_idx > 0 {
        loop next_instr_idx: u64 = instr_idx while next_instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
            if (ctx[].p_instrs[])[next_instr_idx]             and is_transfer_instr(ctx, next_instr_idx                ) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
                infer_transfer_live_regs                (ctx, instr_idx, next_instr_idx)
                instr_idx = next_instr_idx
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
    infer_transfer_live_regs    (ctx, instr_idx, ctx[].dfa[].incoming_idx)
    return instr_idx
}
fn dfa_after_meet_block(ctx: *struc RegAllocContext, block_id: u64) i32 {
    is_fixed_point: i32 = 1
    {
        i: u64 = 0
        loop  while i < ctx[].dfa[].mask_size .. ++i {
            if ctx[].dfa[].blocks_mask_sets[(block_id) * ctx[].dfa[].mask_size + (i)] ~= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] {
                is_fixed_point = 0
                break
            }
        }
        loop  while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].blocks_mask_sets[(block_id) * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)]
        }
    }
    return is_fixed_point
}
fn dfa_backward_meet_block(ctx: *struc RegAllocContext, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1
    loop while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
        if (ctx[].p_instrs[])[instr_idx]         and is_transfer_instr(ctx, instr_idx            ) {
            jump Lelse
        }
    }
    instr_idx = ctx[].dfa[].incoming_idx
    label Lelse
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
        succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[i]
        if succ_id < ctx[].cfg[].exit_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] |= ctx[].dfa[].blocks_mask_sets[(succ_id) * ctx[].dfa[].mask_size + (j)]
            }
        }
        elif succ_id == ctx[].cfg[].exit_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (j)]
            }
            break
        }
        else {
            panic_sigabrt("abort", 754, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/impl_olvl.h")
        }
    }
    if instr_idx < ctx[].dfa[].incoming_idx {
        dfa_backward_transfer_block(ctx, instr_idx, block_id)
    }
    else {
        ;
    }
    return dfa_after_meet_block(ctx, block_id)
}
fn dfa_iter_alg(ctx: *struc RegAllocContext) none {
    open_data_map_size: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    loop i: u64 = 0 while i < open_data_map_size .. ++i {
        block_id: u64 = ctx[].dfa[].open_data_map[i]
        if block_id == ctx[].cfg[].exit_id {
            continue
        }
        is_fixed_point: i32 = dfa_backward_meet_block(ctx, block_id)
        if not is_fixed_point {
            loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++j {
                pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[j]
                if pred_id < ctx[].cfg[].exit_id {
                    loop k: u64 = i + 1 while k < open_data_map_size .. ++k {
                        if pred_id == ctx[].dfa[].open_data_map[k] {
                            jump Lelse
                        }
                    }
                    if open_data_map_size < (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) {
                        ctx[].dfa[].open_data_map[open_data_map_size] = pred_id
                    }
                    else {
                        loop .. while 0 {
                            (? (not (ctx[].dfa[].open_data_map) or (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity) then (((ctx[].dfa[].open_data_map) = stbds_arrgrowf((ctx[].dfa[].open_data_map), sizeof((ctx[].dfa[].open_data_map)[]), (1), (0))) and 0) else 0)
                            (ctx[].dfa[].open_data_map)[(cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length++] = (pred_id)
                        }
                    }
                    open_data_map_size++
                    label Lelse
                    ;
                }
                else {
                    ;
                }
            }
        }
    }
}
fn dfa_backward_open_block(ctx: *struc RegAllocContext, block_id: u64, i: *u64) none;
fn dfa_backward_succ_open_block(ctx: *struc RegAllocContext, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
        dfa_backward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}
fn dfa_backward_open_block(ctx: *struc RegAllocContext, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = 1
        dfa_backward_succ_open_block(ctx, block_id, i)
        ctx[].dfa[].open_data_map[i[]] = block_id
        (i[])++
    }
}
fn is_aliased_name(ctx: *struc RegAllocContext, name: u64) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].type == 31     or (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].addressed_set)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1
}
fn infer_add_data_name(ctx: *struc RegAllocContext, name: u64) none {
    if not is_aliased_name(ctx, name) and (? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (name)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = (26 + ctx[].dfa[].set_size)
        }
        ctx[].dfa[].set_size++
    }
}
fn infer_add_data_op(ctx: *struc RegAllocContext, node: *struc AsmOperand) none {
    if node[].type == 252 {
        infer_add_data_name(ctx, node[].get._AsmPseudo.name)
    }
}
fn init_data_flow_analysis(ctx: *struc RegAllocContext, fun_name: u64) i32 
{
    ctx[].dfa[].set_size = 0
    ctx[].dfa[].incoming_idx = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
    if (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            (? (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].dfa[].open_data_map)) = stbds_arrgrowf(((ctx[].dfa[].open_data_map)), sizeof(((ctx[].dfa[].open_data_map))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
            ?             (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
        }
    }
    {
        i: u64;
        i = 2
        if (? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].length else 0) < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i {
            loop .. while 0 {
                (? (? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)) then ((((ctx[].dfa[].instr_idx_map)) = stbds_arrgrowf(((ctx[].dfa[].instr_idx_map)), sizeof(((ctx[].dfa[].instr_idx_map))[]), (0), (cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)))))) and 0 else 0)
                ?                 (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].length = cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)) else 0
            }
        }
    }
    if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
            ?             (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
        }
    }
    memset(ctx[].cfg[].reaching_code, 0, sizeof<i32> * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))
    instrs_mask_sets_size: u64 = 0
    if ctx[].cfg[].identifier_id_map {
        loop .. while 0 {
            cast<none>((? (ctx[].cfg[].identifier_id_map) ~= 0 then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
            (ctx[].cfg[].identifier_id_map) = 0
        }
        ctx[].cfg[].identifier_id_map = 0
    }
    ;
    ctx[].dfa[].static_idx = ctx[].dfa[].incoming_idx + 1
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while             instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
                    match node[].type {
                        -> 273 {
                            p_node: *struc AsmMov = @node[].get._AsmMov
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 274 {
                            p_node: *struc AsmMovSx = @node[].get._AsmMovSx
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 275 {
                            p_node: *struc AsmMovZeroExtend = @node[].get._AsmMovZeroExtend
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 276 {
                            p_node: *struc AsmLea = @node[].get._AsmLea
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 277 {
                            p_node: *struc AsmCvttsd2si = @node[].get._AsmCvttsd2si
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 278 {
                            p_node: *struc AsmCvtsi2sd = @node[].get._AsmCvtsi2sd
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 279 {
                            infer_add_data_op(ctx, node[].get._AsmUnary.dst)
                        }
                        break
                        -> 280 {
                            p_node: *struc AsmBinary = @node[].get._AsmBinary
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 281 {
                            p_node: *struc AsmCmp = @node[].get._AsmCmp
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> 282 {
                            infer_add_data_op(ctx, node[].get._AsmIdiv.src)
                        }
                        break
                        -> 283 {
                            infer_add_data_op(ctx, node[].get._AsmDiv.src)
                        }
                        break
                        -> 287 {
                            infer_add_data_op(ctx, node[].get._AsmSetCC.dst)
                        }
                        break
                        -> 289 {
                            infer_add_data_op(ctx, node[].get._AsmPush.src)
                        }
                        break
                        -> 284 {
                            -> 291 {
                                break
                            }
                        }
                        otherwise {
                            jump Lcontinue
                        }
                    }
                    ctx[].dfa[].instr_idx_map[instr_idx] = instrs_mask_sets_size
                    instrs_mask_sets_size++
                    label Lcontinue
                    ;
                }
            }
        }
        else {
            ctx[].cfg[].reaching_code[block_id] = 1
        }
    }
    if ctx[].dfa[].set_size == 0 {
        return 0
    }
    if (? (ctx[].dfa_o2[].data_name_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o2[].data_name_map)) - 1)[].length else 0) < ctx[].dfa[].set_size {
        loop .. while 0 {
            (? (? (ctx[].dfa_o2[].data_name_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o2[].data_name_map)) - 1)[].capacity else 0) < cast<u64>((ctx[].dfa[].set_size)) then ((((ctx[].dfa_o2[].data_name_map)) = stbds_arrgrowf(((ctx[].dfa_o2[].data_name_map)), sizeof(((ctx[].dfa_o2[].data_name_map))[]), (0), (cast<u64>((ctx[].dfa[].set_size)))))) and 0 else 0)
            ?             (ctx[].dfa_o2[].data_name_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o2[].data_name_map)) - 1)[].length = cast<u64>((ctx[].dfa[].set_size)) else 0
        }
    }
    ctx[].dfa[].set_size += 26
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
    ctx[].dfa[].mask_size = (ctx[].dfa[].set_size + 63) / 64
    instrs_mask_sets_size *= ctx[].dfa[].mask_size
    blocks_mask_sets_size: u64 = ctx[].dfa[].mask_size * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    if (? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].length else 0) < blocks_mask_sets_size {
        loop .. while 0 {
            (? (? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].capacity else 0) < cast<u64>((blocks_mask_sets_size)) then ((((ctx[].dfa[].blocks_mask_sets)) = stbds_arrgrowf(((ctx[].dfa[].blocks_mask_sets)), sizeof(((ctx[].dfa[].blocks_mask_sets))[]), (0), (cast<u64>((blocks_mask_sets_size)))))) and 0 else 0)
            ?             (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].length = cast<u64>((blocks_mask_sets_size)) else 0
        }
    }
    if (? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].length else 0) < instrs_mask_sets_size {
        loop .. while 0 {
            (? (? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].capacity else 0) < cast<u64>((instrs_mask_sets_size)) then ((((ctx[].dfa[].instrs_mask_sets)) = stbds_arrgrowf(((ctx[].dfa[].instrs_mask_sets)), sizeof(((ctx[].dfa[].instrs_mask_sets))[]), (0), (cast<u64>((instrs_mask_sets_size)))))) and 0 else 0)
            ?             (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].length = cast<u64>((instrs_mask_sets_size)) else 0
        }
        memset(ctx[].dfa[].instrs_mask_sets, 0ul, sizeof<u64> * instrs_mask_sets_size)
    }
    i: u64 = 0
    loop j: u64 = 0 while j < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++j {
        succ_id: u64 = ctx[].cfg[].entry_succ_ids[j]
        if not ctx[].cfg[].reaching_code[succ_id] {
            dfa_backward_open_block(ctx, succ_id, @i)
        }
    }
    loop  while i < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++i {
        ctx[].dfa[].open_data_map[i] = ctx[].cfg[].exit_id
    }
    {
        fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((fun_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (0)] = fun_type[].ret_reg_mask
    }
    loop i = 1 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        name_id: *struc PairTIdentifierulong_t = @ctx[].cfg[].identifier_id_map[i]
        ctx[].dfa_o2[].data_name_map[(name_id[]).value - 26] = (name_id[]).key
    }
    memset(ctx[].dfa[].blocks_mask_sets, 0ul, sizeof<u64> * blocks_mask_sets_size)
    return 1
}
fn is_bitshift_cl(node: *struc AsmBinary) i32 {
    match node[].binop.type {
        -> 265 {
            -> 266 {
                -> 267 {
                    return node[].src[].type ~= 250
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn find_identifier(xs: *u64, x: u64) i32 {
    loop i: u64 = 0 while i < (? (xs) then (cast<*struc stbds_array_header>((xs)) - 1)[].length else 0) .. ++i {
        if xs[i] == x {
            return 1
        }
    }
    return 0
}
fn infer_transfer_used_reg(ctx: *struc RegAllocContext, reg_kind: i32, next_instr_idx: u64) none {
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? register_mask_bit(reg_kind) > 63 then register_mask_bit(reg_kind) / 64 else 0)], register_mask_bit(reg_kind), 1)
}
fn infer_transfer_used_name(ctx: *struc RegAllocContext, name: u64, next_instr_idx: u64) none {
    if not is_aliased_name(ctx, name) {
        i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, 1)
    }
}
fn infer_transfer_used_op(ctx: *struc RegAllocContext, node: *struc AsmOperand, next_instr_idx: u64) none {
    match node[].type {
        -> 251 {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= 14 {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> 252 {
            infer_transfer_used_name(ctx, node[].get._AsmPseudo.name, next_instr_idx)
        }
        break
        -> 253 {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmMemory.reg)
            if reg_kind ~= 14 {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> 256 {
            p_node: *struc AsmIndexed = @node[].get._AsmIndexed
            {
                reg_kind: i32 = register_mask_kind(@p_node[].reg_base)
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            {
                reg_kind: i32 = register_mask_kind(@p_node[].reg_index)
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        otherwise {
            break
        }
    }
}
fn infer_transfer_used_call(ctx: *struc RegAllocContext, node: *struc AsmCall, next_instr_idx: u64) none {
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (0)] |= fun_type[].param_reg_mask
}
fn infer_transfer_updated_reg(ctx: *struc RegAllocContext, reg_kind: i32, next_instr_idx: u64) none {
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? register_mask_bit(reg_kind) > 63 then register_mask_bit(reg_kind) / 64 else 0)], register_mask_bit(reg_kind), 0)
}
fn infer_transfer_updated_name(ctx: *struc RegAllocContext, name: u64, next_instr_idx: u64) none {
    if not is_aliased_name(ctx, name) {
        i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, 0)
    }
}
fn infer_transfer_updated_op(ctx: *struc RegAllocContext, node: *struc AsmOperand, next_instr_idx: u64) none {
    match node[].type {
        -> 251 {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= 14 {
                infer_transfer_updated_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> 252 {
            infer_transfer_updated_name(ctx, node[].get._AsmPseudo.name, next_instr_idx)
        }
        break
        -> 253 {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmMemory.reg)
            if reg_kind ~= 14 {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> 256 {
            panic_sigabrt("abort", 233, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
        }
        otherwise {
            break
        }
    }
}
fn infer_transfer_live_regs(ctx: *struc RegAllocContext, instr_idx: u64, next_instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].type {
        -> 273 {
            p_node: *struc AsmMov = @node[].get._AsmMov
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> 274 {
            p_node: *struc AsmMovSx = @node[].get._AsmMovSx
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> 275 {
            p_node: *struc AsmMovZeroExtend = @node[].get._AsmMovZeroExtend
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> 276 {
            p_node: *struc AsmLea = @node[].get._AsmLea
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> 277 {
            p_node: *struc AsmCvttsd2si = @node[].get._AsmCvttsd2si
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> 278 {
            p_node: *struc AsmCvtsi2sd = @node[].get._AsmCvtsi2sd
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> 279 {
            infer_transfer_used_op(ctx, node[].get._AsmUnary.dst, next_instr_idx)
        }
        break
        -> 280 {
            p_node: *struc AsmBinary = @node[].get._AsmBinary
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].dst, next_instr_idx)
            if is_bitshift_cl(p_node) {
                infer_transfer_used_reg(ctx, 2, next_instr_idx)
            }
            break
        }
        -> 281 {
            p_node: *struc AsmCmp = @node[].get._AsmCmp
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].dst, next_instr_idx)
            break
        }
        -> 282 {
            infer_transfer_used_op(ctx, node[].get._AsmIdiv.src, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, 0, next_instr_idx)
        infer_transfer_used_reg(ctx, 3, next_instr_idx)
        break
        -> 283 {
            infer_transfer_used_op(ctx, node[].get._AsmDiv.src, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, 0, next_instr_idx)
        break
        -> 284 {
            infer_transfer_updated_reg(ctx, 3, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, 0, next_instr_idx)
        break
        -> 287 {
            infer_transfer_updated_op(ctx, node[].get._AsmSetCC.dst, next_instr_idx)
        }
        break
        -> 289 {
            infer_transfer_used_op(ctx, node[].get._AsmPush.src, next_instr_idx)
        }
        break
        -> 291 {
            infer_transfer_updated_reg(ctx, 0, next_instr_idx)
        }
        infer_transfer_updated_reg(ctx, 2, next_instr_idx)
        infer_transfer_updated_reg(ctx, 3, next_instr_idx)
        infer_transfer_updated_reg(ctx, 4, next_instr_idx)
        infer_transfer_updated_reg(ctx, 5, next_instr_idx)
        infer_transfer_updated_reg(ctx, 6, next_instr_idx)
        infer_transfer_updated_reg(ctx, 7, next_instr_idx)
        infer_transfer_updated_reg(ctx, 16, next_instr_idx)
        infer_transfer_updated_reg(ctx, 17, next_instr_idx)
        infer_transfer_updated_reg(ctx, 18, next_instr_idx)
        infer_transfer_updated_reg(ctx, 19, next_instr_idx)
        infer_transfer_updated_reg(ctx, 20, next_instr_idx)
        infer_transfer_updated_reg(ctx, 21, next_instr_idx)
        infer_transfer_updated_reg(ctx, 22, next_instr_idx)
        infer_transfer_updated_reg(ctx, 23, next_instr_idx)
        infer_transfer_updated_reg(ctx, 24, next_instr_idx)
        infer_transfer_updated_reg(ctx, 25, next_instr_idx)
        infer_transfer_updated_reg(ctx, 26, next_instr_idx)
        infer_transfer_updated_reg(ctx, 27, next_instr_idx)
        infer_transfer_updated_reg(ctx, 28, next_instr_idx)
        infer_transfer_updated_reg(ctx, 29, next_instr_idx)
        infer_transfer_used_call(ctx, @node[].get._AsmCall, next_instr_idx)
        break
        otherwise {
            panic_sigabrt("abort", 340, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
        }
    }
}
fn set_p_infer_graph(ctx: *struc RegAllocContext, is_dbl: i32) none {
    ctx[].p_infer_graph = ? is_dbl then ctx[].sse_infer_graph else ctx[].infer_graph
}
fn infer_add_pseudo_edges(ctx: *struc RegAllocContext, name_1: u64, name_2: u64) none {
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name_1))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not find_identifier(infer[].linked_pseudo_names, name_2) {
            loop .. while 0 {
                (? (not (infer[].linked_pseudo_names) or (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].capacity) then (((infer[].linked_pseudo_names) = stbds_arrgrowf((infer[].linked_pseudo_names), sizeof((infer[].linked_pseudo_names)[]), (1), (0))) and 0) else 0)
                (infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length++] = (name_2)
            }
            infer[].degree++
        }
    }
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name_2))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not find_identifier(infer[].linked_pseudo_names, name_1) {
            loop .. while 0 {
                (? (not (infer[].linked_pseudo_names) or (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].capacity) then (((infer[].linked_pseudo_names) = stbds_arrgrowf((infer[].linked_pseudo_names), sizeof((infer[].linked_pseudo_names)[]), (1), (0))) and 0) else 0)
                (infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length++] = (name_1)
            }
            infer[].degree++
        }
    }
}
fn infer_add_reg_edge(ctx: *struc RegAllocContext, reg_kind: i32, name: u64) none {
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not register_mask_get(infer[].linked_hard_mask, reg_kind) {
            register_mask_set(@infer[].linked_hard_mask, reg_kind, 1)
            infer[].degree++
        }
    }
    {
        infer: *struc InferenceRegister = @ctx[].hard_regs[register_mask_bit(reg_kind)]
        if not find_identifier(infer[].linked_pseudo_names, name) {
            loop .. while 0 {
                (? (not (infer[].linked_pseudo_names) or (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].capacity) then (((infer[].linked_pseudo_names) = stbds_arrgrowf((infer[].linked_pseudo_names), sizeof((infer[].linked_pseudo_names)[]), (1), (0))) and 0) else 0)
                (infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length++] = (name)
            }
            infer[].degree++
        }
    }
}
fn infer_rm_pseudo_edge(infer: *struc InferenceRegister, name: u64) none {
    loop i: u64 = (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) while i-- > 0 {
        if infer[].linked_pseudo_names[i] == name {
            loop .. while 0 {
                (infer[].linked_pseudo_names)[i] = ((infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length - 1])
                (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length -= 1
            }
            infer[].degree--
            return none
        }
    }
    panic_sigabrt("abort", 390, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
}
fn infer_rm_unpruned_pseudo_name(ctx: *struc RegAllocContext, name: u64) none {
    loop i: u64 = (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) while i-- > 0 {
        if ctx[].p_infer_graph[].unpruned_pseudo_names[i] == name {
            loop .. while 0 {
                (ctx[].p_infer_graph[].unpruned_pseudo_names)[i] = ((ctx[].p_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length - 1])
                (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length -= 1
            }
            return none
        }
    }
    panic_sigabrt("abort", 400, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
}
fn infer_init_used_name_edges(ctx: *struc RegAllocContext, name: u64) none {
    if not is_aliased_name(ctx, name) {
        set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8)
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
    }
}
fn infer_init_used_op_edges(ctx: *struc RegAllocContext, node: *struc AsmOperand) none {
    if node[].type == 252 {
        infer_init_used_name_edges(ctx, node[].get._AsmPseudo.name)
    }
}
fn infer_init_updated_regs_edges(ctx: *struc RegAllocContext, reg_kinds: *i32, instr_idx: u64, reg_kinds_size: u64, is_dbl: i32) none {
    mov_mask_bit: u64 = ctx[].dfa[].set_size
    is_mov: i32 = (ctx[].p_instrs[])[instr_idx][].type == 273
    if is_mov {
        mov: *struc AsmMov = @(ctx[].p_instrs[])[instr_idx][].get._AsmMov
        if mov[].src[].type == 252 {
            src_name: u64 = mov[].src[].get._AsmPseudo.name
            if is_aliased_name(ctx, src_name) {
                is_mov = 0
            }
            else {
                is_src_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8
                set_p_infer_graph(ctx, is_src_dbl)
                ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
                mov_mask_bit = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
                is_mov = is_dbl == is_src_dbl
            }
        }
        else {
            is_mov = 0
        }
    }
    set_p_infer_graph(ctx, is_dbl)
    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (0)] ~= 0ul {
        loop i: u64 = ? ctx[].dfa[].set_size < 64 then ctx[].dfa[].set_size else 64 while i-- > 26 {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - 26]
                if is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8) {
                    loop j: u64 = 0 while j < reg_kinds_size .. ++j {
                        infer_add_reg_edge(ctx, reg_kinds[j], pseudo_name)
                    }
                }
            }
        }
    }
    i: u64 = 64
    loop j: u64 = 1 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - 26]
                if is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8) {
                    loop k: u64 = 0 while k < reg_kinds_size .. ++k {
                        infer_add_reg_edge(ctx, reg_kinds[k], pseudo_name)
                    }
                }
            }
        }
    }
}
fn infer_init_updated_name_edges(ctx: *struc RegAllocContext, name: u64, instr_idx: u64) none {
    if is_aliased_name(ctx, name) {
        return none
    }
    is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8
    mov_mask_bit: u64 = ctx[].dfa[].set_size
    is_mov: i32 = (ctx[].p_instrs[])[instr_idx][].type == 273
    if is_mov {
        mov: *struc AsmMov = @(ctx[].p_instrs[])[instr_idx][].get._AsmMov
        match mov[].src[].type {
            -> 251 {
                src_reg_kind: i32 = register_mask_kind(@mov[].src[].get._AsmRegister.reg)
                if src_reg_kind == 14 {
                    is_mov = 0
                }
                else {
                    mov_mask_bit = register_mask_bit(src_reg_kind)
                    is_mov = is_dbl == (mov_mask_bit > 11)
                }
                break
            }
            -> 252 {
                src_name: u64 = mov[].src[].get._AsmPseudo.name
                if is_aliased_name(ctx, src_name) {
                    is_mov = 0
                }
                else {
                    is_src_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8
                    set_p_infer_graph(ctx, is_src_dbl)
                    ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
                    mov_mask_bit = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
                    is_mov = is_dbl == is_src_dbl
                }
                break
            }
            -> 253 {
                src_reg_kind: i32 = register_mask_kind(@mov[].src[].get._AsmMemory.reg)
                if src_reg_kind == 14 {
                    is_mov = 0
                }
                else {
                    mov_mask_bit = register_mask_bit(src_reg_kind)
                    is_mov = is_dbl == (mov_mask_bit > 11)
                }
                break
            }
            -> 256 {
                panic_sigabrt("abort", 525, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
            }
            otherwise {
                is_mov = 0
                break
            }
        }
    }
    set_p_infer_graph(ctx, is_dbl)
    ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (0)] ~= 0ul {
        i: u64 = ctx[].p_infer_graph[].offset
        mask_set_size: u64 = i + ctx[].p_infer_graph[].k
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                reg_kind: i32 = ctx[].hard_regs[i].reg_kind
                infer_add_reg_edge(ctx, reg_kind, name)
            }
        }
        i = 26
        mask_set_size = ? ctx[].dfa[].set_size < 64 then ctx[].dfa[].set_size else 64
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - 26]
                if name ~= pseudo_name                 and is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8) {
                    infer_add_pseudo_edges(ctx, name, pseudo_name)
                }
            }
        }
    }
    i: u64 = 64
    loop j: u64 = 1 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - 26]
                if name ~= pseudo_name                 and is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8) {
                    infer_add_pseudo_edges(ctx, name, pseudo_name)
                }
            }
        }
    }
}
fn infer_init_updated_op_edges(ctx: *struc RegAllocContext, node: *struc AsmOperand, instr_idx: u64) none {
    match node[].type {
        -> 251 {
            reg_kinds: [1]i32 = $(register_mask_kind(@node[].get._AsmRegister.reg))
            if reg_kinds[0] ~= 14 {
                is_dbl: i32 = register_mask_bit(reg_kinds[0]) > 11
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, is_dbl)
            }
            break
        }
        -> 252 {
            infer_init_updated_name_edges(ctx, node[].get._AsmPseudo.name, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}
fn infer_init_edges(ctx: *struc RegAllocContext, instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].type {
        -> 273 {
            infer_init_updated_op_edges(ctx, node[].get._AsmMov.dst, instr_idx)
        }
        break
        -> 274 {
            infer_init_updated_op_edges(ctx, node[].get._AsmMovSx.dst, instr_idx)
        }
        break
        -> 275 {
            infer_init_updated_op_edges(ctx, node[].get._AsmMovZeroExtend.dst, instr_idx)
        }
        break
        -> 276 {
            infer_init_updated_op_edges(ctx, node[].get._AsmLea.dst, instr_idx)
        }
        break
        -> 277 {
            infer_init_updated_op_edges(ctx, node[].get._AsmCvttsd2si.dst, instr_idx)
        }
        break
        -> 278 {
            infer_init_updated_op_edges(ctx, node[].get._AsmCvtsi2sd.dst, instr_idx)
        }
        break
        -> 279 {
            infer_init_updated_op_edges(ctx, node[].get._AsmUnary.dst, instr_idx)
        }
        break
        -> 280 {
            p_node: *struc AsmBinary = @node[].get._AsmBinary
            if is_bitshift_cl(p_node) {
                reg_kinds: [1]i32 = $(2)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, 0)
            }
            infer_init_updated_op_edges(ctx, p_node[].dst, instr_idx)
            infer_init_used_op_edges(ctx, p_node[].src)
            break
        }
        -> 281 {
            p_node: *struc AsmCmp = @node[].get._AsmCmp
            infer_init_used_op_edges(ctx, p_node[].src)
            infer_init_used_op_edges(ctx, p_node[].dst)
            break
        }
        -> 282 {
            reg_kinds: [2]i32 = $(0, 3)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 2, 0)
            infer_init_used_op_edges(ctx, node[].get._AsmIdiv.src)
            break
        }
        -> 283 {
            reg_kinds: [1]i32 = $(0)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, 0)
            infer_init_used_op_edges(ctx, node[].get._AsmDiv.src)
            break
        }
        -> 284 {
            reg_kinds: [1]i32 = $(3)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, 0)
            break
        }
        -> 287 {
            infer_init_updated_op_edges(ctx, node[].get._AsmSetCC.dst, instr_idx)
        }
        break
        -> 289 {
            infer_init_used_op_edges(ctx, node[].get._AsmPush.src)
        }
        break
        -> 291 {
            {
                reg_kinds: [7]i32 = $(0, 2, 3, 4, 5, 6, 7)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 7, 0)
            }
            {
                reg_kinds: [14]i32 = $(16, 17, 18, 19, 20, 21, 22,                     23, 24, 25, 26, 27, 28, 29)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 14, 1)
            }
            break
        }
        otherwise {
            break
        }
    }
}
fn init_inference_graph(ctx: *struc RegAllocContext, fun_name: u64) i32 {
    if not init_data_flow_analysis(ctx, fun_name) {
        return 0
    }
    dfa_iter_alg(ctx)
    if ((? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        return 0
    }
    ctx[].callee_saved_reg_mask = 0ul
    if ctx[].infer_graph[].unpruned_pseudo_names {
        (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx[].infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? ((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) then free((cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names)) - 1)) else cast<none>(0)))
                ((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) = 0
            }
            (ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names = 0
        }
        ;
    }
    if ctx[].infer_graph[].pseudo_reg_map {
        loop .. while 0 {
            cast<none>((? (ctx[].infer_graph[].pseudo_reg_map) ~= 0 then stbds_hmfree_func((ctx[].infer_graph[].pseudo_reg_map) - 1, sizeof((ctx[].infer_graph[].pseudo_reg_map)[])) else cast<none>(0)))
            (ctx[].infer_graph[].pseudo_reg_map) = 0
        }
        ctx[].infer_graph[].pseudo_reg_map = 0
    }
    ;
    if ctx[].sse_infer_graph[].unpruned_pseudo_names {
        (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx[].sse_infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? ((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) then free((cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names)) - 1)) else cast<none>(0)))
                ((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) = 0
            }
            (ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names = 0
        }
        ;
    }
    if ctx[].sse_infer_graph[].pseudo_reg_map {
        loop .. while 0 {
            cast<none>((? (ctx[].sse_infer_graph[].pseudo_reg_map) ~= 0 then stbds_hmfree_func((ctx[].sse_infer_graph[].pseudo_reg_map) - 1, sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[])) else cast<none>(0)))
            (ctx[].sse_infer_graph[].pseudo_reg_map) = 0
        }
        ctx[].sse_infer_graph[].pseudo_reg_map = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        name: u64 = (ctx[].cfg[].identifier_id_map[i]).key
        infer: struc InferenceRegister = $(14, 14, 0, 0, 0ul, 0)
        if ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8 {
            loop .. while 0 {
                (? (not (ctx[].sse_infer_graph[].unpruned_pseudo_names) or (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].capacity) then (((ctx[].sse_infer_graph[].unpruned_pseudo_names) = stbds_arrgrowf((ctx[].sse_infer_graph[].unpruned_pseudo_names), sizeof((ctx[].sse_infer_graph[].unpruned_pseudo_names)[]), (1), (0))) and 0) else 0)
                (ctx[].sse_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length++] = (name)
            }
            loop .. while 0 {
                (ctx[].sse_infer_graph[].pseudo_reg_map) = stbds_hmput_key((ctx[].sse_infer_graph[].pseudo_reg_map), sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].sse_infer_graph[].pseudo_reg_map)[].key, 0)
                (ctx[].sse_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].sse_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].value = (infer)
            }
        }
        else {
            loop .. while 0 {
                (? (not (ctx[].infer_graph[].unpruned_pseudo_names) or (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].capacity) then (((ctx[].infer_graph[].unpruned_pseudo_names) = stbds_arrgrowf((ctx[].infer_graph[].unpruned_pseudo_names), sizeof((ctx[].infer_graph[].unpruned_pseudo_names)[]), (1), (0))) and 0) else 0)
                (ctx[].infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length++] = (name)
            }
            loop .. while 0 {
                (ctx[].infer_graph[].pseudo_reg_map) = stbds_hmput_key((ctx[].infer_graph[].pseudo_reg_map), sizeof((ctx[].infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].infer_graph[].pseudo_reg_map)[].key, 0)
                (ctx[].infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].value = (infer)
            }
        }
    }
    if not ((? (ctx[].infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        if (? (ctx[].infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) < 12 {
            loop .. while 0 {
                (? (? (ctx[].infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_hard_mask_bits)) - 1)[].capacity else 0) < cast<u64>((12)) then ((((ctx[].infer_graph[].unpruned_hard_mask_bits)) = stbds_arrgrowf(((ctx[].infer_graph[].unpruned_hard_mask_bits)), sizeof(((ctx[].infer_graph[].unpruned_hard_mask_bits))[]), (0), (cast<u64>((12)))))) and 0 else 0)
                ?                 (ctx[].infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_hard_mask_bits)) - 1)[].length = cast<u64>((12)) else 0
            }
        }
        hard_reg_mask: u64 = ctx[].infer_graph[].hard_reg_mask
        loop i: u64 = 0 while i < 12 .. ++i {
            ctx[].reg_color_map[i] = 14
            ctx[].hard_regs[i].color = 14
            ctx[].hard_regs[i].degree = 11
            ctx[].hard_regs[i].spill_cost = 0
            ctx[].hard_regs[i].linked_hard_mask = hard_reg_mask
            if ctx[].hard_regs[i].linked_pseudo_names {
                (cast<*struc stbds_array_header>((ctx[].hard_regs[i].linked_pseudo_names)) - 1)[].length = 0
            }
            ;
            ctx[].infer_graph[].unpruned_hard_mask_bits[i] = i
        }
    }
    if not ((? (ctx[].sse_infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        if (? (ctx[].sse_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) < 14 {
            loop .. while 0 {
                (? (? (ctx[].sse_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) - 1)[].capacity else 0) < cast<u64>((14)) then ((((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) = stbds_arrgrowf(((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)), sizeof(((ctx[].sse_infer_graph[].unpruned_hard_mask_bits))[]), (0), (cast<u64>((14)))))) and 0 else 0)
                ?                 (ctx[].sse_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length = cast<u64>((14)) else 0
            }
        }
        hard_reg_mask: u64 = ctx[].sse_infer_graph[].hard_reg_mask
        loop i: u64 = 12 while i < 26 .. ++i {
            ctx[].reg_color_map[i] = 14
            ctx[].hard_regs[i].color = 14
            ctx[].hard_regs[i].degree = 13
            ctx[].hard_regs[i].spill_cost = 0
            ctx[].hard_regs[i].linked_hard_mask = hard_reg_mask
            if ctx[].hard_regs[i].linked_pseudo_names {
                (cast<*struc stbds_array_header>((ctx[].hard_regs[i].linked_pseudo_names)) - 1)[].length = 0
            }
            ;
            ctx[].sse_infer_graph[].unpruned_hard_mask_bits[i - 12] = i
        }
    }
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while             instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    infer_init_edges(ctx, instr_idx)
                }
            }
        }
    }
    return 1
}
fn is_reg_callee_saved(reg_kind: i32) i32 {
    match reg_kind {
        -> 1 {
            -> 10 {
                -> 11 {
                    -> 12 {
                        -> 13 {
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
fn alloc_prune_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_idx: u64) none {
    if infer[].reg_kind == 14 {
        loop .. while 0 {
            (ctx[].p_infer_graph[].unpruned_pseudo_names)[pruned_idx] = ((ctx[].p_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length - 1])
            (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length -= 1
        }
    }
    else {
        loop .. while 0 {
            (ctx[].p_infer_graph[].unpruned_hard_mask_bits)[pruned_idx] = ((ctx[].p_infer_graph[].unpruned_hard_mask_bits)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length - 1])
            (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length -= 1
        }
    }
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                linked_infer[].degree--
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).degree--
    }
}
fn alloc_unprune_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_name: u64) none {
    if infer[].reg_kind == 14 {
        ;
        loop .. while 0 {
            (? (not (ctx[].p_infer_graph[].unpruned_pseudo_names) or (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].capacity) then (((ctx[].p_infer_graph[].unpruned_pseudo_names) = stbds_arrgrowf((ctx[].p_infer_graph[].unpruned_pseudo_names), sizeof((ctx[].p_infer_graph[].unpruned_pseudo_names)[]), (1), (0))) and 0) else 0)
            (ctx[].p_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length++] = (pruned_name)
        }
    }
    else {
        pruned_mask_bit: u64 = register_mask_bit(infer[].reg_kind)
        ;
        loop .. while 0 {
            (? (not (ctx[].p_infer_graph[].unpruned_hard_mask_bits) or (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].capacity) then (((ctx[].p_infer_graph[].unpruned_hard_mask_bits) = stbds_arrgrowf((ctx[].p_infer_graph[].unpruned_hard_mask_bits), sizeof((ctx[].p_infer_graph[].unpruned_hard_mask_bits)[]), (1), (0))) and 0) else 0)
            (ctx[].p_infer_graph[].unpruned_hard_mask_bits)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length++] = (pruned_mask_bit)
        }
    }
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                linked_infer[].degree++
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).degree++
    }
}
fn alloc_color_infer_graph(ctx: *struc RegAllocContext) none;
fn alloc_next_color_infer_graph(ctx: *struc RegAllocContext) none {
    if not ((? (ctx[].p_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) == 0)     or not ((? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
        alloc_color_infer_graph(ctx)
    }
}
fn alloc_prune_infer_graph(ctx: *struc RegAllocContext, pruned_name: *u64) *struc InferenceRegister {
    pruned_idx: u64;
    infer: *struc InferenceRegister = 0
    loop i: u64 = 0 while i < (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) .. ++i {
        pruned_name[] = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
        infer = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((pruned_name[]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if infer[].degree < ctx[].p_infer_graph[].k {
            pruned_idx = i
            break
        }
        infer = 0
    }
    if not infer {
        loop i: u64 = 0 while i < (? (ctx[].p_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) .. ++i {
            pruned_mask_bit: u64 = ctx[].p_infer_graph[].unpruned_hard_mask_bits[i]
            infer = @ctx[].hard_regs[pruned_mask_bit]
            if infer[].degree < ctx[].p_infer_graph[].k {
                pruned_idx = i
                break
            }
            infer = 0
        }
    }
    if not infer {
        i: u64 = 0
        loop  while i < (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) .. ++i {
            pruned_name[] = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
            infer = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((pruned_name[]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if infer[].degree > 0 {
                pruned_idx = i
                break
            }
            infer = 0
        }
        ;
        min_spill_metric: f64 = (cast<f64>(infer[].spill_cost)) / infer[].degree
        loop  while i < (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) .. ++i {
            spill_name: u64 = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
            spill_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((spill_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if spill_infer[].degree > 0 {
                spill_metric: f64 = (cast<f64>(spill_infer[].spill_cost)) / spill_infer[].degree
                if spill_metric < min_spill_metric {
                    pruned_idx = i
                    pruned_name[] = spill_name
                    infer = spill_infer
                    min_spill_metric = spill_metric
                }
            }
        }
    }
    alloc_prune_infer_reg(ctx, infer, pruned_idx)
    return infer
}
fn alloc_unprune_infer_graph(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_name: u64) none {
    color_reg_mask: u64 = ctx[].p_infer_graph[].hard_reg_mask
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                if linked_infer[].color ~= 14 {
                    register_mask_set(@color_reg_mask, linked_infer[].color, 0)
                }
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister =         @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if linked_infer[].color ~= 14 {
            register_mask_set(@color_reg_mask, linked_infer[].color, 0)
        }
    }
    if color_reg_mask ~= 0ul {
        if is_reg_callee_saved(infer[].reg_kind) {
            loop i: u64 = ctx[].p_infer_graph[].k while i-- > 0 {
                color: i32 = ctx[].hard_regs[i + ctx[].p_infer_graph[].offset].reg_kind
                if register_mask_get(color_reg_mask, color) {
                    infer[].color = color
                    break
                }
            }
        }
        else {
            loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
                color: i32 = ctx[].hard_regs[i + ctx[].p_infer_graph[].offset].reg_kind
                if register_mask_get(color_reg_mask, color) {
                    infer[].color = color
                    break
                }
            }
        }
        alloc_unprune_infer_reg(ctx, infer, pruned_name)
    }
}
fn alloc_color_infer_graph(ctx: *struc RegAllocContext) none {
    pruned_name: u64 = 0
    infer: *struc InferenceRegister = alloc_prune_infer_graph(ctx, @pruned_name)
    alloc_next_color_infer_graph(ctx)
    alloc_unprune_infer_graph(ctx, infer, pruned_name)
}
fn alloc_color_reg_map(ctx: *struc RegAllocContext) none {
    loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
        infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
        if infer[].color ~= 14 {
            ctx[].reg_color_map[register_mask_bit(infer[].color)] = infer[].reg_kind
        }
    }
}
fn alloc_hard_reg(ctx: *struc RegAllocContext, name: u64) *struc AsmOperand {
    if is_aliased_name(ctx, name) {
        return 0
    }
    set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8)
    color: i32 = ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).color
    if color ~= 14 {
        reg_kind: i32 = ctx[].reg_color_map[register_mask_bit(color)]
        hard_reg: *struc AsmOperand = gen_register(reg_kind)
        if is_reg_callee_saved(reg_kind) and not register_mask_get(ctx[].callee_saved_reg_mask, reg_kind) {
            register_mask_set(@ctx[].callee_saved_reg_mask, reg_kind, 1)
            callee_saved_reg: *struc AsmOperand = 0
            if hard_reg ~= callee_saved_reg {
                free_AsmOperand(@callee_saved_reg)
                callee_saved_reg = hard_reg
                (callee_saved_reg)[]._ref_count++
            }
            ;
            loop .. while 0 {
                loop .. while 0 {
                    (? (not (ctx[].p_backend_fun[].callee_saved_regs) or (cast<*struc stbds_array_header>((ctx[].p_backend_fun[].callee_saved_regs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_backend_fun[].callee_saved_regs)) - 1)[].capacity) then (((ctx[].p_backend_fun[].callee_saved_regs) = stbds_arrgrowf((ctx[].p_backend_fun[].callee_saved_regs), sizeof((ctx[].p_backend_fun[].callee_saved_regs)[]), (1), (0))) and 0) else 0)
                    (ctx[].p_backend_fun[].callee_saved_regs)[(cast<*struc stbds_array_header>((ctx[].p_backend_fun[].callee_saved_regs)) - 1)[].length++] = (callee_saved_reg)
                }
                callee_saved_reg = 0
            }
        }
        return hard_reg
    }
    else {
        return 0
    }
}
fn get_op_reg_kind(ctx: *struc RegAllocContext, node: *struc AsmOperand) i32 {
    match node[].type {
        -> 251 {
            return register_mask_kind(@node[].get._AsmRegister.reg)
        }
        -> 252 {
            name: u64 = node[].get._AsmPseudo.name
            if is_aliased_name(ctx, name) {
                return 14
            }
            set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8)
            color: i32 = ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).color
            if color == 14 {
                return 14
            }
            else {
                return ctx[].reg_color_map[register_mask_bit(color)]
            }
        }
        -> 253 {
            return 14
        }
        -> 256 {
            panic_sigabrt("abort", 983, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
        }
        otherwise {
            return 14
        }
    }
}
fn alloc_mov_instr(ctx: *struc RegAllocContext, node: *struc AsmMov, instr_idx: u64) none {
    src_reg_kind: i32 = get_op_reg_kind(ctx, node[].src)
    dst_reg_kind: i32 = get_op_reg_kind(ctx, node[].dst)
    if src_reg_kind ~= 14 and src_reg_kind == dst_reg_kind {
        set_instr(ctx, 0, instr_idx)
    }
    else {
        if node[].src[].type == 252 {
            hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
            if hard_reg {
                if hard_reg ~= node[].src {
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = 0
                }
                ;
            }
        }
        if node[].dst[].type == 252 {
            hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
            if hard_reg {
                if hard_reg ~= node[].dst {
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = 0
                }
                ;
            }
        }
    }
}
fn alloc_mov_sx_instr(ctx: *struc RegAllocContext, node: *struc AsmMovSx) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_zero_extend_instr(ctx: *struc RegAllocContext, node: *struc AsmMovZeroExtend) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_lea_instr(ctx: *struc RegAllocContext, node: *struc AsmLea) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_cvttsd2si_instr(ctx: *struc RegAllocContext, node: *struc AsmCvttsd2si) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_cvtsi2sd_instr(ctx: *struc RegAllocContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_unary_instr(ctx: *struc RegAllocContext, node: *struc AsmUnary) none {
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_binary_instr(ctx: *struc RegAllocContext, node: *struc AsmBinary) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_cmp_instr(ctx: *struc RegAllocContext, node: *struc AsmCmp) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_idiv_instr(ctx: *struc RegAllocContext, node: *struc AsmIdiv) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_div_instr(ctx: *struc RegAllocContext, node: *struc AsmDiv) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_set_cc_instr(ctx: *struc RegAllocContext, node: *struc AsmSetCC) none {
    if node[].dst[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_push_instr(ctx: *struc RegAllocContext, node: *struc AsmPush) none {
    if node[].src[].type == 252 {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            if hard_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = hard_reg
                hard_reg = 0
            }
            ;
        }
    }
}
fn alloc_instr(ctx: *struc RegAllocContext, instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].type {
        -> 273 {
            alloc_mov_instr(ctx, @node[].get._AsmMov, instr_idx)
        }
        break
        -> 274 {
            alloc_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> 275 {
            alloc_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> 276 {
            alloc_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> 277 {
            alloc_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> 278 {
            alloc_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> 279 {
            alloc_unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> 280 {
            alloc_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> 281 {
            alloc_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> 282 {
            alloc_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> 283 {
            alloc_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> 287 {
            alloc_set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> 289 {
            alloc_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> 284 {
            -> 291 {
                break
            }
        }
        otherwise {
            break
        }
    }
}
fn reallocate_registers(ctx: *struc RegAllocContext) none {
    if not ((? (ctx[].infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
        set_p_infer_graph(ctx, 0)
        alloc_color_infer_graph(ctx)
        alloc_color_reg_map(ctx)
    }
    if not ((? (ctx[].sse_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
        set_p_infer_graph(ctx, 1)
        alloc_color_infer_graph(ctx)
        alloc_color_reg_map(ctx)
    }
    loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            alloc_instr(ctx, instr_idx)
        }
    }
}
fn get_type_size(type: *struc Type) i32 {
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
            panic_sigabrt("abort", 1249, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
        }
    }
}
fn get_coalesced_idx(ctx: *struc RegAllocContext, node: *struc AsmOperand) u64 {
    coalesced_idx: u64 = ctx[].dfa[].set_size
    match node[].type {
        -> 251 {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= 14 {
                coalesced_idx = register_mask_bit(reg_kind)
            }
            break
        }
        -> 252 {
            name: u64 = node[].get._AsmPseudo.name
            if not is_aliased_name(ctx, name) {
                coalesced_idx = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
            }
            break
        }
        otherwise {
            break
        }
    }
    if coalesced_idx < ctx[].dfa[].set_size {
        loop while coalesced_idx >= 26         and coalesced_idx ~= ctx[].dfa[].open_data_map[coalesced_idx - 26] {
            coalesced_idx = ctx[].dfa[].open_data_map[coalesced_idx - 26]
        }
    }
    return coalesced_idx
}
fn get_coalescable_infer_regs(ctx: *struc RegAllocContext, src_infer: **struc InferenceRegister, dst_infer: **struc InferenceRegister, src_idx: u64, dst_idx: u64) i32 {
    if src_idx ~= dst_idx and (src_idx >= 26 or dst_idx >= 26)     and src_idx < ctx[].dfa[].set_size and dst_idx < ctx[].dfa[].set_size {
        if src_idx < 26 {
            dst_name: u64 = ctx[].dfa_o2[].data_name_map[dst_idx - 26]
            is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8
            if is_dbl == (src_idx > 11) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @ctx[].hard_regs[src_idx]
                dst_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                return not register_mask_get((dst_infer[])[].linked_hard_mask, (src_infer[])[].reg_kind)
            }
        }
        elif dst_idx < 26 {
            src_name: u64 = ctx[].dfa_o2[].data_name_map[src_idx - 26]
            is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8
            if is_dbl == (dst_idx > 11) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                dst_infer[] = @ctx[].hard_regs[dst_idx]
                return not register_mask_get((src_infer[])[].linked_hard_mask, (dst_infer[])[].reg_kind)
            }
        }
        else {
            src_name: u64 = ctx[].dfa_o2[].data_name_map[src_idx - 26]
            dst_name: u64 = ctx[].dfa_o2[].data_name_map[dst_idx - 26]
            src_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
            dst_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
            is_dbl: i32 = src_type[].type == 8
            if is_dbl == (dst_type[].type == 8) and get_type_size(src_type) == get_type_size(dst_type) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                dst_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                return not find_identifier((dst_infer[])[].linked_pseudo_names, src_name)
            }
        }
    }
    return 0
}
fn coal_briggs_test(ctx: *struc RegAllocContext, src_infer: *struc InferenceRegister, dst_infer: *struc InferenceRegister) i32 {
    degree: u64 = 0
    if src_infer[].linked_hard_mask ~= 0ul or dst_infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(src_infer[].linked_hard_mask, linked_infer[].reg_kind) {
                if register_mask_get(dst_infer[].linked_hard_mask, linked_infer[].reg_kind) {
                    if linked_infer[].degree > ctx[].p_infer_graph[].k {
                        degree++
                    }
                }
                elif linked_infer[].degree >= ctx[].p_infer_graph[].k {
                    degree++
                }
            }
            elif register_mask_get(dst_infer[].linked_hard_mask, linked_infer[].reg_kind)             and linked_infer[].degree >= ctx[].p_infer_graph[].k {
                degree++
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < (? (dst_infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((dst_infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j, 1)
    }
    loop i: u64 = 0 while i < (? (src_infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((src_infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_infer[].linked_pseudo_names[i]))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        linked_infer: *struc InferenceRegister =         @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
            if linked_infer[].degree > ctx[].p_infer_graph[].k {
                degree++
            }
            mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j, 0)
        }
        elif linked_infer[].degree >= ctx[].p_infer_graph[].k {
            degree++
        }
    }
    loop i: u64 = 0 while i < (? (dst_infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((dst_infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
            linked_infer: *struc InferenceRegister =             @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if linked_infer[].degree >= ctx[].p_infer_graph[].k {
                degree++
            }
        }
    }
    return degree < ctx[].p_infer_graph[].k
}
fn coal_george_test(ctx: *struc RegAllocContext, reg_kind: i32, infer: *struc InferenceRegister) i32 {
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister =         @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not register_mask_get(linked_infer[].linked_hard_mask, reg_kind)         and linked_infer[].degree >= ctx[].p_infer_graph[].k {
            return 0
        }
    }
    return 1
}
fn coal_conservative_tests(ctx: *struc RegAllocContext, src_infer: *struc InferenceRegister, dst_infer: *struc InferenceRegister) i32 {
    if coal_briggs_test(ctx, src_infer, dst_infer) {
        return 1
    }
    elif src_infer[].reg_kind ~= 14 {
        return coal_george_test(ctx, src_infer[].reg_kind, dst_infer)
    }
    elif dst_infer[].reg_kind ~= 14 {
        return coal_george_test(ctx, dst_infer[].reg_kind, src_infer)
    }
    else {
        return 0
    }
}
fn coal_pseudo_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, merge_idx: u64, keep_idx: u64) none {
    merge_name: u64 = ctx[].dfa_o2[].data_name_map[merge_idx - 26]
    keep_name: u64 = ctx[].dfa_o2[].data_name_map[keep_idx - 26]
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                infer_rm_pseudo_edge(linked_infer, merge_name)
                infer_add_reg_edge(ctx, linked_infer[].reg_kind, keep_name)
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister =         @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        infer_rm_pseudo_edge(linked_infer, merge_name)
        infer_add_pseudo_edges(ctx, keep_name, infer[].linked_pseudo_names[i])
    }
    infer_rm_unpruned_pseudo_name(ctx, merge_name)
}
fn coal_hard_infer_reg(ctx: *struc RegAllocContext, reg_kind: i32, infer: *struc InferenceRegister, merge_idx: u64) none {
    merge_name: u64 = ctx[].dfa_o2[].data_name_map[merge_idx - 26]
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                infer_rm_pseudo_edge(linked_infer, merge_name)
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister =         @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        infer_rm_pseudo_edge(linked_infer, merge_name)
        infer_add_reg_edge(ctx, reg_kind, infer[].linked_pseudo_names[i])
    }
    infer_rm_unpruned_pseudo_name(ctx, merge_name)
}
fn coal_infer_regs(ctx: *struc RegAllocContext, node: *struc AsmMov) i32 {
    src_infer: *struc InferenceRegister = 0
    dst_infer: *struc InferenceRegister = 0
    src_idx: u64 = get_coalesced_idx(ctx, node[].src)
    dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
    if get_coalescable_infer_regs(ctx, @src_infer, @dst_infer, src_idx, dst_idx)     and coal_conservative_tests(ctx, src_infer, dst_infer) {
        if src_idx < 26 {
            coal_hard_infer_reg(ctx, src_infer[].reg_kind, dst_infer, dst_idx)
            ctx[].dfa[].open_data_map[dst_idx - 26] = src_idx
        }
        else {
            if dst_idx < 26 {
                coal_hard_infer_reg(ctx, dst_infer[].reg_kind, src_infer, src_idx)
            }
            else {
                coal_pseudo_infer_reg(ctx, src_infer, src_idx, dst_idx)
            }
            ctx[].dfa[].open_data_map[src_idx - 26] = dst_idx
        }
        return 1
    }
    else {
        return 0
    }
}
fn coal_op_reg(ctx: *struc RegAllocContext, name: u64, coalesced_idx: u64) *struc AsmOperand {
    if coalesced_idx < ctx[].dfa[].set_size and coalesced_idx ~= ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof(ctx[].cfg[].identifier_id_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value) {
        if coalesced_idx < 26 {
            reg_kind: i32 = ctx[].hard_regs[coalesced_idx].reg_kind
            return gen_register(reg_kind)
        }
        else {
            set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof(ctx[].frontend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].type == 8)
            name = ctx[].dfa_o2[].data_name_map[coalesced_idx - 26]
            ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof(ctx[].p_infer_graph[].pseudo_reg_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
            return make_AsmPseudo(name)
        }
    }
    else {
        return 0
    }
}
fn coal_mov_instr(ctx: *struc RegAllocContext, node: *struc AsmMov, instr_idx: u64, block_id: u64) none {
    src_idx: u64 = get_coalesced_idx(ctx, node[].src)
    dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
    if src_idx < ctx[].dfa[].set_size and src_idx == dst_idx {
        cfg_rm_block_instr(ctx, instr_idx, block_id)
    }
    else {
        if node[].src[].type == 252 {
            op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
            if op_reg {
                if op_reg ~= node[].src {
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = 0
                }
                ;
            }
        }
        if node[].dst[].type == 252 {
            op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
            if op_reg {
                if op_reg ~= node[].dst {
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = 0
                }
                ;
            }
        }
    }
}
fn coal_mov_sx_instr(ctx: *struc RegAllocContext, node: *struc AsmMovSx) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_zero_extend_instr(ctx: *struc RegAllocContext, node: *struc AsmMovZeroExtend) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_lea_instr(ctx: *struc RegAllocContext, node: *struc AsmLea) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_cvttsd2si_instr(ctx: *struc RegAllocContext, node: *struc AsmCvttsd2si) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_cvtsi2sd_instr(ctx: *struc RegAllocContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_unary_instr(ctx: *struc RegAllocContext, node: *struc AsmUnary) none {
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_binary_instr(ctx: *struc RegAllocContext, node: *struc AsmBinary) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_cmp_instr(ctx: *struc RegAllocContext, node: *struc AsmCmp) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_idiv_instr(ctx: *struc RegAllocContext, node: *struc AsmIdiv) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_div_instr(ctx: *struc RegAllocContext, node: *struc AsmDiv) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_set_cc_instr(ctx: *struc RegAllocContext, node: *struc AsmSetCC) none {
    if node[].dst[].type == 252 {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            if op_reg ~= node[].dst {
                free_AsmOperand(@node[].dst)
                node[].dst = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_push_instr(ctx: *struc RegAllocContext, node: *struc AsmPush) none {
    if node[].src[].type == 252 {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            if op_reg ~= node[].src {
                free_AsmOperand(@node[].src)
                node[].src = op_reg
                op_reg = 0
            }
            ;
        }
    }
}
fn coal_instr(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].type {
        -> 273 {
            coal_mov_instr(ctx, @node[].get._AsmMov, instr_idx, block_id)
        }
        break
        -> 274 {
            coal_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> 275 {
            coal_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> 276 {
            coal_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> 277 {
            coal_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> 278 {
            coal_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> 279 {
            coal_unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> 280 {
            coal_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> 281 {
            coal_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> 282 {
            coal_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> 283 {
            coal_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> 287 {
            coal_set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> 289 {
            coal_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> 284 {
            -> 291 {
                break
            }
        }
        otherwise {
            break
        }
    }
}
fn coalesce_registers(ctx: *struc RegAllocContext) i32 {
    {
        open_data_map_size: u64 = ctx[].dfa[].set_size - 26
        if (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) < open_data_map_size {
            loop .. while 0 {
                (? (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity else 0) < cast<u64>((open_data_map_size)) then ((((ctx[].dfa[].open_data_map)) = stbds_arrgrowf(((ctx[].dfa[].open_data_map)), sizeof(((ctx[].dfa[].open_data_map))[]), (0), (cast<u64>((open_data_map_size)))))) and 0 else 0)
                ?                 (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length = cast<u64>((open_data_map_size)) else 0
            }
        }
    }
    loop i: u64 = 26 while i < ctx[].dfa[].set_size .. ++i {
        ctx[].dfa[].open_data_map[i - 26] = i
    }
    {
        is_fixed_point: i32 = 1
        loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] and (ctx[].p_instrs[])[instr_idx][].type == 273             and coal_infer_regs(ctx, @(ctx[].p_instrs[])[instr_idx][].get._AsmMov) {
                is_fixed_point = 0
            }
        }
        if is_fixed_point {
            return 0
        }
    }
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while             instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    coal_instr(ctx, instr_idx, block_id)
                }
            }
        }
    }
    return 1
}
fn alloc_fun_toplvl(ctx: *struc RegAllocContext, node: *struc AsmFunction) none {
    ctx[].p_instrs = @node[].instructions
    init_control_flow_graph(ctx)
    label Ldowhile
    if init_inference_graph(ctx, node[].name) {
        if ctx[].is_with_coal and coalesce_registers(ctx) {
            if ((? (ctx[].infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0)             and ((? (ctx[].sse_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
                jump Lbreak
            }
            jump Ldowhile
        }
        {
            backend_fun: *struc BackendFun = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].backend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendFun
            ctx[].p_backend_fun = backend_fun
        }
        reallocate_registers(ctx)
        ctx[].p_backend_fun = 0
    }
    label Lbreak
    ctx[].p_infer_graph = 0
    ctx[].p_instrs = 0
}
fn alloc_toplvl(ctx: *struc RegAllocContext, node: *struc AsmTopLevel) none {
    match node[].type {
        -> 294 {
            alloc_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> 295 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 1808, "/home/romain/proj/planet/selfhost/wheelcc/optimizer/reg_alloc.c")
        }
    }
}
fn alloc_program(ctx: *struc RegAllocContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        alloc_toplvl(ctx, node[].top_levels[i])
    }
}
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none {
    ctx: struc RegAllocContext;
    {
        ctx.backend = backend
        ctx.frontend = frontend
        ctx.is_with_coal = optim_2_code > 1u
        ctx.hard_regs[0].reg_kind = 0
        ctx.hard_regs[1].reg_kind = 1
        ctx.hard_regs[2].reg_kind = 2
        ctx.hard_regs[3].reg_kind = 3
        ctx.hard_regs[4].reg_kind = 4
        ctx.hard_regs[5].reg_kind = 5
        ctx.hard_regs[6].reg_kind = 6
        ctx.hard_regs[7].reg_kind = 7
        ctx.hard_regs[8].reg_kind = 10
        ctx.hard_regs[9].reg_kind = 11
        ctx.hard_regs[10].reg_kind = 12
        ctx.hard_regs[11].reg_kind = 13
        ctx.hard_regs[12].reg_kind = 16
        ctx.hard_regs[13].reg_kind = 17
        ctx.hard_regs[14].reg_kind = 18
        ctx.hard_regs[15].reg_kind = 19
        ctx.hard_regs[16].reg_kind = 20
        ctx.hard_regs[17].reg_kind = 21
        ctx.hard_regs[18].reg_kind = 22
        ctx.hard_regs[19].reg_kind = 23
        ctx.hard_regs[20].reg_kind = 24
        ctx.hard_regs[21].reg_kind = 25
        ctx.hard_regs[22].reg_kind = 26
        ctx.hard_regs[23].reg_kind = 27
        ctx.hard_regs[24].reg_kind = 28
        ctx.hard_regs[25].reg_kind = 29
        loop i: u64 = 0 while i < 26 .. ++i {
            ctx.hard_regs[i].linked_pseudo_names = 0
        }
        ctx.cfg = make_ControlFlowGraph()
        ctx.dfa = make_DataFlowAnalysis()
        ctx.dfa_o2 = make_DataFlowAnalysisO2()
        ctx.infer_graph = make_InferenceGraph(0)
        ctx.sse_infer_graph = make_InferenceGraph(1)
    }
    alloc_program(@ctx, node)
    loop i: u64 = 0 while i < 26 .. ++i {
        if ctx.hard_regs[i].linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? (ctx.hard_regs[i].linked_pseudo_names) then free((cast<*struc stbds_array_header>((ctx.hard_regs[i].linked_pseudo_names)) - 1)) else cast<none>(0)))
                (ctx.hard_regs[i].linked_pseudo_names) = 0
            }
            ctx.hard_regs[i].linked_pseudo_names = 0
        }
        ;
    }
    free_ControlFlowGraph(@ctx.cfg)
    free_DataFlowAnalysis(@ctx.dfa)
    free_DataFlowAnalysisO2(@ctx.dfa_o2)
    free_InferenceGraph(@ctx.infer_graph)
    free_InferenceGraph(@ctx.sse_infer_graph)
}
