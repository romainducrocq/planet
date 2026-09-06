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
type struc FileRead(    len: u64    , buf: string    , fd: *struc FILE    , filename: string    )
type struc FileIoContext(    errors: *struc ErrorsContext    , fd_write: *struc FILE    , write_buf: string    , filename: string    , file_reads: *struc FileRead    )
pub fn find_file(filename: string) i32;
pub fn get_filename(ctx: *struc FileIoContext) string;
pub fn set_filename(ctx: *struc FileIoContext, filename: string) none;
pub fn open_fread(ctx: *struc FileIoContext, filename: string) i32;
pub fn open_fwrite(ctx: *struc FileIoContext, filename: string) i32;
pub fn read_line(ctx: *struc FileIoContext, line: *string, line_size: *u64) i32;
pub fn write_buffer(ctx: *struc FileIoContext, buf: string) none;
pub fn close_fread(ctx: *struc FileIoContext, linenum: u64) i32;
pub fn close_fwrite(ctx: *struc FileIoContext) none;
pub fn free_fileio(ctx: *struc FileIoContext) none;
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

type struc CProgram;
type struc ErrorsContext;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32;

type struc CProgram;
type struc TacProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram;

type struc TacProgram;
type struc AsmProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram;

type struc AsmProgram;
type struc BackEndContext;
type struc FileIoContext;
type struc IdentifierContext;
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none;

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
type struc TacProgram;
type struc FrontEndContext;
pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none;

