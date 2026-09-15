m4_include(`ast.plx.m4')m4_dnl
m4_include(`front_symt.plx.m4')m4_dnl
m4_include(`interm_ast.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl






type struc CConst;
type struc CStringLiteral;

type struc CConstInt(value: i32)

type struc CConstLong(value: i64)

type struc CConstUInt(value: u32)

type struc CConstULong(value: u64)

type struc CConstDouble(value: f64)

type struc CConstChar(value: i8)

type struc CConstUChar(value: u8)

type union _CConst(_CConstInt: struc CConstInt, _CConstLong: struc CConstLong, _CConstUInt: struc CConstUInt, _CConstULong: struc CConstULong, _CConstDouble: struc CConstDouble, _CConstChar: struc CConstChar, _CConstUChar: struc CConstUChar)

type struc CConst(_ref_count: u64, tag: i32, get: union _CConst)
pub fn make_CConst(none) *struc CConst;
pub fn make_CConstInt(value: i32) *struc CConst;
pub fn make_CConstLong(value: i64) *struc CConst;
pub fn make_CConstUInt(value: u32) *struc CConst;
pub fn make_CConstULong(value: u64) *struc CConst;
pub fn make_CConstDouble(value: f64) *struc CConst;
pub fn make_CConstChar(value: i8) *struc CConst;
pub fn make_CConstUChar(value: u8) *struc CConst;
pub fn free_CConst(self: **struc CConst) none;

type struc CStringLiteral(_ref_count: u64, tag: i32, value: *i8)
pub fn make_CStringLiteral(value: **i8) *struc CStringLiteral;
pub fn free_CStringLiteral(self: **struc CStringLiteral) none;

type struc PairTIdentifierstring_t(key: u64, value: string)

type struc IdentifierContext(label_count: u32, var_count: u32, struct_count: u32, hash_table: *struc PairTIdentifierstring_t)

pub fn make_string_identifier(ctx: *struc IdentifierContext, value: *string) u64;
pub fn make_label_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_var_identifier(ctx: *struc IdentifierContext, name: *string) u64;
pub fn make_struct_identifier(ctx: *struc IdentifierContext, name: *string) u64;
m4_define(`UID_SEPARATOR', `TODO')m4_dnl
type struc Type;
type struc StaticInit;
type struc InitialValue;
type struc IdentifierAttr;
type struc Symbol;
type struc StructMember;
type struc StructTypedef;

type struc Char(_empty: char)

type struc SChar(_empty: char)

type struc UChar(_empty: char)

type struc Int(_empty: char)

type struc Long(_empty: char)

type struc UInt(_empty: char)

type struc ULong(_empty: char)

type struc Double(_empty: char)

type struc Void(_empty: char)

type struc FunType(param_reg_mask: u64, ret_reg_mask: u64, param_types: **struc Type, ret_type: *struc Type)

type struc Pointer(ref_type: *struc Type)

type struc Array(size: i64, elem_type: *struc Type)

type struc Structure(tag_name: u64, is_union: i32)

type union _Type(_Char: struc Char, _SChar: struc SChar, _UChar: struc UChar, _Int: struc Int, _Long: struc Long, _UInt: struc UInt, _ULong: struc ULong, _Double: struc Double, _Void: struc Void, _FunType: struc FunType, _Pointer: struc Pointer, _Array: struc Array, _Structure: struc Structure)

type struc Type(_ref_count: u64, tag: i32, get: union _Type)
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
pub fn make_Structure(tag_name: u64, is_union: i32) *struc Type;
pub fn free_Type(self: **struc Type) none;

type struc IntInit(value: i32)

type struc LongInit(value: i64)

type struc UIntInit(value: u32)

type struc ULongInit(value: u64)

type struc CharInit(value: i8)

type struc UCharInit(value: u8)

type struc DoubleInit(dbl_const: u64)

type struc ZeroInit(byte: i64)

type struc StringInit(string_const: u64, is_null_term: i32, literal: *struc CStringLiteral)

type struc PointerInit(name: u64)

type union _StaticInit(_IntInit: struc IntInit, _LongInit: struc LongInit, _UIntInit: struc UIntInit, _ULongInit: struc ULongInit, _CharInit: struc CharInit, _UCharInit: struc UCharInit, _DoubleInit: struc DoubleInit, _ZeroInit: struc ZeroInit, _StringInit: struc StringInit, _PointerInit: struc PointerInit)

type struc StaticInit(_ref_count: u64, tag: i32, get: union _StaticInit)
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

type struc Tentative(_empty: char)

type struc Initial(static_inits: **struc StaticInit)

type struc NoInitializer(_empty: char)

type union _InitialValue(_Tentative: struc Tentative, _Initial: struc Initial, _NoInitializer: struc NoInitializer)

type struc InitialValue(_ref_count: u64, tag: i32, get: union _InitialValue)
pub fn make_InitialValue(none) *struc InitialValue;
pub fn make_Tentative(none) *struc InitialValue;
pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue;
pub fn make_NoInitializer(none) *struc InitialValue;
pub fn free_InitialValue(self: **struc InitialValue) none;

type struc FunAttr(is_def: i32, is_glob: i32)

type struc StaticAttr(is_glob: i32, init: *struc InitialValue)

type struc ConstantAttr(static_init: *struc StaticInit)

type struc LocalAttr(_empty: char)

type union _IdentifierAttr(_FunAttr: struc FunAttr, _StaticAttr: struc StaticAttr, _ConstantAttr: struc ConstantAttr, _LocalAttr: struc LocalAttr)

type struc IdentifierAttr(tag: i32, get: union _IdentifierAttr)
pub fn make_IdentifierAttr(none) *struc IdentifierAttr;
pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr;
pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr;
pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr;
pub fn make_LocalAttr(none) *struc IdentifierAttr;
pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none;

type struc Symbol(tag: i32, type_t: *struc Type, attrs: *struc IdentifierAttr)
pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol;
pub fn free_Symbol(self: **struc Symbol) none;

type struc StructMember(tag: i32, offset: i64, member_type: *struc Type)
pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember;
pub fn free_StructMember(self: **struc StructMember) none;
m4_define(`UPtrStructMember', `TODO')m4_dnl

type struc PairTIdentifierUPtrStructMember(key: u64, value: *struc StructMember)

type struc StructTypedef(tag: i32, alignment: i32, size: i64, member_names: *u64, members: *struc PairTIdentifierUPtrStructMember)
pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef;
pub fn free_StructTypedef(self: **struc StructTypedef) none;
m4_define(`ulong_t', `TODO')m4_dnl

type struc PairTIdentifierulong_t(key: u64, value: u64)

type struc PairTIdentifierTIdentifier(key: u64, value: u64)

m4_define(`UPtrStructTypedef', `TODO')m4_dnl

type struc PairTIdentifierUPtrStructTypedef(key: u64, value: *struc StructTypedef)

m4_define(`UPtrSymbol', `TODO')m4_dnl

type struc PairTIdentifierUPtrSymbol(key: u64, value: *struc Symbol)

type struc ElementTIdentifier(key: u64, value: char)

type struc FrontEndContext(string_const_table: *struc PairTIdentifierTIdentifier, struct_typedef_table: *struc PairTIdentifierUPtrStructTypedef, symbol_table: *struc PairTIdentifierUPtrSymbol, addressed_set: *struc ElementTIdentifier)
pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag_name: u64, member_name: u64) *struc StructMember;
pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag_name: u64) *struc StructMember;
type struc TacUnaryOp;
type struc TacBinaryOp;
type struc TacValue;
type struc TacExpResult;
type struc TacInstruction;
type struc TacTopLevel;
type struc TacProgram;

type struc TacUnaryOp(tag: i32)
pub fn make_TacUnaryOp(tag: i32) struc TacUnaryOp;
m4_define(`init_TacUnaryOp', `TODO')m4_dnl
m4_define(`init_TacComplement', `TODO')m4_dnl
m4_define(`init_TacNegate', `TODO')m4_dnl
m4_define(`init_TacNot', `TODO')m4_dnl

type struc TacBinaryOp(tag: i32)
pub fn make_TacBinaryOp(tag: i32) struc TacBinaryOp;
m4_define(`init_TacBinaryOp', `TODO')m4_dnl
m4_define(`init_TacAdd', `TODO')m4_dnl
m4_define(`init_TacSubtract', `TODO')m4_dnl
m4_define(`init_TacMultiply', `TODO')m4_dnl
m4_define(`init_TacDivide', `TODO')m4_dnl
m4_define(`init_TacRemainder', `TODO')m4_dnl
m4_define(`init_TacBitAnd', `TODO')m4_dnl
m4_define(`init_TacBitOr', `TODO')m4_dnl
m4_define(`init_TacBitXor', `TODO')m4_dnl
m4_define(`init_TacBitShiftLeft', `TODO')m4_dnl
m4_define(`init_TacBitShiftRight', `TODO')m4_dnl
m4_define(`init_TacBitShrArithmetic', `TODO')m4_dnl
m4_define(`init_TacEqual', `TODO')m4_dnl
m4_define(`init_TacNotEqual', `TODO')m4_dnl
m4_define(`init_TacLessThan', `TODO')m4_dnl
m4_define(`init_TacLessOrEqual', `TODO')m4_dnl
m4_define(`init_TacGreaterThan', `TODO')m4_dnl
m4_define(`init_TacGreaterOrEqual', `TODO')m4_dnl

type struc TacConstant(constant: *struc CConst)

type struc TacVariable(name: u64)

type union _TacValue(_TacConstant: struc TacConstant, _TacVariable: struc TacVariable)

type struc TacValue(_ref_count: u64, tag: i32, get: union _TacValue)
pub fn make_TacValue(none) *struc TacValue;
pub fn make_TacConstant(constant: **struc CConst) *struc TacValue;
pub fn make_TacVariable(name: u64) *struc TacValue;
pub fn free_TacValue(self: **struc TacValue) none;

type struc TacPlainOperand(val: *struc TacValue)

type struc TacDereferencedPointer(val: *struc TacValue)

type struc TacSubObject(base_name: u64, offset: i64)

type union _TacExpResult(_TacPlainOperand: struc TacPlainOperand, _TacDereferencedPointer: struc TacDereferencedPointer, _TacSubObject: struc TacSubObject)

type struc TacExpResult(tag: i32, get: union _TacExpResult)
pub fn make_TacExpResult(none) *struc TacExpResult;
pub fn make_TacPlainOperand(val: **struc TacValue) *struc TacExpResult;
pub fn make_TacDereferencedPointer(val: **struc TacValue) *struc TacExpResult;
pub fn make_TacSubObject(base_name: u64, offset: i64) *struc TacExpResult;
pub fn free_TacExpResult(self: **struc TacExpResult) none;

type struc TacReturn(val: *struc TacValue)

type struc TacSignExtend(src: *struc TacValue, dst: *struc TacValue)

type struc TacTruncate(src: *struc TacValue, dst: *struc TacValue)

type struc TacZeroExtend(src: *struc TacValue, dst: *struc TacValue)

type struc TacDoubleToInt(src: *struc TacValue, dst: *struc TacValue)

type struc TacDoubleToUInt(src: *struc TacValue, dst: *struc TacValue)

type struc TacIntToDouble(src: *struc TacValue, dst: *struc TacValue)

type struc TacUIntToDouble(src: *struc TacValue, dst: *struc TacValue)

type struc TacFunCall(name: u64, args: **struc TacValue, dst: *struc TacValue)

type struc TacUnary(unop: struc TacUnaryOp, src: *struc TacValue, dst: *struc TacValue)

type struc TacBinary(binop: struc TacBinaryOp, src1: *struc TacValue, src2: *struc TacValue, dst: *struc TacValue)

type struc TacCopy(src: *struc TacValue, dst: *struc TacValue)

type struc TacGetAddress(src: *struc TacValue, dst: *struc TacValue)

type struc TacLoad(src_ptr: *struc TacValue, dst: *struc TacValue)

type struc TacStore(src: *struc TacValue, dst_ptr: *struc TacValue)

type struc TacAddPtr(scale: i64, src_ptr: *struc TacValue, idx: *struc TacValue, dst: *struc TacValue)

type struc TacCopyToOffset(dst_name: u64, offset: i64, src: *struc TacValue)

type struc TacCopyFromOffset(src_name: u64, offset: i64, dst: *struc TacValue)

type struc TacJump(target: u64)

type struc TacJumpIfZero(target: u64, condition: *struc TacValue)

type struc TacJumpIfNotZero(target: u64, condition: *struc TacValue)

type struc TacLabel(name: u64)

type union _TacInstruction(_TacReturn: struc TacReturn, _TacSignExtend: struc TacSignExtend, _TacTruncate: struc TacTruncate, _TacZeroExtend: struc TacZeroExtend, _TacDoubleToInt: struc TacDoubleToInt, _TacDoubleToUInt: struc TacDoubleToUInt, _TacIntToDouble: struc TacIntToDouble, _TacUIntToDouble: struc TacUIntToDouble, _TacFunCall: struc TacFunCall, _TacUnary: struc TacUnary, _TacBinary: struc TacBinary, _TacCopy: struc TacCopy, _TacGetAddress: struc TacGetAddress, _TacLoad: struc TacLoad, _TacStore: struc TacStore, _TacAddPtr: struc TacAddPtr, _TacCopyToOffset: struc TacCopyToOffset, _TacCopyFromOffset: struc TacCopyFromOffset, _TacJump: struc TacJump, _TacJumpIfZero: struc TacJumpIfZero, _TacJumpIfNotZero: struc TacJumpIfNotZero, _TacLabel: struc TacLabel)

type struc TacInstruction(tag: i32, get: union _TacInstruction)
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

type struc TacFunction(name: u64, is_glob: i32, params: *u64, body: **struc TacInstruction)

type struc TacStaticVariable(name: u64, is_glob: i32, static_init_type: *struc Type, static_inits: **struc StaticInit)

type struc TacStaticConstant(name: u64, static_init_type: *struc Type, static_init: *struc StaticInit)

type union _TacTopLevel(_TacFunction: struc TacFunction, _TacStaticVariable: struc TacStaticVariable, _TacStaticConstant: struc TacStaticConstant)

type struc TacTopLevel(tag: i32, get: union _TacTopLevel)
pub fn make_TacTopLevel(none) *struc TacTopLevel;
pub fn make_TacFunction(name: u64, is_glob: i32, params: **u64, body: ***struc TacInstruction) *struc TacTopLevel;
pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: ***struc StaticInit) *struc TacTopLevel;
pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel;
pub fn free_TacTopLevel(self: **struc TacTopLevel) none;

type struc TacProgram(tag: i32, static_const_toplvls: **struc TacTopLevel, static_var_toplvls: **struc TacTopLevel, fun_toplvls: **struc TacTopLevel)
pub fn make_TacProgram(static_const_toplvls: ***struc TacTopLevel, static_var_toplvls: ***struc TacTopLevel, fun_toplvls: ***struc TacTopLevel) *struc TacProgram;
pub fn free_TacProgram(self: **struc TacProgram) none;
type struc FileIoContext;
m4_define(`hash_t', `TODO')m4_dnl

type struc Pairhash_thash_t(key: u64, value: u64)

type struc FileOpenLine(linenum: u64, total_linenum: u64, filename: string)

type struc TokenInfo(tok_pos: i32, tok_len: i32, total_linenum: u64)

type struc ErrorsContext(errors: *struc ErrorsContext, fileio: *struc FileIoContext, msg: [ERROR_MSG_SIZE]char, is_stdout: i32, info_at_buf: u64, info_at_map: *struc Pairhash_thash_t, fopen_lines: *struc FileOpenLine, token_infos: *struc TokenInfo)

pub fn panic_sigabrt(msg: string) none;
m4_define(`PANIC_FUNC', `TODO')m4_dnl
m4_define(`THROW_ABORT', `TODO')m4_dnl
m4_define(`THROW_ALLOC', `TODO')m4_dnl
m4_define(`THROW_ABORT_IF', `TODO')m4_dnl
m4_define(`THROW_ABORT_IF', `TODO')m4_dnl
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
m4_define(`ERROR_MSG_BUF', `TODO')m4_dnl
m4_define(`THROW_INIT', `TODO')m4_dnl
m4_define(`THROW_BASE', `TODO')m4_dnl
m4_define(`THROW_AT_TOKEN', `TODO')m4_dnl

pub fn make_TacUnaryOp(tag: i32) struc TacUnaryOp {
    self: struc TacUnaryOp = $(tag)
    match tag {
        -> AST_TacUnaryOp_t {
            -> AST_TacComplement_t {
                -> AST_TacNegate_t {
                    -> AST_TacNot_t {
                        return self
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_TacBinaryOp(tag: i32) struc TacBinaryOp {
    self: struc TacBinaryOp = $(tag)
    match tag {
        -> AST_TacBinaryOp_t {
            -> AST_TacAdd_t {
                -> AST_TacSubtract_t {
                    -> AST_TacMultiply_t {
                        -> AST_TacDivide_t {
                            -> AST_TacRemainder_t {
                                -> AST_TacBitAnd_t {
                                    -> AST_TacBitOr_t {
                                        -> AST_TacBitXor_t {
                                            -> AST_TacBitShiftLeft_t {
                                                -> AST_TacBitShiftRight_t {
                                                    -> AST_TacBitShrArithmetic_t {
                                                        -> AST_TacEqual_t {
                                                            -> AST_TacNotEqual_t {
                                                                -> AST_TacLessThan_t {
                                                                    -> AST_TacLessOrEqual_t {
                                                                        -> AST_TacGreaterThan_t {
                                                                            -> AST_TacGreaterOrEqual_t {
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
            panic_sigabrt("abort")
        }
    }
}

pub fn make_TacValue(none) *struc TacValue {
    self: *struc TacValue = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_alloc(TacValue, self)"
        loop .. while 0 {
            "@MACRO@:uptr_alloc(TacValue, self)"
            free_TacValue(@self)
            self = cast<*struc TacValue>(malloc(sizeof<struc TacValue>))
            if not self {
                panic_sigabrt("alloc "                     "TacValue")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_TacValue_t
    return self
}

pub fn make_TacConstant(constant: **struc CConst) *struc TacValue {
    self: *struc TacValue = make_TacValue()
    self[].tag = AST_TacConstant_t
    self[].get._TacConstant.constant = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(CConst, *constant, self->get._TacConstant.constant)"
        if constant[] ~= self[].get._TacConstant.constant {
            "@MACRO@:uptr_move(CConst, *constant, self->get._TacConstant.constant)"
            free_CConst(@self[].get._TacConstant.constant)
            self[].get._TacConstant.constant = constant[]
            constant[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacVariable(name: u64) *struc TacValue {
    self: *struc TacValue = make_TacValue()
    self[].tag = AST_TacVariable_t
    self[].get._TacVariable.name = name
    return self
}

pub fn free_TacValue(self: **struc TacValue) none {
    loop .. while 0 {
        "@MACRO@:sptr_delete(*self)"
        if not self[] {
            "@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = sptr_new()
            return none
        }
    }
    match (self[])[].tag {
        -> AST_TacValue_t {
            break
        }
        -> AST_TacConstant_t {
            free_CConst(@(self[])[].get._TacConstant.constant)
        }
        break
        -> AST_TacVariable_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_free(*self)"
        if self[] {
            "@MACRO@:uptr_free(*self)"
            free(self[])
            self[] = uptr_new()
        }
    }
}

pub fn make_TacExpResult(none) *struc TacExpResult {
    self: *struc TacExpResult = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(TacExpResult, self)"
        free_TacExpResult(@self)
        self = cast<*struc TacExpResult>(malloc(sizeof<struc TacExpResult>))
        if not self {
            panic_sigabrt("alloc "                 "TacExpResult")
        }
    }
    self[].tag = AST_TacExpResult_t
    return self
}

pub fn make_TacPlainOperand(val: **struc TacValue) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].tag = AST_TacPlainOperand_t
    self[].get._TacPlainOperand.val = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *val, self->get._TacPlainOperand.val)"
        if val[] ~= self[].get._TacPlainOperand.val {
            "@MACRO@:uptr_move(TacValue, *val, self->get._TacPlainOperand.val)"
            free_TacValue(@self[].get._TacPlainOperand.val)
            self[].get._TacPlainOperand.val = val[]
            val[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacDereferencedPointer(val: **struc TacValue) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].tag = AST_TacDereferencedPointer_t
    self[].get._TacDereferencedPointer.val = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *val, self->get._TacDereferencedPointer.val)"
        if val[] ~= self[].get._TacDereferencedPointer.val {
            "@MACRO@:uptr_move(TacValue, *val, self->get._TacDereferencedPointer.val)"
            free_TacValue(@self[].get._TacDereferencedPointer.val)
            self[].get._TacDereferencedPointer.val = val[]
            val[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacSubObject(base_name: u64, offset: i64) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].tag = AST_TacSubObject_t
    self[].get._TacSubObject.base_name = base_name
    self[].get._TacSubObject.offset = offset
    return self
}

pub fn free_TacExpResult(self: **struc TacExpResult) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_TacExpResult_t {
            break
        }
        -> AST_TacPlainOperand_t {
            free_TacValue(@(self[])[].get._TacPlainOperand.val)
        }
        break
        -> AST_TacDereferencedPointer_t {
            free_TacValue(@(self[])[].get._TacDereferencedPointer.val)
        }
        break
        -> AST_TacSubObject_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_TacInstruction(none) *struc TacInstruction {
    self: *struc TacInstruction = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(TacInstruction, self)"
        free_TacInstruction(@self)
        self = cast<*struc TacInstruction>(malloc(sizeof<struc TacInstruction>))
        if not self {
            panic_sigabrt("alloc "                 "TacInstruction")
        }
    }
    self[].tag = AST_TacInstruction_t
    return self
}

pub fn make_TacReturn(val: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacReturn_t
    self[].get._TacReturn.val = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *val, self->get._TacReturn.val)"
        if val[] ~= self[].get._TacReturn.val {
            "@MACRO@:uptr_move(TacValue, *val, self->get._TacReturn.val)"
            free_TacValue(@self[].get._TacReturn.val)
            self[].get._TacReturn.val = val[]
            val[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacSignExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacSignExtend_t
    self[].get._TacSignExtend.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacSignExtend.src)"
        if src[] ~= self[].get._TacSignExtend.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacSignExtend.src)"
            free_TacValue(@self[].get._TacSignExtend.src)
            self[].get._TacSignExtend.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacSignExtend.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacSignExtend.dst)"
        if dst[] ~= self[].get._TacSignExtend.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacSignExtend.dst)"
            free_TacValue(@self[].get._TacSignExtend.dst)
            self[].get._TacSignExtend.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacTruncate(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacTruncate_t
    self[].get._TacTruncate.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacTruncate.src)"
        if src[] ~= self[].get._TacTruncate.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacTruncate.src)"
            free_TacValue(@self[].get._TacTruncate.src)
            self[].get._TacTruncate.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacTruncate.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacTruncate.dst)"
        if dst[] ~= self[].get._TacTruncate.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacTruncate.dst)"
            free_TacValue(@self[].get._TacTruncate.dst)
            self[].get._TacTruncate.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacZeroExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacZeroExtend_t
    self[].get._TacZeroExtend.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacZeroExtend.src)"
        if src[] ~= self[].get._TacZeroExtend.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacZeroExtend.src)"
            free_TacValue(@self[].get._TacZeroExtend.src)
            self[].get._TacZeroExtend.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacZeroExtend.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacZeroExtend.dst)"
        if dst[] ~= self[].get._TacZeroExtend.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacZeroExtend.dst)"
            free_TacValue(@self[].get._TacZeroExtend.dst)
            self[].get._TacZeroExtend.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacDoubleToInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacDoubleToInt_t
    self[].get._TacDoubleToInt.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacDoubleToInt.src)"
        if src[] ~= self[].get._TacDoubleToInt.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacDoubleToInt.src)"
            free_TacValue(@self[].get._TacDoubleToInt.src)
            self[].get._TacDoubleToInt.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacDoubleToInt.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacDoubleToInt.dst)"
        if dst[] ~= self[].get._TacDoubleToInt.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacDoubleToInt.dst)"
            free_TacValue(@self[].get._TacDoubleToInt.dst)
            self[].get._TacDoubleToInt.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacDoubleToUInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacDoubleToUInt_t
    self[].get._TacDoubleToUInt.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacDoubleToUInt.src)"
        if src[] ~= self[].get._TacDoubleToUInt.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacDoubleToUInt.src)"
            free_TacValue(@self[].get._TacDoubleToUInt.src)
            self[].get._TacDoubleToUInt.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacDoubleToUInt.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacDoubleToUInt.dst)"
        if dst[] ~= self[].get._TacDoubleToUInt.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacDoubleToUInt.dst)"
            free_TacValue(@self[].get._TacDoubleToUInt.dst)
            self[].get._TacDoubleToUInt.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacIntToDouble_t
    self[].get._TacIntToDouble.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacIntToDouble.src)"
        if src[] ~= self[].get._TacIntToDouble.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacIntToDouble.src)"
            free_TacValue(@self[].get._TacIntToDouble.src)
            self[].get._TacIntToDouble.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacIntToDouble.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacIntToDouble.dst)"
        if dst[] ~= self[].get._TacIntToDouble.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacIntToDouble.dst)"
            free_TacValue(@self[].get._TacIntToDouble.dst)
            self[].get._TacIntToDouble.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacUIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacUIntToDouble_t
    self[].get._TacUIntToDouble.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacUIntToDouble.src)"
        if src[] ~= self[].get._TacUIntToDouble.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacUIntToDouble.src)"
            free_TacValue(@self[].get._TacUIntToDouble.src)
            self[].get._TacUIntToDouble.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacUIntToDouble.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacUIntToDouble.dst)"
        if dst[] ~= self[].get._TacUIntToDouble.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacUIntToDouble.dst)"
            free_TacValue(@self[].get._TacUIntToDouble.dst)
            self[].get._TacUIntToDouble.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacFunCall(name: u64, args: ***struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacFunCall_t
    self[].get._TacFunCall.name = name
    self[].get._TacFunCall.args = vec_new()
    if args[] ~= self[].get._TacFunCall.args {
        "@MACRO@:vec_move(*args, self->get._TacFunCall.args)"
        if self[].get._TacFunCall.args {
            "@MACRO@:vec_delete(self->get._TacFunCall.args)"
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunCall.args) then free((cast<*struc stbds_array_header>((self[].get._TacFunCall.args)) - 1)) else cast<none>(0)))
                (self[].get._TacFunCall.args) = nil
            }
            self[].get._TacFunCall.args = vec_new()
        }
        self[].get._TacFunCall.args = args[]
        args[] = vec_new()
    }
    self[].get._TacFunCall.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacFunCall.dst)"
        if dst[] ~= self[].get._TacFunCall.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacFunCall.dst)"
            free_TacValue(@self[].get._TacFunCall.dst)
            self[].get._TacFunCall.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacUnary(unop: *struc TacUnaryOp, src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacUnary_t
    self[].get._TacUnary.unop = unop[]
    self[].get._TacUnary.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacUnary.src)"
        if src[] ~= self[].get._TacUnary.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacUnary.src)"
            free_TacValue(@self[].get._TacUnary.src)
            self[].get._TacUnary.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacUnary.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacUnary.dst)"
        if dst[] ~= self[].get._TacUnary.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacUnary.dst)"
            free_TacValue(@self[].get._TacUnary.dst)
            self[].get._TacUnary.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacBinary(binop: *struc TacBinaryOp, src1: **struc TacValue, src2: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacBinary_t
    self[].get._TacBinary.binop = binop[]
    self[].get._TacBinary.src1 = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src1, self->get._TacBinary.src1)"
        if src1[] ~= self[].get._TacBinary.src1 {
            "@MACRO@:uptr_move(TacValue, *src1, self->get._TacBinary.src1)"
            free_TacValue(@self[].get._TacBinary.src1)
            self[].get._TacBinary.src1 = src1[]
            src1[] = uptr_new()
        }
    }
    self[].get._TacBinary.src2 = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src2, self->get._TacBinary.src2)"
        if src2[] ~= self[].get._TacBinary.src2 {
            "@MACRO@:uptr_move(TacValue, *src2, self->get._TacBinary.src2)"
            free_TacValue(@self[].get._TacBinary.src2)
            self[].get._TacBinary.src2 = src2[]
            src2[] = uptr_new()
        }
    }
    self[].get._TacBinary.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacBinary.dst)"
        if dst[] ~= self[].get._TacBinary.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacBinary.dst)"
            free_TacValue(@self[].get._TacBinary.dst)
            self[].get._TacBinary.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacCopy(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacCopy_t
    self[].get._TacCopy.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacCopy.src)"
        if src[] ~= self[].get._TacCopy.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacCopy.src)"
            free_TacValue(@self[].get._TacCopy.src)
            self[].get._TacCopy.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacCopy.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacCopy.dst)"
        if dst[] ~= self[].get._TacCopy.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacCopy.dst)"
            free_TacValue(@self[].get._TacCopy.dst)
            self[].get._TacCopy.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacGetAddress(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacGetAddress_t
    self[].get._TacGetAddress.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacGetAddress.src)"
        if src[] ~= self[].get._TacGetAddress.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacGetAddress.src)"
            free_TacValue(@self[].get._TacGetAddress.src)
            self[].get._TacGetAddress.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacGetAddress.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacGetAddress.dst)"
        if dst[] ~= self[].get._TacGetAddress.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacGetAddress.dst)"
            free_TacValue(@self[].get._TacGetAddress.dst)
            self[].get._TacGetAddress.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacLoad(src_ptr: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacLoad_t
    self[].get._TacLoad.src_ptr = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src_ptr, self->get._TacLoad.src_ptr)"
        if src_ptr[] ~= self[].get._TacLoad.src_ptr {
            "@MACRO@:uptr_move(TacValue, *src_ptr, self->get._TacLoad.src_ptr)"
            free_TacValue(@self[].get._TacLoad.src_ptr)
            self[].get._TacLoad.src_ptr = src_ptr[]
            src_ptr[] = uptr_new()
        }
    }
    self[].get._TacLoad.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacLoad.dst)"
        if dst[] ~= self[].get._TacLoad.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacLoad.dst)"
            free_TacValue(@self[].get._TacLoad.dst)
            self[].get._TacLoad.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacStore(src: **struc TacValue, dst_ptr: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacStore_t
    self[].get._TacStore.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacStore.src)"
        if src[] ~= self[].get._TacStore.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacStore.src)"
            free_TacValue(@self[].get._TacStore.src)
            self[].get._TacStore.src = src[]
            src[] = uptr_new()
        }
    }
    self[].get._TacStore.dst_ptr = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst_ptr, self->get._TacStore.dst_ptr)"
        if dst_ptr[] ~= self[].get._TacStore.dst_ptr {
            "@MACRO@:uptr_move(TacValue, *dst_ptr, self->get._TacStore.dst_ptr)"
            free_TacValue(@self[].get._TacStore.dst_ptr)
            self[].get._TacStore.dst_ptr = dst_ptr[]
            dst_ptr[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacAddPtr(scale: i64, src_ptr: **struc TacValue, idx: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacAddPtr_t
    self[].get._TacAddPtr.scale = scale
    self[].get._TacAddPtr.src_ptr = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src_ptr, self->get._TacAddPtr.src_ptr)"
        if src_ptr[] ~= self[].get._TacAddPtr.src_ptr {
            "@MACRO@:uptr_move(TacValue, *src_ptr, self->get._TacAddPtr.src_ptr)"
            free_TacValue(@self[].get._TacAddPtr.src_ptr)
            self[].get._TacAddPtr.src_ptr = src_ptr[]
            src_ptr[] = uptr_new()
        }
    }
    self[].get._TacAddPtr.idx = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *idx, self->get._TacAddPtr.idx)"
        if idx[] ~= self[].get._TacAddPtr.idx {
            "@MACRO@:uptr_move(TacValue, *idx, self->get._TacAddPtr.idx)"
            free_TacValue(@self[].get._TacAddPtr.idx)
            self[].get._TacAddPtr.idx = idx[]
            idx[] = uptr_new()
        }
    }
    self[].get._TacAddPtr.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacAddPtr.dst)"
        if dst[] ~= self[].get._TacAddPtr.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacAddPtr.dst)"
            free_TacValue(@self[].get._TacAddPtr.dst)
            self[].get._TacAddPtr.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacCopyToOffset(dst_name: u64, offset: i64, src: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacCopyToOffset_t
    self[].get._TacCopyToOffset.dst_name = dst_name
    self[].get._TacCopyToOffset.offset = offset
    self[].get._TacCopyToOffset.src = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacCopyToOffset.src)"
        if src[] ~= self[].get._TacCopyToOffset.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacCopyToOffset.src)"
            free_TacValue(@self[].get._TacCopyToOffset.src)
            self[].get._TacCopyToOffset.src = src[]
            src[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacCopyFromOffset(src_name: u64, offset: i64, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacCopyFromOffset_t
    self[].get._TacCopyFromOffset.src_name = src_name
    self[].get._TacCopyFromOffset.offset = offset
    self[].get._TacCopyFromOffset.dst = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacCopyFromOffset.dst)"
        if dst[] ~= self[].get._TacCopyFromOffset.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacCopyFromOffset.dst)"
            free_TacValue(@self[].get._TacCopyFromOffset.dst)
            self[].get._TacCopyFromOffset.dst = dst[]
            dst[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacJump(target: u64) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacJump_t
    self[].get._TacJump.target = target
    return self
}

pub fn make_TacJumpIfZero(target: u64, condition: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacJumpIfZero_t
    self[].get._TacJumpIfZero.target = target
    self[].get._TacJumpIfZero.condition = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *condition, self->get._TacJumpIfZero.condition)"
        if condition[] ~= self[].get._TacJumpIfZero.condition {
            "@MACRO@:uptr_move(TacValue, *condition, self->get._TacJumpIfZero.condition)"
            free_TacValue(@self[].get._TacJumpIfZero.condition)
            self[].get._TacJumpIfZero.condition = condition[]
            condition[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacJumpIfNotZero(target: u64, condition: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacJumpIfNotZero_t
    self[].get._TacJumpIfNotZero.target = target
    self[].get._TacJumpIfNotZero.condition = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *condition, self->get._TacJumpIfNotZero.condition)"
        if condition[] ~= self[].get._TacJumpIfNotZero.condition {
            "@MACRO@:uptr_move(TacValue, *condition, self->get._TacJumpIfNotZero.condition)"
            free_TacValue(@self[].get._TacJumpIfNotZero.condition)
            self[].get._TacJumpIfNotZero.condition = condition[]
            condition[] = uptr_new()
        }
    }
    return self
}

pub fn make_TacLabel(name: u64) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacLabel_t
    self[].get._TacLabel.name = name
    return self
}

pub fn free_TacInstruction(self: **struc TacInstruction) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_TacInstruction_t {
            break
        }
        -> AST_TacReturn_t {
            free_TacValue(@(self[])[].get._TacReturn.val)
        }
        break
        -> AST_TacSignExtend_t {
            free_TacValue(@(self[])[].get._TacSignExtend.src)
        }
        free_TacValue(@(self[])[].get._TacSignExtend.dst)
        break
        -> AST_TacTruncate_t {
            free_TacValue(@(self[])[].get._TacTruncate.src)
        }
        free_TacValue(@(self[])[].get._TacTruncate.dst)
        break
        -> AST_TacZeroExtend_t {
            free_TacValue(@(self[])[].get._TacZeroExtend.src)
        }
        free_TacValue(@(self[])[].get._TacZeroExtend.dst)
        break
        -> AST_TacDoubleToInt_t {
            free_TacValue(@(self[])[].get._TacDoubleToInt.src)
        }
        free_TacValue(@(self[])[].get._TacDoubleToInt.dst)
        break
        -> AST_TacDoubleToUInt_t {
            free_TacValue(@(self[])[].get._TacDoubleToUInt.src)
        }
        free_TacValue(@(self[])[].get._TacDoubleToUInt.dst)
        break
        -> AST_TacIntToDouble_t {
            free_TacValue(@(self[])[].get._TacIntToDouble.src)
        }
        free_TacValue(@(self[])[].get._TacIntToDouble.dst)
        break
        -> AST_TacUIntToDouble_t {
            free_TacValue(@(self[])[].get._TacUIntToDouble.src)
        }
        free_TacValue(@(self[])[].get._TacUIntToDouble.dst)
        break
        -> AST_TacFunCall_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._TacFunCall.args) then (cast<*struc stbds_array_header>(((self[])[].get._TacFunCall.args)) - 1)[].length else 0) .. ++i {
                free_TacValue(@(self[])[].get._TacFunCall.args[i])
            }
        }
        if (self[])[].get._TacFunCall.args {
            "@MACRO@:vec_delete((*self)->get._TacFunCall.args)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacFunCall.args) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunCall.args)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacFunCall.args) = nil
            }
            (self[])[].get._TacFunCall.args = vec_new()
        }
        free_TacValue(@(self[])[].get._TacFunCall.dst)
        break
        -> AST_TacUnary_t {
            free_TacValue(@(self[])[].get._TacUnary.src)
        }
        free_TacValue(@(self[])[].get._TacUnary.dst)
        break
        -> AST_TacBinary_t {
            free_TacValue(@(self[])[].get._TacBinary.src1)
        }
        free_TacValue(@(self[])[].get._TacBinary.src2)
        free_TacValue(@(self[])[].get._TacBinary.dst)
        break
        -> AST_TacCopy_t {
            free_TacValue(@(self[])[].get._TacCopy.src)
        }
        free_TacValue(@(self[])[].get._TacCopy.dst)
        break
        -> AST_TacGetAddress_t {
            free_TacValue(@(self[])[].get._TacGetAddress.src)
        }
        free_TacValue(@(self[])[].get._TacGetAddress.dst)
        break
        -> AST_TacLoad_t {
            free_TacValue(@(self[])[].get._TacLoad.src_ptr)
        }
        free_TacValue(@(self[])[].get._TacLoad.dst)
        break
        -> AST_TacStore_t {
            free_TacValue(@(self[])[].get._TacStore.src)
        }
        free_TacValue(@(self[])[].get._TacStore.dst_ptr)
        break
        -> AST_TacAddPtr_t {
            free_TacValue(@(self[])[].get._TacAddPtr.src_ptr)
        }
        free_TacValue(@(self[])[].get._TacAddPtr.idx)
        free_TacValue(@(self[])[].get._TacAddPtr.dst)
        break
        -> AST_TacCopyToOffset_t {
            free_TacValue(@(self[])[].get._TacCopyToOffset.src)
        }
        break
        -> AST_TacCopyFromOffset_t {
            free_TacValue(@(self[])[].get._TacCopyFromOffset.dst)
        }
        break
        -> AST_TacJump_t {
            break
        }
        -> AST_TacJumpIfZero_t {
            free_TacValue(@(self[])[].get._TacJumpIfZero.condition)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            free_TacValue(@(self[])[].get._TacJumpIfNotZero.condition)
        }
        break
        -> AST_TacLabel_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_TacTopLevel(none) *struc TacTopLevel {
    self: *struc TacTopLevel = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(TacTopLevel, self)"
        free_TacTopLevel(@self)
        self = cast<*struc TacTopLevel>(malloc(sizeof<struc TacTopLevel>))
        if not self {
            panic_sigabrt("alloc "                 "TacTopLevel")
        }
    }
    self[].tag = AST_TacTopLevel_t
    return self
}

