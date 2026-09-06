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
type struc PairTIdentifierTLong(key: u64, value: i64)
type struc StackFixContext(    backend: *struc BackEndContext    , stack_bytes: i64    , pseudo_stack_map: *struc PairTIdentifierTLong    , p_fix_instrs: ***struc AsmInstruction    )
fn pseudo_data(node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    name: u64 = node[].name
    free_AsmOperand(pseudo_op)
    pseudo_op[] = make_AsmData(name, 0l)
}
fn pseudo_mem_data(node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    name: u64 = node[].name
    offset: i64 = node[].offset
    free_AsmOperand(pseudo_op)
    pseudo_op[] = make_AsmData(name, offset)
}
fn pseudo_memory(ctx: *struc StackFixContext, node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    value: i64 = -1l * ((? ((? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].pseudo_stack_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp])[].value)
    free_AsmOperand(pseudo_op)
    pseudo_op[] = gen_memory(15, value)
}
fn pseudo_mem_memory(ctx: *struc StackFixContext, node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    value: i64 = -1l * (((? ((? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].pseudo_stack_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp])[].value) - node[].offset)
    free_AsmOperand(pseudo_op)
    pseudo_op[] = gen_memory(15, value)
}
fn align_offset_stack_bytes(ctx: *struc StackFixContext, alignment: i32) none {
    offset: i64 = ctx[].stack_bytes % alignment
    if offset ~= 0l {
        ctx[].stack_bytes += alignment - offset
    }
}
fn align_offset_pseudo(ctx: *struc StackFixContext, size: i64, alignment: i32) none {
    ctx[].stack_bytes += size
    align_offset_stack_bytes(ctx, alignment)
}
fn alloc_offset_pseudo(ctx: *struc StackFixContext, asm_type: *struc AssemblyType) none {
    match asm_type[].type {
        -> 38 {
            align_offset_pseudo(ctx, 1l, 1)
        }
        break
        -> 39 {
            align_offset_pseudo(ctx, 4l, 4)
        }
        break
        -> 40 {
            -> 41 {
                align_offset_pseudo(ctx, 8l, 8)
            }
        }
        break
        otherwise {
            panic_sigabrt("abort", 83, "/home/romain/proj/planet/selfhost/wheelcc/backend/stack_fix.c")
        }
    }
}
fn alloc_offset_pseudo_mem(ctx: *struc StackFixContext, asm_type: *struc AssemblyType) none {
    if asm_type[].type == 42 {
        bytearray_type: *struc ByteArray = @asm_type[].get._ByteArray
        align_offset_pseudo(ctx, bytearray_type[].size, bytearray_type[].alignment)
    }
    else {
        panic_sigabrt("abort", 93, "/home/romain/proj/planet/selfhost/wheelcc/backend/stack_fix.c")
    }
}
fn repl_pseudo_op(ctx: *struc StackFixContext, node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    if (? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].pseudo_stack_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp) == -1 {
        backend_obj: *struc BackendObj = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].backend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendObj
        if backend_obj[].is_static {
            pseudo_data(node, pseudo_op)
            return none
        }
        else {
            alloc_offset_pseudo(ctx, backend_obj[].asm_type)
            loop .. while 0 {
                (ctx[].pseudo_stack_map) = stbds_hmput_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].pseudo_stack_map)[].key, 0)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].value = (ctx[].stack_bytes)
            }
        }
    }
    pseudo_memory(ctx, node, pseudo_op)
}
fn repl_pseudo_mem_op(ctx: *struc StackFixContext, node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    if (? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].pseudo_stack_map)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp) == -1 {
        backend_obj: *struc BackendObj = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].backend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendObj
        if backend_obj[].is_static {
            pseudo_mem_data(node, pseudo_op)
            return none
        }
        else {
            alloc_offset_pseudo_mem(ctx, backend_obj[].asm_type)
            loop .. while 0 {
                (ctx[].pseudo_stack_map) = stbds_hmput_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof(ctx[].pseudo_stack_map)[].key, 0)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].value = (ctx[].stack_bytes)
            }
        }
    }
    pseudo_mem_memory(ctx, node, pseudo_op)
}
fn repl_mov_pseudo(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_mov_sx_pseudo(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_zero_extend_pseudo(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_lea_pseudo(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_cvttsd2si_pseudo(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_cvtsi2sd_pseudo(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_unary(ctx: *struc StackFixContext, node: *struc AsmUnary) none {
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_binary_pseudo(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_cmp_pseudo(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_idiv_pseudo(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_div_pseudo(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_set_cc_pseudo(ctx: *struc StackFixContext, node: *struc AsmSetCC) none {
    match node[].dst[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_push_pseudo(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    match node[].src[].type {
        -> 252 {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> 255 {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}
fn repl_pseudo_regs(ctx: *struc StackFixContext, node: *struc AsmInstruction) none {
    match node[].type {
        -> 273 {
            repl_mov_pseudo(ctx, @node[].get._AsmMov)
        }
        break
        -> 274 {
            repl_mov_sx_pseudo(ctx, @node[].get._AsmMovSx)
        }
        break
        -> 275 {
            repl_zero_extend_pseudo(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> 276 {
            repl_lea_pseudo(ctx, @node[].get._AsmLea)
        }
        break
        -> 277 {
            repl_cvttsd2si_pseudo(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> 278 {
            repl_cvtsi2sd_pseudo(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> 279 {
            repl_unary(ctx, @node[].get._AsmUnary)
        }
        break
        -> 280 {
            repl_binary_pseudo(ctx, @node[].get._AsmBinary)
        }
        break
        -> 281 {
            repl_cmp_pseudo(ctx, @node[].get._AsmCmp)
        }
        break
        -> 282 {
            repl_idiv_pseudo(ctx, @node[].get._AsmIdiv)
        }
        break
        -> 283 {
            repl_div_pseudo(ctx, @node[].get._AsmDiv)
        }
        break
        -> 287 {
            repl_set_cc_pseudo(ctx, @node[].get._AsmSetCC)
        }
        break
        -> 289 {
            repl_push_pseudo(ctx, @node[].get._AsmPush)
        }
        break
        otherwise {
            break
        }
    }
}
pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(259)
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
    return make_AsmBinary(@binop, @asm_type, @src, @dst)
}
fn push_fix_instr(ctx: *struc StackFixContext, instr: *struc AsmInstruction) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_fix_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].capacity) then (((ctx[].p_fix_instrs[]) = stbds_arrgrowf((ctx[].p_fix_instrs[]), sizeof((ctx[].p_fix_instrs[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_fix_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length++] = (instr)
        }
        instr = 0
    }
}
fn swap_fix_instr_back(ctx: *struc StackFixContext) none {
    swap_instr: *struc AsmInstruction = 0
    instr_back_1: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
    instr_back_2: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 2]
    if instr_back_1[] ~= swap_instr {
        free_AsmInstruction(@swap_instr)
        swap_instr = instr_back_1[]
        instr_back_1[] = 0
    }
    ;
    if instr_back_2[] ~= instr_back_1[] {
        free_AsmInstruction(@instr_back_1[])
        instr_back_1[] = instr_back_2[]
        instr_back_2[] = 0
    }
    ;
    if swap_instr ~= instr_back_2[] {
        free_AsmInstruction(@instr_back_2[])
        instr_back_2[] = swap_instr
        swap_instr = 0
    }
    ;
}
fn fix_alloc_stack_bytes(ctx: *struc StackFixContext, callee_saved_size: i64) none {
    callee_saved_bytes: i64 = callee_saved_size * 8l
    ctx[].stack_bytes += callee_saved_bytes
    if ctx[].stack_bytes > 0l {
        align_offset_stack_bytes(ctx, 16)
        ctx[].stack_bytes -= callee_saved_bytes
        (ctx[].p_fix_instrs[])[0] = alloc_stack_bytes(ctx[].stack_bytes)
    }
}
fn push_callee_saved_regs(ctx: *struc StackFixContext, callee_saved_regs: **struc AsmOperand) none {
    loop i: u64 = 0 while i < (? (callee_saved_regs) then (cast<*struc stbds_array_header>((callee_saved_regs)) - 1)[].length else 0) .. ++i {
        src: *struc AsmOperand = 0
        if callee_saved_regs[i] ~= src {
            free_AsmOperand(@src)
            src = callee_saved_regs[i]
            (src)[]._ref_count++
        }
        ;
        push_fix_instr(ctx, make_AsmPush(@src))
    }
}
fn pop_callee_saved_regs(ctx: *struc StackFixContext, callee_saved_regs: **struc AsmOperand) none {
    loop i: u64 = (? (callee_saved_regs) then (cast<*struc stbds_array_header>((callee_saved_regs)) - 1)[].length else 0) while i-- > 0 {
        ;
        reg_kind: i32 = register_mask_kind(@callee_saved_regs[i][].get._AsmRegister.reg)
        reg: struc AsmReg = make_AsmReg(204)
        match reg_kind {
            -> 1 {
                reg = make_AsmReg(206)
                break
            }
            -> 10 {
                reg = make_AsmReg(215)
                break
            }
            -> 11 {
                reg = make_AsmReg(216)
                break
            }
            -> 12 {
                reg = make_AsmReg(217)
                break
            }
            -> 13 {
                reg = make_AsmReg(218)
                break
            }
            otherwise {
                panic_sigabrt("abort", 501, "/home/romain/proj/planet/selfhost/wheelcc/backend/stack_fix.c")
            }
        }
        push_fix_instr(ctx, make_AsmPop(@reg))
    }
}
fn is_op_addr(node: *struc AsmOperand) i32 {
    match node[].type {
        -> 253 {
            -> 254 {
                -> 256 {
                    return 1
                }
            }
        }
        otherwise {
            return 0
        }
    }
}
fn mov_dbl_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(30)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn mov_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    if node[].dst[].type == 251 {
        if node[].asm_type[].type ~= 40 {
            free_AssemblyType(@node[].asm_type)
            node[].asm_type = make_QuadWord()
        }
        return none
    }
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn mov_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn fix_mov_instr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    if node[].asm_type[].type == 41 {
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            mov_dbl_from_addr_to_addr(ctx, node)
        }
    }
    else {
        if node[].src[].type == 250 and node[].src[].get._AsmImm.is_quad {
            mov_from_quad_imm(ctx, node)
        }
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            mov_from_addr_to_addr(ctx, node)
        }
    }
}
fn mov_sx_from_imm(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type_src ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_src
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn mov_sx_to_addr(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    src: *struc AsmOperand = gen_register(9)
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = 0
    if node[].asm_type_dst ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_dst
        (asm_type)[]._ref_count++
    }
    ;
    if src ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}
fn fix_mov_sx_instr(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    if node[].src[].type == 250 {
        mov_sx_from_imm(ctx, node)
    }
    if is_op_addr(node[].dst) {
        mov_sx_to_addr(ctx, node)
    }
}
fn byte_zero_extend_from_imm(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = make_Byte()
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn byte_zero_extend_to_addr(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    src: *struc AsmOperand = gen_register(9)
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = 0
    if node[].asm_type_dst ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_dst
        (asm_type)[]._ref_count++
    }
    ;
    if src ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}
fn zero_extend_as_mov(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) *struc AsmMov {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = make_LongWord()
    instr_back: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
    free_AsmInstruction(instr_back)
    instr_back[] = make_AsmMov(@asm_type, @src, @dst)
    return @(instr_back[])[].get._AsmMov
}
fn zero_extend_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = gen_register(9)
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = make_QuadWord()
    if src ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}
fn fix_zero_extend_instr(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    if node[].asm_type_src[].type == 38 {
        if node[].src[].type == 250 {
            byte_zero_extend_from_imm(ctx, node)
        }
        if is_op_addr(node[].dst) {
            byte_zero_extend_to_addr(ctx, node)
        }
    }
    else {
        mov: *struc AsmMov = zero_extend_as_mov(ctx, node)
        if is_op_addr(mov[].dst) {
            zero_extend_to_addr(ctx, mov)
        }
    }
}
fn lea_to_addr(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    src: *struc AsmOperand = gen_register(9)
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = make_QuadWord()
    if src ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}
fn fix_lea_instr(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    if is_op_addr(node[].dst) {
        lea_to_addr(ctx, node)
    }
}
fn cvttsd2si_to_addr(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    src: *struc AsmOperand = gen_register(9)
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if src ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}
fn fix_cvttsd2si_instr(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    if is_op_addr(node[].dst) {
        cvttsd2si_to_addr(ctx, node)
    }
}
fn cvtsi2sd_from_imm(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn cvtsi2sd_to_addr(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    src: *struc AsmOperand = gen_register(31)
    dst: *struc AsmOperand = 0
    if node[].dst ~= dst {
        free_AsmOperand(@dst)
        dst = node[].dst
        node[].dst = 0
    }
    ;
    asm_type: *struc AssemblyType = make_BackendDouble()
    if src ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}
fn fix_cvtsi2sd_instr(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].type == 250 {
        cvtsi2sd_from_imm(ctx, node)
    }
    if is_op_addr(node[].dst) {
        cvtsi2sd_to_addr(ctx, node)
    }
}
fn binary_dbl_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = 0
    if node[].dst ~= src {
        free_AsmOperand(@src)
        src = node[].dst
        node[].dst = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(31)
    asm_type: *struc AssemblyType = make_BackendDouble()
    if dst ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    ;
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
        asm_type_cp: *struc AssemblyType = 0
        if asm_type ~= asm_type_cp {
            free_AssemblyType(@asm_type_cp)
            asm_type_cp = asm_type
            (asm_type_cp)[]._ref_count++
        }
        ;
        push_fix_instr(ctx, make_AsmMov(@asm_type_cp, @src_cp, @dst_cp))
    }
    swap_fix_instr_back(ctx)
    push_fix_instr(ctx, make_AsmMov(@asm_type, @dst, @src))
}
fn binary_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn binary_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn binary_imul_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = 0
    if node[].dst ~= src {
        free_AsmOperand(@src)
        src = node[].dst
        node[].dst = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(9)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    ;
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
        asm_type_cp: *struc AssemblyType = 0
        if asm_type ~= asm_type_cp {
            free_AssemblyType(@asm_type_cp)
            asm_type_cp = asm_type
            (asm_type_cp)[]._ref_count++
        }
        ;
        push_fix_instr(ctx, make_AsmMov(@asm_type_cp, @src_cp, @dst_cp))
    }
    swap_fix_instr_back(ctx)
    push_fix_instr(ctx, make_AsmMov(@asm_type, @dst, @src))
}
fn binary_shx_from_not_imm(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    if node[].src[].type == 251 and register_mask_kind(@node[].src[].get._AsmRegister.reg) == 2 {
        return none
    }
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(2)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn fix_binary_instr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    if node[].asm_type[].type == 41 {
        if is_op_addr(node[].dst) {
            binary_dbl_to_addr(ctx, node)
        }
    }
    else {
        match node[].binop.type {
            -> 258 {
                -> 259 {
                    -> 262 {
                        -> 263 {
                            -> 264 {
                                if node[].src[].type == 250 and node[].src[].get._AsmImm.is_quad {
                                    binary_from_quad_imm(ctx, node)
                                }
                                if is_op_addr(node[].src) and is_op_addr(node[].dst) {
                                    binary_from_addr_to_addr(ctx, node)
                                }
                                break
                            }
                        }
                    }
                }
            }
            -> 260 {
                if node[].src[].type == 250 and node[].src[].get._AsmImm.is_quad {
                    binary_from_quad_imm(ctx, node)
                }
                if is_op_addr(node[].dst) {
                    binary_imul_to_addr(ctx, node)
                }
                break
            }
            -> 265 {
                -> 266 {
                    -> 267 {
                        if node[].src[].type == 250 and node[].src[].get._AsmImm.is_quad {
                            binary_from_quad_imm(ctx, node)
                        }
                        if node[].src[].type ~= 250 {
                            binary_shx_from_not_imm(ctx, node)
                        }
                        break
                    }
                }
            }
            otherwise {
                break
            }
        }
    }
}
fn cmp_dbl_to_addr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = 0
    if node[].dst ~= src {
        free_AsmOperand(@src)
        src = node[].dst
        node[].dst = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(31)
    asm_type: *struc AssemblyType = make_BackendDouble()
    if dst ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn cmp_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn cmp_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn cmp_to_imm(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = 0
    if node[].dst ~= src {
        free_AsmOperand(@src)
        src = node[].dst
        node[].dst = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(9)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].dst {
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn fix_cmp_instr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    if node[].asm_type[].type == 41 {
        if is_op_addr(node[].dst) {
            cmp_dbl_to_addr(ctx, node)
        }
    }
    else {
        if node[].src[].type == 250 and node[].src[].get._AsmImm.is_quad {
            cmp_from_quad_imm(ctx, node)
        }
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            cmp_from_addr_to_addr(ctx, node)
        }
        elif node[].dst[].type == 250 {
            cmp_to_imm(ctx, node)
        }
    }
}
fn idiv_from_imm(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn fix_idiv_instr(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    if node[].src[].type == 250 {
        idiv_from_imm(ctx, node)
    }
}
fn div_from_imm(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = 0
    if node[].asm_type ~= asm_type {
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    ;
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn fix_div_instr(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    if node[].src[].type == 250 {
        div_from_imm(ctx, node)
    }
}
fn push_dbl_from_xmm_reg(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    src_reg: *struc AsmOperand = 0
    if node[].src ~= src_reg {
        free_AsmOperand(@src_reg)
        src_reg = node[].src
        node[].src = 0
    }
    ;
    asm_type_src: *struc AssemblyType = make_QuadWord()
    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(259)
        src: *struc AsmOperand = make_AsmImm(8ul, 1, 0, 0)
        dst: *struc AsmOperand = gen_register(14)
        asm_type_src_cp: *struc AssemblyType = 0
        if asm_type_src ~= asm_type_src_cp {
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        ;
        instr_back: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
        free_AsmInstruction(instr_back)
        instr_back[] = make_AsmBinary(@binop, @asm_type_src_cp, @src, @dst)
    }
    {
        dst: *struc AsmOperand = gen_memory(14, 0l)
        push_fix_instr(ctx, make_AsmMov(@asm_type_src, @src_reg, @dst))
    }
}
fn push_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    src: *struc AsmOperand = 0
    if node[].src ~= src {
        free_AsmOperand(@src)
        src = node[].src
        node[].src = 0
    }
    ;
    dst: *struc AsmOperand = gen_register(8)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    ;
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}
fn fix_push_instr(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    if node[].src[].type == 251 {
        reg_kind: i32 = register_mask_kind(@node[].src[].get._AsmRegister.reg)
        if reg_kind ~= 14 and register_mask_bit(reg_kind) > 11 {
            push_dbl_from_xmm_reg(ctx, node)
        }
    }
    elif node[].src[].type == 250 and node[].src[].get._AsmImm.is_quad {
        push_from_quad_imm(ctx, node)
    }
}
fn fix_instr(ctx: *struc StackFixContext, node: *struc AsmInstruction) none {
    match node[].type {
        -> 273 {
            fix_mov_instr(ctx, @node[].get._AsmMov)
        }
        break
        -> 274 {
            fix_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> 275 {
            fix_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> 276 {
            fix_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> 277 {
            fix_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> 278 {
            fix_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> 280 {
            fix_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> 281 {
            fix_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> 282 {
            fix_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> 283 {
            fix_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> 289 {
            fix_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        otherwise {
            break
        }
    }
}
fn fix_fun_toplvl(ctx: *struc StackFixContext, node: *struc AsmFunction) none {
    instructions: **struc AsmInstruction = 0
    if node[].instructions ~= instructions {
        if instructions {
            loop .. while 0 {
                cast<none>((? (instructions) then free((cast<*struc stbds_array_header>((instructions)) - 1)) else cast<none>(0)))
                (instructions) = 0
            }
            instructions = 0
        }
        ;
        instructions = node[].instructions
        node[].instructions = 0
    }
    ;
    backend_fun: *struc BackendFun = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].backend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendFun
    if node[].instructions {
        (cast<*struc stbds_array_header>((node[].instructions)) - 1)[].length = 0
    }
    ;
    (((node[].instructions) = stbds_arrgrowf((node[].instructions), sizeof((node[].instructions)[]), (0), ((? (instructions) then (cast<*struc stbds_array_header>((instructions)) - 1)[].length else 0)))))
    ctx[].stack_bytes = ? node[].is_ret_memory then 8l else 0l
    if ctx[].pseudo_stack_map {
        loop .. while 0 {
            cast<none>((? (ctx[].pseudo_stack_map) ~= 0 then stbds_hmfree_func((ctx[].pseudo_stack_map) - 1, sizeof((ctx[].pseudo_stack_map)[])) else cast<none>(0)))
            (ctx[].pseudo_stack_map) = 0
        }
        ctx[].pseudo_stack_map = 0
    }
    ;
    ctx[].p_fix_instrs = @node[].instructions
    loop .. while 0 {
        (? (not (ctx[].p_fix_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].capacity) then (((ctx[].p_fix_instrs[]) = stbds_arrgrowf((ctx[].p_fix_instrs[]), sizeof((ctx[].p_fix_instrs[])[]), (1), (0))) and 0) else 0)
        (ctx[].p_fix_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length++] = (0)
    }
    is_ret: i32 = 0
    push_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
    loop i: u64 = 0 while i < (? (instructions) then (cast<*struc stbds_array_header>((instructions)) - 1)[].length else 0) .. ++i {
        if instructions[i] {
            if instructions[i][].type == 292 {
                pop_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
                is_ret = 1
            }
            push_fix_instr(ctx, instructions[i])
            instructions[i] = 0
            repl_pseudo_regs(ctx, (ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1])
            fix_instr(ctx, (ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1])
        }
    }
    if not is_ret {
        pop_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
    }
    {
        callee_saved_size: i64 = cast<i64>((? (backend_fun[].callee_saved_regs) then (cast<*struc stbds_array_header>((backend_fun[].callee_saved_regs)) - 1)[].length else 0))
        fix_alloc_stack_bytes(ctx, callee_saved_size)
    }
    ctx[].p_fix_instrs = 0
    if instructions {
        loop .. while 0 {
            cast<none>((? (instructions) then free((cast<*struc stbds_array_header>((instructions)) - 1)) else cast<none>(0)))
            (instructions) = 0
        }
        instructions = 0
    }
    ;
}
fn fix_toplvl(ctx: *struc StackFixContext, node: *struc AsmTopLevel) none {
    match node[].type {
        -> 294 {
            fix_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> 295 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 1066, "/home/romain/proj/planet/selfhost/wheelcc/backend/stack_fix.c")
        }
    }
}
fn fix_program(ctx: *struc StackFixContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        fix_toplvl(ctx, node[].top_levels[i])
    }
}
pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none {
    ctx: struc StackFixContext;
    {
        ctx.backend = backend
        ctx.stack_bytes = 0l
        ctx.pseudo_stack_map = 0
    }
    fix_program(@ctx, node)
    if ctx.pseudo_stack_map {
        loop .. while 0 {
            cast<none>((? (ctx.pseudo_stack_map) ~= 0 then stbds_hmfree_func((ctx.pseudo_stack_map) - 1, sizeof((ctx.pseudo_stack_map)[])) else cast<none>(0)))
            (ctx.pseudo_stack_map) = 0
        }
        ctx.pseudo_stack_map = 0
    }
    ;
}
