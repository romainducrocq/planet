m4_include(`c_std.plx.m4')m4_dnl

m4_include(`../util/fileio.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl
m4_include(`../ast/interm_ast.plx.m4')m4_dnl

m4_include(`../frontend/errors.plx.m4')m4_dnl
m4_include(`../frontend/lexer.plx.m4')m4_dnl
m4_include(`../frontend/parser.plx.m4')m4_dnl
m4_include(`../frontend/semantic.plx.m4')m4_dnl
m4_include(`../frontend/tac_repr.plx.m4')m4_dnl

m4_include(`../backend/asm_gen.plx.m4')m4_dnl
m4_include(`../backend/gas_code.plx.m4')m4_dnl
m4_include(`../backend/stack_fix.plx.m4')m4_dnl
m4_include(`../backend/symt_cvt.plx.m4')m4_dnl

m4_include(`../optimizer/optim_tac.plx.m4')m4_dnl
m4_include(`../optimizer/reg_alloc.plx.m4')m4_dnl





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
type struc ErrorsContext;

type struc FileRead(len: u64, buf: string, fd: *struc FILE, filename: string)

type struc FileIoContext(errors: *struc ErrorsContext, fd_write: *struc FILE, write_buf: string, filename: string, file_reads: *struc FileRead)

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


m4_define(`MESSAGE_FATAL', `TODO')m4_dnl
m4_define(`MSG_unhandled_fatal_error', `0')m4_dnl
m4_define(`MSG_unsupported_os', `1')m4_dnl
m4_define(`MSG_unsupported_arch', `2')m4_dnl
m4_define(`MSG_unsupported_compiler', `3')m4_dnl
m4_define(`MSG_unsupported_cc_ver', `4')m4_dnl
m4_define(`MESSAGE_ARG', `TODO')m4_dnl
m4_define(`MSG_unhandled_arg_error', `100')m4_dnl
m4_define(`MSG_print_help', `101')m4_dnl
m4_define(`MSG_no_debug_arg', `102')m4_dnl
m4_define(`MSG_invalid_debug_arg', `103')m4_dnl
m4_define(`MSG_no_optim_1_arg', `104')m4_dnl
m4_define(`MSG_invalid_optim_1_arg', `105')m4_dnl
m4_define(`MSG_no_optim_2_arg', `106')m4_dnl
m4_define(`MSG_invalid_optim_2_arg', `107')m4_dnl
m4_define(`MSG_no_input_files_arg', `108')m4_dnl
m4_define(`MSG_no_stdlib_dir_arg', `109')m4_dnl
m4_define(`MSG_no_include_dir_arg', `110')m4_dnl
m4_define(`MESSAGE_UTIL', `TODO')m4_dnl
m4_define(`MSG_unhandled_util_error', `200')m4_dnl
m4_define(`MSG_failed_fread', `201')m4_dnl
m4_define(`MSG_failed_fwrite', `202')m4_dnl
m4_define(`MSG_failed_strtoi', `203')m4_dnl
m4_define(`MSG_failed_strtou', `204')m4_dnl
m4_define(`MSG_failed_strtod', `205')m4_dnl
m4_define(`MESSAGE_LEXER', `TODO')m4_dnl
m4_define(`MSG_unhandled_lexer_error', `300')m4_dnl
m4_define(`MSG_invalid_tok', `301')m4_dnl
m4_define(`MSG_import_in_line', `302')m4_dnl
m4_define(`MSG_use_in_line', `303')m4_dnl
m4_define(`MSG_failed_import', `304')m4_dnl
m4_define(`MSG_failed_use', `305')m4_dnl
m4_define(`MSG_preproc_macro', `306')m4_dnl
m4_define(`MSG_unmatched_close', `307')m4_dnl
m4_define(`MESSAGE_PARSER', `TODO')m4_dnl
m4_define(`MSG_unhandled_parser_error', `400')m4_dnl
m4_define(`MSG_unexpected_next_tok', `401')m4_dnl
m4_define(`MSG_reached_eof', `402')m4_dnl
m4_define(`MSG_overflow_long_const', `403')m4_dnl
m4_define(`MSG_overflow_ulong_const', `404')m4_dnl
m4_define(`MSG_expect_unop', `405')m4_dnl
m4_define(`MSG_expect_binop', `406')m4_dnl
m4_define(`MSG_expect_data_specifier', `407')m4_dnl
m4_define(`MSG_expect_specifier', `408')m4_dnl
m4_define(`MSG_expect_maybe_type', `409')m4_dnl
m4_define(`MSG_expect_open_sizeof', `410')m4_dnl
m4_define(`MSG_expect_expression', `411')m4_dnl
m4_define(`MSG_expect_assign', `412')m4_dnl
m4_define(`MSG_expect_datatype', `413')m4_dnl
m4_define(`MSG_expect_block', `414')m4_dnl
m4_define(`MSG_expect_declaration', `415')m4_dnl
m4_define(`MSG_expect_storage_class', `416')m4_dnl
m4_define(`MSG_incomplete_any', `417')m4_dnl
m4_define(`MSG_arr_size_not_int_const', `418')m4_dnl
m4_define(`MSG_case_value_not_int_const', `419')m4_dnl
m4_define(`MSG_empty_block', `420')m4_dnl
m4_define(`MSG_empty_compound_init', `421')m4_dnl
m4_define(`MSG_infinite_loop', `422')m4_dnl
m4_define(`MSG_loop_decl_not_auto', `423')m4_dnl
m4_define(`MSG_list_decl_not_auto', `424')m4_dnl
m4_define(`MSG_type_decl_not_auto', `425')m4_dnl
m4_define(`MSG_pub_in_block', `426')m4_dnl
m4_define(`MSG_data_at_toplvl', `427')m4_dnl
m4_define(`MESSAGE_SEMANTIC', `TODO')m4_dnl
m4_define(`MSG_unhandled_semantic_error', `500')m4_dnl
m4_define(`MSG_incomplete_arr', `501')m4_dnl
m4_define(`MSG_joint_ptr_mismatch', `502')m4_dnl
m4_define(`MSG_fun_used_as_var', `503')m4_dnl
m4_define(`MSG_illegal_cast', `504')m4_dnl
m4_define(`MSG_invalid_unary_op', `505')m4_dnl
m4_define(`MSG_invalid_binary_op', `506')m4_dnl
m4_define(`MSG_invalid_binary_ops', `507')m4_dnl
m4_define(`MSG_assign_to_void', `508')m4_dnl
m4_define(`MSG_assign_to_rvalue', `509')m4_dnl
m4_define(`MSG_invalid_condition', `510')m4_dnl
m4_define(`MSG_invalid_ternary_op', `511')m4_dnl
m4_define(`MSG_var_used_as_fun', `512')m4_dnl
m4_define(`MSG_call_with_wrong_argc', `513')m4_dnl
m4_define(`MSG_deref_not_ptr', `514')m4_dnl
m4_define(`MSG_addrof_rvalue', `515')m4_dnl
m4_define(`MSG_invalid_subscript', `516')m4_dnl
m4_define(`MSG_sizeof_incomplete', `517')m4_dnl
m4_define(`MSG_dot_not_struct', `518')m4_dnl
m4_define(`MSG_member_not_in_struct', `519')m4_dnl
m4_define(`MSG_arrow_not_struct_ptr', `520')m4_dnl
m4_define(`MSG_arrow_incomplete', `521')m4_dnl
m4_define(`MSG_exp_incomplete', `522')m4_dnl
m4_define(`MSG_ret_value_in_void_fun', `523')m4_dnl
m4_define(`MSG_no_ret_value_in_fun', `524')m4_dnl
m4_define(`MSG_invalid_if', `525')m4_dnl
m4_define(`MSG_invalid_while', `526')m4_dnl
m4_define(`MSG_invalid_do_while', `527')m4_dnl
m4_define(`MSG_invalid_for', `528')m4_dnl
m4_define(`MSG_invalid_switch', `529')m4_dnl
m4_define(`MSG_duplicate_case_value', `530')m4_dnl
m4_define(`MSG_string_init_not_char_arr', `531')m4_dnl
m4_define(`MSG_string_init_overflow', `532')m4_dnl
m4_define(`MSG_arr_init_overflow', `533')m4_dnl
m4_define(`MSG_struct_init_overflow', `534')m4_dnl
m4_define(`MSG_ret_arr', `535')m4_dnl
m4_define(`MSG_ret_incomplete', `536')m4_dnl
m4_define(`MSG_void_param', `537')m4_dnl
m4_define(`MSG_incomplete_param', `538')m4_dnl
m4_define(`MSG_redecl_fun_conflict', `539')m4_dnl
m4_define(`MSG_redef_fun', `540')m4_dnl
m4_define(`MSG_redecl_static_conflict', `541')m4_dnl
m4_define(`MSG_static_ptr_init_not_int', `542')m4_dnl
m4_define(`MSG_static_ptr_init_not_null', `543')m4_dnl
m4_define(`MSG_agg_init_with_single', `544')m4_dnl
m4_define(`MSG_static_ptr_init_string', `545')m4_dnl
m4_define(`MSG_static_init_not_const', `546')m4_dnl
m4_define(`MSG_scalar_init_with_compound', `547')m4_dnl
m4_define(`MSG_void_var_decl', `548')m4_dnl
m4_define(`MSG_incomplete_var_decl', `549')m4_dnl
m4_define(`MSG_redecl_var_conflict', `550')m4_dnl
m4_define(`MSG_redecl_var_storage', `551')m4_dnl
m4_define(`MSG_redef_extern_var', `552')m4_dnl
m4_define(`MSG_duplicate_member_decl', `553')m4_dnl
m4_define(`MSG_incomplete_member_decl', `554')m4_dnl
m4_define(`MSG_redecl_struct_in_scope', `555')m4_dnl
m4_define(`MSG_case_out_of_switch', `556')m4_dnl
m4_define(`MSG_default_out_of_switch', `557')m4_dnl
m4_define(`MSG_multiple_default', `558')m4_dnl
m4_define(`MSG_break_out_of_loop', `559')m4_dnl
m4_define(`MSG_continue_out_of_loop', `560')m4_dnl
m4_define(`MSG_undef_goto_target', `561')m4_dnl
m4_define(`MSG_redecl_struct_conflict', `562')m4_dnl
m4_define(`MSG_undef_struct_in_scope', `563')m4_dnl
m4_define(`MSG_undecl_var_in_scope', `564')m4_dnl
m4_define(`MSG_undecl_fun_in_scope', `565')m4_dnl
m4_define(`MSG_for_init_decl_not_auto', `566')m4_dnl
m4_define(`MSG_redef_label_in_scope', `567')m4_dnl
m4_define(`MSG_redecl_var_in_scope', `568')m4_dnl
m4_define(`MSG_def_nested_fun', `569')m4_dnl
m4_define(`MSG_decl_nested_static_fun', `570')m4_dnl
m4_define(`MSG_redecl_fun_in_scope', `571')m4_dnl
m4_define(`TOKEN_KIND', `TODO')m4_dnl
m4_define(`TOK_skip', `0')m4_dnl
m4_define(`TOK_line_break', `1')m4_dnl
m4_define(`TOK_open_paren', `2')m4_dnl
m4_define(`TOK_close_paren', `3')m4_dnl
m4_define(`TOK_open_brace', `4')m4_dnl
m4_define(`TOK_close_brace', `5')m4_dnl
m4_define(`TOK_open_bracket', `6')m4_dnl
m4_define(`TOK_close_bracket', `7')m4_dnl
m4_define(`TOK_comma_separator', `8')m4_dnl
m4_define(`TOK_semicolon', `9')m4_dnl
m4_define(`TOK_unop_complement', `10')m4_dnl
m4_define(`TOK_unop_neg', `11')m4_dnl
m4_define(`TOK_unop_not', `12')m4_dnl
m4_define(`TOK_unop_addrof', `13')m4_dnl
m4_define(`TOK_unop_incr', `14')m4_dnl
m4_define(`TOK_unop_decr', `15')m4_dnl
m4_define(`TOK_binop_add', `16')m4_dnl
m4_define(`TOK_binop_multiply', `17')m4_dnl
m4_define(`TOK_binop_divide', `18')m4_dnl
m4_define(`TOK_binop_remainder', `19')m4_dnl
m4_define(`TOK_binop_bitand', `20')m4_dnl
m4_define(`TOK_binop_bitor', `21')m4_dnl
m4_define(`TOK_binop_xor', `22')m4_dnl
m4_define(`TOK_binop_shiftleft', `23')m4_dnl
m4_define(`TOK_binop_shiftright', `24')m4_dnl
m4_define(`TOK_binop_and', `25')m4_dnl
m4_define(`TOK_binop_or', `26')m4_dnl
m4_define(`TOK_binop_eq', `27')m4_dnl
m4_define(`TOK_binop_ne', `28')m4_dnl
m4_define(`TOK_binop_lt', `29')m4_dnl
m4_define(`TOK_binop_le', `30')m4_dnl
m4_define(`TOK_binop_gt', `31')m4_dnl
m4_define(`TOK_binop_ge', `32')m4_dnl
m4_define(`TOK_assign', `33')m4_dnl
m4_define(`TOK_assign_type', `34')m4_dnl
m4_define(`TOK_assign_add', `35')m4_dnl
m4_define(`TOK_assign_subtract', `36')m4_dnl
m4_define(`TOK_assign_multiply', `37')m4_dnl
m4_define(`TOK_assign_divide', `38')m4_dnl
m4_define(`TOK_assign_remainder', `39')m4_dnl
m4_define(`TOK_assign_bitand', `40')m4_dnl
m4_define(`TOK_assign_bitor', `41')m4_dnl
m4_define(`TOK_assign_xor', `42')m4_dnl
m4_define(`TOK_assign_shiftleft', `43')m4_dnl
m4_define(`TOK_assign_shiftright', `44')m4_dnl
m4_define(`TOK_force_exec', `45')m4_dnl
m4_define(`TOK_ternary_if', `46')m4_dnl
m4_define(`TOK_compound_init', `47')m4_dnl
m4_define(`TOK_typeop_member', `48')m4_dnl
m4_define(`TOK_loop_post', `49')m4_dnl
m4_define(`TOK_match_with', `50')m4_dnl
m4_define(`TOK_key_char', `51')m4_dnl
m4_define(`TOK_key_string', `52')m4_dnl
m4_define(`TOK_key_i32', `53')m4_dnl
m4_define(`TOK_key_i64', `54')m4_dnl
m4_define(`TOK_key_i8', `55')m4_dnl
m4_define(`TOK_key_f64', `56')m4_dnl
m4_define(`TOK_key_u32', `57')m4_dnl
m4_define(`TOK_key_u64', `58')m4_dnl
m4_define(`TOK_key_u8', `59')m4_dnl
m4_define(`TOK_key_any', `60')m4_dnl
m4_define(`TOK_key_none', `61')m4_dnl
m4_define(`TOK_key_fn', `62')m4_dnl
m4_define(`TOK_key_struc', `63')m4_dnl
m4_define(`TOK_key_union', `64')m4_dnl
m4_define(`TOK_key_type', `65')m4_dnl
m4_define(`TOK_key_sizeof', `66')m4_dnl
m4_define(`TOK_key_return', `67')m4_dnl
m4_define(`TOK_key_cast', `68')m4_dnl
m4_define(`TOK_key_if', `69')m4_dnl
m4_define(`TOK_key_elif', `70')m4_dnl
m4_define(`TOK_key_else', `71')m4_dnl
m4_define(`TOK_key_then', `72')m4_dnl
m4_define(`TOK_key_jump', `73')m4_dnl
m4_define(`TOK_key_label', `74')m4_dnl
m4_define(`TOK_key_loop', `75')m4_dnl
m4_define(`TOK_key_while', `76')m4_dnl
m4_define(`TOK_key_match', `77')m4_dnl
m4_define(`TOK_key_otherwise', `78')m4_dnl
m4_define(`TOK_key_break', `79')m4_dnl
m4_define(`TOK_key_continue', `80')m4_dnl
m4_define(`TOK_key_pub', `81')m4_dnl
m4_define(`TOK_key_data', `82')m4_dnl
m4_define(`TOK_key_extrn', `83')m4_dnl
m4_define(`TOK_key_true', `84')m4_dnl
m4_define(`TOK_key_false', `85')m4_dnl
m4_define(`TOK_identifier', `86')m4_dnl
m4_define(`TOK_string_literal', `87')m4_dnl
m4_define(`TOK_char_const', `88')m4_dnl
m4_define(`TOK_int_const', `89')m4_dnl
m4_define(`TOK_long_const', `90')m4_dnl
m4_define(`TOK_uint_const', `91')m4_dnl
m4_define(`TOK_ulong_const', `92')m4_dnl
m4_define(`TOK_dbl_const', `93')m4_dnl
m4_define(`TOK_m4_prefix', `94')m4_dnl
m4_define(`TOK_import_file', `95')m4_dnl
m4_define(`TOK_import_force', `96')m4_dnl
m4_define(`TOK_use_file', `97')m4_dnl
m4_define(`TOK_use_force', `98')m4_dnl
m4_define(`TOK_error', `99')m4_dnl
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
pub fn get_type_fmt(ctx: *struc IdentifierContext, type_t: *struc Type, type_fmt: *string) string;
m4_define(`str_get_fmt', `TODO')m4_dnl
m4_define(`str_fmt_tok', `TODO')m4_dnl
m4_define(`str_fmt_name', `TODO')m4_dnl
m4_define(`str_fmt_struct_name', `TODO')m4_dnl
m4_define(`str_fmt_fun', `TODO')m4_dnl
m4_define(`str_fmt_ptr', `TODO')m4_dnl
m4_define(`str_fmt_arr', `TODO')m4_dnl
m4_define(`str_fmt_struct', `TODO')m4_dnl
m4_define(`str_fmt_type', `TODO')m4_dnl
pub fn get_fatal_msg(msg: i32) string;
pub fn get_arg_msg(msg: i32) string;
pub fn get_util_msg(msg: i32) string;
pub fn get_lexer_msg(msg: i32) string;
pub fn get_parser_msg(msg: i32) string;
pub fn get_semantic_msg(msg: i32) string;
m4_define(`GET_MESSAGE', `TODO')m4_dnl
m4_define(`GET_MESSAGE_0', `TODO')m4_dnl
m4_define(`GET_MESSAGE_1', `TODO')m4_dnl
m4_define(`GET_MESSAGE_2', `TODO')m4_dnl
m4_define(`GET_MESSAGE_3', `TODO')m4_dnl
m4_define(`GET_FATAL_MSG', `TODO')m4_dnl
m4_define(`GET_ARG_MSG', `TODO')m4_dnl
m4_define(`GET_UTIL_MSG', `TODO')m4_dnl
m4_define(`GET_LEXER_MSG', `TODO')m4_dnl
m4_define(`GET_PARSER_MSG', `TODO')m4_dnl
m4_define(`GET_SEMANTIC_MSG', `TODO')m4_dnl
m4_define(`STRINGIFY', `TODO')m4_dnl
m4_define(`GET_VERSION', `TODO')m4_dnl
m4_define(`GCC_VERSION', `TODO')m4_dnl
m4_define(`CLANG_VERSION', `TODO')m4_dnl
type struc ErrorsContext;
type struc FileIoContext;
type struc IdentifierContext;

type struc Token(tok_kind: i32, tok: u64, info_at: u64)

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
pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) i32;
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType;
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none;
type struc TacProgram;
type struc FrontEndContext;
pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none;

type struc MainContext(errors: *struc ErrorsContext, is_verbose: i32, debug_code: u8, optim_1_mask: u8, optim_2_code: u8, filename: string, includedirs: *string, stdlibdirs: *string)

m4_define(`Ctx', `TODO')m4_dnl

fn verbose(ctx: *struc MainContext, msg: string) none {
    if ctx[].is_verbose {
        printf("%s", msg)
    }
}

fn set_filename_ext(ctx: *struc MainContext, ext: string) none {
    loop i: u64 = sdslen(ctx[].filename) while i-- > 0 {
        if ctx[].filename[i] == '.' {
            loop .. while 0 {
                "@MACRO@:str_substr(ctx->filename, 0, i)"
                sdsrange(ctx[].filename, 0, i)
            }
            loop .. while 0 {
                "@MACRO@:str_append(ctx->filename, ext)"
                ctx[].filename = sdscat(ctx[].filename, ext)
            }
            return none
        }
    }
    panic_sigabrt("abort")
}

fn compile(ctx: *struc MainContext, errors: *struc ErrorsContext, fileio: *struc FileIoContext) i32 {
    identifiers: struc IdentifierContext;
    frontend: struc FrontEndContext;
    backend: struc BackEndContext;
    tokens: *struc Token = vec_new()
    c_ast: *struc CProgram = uptr_new()
    tac_ast: *struc TacProgram = uptr_new()

    asm_ast: *struc AsmProgram = uptr_new()
    {
        if ctx[].debug_code > 0 and ctx[].debug_code <= 127 {
            ctx[].is_verbose = true
            errors[].is_stdout = true
        }
        identifiers.label_count = 0u
        identifiers.var_count = 0u
        identifiers.struct_count = 0u
        identifiers.hash_table = map_new()
        frontend.string_const_table = map_new()
        frontend.struct_typedef_table = map_new()
        frontend.symbol_table = map_new()
        frontend.addressed_set = set_new()
        backend.symbol_table = map_new()
    }

    _errval: i32 = 0
    verbose(ctx, "-- Lexing ... ")
    loop .. while 0 {
        "@MACRO@:TRY(lex_c_code(ctx->filename, &ctx->includedirs, &ctx->stdlibdirs, errors, fileio, &identifiers, &tokens))"
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
        "@MACRO@:TRY(parse_tokens(&tokens, errors, &identifiers, &c_ast))"
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
        "@MACRO@:TRY(analyze_semantic(c_ast, errors, &frontend, &identifiers))"
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
        "@MACRO@:TRY(open_fwrite(fileio, ctx->filename))"
        _errval = open_fwrite(fileio, ctx[].filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    emit_gas_code(@asm_ast, @backend, fileio, @identifiers)
    close_fwrite(fileio)
    verbose(ctx, "OK\n")
    label _Lfinally
    loop i: u64 = 0 while i < (? (identifiers.hash_table) then (cast<*struc stbds_array_header>(((identifiers.hash_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (identifiers.hash_table[i]).value {
            "@MACRO@:str_delete(pair_second(identifiers.hash_table[i]))"
            sdsfree((identifiers.hash_table[i]).value)
            (identifiers.hash_table[i]).value = ? nil then sdsnew(nil) else nil
        }
    }
    if identifiers.hash_table {
        "@MACRO@:map_delete(identifiers.hash_table)"
        loop .. while 0 {
            cast<none>((? (identifiers.hash_table) ~= nil then stbds_hmfree_func((identifiers.hash_table) - 1, sizeof((identifiers.hash_table)[])) else cast<none>(0)))
            (identifiers.hash_table) = nil
        }
        identifiers.hash_table = map_new()
    }
    if frontend.string_const_table {
        "@MACRO@:map_delete(frontend.string_const_table)"
        loop .. while 0 {
            cast<none>((? (frontend.string_const_table) ~= nil then stbds_hmfree_func((frontend.string_const_table) - 1, sizeof((frontend.string_const_table)[])) else cast<none>(0)))
            (frontend.string_const_table) = nil
        }
        frontend.string_const_table = map_new()
    }
    loop i: u64 = 0 while i < (? (frontend.struct_typedef_table) then (cast<*struc stbds_array_header>(((frontend.struct_typedef_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructTypedef(@(frontend.struct_typedef_table[i]).value)
    }
    if frontend.struct_typedef_table {
        "@MACRO@:map_delete(frontend.struct_typedef_table)"
        loop .. while 0 {
            cast<none>((? (frontend.struct_typedef_table) ~= nil then stbds_hmfree_func((frontend.struct_typedef_table) - 1, sizeof((frontend.struct_typedef_table)[])) else cast<none>(0)))
            (frontend.struct_typedef_table) = nil
        }
        frontend.struct_typedef_table = map_new()
    }
    loop i: u64 = 0 while i < (? (frontend.symbol_table) then (cast<*struc stbds_array_header>(((frontend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_Symbol(@(frontend.symbol_table[i]).value)
    }
    if frontend.symbol_table {
        "@MACRO@:map_delete(frontend.symbol_table)"
        loop .. while 0 {
            cast<none>((? (frontend.symbol_table) ~= nil then stbds_hmfree_func((frontend.symbol_table) - 1, sizeof((frontend.symbol_table)[])) else cast<none>(0)))
            (frontend.symbol_table) = nil
        }
        frontend.symbol_table = map_new()
    }
    loop .. while 0 {
        "@MACRO@:set_delete(frontend.addressed_set)"
        if frontend.addressed_set {
            "@MACRO@:map_delete(frontend.addressed_set)"
            loop .. while 0 {
                cast<none>((? (frontend.addressed_set) ~= nil then stbds_hmfree_func((frontend.addressed_set) - 1, sizeof((frontend.addressed_set)[])) else cast<none>(0)))
                (frontend.addressed_set) = nil
            }
            frontend.addressed_set = map_new()
        }
    }
    loop i: u64 = 0 while i < (? (backend.symbol_table) then (cast<*struc stbds_array_header>(((backend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_BackendSymbol(@(backend.symbol_table[i]).value)
    }
    if backend.symbol_table {
        "@MACRO@:map_delete(backend.symbol_table)"
        loop .. while 0 {
            cast<none>((? (backend.symbol_table) ~= nil then stbds_hmfree_func((backend.symbol_table) - 1, sizeof((backend.symbol_table)[])) else cast<none>(0)))
            (backend.symbol_table) = nil
        }
        backend.symbol_table = map_new()
    }
    if tokens {
        "@MACRO@:vec_delete(tokens)"
        loop .. while 0 {
            cast<none>((? (tokens) then free((cast<*struc stbds_array_header>((tokens)) - 1)) else cast<none>(0)))
            (tokens) = nil
        }
        tokens = vec_new()
    }
    free_CProgram(@c_ast)
    free_TacProgram(@tac_ast)
    free_AsmProgram(@asm_ast)
    return _errval
}

fn arg_parse_uint8(arg: string, value: *u8) i32 {
    end_ptr: string = nil
    value[] = cast<u8>(strtol(arg, @end_ptr, 10))
    return end_ptr == arg
}

fn arg_parse(ctx: *struc MainContext, argc: i32, argv: *string) i32 {
    _errval: i32 = 0
    i: u64 = 0
    if argc == 2 and strcmp(argv[1], "--help") == 0 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_print_help), "MSG_print_help", "", "", argv[0]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_debug_arg), "MSG_no_debug_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].debug_code) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_debug_arg), "MSG_invalid_debug_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_1_arg), "MSG_no_optim_1_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_1_mask) or ctx[].optim_1_mask > 15 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_1_arg), "MSG_invalid_optim_1_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_2_arg), "MSG_no_optim_2_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_2_code) or ctx[].optim_2_code > 2 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_2_arg), "MSG_invalid_optim_2_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_input_files_arg), "MSG_no_input_files_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].filename = ? argv[i] then sdsnew(argv[i]) else nil
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_stdlib_dir_arg), "MSG_no_stdlib_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_push_back(ctx->stdlibdirs, (char*)argv[i])"
        loop .. while 0 {
            (? (not (ctx[].stdlibdirs) or (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].capacity) then (((ctx[].stdlibdirs) = stbds_arrgrowf((ctx[].stdlibdirs), sizeof((ctx[].stdlibdirs)[]), (1), (0))) and 0) else 0)
            (ctx[].stdlibdirs)[(cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length++] = (cast<string>(argv[i]))
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_include_dir_arg), "MSG_no_include_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while argv[++i] {
        loop .. while 0 {
            "@MACRO@:vec_push_back(ctx->includedirs, (char*)argv[i])"
            loop .. while 0 {
                (? (not (ctx[].includedirs) or (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].capacity) then (((ctx[].includedirs) = stbds_arrgrowf((ctx[].includedirs), sizeof((ctx[].includedirs)[]), (1), (0))) and 0) else 0)
                (ctx[].includedirs)[(cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length++] = (cast<string>(argv[i]))
            }
        }
    }
    label _Lfinally
    return _errval
}

pub fn main(argc: i32, argv: *string) i32 {
    errors: struc ErrorsContext;
    fileio: struc FileIoContext;

    ctx: struc MainContext;
    {
        errors.errors = @errors
        errors.fileio = @fileio
        errors.is_stdout = false
        errors.info_at_map = map_new()
        errors.fopen_lines = vec_new()
        errors.token_infos = vec_new()
        fileio.errors = @errors
        fileio.fd_write = nil
        fileio.write_buf = ? nil then sdsnew(nil) else nil
        fileio.filename = ? nil then sdsnew(nil) else nil
        fileio.file_reads = vec_new()
        ctx.errors = @errors
        ctx.is_verbose = false
        ctx.filename = ? nil then sdsnew(nil) else nil
        ctx.includedirs = vec_new()
        ctx.stdlibdirs = vec_new()
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(arg_parse(&ctx, argc, argv))"
        _errval = arg_parse(@ctx, argc, argv)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(compile(&ctx, &errors, &fileio))"
        _errval = compile(@ctx, @errors, @fileio)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if errors.info_at_map {
        "@MACRO@:map_delete(errors.info_at_map)"
        loop .. while 0 {
            cast<none>((? (errors.info_at_map) ~= nil then stbds_hmfree_func((errors.info_at_map) - 1, sizeof((errors.info_at_map)[])) else cast<none>(0)))
            (errors.info_at_map) = nil
        }
        errors.info_at_map = map_new()
    }
    loop i: u64 = 0 while i < (? (errors.fopen_lines) then (cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)[].length else 0) .. ++i {
        if errors.fopen_lines[i].filename {
            "@MACRO@:str_delete(errors.fopen_lines[i].filename)"
            sdsfree(errors.fopen_lines[i].filename)
            errors.fopen_lines[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if errors.fopen_lines {
        "@MACRO@:vec_delete(errors.fopen_lines)"
        loop .. while 0 {
            cast<none>((? (errors.fopen_lines) then free((cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)) else cast<none>(0)))
            (errors.fopen_lines) = nil
        }
        errors.fopen_lines = vec_new()
    }
    if errors.token_infos {
        "@MACRO@:vec_delete(errors.token_infos)"
        loop .. while 0 {
            cast<none>((? (errors.token_infos) then free((cast<*struc stbds_array_header>((errors.token_infos)) - 1)) else cast<none>(0)))
            (errors.token_infos) = nil
        }
        errors.token_infos = vec_new()
    }
    if fileio.write_buf {
        "@MACRO@:str_delete(fileio.write_buf)"
        sdsfree(fileio.write_buf)
        fileio.write_buf = ? nil then sdsnew(nil) else nil
    }
    if fileio.filename {
        "@MACRO@:str_delete(fileio.filename)"
        sdsfree(fileio.filename)
        fileio.filename = ? nil then sdsnew(nil) else nil
    }
    loop i: u64 = 0 while i < (? (fileio.file_reads) then (cast<*struc stbds_array_header>((fileio.file_reads)) - 1)[].length else 0) .. ++i {
        if fileio.file_reads[i].filename {
            "@MACRO@:str_delete(fileio.file_reads[i].filename)"
            sdsfree(fileio.file_reads[i].filename)
            fileio.file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if fileio.file_reads {
        "@MACRO@:vec_delete(fileio.file_reads)"
        loop .. while 0 {
            cast<none>((? (fileio.file_reads) then free((cast<*struc stbds_array_header>((fileio.file_reads)) - 1)) else cast<none>(0)))
            (fileio.file_reads) = nil
        }
        fileio.file_reads = vec_new()
    }
    if ctx.filename {
        "@MACRO@:str_delete(ctx.filename)"
        sdsfree(ctx.filename)
        ctx.filename = ? nil then sdsnew(nil) else nil
    }
    if ctx.includedirs {
        "@MACRO@:vec_delete(ctx.includedirs)"
        loop .. while 0 {
            cast<none>((? (ctx.includedirs) then free((cast<*struc stbds_array_header>((ctx.includedirs)) - 1)) else cast<none>(0)))
            (ctx.includedirs) = nil
        }
        ctx.includedirs = vec_new()
    }
    if ctx.stdlibdirs {
        "@MACRO@:vec_delete(ctx.stdlibdirs)"
        loop .. while 0 {
            cast<none>((? (ctx.stdlibdirs) then free((cast<*struc stbds_array_header>((ctx.stdlibdirs)) - 1)) else cast<none>(0)))
            (ctx.stdlibdirs) = nil
        }
        ctx.stdlibdirs = vec_new()
    }
    return _errval
}
