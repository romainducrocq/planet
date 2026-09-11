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
type struc TacProgram;
type struc FrontEndContext;
pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none;
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
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: **i8) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: *i8) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;
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

type struc CUnaryOp(tag: i32)
pub fn make_CUnaryOp(tag: i32) struc CUnaryOp;

type struc CBinaryOp(tag: i32)
pub fn make_CBinaryOp(tag: i32) struc CBinaryOp;

type struc CAbstractPointer(abstract_decltor: *struc CAbstractDeclarator)

type struc CAbstractArray(size: i64, abstract_decltor: *struc CAbstractDeclarator)

type struc CAbstractBase(_empty: char)

type union _CAbstractDeclarator(_CAbstractPointer: struc CAbstractPointer, _CAbstractArray: struc CAbstractArray, _CAbstractBase: struc CAbstractBase)

type struc CAbstractDeclarator(tag: i32, get: union _CAbstractDeclarator)
pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator;
pub fn make_CAbstractPointer(abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractArray(size: i64, abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator;
pub fn make_CAbstractBase(none) *struc CAbstractDeclarator;
pub fn free_CAbstractDeclarator(self: **struc CAbstractDeclarator) none;

type struc CParam(tag: i32, decltor: *struc CDeclarator, param_type: *struc Type)
pub fn make_CParam(decltor: **struc CDeclarator, param_type: **struc Type) *struc CParam;
pub fn free_CParam(self: **struc CParam) none;

type struc CIdent(name: u64)

type struc CPointerDeclarator(decltor: *struc CDeclarator)

type struc CArrayDeclarator(size: i64, decltor: *struc CDeclarator)

type struc CFunDeclarator(param_list: **struc CParam, decltor: *struc CDeclarator)

type union _CDeclarator(_CIdent: struc CIdent, _CPointerDeclarator: struc CPointerDeclarator, _CArrayDeclarator: struc CArrayDeclarator, _CFunDeclarator: struc CFunDeclarator)

type struc CDeclarator(tag: i32, get: union _CDeclarator)
pub fn make_CDeclarator(none) *struc CDeclarator;
pub fn make_CIdent(name: u64) *struc CDeclarator;
pub fn make_CPointerDeclarator(decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CArrayDeclarator(size: i64, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn make_CFunDeclarator(param_list: ***struc CParam, decltor: **struc CDeclarator) *struc CDeclarator;
pub fn free_CDeclarator(self: **struc CDeclarator) none;

type struc CConstant(constant: *struc CConst, _base: *struc CExp)

type struc CString(literal: *struc CStringLiteral, _base: *struc CExp)

type struc CVar(name: u64, _base: *struc CExp)

type struc CCast(exp: *struc CExp, target_type: *struc Type, _base: *struc CExp)

type struc CUnary(unop: struc CUnaryOp, exp: *struc CExp, _base: *struc CExp)

type struc CBinary(binop: struc CBinaryOp, exp_left: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CAssignment(unop: struc CUnaryOp, exp_left: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CConditional(condition: *struc CExp, exp_middle: *struc CExp, exp_right: *struc CExp, _base: *struc CExp)

type struc CFunctionCall(name: u64, args: **struc CExp, _base: *struc CExp)

type struc CDereference(exp: *struc CExp, _base: *struc CExp)

type struc CAddrOf(exp: *struc CExp, _base: *struc CExp)

type struc CSubscript(primary_exp: *struc CExp, subscript_exp: *struc CExp, _base: *struc CExp)

type struc CSizeOf(exp: *struc CExp, _base: *struc CExp)

type struc CSizeOfT(target_type: *struc Type, _base: *struc CExp)

type struc CDot(member: u64, structure: *struc CExp, _base: *struc CExp)

type struc CArrow(member: u64, pointer: *struc CExp, _base: *struc CExp)

type union _CExp(_CConstant: struc CConstant, _CString: struc CString, _CVar: struc CVar, _CCast: struc CCast, _CUnary: struc CUnary, _CBinary: struc CBinary, _CAssignment: struc CAssignment, _CConditional: struc CConditional, _CFunctionCall: struc CFunctionCall, _CDereference: struc CDereference, _CAddrOf: struc CAddrOf, _CSubscript: struc CSubscript, _CSizeOf: struc CSizeOf, _CSizeOfT: struc CSizeOfT, _CDot: struc CDot, _CArrow: struc CArrow)

type struc CExp(tag: i32, exp_type: *struc Type, info_at: u64, get: union _CExp)
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

type struc CReturn(exp: *struc CExp, info_at: u64)

type struc CExpression(exp: *struc CExp)

type struc CIf(condition: *struc CExp, then_fi: *struc CStatement, else_fi: *struc CStatement)

type struc CGoto(target: u64, info_at: u64)

type struc CLabel(target: u64, jump_to: *struc CStatement, info_at: u64)

type struc CCompound(block: *struc CBlock)

type struc CWhile(target: u64, condition: *struc CExp, body: *struc CStatement)

type struc CDoWhile(target: u64, condition: *struc CExp, body: *struc CStatement)

type struc CFor(target: u64, init: *struc CForInit, condition: *struc CExp, post: *struc CExp, body: *struc CStatement)

type struc CSwitch(target: u64, is_default: i32, lookup: *struc CExp, body: *struc CStatement, cases: **struc CExp)

type struc CCase(target: u64, value: *struc CExp, jump_to: *struc CStatement)

type struc CDefault(target: u64, jump_to: *struc CStatement, info_at: u64)

type struc CBreak(target: u64, info_at: u64)

type struc CContinue(target: u64, info_at: u64)

type struc CNull(_empty: char)

type union _CStatement(_CReturn: struc CReturn, _CExpression: struc CExpression, _CIf: struc CIf, _CGoto: struc CGoto, _CLabel: struc CLabel, _CCompound: struc CCompound, _CWhile: struc CWhile, _CDoWhile: struc CDoWhile, _CFor: struc CFor, _CSwitch: struc CSwitch, _CCase: struc CCase, _CDefault: struc CDefault, _CBreak: struc CBreak, _CContinue: struc CContinue, _CNull: struc CNull)

type struc CStatement(tag: i32, get: union _CStatement)
pub fn make_CStatement(none) *struc CStatement;
pub fn make_CReturn(exp: **struc CExp, info_at: u64) *struc CStatement;
pub fn make_CExpression(exp: **struc CExp) *struc CStatement;
pub fn make_CIf(condition: **struc CExp, then_fi: **struc CStatement, else_fi: **struc CStatement) *struc CStatement;
pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement;
pub fn make_CLabel(target: u64, jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CCompound(block: **struc CBlock) *struc CStatement;
pub fn make_CWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CDoWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CFor(init: **struc CForInit, condition: **struc CExp, post: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CSwitch(lookup: **struc CExp, body: **struc CStatement) *struc CStatement;
pub fn make_CCase(value: **struc CExp, jump_to: **struc CStatement) *struc CStatement;
pub fn make_CDefault(jump_to: **struc CStatement, info_at: u64) *struc CStatement;
pub fn make_CBreak(info_at: u64) *struc CStatement;
pub fn make_CContinue(info_at: u64) *struc CStatement;
pub fn make_CNull(none) *struc CStatement;
pub fn free_CStatement(self: **struc CStatement) none;

type struc CInitDecl(init: *struc CVariableDeclaration)

type struc CInitExp(init: *struc CExp)

type union _CForInit(_CInitDecl: struc CInitDecl, _CInitExp: struc CInitExp)

type struc CForInit(tag: i32, get: union _CForInit)
pub fn make_CForInit(none) *struc CForInit;
pub fn make_CInitDecl(init: **struc CVariableDeclaration) *struc CForInit;
pub fn make_CInitExp(init: **struc CExp) *struc CForInit;
pub fn free_CForInit(self: **struc CForInit) none;

type struc CB(block_items: **struc CBlockItem)

type union _CBlock(_CB: struc CB)

type struc CBlock(tag: i32, get: union _CBlock)
pub fn make_CBlock(none) *struc CBlock;
pub fn make_CB(block_items: ***struc CBlockItem) *struc CBlock;
pub fn free_CBlock(self: **struc CBlock) none;

type struc CS(statement: *struc CStatement)

type struc CD(declaration: *struc CDeclaration)

type union _CBlockItem(_CS: struc CS, _CD: struc CD)

type struc CBlockItem(tag: i32, get: union _CBlockItem)
pub fn make_CBlockItem(none) *struc CBlockItem;
pub fn make_CS(statement: **struc CStatement) *struc CBlockItem;
pub fn make_CD(declaration: **struc CDeclaration) *struc CBlockItem;
pub fn free_CBlockItem(self: **struc CBlockItem) none;

type struc CStorageClass(tag: i32)
pub fn make_CStorageClass(tag: i32) struc CStorageClass;

type struc CSingleInit(exp: *struc CExp, _base: *struc CInitializer)

type struc CCompoundInit(initializers: **struc CInitializer, _base: *struc CInitializer)

type union _CInitializer(_CSingleInit: struc CSingleInit, _CCompoundInit: struc CCompoundInit)

type struc CInitializer(tag: i32, init_type: *struc Type, get: union _CInitializer)
pub fn make_CInitializer(none) *struc CInitializer;
pub fn make_CSingleInit(exp: **struc CExp) *struc CInitializer;
pub fn make_CCompoundInit(initializers: ***struc CInitializer) *struc CInitializer;
pub fn free_CInitializer(self: **struc CInitializer) none;

type struc CMemberDeclaration(tag: i32, member_name: u64, member_type: *struc Type, info_at: u64)
pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration;
pub fn free_CMemberDeclaration(self: **struc CMemberDeclaration) none;

type struc CStructDeclaration(tag: i32, tag_name: u64, is_union: i32, members: **struc CMemberDeclaration, info_at: u64)
pub fn make_CStructDeclaration(tag_name: u64, is_union: i32, members: ***struc CMemberDeclaration, info_at: u64) *struc CStructDeclaration;
pub fn free_CStructDeclaration(self: **struc CStructDeclaration) none;

type struc CFunctionDeclaration(tag: i32, name: u64, params: *u64, body: *struc CBlock, fun_type: *struc Type, storage_class: struc CStorageClass, info_at: u64)
pub fn make_CFunctionDeclaration(name: u64, params: **u64, body: **struc CBlock, fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration;
pub fn free_CFunctionDeclaration(self: **struc CFunctionDeclaration) none;

type struc CVariableDeclaration(tag: i32, name: u64, init: *struc CInitializer, var_type: *struc Type, storage_class: struc CStorageClass, info_at: u64)
pub fn make_CVariableDeclaration(name: u64, init: **struc CInitializer, var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration;
pub fn free_CVariableDeclaration(self: **struc CVariableDeclaration) none;

type struc CFunDecl(fun_decl: *struc CFunctionDeclaration)

type struc CVarDecl(var_decl: *struc CVariableDeclaration)

type struc CStructDecl(struct_decl: *struc CStructDeclaration)

type union _CDeclaration(_CFunDecl: struc CFunDecl, _CVarDecl: struc CVarDecl, _CStructDecl: struc CStructDecl)

type struc CDeclaration(tag: i32, get: union _CDeclaration)
pub fn make_CDeclaration(none) *struc CDeclaration;
pub fn make_CFunDecl(fun_decl: **struc CFunctionDeclaration) *struc CDeclaration;
pub fn make_CVarDecl(var_decl: **struc CVariableDeclaration) *struc CDeclaration;
pub fn make_CStructDecl(struct_decl: **struc CStructDeclaration) *struc CDeclaration;
pub fn free_CDeclaration(self: **struc CDeclaration) none;

type struc CProgram(tag: i32, declarations: **struc CDeclaration)
pub fn make_CProgram(declarations: ***struc CDeclaration) *struc CProgram;
pub fn free_CProgram(self: **struc CProgram) none;
type struc TacUnaryOp;
type struc TacBinaryOp;
type struc TacValue;
type struc TacExpResult;
type struc TacInstruction;
type struc TacTopLevel;
type struc TacProgram;

type struc TacUnaryOp(tag: i32)
pub fn make_TacUnaryOp(tag: i32) struc TacUnaryOp;

type struc TacBinaryOp(tag: i32)
pub fn make_TacBinaryOp(tag: i32) struc TacBinaryOp;

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
type struc ControlFlowGraph;
type struc DataFlowAnalysis;
type struc DataFlowAnalysisO1;

type struc OptimTacContext(frontend: *struc FrontEndContext, is_fixed_point: i32, enabled_optims: [5]i32, cfg: *struc ControlFlowGraph, dfa: *struc DataFlowAnalysis, dfa_o1: *struc DataFlowAnalysisO1, p_instrs: ***struc TacInstruction)

m4_define(`mask_t', `TODO')m4_dnl
m4_define(`AstInstruction', `TODO')m4_dnl
m4_define(`AstInstruction', `TODO')m4_dnl
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`Ctx', `TODO')m4_dnl

type struc ControlFlowBlock(size: u64, instrs_front_idx: u64, instrs_back_idx: u64, pred_ids: *u64, succ_ids: *u64)

type struc ControlFlowGraph(entry_id: u64, exit_id: u64, entry_succ_ids: *u64, exit_pred_ids: *u64, reaching_code: *i32, blocks: *struc ControlFlowBlock, identifier_id_map: *struc PairTIdentifierulong_t)

type struc DataFlowAnalysis(set_size: u64, mask_size: u64, incoming_idx: u64, static_idx: u64, open_data_map: *u64, instr_idx_map: *u64, blocks_mask_sets: *u64, instrs_mask_sets: *u64)

type struc DataFlowAnalysisO1(data_idx_map: *u64, bak_instrs: **struc TacInstruction, addressed_idx: u64)

fn free_ControlFlowGraph(self: **struc ControlFlowGraph) none {
    if not self[] {
        return none
    }
    ;
    if (self[])[].entry_succ_ids {
        loop .. while 0 {
            cast<none>((? ((self[])[].entry_succ_ids) then free((cast<*struc stbds_array_header>(((self[])[].entry_succ_ids)) - 1)) else cast<none>(0)))
            ((self[])[].entry_succ_ids) = nil
        }        
        (self[])[].entry_succ_ids = nil
    }
    ;
    if (self[])[].exit_pred_ids {
        loop .. while 0 {
            cast<none>((? ((self[])[].exit_pred_ids) then free((cast<*struc stbds_array_header>(((self[])[].exit_pred_ids)) - 1)) else cast<none>(0)))
            ((self[])[].exit_pred_ids) = nil
        }        
        (self[])[].exit_pred_ids = nil
    }
    ;
    if (self[])[].reaching_code {
        loop .. while 0 {
            cast<none>((? ((self[])[].reaching_code) then free((cast<*struc stbds_array_header>(((self[])[].reaching_code)) - 1)) else cast<none>(0)))
            ((self[])[].reaching_code) = nil
        }        
        (self[])[].reaching_code = nil
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].blocks) then (cast<*struc stbds_array_header>(((self[])[].blocks)) - 1)[].length else 0) .. ++i {
        if (self[])[].blocks[i].pred_ids {
            loop .. while 0 {
                cast<none>((? ((self[])[].blocks[i].pred_ids) then free((cast<*struc stbds_array_header>(((self[])[].blocks[i].pred_ids)) - 1)) else cast<none>(0)))
                ((self[])[].blocks[i].pred_ids) = nil
            }            
            (self[])[].blocks[i].pred_ids = nil
        }
        ;
        if (self[])[].blocks[i].succ_ids {
            loop .. while 0 {
                cast<none>((? ((self[])[].blocks[i].succ_ids) then free((cast<*struc stbds_array_header>(((self[])[].blocks[i].succ_ids)) - 1)) else cast<none>(0)))
                ((self[])[].blocks[i].succ_ids) = nil
            }            
            (self[])[].blocks[i].succ_ids = nil
        }
        ;
    }
    if (self[])[].blocks {
        loop .. while 0 {
            cast<none>((? ((self[])[].blocks) then free((cast<*struc stbds_array_header>(((self[])[].blocks)) - 1)) else cast<none>(0)))
            ((self[])[].blocks) = nil
        }        
        (self[])[].blocks = nil
    }
    ;
    if (self[])[].identifier_id_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].identifier_id_map) ~= nil then stbds_hmfree_func(((self[])[].identifier_id_map) - 1, sizeof(((self[])[].identifier_id_map)[])) else cast<none>(0)))
            ((self[])[].identifier_id_map) = nil
        }        
        (self[])[].identifier_id_map = nil
    }
    ;
    if self[] {
        free(self[])
        self[] = nil
    }
    ;
}

fn make_ControlFlowGraph(none) *struc ControlFlowGraph {
    self: *struc ControlFlowGraph = nil
    loop .. while 0 {
        free_ControlFlowGraph(@self)
        self = cast<*struc ControlFlowGraph>(malloc(sizeof<struc ControlFlowGraph>))
        if not self {
            panic_sigabrt("alloc "                 "ControlFlowGraph")
        }
    }    
    self[].entry_id = 0
    self[].exit_id = 0
    self[].entry_succ_ids = nil
    self[].exit_pred_ids = nil
    self[].reaching_code = nil
    self[].blocks = nil
    self[].identifier_id_map = nil
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
            ((self[])[].open_data_map) = nil
        }        
        (self[])[].open_data_map = nil
    }
    ;
    if (self[])[].instr_idx_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].instr_idx_map) then free((cast<*struc stbds_array_header>(((self[])[].instr_idx_map)) - 1)) else cast<none>(0)))
            ((self[])[].instr_idx_map) = nil
        }        
        (self[])[].instr_idx_map = nil
    }
    ;
    if (self[])[].blocks_mask_sets {
        loop .. while 0 {
            cast<none>((? ((self[])[].blocks_mask_sets) then free((cast<*struc stbds_array_header>(((self[])[].blocks_mask_sets)) - 1)) else cast<none>(0)))
            ((self[])[].blocks_mask_sets) = nil
        }        
        (self[])[].blocks_mask_sets = nil
    }
    ;
    if (self[])[].instrs_mask_sets {
        loop .. while 0 {
            cast<none>((? ((self[])[].instrs_mask_sets) then free((cast<*struc stbds_array_header>(((self[])[].instrs_mask_sets)) - 1)) else cast<none>(0)))
            ((self[])[].instrs_mask_sets) = nil
        }        
        (self[])[].instrs_mask_sets = nil
    }
    ;
    if self[] {
        free(self[])
        self[] = nil
    }
    ;
}

