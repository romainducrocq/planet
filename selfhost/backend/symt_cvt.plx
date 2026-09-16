m4_include(`regs.plx.m4')m4_dnl
m4_include(`symt_cvt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl





m4_define(`REGISTER_KIND', `TODO')m4_dnl
m4_define(`REG_Ax', `0')m4_dnl
m4_define(`REG_Bx', `1')m4_dnl
m4_define(`REG_Cx', `2')m4_dnl
m4_define(`REG_Dx', `3')m4_dnl
m4_define(`REG_Di', `4')m4_dnl
m4_define(`REG_Si', `5')m4_dnl
m4_define(`REG_R8', `6')m4_dnl
m4_define(`REG_R9', `7')m4_dnl
m4_define(`REG_R10', `8')m4_dnl
m4_define(`REG_R11', `9')m4_dnl
m4_define(`REG_R12', `10')m4_dnl
m4_define(`REG_R13', `11')m4_dnl
m4_define(`REG_R14', `12')m4_dnl
m4_define(`REG_R15', `13')m4_dnl
m4_define(`REG_Sp', `14')m4_dnl
m4_define(`REG_Bp', `15')m4_dnl
m4_define(`REG_Xmm0', `16')m4_dnl
m4_define(`REG_Xmm1', `17')m4_dnl
m4_define(`REG_Xmm2', `18')m4_dnl
m4_define(`REG_Xmm3', `19')m4_dnl
m4_define(`REG_Xmm4', `20')m4_dnl
m4_define(`REG_Xmm5', `21')m4_dnl
m4_define(`REG_Xmm6', `22')m4_dnl
m4_define(`REG_Xmm7', `23')m4_dnl
m4_define(`REG_Xmm8', `24')m4_dnl
m4_define(`REG_Xmm9', `25')m4_dnl
m4_define(`REG_Xmm10', `26')m4_dnl
m4_define(`REG_Xmm11', `27')m4_dnl
m4_define(`REG_Xmm12', `28')m4_dnl
m4_define(`REG_Xmm13', `29')m4_dnl
m4_define(`REG_Xmm14', `30')m4_dnl
m4_define(`REG_Xmm15', `31')m4_dnl
m4_define(`REGISTER_MASK_SIZE', `26')m4_dnl
m4_define(`REGISTER_MASK_FALSE', `TODO')m4_dnl
m4_define(`NULL_REGISTER_MASK', `TODO')m4_dnl

type struc Type;
type struc AssemblyType;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) i32;
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType;
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none;
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

type struc AssemblyType;
type struc BackendSymbol;
type struc AsmOperand;

type struc Byte(_empty: char)

type struc LongWord(_empty: char)

type struc QuadWord(_empty: char)

type struc BackendDouble(_empty: char)

type struc ByteArray(size: i64, alignment: i32)

type union _AssemblyType(_Byte: struc Byte, _LongWord: struc LongWord, _QuadWord: struc QuadWord, _BackendDouble: struc BackendDouble, _ByteArray: struc ByteArray)

type struc AssemblyType(_ref_count: u64, tag: i32, get: union _AssemblyType)
pub fn make_AssemblyType(none) *struc AssemblyType;
pub fn make_Byte(none) *struc AssemblyType;
pub fn make_LongWord(none) *struc AssemblyType;
pub fn make_QuadWord(none) *struc AssemblyType;
pub fn make_BackendDouble(none) *struc AssemblyType;
pub fn make_ByteArray(size: i64, alignment: i32) *struc AssemblyType;
pub fn free_AssemblyType(self: **struc AssemblyType) none;

type struc BackendObj(is_static: i32, is_const: i32, asm_type: *struc AssemblyType)

type struc BackendFun(is_def: i32, callee_saved_regs: **struc AsmOperand)

type union _BackendSymbol(_BackendObj: struc BackendObj, _BackendFun: struc BackendFun)

type struc BackendSymbol(tag: i32, get: union _BackendSymbol)
pub fn make_BackendSymbol(none) *struc BackendSymbol;
pub fn make_BackendObj(is_static: i32, is_const: i32, asm_type: **struc AssemblyType) *struc BackendSymbol;
pub fn make_BackendFun(is_def: i32) *struc BackendSymbol;
pub fn free_BackendSymbol(self: **struc BackendSymbol) none;
m4_define(`UPtrBackendSymbol', `TODO')m4_dnl

type struc PairTIdentifierUPtrBackendSymbol(key: u64, value: *struc BackendSymbol)

type struc BackEndContext(symbol_table: *struc PairTIdentifierUPtrBackendSymbol)

type struc AsmReg;
type struc AsmCondCode;
type struc AsmOperand;
type struc AsmBinaryOp;
type struc AsmUnaryOp;
type struc AsmInstruction;
type struc AsmTopLevel;
type struc AsmProgram;

type struc AsmReg(tag: i32)
pub fn make_AsmReg(tag: i32) struc AsmReg;
m4_define(`init_AsmReg', `TODO')m4_dnl
m4_define(`init_AsmAx', `TODO')m4_dnl
m4_define(`init_AsmBx', `TODO')m4_dnl
m4_define(`init_AsmCx', `TODO')m4_dnl
m4_define(`init_AsmDx', `TODO')m4_dnl
m4_define(`init_AsmDi', `TODO')m4_dnl
m4_define(`init_AsmSi', `TODO')m4_dnl
m4_define(`init_AsmR8', `TODO')m4_dnl
m4_define(`init_AsmR9', `TODO')m4_dnl
m4_define(`init_AsmR10', `TODO')m4_dnl
m4_define(`init_AsmR11', `TODO')m4_dnl
m4_define(`init_AsmR12', `TODO')m4_dnl
m4_define(`init_AsmR13', `TODO')m4_dnl
m4_define(`init_AsmR14', `TODO')m4_dnl
m4_define(`init_AsmR15', `TODO')m4_dnl
m4_define(`init_AsmSp', `TODO')m4_dnl
m4_define(`init_AsmBp', `TODO')m4_dnl
m4_define(`init_AsmXMM0', `TODO')m4_dnl
m4_define(`init_AsmXMM1', `TODO')m4_dnl
m4_define(`init_AsmXMM2', `TODO')m4_dnl
m4_define(`init_AsmXMM3', `TODO')m4_dnl
m4_define(`init_AsmXMM4', `TODO')m4_dnl
m4_define(`init_AsmXMM5', `TODO')m4_dnl
m4_define(`init_AsmXMM6', `TODO')m4_dnl
m4_define(`init_AsmXMM7', `TODO')m4_dnl
m4_define(`init_AsmXMM8', `TODO')m4_dnl
m4_define(`init_AsmXMM9', `TODO')m4_dnl
m4_define(`init_AsmXMM10', `TODO')m4_dnl
m4_define(`init_AsmXMM11', `TODO')m4_dnl
m4_define(`init_AsmXMM12', `TODO')m4_dnl
m4_define(`init_AsmXMM13', `TODO')m4_dnl
m4_define(`init_AsmXMM14', `TODO')m4_dnl
m4_define(`init_AsmXMM15', `TODO')m4_dnl

type struc AsmCondCode(tag: i32)
pub fn make_AsmCondCode(tag: i32) struc AsmCondCode;
m4_define(`init_AsmCondCode', `TODO')m4_dnl
m4_define(`init_AsmE', `TODO')m4_dnl
m4_define(`init_AsmNE', `TODO')m4_dnl
m4_define(`init_AsmG', `TODO')m4_dnl
m4_define(`init_AsmGE', `TODO')m4_dnl
m4_define(`init_AsmL', `TODO')m4_dnl
m4_define(`init_AsmLE', `TODO')m4_dnl
m4_define(`init_AsmA', `TODO')m4_dnl
m4_define(`init_AsmAE', `TODO')m4_dnl
m4_define(`init_AsmB', `TODO')m4_dnl
m4_define(`init_AsmBE', `TODO')m4_dnl
m4_define(`init_AsmP', `TODO')m4_dnl

type struc AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32)

type struc AsmRegister(reg: struc AsmReg)

type struc AsmPseudo(name: u64)

type struc AsmMemory(value: i64, reg: struc AsmReg)

type struc AsmData(name: u64, offset: i64)

type struc AsmPseudoMem(name: u64, offset: i64)

type struc AsmIndexed(scale: i64, reg_base: struc AsmReg, reg_index: struc AsmReg)

type union _AsmOperand(_AsmImm: struc AsmImm, _AsmRegister: struc AsmRegister, _AsmPseudo: struc AsmPseudo, _AsmMemory: struc AsmMemory, _AsmData: struc AsmData, _AsmPseudoMem: struc AsmPseudoMem, _AsmIndexed: struc AsmIndexed)

type struc AsmOperand(_ref_count: u64, tag: i32, get: union _AsmOperand)
pub fn make_AsmOperand(none) *struc AsmOperand;
pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand;
pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmPseudo(name: u64) *struc AsmOperand;
pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand;
pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand;
pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand;
pub fn free_AsmOperand(self: **struc AsmOperand) none;

type struc AsmBinaryOp(tag: i32)
pub fn make_AsmBinaryOp(tag: i32) struc AsmBinaryOp;
m4_define(`init_AsmBinaryOp', `TODO')m4_dnl
m4_define(`init_AsmAdd', `TODO')m4_dnl
m4_define(`init_AsmSub', `TODO')m4_dnl
m4_define(`init_AsmMult', `TODO')m4_dnl
m4_define(`init_AsmDivDouble', `TODO')m4_dnl
m4_define(`init_AsmBitAnd', `TODO')m4_dnl
m4_define(`init_AsmBitOr', `TODO')m4_dnl
m4_define(`init_AsmBitXor', `TODO')m4_dnl
m4_define(`init_AsmBitShiftLeft', `TODO')m4_dnl
m4_define(`init_AsmBitShiftRight', `TODO')m4_dnl
m4_define(`init_AsmBitShrArithmetic', `TODO')m4_dnl

type struc AsmUnaryOp(tag: i32)
pub fn make_AsmUnaryOp(tag: i32) struc AsmUnaryOp;
m4_define(`init_AsmUnaryOp', `TODO')m4_dnl
m4_define(`init_AsmNot', `TODO')m4_dnl
m4_define(`init_AsmNeg', `TODO')m4_dnl
m4_define(`init_AsmShr', `TODO')m4_dnl

type struc AsmMov(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmMovSx(asm_type_src: *struc AssemblyType, asm_type_dst: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmMovZeroExtend(asm_type_src: *struc AssemblyType, asm_type_dst: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmLea(src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmCvttsd2si(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmCvtsi2sd(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmUnary(unop: struc AsmUnaryOp, asm_type: *struc AssemblyType, dst: *struc AsmOperand)

type struc AsmBinary(binop: struc AsmBinaryOp, asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmCmp(asm_type: *struc AssemblyType, src: *struc AsmOperand, dst: *struc AsmOperand)

type struc AsmIdiv(asm_type: *struc AssemblyType, src: *struc AsmOperand)

type struc AsmDiv(asm_type: *struc AssemblyType, src: *struc AsmOperand)

type struc AsmCdq(asm_type: *struc AssemblyType)

type struc AsmJmp(target: u64)

type struc AsmJmpCC(target: u64, cond_code: struc AsmCondCode)

type struc AsmSetCC(cond_code: struc AsmCondCode, dst: *struc AsmOperand)

type struc AsmLabel(name: u64)

type struc AsmPush(src: *struc AsmOperand)

type struc AsmPop(reg: struc AsmReg)

type struc AsmCall(name: u64)

type struc AsmRet(_empty: char)

type union _AsmInstruction(_AsmMov: struc AsmMov, _AsmMovSx: struc AsmMovSx, _AsmMovZeroExtend: struc AsmMovZeroExtend, _AsmLea: struc AsmLea, _AsmCvttsd2si: struc AsmCvttsd2si, _AsmCvtsi2sd: struc AsmCvtsi2sd, _AsmUnary: struc AsmUnary, _AsmBinary: struc AsmBinary, _AsmCmp: struc AsmCmp, _AsmIdiv: struc AsmIdiv, _AsmDiv: struc AsmDiv, _AsmCdq: struc AsmCdq, _AsmJmp: struc AsmJmp, _AsmJmpCC: struc AsmJmpCC, _AsmSetCC: struc AsmSetCC, _AsmLabel: struc AsmLabel, _AsmPush: struc AsmPush, _AsmPop: struc AsmPop, _AsmCall: struc AsmCall, _AsmRet: struc AsmRet)

type struc AsmInstruction(tag: i32, get: union _AsmInstruction)
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

type struc AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: **struc AsmInstruction)

type struc AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: **struc StaticInit)

type struc AsmStaticConstant(name: u64, alignment: i32, static_init: *struc StaticInit)

type union _AsmTopLevel(_AsmFunction: struc AsmFunction, _AsmStaticVariable: struc AsmStaticVariable, _AsmStaticConstant: struc AsmStaticConstant)

type struc AsmTopLevel(tag: i32, get: union _AsmTopLevel)
pub fn make_AsmTopLevel(none) *struc AsmTopLevel;
pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: ***struc AsmInstruction) *struc AsmTopLevel;
pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: ***struc StaticInit) *struc AsmTopLevel;
pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel;
pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none;

type struc AsmProgram(tag: i32, static_const_toplvls: **struc AsmTopLevel, top_levels: **struc AsmTopLevel)
pub fn make_AsmProgram(static_const_toplvls: ***struc AsmTopLevel, top_levels: ***struc AsmTopLevel) *struc AsmProgram;
pub fn free_AsmProgram(self: **struc AsmProgram) none;

type struc SymtCvtContext(backend: *struc BackEndContext, frontend: *struc FrontEndContext, symbol: u64)

m4_define(`Ctx', `TODO')m4_dnl

fn get_scalar_alignment(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return 1
                }
            }
        }
        -> AST_Int_t {
            -> AST_UInt_t {
                return 4
            }
        }
        -> AST_Long_t {
            -> AST_Double_t {
                -> AST_ULong_t {
                    -> AST_Pointer_t {
                        return 8
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_arr_alignment(ctx: *struc FrontEndContext, arr_type: *struc Array, size: *i64) i32 {
    size[] = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size[] *= arr_type[].size
    }
    alignment: i32 = gen_type_alignment(ctx, arr_type[].elem_type)
    if arr_type[].elem_type[].tag == AST_Structure_t {
        struct_type: *struc Structure = @arr_type[].elem_type[].get._Structure
        size[] *= ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
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
    return ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].alignment
}

pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Array_t {
            size: i64;
            return get_arr_alignment(ctx, @type_t[].get._Array, @size)
        }
        -> AST_Structure_t {
            return get_struct_alignment(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_alignment(type_t)
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
    map_it: i64 = (? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)
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
    symbol_type: *struc Type = ((? ((? ((ctx[].symbol_table) = stbds_hmget_key((ctx[].symbol_table), sizeof((ctx[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    match symbol_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return make_Byte()
                }
            }
        }
        -> AST_Int_t {
            -> AST_UInt_t {
                return make_LongWord()
            }
        }
        -> AST_Long_t {
            -> AST_ULong_t {
                -> AST_Pointer_t {
                    return make_QuadWord()
                }
            }
        }
        -> AST_Double_t {
            return make_BackendDouble()
        }
        -> AST_Array_t {
            return arr_asm_type(ctx, @symbol_type[].get._Array)
        }
        -> AST_Structure_t {
            return struct_asm_type(ctx, @symbol_type[].get._Structure)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn cvt_backend_symbol(ctx: *struc SymtCvtContext, node: *struc BackendSymbol) none {
    loop .. while 0 {
        "@MACRO@:map_move_add(ctx->backend->symbol_table, ctx->symbol, node)"
        loop .. while 0 {
            "@MACRO@:map_add(ctx->backend->symbol_table, ctx->symbol, node)"
            loop .. while 0 {
                (ctx[].backend[].symbol_table) = stbds_hmput_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((ctx[].symbol))), sizeof((ctx[].backend[].symbol_table)[].key), 0)
                (ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp].key = (ctx[].symbol)
                (ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp].value = (node)
            }
        }
        node = nil
    }
}

fn dbl_static_const(ctx: *struc SymtCvtContext) none {
    asm_type: *struc AssemblyType = make_BackendDouble()
    cvt_backend_symbol(ctx, make_BackendObj(true, true, @asm_type))
}

fn string_static_const(ctx: *struc SymtCvtContext, arr_type: *struc Array) none {
    asm_type: *struc AssemblyType = arr_asm_type(ctx[].frontend, arr_type)
    cvt_backend_symbol(ctx, make_BackendObj(true, true, @asm_type))
}

fn cvt_static_const_toplvl(ctx: *struc SymtCvtContext, node: *struc AsmStaticConstant) none {
    ctx[].symbol = node[].name
    match node[].static_init[].tag {
        -> AST_DoubleInit_t {
            dbl_static_const(ctx)
        }
        break
        -> AST_StringInit_t {
            string_static_const(ctx, @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Array)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn cvt_toplvl(ctx: *struc SymtCvtContext, node: *struc AsmTopLevel) none {
    if node[].tag == AST_AsmStaticConstant_t {
        cvt_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cvt_fun_type(ctx: *struc SymtCvtContext, node: *struc FunAttr, fun_type: *struc FunType) none {
    if fun_type[].param_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].param_reg_mask = 0ul
    }
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].ret_reg_mask = 0ul
    }
    is_def: i32 = node[].is_def
    cvt_backend_symbol(ctx, make_BackendFun(is_def))
}

fn cvt_obj_type(ctx: *struc SymtCvtContext, node: *struc IdentifierAttr) none {
    if node[].tag ~= AST_ConstantAttr_t {
        asm_type: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, ctx[].symbol)
        is_static: i32 = node[].tag == AST_StaticAttr_t
        cvt_backend_symbol(ctx, make_BackendObj(is_static, false, @asm_type))
    }
}

fn cvt_program(ctx: *struc SymtCvtContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (ctx[].frontend[].symbol_table) then (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        symbol: *struc PairTIdentifierUPtrSymbol = @ctx[].frontend[].symbol_table[i]
        ctx[].symbol = (symbol[]).key
        if (symbol[]).value[].type_t[].tag == AST_FunType_t {
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
