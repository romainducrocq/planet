extrn fn strtoimax(nptr: string, endptr: *string, base: i32) i64;
extrn fn strtoumax(nptr: string, endptr: *string, base: i32) u64;
m4_define(`bool', `TODO')m4_dnl
m4_define(`int8_t', `TODO')m4_dnl
m4_define(`int32_t', `TODO')m4_dnl
m4_define(`int64_t', `TODO')m4_dnl
m4_define(`uint8_t', `TODO')m4_dnl
m4_define(`uint32_t', `TODO')m4_dnl
m4_define(`uint64_t', `TODO')m4_dnl
m4_define(`FOPEN_MAX', `8')m4_dnl
type struc FILE;
extrn fn fclose(stream: *struc FILE) i32;
extrn fn fflush(stream: *struc FILE) i32;
extrn fn fopen(filename: string, mode: string) *struc FILE;
extrn fn fwrite(ptr: *any, size: u64, nmemb: u64, stream: *struc FILE) u64;
extrn fn printf(format: string, arg1: string) i32;
extrn fn snprintf(s: string, n: u64, format: string, arg1: string, arg2: string, arg3: string, arg4: string) i32;
extrn fn sprintf(s: string, format: string, arg1: u32) i32;
m4_define(`STDERR_FILENO', `2')m4_dnl
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
m4_define(`sds', `TODO')m4_dnl
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
m4_define(`arrlenu', `TODO')m4_dnl
m4_define(`arrput', `TODO')m4_dnl
m4_define(`arrpop', `TODO')m4_dnl
m4_define(`arrfree', `TODO')m4_dnl
m4_define(`arrsetlen', `TODO')m4_dnl
m4_define(`arrdelswap', `TODO')m4_dnl
m4_define(`arrsetcap', `TODO')m4_dnl
m4_define(`hmput', `TODO')m4_dnl
m4_define(`hmget', `TODO')m4_dnl
m4_define(`hmgeti', `TODO')m4_dnl
m4_define(`hmdel', `TODO')m4_dnl
m4_define(`hmlenu', `TODO')m4_dnl
m4_define(`hmfree', `TODO')m4_dnl

type struc stbds_array_header(length: u64, capacity: u64, hash_table: *any, temp: i64)

extrn fn stbds_hash_string(str: string, seed: u64) u64;
extrn fn stbds_arrgrowf(a: *any, elemsize: u64, addlen: u64, min_cap: u64) *any;
extrn fn stbds_hmfree_func(p: *any, elemsize: u64) none;
extrn fn stbds_hmget_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmput_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmdel_key(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32) *any;
m4_define(`error_t', `TODO')m4_dnl
m4_define(`ERROR_MSG_SIZE', `1024')m4_dnl
m4_define(`CATCH_ENTER', `TODO')m4_dnl
m4_define(`CATCH_EXIT', `TODO')m4_dnl
m4_define(`EARLY_EXIT', `TODO')m4_dnl
m4_define(`FINALLY', `TODO')m4_dnl
m4_define(`string_t', `TODO')m4_dnl
type struc AsmProgram;
type struc BackEndContext;
type struc FileIoContext;
type struc IdentifierContext;
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none;
type struc FileIoContext;
m4_define(`hash_t', `TODO')m4_dnl

type struc Pairhash_thash_t(key: u64, value: u64)

type struc FileOpenLine(linenum: u64, total_linenum: u64, filename: string)

type struc TokenInfo(tok_pos: i32, tok_len: i32, total_linenum: u64)

type struc ErrorsContext(errors: *struc ErrorsContext, fileio: *struc FileIoContext, msg: [ERROR_MSG_SIZE]char, is_stdout: i32, info_at_buf: u64, info_at_map: *struc Pairhash_thash_t, fopen_lines: *struc FileOpenLine, token_infos: *struc TokenInfo)

pub fn panic_sigabrt(msg: string) none;
m4_define(`THROW_ABORT', `TODO')m4_dnl
pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
m4_define(`ERROR_MSG_BUF', `TODO')m4_dnl
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
m4_define(`TIdentifier', `TODO')m4_dnl
m4_define(`TChar', `TODO')m4_dnl
m4_define(`TInt', `TODO')m4_dnl
m4_define(`TLong', `TODO')m4_dnl
m4_define(`TUChar', `TODO')m4_dnl
m4_define(`TUInt', `TODO')m4_dnl
m4_define(`TULong', `TODO')m4_dnl
m4_define(`TDouble', `TODO')m4_dnl
m4_define(`AST_T', `TODO')m4_dnl
m4_define(`AST_Type_t', `0')m4_dnl
m4_define(`AST_Char_t', `1')m4_dnl
m4_define(`AST_SChar_t', `2')m4_dnl
m4_define(`AST_UChar_t', `3')m4_dnl
m4_define(`AST_Int_t', `4')m4_dnl
m4_define(`AST_Long_t', `5')m4_dnl
m4_define(`AST_UInt_t', `6')m4_dnl
m4_define(`AST_ULong_t', `7')m4_dnl
m4_define(`AST_Double_t', `8')m4_dnl
m4_define(`AST_Void_t', `9')m4_dnl
m4_define(`AST_FunType_t', `10')m4_dnl
m4_define(`AST_Pointer_t', `11')m4_dnl
m4_define(`AST_Array_t', `12')m4_dnl
m4_define(`AST_Structure_t', `13')m4_dnl
m4_define(`AST_StaticInit_t', `14')m4_dnl
m4_define(`AST_IntInit_t', `15')m4_dnl
m4_define(`AST_LongInit_t', `16')m4_dnl
m4_define(`AST_UIntInit_t', `17')m4_dnl
m4_define(`AST_ULongInit_t', `18')m4_dnl
m4_define(`AST_CharInit_t', `19')m4_dnl
m4_define(`AST_UCharInit_t', `20')m4_dnl
m4_define(`AST_DoubleInit_t', `21')m4_dnl
m4_define(`AST_ZeroInit_t', `22')m4_dnl
m4_define(`AST_StringInit_t', `23')m4_dnl
m4_define(`AST_PointerInit_t', `24')m4_dnl
m4_define(`AST_InitialValue_t', `25')m4_dnl
m4_define(`AST_Tentative_t', `26')m4_dnl
m4_define(`AST_Initial_t', `27')m4_dnl
m4_define(`AST_NoInitializer_t', `28')m4_dnl
m4_define(`AST_IdentifierAttr_t', `29')m4_dnl
m4_define(`AST_FunAttr_t', `30')m4_dnl
m4_define(`AST_StaticAttr_t', `31')m4_dnl
m4_define(`AST_ConstantAttr_t', `32')m4_dnl
m4_define(`AST_LocalAttr_t', `33')m4_dnl
m4_define(`AST_Symbol_t', `34')m4_dnl
m4_define(`AST_StructMember_t', `35')m4_dnl
m4_define(`AST_StructTypedef_t', `36')m4_dnl
m4_define(`AST_AssemblyType_t', `37')m4_dnl
m4_define(`AST_Byte_t', `38')m4_dnl
m4_define(`AST_LongWord_t', `39')m4_dnl
m4_define(`AST_QuadWord_t', `40')m4_dnl
m4_define(`AST_BackendDouble_t', `41')m4_dnl
m4_define(`AST_ByteArray_t', `42')m4_dnl
m4_define(`AST_BackendSymbol_t', `43')m4_dnl
m4_define(`AST_BackendObj_t', `44')m4_dnl
m4_define(`AST_BackendFun_t', `45')m4_dnl
m4_define(`AST_CConst_t', `46')m4_dnl
m4_define(`AST_CConstInt_t', `47')m4_dnl
m4_define(`AST_CConstLong_t', `48')m4_dnl
m4_define(`AST_CConstUInt_t', `49')m4_dnl
m4_define(`AST_CConstULong_t', `50')m4_dnl
m4_define(`AST_CConstDouble_t', `51')m4_dnl
m4_define(`AST_CConstChar_t', `52')m4_dnl
m4_define(`AST_CConstUChar_t', `53')m4_dnl
m4_define(`AST_CStringLiteral_t', `54')m4_dnl
m4_define(`AST_CUnaryOp_t', `55')m4_dnl
m4_define(`AST_CComplement_t', `56')m4_dnl
m4_define(`AST_CNegate_t', `57')m4_dnl
m4_define(`AST_CNot_t', `58')m4_dnl
m4_define(`AST_CPrefix_t', `59')m4_dnl
m4_define(`AST_CPostfix_t', `60')m4_dnl
m4_define(`AST_CBinaryOp_t', `61')m4_dnl
m4_define(`AST_CAdd_t', `62')m4_dnl
m4_define(`AST_CSubtract_t', `63')m4_dnl
m4_define(`AST_CMultiply_t', `64')m4_dnl
m4_define(`AST_CDivide_t', `65')m4_dnl
m4_define(`AST_CRemainder_t', `66')m4_dnl
m4_define(`AST_CBitAnd_t', `67')m4_dnl
m4_define(`AST_CBitOr_t', `68')m4_dnl
m4_define(`AST_CBitXor_t', `69')m4_dnl
m4_define(`AST_CBitShiftLeft_t', `70')m4_dnl
m4_define(`AST_CBitShiftRight_t', `71')m4_dnl
m4_define(`AST_CBitShrArithmetic_t', `72')m4_dnl
m4_define(`AST_CAnd_t', `73')m4_dnl
m4_define(`AST_COr_t', `74')m4_dnl
m4_define(`AST_CEqual_t', `75')m4_dnl
m4_define(`AST_CNotEqual_t', `76')m4_dnl
m4_define(`AST_CLessThan_t', `77')m4_dnl
m4_define(`AST_CLessOrEqual_t', `78')m4_dnl
m4_define(`AST_CGreaterThan_t', `79')m4_dnl
m4_define(`AST_CGreaterOrEqual_t', `80')m4_dnl
m4_define(`AST_CAbstractDeclarator_t', `81')m4_dnl
m4_define(`AST_CAbstractPointer_t', `82')m4_dnl
m4_define(`AST_CAbstractArray_t', `83')m4_dnl
m4_define(`AST_CAbstractBase_t', `84')m4_dnl
m4_define(`AST_CParam_t', `85')m4_dnl
m4_define(`AST_CDeclarator_t', `86')m4_dnl
m4_define(`AST_CIdent_t', `87')m4_dnl
m4_define(`AST_CPointerDeclarator_t', `88')m4_dnl
m4_define(`AST_CArrayDeclarator_t', `89')m4_dnl
m4_define(`AST_CFunDeclarator_t', `90')m4_dnl
m4_define(`AST_CExp_t', `91')m4_dnl
m4_define(`AST_CConstant_t', `92')m4_dnl
m4_define(`AST_CString_t', `93')m4_dnl
m4_define(`AST_CVar_t', `94')m4_dnl
m4_define(`AST_CCast_t', `95')m4_dnl
m4_define(`AST_CUnary_t', `96')m4_dnl
m4_define(`AST_CBinary_t', `97')m4_dnl
m4_define(`AST_CAssignment_t', `98')m4_dnl
m4_define(`AST_CConditional_t', `99')m4_dnl
m4_define(`AST_CFunctionCall_t', `100')m4_dnl
m4_define(`AST_CDereference_t', `101')m4_dnl
m4_define(`AST_CAddrOf_t', `102')m4_dnl
m4_define(`AST_CSubscript_t', `103')m4_dnl
m4_define(`AST_CSizeOf_t', `104')m4_dnl
m4_define(`AST_CSizeOfT_t', `105')m4_dnl
m4_define(`AST_CDot_t', `106')m4_dnl
m4_define(`AST_CArrow_t', `107')m4_dnl
m4_define(`AST_CStatement_t', `108')m4_dnl
m4_define(`AST_CReturn_t', `109')m4_dnl
m4_define(`AST_CExpression_t', `110')m4_dnl
m4_define(`AST_CIf_t', `111')m4_dnl
m4_define(`AST_CGoto_t', `112')m4_dnl
m4_define(`AST_CLabel_t', `113')m4_dnl
m4_define(`AST_CCompound_t', `114')m4_dnl
m4_define(`AST_CWhile_t', `115')m4_dnl
m4_define(`AST_CDoWhile_t', `116')m4_dnl
m4_define(`AST_CFor_t', `117')m4_dnl
m4_define(`AST_CSwitch_t', `118')m4_dnl
m4_define(`AST_CCase_t', `119')m4_dnl
m4_define(`AST_CDefault_t', `120')m4_dnl
m4_define(`AST_CBreak_t', `121')m4_dnl
m4_define(`AST_CContinue_t', `122')m4_dnl
m4_define(`AST_CNull_t', `123')m4_dnl
m4_define(`AST_CForInit_t', `124')m4_dnl
m4_define(`AST_CInitDecl_t', `125')m4_dnl
m4_define(`AST_CInitExp_t', `126')m4_dnl
m4_define(`AST_CBlock_t', `127')m4_dnl
m4_define(`AST_CB_t', `128')m4_dnl
m4_define(`AST_CBlockItem_t', `129')m4_dnl
m4_define(`AST_CS_t', `130')m4_dnl
m4_define(`AST_CD_t', `131')m4_dnl
m4_define(`AST_CStorageClass_t', `132')m4_dnl
m4_define(`AST_CStatic_t', `133')m4_dnl
m4_define(`AST_CExtern_t', `134')m4_dnl
m4_define(`AST_CInitializer_t', `135')m4_dnl
m4_define(`AST_CSingleInit_t', `136')m4_dnl
m4_define(`AST_CCompoundInit_t', `137')m4_dnl
m4_define(`AST_CMemberDeclaration_t', `138')m4_dnl
m4_define(`AST_CStructDeclaration_t', `139')m4_dnl
m4_define(`AST_CFunctionDeclaration_t', `140')m4_dnl
m4_define(`AST_CVariableDeclaration_t', `141')m4_dnl
m4_define(`AST_CDeclaration_t', `142')m4_dnl
m4_define(`AST_CFunDecl_t', `143')m4_dnl
m4_define(`AST_CVarDecl_t', `144')m4_dnl
m4_define(`AST_CStructDecl_t', `145')m4_dnl
m4_define(`AST_CProgram_t', `146')m4_dnl
m4_define(`AST_TacUnaryOp_t', `147')m4_dnl
m4_define(`AST_TacComplement_t', `148')m4_dnl
m4_define(`AST_TacNegate_t', `149')m4_dnl
m4_define(`AST_TacNot_t', `150')m4_dnl
m4_define(`AST_TacBinaryOp_t', `151')m4_dnl
m4_define(`AST_TacAdd_t', `152')m4_dnl
m4_define(`AST_TacSubtract_t', `153')m4_dnl
m4_define(`AST_TacMultiply_t', `154')m4_dnl
m4_define(`AST_TacDivide_t', `155')m4_dnl
m4_define(`AST_TacRemainder_t', `156')m4_dnl
m4_define(`AST_TacBitAnd_t', `157')m4_dnl
m4_define(`AST_TacBitOr_t', `158')m4_dnl
m4_define(`AST_TacBitXor_t', `159')m4_dnl
m4_define(`AST_TacBitShiftLeft_t', `160')m4_dnl
m4_define(`AST_TacBitShiftRight_t', `161')m4_dnl
m4_define(`AST_TacBitShrArithmetic_t', `162')m4_dnl
m4_define(`AST_TacEqual_t', `163')m4_dnl
m4_define(`AST_TacNotEqual_t', `164')m4_dnl
m4_define(`AST_TacLessThan_t', `165')m4_dnl
m4_define(`AST_TacLessOrEqual_t', `166')m4_dnl
m4_define(`AST_TacGreaterThan_t', `167')m4_dnl
m4_define(`AST_TacGreaterOrEqual_t', `168')m4_dnl
m4_define(`AST_TacValue_t', `169')m4_dnl
m4_define(`AST_TacConstant_t', `170')m4_dnl
m4_define(`AST_TacVariable_t', `171')m4_dnl
m4_define(`AST_TacExpResult_t', `172')m4_dnl
m4_define(`AST_TacPlainOperand_t', `173')m4_dnl
m4_define(`AST_TacDereferencedPointer_t', `174')m4_dnl
m4_define(`AST_TacSubObject_t', `175')m4_dnl
m4_define(`AST_TacInstruction_t', `176')m4_dnl
m4_define(`AST_TacReturn_t', `177')m4_dnl
m4_define(`AST_TacSignExtend_t', `178')m4_dnl
m4_define(`AST_TacTruncate_t', `179')m4_dnl
m4_define(`AST_TacZeroExtend_t', `180')m4_dnl
m4_define(`AST_TacDoubleToInt_t', `181')m4_dnl
m4_define(`AST_TacDoubleToUInt_t', `182')m4_dnl
m4_define(`AST_TacIntToDouble_t', `183')m4_dnl
m4_define(`AST_TacUIntToDouble_t', `184')m4_dnl
m4_define(`AST_TacFunCall_t', `185')m4_dnl
m4_define(`AST_TacUnary_t', `186')m4_dnl
m4_define(`AST_TacBinary_t', `187')m4_dnl
m4_define(`AST_TacCopy_t', `188')m4_dnl
m4_define(`AST_TacGetAddress_t', `189')m4_dnl
m4_define(`AST_TacLoad_t', `190')m4_dnl
m4_define(`AST_TacStore_t', `191')m4_dnl
m4_define(`AST_TacAddPtr_t', `192')m4_dnl
m4_define(`AST_TacCopyToOffset_t', `193')m4_dnl
m4_define(`AST_TacCopyFromOffset_t', `194')m4_dnl
m4_define(`AST_TacJump_t', `195')m4_dnl
m4_define(`AST_TacJumpIfZero_t', `196')m4_dnl
m4_define(`AST_TacJumpIfNotZero_t', `197')m4_dnl
m4_define(`AST_TacLabel_t', `198')m4_dnl
m4_define(`AST_TacTopLevel_t', `199')m4_dnl
m4_define(`AST_TacFunction_t', `200')m4_dnl
m4_define(`AST_TacStaticVariable_t', `201')m4_dnl
m4_define(`AST_TacStaticConstant_t', `202')m4_dnl
m4_define(`AST_TacProgram_t', `203')m4_dnl
m4_define(`AST_AsmReg_t', `204')m4_dnl
m4_define(`AST_AsmAx_t', `205')m4_dnl
m4_define(`AST_AsmBx_t', `206')m4_dnl
m4_define(`AST_AsmCx_t', `207')m4_dnl
m4_define(`AST_AsmDx_t', `208')m4_dnl
m4_define(`AST_AsmDi_t', `209')m4_dnl
m4_define(`AST_AsmSi_t', `210')m4_dnl
m4_define(`AST_AsmR8_t', `211')m4_dnl
m4_define(`AST_AsmR9_t', `212')m4_dnl
m4_define(`AST_AsmR10_t', `213')m4_dnl
m4_define(`AST_AsmR11_t', `214')m4_dnl
m4_define(`AST_AsmR12_t', `215')m4_dnl
m4_define(`AST_AsmR13_t', `216')m4_dnl
m4_define(`AST_AsmR14_t', `217')m4_dnl
m4_define(`AST_AsmR15_t', `218')m4_dnl
m4_define(`AST_AsmSp_t', `219')m4_dnl
m4_define(`AST_AsmBp_t', `220')m4_dnl
m4_define(`AST_AsmXMM0_t', `221')m4_dnl
m4_define(`AST_AsmXMM1_t', `222')m4_dnl
m4_define(`AST_AsmXMM2_t', `223')m4_dnl
m4_define(`AST_AsmXMM3_t', `224')m4_dnl
m4_define(`AST_AsmXMM4_t', `225')m4_dnl
m4_define(`AST_AsmXMM5_t', `226')m4_dnl
m4_define(`AST_AsmXMM6_t', `227')m4_dnl
m4_define(`AST_AsmXMM7_t', `228')m4_dnl
m4_define(`AST_AsmXMM8_t', `229')m4_dnl
m4_define(`AST_AsmXMM9_t', `230')m4_dnl
m4_define(`AST_AsmXMM10_t', `231')m4_dnl
m4_define(`AST_AsmXMM11_t', `232')m4_dnl
m4_define(`AST_AsmXMM12_t', `233')m4_dnl
m4_define(`AST_AsmXMM13_t', `234')m4_dnl
m4_define(`AST_AsmXMM14_t', `235')m4_dnl
m4_define(`AST_AsmXMM15_t', `236')m4_dnl
m4_define(`AST_AsmCondCode_t', `237')m4_dnl
m4_define(`AST_AsmE_t', `238')m4_dnl
m4_define(`AST_AsmNE_t', `239')m4_dnl
m4_define(`AST_AsmG_t', `240')m4_dnl
m4_define(`AST_AsmGE_t', `241')m4_dnl
m4_define(`AST_AsmL_t', `242')m4_dnl
m4_define(`AST_AsmLE_t', `243')m4_dnl
m4_define(`AST_AsmA_t', `244')m4_dnl
m4_define(`AST_AsmAE_t', `245')m4_dnl
m4_define(`AST_AsmB_t', `246')m4_dnl
m4_define(`AST_AsmBE_t', `247')m4_dnl
m4_define(`AST_AsmP_t', `248')m4_dnl
m4_define(`AST_AsmOperand_t', `249')m4_dnl
m4_define(`AST_AsmImm_t', `250')m4_dnl
m4_define(`AST_AsmRegister_t', `251')m4_dnl
m4_define(`AST_AsmPseudo_t', `252')m4_dnl
m4_define(`AST_AsmMemory_t', `253')m4_dnl
m4_define(`AST_AsmData_t', `254')m4_dnl
m4_define(`AST_AsmPseudoMem_t', `255')m4_dnl
m4_define(`AST_AsmIndexed_t', `256')m4_dnl
m4_define(`AST_AsmBinaryOp_t', `257')m4_dnl
m4_define(`AST_AsmAdd_t', `258')m4_dnl
m4_define(`AST_AsmSub_t', `259')m4_dnl
m4_define(`AST_AsmMult_t', `260')m4_dnl
m4_define(`AST_AsmDivDouble_t', `261')m4_dnl
m4_define(`AST_AsmBitAnd_t', `262')m4_dnl
m4_define(`AST_AsmBitOr_t', `263')m4_dnl
m4_define(`AST_AsmBitXor_t', `264')m4_dnl
m4_define(`AST_AsmBitShiftLeft_t', `265')m4_dnl
m4_define(`AST_AsmBitShiftRight_t', `266')m4_dnl
m4_define(`AST_AsmBitShrArithmetic_t', `267')m4_dnl
m4_define(`AST_AsmUnaryOp_t', `268')m4_dnl
m4_define(`AST_AsmNot_t', `269')m4_dnl
m4_define(`AST_AsmNeg_t', `270')m4_dnl
m4_define(`AST_AsmShr_t', `271')m4_dnl
m4_define(`AST_AsmInstruction_t', `272')m4_dnl
m4_define(`AST_AsmMov_t', `273')m4_dnl
m4_define(`AST_AsmMovSx_t', `274')m4_dnl
m4_define(`AST_AsmMovZeroExtend_t', `275')m4_dnl
m4_define(`AST_AsmLea_t', `276')m4_dnl
m4_define(`AST_AsmCvttsd2si_t', `277')m4_dnl
m4_define(`AST_AsmCvtsi2sd_t', `278')m4_dnl
m4_define(`AST_AsmUnary_t', `279')m4_dnl
m4_define(`AST_AsmBinary_t', `280')m4_dnl
m4_define(`AST_AsmCmp_t', `281')m4_dnl
m4_define(`AST_AsmIdiv_t', `282')m4_dnl
m4_define(`AST_AsmDiv_t', `283')m4_dnl
m4_define(`AST_AsmCdq_t', `284')m4_dnl
m4_define(`AST_AsmJmp_t', `285')m4_dnl
m4_define(`AST_AsmJmpCC_t', `286')m4_dnl
m4_define(`AST_AsmSetCC_t', `287')m4_dnl
m4_define(`AST_AsmLabel_t', `288')m4_dnl
m4_define(`AST_AsmPush_t', `289')m4_dnl
m4_define(`AST_AsmPop_t', `290')m4_dnl
m4_define(`AST_AsmCall_t', `291')m4_dnl
m4_define(`AST_AsmRet_t', `292')m4_dnl
m4_define(`AST_AsmTopLevel_t', `293')m4_dnl
m4_define(`AST_AsmFunction_t', `294')m4_dnl
m4_define(`AST_AsmStaticVariable_t', `295')m4_dnl
m4_define(`AST_AsmStaticConstant_t', `296')m4_dnl
m4_define(`AST_AsmProgram_t', `297')m4_dnl
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

type struc AsmCondCode(tag: i32)
pub fn make_AsmCondCode(tag: i32) struc AsmCondCode;

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

type struc AsmUnaryOp(tag: i32)
pub fn make_AsmUnaryOp(tag: i32) struc AsmUnaryOp;

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

type struc GasCodeContext(backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext)

m4_define(`Ctx', `TODO')m4_dnl
m4_define(`LF', `TODO')m4_dnl
m4_define(`TAB', `TODO')m4_dnl
m4_define(`LBL', `TODO')m4_dnl
m4_define(`LBL', `TODO')m4_dnl

fn emit(ctx: *struc GasCodeContext, code: string) none {
    write_buffer(ctx[].fileio, code)
}

fn emit_identifier(ctx: *struc GasCodeContext, identifier: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((identifier))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}

fn emit_string(ctx: *struc GasCodeContext, string_const: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((string_const))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}

fn emit_char(ctx: *struc GasCodeContext, value: i8) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_int(ctx: *struc GasCodeContext, value: i32) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_long(ctx: *struc GasCodeContext, value: i64) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_dbl(ctx: *struc GasCodeContext, dbl_const: u64) none {
    value: string = ((? ((? ((ctx[].identifiers[].hash_table) = stbds_hmget_key((ctx[].identifiers[].hash_table), sizeof((ctx[].identifiers[].hash_table)[]), cast<*any>(@((dbl_const))), sizeof((ctx[].identifiers[].hash_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].identifiers[].hash_table)[(cast<*struc stbds_array_header>(((ctx[].identifiers[].hash_table) - 1)) - 1)[].temp])[].value)
    emit(ctx, value)
}

fn emit_uchar(ctx: *struc GasCodeContext, value: u8) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_uint(ctx: *struc GasCodeContext, value: u32) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn emit_ulong(ctx: *struc GasCodeContext, value: u64) none {
    strto_value: string = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
    emit(ctx, strto_value)
    if strto_value {
        sdsfree(strto_value)
        strto_value = ? nil then sdsnew(nil) else nil
    }
}

fn get_reg_rsp_sse(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmSp_t {
            return "%rsp"
        }
        -> AST_AsmBp_t {
            return "%rbp"
        }
        -> AST_AsmXMM0_t {
            return "%xmm0"
        }
        -> AST_AsmXMM1_t {
            return "%xmm1"
        }
        -> AST_AsmXMM2_t {
            return "%xmm2"
        }
        -> AST_AsmXMM3_t {
            return "%xmm3"
        }
        -> AST_AsmXMM4_t {
            return "%xmm4"
        }
        -> AST_AsmXMM5_t {
            return "%xmm5"
        }
        -> AST_AsmXMM6_t {
            return "%xmm6"
        }
        -> AST_AsmXMM7_t {
            return "%xmm7"
        }
        -> AST_AsmXMM8_t {
            return "%xmm8"
        }
        -> AST_AsmXMM9_t {
            return "%xmm9"
        }
        -> AST_AsmXMM10_t {
            return "%xmm10"
        }
        -> AST_AsmXMM11_t {
            return "%xmm11"
        }
        -> AST_AsmXMM12_t {
            return "%xmm12"
        }
        -> AST_AsmXMM13_t {
            return "%xmm13"
        }
        -> AST_AsmXMM14_t {
            return "%xmm14"
        }
        -> AST_AsmXMM15_t {
            return "%xmm15"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_reg_1b(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmAx_t {
            return "%al"
        }
        -> AST_AsmBx_t {
            return "%bl"
        }
        -> AST_AsmDx_t {
            return "%dl"
        }
        -> AST_AsmCx_t {
            return "%cl"
        }
        -> AST_AsmDi_t {
            return "%dil"
        }
        -> AST_AsmSi_t {
            return "%sil"
        }
        -> AST_AsmR8_t {
            return "%r8b"
        }
        -> AST_AsmR9_t {
            return "%r9b"
        }
        -> AST_AsmR10_t {
            return "%r10b"
        }
        -> AST_AsmR11_t {
            return "%r11b"
        }
        -> AST_AsmR12_t {
            return "%r12b"
        }
        -> AST_AsmR13_t {
            return "%r13b"
        }
        -> AST_AsmR14_t {
            return "%r14b"
        }
        -> AST_AsmR15_t {
            return "%r15b"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}

fn get_reg_4b(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmAx_t {
            return "%eax"
        }
        -> AST_AsmBx_t {
            return "%ebx"
        }
        -> AST_AsmDx_t {
            return "%edx"
        }
        -> AST_AsmCx_t {
            return "%ecx"
        }
        -> AST_AsmDi_t {
            return "%edi"
        }
        -> AST_AsmSi_t {
            return "%esi"
        }
        -> AST_AsmR8_t {
            return "%r8d"
        }
        -> AST_AsmR9_t {
            return "%r9d"
        }
        -> AST_AsmR10_t {
            return "%r10d"
        }
        -> AST_AsmR11_t {
            return "%r11d"
        }
        -> AST_AsmR12_t {
            return "%r12d"
        }
        -> AST_AsmR13_t {
            return "%r13d"
        }
        -> AST_AsmR14_t {
            return "%r14d"
        }
        -> AST_AsmR15_t {
            return "%r15d"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}

fn get_reg_8b(node: *struc AsmReg) string {
    match node[].tag {
        -> AST_AsmAx_t {
            return "%rax"
        }
        -> AST_AsmBx_t {
            return "%rbx"
        }
        -> AST_AsmDx_t {
            return "%rdx"
        }
        -> AST_AsmCx_t {
            return "%rcx"
        }
        -> AST_AsmDi_t {
            return "%rdi"
        }
        -> AST_AsmSi_t {
            return "%rsi"
        }
        -> AST_AsmR8_t {
            return "%r8"
        }
        -> AST_AsmR9_t {
            return "%r9"
        }
        -> AST_AsmR10_t {
            return "%r10"
        }
        -> AST_AsmR11_t {
            return "%r11"
        }
        -> AST_AsmR12_t {
            return "%r12"
        }
        -> AST_AsmR13_t {
            return "%r13"
        }
        -> AST_AsmR14_t {
            return "%r14"
        }
        -> AST_AsmR15_t {
            return "%r15"
        }
        otherwise {
            return get_reg_rsp_sse(node)
        }
    }
}

fn get_cond_code(node: *struc AsmCondCode) string {
    match node[].tag {
        -> AST_AsmE_t {
            return "e"
        }
        -> AST_AsmNE_t {
            return "ne"
        }
        -> AST_AsmL_t {
            return "l"
        }
        -> AST_AsmLE_t {
            return "le"
        }
        -> AST_AsmG_t {
            return "g"
        }
        -> AST_AsmGE_t {
            return "ge"
        }
        -> AST_AsmB_t {
            return "b"
        }
        -> AST_AsmBE_t {
            return "be"
        }
        -> AST_AsmA_t {
            return "a"
        }
        -> AST_AsmAE_t {
            return "ae"
        }
        -> AST_AsmP_t {
            return "p"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn type_align_bytes(node: *struc AssemblyType) i32 {
    match node[].tag {
        -> AST_Byte_t {
            return 1
        }
        -> AST_LongWord_t {
            return 4
        }
        -> AST_QuadWord_t {
            -> AST_BackendDouble_t {
                return 8
            }
        }
        -> AST_ByteArray_t {
            return node[].get._ByteArray.alignment
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_type_suffix(node: *struc AssemblyType, is_packed: i32) string {
    match node[].tag {
        -> AST_Byte_t {
            return "b"
        }
        -> AST_LongWord_t {
            return "l"
        }
        -> AST_QuadWord_t {
            return "q"
        }
        -> AST_BackendDouble_t {
            return ? is_packed then "pd" else "sd"
        }
        otherwise {
            panic_sigabrt("abort")
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
            panic_sigabrt("abort")
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
    map_it: i64 = (? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        backend_obj_symbol: *struc BackendSymbol = (ctx[].backend[].symbol_table[map_it]).value
        if backend_obj_symbol[].tag == AST_BackendObj_t and backend_obj_symbol[].get._BackendObj.is_const {
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
    match node[].tag {
        -> AST_AsmImm_t {
            imm_op(ctx, @node[].get._AsmImm)
        }
        break
        -> AST_AsmRegister_t {
            reg_op(ctx, @node[].get._AsmRegister, byte)
        }
        break
        -> AST_AsmMemory_t {
            memory_op(ctx, @node[].get._AsmMemory)
        }
        break
        -> AST_AsmData_t {
            data_op(ctx, @node[].get._AsmData)
        }
        break
        -> AST_AsmIndexed_t {
            indexed_op(ctx, @node[].get._AsmIndexed)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_unop(node: *struc AsmUnaryOp) string {
    match node[].tag {
        -> AST_AsmNeg_t {
            return "neg"
        }
        -> AST_AsmNot_t {
            return "not"
        }
        -> AST_AsmShr_t {
            return "shr"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_binop(node: *struc AsmBinaryOp, is_dbl: i32) string {
    match node[].tag {
        -> AST_AsmAdd_t {
            return "add"
        }
        -> AST_AsmSub_t {
            return "sub"
        }
        -> AST_AsmMult_t {
            return ? is_dbl then "mul" else "imul"
        }
        -> AST_AsmDivDouble_t {
            return "div"
        }
        -> AST_AsmBitAnd_t {
            return "and"
        }
        -> AST_AsmBitOr_t {
            return "or"
        }
        -> AST_AsmBitXor_t {
            return "xor"
        }
        -> AST_AsmBitShiftLeft_t {
            return "shl"
        }
        -> AST_AsmBitShiftRight_t {
            return "shr"
        }
        -> AST_AsmBitShrArithmetic_t {
            return "sar"
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn mov_instr(ctx: *struc GasCodeContext, node: *struc AsmMov) none {
    emit(ctx, "    "         "    "         "mov")
    emit(ctx, get_type_suffix(node[].asm_type, false))
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
    emit(ctx, "    "         "    "         "movs")
    emit(ctx, get_type_suffix(node[].asm_type_src, false))
    emit(ctx, get_type_suffix(node[].asm_type_dst, false))
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
    emit(ctx, "    "         "    "         "movzb")
    emit(ctx, get_type_suffix(node[].asm_type_dst, false))
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
    emit(ctx, "    "         "    "         "leaq ")
    emit_op(ctx, node[].src, 8)
    emit(ctx, ", ")
    emit_op(ctx, node[].dst, 8)
    emit(ctx, "\n")
}

fn cvttsd2si_instr(ctx: *struc GasCodeContext, node: *struc AsmCvttsd2si) none {
    emit(ctx, "    "         "    "         "cvttsd2si")
    emit(ctx, get_type_suffix(node[].asm_type, false))
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
    emit(ctx, "    "         "    "         "cvtsi2sd")
    emit(ctx, get_type_suffix(node[].asm_type, false))
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
    emit(ctx, "    "         "    ")
    emit(ctx, get_unop(@node[].unop))
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].dst, byte)
    }
    emit(ctx, "\n")
}

fn binary_instr(ctx: *struc GasCodeContext, node: *struc AsmBinary) none {
    emit(ctx, "    "         "    ")
    {
        is_dbl: i32 = node[].asm_type[].tag == AST_BackendDouble_t
        emit(ctx, get_binop(@node[].binop, is_dbl))
        is_packed: i32 = node[].binop.tag == AST_AsmBitXor_t and is_dbl
        emit(ctx, get_type_suffix(node[].asm_type, is_packed))
    }
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        match node[].binop.tag {
            -> AST_AsmBitShiftLeft_t {
                -> AST_AsmBitShiftRight_t {
                    -> AST_AsmBitShrArithmetic_t {
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
    if node[].asm_type[].tag == AST_BackendDouble_t {
        emit(ctx, "    "             "    "             "comi")
    }
    else {
        emit(ctx, "    "             "    "             "cmp")
    }
    emit(ctx, get_type_suffix(node[].asm_type, false))
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
    emit(ctx, "    "         "    "         "idiv")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, "\n")
}

fn div_instr(ctx: *struc GasCodeContext, node: *struc AsmDiv) none {
    emit(ctx, "    "         "    "         "div")
    emit(ctx, get_type_suffix(node[].asm_type, false))
    emit(ctx, " ")
    {
        byte: i32 = type_align_bytes(node[].asm_type)
        emit_op(ctx, node[].src, byte)
    }
    emit(ctx, "\n")
}

fn cdq_instr(ctx: *struc GasCodeContext, node: *struc AsmCdq) none {
    match node[].asm_type[].tag {
        -> AST_LongWord_t {
            emit(ctx, "    "                 "    "                 "cdq"                 "\n")
        }
        break
        -> AST_QuadWord_t {
            emit(ctx, "    "                 "    "                 "cqo"                 "\n")
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn jmp_instr(ctx: *struc GasCodeContext, node: *struc AsmJmp) none {
    emit(ctx, "    "         "    "         "jmp "         ".L")
    emit_identifier(ctx, node[].target)
    emit(ctx, "\n")
}

fn jmp_cc_instr(ctx: *struc GasCodeContext, node: *struc AsmJmpCC) none {
    emit(ctx, "    "         "    "         "j")
    emit(ctx, get_cond_code(@node[].cond_code))
    emit(ctx, " "         ".L")
    emit_identifier(ctx, node[].target)
    emit(ctx, "\n")
}

fn set_cc_instr(ctx: *struc GasCodeContext, node: *struc AsmSetCC) none {
    emit(ctx, "    "         "    "         "set")
    emit(ctx, get_cond_code(@node[].cond_code))
    emit(ctx, " ")
    emit_op(ctx, node[].dst, 1)
    emit(ctx, "\n")
}

fn label_instr(ctx: *struc GasCodeContext, node: *struc AsmLabel) none {
    emit(ctx, "    "         ".L")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n")
}

fn push_instr(ctx: *struc GasCodeContext, node: *struc AsmPush) none {
    emit(ctx, "    "         "    "         "pushq ")
    emit_op(ctx, node[].src, 8)
    emit(ctx, "\n")
}

fn pop_instr(ctx: *struc GasCodeContext, node: *struc AsmPop) none {
    emit(ctx, "    "         "    "         "popq ")
    emit(ctx, get_reg_8b(@node[].reg))
    emit(ctx, "\n")
}

fn call_instr(ctx: *struc GasCodeContext, node: *struc AsmCall) none {
    emit(ctx, "    "         "    "         "call ")
    emit_identifier(ctx, node[].name)
    backend_fun_symbol: *struc BackendSymbol = ((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)
    if not backend_fun_symbol[].get._BackendFun.is_def {
        emit(ctx, "@PLT")
    }
    emit(ctx, "\n")
}

fn ret_instr(ctx: *struc GasCodeContext) none {
    emit(ctx, "    "         "movq %rbp, %rsp"         "\n"         "    "         "popq %rbp"         "\n"         "    "         "ret"         "\n")
}

fn emit_instr(ctx: *struc GasCodeContext, node: *struc AsmInstruction) none {
    match node[].tag {
        -> AST_AsmMov_t {
            mov_instr(ctx, @node[].get._AsmMov)
        }
        break
        -> AST_AsmMovSx_t {
            mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmCdq_t {
            cdq_instr(ctx, @node[].get._AsmCdq)
        }
        break
        -> AST_AsmJmp_t {
            jmp_instr(ctx, @node[].get._AsmJmp)
        }
        break
        -> AST_AsmJmpCC_t {
            jmp_cc_instr(ctx, @node[].get._AsmJmpCC)
        }
        break
        -> AST_AsmSetCC_t {
            set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmLabel_t {
            label_instr(ctx, @node[].get._AsmLabel)
        }
        break
        -> AST_AsmPush_t {
            push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> AST_AsmPop_t {
            pop_instr(ctx, @node[].get._AsmPop)
        }
        break
        -> AST_AsmCall_t {
            call_instr(ctx, @node[].get._AsmCall)
        }
        break
        -> AST_AsmRet_t {
            ret_instr(ctx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
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
        emit(ctx, "    "             ".globl ")
        emit_identifier(ctx, name)
        emit(ctx, "\n")
    }
}

fn emit_fun_toplvl(ctx: *struc GasCodeContext, node: *struc AsmFunction) none {
    glob_directive_toplvl(ctx, node[].name, node[].is_glob)
    emit(ctx, "    "         ".text"         "\n")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n"         "    "         "pushq %rbp"         "\n"         "    "         "movq %rsp, %rbp"         "\n")
    emit_instr_list(ctx, node[].instructions)
}

fn static_section_toplvl(ctx: *struc GasCodeContext, node_list: **struc StaticInit) none {
    if (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) == 1 and node_list[0][].tag == AST_ZeroInit_t {
        emit(ctx, "    "             ".bss"             "\n")
    }
    else {
        emit(ctx, "    "             ".data"             "\n")
    }
}

fn align_directive_toplvl(ctx: *struc GasCodeContext, alignment: i32) none {
    if alignment > 1 {
        emit(ctx, "    "             ".balign ")
        emit_int(ctx, alignment)
        emit(ctx, "\n")
    }
}

fn static_init_toplvl(ctx: *struc GasCodeContext, node: *struc StaticInit) none {
    match node[].tag {
        -> AST_CharInit_t {
            emit(ctx, "    "                 "    "                 ".byte ")
        }
        emit_char(ctx, node[].get._CharInit.value)
        emit(ctx, "\n")
        break
        -> AST_IntInit_t {
            emit(ctx, "    "                 "    "                 ".long ")
        }
        emit_int(ctx, node[].get._IntInit.value)
        emit(ctx, "\n")
        break
        -> AST_LongInit_t {
            emit(ctx, "    "                 "    "                 ".quad ")
        }
        emit_long(ctx, node[].get._LongInit.value)
        emit(ctx, "\n")
        break
        -> AST_DoubleInit_t {
            emit(ctx, "    "                 "    "                 ".quad ")
        }
        emit_dbl(ctx, node[].get._DoubleInit.dbl_const)
        emit(ctx, "\n")
        break
        -> AST_UCharInit_t {
            emit(ctx, "    "                 "    "                 ".byte ")
        }
        emit_uchar(ctx, node[].get._UCharInit.value)
        emit(ctx, "\n")
        break
        -> AST_UIntInit_t {
            emit(ctx, "    "                 "    "                 ".long ")
        }
        emit_uint(ctx, node[].get._UIntInit.value)
        emit(ctx, "\n")
        break
        -> AST_ULongInit_t {
            emit(ctx, "    "                 "    "                 ".quad ")
        }
        emit_ulong(ctx, node[].get._ULongInit.value)
        emit(ctx, "\n")
        break
        -> AST_ZeroInit_t {
            emit(ctx, "    "                 "    "                 ".zero ")
        }
        emit_long(ctx, node[].get._ZeroInit.byte)
        emit(ctx, "\n")
        break
        -> AST_StringInit_t {
            emit(ctx, "    "                 "    "                 ".asci")
        }
        {
            string_init: *struc StringInit = @node[].get._StringInit
            emit(ctx, ? string_init[].is_null_term then "z" else "i")
            emit(ctx, " \"")
            emit_string(ctx, string_init[].string_const)
        }
        emit(ctx, "\""             "\n")
        break
        -> AST_PointerInit_t {
            emit(ctx, "    "                 "    "                 ".quad "                 ".L")
        }
        emit_identifier(ctx, node[].get._PointerInit.name)
        emit(ctx, "\n")
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn emit_static_var_toplvl(ctx: *struc GasCodeContext, node: *struc AsmStaticVariable) none {
    glob_directive_toplvl(ctx, node[].name, node[].is_glob)
    static_section_toplvl(ctx, node[].static_inits)
    align_directive_toplvl(ctx, node[].alignment)
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n")
    loop i: u64 = 0 while i < (? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0) .. ++i {
        static_init_toplvl(ctx, node[].static_inits[i])
    }
}

fn emit_static_const_toplvl(ctx: *struc GasCodeContext, node: *struc AsmStaticConstant) none {
    emit(ctx, "    "         ".section .rodata"         "\n")
    align_directive_toplvl(ctx, node[].alignment)
    emit(ctx, ".L")
    emit_identifier(ctx, node[].name)
    emit(ctx, ":"         "\n")
    static_init_toplvl(ctx, node[].static_init)
}

fn emit_toplvl(ctx: *struc GasCodeContext, node: *struc AsmTopLevel) none {
    emit(ctx, "\n")
    match node[].tag {
        -> AST_AsmFunction_t {
            emit_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> AST_AsmStaticVariable_t {
            emit_static_var_toplvl(ctx, @node[].get._AsmStaticVariable)
        }
        break
        -> AST_AsmStaticConstant_t {
            emit_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
        }
        break
        otherwise {
            panic_sigabrt("abort")
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
    emit(ctx, "    "         "    "         ".section .note.GNU-stack,\"\",@progbits"         "\n")
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