fn make_DataFlowAnalysis(none) *struc DataFlowAnalysis {
    self: *struc DataFlowAnalysis = nil
    loop .. while 0 {
        free_DataFlowAnalysis(@self)
        self = cast<*struc DataFlowAnalysis>(malloc(sizeof<struc DataFlowAnalysis>))
        if not self {
            panic_sigabrt("alloc "                 "DataFlowAnalysis")
        }
    }    
    self[].set_size = 0
    self[].mask_size = 0
    self[].incoming_idx = 0
    self[].static_idx = 0
    self[].open_data_map = nil
    self[].instr_idx_map = nil
    self[].blocks_mask_sets = nil
    self[].instrs_mask_sets = nil
    return self
}

fn free_DataFlowAnalysisO1(self: **struc DataFlowAnalysisO1) none {
    if not self[] {
        return none
    }
    ;
    if (self[])[].data_idx_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].data_idx_map) then free((cast<*struc stbds_array_header>(((self[])[].data_idx_map)) - 1)) else cast<none>(0)))
            ((self[])[].data_idx_map) = nil
        }        
        (self[])[].data_idx_map = nil
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].bak_instrs) then (cast<*struc stbds_array_header>(((self[])[].bak_instrs)) - 1)[].length else 0) .. ++i {
        free_TacInstruction(@(self[])[].bak_instrs[i])
    }
    if (self[])[].bak_instrs {
        loop .. while 0 {
            cast<none>((? ((self[])[].bak_instrs) then free((cast<*struc stbds_array_header>(((self[])[].bak_instrs)) - 1)) else cast<none>(0)))
            ((self[])[].bak_instrs) = nil
        }        
        (self[])[].bak_instrs = nil
    }
    ;
    if self[] {
        free(self[])
        self[] = nil
    }
    ;
}

fn make_DataFlowAnalysisO1(none) *struc DataFlowAnalysisO1 {
    self: *struc DataFlowAnalysisO1 = nil
    loop .. while 0 {
        free_DataFlowAnalysisO1(@self)
        self = cast<*struc DataFlowAnalysisO1>(malloc(sizeof<struc DataFlowAnalysisO1>))
        if not self {
            panic_sigabrt("alloc "                 "DataFlowAnalysisO1")
        }
    }    
    self[].addressed_idx = 0
    self[].data_idx_map = nil
    self[].bak_instrs = nil
    return self
}

fn set_instr(ctx: *struc OptimTacContext, instr: *struc TacInstruction, instr_idx: u64) none {
    if instr {
        if instr ~= (ctx[].p_instrs[])[instr_idx] {
            free_TacInstruction(@(ctx[].p_instrs[])[instr_idx])
            (ctx[].p_instrs[])[instr_idx] = instr
            instr = nil
        }
        ;
    }
    else {
        free_TacInstruction(@(ctx[].p_instrs[])[instr_idx])
    }
    ctx[].is_fixed_point = false
}