pub fn make_TacFunction(name: u64, is_glob: i32, params: **u64, body: ***struc TacInstruction) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].tag = AST_TacFunction_t
    self[].get._TacFunction.name = name
    self[].get._TacFunction.is_glob = is_glob
    self[].get._TacFunction.params = vec_new()
    if params[] ~= self[].get._TacFunction.params {
        "@MACRO@:vec_move(*params, self->get._TacFunction.params)"
        if self[].get._TacFunction.params {
            "@MACRO@:vec_delete(self->get._TacFunction.params)"
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunction.params) then free((cast<*struc stbds_array_header>((self[].get._TacFunction.params)) - 1)) else cast<none>(0)))
                (self[].get._TacFunction.params) = nil
            }
            self[].get._TacFunction.params = vec_new()
        }
        self[].get._TacFunction.params = params[]
        params[] = vec_new()
    }
    self[].get._TacFunction.body = vec_new()
    if body[] ~= self[].get._TacFunction.body {
        "@MACRO@:vec_move(*body, self->get._TacFunction.body)"
        if self[].get._TacFunction.body {
            "@MACRO@:vec_delete(self->get._TacFunction.body)"
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunction.body) then free((cast<*struc stbds_array_header>((self[].get._TacFunction.body)) - 1)) else cast<none>(0)))
                (self[].get._TacFunction.body) = nil
            }
            self[].get._TacFunction.body = vec_new()
        }
        self[].get._TacFunction.body = body[]
        body[] = vec_new()
    }
    return self
}

pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: ***struc StaticInit) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].tag = AST_TacStaticVariable_t
    self[].get._TacStaticVariable.name = name
    self[].get._TacStaticVariable.is_glob = is_glob
    self[].get._TacStaticVariable.static_init_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *static_init_type, self->get._TacStaticVariable.static_init_type)"
        if static_init_type[] ~= self[].get._TacStaticVariable.static_init_type {
            "@MACRO@:uptr_move(Type, *static_init_type, self->get._TacStaticVariable.static_init_type)"
            free_Type(@self[].get._TacStaticVariable.static_init_type)
            self[].get._TacStaticVariable.static_init_type = static_init_type[]
            static_init_type[] = uptr_new()
        }
    }
    self[].get._TacStaticVariable.static_inits = vec_new()
    if static_inits[] ~= self[].get._TacStaticVariable.static_inits {
        "@MACRO@:vec_move(*static_inits, self->get._TacStaticVariable.static_inits)"
        if self[].get._TacStaticVariable.static_inits {
            "@MACRO@:vec_delete(self->get._TacStaticVariable.static_inits)"
            loop .. while 0 {
                cast<none>((? (self[].get._TacStaticVariable.static_inits) then free((cast<*struc stbds_array_header>((self[].get._TacStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._TacStaticVariable.static_inits) = nil
            }
            self[].get._TacStaticVariable.static_inits = vec_new()
        }
        self[].get._TacStaticVariable.static_inits = static_inits[]
        static_inits[] = vec_new()
    }
    return self
}

pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].tag = AST_TacStaticConstant_t
    self[].get._TacStaticConstant.name = name
    self[].get._TacStaticConstant.static_init_type = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *static_init_type, self->get._TacStaticConstant.static_init_type)"
        if static_init_type[] ~= self[].get._TacStaticConstant.static_init_type {
            "@MACRO@:uptr_move(Type, *static_init_type, self->get._TacStaticConstant.static_init_type)"
            free_Type(@self[].get._TacStaticConstant.static_init_type)
            self[].get._TacStaticConstant.static_init_type = static_init_type[]
            static_init_type[] = uptr_new()
        }
    }
    self[].get._TacStaticConstant.static_init = sptr_new()
    loop .. while 0 {
        "@MACRO@:sptr_move(StaticInit, *static_init, self->get._TacStaticConstant.static_init)"
        if static_init[] ~= self[].get._TacStaticConstant.static_init {
            "@MACRO@:uptr_move(StaticInit, *static_init, self->get._TacStaticConstant.static_init)"
            free_StaticInit(@self[].get._TacStaticConstant.static_init)
            self[].get._TacStaticConstant.static_init = static_init[]
            static_init[] = uptr_new()
        }
    }
    return self
}

