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
type struc FileIoContext;
type struc Pairhash_thash_t(key: u64, value: u64)
type struc FileOpenLine(    linenum: u64    , total_linenum: u64    , filename: string    )
type struc TokenInfo(    tok_pos: i32    , tok_len: i32    , total_linenum: u64    )
type struc ErrorsContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , msg: [1024]char    , is_stdout: i32    , info_at_buf: u64    , info_at_map: *struc Pairhash_thash_t    , fopen_lines: *struc FileOpenLine    , token_infos: *struc TokenInfo    )
pub fn panic_sigabrt(msg: string, line: i32, file: string) none;
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
pub fn make_AsmReg(type: i32) struc AsmReg {
    self: struc AsmReg = $(type)
    match type {
        -> 204 {
            -> 205 {
                -> 206 {
                    -> 207 {
                        -> 208 {
                            -> 209 {
                                -> 210 {
                                    -> 211 {
                                        -> 212 {
                                            -> 213 {
                                                -> 214 {
                                                    -> 215 {
                                                        -> 216 {
                                                            -> 217 {
                                                                -> 218 {
                                                                    -> 219 {
                                                                        -> 220 {
                                                                            -> 221 {
                                                                                -> 222 {
                                                                                    -> 223 {
                                                                                        -> 224 {
                                                                                            -> 225 {
                                                                                                -> 226 {
                                                                                                    -> 227 {
                                                                                                        -> 228 {
                                                                                                            -> 229 {
                                                                                                                -> 230 {
                                                                                                                    -> 231 {
                                                                                                                        -> 232 {
                                                                                                                            -> 233 {
                                                                                                                                -> 234 {
                                                                                                                                    -> 235 {
                                                                                                                                        -> 236 {
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
            panic_sigabrt("abort", 54, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
}
pub fn make_AsmCondCode(type: i32) struc AsmCondCode {
    self: struc AsmCondCode = $(type)
    match type {
        -> 237 {
            -> 238 {
                -> 239 {
                    -> 240 {
                        -> 241 {
                            -> 242 {
                                -> 243 {
                                    -> 244 {
                                        -> 245 {
                                            -> 246 {
                                                -> 247 {
                                                    -> 248 {
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
        otherwise {
            panic_sigabrt("abort", 75, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
}
pub fn make_AsmOperand(none) *struc AsmOperand {
    self: *struc AsmOperand = 0
    loop .. while 0 {
        loop .. while 0 {
            free_AsmOperand(@self)
            self = cast<*struc AsmOperand>(malloc(sizeof<struc AsmOperand>))
            if not self {
                panic_sigabrt("alloc " "AsmOperand", 81, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 249
    return self
}
pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 250
    self[].get._AsmImm.value = value
    self[].get._AsmImm.is_byte = is_byte
    self[].get._AsmImm.is_quad = is_quad
    self[].get._AsmImm.is_neg = is_neg
    return self
}
pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 251
    self[].get._AsmRegister.reg = reg[]
    return self
}
pub fn make_AsmPseudo(name: u64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 252
    self[].get._AsmPseudo.name = name
    return self
}
pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 253
    self[].get._AsmMemory.value = value
    self[].get._AsmMemory.reg = reg[]
    return self
}
pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 254
    self[].get._AsmData.name = name
    self[].get._AsmData.offset = offset
    return self
}
pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 255
    self[].get._AsmPseudoMem.name = name
    self[].get._AsmPseudoMem.offset = offset
    return self
}
pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].type = 256
    self[].get._AsmIndexed.scale = scale
    self[].get._AsmIndexed.reg_base = reg_base[]
    self[].get._AsmIndexed.reg_index = reg_index[]
    return self
}
pub fn free_AsmOperand(self: **struc AsmOperand) none {
    if not self[] {
        return none
    }
    elif (self[])[]._ref_count > 1 {
        (self[])[]._ref_count--
        self[] = 0
        return none
    }
    ;
    match (self[])[].type {
        -> 249 {
            -> 250 {
                break
            }
        }
        -> 251 {
            break
        }
        -> 252 {
            break
        }
        -> 253 {
            break
        }
        -> 254 {
            break
        }
        -> 255 {
            break
        }
        -> 256 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 162, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_AsmBinaryOp(type: i32) struc AsmBinaryOp {
    self: struc AsmBinaryOp = $(type)
    match type {
        -> 257 {
            -> 258 {
                -> 259 {
                    -> 260 {
                        -> 261 {
                            -> 262 {
                                -> 263 {
                                    -> 264 {
                                        -> 265 {
                                            -> 266 {
                                                -> 267 {
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
        otherwise {
            panic_sigabrt("abort", 183, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
}
pub fn make_AsmUnaryOp(type: i32) struc AsmUnaryOp {
    self: struc AsmUnaryOp = $(type)
    match type {
        -> 268 {
            -> 269 {
                -> 270 {
                    -> 271 {
                        return self
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort", 196, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
}
pub fn make_AsmInstruction(none) *struc AsmInstruction {
    self: *struc AsmInstruction = 0
    loop .. while 0 {
        free_AsmInstruction(@self)
        self = cast<*struc AsmInstruction>(malloc(sizeof<struc AsmInstruction>))
        if not self {
            panic_sigabrt("alloc " "AsmInstruction", 202, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    self[].type = 272
    return self
}
pub fn make_AsmMov(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 273
    self[].get._AsmMov.asm_type = 0
    if asm_type[] ~= self[].get._AsmMov.asm_type {
        free_AssemblyType(@self[].get._AsmMov.asm_type)
        self[].get._AsmMov.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmMov.src = 0
    if src[] ~= self[].get._AsmMov.src {
        free_AsmOperand(@self[].get._AsmMov.src)
        self[].get._AsmMov.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmMov.dst = 0
    if dst[] ~= self[].get._AsmMov.dst {
        free_AsmOperand(@self[].get._AsmMov.dst)
        self[].get._AsmMov.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmMovSx(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 274
    self[].get._AsmMovSx.asm_type_src = 0
    if asm_type_src[] ~= self[].get._AsmMovSx.asm_type_src {
        free_AssemblyType(@self[].get._AsmMovSx.asm_type_src)
        self[].get._AsmMovSx.asm_type_src = asm_type_src[]
        asm_type_src[] = 0
    }
    ;
    self[].get._AsmMovSx.asm_type_dst = 0
    if asm_type_dst[] ~= self[].get._AsmMovSx.asm_type_dst {
        free_AssemblyType(@self[].get._AsmMovSx.asm_type_dst)
        self[].get._AsmMovSx.asm_type_dst = asm_type_dst[]
        asm_type_dst[] = 0
    }
    ;
    self[].get._AsmMovSx.src = 0
    if src[] ~= self[].get._AsmMovSx.src {
        free_AsmOperand(@self[].get._AsmMovSx.src)
        self[].get._AsmMovSx.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmMovSx.dst = 0
    if dst[] ~= self[].get._AsmMovSx.dst {
        free_AsmOperand(@self[].get._AsmMovSx.dst)
        self[].get._AsmMovSx.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmMovZeroExtend(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 275
    self[].get._AsmMovZeroExtend.asm_type_src = 0
    if asm_type_src[] ~= self[].get._AsmMovZeroExtend.asm_type_src {
        free_AssemblyType(@self[].get._AsmMovZeroExtend.asm_type_src)
        self[].get._AsmMovZeroExtend.asm_type_src = asm_type_src[]
        asm_type_src[] = 0
    }
    ;
    self[].get._AsmMovZeroExtend.asm_type_dst = 0
    if asm_type_dst[] ~= self[].get._AsmMovZeroExtend.asm_type_dst {
        free_AssemblyType(@self[].get._AsmMovZeroExtend.asm_type_dst)
        self[].get._AsmMovZeroExtend.asm_type_dst = asm_type_dst[]
        asm_type_dst[] = 0
    }
    ;
    self[].get._AsmMovZeroExtend.src = 0
    if src[] ~= self[].get._AsmMovZeroExtend.src {
        free_AsmOperand(@self[].get._AsmMovZeroExtend.src)
        self[].get._AsmMovZeroExtend.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmMovZeroExtend.dst = 0
    if dst[] ~= self[].get._AsmMovZeroExtend.dst {
        free_AsmOperand(@self[].get._AsmMovZeroExtend.dst)
        self[].get._AsmMovZeroExtend.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmLea(src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 276
    self[].get._AsmLea.src = 0
    if src[] ~= self[].get._AsmLea.src {
        free_AsmOperand(@self[].get._AsmLea.src)
        self[].get._AsmLea.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmLea.dst = 0
    if dst[] ~= self[].get._AsmLea.dst {
        free_AsmOperand(@self[].get._AsmLea.dst)
        self[].get._AsmLea.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmCvttsd2si(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 277
    self[].get._AsmCvttsd2si.asm_type = 0
    if asm_type[] ~= self[].get._AsmCvttsd2si.asm_type {
        free_AssemblyType(@self[].get._AsmCvttsd2si.asm_type)
        self[].get._AsmCvttsd2si.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmCvttsd2si.src = 0
    if src[] ~= self[].get._AsmCvttsd2si.src {
        free_AsmOperand(@self[].get._AsmCvttsd2si.src)
        self[].get._AsmCvttsd2si.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmCvttsd2si.dst = 0
    if dst[] ~= self[].get._AsmCvttsd2si.dst {
        free_AsmOperand(@self[].get._AsmCvttsd2si.dst)
        self[].get._AsmCvttsd2si.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmCvtsi2sd(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 278
    self[].get._AsmCvtsi2sd.asm_type = 0
    if asm_type[] ~= self[].get._AsmCvtsi2sd.asm_type {
        free_AssemblyType(@self[].get._AsmCvtsi2sd.asm_type)
        self[].get._AsmCvtsi2sd.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmCvtsi2sd.src = 0
    if src[] ~= self[].get._AsmCvtsi2sd.src {
        free_AsmOperand(@self[].get._AsmCvtsi2sd.src)
        self[].get._AsmCvtsi2sd.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmCvtsi2sd.dst = 0
    if dst[] ~= self[].get._AsmCvtsi2sd.dst {
        free_AsmOperand(@self[].get._AsmCvtsi2sd.dst)
        self[].get._AsmCvtsi2sd.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: **struc AssemblyType, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 279
    self[].get._AsmUnary.unop = unop[]
    self[].get._AsmUnary.asm_type = 0
    if asm_type[] ~= self[].get._AsmUnary.asm_type {
        free_AssemblyType(@self[].get._AsmUnary.asm_type)
        self[].get._AsmUnary.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmUnary.dst = 0
    if dst[] ~= self[].get._AsmUnary.dst {
        free_AsmOperand(@self[].get._AsmUnary.dst)
        self[].get._AsmUnary.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 280
    self[].get._AsmBinary.binop = binop[]
    self[].get._AsmBinary.asm_type = 0
    if asm_type[] ~= self[].get._AsmBinary.asm_type {
        free_AssemblyType(@self[].get._AsmBinary.asm_type)
        self[].get._AsmBinary.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmBinary.src = 0
    if src[] ~= self[].get._AsmBinary.src {
        free_AsmOperand(@self[].get._AsmBinary.src)
        self[].get._AsmBinary.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmBinary.dst = 0
    if dst[] ~= self[].get._AsmBinary.dst {
        free_AsmOperand(@self[].get._AsmBinary.dst)
        self[].get._AsmBinary.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmCmp(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 281
    self[].get._AsmCmp.asm_type = 0
    if asm_type[] ~= self[].get._AsmCmp.asm_type {
        free_AssemblyType(@self[].get._AsmCmp.asm_type)
        self[].get._AsmCmp.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmCmp.src = 0
    if src[] ~= self[].get._AsmCmp.src {
        free_AsmOperand(@self[].get._AsmCmp.src)
        self[].get._AsmCmp.src = src[]
        src[] = 0
    }
    ;
    self[].get._AsmCmp.dst = 0
    if dst[] ~= self[].get._AsmCmp.dst {
        free_AsmOperand(@self[].get._AsmCmp.dst)
        self[].get._AsmCmp.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmIdiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 282
    self[].get._AsmIdiv.asm_type = 0
    if asm_type[] ~= self[].get._AsmIdiv.asm_type {
        free_AssemblyType(@self[].get._AsmIdiv.asm_type)
        self[].get._AsmIdiv.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmIdiv.src = 0
    if src[] ~= self[].get._AsmIdiv.src {
        free_AsmOperand(@self[].get._AsmIdiv.src)
        self[].get._AsmIdiv.src = src[]
        src[] = 0
    }
    ;
    return self
}
pub fn make_AsmDiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 283
    self[].get._AsmDiv.asm_type = 0
    if asm_type[] ~= self[].get._AsmDiv.asm_type {
        free_AssemblyType(@self[].get._AsmDiv.asm_type)
        self[].get._AsmDiv.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    self[].get._AsmDiv.src = 0
    if src[] ~= self[].get._AsmDiv.src {
        free_AsmOperand(@self[].get._AsmDiv.src)
        self[].get._AsmDiv.src = src[]
        src[] = 0
    }
    ;
    return self
}
pub fn make_AsmCdq(asm_type: **struc AssemblyType) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 284
    self[].get._AsmCdq.asm_type = 0
    if asm_type[] ~= self[].get._AsmCdq.asm_type {
        free_AssemblyType(@self[].get._AsmCdq.asm_type)
        self[].get._AsmCdq.asm_type = asm_type[]
        asm_type[] = 0
    }
    ;
    return self
}
pub fn make_AsmJmp(target: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 285
    self[].get._AsmJmp.target = target
    return self
}
pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 286
    self[].get._AsmJmpCC.target = target
    self[].get._AsmJmpCC.cond_code = cond_code[]
    return self
}
pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 287
    self[].get._AsmSetCC.cond_code = cond_code[]
    self[].get._AsmSetCC.dst = 0
    if dst[] ~= self[].get._AsmSetCC.dst {
        free_AsmOperand(@self[].get._AsmSetCC.dst)
        self[].get._AsmSetCC.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_AsmLabel(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 288
    self[].get._AsmLabel.name = name
    return self
}
pub fn make_AsmPush(src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 289
    self[].get._AsmPush.src = 0
    if src[] ~= self[].get._AsmPush.src {
        free_AsmOperand(@self[].get._AsmPush.src)
        self[].get._AsmPush.src = src[]
        src[] = 0
    }
    ;
    return self
}
pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 290
    self[].get._AsmPop.reg = reg[]
    return self
}
pub fn make_AsmCall(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 291
    self[].get._AsmCall.name = name
    return self
}
pub fn make_AsmRet(none) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].type = 292
    return self
}
pub fn free_AsmInstruction(self: **struc AsmInstruction) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 272 {
            break
        }
        -> 273 {
            free_AssemblyType(@(self[])[].get._AsmMov.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmMov.src)
        free_AsmOperand(@(self[])[].get._AsmMov.dst)
        break
        -> 274 {
            free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovSx.src)
        free_AsmOperand(@(self[])[].get._AsmMovSx.dst)
        break
        -> 275 {
            free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.src)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.dst)
        break
        -> 276 {
            free_AsmOperand(@(self[])[].get._AsmLea.src)
        }
        free_AsmOperand(@(self[])[].get._AsmLea.dst)
        break
        -> 277 {
            free_AssemblyType(@(self[])[].get._AsmCvttsd2si.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.src)
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.dst)
        break
        -> 278 {
            free_AssemblyType(@(self[])[].get._AsmCvtsi2sd.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.src)
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.dst)
        break
        -> 279 {
            free_AssemblyType(@(self[])[].get._AsmUnary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmUnary.dst)
        break
        -> 280 {
            free_AssemblyType(@(self[])[].get._AsmBinary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmBinary.src)
        free_AsmOperand(@(self[])[].get._AsmBinary.dst)
        break
        -> 281 {
            free_AssemblyType(@(self[])[].get._AsmCmp.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCmp.src)
        free_AsmOperand(@(self[])[].get._AsmCmp.dst)
        break
        -> 282 {
            free_AssemblyType(@(self[])[].get._AsmIdiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmIdiv.src)
        break
        -> 283 {
            free_AssemblyType(@(self[])[].get._AsmDiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmDiv.src)
        break
        -> 284 {
            free_AssemblyType(@(self[])[].get._AsmCdq.asm_type)
        }
        break
        -> 285 {
            break
        }
        -> 286 {
            break
        }
        -> 287 {
            free_AsmOperand(@(self[])[].get._AsmSetCC.dst)
        }
        break
        -> 288 {
            break
        }
        -> 289 {
            free_AsmOperand(@(self[])[].get._AsmPush.src)
        }
        break
        -> 290 {
            break
        }
        -> 291 {
            break
        }
        -> 292 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 492, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_AsmTopLevel(none) *struc AsmTopLevel {
    self: *struc AsmTopLevel = 0
    loop .. while 0 {
        free_AsmTopLevel(@self)
        self = cast<*struc AsmTopLevel>(malloc(sizeof<struc AsmTopLevel>))
        if not self {
            panic_sigabrt("alloc " "AsmTopLevel", 499, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    self[].type = 293
    return self
}
pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: ***struc AsmInstruction) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].type = 294
    self[].get._AsmFunction.name = name
    self[].get._AsmFunction.is_glob = is_glob
    self[].get._AsmFunction.is_ret_memory = is_ret_memory
    self[].get._AsmFunction.instructions = 0
    if instructions[] ~= self[].get._AsmFunction.instructions {
        if self[].get._AsmFunction.instructions {
            loop .. while 0 {
                cast<none>((? (self[].get._AsmFunction.instructions) then free((cast<*struc stbds_array_header>((self[].get._AsmFunction.instructions)) - 1)) else cast<none>(0)))
                (self[].get._AsmFunction.instructions) = 0
            }
            self[].get._AsmFunction.instructions = 0
        }
        ;
        self[].get._AsmFunction.instructions = instructions[]
        instructions[] = 0
    }
    ;
    return self
}
pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: ***struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].type = 295
    self[].get._AsmStaticVariable.name = name
    self[].get._AsmStaticVariable.alignment = alignment
    self[].get._AsmStaticVariable.is_glob = is_glob
    self[].get._AsmStaticVariable.static_inits = 0
    if static_inits[] ~= self[].get._AsmStaticVariable.static_inits {
        if self[].get._AsmStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? (self[].get._AsmStaticVariable.static_inits) then free((cast<*struc stbds_array_header>((self[].get._AsmStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._AsmStaticVariable.static_inits) = 0
            }
            self[].get._AsmStaticVariable.static_inits = 0
        }
        ;
        self[].get._AsmStaticVariable.static_inits = static_inits[]
        static_inits[] = 0
    }
    ;
    return self
}
pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].type = 296
    self[].get._AsmStaticConstant.name = name
    self[].get._AsmStaticConstant.alignment = alignment
    self[].get._AsmStaticConstant.static_init = 0
    if static_init[] ~= self[].get._AsmStaticConstant.static_init {
        free_StaticInit(@self[].get._AsmStaticConstant.static_init)
        self[].get._AsmStaticConstant.static_init = static_init[]
        static_init[] = 0
    }
    ;
    return self
}
pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 293 {
            break
        }
        -> 294 {
            loop i: u64 = 0 while i < (? ((self[])[].get._AsmFunction.instructions) then (cast<*struc stbds_array_header>(((self[])[].get._AsmFunction.instructions)) - 1)[].length else 0) .. ++i {
                free_AsmInstruction(@(self[])[].get._AsmFunction.instructions[i])
            }
        }
        if (self[])[].get._AsmFunction.instructions {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._AsmFunction.instructions) then free((cast<*struc stbds_array_header>(((self[])[].get._AsmFunction.instructions)) - 1)) else cast<none>(0)))
                ((self[])[].get._AsmFunction.instructions) = 0
            }
            (self[])[].get._AsmFunction.instructions = 0
        }
        ;
        break
        -> 295 {
            loop i: u64 = 0 while i < (? ((self[])[].get._AsmStaticVariable.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._AsmStaticVariable.static_inits)) - 1)[].length else 0) .. ++i {
                free_StaticInit(@(self[])[].get._AsmStaticVariable.static_inits[i])
            }
        }
        if (self[])[].get._AsmStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._AsmStaticVariable.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._AsmStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._AsmStaticVariable.static_inits) = 0
            }
            (self[])[].get._AsmStaticVariable.static_inits = 0
        }
        ;
        break
        -> 296 {
            free_StaticInit(@(self[])[].get._AsmStaticConstant.static_init)
        }
        break
        otherwise {
            panic_sigabrt("abort", 560, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_AsmProgram(static_const_toplvls: ***struc AsmTopLevel, top_levels: ***struc AsmTopLevel) *struc AsmProgram {
    self: *struc AsmProgram = 0
    loop .. while 0 {
        free_AsmProgram(@self)
        self = cast<*struc AsmProgram>(malloc(sizeof<struc AsmProgram>))
        if not self {
            panic_sigabrt("alloc " "AsmProgram", 568, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    self[].type = 297
    self[].static_const_toplvls = 0
    if static_const_toplvls[] ~= self[].static_const_toplvls {
        if self[].static_const_toplvls {
            loop .. while 0 {
                cast<none>((? (self[].static_const_toplvls) then free((cast<*struc stbds_array_header>((self[].static_const_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_const_toplvls) = 0
            }
            self[].static_const_toplvls = 0
        }
        ;
        self[].static_const_toplvls = static_const_toplvls[]
        static_const_toplvls[] = 0
    }
    ;
    self[].top_levels = 0
    if top_levels[] ~= self[].top_levels {
        if self[].top_levels {
            loop .. while 0 {
                cast<none>((? (self[].top_levels) then free((cast<*struc stbds_array_header>((self[].top_levels)) - 1)) else cast<none>(0)))
                (self[].top_levels) = 0
            }
            self[].top_levels = 0
        }
        ;
        self[].top_levels = top_levels[]
        top_levels[] = 0
    }
    ;
    return self
}
pub fn free_AsmProgram(self: **struc AsmProgram) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 297 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 583, "/home/romain/proj/planet/selfhost/wheelcc/ast/back_ast.c")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_const_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        free_AsmTopLevel(@(self[])[].static_const_toplvls[i])
    }
    if (self[])[].static_const_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].static_const_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_const_toplvls) = 0
        }
        (self[])[].static_const_toplvls = 0
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].top_levels) then (cast<*struc stbds_array_header>(((self[])[].top_levels)) - 1)[].length else 0) .. ++i {
        free_AsmTopLevel(@(self[])[].top_levels[i])
    }
    if (self[])[].top_levels {
        loop .. while 0 {
            cast<none>((? ((self[])[].top_levels) then free((cast<*struc stbds_array_header>(((self[])[].top_levels)) - 1)) else cast<none>(0)))
            ((self[])[].top_levels) = 0
        }
        (self[])[].top_levels = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