fn find_size_t(xs: *u64, x: u64) i32 {
    loop i: u64 = 0 while i < (? (xs) then (cast<*struc stbds_array_header>((xs)) - 1)[].length else 0) .. ++i {
        if xs[i] == x {
            return true
        }
    }
    return false
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

fn cfg_add_succ_edge(ctx: *struc OptimTacContext, block_id: u64, succ_id: u64) none {
    if succ_id < ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].blocks[succ_id].pred_ids, succ_id, block_id)
    }
    elif succ_id == ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].exit_pred_ids, succ_id, block_id)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_add_pred_edge(ctx: *struc OptimTacContext, block_id: u64, pred_id: u64) none {
    if pred_id < ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[pred_id].succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id)
    }
    elif pred_id == ctx[].cfg[].entry_id {
        cfg_add_edge(@ctx[].cfg[].entry_succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id)
    }
    else {
        panic_sigabrt("abort")
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

fn cfg_rm_succ_edge(ctx: *struc OptimTacContext, block_id: u64, succ_id: u64, is_reachable: i32) none {
    if succ_id < ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].blocks[succ_id].pred_ids, succ_id, block_id, is_reachable)
    }
    elif succ_id == ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].exit_pred_ids, succ_id, block_id, is_reachable)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_rm_pred_edge(ctx: *struc OptimTacContext, block_id: u64, pred_id: u64) none {
    if pred_id < ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[pred_id].succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id, true)
    }
    elif pred_id == ctx[].cfg[].entry_id {
        cfg_rm_edge(@ctx[].cfg[].entry_succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id, true)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_rm_empty_block(ctx: *struc OptimTacContext, block_id: u64, is_reachable: i32) none {
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

fn cfg_rm_block_instr(ctx: *struc OptimTacContext, instr_idx: u64, block_id: u64) none {
    if (ctx[].p_instrs[])[instr_idx] {
        set_instr(ctx, nil, instr_idx)
        ctx[].cfg[].blocks[block_id].size--
        if ctx[].cfg[].blocks[block_id].size == 0 {
            cfg_rm_empty_block(ctx, block_id, true)
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

fn cfg_init_label_block(ctx: *struc OptimTacContext, node: *struc TacLabel) none {
    loop .. while 0 {
        (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
        (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (node[].name)
        (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1)
    }    
}

fn cfg_init_block(ctx: *struc OptimTacContext, instr_idx: u64, instrs_back_idx: *u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacLabel_t {
            if instrs_back_idx[] ~= (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instrs_back_idx[]
                block: struc ControlFlowBlock = $(0, instr_idx, 0, nil, nil)
                loop .. while 0 {
                    (? (not (ctx[].cfg[].blocks) or (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].capacity) then (((ctx[].cfg[].blocks) = stbds_arrgrowf((ctx[].cfg[].blocks), sizeof((ctx[].cfg[].blocks)[]), (1), (0))) and 0) else 0)
                    (ctx[].cfg[].blocks)[(cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length++] = (block)
                }                
            }
            cfg_init_label_block(ctx, @node[].get._TacLabel)
            instrs_back_idx[] = instr_idx
            break
        }
        -> AST_TacReturn_t {
            -> AST_TacJump_t {
                -> AST_TacJumpIfZero_t {
                    -> AST_TacJumpIfNotZero_t {
                        (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instr_idx
                        instrs_back_idx[] = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
                        break
                    }
                }
            }
        }
        otherwise {
            instrs_back_idx[] = instr_idx
            break
        }
    }
}

fn cfg_init_jump_edges(ctx: *struc OptimTacContext, node: *struc TacJump, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
}

fn cfg_init_jmp_eq_0_edges(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}

fn cfg_init_jmp_ne_0_edges(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}

fn cfg_init_edges(ctx: *struc OptimTacContext, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            cfg_add_succ_edge(ctx, block_id, ctx[].cfg[].exit_id)
        }
        break
        -> AST_TacJump_t {
            cfg_init_jump_edges(ctx, @node[].get._TacJump, block_id)
        }
        break
        -> AST_TacJumpIfZero_t {
            cfg_init_jmp_eq_0_edges(ctx, @node[].get._TacJumpIfZero, block_id)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            cfg_init_jmp_ne_0_edges(ctx, @node[].get._TacJumpIfNotZero, block_id)
        }
        break
        otherwise {
            cfg_add_succ_edge(ctx, block_id, block_id + 1)
        }
        break
    }
}

fn init_control_flow_graph(ctx: *struc OptimTacContext) none {
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].pred_ids {
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].blocks[block_id].pred_ids) then free((cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)) else cast<none>(0)))
                (ctx[].cfg[].blocks[block_id].pred_ids) = nil
            }            
            ctx[].cfg[].blocks[block_id].pred_ids = nil
        }
        ;
        if ctx[].cfg[].blocks[block_id].succ_ids {
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].blocks[block_id].succ_ids) then free((cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)) else cast<none>(0)))
                (ctx[].cfg[].blocks[block_id].succ_ids) = nil
            }            
            ctx[].cfg[].blocks[block_id].succ_ids = nil
        }
        ;
    }
    if ctx[].cfg[].blocks {
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length = 0
    }
    ;
    if ctx[].cfg[].identifier_id_map {
        loop .. while 0 {
            cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
            (ctx[].cfg[].identifier_id_map) = nil
        }        
        ctx[].cfg[].identifier_id_map = nil
    }
    ;
    {
        instrs_back_idx: u64 = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
        loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] {
                if instrs_back_idx == (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                    block: struc ControlFlowBlock = $(0, instr_idx, 0, nil, nil)
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

m4_define(`MASK_FALSE', `TODO')m4_dnl
m4_define(`MASK_TRUE', `TODO')m4_dnl

fn is_transfer_instr(ctx: *struc OptimTacContext, instr_idx: u64, is_store_elim: i32) i32 {
    match (ctx[].p_instrs[])[instr_idx][].tag {
        -> AST_TacSignExtend_t {
            -> AST_TacTruncate_t {
                -> AST_TacZeroExtend_t {
                    -> AST_TacDoubleToInt_t {
                        -> AST_TacDoubleToUInt_t {
                            -> AST_TacIntToDouble_t {
                                -> AST_TacUIntToDouble_t {
                                    -> AST_TacFunCall_t {
                                        -> AST_TacUnary_t {
                                            -> AST_TacBinary_t {
                                                -> AST_TacCopy_t {
                                                    -> AST_TacGetAddress_t {
                                                        -> AST_TacLoad_t {
                                                            -> AST_TacStore_t {
                                                                -> AST_TacAddPtr_t {
                                                                    -> AST_TacCopyToOffset_t {
                                                                        -> AST_TacCopyFromOffset_t {
                                                                            return true
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
        -> AST_TacReturn_t {
            -> AST_TacJumpIfZero_t {
                -> AST_TacJumpIfNotZero_t {
                    return is_store_elim
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn get_dfa_data_idx(ctx: *struc OptimTacContext, instr_idx: u64) u64 {
    loop i: u64 = 0 while i < ctx[].dfa[].set_size .. ++i {
        if ctx[].dfa_o1[].data_idx_map[i] == instr_idx {
            return i
        }
    }
    panic_sigabrt("abort")
}

fn get_dfa_bak_instr(ctx: *struc OptimTacContext, i: u64) *struc TacInstruction {
    if ctx[].cfg[].reaching_code[i] {
        if ctx[].dfa_o1[].bak_instrs[i] {
            return ctx[].dfa_o1[].bak_instrs[i]
        }
        else {
            panic_sigabrt("abort")
        }
    }
    elif (ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]] {
        return (ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]]
    }
    else {
        panic_sigabrt("abort")
    }
}

fn set_dfa_bak_instr(ctx: *struc OptimTacContext, instr_idx: u64, i: *u64) i32 {
    i[] = get_dfa_data_idx(ctx, instr_idx)
    if not ctx[].cfg[].reaching_code[i[]] {
        ctx[].cfg[].reaching_code[i[]] = true
        return true
    }
    else {
        return false
    }
}

fn prop_transfer_reach_copies(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) i32;
fn elim_transfer_live_values(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) none;

fn dfa_forward_transfer_block(ctx: *struc OptimTacContext, instr_idx: u64, block_id: u64) u64 {
    loop next_instr_idx: u64 = instr_idx + 1 while next_instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++next_instr_idx {
        if (ctx[].p_instrs[])[next_instr_idx] and is_transfer_instr(ctx, next_instr_idx, false) {
            loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
            }
            if not prop_transfer_reach_copies(ctx, instr_idx, next_instr_idx) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
            }
            instr_idx = next_instr_idx
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
    if not prop_transfer_reach_copies(ctx, instr_idx, ctx[].dfa[].incoming_idx) {
        loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
        }
    }
    return instr_idx
}

fn dfa_backward_transfer_block(ctx: *struc OptimTacContext, instr_idx: u64, block_id: u64) u64 {
    if instr_idx > 0 {
        loop next_instr_idx: u64 = instr_idx while next_instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
            if (ctx[].p_instrs[])[next_instr_idx] and is_transfer_instr(ctx, next_instr_idx, true) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
                elim_transfer_live_values(ctx, instr_idx, next_instr_idx)
                instr_idx = next_instr_idx
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
    elim_transfer_live_values(ctx, instr_idx, ctx[].dfa[].incoming_idx)
    return instr_idx
}

fn dfa_after_meet_block(ctx: *struc OptimTacContext, block_id: u64) i32 {
    is_fixed_point: i32 = true
    {
        i: u64 = 0
        loop  while i < ctx[].dfa[].mask_size .. ++i {
            if ctx[].dfa[].blocks_mask_sets[(block_id) * ctx[].dfa[].mask_size + (i)] ~= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] {
                is_fixed_point = false
                break
            }
        }
        loop  while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].blocks_mask_sets[(block_id) * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)]
        }
    }
    return is_fixed_point
}

fn dfa_forward_meet_block(ctx: *struc OptimTacContext, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx
    loop  while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] and is_transfer_instr(ctx, instr_idx, false) {
            jump Lelse
        }
    }
    instr_idx = ctx[].dfa[].incoming_idx
    label Lelse
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)] = 18446744073709551615ul
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++i {
        pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[i]
        if pred_id < ctx[].cfg[].exit_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] &= ctx[].dfa[].blocks_mask_sets[(pred_id) * ctx[].dfa[].mask_size + (j)]
            }
        }
        elif pred_id == ctx[].cfg[].entry_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] = 0ul
            }
            break
        }
        else {
            panic_sigabrt("abort")
        }
    }
    if instr_idx < ctx[].dfa[].incoming_idx {
        dfa_forward_transfer_block(ctx, instr_idx, block_id)
    }
    else {
        ;
    }
    return dfa_after_meet_block(ctx, block_id)
}

fn dfa_backward_meet_block(ctx: *struc OptimTacContext, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1
    loop while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
        if (ctx[].p_instrs[])[instr_idx] and is_transfer_instr(ctx, instr_idx, true) {
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
            panic_sigabrt("abort")
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

fn dfa_forward_iter_alg(ctx: *struc OptimTacContext) none {
    open_data_map_size: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    loop i: u64 = 0 while i < open_data_map_size .. ++i {
        block_id: u64 = ctx[].dfa[].open_data_map[i]
        if block_id == ctx[].cfg[].exit_id {
            continue
        }
        is_fixed_point: i32 = dfa_forward_meet_block(ctx, block_id)
        if not is_fixed_point {
            loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
                succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[j]
                if succ_id < ctx[].cfg[].exit_id {
                    loop k: u64 = i + 1 while k < open_data_map_size .. ++k {
                        if succ_id == ctx[].dfa[].open_data_map[k] {
                            jump Lelse
                        }
                    }
                    if open_data_map_size < (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) {
                        ctx[].dfa[].open_data_map[open_data_map_size] = succ_id
                    }
                    else {
                        loop .. while 0 {
                            (? (not (ctx[].dfa[].open_data_map) or (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity) then (((ctx[].dfa[].open_data_map) = stbds_arrgrowf((ctx[].dfa[].open_data_map), sizeof((ctx[].dfa[].open_data_map)[]), (1), (0))) and 0) else 0)
                            (ctx[].dfa[].open_data_map)[(cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length++] = (succ_id)
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

fn dfa_iter_alg(ctx: *struc OptimTacContext) none {
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

fn dfa_forward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none;
fn dfa_backward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none;

fn dfa_forward_succ_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
        dfa_forward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}

fn dfa_backward_succ_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
        dfa_backward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}

fn dfa_forward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_forward_succ_open_block(ctx, block_id, i)
        (i[])--
        ctx[].dfa[].open_data_map[i[]] = block_id
    }
}

fn dfa_backward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_backward_succ_open_block(ctx, block_id, i)
        ctx[].dfa[].open_data_map[i[]] = block_id
        (i[])++
    }
}

fn is_aliased_name(ctx: *struc OptimTacContext, name: u64) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t or (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1
}

fn dfa_add_aliased_value(ctx: *struc OptimTacContext, node: *struc TacValue) none {
    if node[].tag == AST_TacVariable_t {
        loop .. while 0 {
            (ctx[].frontend[].addressed_set) = stbds_hmput_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((node[].get._TacVariable.name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)
            (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].key = (node[].get._TacVariable.name)
            (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].value = (0)
        }        
    }
}

fn is_same_value(node_1: *struc TacValue, node_2: *struc TacValue) i32;

fn prop_add_data_idx(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64, block_id: u64) i32 {
    ;
    if is_same_value(node[].src, node[].dst) {
        cfg_rm_block_instr(ctx, instr_idx, block_id)
        return false
    }
    else {
        if ctx[].dfa[].set_size < (? (ctx[].dfa_o1[].data_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].length else 0) {
            ctx[].dfa_o1[].data_idx_map[ctx[].dfa[].set_size] = instr_idx
        }
        else {
            loop .. while 0 {
                (? (not (ctx[].dfa_o1[].data_idx_map) or (cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].capacity) then (((ctx[].dfa_o1[].data_idx_map) = stbds_arrgrowf((ctx[].dfa_o1[].data_idx_map), sizeof((ctx[].dfa_o1[].data_idx_map)[]), (1), (0))) and 0) else 0)
                (ctx[].dfa_o1[].data_idx_map)[(cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].length++] = (instr_idx)
            }            
        }
        ctx[].dfa[].set_size++
        return true
    }
}

fn elim_add_data_name(ctx: *struc OptimTacContext, name: u64) none {
    if (? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (name)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = (ctx[].dfa[].set_size)
        }        
        ctx[].dfa[].set_size++
    }
}

fn elim_add_data_value(ctx: *struc OptimTacContext, node: *struc TacValue) none {
    if node[].tag == AST_TacVariable_t {
        elim_add_data_name(ctx, node[].get._TacVariable.name)
    }
}

fn init_data_flow_analysis(ctx: *struc OptimTacContext, is_store_elim: i32, is_addressed_set: i32) i32 {
    ctx[].dfa[].set_size = 0
    ctx[].dfa[].incoming_idx = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
    if (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            (? (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].dfa[].open_data_map)) = stbds_arrgrowf(((ctx[].dfa[].open_data_map)), sizeof(((ctx[].dfa[].open_data_map))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
            ? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
        }        
    }
    {
        i: u64;
        i = ? is_store_elim then 3 else 1
        if (? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].length else 0) < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i {
            loop .. while 0 {
                (? (? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)) then ((((ctx[].dfa[].instr_idx_map)) = stbds_arrgrowf(((ctx[].dfa[].instr_idx_map)), sizeof(((ctx[].dfa[].instr_idx_map))[]), (0), (cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)))))) and 0 else 0)
                ? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].length = cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)) else 0
            }            
        }
    }
    if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
            ? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
        }        
    }
    memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))
    instrs_mask_sets_size: u64 = 0
    is_copy_prop: i32 = not is_store_elim
    if is_store_elim {
        if ctx[].cfg[].identifier_id_map {
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
                (ctx[].cfg[].identifier_id_map) = nil
            }            
            ctx[].cfg[].identifier_id_map = nil
        }
        ;
        ctx[].dfa[].static_idx = ctx[].dfa[].incoming_idx + 1
        ctx[].dfa_o1[].addressed_idx = ctx[].dfa[].static_idx + 1
    }
    if is_addressed_set {
        if ctx[].frontend[].addressed_set {
            loop .. while 0 {
                cast<none>((? (ctx[].frontend[].addressed_set) ~= nil then stbds_hmfree_func((ctx[].frontend[].addressed_set) - 1, sizeof((ctx[].frontend[].addressed_set)[])) else cast<none>(0)))
                (ctx[].frontend[].addressed_set) = nil
            }            
            ctx[].frontend[].addressed_set = nil
        }
        ;
    }
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
                    match node[].tag {
                        -> AST_TacReturn_t {
                            if is_copy_prop {
                                jump Lcontinue
                            }
                            p_node: *struc TacReturn = @node[].get._TacReturn
                            if p_node[].val {
                                elim_add_data_value(ctx, p_node[].val)
                            }
                            break
                        }
                        -> AST_TacSignExtend_t {
                            if is_store_elim {
                                p_node: *struc TacSignExtend = @node[].get._TacSignExtend
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacTruncate_t {
                            if is_store_elim {
                                p_node: *struc TacTruncate = @node[].get._TacTruncate
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacZeroExtend_t {
                            if is_store_elim {
                                p_node: *struc TacZeroExtend = @node[].get._TacZeroExtend
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacDoubleToInt_t {
                            if is_store_elim {
                                p_node: *struc TacDoubleToInt = @node[].get._TacDoubleToInt
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacDoubleToUInt_t {
                            if is_store_elim {
                                p_node: *struc TacDoubleToUInt = @node[].get._TacDoubleToUInt
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacIntToDouble_t {
                            if is_store_elim {
                                p_node: *struc TacIntToDouble = @node[].get._TacIntToDouble
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacUIntToDouble_t {
                            if is_store_elim {
                                p_node: *struc TacUIntToDouble = @node[].get._TacUIntToDouble
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacFunCall_t {
                            if is_store_elim {
                                p_node: *struc TacFunCall = @node[].get._TacFunCall
                                loop i: u64 = 0 while i < (? (p_node[].args) then (cast<*struc stbds_array_header>((p_node[].args)) - 1)[].length else 0) .. ++i {
                                    elim_add_data_value(ctx, p_node[].args[i])
                                }
                                if p_node[].dst {
                                    elim_add_data_value(ctx, p_node[].dst)
                                }
                            }
                            break
                        }
                        -> AST_TacUnary_t {
                            if is_store_elim {
                                p_node: *struc TacUnary = @node[].get._TacUnary
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacBinary_t {
                            if is_store_elim {
                                p_node: *struc TacBinary = @node[].get._TacBinary
                                elim_add_data_value(ctx, p_node[].src1)
                                elim_add_data_value(ctx, p_node[].src2)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacCopy_t {
                            p_node: *struc TacCopy = @node[].get._TacCopy
                            if is_copy_prop {
                                if not prop_add_data_idx(ctx, p_node, instr_idx, block_id) {
                                    jump Lcontinue
                                }
                            }
                            else {
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacGetAddress_t {
                            p_node: *struc TacGetAddress = @node[].get._TacGetAddress
                            if is_store_elim {
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            if is_addressed_set {
                                dfa_add_aliased_value(ctx, p_node[].src)
                            }
                            break
                        }
                        -> AST_TacLoad_t {
                            if is_store_elim {
                                p_node: *struc TacLoad = @node[].get._TacLoad
                                elim_add_data_value(ctx, p_node[].src_ptr)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacStore_t {
                            if is_store_elim {
                                p_node: *struc TacStore = @node[].get._TacStore
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst_ptr)
                            }
                            break
                        }
                        -> AST_TacAddPtr_t {
                            if is_store_elim {
                                p_node: *struc TacAddPtr = @node[].get._TacAddPtr
                                elim_add_data_value(ctx, p_node[].src_ptr)
                                elim_add_data_value(ctx, p_node[].idx)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacCopyToOffset_t {
                            if is_store_elim {
                                p_node: *struc TacCopyToOffset = @node[].get._TacCopyToOffset
                                elim_add_data_name(ctx, p_node[].dst_name)
                                elim_add_data_value(ctx, p_node[].src)
                            }
                            break
                        }
                        -> AST_TacCopyFromOffset_t {
                            if is_store_elim {
                                p_node: *struc TacCopyFromOffset = @node[].get._TacCopyFromOffset
                                elim_add_data_name(ctx, p_node[].src_name)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacJumpIfZero_t {
                            if is_copy_prop {
                                jump Lcontinue
                            }
                            elim_add_data_value(ctx, node[].get._TacJumpIfZero.condition)
                            break
                        }
                        -> AST_TacJumpIfNotZero_t {
                            if is_copy_prop {
                                jump Lcontinue
                            }
                            elim_add_data_value(ctx, node[].get._TacJumpIfNotZero.condition)
                            break
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
            ctx[].cfg[].reaching_code[block_id] = true
        }
    }
    if ctx[].dfa[].set_size == 0 {
        return false
    }
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
    if is_store_elim {
        ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] = instrs_mask_sets_size
        instrs_mask_sets_size++
        ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] = instrs_mask_sets_size
        instrs_mask_sets_size++
    }
    ctx[].dfa[].mask_size = (ctx[].dfa[].set_size + 63) / 64
    instrs_mask_sets_size *= ctx[].dfa[].mask_size
    blocks_mask_sets_size: u64 = ctx[].dfa[].mask_size * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    if (? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].length else 0) < blocks_mask_sets_size {
        loop .. while 0 {
            (? (? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].capacity else 0) < cast<u64>((blocks_mask_sets_size)) then ((((ctx[].dfa[].blocks_mask_sets)) = stbds_arrgrowf(((ctx[].dfa[].blocks_mask_sets)), sizeof(((ctx[].dfa[].blocks_mask_sets))[]), (0), (cast<u64>((blocks_mask_sets_size)))))) and 0 else 0)
            ? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].length = cast<u64>((blocks_mask_sets_size)) else 0
        }        
    }
    if (? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].length else 0) < instrs_mask_sets_size {
        loop .. while 0 {
            (? (? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].capacity else 0) < cast<u64>((instrs_mask_sets_size)) then ((((ctx[].dfa[].instrs_mask_sets)) = stbds_arrgrowf(((ctx[].dfa[].instrs_mask_sets)), sizeof(((ctx[].dfa[].instrs_mask_sets))[]), (0), (cast<u64>((instrs_mask_sets_size)))))) and 0 else 0)
            ? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].length = cast<u64>((instrs_mask_sets_size)) else 0
        }        
    }
    if is_copy_prop {
        i: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
        loop j: u64 = 0 while j < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++j {
            succ_id: u64 = ctx[].cfg[].entry_succ_ids[j]
            if not ctx[].cfg[].reaching_code[succ_id] {
                dfa_forward_open_block(ctx, succ_id, @i)
            }
        }
        loop while i-- > 0 {
            ctx[].dfa[].open_data_map[i] = ctx[].cfg[].exit_id
        }
        mask_true_back: u64 = 18446744073709551615ul
        i = ctx[].dfa[].set_size - (ctx[].dfa[].mask_size - 1) * 64
        if i > 0 {
            loop  while i < 64 .. ++i {
                mask_set(@mask_true_back, i, false)
            }
        }
        if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < ctx[].dfa[].set_size {
            loop .. while 0 {
                (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>((ctx[].dfa[].set_size)) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>((ctx[].dfa[].set_size)))))) and 0 else 0)
                ? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>((ctx[].dfa[].set_size)) else 0
            }            
        }
        loop j: u64 = (? (ctx[].dfa_o1[].bak_instrs) then (cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].length else 0) while j <= ctx[].dfa[].set_size .. ++j {
            loop .. while 0 {
                (? (not (ctx[].dfa_o1[].bak_instrs) or (cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].capacity) then (((ctx[].dfa_o1[].bak_instrs) = stbds_arrgrowf((ctx[].dfa_o1[].bak_instrs), sizeof((ctx[].dfa_o1[].bak_instrs)[]), (1), (0))) and 0) else 0)
                (ctx[].dfa_o1[].bak_instrs)[(cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].length++] = (nil)
            }            
        }
        memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * ctx[].dfa[].set_size)
        if ctx[].dfa[].mask_size > 1 {
            i = 0
            loop .. while i < blocks_mask_sets_size {
                loop j: u64 = ctx[].dfa[].mask_size - 1 while j-- > 0 {
                    ctx[].dfa[].blocks_mask_sets[i] = 18446744073709551615ul
                    i++
                }
                ctx[].dfa[].blocks_mask_sets[i] = mask_true_back
                i++
            }            
        }
        else {
            loop j: u64 = 0 while j < blocks_mask_sets_size .. ++j {
                ctx[].dfa[].blocks_mask_sets[j] = mask_true_back
            }
        }
    }
    else {
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
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (0)] = 0ul
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (0)] = 0ul
        loop i = 1 while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
        }
        loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
            name_id: *struc PairTIdentifierulong_t = @ctx[].cfg[].identifier_id_map[i]
            if ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@(((name_id[]).key))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (? (name_id[]).value > 63 then (name_id[]).value / 64 else 0)], (name_id[]).value, true)
            }
            if (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@(((name_id[]).key))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1 {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (? (name_id[]).value > 63 then (name_id[]).value / 64 else 0)], (name_id[]).value, true)
            }
        }
        memset(ctx[].dfa[].blocks_mask_sets, 0ul, sizeof<u64> * blocks_mask_sets_size)
    }
    return true
}

fn fold_sign_extend_char_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_sign_extend_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_sign_extend_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_sign_extend_char_const(ctx, node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_sign_extend_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_sign_extend_instr(ctx: *struc OptimTacContext, node: *struc TacSignExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_sign_extend_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_truncate_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_long_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstLong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_ulong_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstULong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstInt_t {
            fold_constant = fold_truncate_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_truncate_long_const(ctx, node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_truncate_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_truncate_ulong_const(ctx, node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_truncate_instr(ctx: *struc OptimTacContext, node: *struc TacTruncate, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_truncate_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_zero_extend_uchar_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_zero_extend_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_zero_extend_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstUChar_t {
            fold_constant = fold_zero_extend_uchar_const(ctx, node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_zero_extend_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_zero_extend_instr(ctx: *struc OptimTacContext, node: *struc TacZeroExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_zero_extend_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_dbl_to_signed_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = nil
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].get._CConstDouble.value)
                fold_constant = make_CConstChar(value)
                break
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstInt(value)
            break
        }
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstLong(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_dbl_to_signed_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_dbl_to_signed_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_dbl_to_unsigned_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = nil
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstUChar(value)
            break
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstUInt(value)
            break
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstULong(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_dbl_to_unsigned_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToUInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_dbl_to_unsigned_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_signed_to_dbl_const(constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstChar_t {
            value: f64 = cast<f64>(constant[].get._CConstChar.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstInt_t {
            value: f64 = cast<f64>(constant[].get._CConstInt.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstLong_t {
            value: f64 = cast<f64>(constant[].get._CConstLong.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_signed_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_signed_to_dbl_const(node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_unsigned_to_dbl_const(constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstUChar_t {
            value: f64 = cast<f64>(constant[].get._CConstUChar.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstUInt_t {
            value: f64 = cast<f64>(constant[].get._CConstUInt.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstULong_t {
            value: f64 = cast<f64>(constant[].get._CConstULong.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_unsigned_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacUIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_unsigned_to_dbl_const(node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_unary_char_const(node: *struc TacUnaryOp, constant: *struc CConstChar) *struc CConst {
    if node[].tag == AST_TacNot_t {
        value: i32 = ? not constant[].value then 1 else 0
        return make_CConstInt(value)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn fold_unary_int_const(node: *struc TacUnaryOp, constant: *struc CConstInt) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: i32 = ~constant[].value
            return make_CConstInt(value)
        }
        -> AST_TacNegate_t {
            value: i32 = -constant[].value
            return make_CConstInt(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_long_const(node: *struc TacUnaryOp, constant: *struc CConstLong) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: i64 = ~constant[].value
            return make_CConstLong(value)
        }
        -> AST_TacNegate_t {
            value: i64 = -constant[].value
            return make_CConstLong(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_dbl_const(node: *struc TacUnaryOp, constant: *struc CConstDouble) *struc CConst {
    match node[].tag {
        -> AST_TacNegate_t {
            value: f64 = -constant[].value
            return make_CConstDouble(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_uchar_const(node: *struc TacUnaryOp, constant: *struc CConstUChar) *struc CConst {
    if node[].tag == AST_TacNot_t {
        value: i32 = ? not constant[].value then 1 else 0
        return make_CConstInt(value)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn fold_unary_uint_const(node: *struc TacUnaryOp, constant: *struc CConstUInt) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: u32 = ~constant[].value
            return make_CConstUInt(value)
        }
        -> AST_TacNegate_t {
            value: u32 = -constant[].value
            return make_CConstUInt(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_ulong_const(node: *struc TacUnaryOp, constant: *struc CConstULong) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: u64 = ~constant[].value
            return make_CConstULong(value)
        }
        -> AST_TacNegate_t {
            value: u64 = -constant[].value
            return make_CConstULong(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_const(node: *struc TacUnaryOp, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_unary_char_const(node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_unary_int_const(node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_unary_long_const(node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_unary_dbl_const(node, @constant[].get._CConstDouble)
            break
        }
        -> AST_CConstUChar_t {
            fold_constant = fold_unary_uchar_const(node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_unary_uint_const(node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_unary_ulong_const(node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_unary_instr(ctx: *struc OptimTacContext, node: *struc TacUnary, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        src: *struc TacValue = fold_unary_const(@node[].unop, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_binary_int_const(node: *struc TacBinaryOp, constant_1: *struc CConstInt, constant_2: *struc CConstInt) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: i32 = constant_1[].value + constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacSubtract_t {
            value: i32 = constant_1[].value - constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacMultiply_t {
            value: i32 = constant_1[].value * constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacDivide_t {
            value: i32 = ? constant_2[].value ~= 0 then constant_1[].value / constant_2[].value else 0
            return make_CConstInt(value)
        }
        -> AST_TacRemainder_t {
            value: i32 = ? constant_2[].value ~= 0 then constant_1[].value % constant_2[].value else 0
            return make_CConstInt(value)
        }
        -> AST_TacBitAnd_t {
            value: i32 = constant_1[].value & constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitOr_t {
            value: i32 = constant_1[].value | constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitXor_t {
            value: i32 = constant_1[].value ^ constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: i32 = constant_1[].value << constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: i32 = constant_1[].value >> constant_2[].value
                return make_CConstInt(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_long_const(node: *struc TacBinaryOp, constant_1: *struc CConstLong, constant_2: *struc CConstLong) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: i64 = constant_1[].value + constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacSubtract_t {
            value: i64 = constant_1[].value - constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacMultiply_t {
            value: i64 = constant_1[].value * constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacDivide_t {
            value: i64 = ? constant_2[].value ~= 0l then constant_1[].value / constant_2[].value else 0l
            return make_CConstLong(value)
        }
        -> AST_TacRemainder_t {
            value: i64 = ? constant_2[].value ~= 0l then constant_1[].value % constant_2[].value else 0l
            return make_CConstLong(value)
        }
        -> AST_TacBitAnd_t {
            value: i64 = constant_1[].value & constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitOr_t {
            value: i64 = constant_1[].value | constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitXor_t {
            value: i64 = constant_1[].value ^ constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: i64 = constant_1[].value << constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: i64 = constant_1[].value >> constant_2[].value
                return make_CConstLong(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_dbl_const(node: *struc TacBinaryOp, constant_1: *struc CConstDouble, constant_2: *struc CConstDouble) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: f64 = constant_1[].value + constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacSubtract_t {
            value: f64 = constant_1[].value - constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacMultiply_t {
            value: f64 = constant_1[].value * constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacDivide_t {
            value: f64 = constant_1[].value / constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_uint_const(node: *struc TacBinaryOp, constant_1: *struc CConstUInt, constant_2: *struc CConstUInt) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: u32 = constant_1[].value + constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacSubtract_t {
            value: u32 = constant_1[].value - constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacMultiply_t {
            value: u32 = constant_1[].value * constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacDivide_t {
            value: u32 = ? constant_2[].value ~= 0u then constant_1[].value / constant_2[].value else 0u
            return make_CConstUInt(value)
        }
        -> AST_TacRemainder_t {
            value: u32 = ? constant_2[].value ~= 0u then constant_1[].value % constant_2[].value else 0u
            return make_CConstUInt(value)
        }
        -> AST_TacBitAnd_t {
            value: u32 = constant_1[].value & constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitOr_t {
            value: u32 = constant_1[].value | constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitXor_t {
            value: u32 = constant_1[].value ^ constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: u32 = constant_1[].value << constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: u32 = constant_1[].value >> constant_2[].value
                return make_CConstUInt(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_ulong_const(node: *struc TacBinaryOp, constant_1: *struc CConstULong, constant_2: *struc CConstULong) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: u64 = constant_1[].value + constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacSubtract_t {
            value: u64 = constant_1[].value - constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacMultiply_t {
            value: u64 = constant_1[].value * constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacDivide_t {
            value: u64 = ? constant_2[].value ~= 0ul then constant_1[].value / constant_2[].value else 0ul
            return make_CConstULong(value)
        }
        -> AST_TacRemainder_t {
            value: u64 = ? constant_2[].value ~= 0ul then constant_1[].value % constant_2[].value else 0ul
            return make_CConstULong(value)
        }
        -> AST_TacBitAnd_t {
            value: u64 = constant_1[].value & constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitOr_t {
            value: u64 = constant_1[].value | constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitXor_t {
            value: u64 = constant_1[].value ^ constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: u64 = constant_1[].value << constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: u64 = constant_1[].value >> constant_2[].value
                return make_CConstULong(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_const(node: *struc TacBinaryOp, constant_1: *struc CConst, constant_2: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = nil
    match constant_1[].tag {
        -> AST_CConstInt_t {
            fold_constant = fold_binary_int_const(node, @constant_1[].get._CConstInt, @constant_2[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_binary_long_const(node, @constant_1[].get._CConstLong, @constant_2[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_binary_dbl_const(node, @constant_1[].get._CConstDouble, @constant_2[].get._CConstDouble)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_binary_uint_const(node, @constant_1[].get._CConstUInt, @constant_2[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_binary_ulong_const(node, @constant_1[].get._CConstULong, @constant_2[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_binary_instr(ctx: *struc OptimTacContext, node: *struc TacBinary, instr_idx: u64) none {
    if node[].src1[].tag == AST_TacConstant_t and node[].src2[].tag == AST_TacConstant_t {
        src: *struc TacValue = fold_binary_const(@node[].binop, node[].src1[].get._TacConstant.constant, node[].src2[].get._TacConstant.constant)
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_copy_char_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                return nil
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            return nil
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_long_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstLong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                return nil
            }
        }
        -> AST_Double_t {
            value: f64 = cast<f64>(constant[].value)
            return make_CConstDouble(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_dbl_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstDouble) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].value)
            return make_CConstLong(value)
        }
        -> AST_Double_t {
            return nil
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_uchar_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            return nil
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UInt_t {
            return nil
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_ulong_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstULong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].value)
            return make_CConstLong(value)
        }
        -> AST_Double_t {
            value: f64 = cast<f64>(constant[].value)
            return make_CConstDouble(value)
        }
        -> AST_Pointer_t {
            -> AST_ULong_t {
                return nil
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = nil
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_copy_char_const(ctx, node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_copy_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_copy_long_const(ctx, node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_copy_dbl_const(ctx, node, @constant[].get._CConstDouble)
            break
        }
        -> AST_CConstUChar_t {
            fold_constant = fold_copy_uchar_const(ctx, node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_copy_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_copy_ulong_const(ctx, node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if fold_constant {
        return make_TacConstant(@fold_constant)
    }
    else {
        return nil
    }
}

fn fold_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_copy_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        if src {
            if src ~= node[].src {
                free_TacValue(@node[].src)
                node[].src = src
                src = nil
            }
            ;
            ctx[].is_fixed_point = false
        }
    }
}

fn is_const_zero(constant: *struc CConst) i32 {
    match constant[].tag {
        -> AST_CConstChar_t {
            return constant[].get._CConstChar.value == 0
        }
        -> AST_CConstInt_t {
            return constant[].get._CConstInt.value == 0
        }
        -> AST_CConstLong_t {
            return constant[].get._CConstLong.value == 0l
        }
        -> AST_CConstDouble_t {
            return constant[].get._CConstDouble.value == 0.0
        }
        -> AST_CConstUChar_t {
            return constant[].get._CConstUChar.value == 0u
        }
        -> AST_CConstUInt_t {
            return constant[].get._CConstUInt.value == 0u
        }
        -> AST_CConstULong_t {
            return constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_jmp_eq_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, instr_idx: u64) none {
    if node[].condition[].tag == AST_TacConstant_t {
        if is_const_zero(node[].condition[].get._TacConstant.constant) {
            target: u64 = node[].target
            set_instr(ctx, make_TacJump(target), instr_idx)
        }
        else {
            set_instr(ctx, nil, instr_idx)
        }
    }
}

fn fold_jmp_ne_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, instr_idx: u64) none {
    if node[].condition[].tag == AST_TacConstant_t {
        if is_const_zero(node[].condition[].get._TacConstant.constant) {
            set_instr(ctx, nil, instr_idx)
        }
        else {
            target: u64 = node[].target
            set_instr(ctx, make_TacJump(target), instr_idx)
        }
    }
}

fn fold_instr(ctx: *struc OptimTacContext, instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            fold_sign_extend_instr(ctx, @node[].get._TacSignExtend, instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            fold_truncate_instr(ctx, @node[].get._TacTruncate, instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            fold_zero_extend_instr(ctx, @node[].get._TacZeroExtend, instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            fold_dbl_to_signed_instr(ctx, @node[].get._TacDoubleToInt, instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            fold_dbl_to_unsigned_instr(ctx, @node[].get._TacDoubleToUInt, instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            fold_signed_to_dbl_instr(ctx, @node[].get._TacIntToDouble, instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            fold_unsigned_to_dbl_instr(ctx, @node[].get._TacUIntToDouble, instr_idx)
        }
        break
        -> AST_TacUnary_t {
            fold_unary_instr(ctx, @node[].get._TacUnary, instr_idx)
        }
        break
        -> AST_TacBinary_t {
            fold_binary_instr(ctx, @node[].get._TacBinary, instr_idx)
        }
        break
        -> AST_TacCopy_t {
            fold_copy_instr(ctx, @node[].get._TacCopy)
        }
        break
        -> AST_TacJumpIfZero_t {
            fold_jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero, instr_idx)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            fold_jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn fold_constants(ctx: *struc OptimTacContext) none {
    loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            fold_instr(ctx, instr_idx)
        }
    }
}

fn unreach_reachable_block(ctx: *struc OptimTacContext, block_id: u64) none;

fn unreach_succ_reachable_blocks(ctx: *struc OptimTacContext, block_id: u64) none {
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
        unreach_reachable_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[i])
    }
}

fn unreach_reachable_block(ctx: *struc OptimTacContext, block_id: u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        unreach_succ_reachable_blocks(ctx, block_id)
    }
}

fn unreach_empty_block(ctx: *struc OptimTacContext, block_id: u64) none {
    loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            set_instr(ctx, nil, instr_idx)
        }
    }
    ctx[].cfg[].blocks[block_id].size = 0
    cfg_rm_empty_block(ctx, block_id, false)
    if ctx[].cfg[].blocks[block_id].succ_ids {
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length = 0
    }
    ;
    if ctx[].cfg[].blocks[block_id].pred_ids {
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length = 0
    }
    ;
}

fn unreach_jump_instr(ctx: *struc OptimTacContext, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
        -> AST_TacJump_t {
            -> AST_TacJumpIfZero_t {
                -> AST_TacJumpIfNotZero_t {
                    cfg_rm_block_instr(ctx, ctx[].cfg[].blocks[block_id].instrs_back_idx, block_id)
                }
            }
        }
        break
        otherwise {
            break
        }
    }
}

fn unreach_jump_block(ctx: *struc OptimTacContext, block_id: u64, next_block_id: u64) none {
    if (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) == 1 and ctx[].cfg[].blocks[block_id].succ_ids[0] == next_block_id {
        unreach_jump_instr(ctx, block_id)
    }
}

fn unreach_label_instr(ctx: *struc OptimTacContext, block_id: u64) none {
    ;
    cfg_rm_block_instr(ctx, ctx[].cfg[].blocks[block_id].instrs_front_idx, block_id)
}

fn unreach_label_block(ctx: *struc OptimTacContext, block_id: u64, prev_block_id: u64) none {
    if (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) == 1 and ctx[].cfg[].blocks[block_id].pred_ids[0] == prev_block_id {
        unreach_label_instr(ctx, block_id)
    }
}

fn eliminate_unreachable_code(ctx: *struc OptimTacContext) none {
    if ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) == 0) {
        return none
    }
    if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
            ? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
        }        
    }
    memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))
    loop i: u64 = 0 while i < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++i {
        unreach_reachable_block(ctx, ctx[].cfg[].entry_succ_ids[i])
    }
    block_id: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    next_block_id: u64 = ctx[].cfg[].exit_id
    loop while block_id-- > 0 {
        if ctx[].cfg[].reaching_code[block_id] {
            next_block_id = block_id
            break
        }
        else {
            unreach_empty_block(ctx, block_id)
        }
    }
    loop while block_id-- > 0 {
        if ctx[].cfg[].reaching_code[block_id] {
            unreach_jump_block(ctx, block_id, next_block_id)
            next_block_id = block_id
        }
        else {
            unreach_empty_block(ctx, block_id)
        }
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        label_id: u64 = (ctx[].cfg[].identifier_id_map[i]).value
        if ctx[].cfg[].reaching_code[label_id] {
            loop block_id = label_id while block_id-- > 0 {
                if ctx[].cfg[].reaching_code[block_id] {
                    next_block_id = block_id
                    jump Lelse
                }
            }
            next_block_id = ctx[].cfg[].entry_id
            label Lelse
            unreach_label_block(ctx, label_id, next_block_id)
        }
        else {
            (ctx[].cfg[].identifier_id_map[i]).value = ctx[].cfg[].exit_id
        }
    }
}

fn is_aliased_value(ctx: *struc OptimTacContext, node: *struc TacValue) i32 {
    return node[].tag == AST_TacVariable_t and is_aliased_name(ctx, node[].get._TacVariable.name)
}

fn is_const_signed(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            -> AST_CConstInt_t {
                -> AST_CConstLong_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_var_signed(ctx: *struc OptimTacContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        return true
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_value_signed(ctx: *struc OptimTacContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return is_const_signed(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return is_var_signed(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_const_null_ptr(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstInt_t {
            return node[].constant[].get._CConstInt.value == 0
        }
        -> AST_CConstLong_t {
            return node[].constant[].get._CConstLong.value == 0l
        }
        -> AST_CConstUInt_t {
            return node[].constant[].get._CConstUInt.value == 0u
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            return false
        }
    }
}

fn is_dbl_same_const(constant_1: *struc CConstDouble, constant_2: *struc CConstDouble) i32 {
    if constant_1[].value == constant_2[].value {
        if constant_1[].value ~= 0.0 {
            return true
        }
        else {
            return dbl_to_binary(constant_1[].value) == dbl_to_binary(constant_2[].value)
        }
    }
    elif constant_1[].value ~= constant_1[].value and constant_2[].value ~= constant_2[].value {
        return true
    }
    else {
        return false
    }
}

fn is_same_const(node_1: *struc TacConstant, node_2: *struc TacConstant) i32 {
    if node_1[].constant[].tag == node_2[].constant[].tag {
        match node_1[].constant[].tag {
            -> AST_CConstChar_t {
                return node_1[].constant[].get._CConstChar.value == node_2[].constant[].get._CConstChar.value
            }
            -> AST_CConstInt_t {
                return node_1[].constant[].get._CConstInt.value == node_2[].constant[].get._CConstInt.value
            }
            -> AST_CConstLong_t {
                return node_1[].constant[].get._CConstLong.value == node_2[].constant[].get._CConstLong.value
            }
            -> AST_CConstDouble_t {
                return is_dbl_same_const(@node_1[].constant[].get._CConstDouble, @node_2[].constant[].get._CConstDouble)
            }
            -> AST_CConstUChar_t {
                return node_1[].constant[].get._CConstUChar.value == node_2[].constant[].get._CConstUChar.value
            }
            -> AST_CConstUInt_t {
                return node_1[].constant[].get._CConstUInt.value == node_2[].constant[].get._CConstUInt.value
            }
            -> AST_CConstULong_t {
                return node_1[].constant[].get._CConstULong.value == node_2[].constant[].get._CConstULong.value
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    return false
}

fn is_same_var(node_1: *struc TacVariable, node_2: *struc TacVariable) i32 {
    return node_1[].name == node_2[].name
}

fn is_same_value(node_1: *struc TacValue, node_2: *struc TacValue) i32 {
    if node_1[].tag == node_2[].tag {
        match node_1[].tag {
            -> AST_TacConstant_t {
                return is_same_const(@node_1[].get._TacConstant, @node_2[].get._TacConstant)
            }
            -> AST_TacVariable_t {
                return is_same_var(@node_1[].get._TacVariable, @node_2[].get._TacVariable)
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    return false
}

fn is_same_name(node: *struc TacValue, name: u64) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return false
        }
        -> AST_TacVariable_t {
            return node[].get._TacVariable.name == name
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_copy_same_signedness(ctx: *struc OptimTacContext, node: *struc TacCopy) i32 {
    return is_value_signed(ctx, node[].src) == is_value_signed(ctx, node[].dst)
}

fn is_copy_null_ptr(ctx: *struc OptimTacContext, node: *struc TacCopy) i32 {
    if node[].src[].tag == AST_TacConstant_t and node[].dst[].tag == AST_TacVariable_t and ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].dst[].get._TacVariable.name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Pointer_t {
        return is_const_null_ptr(@node[].src[].get._TacConstant)
    }
    else {
        return false
    }
}

fn prop_transfer_dst_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_same_value(node, copy[].src) or is_same_value(node, copy[].dst) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_call(ctx: *struc OptimTacContext, node: *struc TacFunCall, next_instr_idx: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_aliased_value(ctx, copy[].src) or is_aliased_value(ctx, copy[].dst) or (node[].dst and (is_same_value(node[].dst, copy[].src) or is_same_value(node[].dst, copy[].dst))) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_copy(ctx: *struc OptimTacContext, node: *struc TacCopy, next_instr_idx: u64) i32 {
    ;
    loop i: u64 = 0 while i < ctx[].dfa[].set_size .. ++i {
        ;
        copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
        ;
        if is_same_value(node[].dst, copy[].dst) {
            if (is_copy_same_signedness(ctx, copy) or is_copy_null_ptr(ctx, copy)) and is_same_value(node[].src, copy[].src) {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
            }
            else {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
            }
        }
        elif mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
            if is_same_value(node[].dst, copy[].src) {
                if is_same_value(node[].src, copy[].dst) {
                    return false
                }
                else {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                }
            }
        }
    }
    return true
}

fn prop_transfer_store(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_aliased_value(ctx, copy[].src) or is_aliased_value(ctx, copy[].dst) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_cp_to_offset(ctx: *struc OptimTacContext, node: *struc TacCopyToOffset, next_instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_same_name(copy[].src, node[].dst_name) or is_same_name(copy[].dst, node[].dst_name) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_reach_copies(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) i32 {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            prop_transfer_dst_value(ctx, node[].get._TacSignExtend.dst, next_instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            prop_transfer_dst_value(ctx, node[].get._TacTruncate.dst, next_instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            prop_transfer_dst_value(ctx, node[].get._TacZeroExtend.dst, next_instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            prop_transfer_dst_value(ctx, node[].get._TacDoubleToInt.dst, next_instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            prop_transfer_dst_value(ctx, node[].get._TacDoubleToUInt.dst, next_instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            prop_transfer_dst_value(ctx, node[].get._TacIntToDouble.dst, next_instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            prop_transfer_dst_value(ctx, node[].get._TacUIntToDouble.dst, next_instr_idx)
        }
        break
        -> AST_TacFunCall_t {
            prop_transfer_call(ctx, @node[].get._TacFunCall, next_instr_idx)
        }
        break
        -> AST_TacUnary_t {
            prop_transfer_dst_value(ctx, node[].get._TacUnary.dst, next_instr_idx)
        }
        break
        -> AST_TacBinary_t {
            prop_transfer_dst_value(ctx, node[].get._TacBinary.dst, next_instr_idx)
        }
        break
        -> AST_TacCopy_t {
            return prop_transfer_copy(ctx, @node[].get._TacCopy, next_instr_idx)
        }
        -> AST_TacGetAddress_t {
            prop_transfer_dst_value(ctx, node[].get._TacGetAddress.dst, next_instr_idx)
        }
        break
        -> AST_TacLoad_t {
            prop_transfer_dst_value(ctx, node[].get._TacLoad.dst, next_instr_idx)
        }
        break
        -> AST_TacStore_t {
            prop_transfer_store(ctx, next_instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            prop_transfer_dst_value(ctx, node[].get._TacAddPtr.dst, next_instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            prop_transfer_cp_to_offset(ctx, @node[].get._TacCopyToOffset, next_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            prop_transfer_dst_value(ctx, node[].get._TacCopyFromOffset.dst, next_instr_idx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return true
}

fn get_dfa_bak_copy_instr(ctx: *struc OptimTacContext, i: u64) *struc TacCopy {
    node: *struc TacInstruction = get_dfa_bak_instr(ctx, i)
    ;
    return @node[].get._TacCopy
}

fn set_dfa_bak_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64) none {
    i: u64;
    if set_dfa_bak_instr(ctx, instr_idx, @i) {
        src: *struc TacValue = nil
        if node[].src ~= src {
            free_TacValue(@src)
            src = node[].src
            (src)[]._ref_count++
        }
        ;
        dst: *struc TacValue = nil
        if node[].dst ~= dst {
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        free_TacInstruction(@ctx[].dfa_o1[].bak_instrs[i])
        ctx[].dfa_o1[].bak_instrs[i] = make_TacCopy(@src, @dst)
    }
}

fn prop_ret_instr(ctx: *struc OptimTacContext, node: *struc TacReturn, incoming_idx: u64, exit_block: i32) none {
    if node[].val and node[].val[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].val, copy[].dst) {
                        if copy[].src ~= node[].val {
                            free_TacValue(@node[].val)
                            node[].val = copy[].src
                            (node[].val)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_sign_extend_instr(ctx: *struc OptimTacContext, node: *struc TacSignExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_truncate_instr(ctx: *struc OptimTacContext, node: *struc TacTruncate, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_zero_extend_instr(ctx: *struc OptimTacContext, node: *struc TacZeroExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_dbl_to_int_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_dbl_to_uint_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToUInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_int_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_uint_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacUIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_call_instr(ctx: *struc OptimTacContext, node: *struc TacFunCall, instr_idx: u64) none {
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        if node[].args[i][].tag == AST_TacVariable_t {
            j: u64 = 0
            loop k: u64 = 0 while k < ctx[].dfa[].mask_size .. ++k {
                if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (k)] == 0ul {
                    j += 64
                    continue
                }
                mask_set_size: u64 = j + 64
                if mask_set_size > ctx[].dfa[].set_size {
                    mask_set_size = ctx[].dfa[].set_size
                }
                loop  while j < mask_set_size .. ++j {
                    if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
                        copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, j)
                        ;
                        if is_same_value(node[].args[i], copy[].dst) {
                            if copy[].src ~= node[].args[i] {
                                free_TacValue(@node[].args[i])
                                node[].args[i] = copy[].src
                                (node[].args[i])[]._ref_count++
                            }
                            ;
                            ctx[].is_fixed_point = false
                            jump Lbreak
                        }
                    }
                }
            }
            label Lbreak
            ;
        }
    }
}

fn prop_unary_instr(ctx: *struc OptimTacContext, node: *struc TacUnary, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_binary_instr(ctx: *struc OptimTacContext, node: *struc TacBinary, instr_idx: u64) none {
    is_src1: i32 = node[].src1[].tag == AST_TacVariable_t
    is_src2: i32 = node[].src2[].tag == AST_TacVariable_t
    if is_src1 or is_src2 {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_src1 and is_same_value(node[].src1, copy[].dst) {
                        if copy[].src ~= node[].src1 {
                            free_TacValue(@node[].src1)
                            node[].src1 = copy[].src
                            (node[].src1)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src1 = false
                        if not is_src2 {
                            return none
                        }
                    }
                    if is_src2 and is_same_value(node[].src2, copy[].dst) {
                        if copy[].src ~= node[].src2 {
                            free_TacValue(@node[].src2)
                            node[].src2 = copy[].src
                            (node[].src2)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src2 = false
                        if not is_src1 {
                            return none
                        }
                    }
                }
            }
        }
    }
}

fn prop_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64, block_id: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                ;
                if ctx[].dfa_o1[].data_idx_map[i] == instr_idx or (is_same_value(node[].src, copy[].dst) and is_same_value(node[].dst, copy[].src)) {
                    set_dfa_bak_copy_instr(ctx, node, instr_idx)
                    cfg_rm_block_instr(ctx, instr_idx, block_id)
                    return none
                }
                elif is_same_value(node[].src, copy[].dst) {
                    set_dfa_bak_copy_instr(ctx, node, instr_idx)
                    if copy[].src ~= node[].src {
                        free_TacValue(@node[].src)
                        node[].src = copy[].src
                        (node[].src)[]._ref_count++
                    }
                    ;
                    ctx[].is_fixed_point = false
                    return none
                }
            }
        }
    }
}

fn prop_load_instr(ctx: *struc OptimTacContext, node: *struc TacLoad, instr_idx: u64) none {
    if node[].src_ptr[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src_ptr, copy[].dst) {
                        if copy[].src ~= node[].src_ptr {
                            free_TacValue(@node[].src_ptr)
                            node[].src_ptr = copy[].src
                            (node[].src_ptr)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_store_instr(ctx: *struc OptimTacContext, node: *struc TacStore, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_add_ptr_instr(ctx: *struc OptimTacContext, node: *struc TacAddPtr, instr_idx: u64) none {
    is_src_ptr: i32 = node[].src_ptr[].tag == AST_TacVariable_t
    is_idx: i32 = node[].idx[].tag == AST_TacVariable_t
    if is_src_ptr or is_idx {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_src_ptr and is_same_value(node[].src_ptr, copy[].dst) {
                        if copy[].src ~= node[].src_ptr {
                            free_TacValue(@node[].src_ptr)
                            node[].src_ptr = copy[].src
                            (node[].src_ptr)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src_ptr = false
                        if not is_idx {
                            return none
                        }
                    }
                    if is_idx and is_same_value(node[].idx, copy[].dst) {
                        if copy[].src ~= node[].idx {
                            free_TacValue(@node[].idx)
                            node[].idx = copy[].src
                            (node[].idx)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_idx = false
                        if not is_src_ptr {
                            return none
                        }
                    }
                }
            }
        }
    }
}

fn prop_cp_to_offset_instr(ctx: *struc OptimTacContext, node: *struc TacCopyToOffset, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_cp_from_offset_instr(ctx: *struc OptimTacContext, node: *struc TacCopyFromOffset, instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                ;
                if is_same_name(copy[].dst, node[].src_name) {
                    ;
                    node[].src_name = copy[].src[].get._TacVariable.name
                    ctx[].is_fixed_point = false
                    return none
                }
            }
        }
    }
}

fn prop_jmp_eq_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, incoming_idx: u64, exit_block: u64) none {
    if node[].condition[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].condition, copy[].dst) {
                        if copy[].src ~= node[].condition {
                            free_TacValue(@node[].condition)
                            node[].condition = copy[].src
                            (node[].condition)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_jmp_ne_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, incoming_idx: u64, exit_block: u64) none {
    if node[].condition[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].condition, copy[].dst) {
                        if copy[].src ~= node[].condition {
                            free_TacValue(@node[].condition)
                            node[].condition = copy[].src
                            (node[].condition)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_instr(ctx: *struc OptimTacContext, instr_idx: u64, copy_instr_idx: u64, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            prop_ret_instr(ctx, @node[].get._TacReturn, copy_instr_idx, block_id > 0)
        }
        break
        -> AST_TacSignExtend_t {
            prop_sign_extend_instr(ctx, @node[].get._TacSignExtend, copy_instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            prop_truncate_instr(ctx, @node[].get._TacTruncate, copy_instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            prop_zero_extend_instr(ctx, @node[].get._TacZeroExtend, copy_instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            prop_dbl_to_int_instr(ctx, @node[].get._TacDoubleToInt, copy_instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            prop_dbl_to_uint_instr(ctx, @node[].get._TacDoubleToUInt, copy_instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            prop_int_to_dbl_instr(ctx, @node[].get._TacIntToDouble, copy_instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            prop_uint_to_dbl_instr(ctx, @node[].get._TacUIntToDouble, copy_instr_idx)
        }
        break
        -> AST_TacFunCall_t {
            prop_call_instr(ctx, @node[].get._TacFunCall, copy_instr_idx)
        }
        break
        -> AST_TacUnary_t {
            prop_unary_instr(ctx, @node[].get._TacUnary, copy_instr_idx)
        }
        break
        -> AST_TacBinary_t {
            prop_binary_instr(ctx, @node[].get._TacBinary, copy_instr_idx)
        }
        break
        -> AST_TacCopy_t {
            prop_copy_instr(ctx, @node[].get._TacCopy, copy_instr_idx, block_id)
        }
        break
        -> AST_TacLoad_t {
            prop_load_instr(ctx, @node[].get._TacLoad, copy_instr_idx)
        }
        break
        -> AST_TacStore_t {
            prop_store_instr(ctx, @node[].get._TacStore, copy_instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            prop_add_ptr_instr(ctx, @node[].get._TacAddPtr, copy_instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            prop_cp_to_offset_instr(ctx, @node[].get._TacCopyToOffset, copy_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            prop_cp_from_offset_instr(ctx, @node[].get._TacCopyFromOffset, copy_instr_idx)
        }
        break
        -> AST_TacJumpIfZero_t {
            prop_jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero, copy_instr_idx, block_id > 0)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            prop_jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero, copy_instr_idx, block_id > 0)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn propagate_copies(ctx: *struc OptimTacContext) none {
    if not init_data_flow_analysis(ctx, false, true) {
        return none
    }
    dfa_forward_iter_alg(ctx)
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            incoming_idx: u64 = block_id
            exit_block: u64 = 1
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1 while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    match (ctx[].p_instrs[])[instr_idx][].tag {
                        -> AST_TacReturn_t {
                            -> AST_TacJumpIfZero_t {
                                -> AST_TacJumpIfNotZero_t {
                                    prop_instr(ctx, instr_idx, incoming_idx, exit_block)
                                }
                            }
                        }
                        break
                        -> AST_TacSignExtend_t {
                            -> AST_TacTruncate_t {
                                -> AST_TacZeroExtend_t {
                                    -> AST_TacDoubleToInt_t {
                                        -> AST_TacDoubleToUInt_t {
                                            -> AST_TacIntToDouble_t {
                                                -> AST_TacUIntToDouble_t {
                                                    -> AST_TacFunCall_t {
                                                        -> AST_TacUnary_t {
                                                            -> AST_TacBinary_t {
                                                                -> AST_TacCopy_t {
                                                                    -> AST_TacLoad_t {
                                                                        -> AST_TacStore_t {
                                                                            -> AST_TacAddPtr_t {
                                                                                -> AST_TacCopyToOffset_t {
                                                                                    -> AST_TacCopyFromOffset_t {
                                                                                        prop_instr(ctx, instr_idx, instr_idx, block_id)
                                                                                        incoming_idx = instr_idx
                                                                                        exit_block = 0
                                                                                        break
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
                        -> AST_TacGetAddress_t {
                            incoming_idx = instr_idx
                            exit_block = 0
                            break
                        }
                        otherwise {
                            break
                        }
                    }
                }
            }
        }
    }
}

fn elim_transfer_addressed(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)]
    }
}

fn elim_transfer_aliased(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)]
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)]
    }
}

fn elim_transfer_src_name(ctx: *struc OptimTacContext, name: u64, next_instr_idx: u64) none {
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
}

fn elim_transfer_src_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    if node[].tag == AST_TacVariable_t {
        elim_transfer_src_name(ctx, node[].get._TacVariable.name, next_instr_idx)
    }
}

fn elim_transfer_dst_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    ;
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].get._TacVariable.name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
}

fn elim_transfer_live_values(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            p_node: *struc TacReturn = @node[].get._TacReturn
            if p_node[].val {
                elim_transfer_src_value(ctx, p_node[].val, next_instr_idx)
            }
            break
        }
        -> AST_TacSignExtend_t {
            p_node: *struc TacSignExtend = @node[].get._TacSignExtend
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacTruncate_t {
            p_node: *struc TacTruncate = @node[].get._TacTruncate
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacZeroExtend_t {
            p_node: *struc TacZeroExtend = @node[].get._TacZeroExtend
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacDoubleToInt_t {
            p_node: *struc TacDoubleToInt = @node[].get._TacDoubleToInt
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacDoubleToUInt_t {
            p_node: *struc TacDoubleToUInt = @node[].get._TacDoubleToUInt
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacIntToDouble_t {
            p_node: *struc TacIntToDouble = @node[].get._TacIntToDouble
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacUIntToDouble_t {
            p_node: *struc TacUIntToDouble = @node[].get._TacUIntToDouble
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacFunCall_t {
            p_node: *struc TacFunCall = @node[].get._TacFunCall
            if p_node[].dst {
                elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            }
            loop i: u64 = 0 while i < (? (p_node[].args) then (cast<*struc stbds_array_header>((p_node[].args)) - 1)[].length else 0) .. ++i {
                elim_transfer_src_value(ctx, p_node[].args[i], next_instr_idx)
            }
            elim_transfer_aliased(ctx, next_instr_idx)
            break
        }
        -> AST_TacUnary_t {
            p_node: *struc TacUnary = @node[].get._TacUnary
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacBinary_t {
            p_node: *struc TacBinary = @node[].get._TacBinary
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src1, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src2, next_instr_idx)
            break
        }
        -> AST_TacCopy_t {
            p_node: *struc TacCopy = @node[].get._TacCopy
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacGetAddress_t {
            elim_transfer_dst_value(ctx, node[].get._TacGetAddress.dst, next_instr_idx)
        }
        break
        -> AST_TacLoad_t {
            p_node: *struc TacLoad = @node[].get._TacLoad
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src_ptr, next_instr_idx)
            elim_transfer_addressed(ctx, next_instr_idx)
            break
        }
        -> AST_TacStore_t {
            p_node: *struc TacStore = @node[].get._TacStore
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].dst_ptr, next_instr_idx)
            break
        }
        -> AST_TacAddPtr_t {
            p_node: *struc TacAddPtr = @node[].get._TacAddPtr
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src_ptr, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].idx, next_instr_idx)
            break
        }
        -> AST_TacCopyToOffset_t {
            elim_transfer_src_value(ctx, node[].get._TacCopyToOffset.src, next_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            p_node: *struc TacCopyFromOffset = @node[].get._TacCopyFromOffset
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_name(ctx, p_node[].src_name, next_instr_idx)
            break
        }
        -> AST_TacJumpIfZero_t {
            elim_transfer_src_value(ctx, node[].get._TacJumpIfZero.condition, next_instr_idx)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            elim_transfer_src_value(ctx, node[].get._TacJumpIfNotZero.condition, next_instr_idx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn elim_dst_name_instr(ctx: *struc OptimTacContext, name: u64, instr_idx: u64) none {
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    if not mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
        set_instr(ctx, nil, instr_idx)
    }
}

fn elim_dst_value_instr(ctx: *struc OptimTacContext, node: *struc TacValue, instr_idx: u64) none {
    ;
    elim_dst_name_instr(ctx, node[].get._TacVariable.name, instr_idx)
}

fn elim_instr(ctx: *struc OptimTacContext, instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            elim_dst_value_instr(ctx, node[].get._TacSignExtend.dst, instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            elim_dst_value_instr(ctx, node[].get._TacTruncate.dst, instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            elim_dst_value_instr(ctx, node[].get._TacZeroExtend.dst, instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            elim_dst_value_instr(ctx, node[].get._TacDoubleToInt.dst, instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            elim_dst_value_instr(ctx, node[].get._TacDoubleToUInt.dst, instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            elim_dst_value_instr(ctx, node[].get._TacIntToDouble.dst, instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            elim_dst_value_instr(ctx, node[].get._TacUIntToDouble.dst, instr_idx)
        }
        break
        -> AST_TacUnary_t {
            elim_dst_value_instr(ctx, node[].get._TacUnary.dst, instr_idx)
        }
        break
        -> AST_TacBinary_t {
            elim_dst_value_instr(ctx, node[].get._TacBinary.dst, instr_idx)
        }
        break
        -> AST_TacCopy_t {
            elim_dst_value_instr(ctx, node[].get._TacCopy.dst, instr_idx)
        }
        break
        -> AST_TacGetAddress_t {
            elim_dst_value_instr(ctx, node[].get._TacGetAddress.dst, instr_idx)
        }
        break
        -> AST_TacLoad_t {
            elim_dst_value_instr(ctx, node[].get._TacLoad.dst, instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            elim_dst_value_instr(ctx, node[].get._TacAddPtr.dst, instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            elim_dst_name_instr(ctx, node[].get._TacCopyToOffset.dst_name, instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            elim_dst_value_instr(ctx, node[].get._TacCopyFromOffset.dst, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn eliminate_dead_stores(ctx: *struc OptimTacContext, is_addressed_set: i32) none {
    if not init_data_flow_analysis(ctx, true, is_addressed_set) {
        return none
    }
    dfa_iter_alg(ctx)
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    elim_instr(ctx, instr_idx)
                }
            }
        }
    }
}

m4_define(`CONSTANT_FOLDING', `0')m4_dnl
m4_define(`COPY_PROPAGATION', `1')m4_dnl
m4_define(`UNREACHABLE_CODE_ELIMINATION', `2')m4_dnl
m4_define(`DEAD_STORE_ELIMINATION', `3')m4_dnl
m4_define(`CONTROL_FLOW_GRAPH', `4')m4_dnl

fn optim_fun_toplvl(ctx: *struc OptimTacContext, node: *struc TacFunction) none {
    ctx[].p_instrs = @node[].body
    loop .. while not ctx[].is_fixed_point {
        ctx[].is_fixed_point = true
        if ctx[].enabled_optims[CONSTANT_FOLDING] {
            fold_constants(ctx)
        }
        if ctx[].enabled_optims[CONTROL_FLOW_GRAPH] {
            init_control_flow_graph(ctx)
            if ctx[].enabled_optims[UNREACHABLE_CODE_ELIMINATION] {
                eliminate_unreachable_code(ctx)
            }
            if ctx[].enabled_optims[COPY_PROPAGATION] {
                propagate_copies(ctx)
            }
            if ctx[].enabled_optims[DEAD_STORE_ELIMINATION] {
                eliminate_dead_stores(ctx, not ctx[].enabled_optims[COPY_PROPAGATION])
            }
        }
    }    
    ctx[].p_instrs = nil
}

fn optim_toplvl(ctx: *struc OptimTacContext, node: *struc TacTopLevel) none {
    if node[].tag == AST_TacFunction_t {
        optim_fun_toplvl(ctx, @node[].get._TacFunction)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn optim_program(ctx: *struc OptimTacContext, node: *struc TacProgram) none {
    loop i: u64 = 0 while i < (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0) .. ++i {
        optim_toplvl(ctx, node[].fun_toplvls[i])
    }
    if ctx[].frontend[].addressed_set {
        loop .. while 0 {
            cast<none>((? (ctx[].frontend[].addressed_set) ~= nil then stbds_hmfree_func((ctx[].frontend[].addressed_set) - 1, sizeof((ctx[].frontend[].addressed_set)[])) else cast<none>(0)))
            (ctx[].frontend[].addressed_set) = nil
        }        
        ctx[].frontend[].addressed_set = nil
    }
    ;
}

pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none {
    ctx: struc OptimTacContext;
    {
        ctx.frontend = frontend
        ctx.is_fixed_point = true
        ctx.enabled_optims[CONSTANT_FOLDING] = (optim_1_mask & ((cast<u8>(1u)) << 0)) > 0
        ctx.enabled_optims[COPY_PROPAGATION] = (optim_1_mask & ((cast<u8>(1u)) << 1)) > 0
        ctx.enabled_optims[UNREACHABLE_CODE_ELIMINATION] = (optim_1_mask & ((cast<u8>(1u)) << 2)) > 0
        ctx.enabled_optims[DEAD_STORE_ELIMINATION] = (optim_1_mask & ((cast<u8>(1u)) << 3)) > 0
        ctx.enabled_optims[CONTROL_FLOW_GRAPH] = (optim_1_mask & ~((cast<u8>(1u)) << 0)) > 0
        ctx.cfg = nil
        ctx.dfa = nil
        ctx.dfa_o1 = nil
        if ctx.enabled_optims[CONTROL_FLOW_GRAPH] {
            ctx.cfg = make_ControlFlowGraph()
            if ctx.enabled_optims[COPY_PROPAGATION] or ctx.enabled_optims[DEAD_STORE_ELIMINATION] {
                ctx.dfa = make_DataFlowAnalysis()
                ctx.dfa_o1 = make_DataFlowAnalysisO1()
            }
        }
    }

    optim_program(@ctx, node)
    free_ControlFlowGraph(@ctx.cfg)
    free_DataFlowAnalysis(@ctx.dfa)
    free_DataFlowAnalysisO1(@ctx.dfa_o1)
}
