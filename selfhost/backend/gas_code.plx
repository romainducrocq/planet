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
type struc FileIoContext;
type struc IdentifierContext;
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none;

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
type struc GasCodeContext(    backend: *struc BackEndContext    , fileio: *struc FileIoContext    , identifiers: *struc IdentifierContext    )
fn emit(ctx: *struc GasCodeContext, code: string) none {
    write_buffer(ctx[].fileio, code)
}
fn emit_identifier(ctx: *struc GasCodeContext, identifier: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((identifier))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}
fn emit_string(ctx: *struc GasCodeContext, string_const: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((string_const))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}
fn emit_char(ctx: *struc GasCodeContext, value: i8) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? 0 then sdsnew(0) else 0
    }
    ;
}
fn emit_int(ctx: *struc GasCodeContext, value: i32) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? 0 then sdsnew(0) else 0
    }
    ;
}
fn emit_long(ctx: *struc GasCodeContext, value: i64) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? 0 then sdsnew(0) else 0
    }
    ;
}
fn emit_dbl(ctx: *struc GasCodeContext, dbl_const: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((dbl_const))), sizeof(ctx[].identifiers[].hash_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}
fn emit_uchar(ctx: *struc GasCodeContext, value: u8) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? 0 then sdsnew(0) else 0
    }
    ;
}
fn emit_uint(ctx: *struc GasCodeContext, value: u32) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? 0 then sdsnew(0) else 0
    }
    ;
}
fn emit_ulong(ctx: *struc GasCodeContext, value: u64) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? 0 then sdsnew(0) else 0
    }
    ;
}
fn get_reg_rsp_sse(node: *struc AsmReg) string {
    match node[].type {
        -> 219 {
            return "%rsp"
        }
        -> 220 {
            return "%rbp"
        }
        -> 221 {
            return "%xmm0"
        }
        -> 222 {
            return "%xmm1"
        }
        -> 223 {
            return "%xmm2"
        }
        -> 224 {
            return "%xmm3"
        }
        -> 225 {
            return "%xmm4"
        }
        -> 226 {
            return "%xmm5"
        }
        -> 227 {
            return "%xmm6"
        }
        -> 228 {
            return "%xmm7"
        }
        -> 229 {
            return "%xmm8"
        }
        -> 230 {
            return "%xmm9"
        }
        -> 231 {
            return "%xmm10"
        }
        -> 232 {
            return "%xmm11"
        }
        -> 233 {
            return "%xmm12"
        }
        -> 234 {
            return "%xmm13"
        }
        -> 235 {
            return "%xmm14"
        }
        -> 236 {
            return "%xmm15"
        }
        otherwise {
            panic_sigabrt("abort", 155, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn get_reg_1b(node: *struc AsmReg) string {
    match node[].type {
        -> 205 {
            return "%al"
        }
        -> 206 {
            return "%bl"
        }
        -> 208 {
            return "%dl"
        }
        -> 207 {
            return "%cl"
        }
        -> 209 {
            return "%dil"
        }
        -> 210 {
            return "%sil"
        }
        -> 211 {
            return "%r8b"
        }
        -> 212 {
            return "%r9b"
        }
        -> 213 {
            return "%r10b"
        }
        -> 214 {
            return "%r11b"
        }
        -> 215 {
            return "%r12b"
        }
        -> 216 {
            return "%r13b"
        }
        -> 217 {
            return "%r14b"
        }
        -> 218 {
            return "%r15b"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}
fn get_reg_4b(node: *struc AsmReg) string {
    match node[].type {
        -> 205 {
            return "%eax"
        }
        -> 206 {
            return "%ebx"
        }
        -> 208 {
            return "%edx"
        }
        -> 207 {
            return "%ecx"
        }
        -> 209 {
            return "%edi"
        }
        -> 210 {
            return "%esi"
        }
        -> 211 {
            return "%r8d"
        }
        -> 212 {
            return "%r9d"
        }
        -> 213 {
            return "%r10d"
        }
        -> 214 {
            return "%r11d"
        }
        -> 215 {
            return "%r12d"
        }
        -> 216 {
            return "%r13d"
        }
        -> 217 {
            return "%r14d"
        }
        -> 218 {
            return "%r15d"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}
fn get_reg_8b(node: *struc AsmReg) string {
    match node[].type {
        -> 205 {
            return "%rax"
        }
        -> 206 {
            return "%rbx"
        }
        -> 208 {
            return "%rdx"
        }
        -> 207 {
            return "%rcx"
        }
        -> 209 {
            return "%rdi"
        }
        -> 210 {
            return "%rsi"
        }
        -> 211 {
            return "%r8"
        }
        -> 212 {
            return "%r9"
        }
        -> 213 {
            return "%r10"
        }
        -> 214 {
            return "%r11"
        }
        -> 215 {
            return "%r12"
        }
        -> 216 {
            return "%r13"
        }
        -> 217 {
            return "%r14"
        }
        -> 218 {
            return "%r15"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}
fn get_cond_code(node: *struc AsmCondCode) string {
    match node[].type {
        -> 238 {
            return "e"
        }
        -> 239 {
            return "ne"
        }
        -> 242 {
            return "l"
        }
        -> 243 {
            return "le"
        }
        -> 240 {
            return "g"
        }
        -> 241 {
            return "ge"
        }
        -> 246 {
            return "b"
        }
        -> 247 {
            return "be"
        }
        -> 244 {
            return "a"
        }
        -> 245 {
            return "ae"
        }
        -> 248 {
            return "p"
        }
        otherwise {
            panic_sigabrt("abort", 342, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn type_align_bytes(node: *struc AssemblyType) i32 {
    match node[].type {
        -> 38 {
            return 1
        }
        -> 39 {
            return 4
        }
        -> 40 {
            -> 41 {
                return 8
            }
        }
        -> 42 {
            return node[].get._ByteArray.alignment
        }
        otherwise {
            panic_sigabrt("abort", 363, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn get_type_suffix(node: *struc AssemblyType, is_packed: i32) string {
    match node[].type {
        -> 38 {
            return "b"
        }
        -> 39 {
            return "l"
        }
        -> 40 {
            return "q"
        }
        -> 41 {
            return ? is_packed then "pd" else "sd"
        }
        otherwise {
            panic_sigabrt("abort", 383, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn imm_op(ctx: *struc GasCodeContext, node: *struc AsmImm) none {
    emit(ctx, "$")
    if node[].is_neg {
        emit_long(ctx, cast<i64>(node[].value))
    }
    else {
        emit_ulong(ctx, node[].value)
    }
}
fn reg_op(ctx: *struc GasCodeContext, node: *struc AsmRegister, byte: i32) none {
    match byte {
        -> 1 {
            emit(ctx, get_reg_1b(@node[].reg))
        }
        break
        -> 4 {
            emit(ctx, get_reg_4b(@node[].reg))
        }
        break
        -> 8 {
            emit(ctx, get_reg_8b(@node[].reg))
        }
        break
        otherwise {
            panic_sigabrt("abort", 409, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn memory_op(ctx: *struc GasCodeContext, node: *struc AsmMemory) none {
    if node[].value ~= 0l {
        emit_long(ctx, node[].value)
    }
    emit(ctx, "(")
    emit(ctx, get_reg_8b(@node[].reg))
    emit(ctx, ")")
}
fn data_op(ctx: *struc GasCodeContext, node: *struc AsmData) none {
    map_it: i64 = (? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].backend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        backend_obj_symbol: *struc BackendSymbol = (ctx[].backend[].symbol_table[map_it]).value
        if backend_obj_symbol[].type == 44 and backend_obj_symbol[].get._BackendObj.is_const {
            emit(ctx, ".L")
        }
    }
    emit_identifier(ctx, node[].name)
    if node[].offset ~= 0l {
        emit(ctx, "+")
        emit_long(ctx, node[].offset)
    }
    emit(ctx, "(%rip)")
}
fn indexed_op(ctx: *struc GasCodeContext, node: *struc AsmIndexed) none {
    emit(ctx, "(")
    emit(ctx, get_reg_8b(@node[].reg_base))
    emit(ctx, ", ")
    emit(ctx, get_reg_8b(@node[].reg_index))
    emit(ctx, ", ")
    emit_long(ctx, node[].scale)
    emit(ctx, ")")
}
fn emit_op(ctx: *struc GasCodeContext, node: *struc AsmOperand, byte: i32) none {
    match node[].type {
        -> 250 {
            imm_op(ctx, @node[].get._AsmImm)
        }
        break
        -> 251 {
            reg_op(ctx, @node[].get._AsmRegister, byte)
        }
        break
        -> 253 {
            memory_op(ctx, @node[].get._AsmMemory)
        }
        break
        -> 254 {
            data_op(ctx, @node[].get._AsmData)
        }
        break
        -> 256 {
            indexed_op(ctx, @node[].get._AsmIndexed)
        }
        break
        otherwise {
            panic_sigabrt("abort", 471, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn get_unop(node: *struc AsmUnaryOp) string {
    match node[].type {
        -> 270 {
            return "neg"
        }
        -> 269 {
            return "not"
        }
        -> 271 {
            return "shr"
        }
        otherwise {
            panic_sigabrt("abort", 487, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn get_binop(node: *struc AsmBinaryOp, is_dbl: i32) string {
    match node[].type {
        -> 258 {
            return "add"
        }
        -> 259 {
            return "sub"
        }
        -> 260 {
            return ? is_dbl then "mul" else "imul"
        }
        -> 261 {
            return "div"
        }
        -> 262 {
            return "and"
        }
        -> 263 {
            return "or"
        }
        -> 264 {
            return "xor"
        }
        -> 265 {
            return "shl"
        }
        -> 266 {
            return "shr"
        }
        -> 267 {
            return "sar"
        }
        otherwise {
            panic_sigabrt("abort", 525, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn mov_instr(ctx: *struc GasCodeContext, node: *struc AsmMov) none {
    emit(ctx, "    " "    " "mov")
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn mov_sx_instr(ctx: *struc GasCodeContext, node: *struc AsmMovSx) none {
    emit(ctx, "    " "    " "movs")
    emit(ctx, get_type_suffix(node[].asm_type_src, 0))
    emit(ctx, get_type_suffix(node[].asm_type_dst, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type_src)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, ", ")
    {
        byte: i32 = type_align_bytes(node[].asm_type_dst)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn zero_extend_instr(ctx: *struc GasCodeContext, node: *struc AsmMovZeroExtend) none {
    emit(ctx, "    " "    " "movzb")
    emit(ctx, get_type_suffix(node[].asm_type_dst, 0))
    emit(ctx, " ")
    emit_op(ctx, node[].src, 1)
    emit(ctx, ", ")
    {
        byte: i32 = type_align_bytes(node[].asm_type_dst)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn lea_instr(ctx: *struc GasCodeContext, node: *struc AsmLea) none {
    emit(ctx, "    " "    " "leaq ")
    emit_op(ctx, node[].src, 8)
    emit(ctx, ", ")
    emit_op(ctx, node[].dst, 8)
    emit(ctx, "\n")
}
fn cvttsd2si_instr(ctx: *struc GasCodeContext, node: *struc AsmCvttsd2si) none {
    emit(ctx, "    " "    " "cvttsd2si")
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn cvtsi2sd_instr(ctx: *struc GasCodeContext, node: *struc AsmCvtsi2sd) none {
    emit(ctx, "    " "    " "cvtsi2sd")
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn unary_instr(ctx: *struc GasCodeContext, node: *struc AsmUnary) none {
    emit(ctx, "    " "    ")
    emit(ctx, get_unop(@node[].unop))
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn binary_instr(ctx: *struc GasCodeContext, node: *struc AsmBinary) none {
    emit(ctx, "    " "    ")
    {
        is_dbl: i32 = node[].asm_type[].type == 41
        emit(ctx, get_binop(@node[].binop, is_dbl))
        is_packed: i32 = node[].binop.type == 264 and is_dbl
        emit(ctx, get_type_suffix(node[].asm_type, is_packed))
    }
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        match node[].binop.type {
            -> 265 {
                -> 266 {
                    -> 267 {
                        emit_op(ctx, node[].src, 1)
                    }
                }
            }
            break
            otherwise {
                emit_op(ctx, node[].src, byte)
            }
            break
        }
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn cmp_instr(ctx: *struc GasCodeContext, node: *struc AsmCmp) none {
    if node[].asm_type[].type == 41 {
        emit(ctx, "    " "    " "comi")
    }
    else {
        emit(ctx, "    " "    " "cmp")
    }
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
        emit(ctx, ", ")
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}
fn idiv_instr(ctx: *struc GasCodeContext, node: *struc AsmIdiv) none {
    emit(ctx, "    " "    " "idiv")
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, "\n")
}
fn div_instr(ctx: *struc GasCodeContext, node: *struc AsmDiv) none {
    emit(ctx, "    " "    " "div")
    emit(ctx, get_type_suffix(node[].asm_type, 0))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, "\n")
}
fn cdq_instr(ctx: *struc GasCodeContext, node: *struc AsmCdq) none {
    match node[].asm_type[].type {
        -> 39 {
            emit(ctx, "    " "    " "cdq" "\n")
        }
        break
        -> 40 {
            emit(ctx, "    " "    " "cqo" "\n")
        }
        break
        otherwise {
            panic_sigabrt("abort", 694, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn jmp_instr(ctx: *struc GasCodeContext, node: *struc AsmJmp) none {
    emit(ctx, "    " "    " "jmp " ".L")
    emit_identifier(ctx, node[].target)
    emit(ctx, "\n")
}
fn jmp_cc_instr(ctx: *struc GasCodeContext, node: *struc AsmJmpCC) none {
    emit(ctx, "    " "    " "j")
    emit(ctx, get_cond_code(@node[].cond_code))
    emit(ctx, " " ".L")
    emit_identifier(ctx, node[].target)
    emit(ctx, "\n")
}
fn set_cc_instr(ctx: *struc GasCodeContext, node: *struc AsmSetCC) none {
    emit(ctx, "    " "    " "set")
    emit(ctx, get_cond_code(@node[].cond_code))
    emit(ctx, " ")
    emit_op(ctx, node[].dst, 1)
    emit(ctx, "\n")
}
fn label_instr(ctx: *struc GasCodeContext, node: *struc AsmLabel) none {
    emit(ctx, "    " ".L")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":" "\n")
}
fn push_instr(ctx: *struc GasCodeContext, node: *struc AsmPush) none {
    emit(ctx, "    " "    " "pushq ")
    emit_op(ctx, node[].src, 8)
    emit(ctx, "\n")
}
fn pop_instr(ctx: *struc GasCodeContext, node: *struc AsmPop) none {
    emit(ctx, "    " "    " "popq ")
    emit(ctx, get_reg_8b(@node[].reg))
    emit(ctx, "\n")
}
fn call_instr(ctx: *struc GasCodeContext, node: *struc AsmCall) none {
    emit(ctx, "    " "    " "call ")
    emit_identifier(ctx, node[].name)
    backend_fun_symbol: *struc BackendSymbol = ((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof(ctx[].backend[].symbol_table)[].key, 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)
    ;
    if not backend_fun_symbol[].get._BackendFun.is_def {
        emit(ctx, "@PLT")
    }
    emit(ctx, "\n")
}
fn ret_instr(ctx: *struc GasCodeContext) none {
    emit(ctx, "    " "movq %rbp, %rsp" "\n" "    " "popq %rbp" "\n" "    " "ret" "\n")
}
fn emit_instr(ctx: *struc GasCodeContext, node: *struc AsmInstruction) none {
    match node[].type {
        -> 273 {
            mov_instr(ctx, @node[].get._AsmMov)
        }
        break
        -> 274 {
            mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> 275 {
            zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> 276 {
            lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> 277 {
            cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> 278 {
            cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> 279 {
            unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> 280 {
            binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> 281 {
            cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> 282 {
            idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> 283 {
            div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> 284 {
            cdq_instr(ctx, @node[].get._AsmCdq)
        }
        break
        -> 285 {
            jmp_instr(ctx, @node[].get._AsmJmp)
        }
        break
        -> 286 {
            jmp_cc_instr(ctx, @node[].get._AsmJmpCC)
        }
        break
        -> 287 {
            set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> 288 {
            label_instr(ctx, @node[].get._AsmLabel)
        }
        break
        -> 289 {
            push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> 290 {
            pop_instr(ctx, @node[].get._AsmPop)
        }
        break
        -> 291 {
            call_instr(ctx, @node[].get._AsmCall)
        }
        break
        -> 292 {
            ret_instr(ctx)
        }
        break
        otherwise {
            panic_sigabrt("abort", 840, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn emit_instr_list(ctx: *struc GasCodeContext, node_list: **struc AsmInstruction) none {
    loop i: u64 = ? node_list[0] then 0 else 1 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        emit_instr(ctx, node_list[i])
    }
}
fn glob_directive_toplvl(ctx: *struc GasCodeContext, name: u64, is_glob: i32) none {
    if is_glob {
        emit(ctx, "    " ".globl ")
        emit_identifier(ctx, name)
        emit(ctx, "\n")
    }
}
fn emit_fun_toplvl(ctx: *struc GasCodeContext, node: *struc AsmFunction) none {
    glob_directive_toplvl(ctx, node[].name, node[].is_glob)
    emit(ctx, "    " ".text" "\n")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":" "\n" "    " "pushq %rbp" "\n" "    " "movq %rsp, %rbp" "\n")
    emit_instr_list(ctx, node[].instructions)
}
fn static_section_toplvl(ctx: *struc GasCodeContext, node_list: **struc StaticInit) none {
    if (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) == 1 and node_list[0][].type == 22 {
        emit(ctx, "    " ".bss" "\n")
    }
    else {
        emit(ctx, "    " ".data" "\n")
    }
}
fn align_directive_toplvl(ctx: *struc GasCodeContext, alignment: i32) none {
    if alignment > 1 {
        emit(ctx, "    " ".balign ")
        emit_int(ctx, alignment)
        emit(ctx, "\n")
    }
}
fn static_init_toplvl(ctx: *struc GasCodeContext, node: *struc StaticInit) none {
    match node[].type {
        -> 19 {
            emit(ctx, "    " "    " ".byte ")
        }
        emit_char(ctx, node[].get._CharInit.value)
        emit(ctx, "\n")
        break
        -> 15 {
            emit(ctx, "    " "    " ".long ")
        }
        emit_int(ctx, node[].get._IntInit.value)
        emit(ctx, "\n")
        break
        -> 16 {
            emit(ctx, "    " "    " ".quad ")
        }
        emit_long(ctx, node[].get._LongInit.value)
        emit(ctx, "\n")
        break
        -> 21 {
            emit(ctx, "    " "    " ".quad ")
        }
        emit_dbl(ctx, node[].get._DoubleInit.dbl_const)
        emit(ctx, "\n")
        break
        -> 20 {
            emit(ctx, "    " "    " ".byte ")
        }
        emit_uchar(ctx, node[].get._UCharInit.value)
        emit(ctx, "\n")
        break
        -> 17 {
            emit(ctx, "    " "    " ".long ")
        }
        emit_uint(ctx, node[].get._UIntInit.value)
        emit(ctx, "\n")
        break
        -> 18 {
            emit(ctx, "    " "    " ".quad ")
        }
        emit_ulong(ctx, node[].get._ULongInit.value)
        emit(ctx, "\n")
        break
        -> 22 {
            emit(ctx, "    " "    " ".zero ")
        }
        emit_long(ctx, node[].get._ZeroInit.byte)
        emit(ctx, "\n")
        break
        -> 23 {
            emit(ctx, "    " "    " ".asci")
        }
        {
            string_init: *struc StringInit = @node[].get._StringInit
            emit(ctx, ? string_init[].is_null_term then "z" else "i")
            emit(ctx, " \"")
            emit_string(ctx, string_init[].string_const)
        }
        emit(ctx, "\"" "\n")
        break
        -> 24 {
            emit(ctx, "    " "    " ".quad " ".L")
        }
        emit_identifier(ctx, node[].get._PointerInit.name)
        emit(ctx, "\n")
        break
        otherwise {
            panic_sigabrt("abort", 961, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn emit_static_var_toplvl(ctx: *struc GasCodeContext, node: *struc AsmStaticVariable) none {
    glob_directive_toplvl(ctx, node[].name, node[].is_glob)
    static_section_toplvl(ctx, node[].static_inits)
    align_directive_toplvl(ctx, node[].alignment)
    emit_identifier(ctx, node[].name)
    emit(ctx, ":" "\n")
    loop i: u64 = 0 while i < (? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0) .. ++i {
        static_init_toplvl(ctx, node[].static_inits[i])
    }
}
fn emit_static_const_toplvl(ctx: *struc GasCodeContext, node: *struc AsmStaticConstant) none {
    emit(ctx, "    " ".section .rodata" "\n")
    align_directive_toplvl(ctx, node[].alignment)
    emit(ctx, ".L")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":" "\n")
    static_init_toplvl(ctx, node[].static_init)
}
fn emit_toplvl(ctx: *struc GasCodeContext, node: *struc AsmTopLevel) none {
    emit(ctx, "\n")
    match node[].type {
        -> 294 {
            emit_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> 295 {
            emit_static_var_toplvl(ctx, @node[].get._AsmStaticVariable)
        }
        break
        -> 296 {
            emit_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
        }
        break
        otherwise {
            panic_sigabrt("abort", 1039, "/home/romain/proj/planet/selfhost/wheelcc/backend/gas_code.c")
        }
    }
}
fn emit_program(ctx: *struc GasCodeContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].static_const_toplvls) then (cast<*struc stbds_array_header>((node[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        emit_toplvl(ctx, node[].static_const_toplvls[i])
    }
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        emit_toplvl(ctx, node[].top_levels[i])
    }
    emit(ctx, "    " "    " ".section .note.GNU-stack,\"\",@progbits" "\n")
}
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none {
    ctx: struc GasCodeContext;
    {
        ctx.backend = backend
        ctx.fileio = fileio
        ctx.identifiers = identifiers
    }
    emit_program(@ctx, asm_ast[])
    free_AsmProgram(asm_ast)
}