pub fn free_TacTopLevel(self: **struc TacTopLevel) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_TacTopLevel_t {
            break
        }
        -> AST_TacFunction_t {
            if (self[])[].get._TacFunction.params {
                "@MACRO@:vec_delete((*self)->get._TacFunction.params)"
                loop .. while 0 {
                    cast<none>((? ((self[])[].get._TacFunction.params) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunction.params)) - 1)) else cast<none>(0)))
                    ((self[])[].get._TacFunction.params) = nil
                }
                (self[])[].get._TacFunction.params = vec_new()
            }
        }
        loop i: u64 = 0 while i < (? ((self[])[].get._TacFunction.body) then (cast<*struc stbds_array_header>(((self[])[].get._TacFunction.body)) - 1)[].length else 0) .. ++i {
            free_TacInstruction(@(self[])[].get._TacFunction.body[i])
        }
        if (self[])[].get._TacFunction.body {
            "@MACRO@:vec_delete((*self)->get._TacFunction.body)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacFunction.body) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunction.body)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacFunction.body) = nil
            }
            (self[])[].get._TacFunction.body = vec_new()
        }
        break
        -> AST_TacStaticVariable_t {
            free_Type(@(self[])[].get._TacStaticVariable.static_init_type)
        }
        loop i: u64 = 0 while i < (? ((self[])[].get._TacStaticVariable.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._TacStaticVariable.static_inits)) - 1)[].length else 0) .. ++i {
            free_StaticInit(@(self[])[].get._TacStaticVariable.static_inits[i])
        }
        if (self[])[].get._TacStaticVariable.static_inits {
            "@MACRO@:vec_delete((*self)->get._TacStaticVariable.static_inits)"
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacStaticVariable.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._TacStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacStaticVariable.static_inits) = nil
            }
            (self[])[].get._TacStaticVariable.static_inits = vec_new()
        }
        break
        -> AST_TacStaticConstant_t {
            free_Type(@(self[])[].get._TacStaticConstant.static_init_type)
        }
        free_StaticInit(@(self[])[].get._TacStaticConstant.static_init)
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}