type struc MainContext(    errors: *struc ErrorsContext    , is_verbose: i32    , debug_code: u8    , optim_1_mask: u8    , optim_2_code: u8    , filename: string    , includedirs: *string    , stdlibdirs: *string    )
fn verbose(ctx: *struc MainContext, msg: string) none {
    if ctx[].is_verbose {
        printf("%s", msg)
    }
}
fn set_filename_ext(ctx: *struc MainContext, ext: string) none {
    loop i: u64 = sdslen(ctx[].filename) while i-- > 0 {
        if ctx[].filename[i] == '.' {
            sdsrange(ctx[].filename, 0, i)
            loop .. while 0 {
                ctx[].filename = sdscat(ctx[].filename, ext)
            }
            return none
        }
    }
    panic_sigabrt("abort", 59, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
}
fn compile(ctx: *struc MainContext, errors: *struc ErrorsContext, fileio: *struc FileIoContext) i32 {
    identifiers: struc IdentifierContext;
    frontend: struc FrontEndContext;
    backend: struc BackEndContext;
    tokens: *struc Token = 0
    c_ast: *struc CProgram = 0
    tac_ast: *struc TacProgram = 0
    asm_ast: *struc AsmProgram = 0
    {
        if ctx[].debug_code > 0 and ctx[].debug_code <= 127 {
            ctx[].is_verbose = 1
            errors[].is_stdout = 1
        }
        identifiers.label_count = 0u
        identifiers.var_count = 0u
        identifiers.struct_count = 0u
        identifiers.hash_table = 0
        frontend.string_const_table = 0
        frontend.struct_typedef_table = 0
        frontend.symbol_table = 0
        frontend.addressed_set = 0
        backend.symbol_table = 0
    }
    _errval: i32 = 0
    verbose(ctx, "-- Lexing ... ")
    loop .. while 0 {
        _errval = lex_c_code(ctx[].filename, @ctx[].includedirs, @ctx[].stdlibdirs, errors, fileio, @identifiers, @tokens)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 255 {
        jump _Lfinally
    }
    verbose(ctx, "-- Parsing ... ")
    loop .. while 0 {
        _errval = parse_tokens(@tokens, errors, @identifiers, @c_ast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 254 {
        jump _Lfinally
    }
    verbose(ctx, "-- Semantic analysis ... ")
    loop .. while 0 {
        _errval = analyze_semantic(c_ast, errors, @frontend, @identifiers)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 253 {
        jump _Lfinally
    }
    verbose(ctx, "-- TAC representation ... ")
    tac_ast = represent_three_address_code(@c_ast, @frontend, @identifiers)
    if ctx[].optim_1_mask > 0 {
        verbose(ctx, "OK\n-- Level 1 optimization ... ")
        optimize_three_address_code(tac_ast, @frontend, ctx[].optim_1_mask)
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 252 {
        jump _Lfinally
    }
    verbose(ctx, "-- Assembly generation ... ")
    asm_ast = generate_assembly(@tac_ast, @frontend, @identifiers)
    convert_symbol_table(asm_ast, @backend, @frontend)
    if ctx[].optim_2_code > 0 {
        verbose(ctx, "OK\n-- Level 2 optimization ... ")
        allocate_registers(asm_ast, @backend, @frontend, ctx[].optim_2_code)
    }
    fix_stack(asm_ast, @backend)
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 251 {
        jump _Lfinally
    }
    verbose(ctx, "-- Code emission ... ")
    set_filename_ext(ctx, "s")
    loop .. while 0 {
        _errval = open_fwrite(fileio, ctx[].filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    emit_gas_code(@asm_ast, @backend, fileio, @identifiers)
    close_fwrite(fileio)
    verbose(ctx, "OK\n")
    label _Lfinally
    ;
    loop i: u64 = 0 while i < (? (identifiers.hash_table) then (cast<*struc stbds_array_header>(((identifiers.hash_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (identifiers.hash_table[i]).value {
            sdsfree((identifiers.hash_table[i]).value)
            (identifiers.hash_table[i]).value = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    if identifiers.hash_table {
        loop .. while 0 {
            cast<none>((? (identifiers.hash_table) ~= 0 then stbds_hmfree_func((identifiers.hash_table) - 1, sizeof((identifiers.hash_table)[])) else cast<none>(0)))
            (identifiers.hash_table) = 0
        }
        identifiers.hash_table = 0
    }
    ;
    if frontend.string_const_table {
        loop .. while 0 {
            cast<none>((? (frontend.string_const_table) ~= 0 then stbds_hmfree_func((frontend.string_const_table) - 1, sizeof((frontend.string_const_table)[])) else cast<none>(0)))
            (frontend.string_const_table) = 0
        }
        frontend.string_const_table = 0
    }
    ;
    loop i: u64 = 0 while i < (? (frontend.struct_typedef_table) then (cast<*struc stbds_array_header>(((frontend.struct_typedef_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructTypedef(@(frontend.struct_typedef_table[i]).value)
    }
    if frontend.struct_typedef_table {
        loop .. while 0 {
            cast<none>((? (frontend.struct_typedef_table) ~= 0 then stbds_hmfree_func((frontend.struct_typedef_table) - 1, sizeof((frontend.struct_typedef_table)[])) else cast<none>(0)))
            (frontend.struct_typedef_table) = 0
        }
        frontend.struct_typedef_table = 0
    }
    ;
    loop i: u64 = 0 while i < (? (frontend.symbol_table) then (cast<*struc stbds_array_header>(((frontend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_Symbol(@(frontend.symbol_table[i]).value)
    }
    if frontend.symbol_table {
        loop .. while 0 {
            cast<none>((? (frontend.symbol_table) ~= 0 then stbds_hmfree_func((frontend.symbol_table) - 1, sizeof((frontend.symbol_table)[])) else cast<none>(0)))
            (frontend.symbol_table) = 0
        }
        frontend.symbol_table = 0
    }
    ;
    if frontend.addressed_set {
        loop .. while 0 {
            cast<none>((? (frontend.addressed_set) ~= 0 then stbds_hmfree_func((frontend.addressed_set) - 1, sizeof((frontend.addressed_set)[])) else cast<none>(0)))
            (frontend.addressed_set) = 0
        }
        frontend.addressed_set = 0
    }
    ;
    loop i: u64 = 0 while i < (? (backend.symbol_table) then (cast<*struc stbds_array_header>(((backend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_BackendSymbol(@(backend.symbol_table[i]).value)
    }
    if backend.symbol_table {
        loop .. while 0 {
            cast<none>((? (backend.symbol_table) ~= 0 then stbds_hmfree_func((backend.symbol_table) - 1, sizeof((backend.symbol_table)[])) else cast<none>(0)))
            (backend.symbol_table) = 0
        }
        backend.symbol_table = 0
    }
    ;
    if tokens {
        loop .. while 0 {
            cast<none>((? (tokens) then free((cast<*struc stbds_array_header>((tokens)) - 1)) else cast<none>(0)))
            (tokens) = 0
        }
        tokens = 0
    }
    ;
    free_CProgram(@c_ast)
    free_TacProgram(@tac_ast)
    free_AsmProgram(@asm_ast)
    return _errval
}
fn arg_parse_uint8(arg: string, value: *u8) i32 {
    end_ptr: string = 0
    value[] = cast<u8>(strtol(arg, @end_ptr, 10))
    return end_ptr == arg
}
fn arg_parse(ctx: *struc MainContext, argc: i32, argv: *string) i32 {
    _errval: i32 = 0
    i: u64 = 0
    if argc == 2 and strcmp(argv[1], "--help") == 0 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(101), "101", "", "", argv[0]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 214, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(102), "102", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 218, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].debug_code) {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(103), "103", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 221, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(104), "104", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 225, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_1_mask) or ctx[].optim_1_mask > 15 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(105), "105", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 228, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(106), "106", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 232, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_2_code) or ctx[].optim_2_code > 2 {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(107), "107", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 235, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(108), "108", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 239, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].filename = ? argv[i] then sdsnew(argv[i]) else 0
    if not argv[++i] {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(109), "109", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 244, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        (? (not (ctx[].stdlibdirs) or (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].capacity) then (((ctx[].stdlibdirs) = stbds_arrgrowf((ctx[].stdlibdirs), sizeof((ctx[].stdlibdirs)[]), (1), (0))) and 0) else 0)
        (ctx[].stdlibdirs)[(cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length++] = (cast<string>(argv[i]))
    }
    if not argv[++i] {
        loop .. while 0 {
            ?             snprintf(ctx[].errors[].msg, sizeof<char> * 1024, get_arg_msg(110), "110", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort", 249, "/home/romain/proj/planet/selfhost/wheelcc/lib/main.c")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while argv[++i] {
        loop .. while 0 {
            (? (not (ctx[].includedirs) or (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].capacity) then (((ctx[].includedirs) = stbds_arrgrowf((ctx[].includedirs), sizeof((ctx[].includedirs)[]), (1), (0))) and 0) else 0)
            (ctx[].includedirs)[(cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length++] = (cast<string>(argv[i]))
        }
    }    
    label _Lfinally
    ;
    return _errval
}
pub fn main(argc: i32, argv: *string) i32 {
    errors: struc ErrorsContext;
    fileio: struc FileIoContext;
    ctx: struc MainContext;
    {
        errors.errors = @errors
        errors.fileio = @fileio
        errors.is_stdout = 0
        errors.info_at_map = 0
        errors.fopen_lines = 0
        errors.token_infos = 0
        fileio.errors = @errors
        fileio.fd_write = 0
        fileio.write_buf = ? 0 then sdsnew(0) else 0
        fileio.filename = ? 0 then sdsnew(0) else 0
        fileio.file_reads = 0
        ctx.errors = @errors
        ctx.is_verbose = 0
        ctx.filename = ? 0 then sdsnew(0) else 0
        ctx.includedirs = 0
        ctx.stdlibdirs = 0
    }
    _errval: i32 = 0
    loop .. while 0 {
        _errval = arg_parse(@ctx, argc, argv)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        _errval = compile(@ctx, @errors, @fileio)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    ;
    if errors.info_at_map {
        loop .. while 0 {
            cast<none>((? (errors.info_at_map) ~= 0 then stbds_hmfree_func((errors.info_at_map) - 1, sizeof((errors.info_at_map)[])) else cast<none>(0)))
            (errors.info_at_map) = 0
        }
        errors.info_at_map = 0
    }
    ;
    loop i: u64 = 0 while i < (? (errors.fopen_lines) then (cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)[].length else 0) .. ++i {
        if errors.fopen_lines[i].filename {
            sdsfree(errors.fopen_lines[i].filename)
            errors.fopen_lines[i].filename = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    if errors.fopen_lines {
        loop .. while 0 {
            cast<none>((? (errors.fopen_lines) then free((cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)) else cast<none>(0)))
            (errors.fopen_lines) = 0
        }
        errors.fopen_lines = 0
    }
    ;
    if errors.token_infos {
        loop .. while 0 {
            cast<none>((? (errors.token_infos) then free((cast<*struc stbds_array_header>((errors.token_infos)) - 1)) else cast<none>(0)))
            (errors.token_infos) = 0
        }
        errors.token_infos = 0
    }
    ;
    if fileio.write_buf {
        sdsfree(fileio.write_buf)
        fileio.write_buf = ? 0 then sdsnew(0) else 0
    }
    ;
    if fileio.filename {
        sdsfree(fileio.filename)
        fileio.filename = ? 0 then sdsnew(0) else 0
    }
    ;
    loop i: u64 = 0 while i < (? (fileio.file_reads) then (cast<*struc stbds_array_header>((fileio.file_reads)) - 1)[].length else 0) .. ++i {
        if fileio.file_reads[i].filename {
            sdsfree(fileio.file_reads[i].filename)
            fileio.file_reads[i].filename = ? 0 then sdsnew(0) else 0
        }
        ;
    }
    if fileio.file_reads {
        loop .. while 0 {
            cast<none>((? (fileio.file_reads) then free((cast<*struc stbds_array_header>((fileio.file_reads)) - 1)) else cast<none>(0)))
            (fileio.file_reads) = 0
        }
        fileio.file_reads = 0
    }
    ;
    if ctx.filename {
        sdsfree(ctx.filename)
        ctx.filename = ? 0 then sdsnew(0) else 0
    }
    ;
    if ctx.includedirs {
        loop .. while 0 {
            cast<none>((? (ctx.includedirs) then free((cast<*struc stbds_array_header>((ctx.includedirs)) - 1)) else cast<none>(0)))
            (ctx.includedirs) = 0
        }
        ctx.includedirs = 0
    }
    ;
    if ctx.stdlibdirs {
        loop .. while 0 {
            cast<none>((? (ctx.stdlibdirs) then free((cast<*struc stbds_array_header>((ctx.stdlibdirs)) - 1)) else cast<none>(0)))
            (ctx.stdlibdirs) = 0
        }
        ctx.stdlibdirs = 0
    }
    ;
    return _errval
}
