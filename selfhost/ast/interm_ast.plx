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
type struc FileIoContext;
type struc Pairhash_thash_t(key: u64, value: u64)
type struc FileOpenLine(    linenum: u64    , total_linenum: u64    , filename: string    )
type struc TokenInfo(    tok_pos: i32    , tok_len: i32    , total_linenum: u64    )
type struc ErrorsContext(    errors: *struc ErrorsContext    , fileio: *struc FileIoContext    , msg: [1024]char    , is_stdout: i32    , info_at_buf: u64    , info_at_map: *struc Pairhash_thash_t    , fopen_lines: *struc FileOpenLine    , token_infos: *struc TokenInfo    )
pub fn panic_sigabrt(msg: string, line: i32, file: string) none;
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
pub fn make_TacUnaryOp(type: i32) struc TacUnaryOp {
    self: struc TacUnaryOp = $(type)
    match type {
        -> 147 {
            -> 148 {
                -> 149 {
                    -> 150 {
                        return self
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort", 24, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
}
pub fn make_TacBinaryOp(type: i32) struc TacBinaryOp {
    self: struc TacBinaryOp = $(type)
    match type {
        -> 151 {
            -> 152 {
                -> 153 {
                    -> 154 {
                        -> 155 {
                            -> 156 {
                                -> 157 {
                                    -> 158 {
                                        -> 159 {
                                            -> 160 {
                                                -> 161 {
                                                    -> 162 {
                                                        -> 163 {
                                                            -> 164 {
                                                                -> 165 {
                                                                    -> 166 {
                                                                        -> 167 {
                                                                            -> 168 {
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
        otherwise {
            panic_sigabrt("abort", 51, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
}
pub fn make_TacValue(none) *struc TacValue {
    self: *struc TacValue = 0
    loop .. while 0 {
        loop .. while 0 {
            free_TacValue(@self)
            self = cast<*struc TacValue>(malloc(sizeof<struc TacValue>))
            if not self {
                panic_sigabrt("alloc " "TacValue", 57, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].type = 169
    return self
}
pub fn make_TacConstant(constant: **struc CConst) *struc TacValue {
    self: *struc TacValue = make_TacValue()
    self[].type = 170
    self[].get._TacConstant.constant = 0
    if constant[] ~= self[].get._TacConstant.constant {
        free_CConst(@self[].get._TacConstant.constant)
        self[].get._TacConstant.constant = constant[]
        constant[] = 0
    }
    ;
    return self
}
pub fn make_TacVariable(name: u64) *struc TacValue {
    self: *struc TacValue = make_TacValue()
    self[].type = 171
    self[].get._TacVariable.name = name
    return self
}
pub fn free_TacValue(self: **struc TacValue) none {
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
        -> 169 {
            break
        }
        -> 170 {
            free_CConst(@(self[])[].get._TacConstant.constant)
        }
        break
        -> 171 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 88, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_TacExpResult(none) *struc TacExpResult {
    self: *struc TacExpResult = 0
    loop .. while 0 {
        free_TacExpResult(@self)
        self = cast<*struc TacExpResult>(malloc(sizeof<struc TacExpResult>))
        if not self {
            panic_sigabrt("alloc " "TacExpResult", 95, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    self[].type = 172
    return self
}
pub fn make_TacPlainOperand(val: **struc TacValue) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].type = 173
    self[].get._TacPlainOperand.val = 0
    if val[] ~= self[].get._TacPlainOperand.val {
        free_TacValue(@self[].get._TacPlainOperand.val)
        self[].get._TacPlainOperand.val = val[]
        val[] = 0
    }
    ;
    return self
}
pub fn make_TacDereferencedPointer(val: **struc TacValue) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].type = 174
    self[].get._TacDereferencedPointer.val = 0
    if val[] ~= self[].get._TacDereferencedPointer.val {
        free_TacValue(@self[].get._TacDereferencedPointer.val)
        self[].get._TacDereferencedPointer.val = val[]
        val[] = 0
    }
    ;
    return self
}
pub fn make_TacSubObject(base_name: u64, offset: i64) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].type = 175
    self[].get._TacSubObject.base_name = base_name
    self[].get._TacSubObject.offset = offset
    return self
}
pub fn free_TacExpResult(self: **struc TacExpResult) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 172 {
            break
        }
        -> 173 {
            free_TacValue(@(self[])[].get._TacPlainOperand.val)
        }
        break
        -> 174 {
            free_TacValue(@(self[])[].get._TacDereferencedPointer.val)
        }
        break
        -> 175 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 138, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_TacInstruction(none) *struc TacInstruction {
    self: *struc TacInstruction = 0
    loop .. while 0 {
        free_TacInstruction(@self)
        self = cast<*struc TacInstruction>(malloc(sizeof<struc TacInstruction>))
        if not self {
            panic_sigabrt("alloc " "TacInstruction", 145, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    self[].type = 176
    return self
}
pub fn make_TacReturn(val: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 177
    self[].get._TacReturn.val = 0
    if val[] ~= self[].get._TacReturn.val {
        free_TacValue(@self[].get._TacReturn.val)
        self[].get._TacReturn.val = val[]
        val[] = 0
    }
    ;
    return self
}
pub fn make_TacSignExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 178
    self[].get._TacSignExtend.src = 0
    if src[] ~= self[].get._TacSignExtend.src {
        free_TacValue(@self[].get._TacSignExtend.src)
        self[].get._TacSignExtend.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacSignExtend.dst = 0
    if dst[] ~= self[].get._TacSignExtend.dst {
        free_TacValue(@self[].get._TacSignExtend.dst)
        self[].get._TacSignExtend.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacTruncate(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 179
    self[].get._TacTruncate.src = 0
    if src[] ~= self[].get._TacTruncate.src {
        free_TacValue(@self[].get._TacTruncate.src)
        self[].get._TacTruncate.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacTruncate.dst = 0
    if dst[] ~= self[].get._TacTruncate.dst {
        free_TacValue(@self[].get._TacTruncate.dst)
        self[].get._TacTruncate.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacZeroExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 180
    self[].get._TacZeroExtend.src = 0
    if src[] ~= self[].get._TacZeroExtend.src {
        free_TacValue(@self[].get._TacZeroExtend.src)
        self[].get._TacZeroExtend.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacZeroExtend.dst = 0
    if dst[] ~= self[].get._TacZeroExtend.dst {
        free_TacValue(@self[].get._TacZeroExtend.dst)
        self[].get._TacZeroExtend.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacDoubleToInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 181
    self[].get._TacDoubleToInt.src = 0
    if src[] ~= self[].get._TacDoubleToInt.src {
        free_TacValue(@self[].get._TacDoubleToInt.src)
        self[].get._TacDoubleToInt.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacDoubleToInt.dst = 0
    if dst[] ~= self[].get._TacDoubleToInt.dst {
        free_TacValue(@self[].get._TacDoubleToInt.dst)
        self[].get._TacDoubleToInt.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacDoubleToUInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 182
    self[].get._TacDoubleToUInt.src = 0
    if src[] ~= self[].get._TacDoubleToUInt.src {
        free_TacValue(@self[].get._TacDoubleToUInt.src)
        self[].get._TacDoubleToUInt.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacDoubleToUInt.dst = 0
    if dst[] ~= self[].get._TacDoubleToUInt.dst {
        free_TacValue(@self[].get._TacDoubleToUInt.dst)
        self[].get._TacDoubleToUInt.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 183
    self[].get._TacIntToDouble.src = 0
    if src[] ~= self[].get._TacIntToDouble.src {
        free_TacValue(@self[].get._TacIntToDouble.src)
        self[].get._TacIntToDouble.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacIntToDouble.dst = 0
    if dst[] ~= self[].get._TacIntToDouble.dst {
        free_TacValue(@self[].get._TacIntToDouble.dst)
        self[].get._TacIntToDouble.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacUIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 184
    self[].get._TacUIntToDouble.src = 0
    if src[] ~= self[].get._TacUIntToDouble.src {
        free_TacValue(@self[].get._TacUIntToDouble.src)
        self[].get._TacUIntToDouble.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacUIntToDouble.dst = 0
    if dst[] ~= self[].get._TacUIntToDouble.dst {
        free_TacValue(@self[].get._TacUIntToDouble.dst)
        self[].get._TacUIntToDouble.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacFunCall(name: u64, args: ***struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 185
    self[].get._TacFunCall.name = name
    self[].get._TacFunCall.args = 0
    if args[] ~= self[].get._TacFunCall.args {
        if self[].get._TacFunCall.args {
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunCall.args) then free((cast<*struc stbds_array_header>((self[].get._TacFunCall.args)) - 1)) else cast<none>(0)))
                (self[].get._TacFunCall.args) = 0
            }
            self[].get._TacFunCall.args = 0
        }
        ;
        self[].get._TacFunCall.args = args[]
        args[] = 0
    }
    ;
    self[].get._TacFunCall.dst = 0
    if dst[] ~= self[].get._TacFunCall.dst {
        free_TacValue(@self[].get._TacFunCall.dst)
        self[].get._TacFunCall.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacUnary(unop: *struc TacUnaryOp, src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 186
    self[].get._TacUnary.unop = unop[]
    self[].get._TacUnary.src = 0
    if src[] ~= self[].get._TacUnary.src {
        free_TacValue(@self[].get._TacUnary.src)
        self[].get._TacUnary.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacUnary.dst = 0
    if dst[] ~= self[].get._TacUnary.dst {
        free_TacValue(@self[].get._TacUnary.dst)
        self[].get._TacUnary.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacBinary(binop: *struc TacBinaryOp, src1: **struc TacValue, src2: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 187
    self[].get._TacBinary.binop = binop[]
    self[].get._TacBinary.src1 = 0
    if src1[] ~= self[].get._TacBinary.src1 {
        free_TacValue(@self[].get._TacBinary.src1)
        self[].get._TacBinary.src1 = src1[]
        src1[] = 0
    }
    ;
    self[].get._TacBinary.src2 = 0
    if src2[] ~= self[].get._TacBinary.src2 {
        free_TacValue(@self[].get._TacBinary.src2)
        self[].get._TacBinary.src2 = src2[]
        src2[] = 0
    }
    ;
    self[].get._TacBinary.dst = 0
    if dst[] ~= self[].get._TacBinary.dst {
        free_TacValue(@self[].get._TacBinary.dst)
        self[].get._TacBinary.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacCopy(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 188
    self[].get._TacCopy.src = 0
    if src[] ~= self[].get._TacCopy.src {
        free_TacValue(@self[].get._TacCopy.src)
        self[].get._TacCopy.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacCopy.dst = 0
    if dst[] ~= self[].get._TacCopy.dst {
        free_TacValue(@self[].get._TacCopy.dst)
        self[].get._TacCopy.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacGetAddress(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 189
    self[].get._TacGetAddress.src = 0
    if src[] ~= self[].get._TacGetAddress.src {
        free_TacValue(@self[].get._TacGetAddress.src)
        self[].get._TacGetAddress.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacGetAddress.dst = 0
    if dst[] ~= self[].get._TacGetAddress.dst {
        free_TacValue(@self[].get._TacGetAddress.dst)
        self[].get._TacGetAddress.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacLoad(src_ptr: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 190
    self[].get._TacLoad.src_ptr = 0
    if src_ptr[] ~= self[].get._TacLoad.src_ptr {
        free_TacValue(@self[].get._TacLoad.src_ptr)
        self[].get._TacLoad.src_ptr = src_ptr[]
        src_ptr[] = 0
    }
    ;
    self[].get._TacLoad.dst = 0
    if dst[] ~= self[].get._TacLoad.dst {
        free_TacValue(@self[].get._TacLoad.dst)
        self[].get._TacLoad.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacStore(src: **struc TacValue, dst_ptr: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 191
    self[].get._TacStore.src = 0
    if src[] ~= self[].get._TacStore.src {
        free_TacValue(@self[].get._TacStore.src)
        self[].get._TacStore.src = src[]
        src[] = 0
    }
    ;
    self[].get._TacStore.dst_ptr = 0
    if dst_ptr[] ~= self[].get._TacStore.dst_ptr {
        free_TacValue(@self[].get._TacStore.dst_ptr)
        self[].get._TacStore.dst_ptr = dst_ptr[]
        dst_ptr[] = 0
    }
    ;
    return self
}
pub fn make_TacAddPtr(scale: i64, src_ptr: **struc TacValue, idx: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 192
    self[].get._TacAddPtr.scale = scale
    self[].get._TacAddPtr.src_ptr = 0
    if src_ptr[] ~= self[].get._TacAddPtr.src_ptr {
        free_TacValue(@self[].get._TacAddPtr.src_ptr)
        self[].get._TacAddPtr.src_ptr = src_ptr[]
        src_ptr[] = 0
    }
    ;
    self[].get._TacAddPtr.idx = 0
    if idx[] ~= self[].get._TacAddPtr.idx {
        free_TacValue(@self[].get._TacAddPtr.idx)
        self[].get._TacAddPtr.idx = idx[]
        idx[] = 0
    }
    ;
    self[].get._TacAddPtr.dst = 0
    if dst[] ~= self[].get._TacAddPtr.dst {
        free_TacValue(@self[].get._TacAddPtr.dst)
        self[].get._TacAddPtr.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacCopyToOffset(dst_name: u64, offset: i64, src: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 193
    self[].get._TacCopyToOffset.dst_name = dst_name
    self[].get._TacCopyToOffset.offset = offset
    self[].get._TacCopyToOffset.src = 0
    if src[] ~= self[].get._TacCopyToOffset.src {
        free_TacValue(@self[].get._TacCopyToOffset.src)
        self[].get._TacCopyToOffset.src = src[]
        src[] = 0
    }
    ;
    return self
}
pub fn make_TacCopyFromOffset(src_name: u64, offset: i64, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 194
    self[].get._TacCopyFromOffset.src_name = src_name
    self[].get._TacCopyFromOffset.offset = offset
    self[].get._TacCopyFromOffset.dst = 0
    if dst[] ~= self[].get._TacCopyFromOffset.dst {
        free_TacValue(@self[].get._TacCopyFromOffset.dst)
        self[].get._TacCopyFromOffset.dst = dst[]
        dst[] = 0
    }
    ;
    return self
}
pub fn make_TacJump(target: u64) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 195
    self[].get._TacJump.target = target
    return self
}
pub fn make_TacJumpIfZero(target: u64, condition: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 196
    self[].get._TacJumpIfZero.target = target
    self[].get._TacJumpIfZero.condition = 0
    if condition[] ~= self[].get._TacJumpIfZero.condition {
        free_TacValue(@self[].get._TacJumpIfZero.condition)
        self[].get._TacJumpIfZero.condition = condition[]
        condition[] = 0
    }
    ;
    return self
}
pub fn make_TacJumpIfNotZero(target: u64, condition: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 197
    self[].get._TacJumpIfNotZero.target = target
    self[].get._TacJumpIfNotZero.condition = 0
    if condition[] ~= self[].get._TacJumpIfNotZero.condition {
        free_TacValue(@self[].get._TacJumpIfNotZero.condition)
        self[].get._TacJumpIfNotZero.condition = condition[]
        condition[] = 0
    }
    ;
    return self
}
pub fn make_TacLabel(name: u64) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].type = 198
    self[].get._TacLabel.name = name
    return self
}
pub fn free_TacInstruction(self: **struc TacInstruction) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 176 {
            break
        }
        -> 177 {
            free_TacValue(@(self[])[].get._TacReturn.val)
        }
        break
        -> 178 {
            free_TacValue(@(self[])[].get._TacSignExtend.src)
        }
        free_TacValue(@(self[])[].get._TacSignExtend.dst)
        break
        -> 179 {
            free_TacValue(@(self[])[].get._TacTruncate.src)
        }
        free_TacValue(@(self[])[].get._TacTruncate.dst)
        break
        -> 180 {
            free_TacValue(@(self[])[].get._TacZeroExtend.src)
        }
        free_TacValue(@(self[])[].get._TacZeroExtend.dst)
        break
        -> 181 {
            free_TacValue(@(self[])[].get._TacDoubleToInt.src)
        }
        free_TacValue(@(self[])[].get._TacDoubleToInt.dst)
        break
        -> 182 {
            free_TacValue(@(self[])[].get._TacDoubleToUInt.src)
        }
        free_TacValue(@(self[])[].get._TacDoubleToUInt.dst)
        break
        -> 183 {
            free_TacValue(@(self[])[].get._TacIntToDouble.src)
        }
        free_TacValue(@(self[])[].get._TacIntToDouble.dst)
        break
        -> 184 {
            free_TacValue(@(self[])[].get._TacUIntToDouble.src)
        }
        free_TacValue(@(self[])[].get._TacUIntToDouble.dst)
        break
        -> 185 {
            loop i: u64 = 0 while i < (? ((self[])[].get._TacFunCall.args) then (cast<*struc stbds_array_header>(((self[])[].get._TacFunCall.args)) - 1)[].length else 0) .. ++i {
                free_TacValue(@(self[])[].get._TacFunCall.args[i])
            }
        }
        if (self[])[].get._TacFunCall.args {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacFunCall.args) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunCall.args)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacFunCall.args) = 0
            }
            (self[])[].get._TacFunCall.args = 0
        }
        ;
        free_TacValue(@(self[])[].get._TacFunCall.dst)
        break
        -> 186 {
            free_TacValue(@(self[])[].get._TacUnary.src)
        }
        free_TacValue(@(self[])[].get._TacUnary.dst)
        break
        -> 187 {
            free_TacValue(@(self[])[].get._TacBinary.src1)
        }
        free_TacValue(@(self[])[].get._TacBinary.src2)
        free_TacValue(@(self[])[].get._TacBinary.dst)
        break
        -> 188 {
            free_TacValue(@(self[])[].get._TacCopy.src)
        }
        free_TacValue(@(self[])[].get._TacCopy.dst)
        break
        -> 189 {
            free_TacValue(@(self[])[].get._TacGetAddress.src)
        }
        free_TacValue(@(self[])[].get._TacGetAddress.dst)
        break
        -> 190 {
            free_TacValue(@(self[])[].get._TacLoad.src_ptr)
        }
        free_TacValue(@(self[])[].get._TacLoad.dst)
        break
        -> 191 {
            free_TacValue(@(self[])[].get._TacStore.src)
        }
        free_TacValue(@(self[])[].get._TacStore.dst_ptr)
        break
        -> 192 {
            free_TacValue(@(self[])[].get._TacAddPtr.src_ptr)
        }
        free_TacValue(@(self[])[].get._TacAddPtr.idx)
        free_TacValue(@(self[])[].get._TacAddPtr.dst)
        break
        -> 193 {
            free_TacValue(@(self[])[].get._TacCopyToOffset.src)
        }
        break
        -> 194 {
            free_TacValue(@(self[])[].get._TacCopyFromOffset.dst)
        }
        break
        -> 195 {
            break
        }
        -> 196 {
            free_TacValue(@(self[])[].get._TacJumpIfZero.condition)
        }
        break
        -> 197 {
            free_TacValue(@(self[])[].get._TacJumpIfNotZero.condition)
        }
        break
        -> 198 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 462, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_TacTopLevel(none) *struc TacTopLevel {
    self: *struc TacTopLevel = 0
    loop .. while 0 {
        free_TacTopLevel(@self)
        self = cast<*struc TacTopLevel>(malloc(sizeof<struc TacTopLevel>))
        if not self {
            panic_sigabrt("alloc " "TacTopLevel", 469, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    self[].type = 199
    return self
}
pub fn make_TacFunction(name: u64, is_glob: i32, params: **u64, body: ***struc TacInstruction) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].type = 200
    self[].get._TacFunction.name = name
    self[].get._TacFunction.is_glob = is_glob
    self[].get._TacFunction.params = 0
    if params[] ~= self[].get._TacFunction.params {
        if self[].get._TacFunction.params {
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunction.params) then free((cast<*struc stbds_array_header>((self[].get._TacFunction.params)) - 1)) else cast<none>(0)))
                (self[].get._TacFunction.params) = 0
            }
            self[].get._TacFunction.params = 0
        }
        ;
        self[].get._TacFunction.params = params[]
        params[] = 0
    }
    ;
    self[].get._TacFunction.body = 0
    if body[] ~= self[].get._TacFunction.body {
        if self[].get._TacFunction.body {
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunction.body) then free((cast<*struc stbds_array_header>((self[].get._TacFunction.body)) - 1)) else cast<none>(0)))
                (self[].get._TacFunction.body) = 0
            }
            self[].get._TacFunction.body = 0
        }
        ;
        self[].get._TacFunction.body = body[]
        body[] = 0
    }
    ;
    return self
}
pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: ***struc StaticInit) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].type = 201
    self[].get._TacStaticVariable.name = name
    self[].get._TacStaticVariable.is_glob = is_glob
    self[].get._TacStaticVariable.static_init_type = 0
    if static_init_type[] ~= self[].get._TacStaticVariable.static_init_type {
        free_Type(@self[].get._TacStaticVariable.static_init_type)
        self[].get._TacStaticVariable.static_init_type = static_init_type[]
        static_init_type[] = 0
    }
    ;
    self[].get._TacStaticVariable.static_inits = 0
    if static_inits[] ~= self[].get._TacStaticVariable.static_inits {
        if self[].get._TacStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? (self[].get._TacStaticVariable.static_inits) then free((cast<*struc stbds_array_header>((self[].get._TacStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._TacStaticVariable.static_inits) = 0
            }
            self[].get._TacStaticVariable.static_inits = 0
        }
        ;
        self[].get._TacStaticVariable.static_inits = static_inits[]
        static_inits[] = 0
    }
    ;
    return self
}
pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].type = 202
    self[].get._TacStaticConstant.name = name
    self[].get._TacStaticConstant.static_init_type = 0
    if static_init_type[] ~= self[].get._TacStaticConstant.static_init_type {
        free_Type(@self[].get._TacStaticConstant.static_init_type)
        self[].get._TacStaticConstant.static_init_type = static_init_type[]
        static_init_type[] = 0
    }
    ;
    self[].get._TacStaticConstant.static_init = 0
    if static_init[] ~= self[].get._TacStaticConstant.static_init {
        free_StaticInit(@self[].get._TacStaticConstant.static_init)
        self[].get._TacStaticConstant.static_init = static_init[]
        static_init[] = 0
    }
    ;
    return self
}
pub fn free_TacTopLevel(self: **struc TacTopLevel) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 199 {
            break
        }
        -> 200 {
            if (self[])[].get._TacFunction.params {
                loop .. while 0 {
                    cast<none>((? ((self[])[].get._TacFunction.params) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunction.params)) - 1)) else cast<none>(0)))
                    ((self[])[].get._TacFunction.params) = 0
                }
                (self[])[].get._TacFunction.params = 0
            }
        }
        ;
        loop i: u64 = 0 while i < (? ((self[])[].get._TacFunction.body) then (cast<*struc stbds_array_header>(((self[])[].get._TacFunction.body)) - 1)[].length else 0) .. ++i {
            free_TacInstruction(@(self[])[].get._TacFunction.body[i])
        }
        if (self[])[].get._TacFunction.body {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacFunction.body) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunction.body)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacFunction.body) = 0
            }
            (self[])[].get._TacFunction.body = 0
        }
        ;
        break
        -> 201 {
            free_Type(@(self[])[].get._TacStaticVariable.static_init_type)
        }
        loop i: u64 = 0 while i < (? ((self[])[].get._TacStaticVariable.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._TacStaticVariable.static_inits)) - 1)[].length else 0) .. ++i {
            free_StaticInit(@(self[])[].get._TacStaticVariable.static_inits[i])
        }
        if (self[])[].get._TacStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacStaticVariable.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._TacStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacStaticVariable.static_inits) = 0
            }
            (self[])[].get._TacStaticVariable.static_inits = 0
        }
        ;
        break
        -> 202 {
            free_Type(@(self[])[].get._TacStaticConstant.static_init_type)
        }
        free_StaticInit(@(self[])[].get._TacStaticConstant.static_init)
        break
        otherwise {
            panic_sigabrt("abort", 536, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
pub fn make_TacProgram(static_const_toplvls: ***struc TacTopLevel, static_var_toplvls: ***struc TacTopLevel, fun_toplvls: ***struc TacTopLevel) *struc TacProgram {
    self: *struc TacProgram = 0
    loop .. while 0 {
        free_TacProgram(@self)
        self = cast<*struc TacProgram>(malloc(sizeof<struc TacProgram>))
        if not self {
            panic_sigabrt("alloc " "TacProgram", 544, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    self[].type = 203
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
    self[].static_var_toplvls = 0
    if static_var_toplvls[] ~= self[].static_var_toplvls {
        if self[].static_var_toplvls {
            loop .. while 0 {
                cast<none>((? (self[].static_var_toplvls) then free((cast<*struc stbds_array_header>((self[].static_var_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_var_toplvls) = 0
            }
            self[].static_var_toplvls = 0
        }
        ;
        self[].static_var_toplvls = static_var_toplvls[]
        static_var_toplvls[] = 0
    }
    ;
    self[].fun_toplvls = 0
    if fun_toplvls[] ~= self[].fun_toplvls {
        if self[].fun_toplvls {
            loop .. while 0 {
                cast<none>((? (self[].fun_toplvls) then free((cast<*struc stbds_array_header>((self[].fun_toplvls)) - 1)) else cast<none>(0)))
                (self[].fun_toplvls) = 0
            }
            self[].fun_toplvls = 0
        }
        ;
        self[].fun_toplvls = fun_toplvls[]
        fun_toplvls[] = 0
    }
    ;
    return self
}
pub fn free_TacProgram(self: **struc TacProgram) none {
    if not self[] {
        return none
    }
    ;
    match (self[])[].type {
        -> 203 {
            break
        }
        otherwise {
            panic_sigabrt("abort", 561, "/home/romain/proj/planet/selfhost/wheelcc/ast/interm_ast.c")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_const_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].static_const_toplvls[i])
    }
    if (self[])[].static_const_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].static_const_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_const_toplvls) = 0
        }
        (self[])[].static_const_toplvls = 0
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].static_var_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_var_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].static_var_toplvls[i])
    }
    if (self[])[].static_var_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].static_var_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_var_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_var_toplvls) = 0
        }
        (self[])[].static_var_toplvls = 0
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].fun_toplvls) then (cast<*struc stbds_array_header>(((self[])[].fun_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].fun_toplvls[i])
    }
    if (self[])[].fun_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].fun_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].fun_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].fun_toplvls) = 0
        }
        (self[])[].fun_toplvls = 0
    }
    ;
    if self[] {
        free(self[])
        self[] = 0
    }
    ;
}