pub fn make_TacProgram(static_const_toplvls: ***struc TacTopLevel, static_var_toplvls: ***struc TacTopLevel, fun_toplvls: ***struc TacTopLevel) *struc TacProgram {
    self: *struc TacProgram = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(TacProgram, self)"
        free_TacProgram(@self)
        self = cast<*struc TacProgram>(malloc(sizeof<struc TacProgram>))
        if not self {
            panic_sigabrt("alloc "                 "TacProgram")
        }
    }
    self[].tag = AST_TacProgram_t
    self[].static_const_toplvls = vec_new()
    if static_const_toplvls[] ~= self[].static_const_toplvls {
        "@MACRO@:vec_move(*static_const_toplvls, self->static_const_toplvls)"
        if self[].static_const_toplvls {
            "@MACRO@:vec_delete(self->static_const_toplvls)"
            loop .. while 0 {
                cast<none>((? (self[].static_const_toplvls) then free((cast<*struc stbds_array_header>((self[].static_const_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_const_toplvls) = nil
            }
            self[].static_const_toplvls = vec_new()
        }
        self[].static_const_toplvls = static_const_toplvls[]
        static_const_toplvls[] = vec_new()
    }
    self[].static_var_toplvls = vec_new()
    if static_var_toplvls[] ~= self[].static_var_toplvls {
        "@MACRO@:vec_move(*static_var_toplvls, self->static_var_toplvls)"
        if self[].static_var_toplvls {
            "@MACRO@:vec_delete(self->static_var_toplvls)"
            loop .. while 0 {
                cast<none>((? (self[].static_var_toplvls) then free((cast<*struc stbds_array_header>((self[].static_var_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_var_toplvls) = nil
            }
            self[].static_var_toplvls = vec_new()
        }
        self[].static_var_toplvls = static_var_toplvls[]
        static_var_toplvls[] = vec_new()
    }
    self[].fun_toplvls = vec_new()
    if fun_toplvls[] ~= self[].fun_toplvls {
        "@MACRO@:vec_move(*fun_toplvls, self->fun_toplvls)"
        if self[].fun_toplvls {
            "@MACRO@:vec_delete(self->fun_toplvls)"
            loop .. while 0 {
                cast<none>((? (self[].fun_toplvls) then free((cast<*struc stbds_array_header>((self[].fun_toplvls)) - 1)) else cast<none>(0)))
                (self[].fun_toplvls) = nil
            }
            self[].fun_toplvls = vec_new()
        }
        self[].fun_toplvls = fun_toplvls[]
        fun_toplvls[] = vec_new()
    }
    return self
}

pub fn free_TacProgram(self: **struc TacProgram) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_TacProgram_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_const_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].static_const_toplvls[i])
    }
    if (self[])[].static_const_toplvls {
        "@MACRO@:vec_delete((*self)->static_const_toplvls)"
        loop .. while 0 {
            cast<none>((? ((self[])[].static_const_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_const_toplvls) = nil
        }
        (self[])[].static_const_toplvls = vec_new()
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_var_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_var_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].static_var_toplvls[i])
    }
    if (self[])[].static_var_toplvls {
        "@MACRO@:vec_delete((*self)->static_var_toplvls)"
        loop .. while 0 {
            cast<none>((? ((self[])[].static_var_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_var_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_var_toplvls) = nil
        }
        (self[])[].static_var_toplvls = vec_new()
    }
    loop i: u64 = 0 while i < (? ((self[])[].fun_toplvls) then (cast<*struc stbds_array_header>(((self[])[].fun_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].fun_toplvls[i])
    }
    if (self[])[].fun_toplvls {
        "@MACRO@:vec_delete((*self)->fun_toplvls)"
        loop .. while 0 {
            cast<none>((? ((self[])[].fun_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].fun_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].fun_toplvls) = nil
        }
        (self[])[].fun_toplvls = vec_new()
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
}
