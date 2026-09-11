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

pub fn make_CUnaryOp(tag: i32) struc CUnaryOp {
    self: struc CUnaryOp = $(tag)
    match tag {
        -> AST_CUnaryOp_t {
            -> AST_CComplement_t {
                -> AST_CNegate_t {
                    -> AST_CNot_t {
                        -> AST_CPrefix_t {
                            -> AST_CPostfix_t {
                                return self
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

pub fn make_CBinaryOp(tag: i32) struc CBinaryOp {
    self: struc CBinaryOp = $(tag)
    match tag {
        -> AST_CBinaryOp_t {
            -> AST_CAdd_t {
                -> AST_CSubtract_t {
                    -> AST_CMultiply_t {
                        -> AST_CDivide_t {
                            -> AST_CRemainder_t {
                                -> AST_CBitAnd_t {
                                    -> AST_CBitOr_t {
                                        -> AST_CBitXor_t {
                                            -> AST_CBitShiftLeft_t {
                                                -> AST_CBitShiftRight_t {
                                                    -> AST_CBitShrArithmetic_t {
                                                        -> AST_CAnd_t {
                                                            -> AST_COr_t {
                                                                -> AST_CEqual_t {
                                                                    -> AST_CNotEqual_t {
                                                                        -> AST_CLessThan_t {
                                                                            -> AST_CLessOrEqual_t {
                                                                                -> AST_CGreaterThan_t {
                                                                                    -> AST_CGreaterOrEqual_t {
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
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_CAbstractDeclarator(none) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = nil
    loop .. while 0 {
        free_CAbstractDeclarator(@self)
        self = cast<*struc CAbstractDeclarator>(malloc(sizeof<struc CAbstractDeclarator>))
        if not self {
            panic_sigabrt("alloc "                 "CAbstractDeclarator")
        }
    }    
    self[].tag = AST_CAbstractDeclarator_t
    return self
}

pub fn make_CAbstractPointer(abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractPointer_t
    self[].get._CAbstractPointer.abstract_decltor = nil
    if abstract_decltor[] ~= self[].get._CAbstractPointer.abstract_decltor {
        free_CAbstractDeclarator(@self[].get._CAbstractPointer.abstract_decltor)
        self[].get._CAbstractPointer.abstract_decltor = abstract_decltor[]
        abstract_decltor[] = nil
    }
    return self
}

pub fn make_CAbstractArray(size: i64, abstract_decltor: **struc CAbstractDeclarator) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractArray_t
    self[].get._CAbstractArray.size = size
    self[].get._CAbstractArray.abstract_decltor = nil
    if abstract_decltor[] ~= self[].get._CAbstractArray.abstract_decltor {
        free_CAbstractDeclarator(@self[].get._CAbstractArray.abstract_decltor)
        self[].get._CAbstractArray.abstract_decltor = abstract_decltor[]
        abstract_decltor[] = nil
    }
    return self
}

pub fn make_CAbstractBase(none) *struc CAbstractDeclarator {
    self: *struc CAbstractDeclarator = make_CAbstractDeclarator()
    self[].tag = AST_CAbstractBase_t
    return self
}

pub fn free_CAbstractDeclarator(self: **struc CAbstractDeclarator) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CAbstractDeclarator_t {
            break
        }
        -> AST_CAbstractPointer_t {
            free_CAbstractDeclarator(@(self[])[].get._CAbstractPointer.abstract_decltor)
        }
        break
        -> AST_CAbstractArray_t {
            free_CAbstractDeclarator(@(self[])[].get._CAbstractArray.abstract_decltor)
        }
        break
        -> AST_CAbstractBase_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CParam(decltor: **struc CDeclarator, param_type: **struc Type) *struc CParam {
    self: *struc CParam = nil
    loop .. while 0 {
        free_CParam(@self)
        self = cast<*struc CParam>(malloc(sizeof<struc CParam>))
        if not self {
            panic_sigabrt("alloc "                 "CParam")
        }
    }    
    self[].tag = AST_CParam_t
    self[].decltor = nil
    if decltor[] ~= self[].decltor {
        free_CDeclarator(@self[].decltor)
        self[].decltor = decltor[]
        decltor[] = nil
    }
    self[].param_type = nil
    if param_type[] ~= self[].param_type {
        free_Type(@self[].param_type)
        self[].param_type = param_type[]
        param_type[] = nil
    }
    return self
}

pub fn free_CParam(self: **struc CParam) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CParam_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_CDeclarator(@(self[])[].decltor)
    free_Type(@(self[])[].param_type)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CDeclarator(none) *struc CDeclarator {
    self: *struc CDeclarator = nil
    loop .. while 0 {
        free_CDeclarator(@self)
        self = cast<*struc CDeclarator>(malloc(sizeof<struc CDeclarator>))
        if not self {
            panic_sigabrt("alloc "                 "CDeclarator")
        }
    }    
    self[].tag = AST_CDeclarator_t
    return self
}

pub fn make_CIdent(name: u64) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CIdent_t
    self[].get._CIdent.name = name
    return self
}

pub fn make_CPointerDeclarator(decltor: **struc CDeclarator) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CPointerDeclarator_t
    self[].get._CPointerDeclarator.decltor = nil
    if decltor[] ~= self[].get._CPointerDeclarator.decltor {
        free_CDeclarator(@self[].get._CPointerDeclarator.decltor)
        self[].get._CPointerDeclarator.decltor = decltor[]
        decltor[] = nil
    }
    return self
}

pub fn make_CArrayDeclarator(size: i64, decltor: **struc CDeclarator) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CArrayDeclarator_t
    self[].get._CArrayDeclarator.size = size
    self[].get._CArrayDeclarator.decltor = nil
    if decltor[] ~= self[].get._CArrayDeclarator.decltor {
        free_CDeclarator(@self[].get._CArrayDeclarator.decltor)
        self[].get._CArrayDeclarator.decltor = decltor[]
        decltor[] = nil
    }
    return self
}

pub fn make_CFunDeclarator(param_list: ***struc CParam, decltor: **struc CDeclarator) *struc CDeclarator {
    self: *struc CDeclarator = make_CDeclarator()
    self[].tag = AST_CFunDeclarator_t
    self[].get._CFunDeclarator.param_list = nil
    if param_list[] ~= self[].get._CFunDeclarator.param_list {
        if self[].get._CFunDeclarator.param_list {
            loop .. while 0 {
                cast<none>((? (self[].get._CFunDeclarator.param_list) then free((cast<*struc stbds_array_header>((self[].get._CFunDeclarator.param_list)) - 1)) else cast<none>(0)))
                (self[].get._CFunDeclarator.param_list) = nil
            }            
            self[].get._CFunDeclarator.param_list = nil
        }
        self[].get._CFunDeclarator.param_list = param_list[]
        param_list[] = nil
    }
    self[].get._CFunDeclarator.decltor = nil
    if decltor[] ~= self[].get._CFunDeclarator.decltor {
        free_CDeclarator(@self[].get._CFunDeclarator.decltor)
        self[].get._CFunDeclarator.decltor = decltor[]
        decltor[] = nil
    }
    return self
}

pub fn free_CDeclarator(self: **struc CDeclarator) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CDeclarator_t {
            break
        }
        -> AST_CIdent_t {
            break
        }
        -> AST_CPointerDeclarator_t {
            free_CDeclarator(@(self[])[].get._CPointerDeclarator.decltor)
        }
        break
        -> AST_CArrayDeclarator_t {
            free_CDeclarator(@(self[])[].get._CArrayDeclarator.decltor)
        }
        break
        -> AST_CFunDeclarator_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CFunDeclarator.param_list) then (cast<*struc stbds_array_header>(((self[])[].get._CFunDeclarator.param_list)) - 1)[].length else 0) .. ++i {
                free_CParam(@(self[])[].get._CFunDeclarator.param_list[i])
            }
        }
        if (self[])[].get._CFunDeclarator.param_list {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CFunDeclarator.param_list) then free((cast<*struc stbds_array_header>(((self[])[].get._CFunDeclarator.param_list)) - 1)) else cast<none>(0)))
                ((self[])[].get._CFunDeclarator.param_list) = nil
            }            
            (self[])[].get._CFunDeclarator.param_list = nil
        }
        free_CDeclarator(@(self[])[].get._CFunDeclarator.decltor)
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CExp(info_at: u64) *struc CExp {
    self: *struc CExp = nil
    loop .. while 0 {
        free_CExp(@self)
        self = cast<*struc CExp>(malloc(sizeof<struc CExp>))
        if not self {
            panic_sigabrt("alloc "                 "CExp")
        }
    }    
    self[].tag = AST_CExp_t
    self[].exp_type = nil
    self[].info_at = info_at
    return self
}

pub fn make_CConstant(constant: **struc CConst, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CConstant_t
    self[].get._CConstant.constant = nil
    if constant[] ~= self[].get._CConstant.constant {
        free_CConst(@self[].get._CConstant.constant)
        self[].get._CConstant.constant = constant[]
        constant[] = nil
    }
    self[].get._CConstant._base = self
    return self
}

pub fn make_CString(literal: **struc CStringLiteral, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CString_t
    self[].get._CString.literal = nil
    if literal[] ~= self[].get._CString.literal {
        free_CStringLiteral(@self[].get._CString.literal)
        self[].get._CString.literal = literal[]
        literal[] = nil
    }
    self[].get._CString._base = self
    return self
}

pub fn make_CVar(name: u64, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CVar_t
    self[].get._CVar.name = name
    self[].get._CVar._base = self
    return self
}

pub fn make_CCast(exp: **struc CExp, target_type: **struc Type, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CCast_t
    self[].get._CCast.exp = nil
    if exp[] ~= self[].get._CCast.exp {
        free_CExp(@self[].get._CCast.exp)
        self[].get._CCast.exp = exp[]
        exp[] = nil
    }
    self[].get._CCast.target_type = nil
    if target_type[] ~= self[].get._CCast.target_type {
        free_Type(@self[].get._CCast.target_type)
        self[].get._CCast.target_type = target_type[]
        target_type[] = nil
    }
    self[].get._CCast._base = self
    return self
}

pub fn make_CUnary(unop: *struc CUnaryOp, exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CUnary_t
    self[].get._CUnary.unop = unop[]
    self[].get._CUnary.exp = nil
    if exp[] ~= self[].get._CUnary.exp {
        free_CExp(@self[].get._CUnary.exp)
        self[].get._CUnary.exp = exp[]
        exp[] = nil
    }
    self[].get._CUnary._base = self
    return self
}

pub fn make_CBinary(binop: *struc CBinaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CBinary_t
    self[].get._CBinary.binop = binop[]
    self[].get._CBinary.exp_left = nil
    if exp_left[] ~= self[].get._CBinary.exp_left {
        free_CExp(@self[].get._CBinary.exp_left)
        self[].get._CBinary.exp_left = exp_left[]
        exp_left[] = nil
    }
    self[].get._CBinary.exp_right = nil
    if exp_right[] ~= self[].get._CBinary.exp_right {
        free_CExp(@self[].get._CBinary.exp_right)
        self[].get._CBinary.exp_right = exp_right[]
        exp_right[] = nil
    }
    self[].get._CBinary._base = self
    return self
}

pub fn make_CAssignment(unop: *struc CUnaryOp, exp_left: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CAssignment_t
    self[].get._CAssignment.unop = unop[]
    self[].get._CAssignment.exp_left = nil
    if exp_left[] ~= self[].get._CAssignment.exp_left {
        free_CExp(@self[].get._CAssignment.exp_left)
        self[].get._CAssignment.exp_left = exp_left[]
        exp_left[] = nil
    }
    self[].get._CAssignment.exp_right = nil
    if exp_right[] ~= self[].get._CAssignment.exp_right {
        free_CExp(@self[].get._CAssignment.exp_right)
        self[].get._CAssignment.exp_right = exp_right[]
        exp_right[] = nil
    }
    self[].get._CAssignment._base = self
    return self
}

pub fn make_CConditional(condition: **struc CExp, exp_middle: **struc CExp, exp_right: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CConditional_t
    self[].get._CConditional.condition = nil
    if condition[] ~= self[].get._CConditional.condition {
        free_CExp(@self[].get._CConditional.condition)
        self[].get._CConditional.condition = condition[]
        condition[] = nil
    }
    self[].get._CConditional.exp_middle = nil
    if exp_middle[] ~= self[].get._CConditional.exp_middle {
        free_CExp(@self[].get._CConditional.exp_middle)
        self[].get._CConditional.exp_middle = exp_middle[]
        exp_middle[] = nil
    }
    self[].get._CConditional.exp_right = nil
    if exp_right[] ~= self[].get._CConditional.exp_right {
        free_CExp(@self[].get._CConditional.exp_right)
        self[].get._CConditional.exp_right = exp_right[]
        exp_right[] = nil
    }
    self[].get._CConditional._base = self
    return self
}

pub fn make_CFunctionCall(name: u64, args: ***struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CFunctionCall_t
    self[].get._CFunctionCall.name = name
    self[].get._CFunctionCall.args = nil
    if args[] ~= self[].get._CFunctionCall.args {
        if self[].get._CFunctionCall.args {
            loop .. while 0 {
                cast<none>((? (self[].get._CFunctionCall.args) then free((cast<*struc stbds_array_header>((self[].get._CFunctionCall.args)) - 1)) else cast<none>(0)))
                (self[].get._CFunctionCall.args) = nil
            }            
            self[].get._CFunctionCall.args = nil
        }
        self[].get._CFunctionCall.args = args[]
        args[] = nil
    }
    self[].get._CFunctionCall._base = self
    return self
}

pub fn make_CDereference(exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CDereference_t
    self[].get._CDereference.exp = nil
    if exp[] ~= self[].get._CDereference.exp {
        free_CExp(@self[].get._CDereference.exp)
        self[].get._CDereference.exp = exp[]
        exp[] = nil
    }
    self[].get._CDereference._base = self
    return self
}

pub fn make_CAddrOf(exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CAddrOf_t
    self[].get._CAddrOf.exp = nil
    if exp[] ~= self[].get._CAddrOf.exp {
        free_CExp(@self[].get._CAddrOf.exp)
        self[].get._CAddrOf.exp = exp[]
        exp[] = nil
    }
    self[].get._CAddrOf._base = self
    return self
}

pub fn make_CSubscript(primary_exp: **struc CExp, subscript_exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSubscript_t
    self[].get._CSubscript.primary_exp = nil
    if primary_exp[] ~= self[].get._CSubscript.primary_exp {
        free_CExp(@self[].get._CSubscript.primary_exp)
        self[].get._CSubscript.primary_exp = primary_exp[]
        primary_exp[] = nil
    }
    self[].get._CSubscript.subscript_exp = nil
    if subscript_exp[] ~= self[].get._CSubscript.subscript_exp {
        free_CExp(@self[].get._CSubscript.subscript_exp)
        self[].get._CSubscript.subscript_exp = subscript_exp[]
        subscript_exp[] = nil
    }
    self[].get._CSubscript._base = self
    return self
}

pub fn make_CSizeOf(exp: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSizeOf_t
    self[].get._CSizeOf.exp = nil
    if exp[] ~= self[].get._CSizeOf.exp {
        free_CExp(@self[].get._CSizeOf.exp)
        self[].get._CSizeOf.exp = exp[]
        exp[] = nil
    }
    self[].get._CSizeOf._base = self
    return self
}

pub fn make_CSizeOfT(target_type: **struc Type, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CSizeOfT_t
    self[].get._CSizeOfT.target_type = nil
    if target_type[] ~= self[].get._CSizeOfT.target_type {
        free_Type(@self[].get._CSizeOfT.target_type)
        self[].get._CSizeOfT.target_type = target_type[]
        target_type[] = nil
    }
    self[].get._CSizeOfT._base = self
    return self
}

pub fn make_CDot(member: u64, structure: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CDot_t
    self[].get._CDot.member = member
    self[].get._CDot.structure = nil
    if structure[] ~= self[].get._CDot.structure {
        free_CExp(@self[].get._CDot.structure)
        self[].get._CDot.structure = structure[]
        structure[] = nil
    }
    self[].get._CDot._base = self
    return self
}

pub fn make_CArrow(member: u64, pointer: **struc CExp, info_at: u64) *struc CExp {
    self: *struc CExp = make_CExp(info_at)
    self[].tag = AST_CArrow_t
    self[].get._CArrow.member = member
    self[].get._CArrow.pointer = nil
    if pointer[] ~= self[].get._CArrow.pointer {
        free_CExp(@self[].get._CArrow.pointer)
        self[].get._CArrow.pointer = pointer[]
        pointer[] = nil
    }
    self[].get._CArrow._base = self
    return self
}

pub fn free_CExp(self: **struc CExp) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CExp_t {
            break
        }
        -> AST_CConstant_t {
            free_CConst(@(self[])[].get._CConstant.constant)
        }
        break
        -> AST_CString_t {
            free_CStringLiteral(@(self[])[].get._CString.literal)
        }
        break
        -> AST_CVar_t {
            break
        }
        -> AST_CCast_t {
            free_CExp(@(self[])[].get._CCast.exp)
        }
        free_Type(@(self[])[].get._CCast.target_type)
        break
        -> AST_CUnary_t {
            free_CExp(@(self[])[].get._CUnary.exp)
        }
        break
        -> AST_CBinary_t {
            free_CExp(@(self[])[].get._CBinary.exp_left)
        }
        free_CExp(@(self[])[].get._CBinary.exp_right)
        break
        -> AST_CAssignment_t {
            free_CExp(@(self[])[].get._CAssignment.exp_left)
        }
        free_CExp(@(self[])[].get._CAssignment.exp_right)
        break
        -> AST_CConditional_t {
            free_CExp(@(self[])[].get._CConditional.condition)
        }
        free_CExp(@(self[])[].get._CConditional.exp_middle)
        free_CExp(@(self[])[].get._CConditional.exp_right)
        break
        -> AST_CFunctionCall_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CFunctionCall.args) then (cast<*struc stbds_array_header>(((self[])[].get._CFunctionCall.args)) - 1)[].length else 0) .. ++i {
                free_CExp(@(self[])[].get._CFunctionCall.args[i])
            }
        }
        if (self[])[].get._CFunctionCall.args {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CFunctionCall.args) then free((cast<*struc stbds_array_header>(((self[])[].get._CFunctionCall.args)) - 1)) else cast<none>(0)))
                ((self[])[].get._CFunctionCall.args) = nil
            }            
            (self[])[].get._CFunctionCall.args = nil
        }
        break
        -> AST_CDereference_t {
            free_CExp(@(self[])[].get._CDereference.exp)
        }
        break
        -> AST_CAddrOf_t {
            free_CExp(@(self[])[].get._CAddrOf.exp)
        }
        break
        -> AST_CSubscript_t {
            free_CExp(@(self[])[].get._CSubscript.primary_exp)
        }
        free_CExp(@(self[])[].get._CSubscript.subscript_exp)
        break
        -> AST_CSizeOf_t {
            free_CExp(@(self[])[].get._CSizeOf.exp)
        }
        break
        -> AST_CSizeOfT_t {
            free_Type(@(self[])[].get._CSizeOfT.target_type)
        }
        break
        -> AST_CDot_t {
            free_CExp(@(self[])[].get._CDot.structure)
        }
        break
        -> AST_CArrow_t {
            free_CExp(@(self[])[].get._CArrow.pointer)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].exp_type)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CStatement(none) *struc CStatement {
    self: *struc CStatement = nil
    loop .. while 0 {
        free_CStatement(@self)
        self = cast<*struc CStatement>(malloc(sizeof<struc CStatement>))
        if not self {
            panic_sigabrt("alloc "                 "CStatement")
        }
    }    
    self[].tag = AST_CStatement_t
    return self
}

pub fn make_CReturn(exp: **struc CExp, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CReturn_t
    self[].get._CReturn.exp = nil
    if exp[] ~= self[].get._CReturn.exp {
        free_CExp(@self[].get._CReturn.exp)
        self[].get._CReturn.exp = exp[]
        exp[] = nil
    }
    self[].get._CReturn.info_at = info_at
    return self
}

pub fn make_CExpression(exp: **struc CExp) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CExpression_t
    self[].get._CExpression.exp = nil
    if exp[] ~= self[].get._CExpression.exp {
        free_CExp(@self[].get._CExpression.exp)
        self[].get._CExpression.exp = exp[]
        exp[] = nil
    }
    return self
}

pub fn make_CIf(condition: **struc CExp, then_fi: **struc CStatement, else_fi: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CIf_t
    self[].get._CIf.condition = nil
    if condition[] ~= self[].get._CIf.condition {
        free_CExp(@self[].get._CIf.condition)
        self[].get._CIf.condition = condition[]
        condition[] = nil
    }
    self[].get._CIf.then_fi = nil
    if then_fi[] ~= self[].get._CIf.then_fi {
        free_CStatement(@self[].get._CIf.then_fi)
        self[].get._CIf.then_fi = then_fi[]
        then_fi[] = nil
    }
    self[].get._CIf.else_fi = nil
    if else_fi[] ~= self[].get._CIf.else_fi {
        free_CStatement(@self[].get._CIf.else_fi)
        self[].get._CIf.else_fi = else_fi[]
        else_fi[] = nil
    }
    return self
}

pub fn make_CGoto(target: u64, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CGoto_t
    self[].get._CGoto.target = target
    self[].get._CGoto.info_at = info_at
    return self
}

pub fn make_CLabel(target: u64, jump_to: **struc CStatement, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CLabel_t
    self[].get._CLabel.target = target
    self[].get._CLabel.jump_to = nil
    if jump_to[] ~= self[].get._CLabel.jump_to {
        free_CStatement(@self[].get._CLabel.jump_to)
        self[].get._CLabel.jump_to = jump_to[]
        jump_to[] = nil
    }
    self[].get._CLabel.info_at = info_at
    return self
}

pub fn make_CCompound(block: **struc CBlock) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CCompound_t
    self[].get._CCompound.block = nil
    if block[] ~= self[].get._CCompound.block {
        free_CBlock(@self[].get._CCompound.block)
        self[].get._CCompound.block = block[]
        block[] = nil
    }
    return self
}

pub fn make_CWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CWhile_t
    self[].get._CWhile.target = 0
    self[].get._CWhile.condition = nil
    if condition[] ~= self[].get._CWhile.condition {
        free_CExp(@self[].get._CWhile.condition)
        self[].get._CWhile.condition = condition[]
        condition[] = nil
    }
    self[].get._CWhile.body = nil
    if body[] ~= self[].get._CWhile.body {
        free_CStatement(@self[].get._CWhile.body)
        self[].get._CWhile.body = body[]
        body[] = nil
    }
    return self
}

pub fn make_CDoWhile(condition: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CDoWhile_t
    self[].get._CDoWhile.target = 0
    self[].get._CDoWhile.condition = nil
    if condition[] ~= self[].get._CDoWhile.condition {
        free_CExp(@self[].get._CDoWhile.condition)
        self[].get._CDoWhile.condition = condition[]
        condition[] = nil
    }
    self[].get._CDoWhile.body = nil
    if body[] ~= self[].get._CDoWhile.body {
        free_CStatement(@self[].get._CDoWhile.body)
        self[].get._CDoWhile.body = body[]
        body[] = nil
    }
    return self
}

pub fn make_CFor(init: **struc CForInit, condition: **struc CExp, post: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CFor_t
    self[].get._CFor.target = 0
    self[].get._CFor.init = nil
    if init[] ~= self[].get._CFor.init {
        free_CForInit(@self[].get._CFor.init)
        self[].get._CFor.init = init[]
        init[] = nil
    }
    self[].get._CFor.condition = nil
    if condition[] ~= self[].get._CFor.condition {
        free_CExp(@self[].get._CFor.condition)
        self[].get._CFor.condition = condition[]
        condition[] = nil
    }
    self[].get._CFor.post = nil
    if post[] ~= self[].get._CFor.post {
        free_CExp(@self[].get._CFor.post)
        self[].get._CFor.post = post[]
        post[] = nil
    }
    self[].get._CFor.body = nil
    if body[] ~= self[].get._CFor.body {
        free_CStatement(@self[].get._CFor.body)
        self[].get._CFor.body = body[]
        body[] = nil
    }
    return self
}

pub fn make_CSwitch(lookup: **struc CExp, body: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CSwitch_t
    self[].get._CSwitch.target = 0
    self[].get._CSwitch.is_default = false
    self[].get._CSwitch.lookup = nil
    if lookup[] ~= self[].get._CSwitch.lookup {
        free_CExp(@self[].get._CSwitch.lookup)
        self[].get._CSwitch.lookup = lookup[]
        lookup[] = nil
    }
    self[].get._CSwitch.body = nil
    if body[] ~= self[].get._CSwitch.body {
        free_CStatement(@self[].get._CSwitch.body)
        self[].get._CSwitch.body = body[]
        body[] = nil
    }
    self[].get._CSwitch.cases = nil
    return self
}

pub fn make_CCase(value: **struc CExp, jump_to: **struc CStatement) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CCase_t
    self[].get._CCase.target = 0
    self[].get._CCase.value = nil
    if value[] ~= self[].get._CCase.value {
        free_CExp(@self[].get._CCase.value)
        self[].get._CCase.value = value[]
        value[] = nil
    }
    self[].get._CCase.jump_to = nil
    if jump_to[] ~= self[].get._CCase.jump_to {
        free_CStatement(@self[].get._CCase.jump_to)
        self[].get._CCase.jump_to = jump_to[]
        jump_to[] = nil
    }
    return self
}

pub fn make_CDefault(jump_to: **struc CStatement, info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CDefault_t
    self[].get._CDefault.target = 0
    self[].get._CDefault.jump_to = nil
    if jump_to[] ~= self[].get._CDefault.jump_to {
        free_CStatement(@self[].get._CDefault.jump_to)
        self[].get._CDefault.jump_to = jump_to[]
        jump_to[] = nil
    }
    self[].get._CDefault.info_at = info_at
    return self
}

pub fn make_CBreak(info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CBreak_t
    self[].get._CBreak.target = 0
    self[].get._CBreak.info_at = info_at
    return self
}

pub fn make_CContinue(info_at: u64) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CContinue_t
    self[].get._CContinue.target = 0
    self[].get._CContinue.info_at = info_at
    return self
}

pub fn make_CNull(none) *struc CStatement {
    self: *struc CStatement = make_CStatement()
    self[].tag = AST_CNull_t
    return self
}

pub fn free_CStatement(self: **struc CStatement) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CStatement_t {
            break
        }
        -> AST_CReturn_t {
            free_CExp(@(self[])[].get._CReturn.exp)
        }
        break
        -> AST_CExpression_t {
            free_CExp(@(self[])[].get._CExpression.exp)
        }
        break
        -> AST_CIf_t {
            free_CExp(@(self[])[].get._CIf.condition)
        }
        free_CStatement(@(self[])[].get._CIf.then_fi)
        free_CStatement(@(self[])[].get._CIf.else_fi)
        break
        -> AST_CGoto_t {
            break
        }
        -> AST_CLabel_t {
            free_CStatement(@(self[])[].get._CLabel.jump_to)
        }
        break
        -> AST_CCompound_t {
            free_CBlock(@(self[])[].get._CCompound.block)
        }
        break
        -> AST_CWhile_t {
            free_CExp(@(self[])[].get._CWhile.condition)
        }
        free_CStatement(@(self[])[].get._CWhile.body)
        break
        -> AST_CDoWhile_t {
            free_CExp(@(self[])[].get._CDoWhile.condition)
        }
        free_CStatement(@(self[])[].get._CDoWhile.body)
        break
        -> AST_CFor_t {
            free_CForInit(@(self[])[].get._CFor.init)
        }
        free_CExp(@(self[])[].get._CFor.condition)
        free_CExp(@(self[])[].get._CFor.post)
        free_CStatement(@(self[])[].get._CFor.body)
        break
        -> AST_CSwitch_t {
            free_CExp(@(self[])[].get._CSwitch.lookup)
        }
        free_CStatement(@(self[])[].get._CSwitch.body)
        loop i: u64 = 0 while i < (? ((self[])[].get._CSwitch.cases) then (cast<*struc stbds_array_header>(((self[])[].get._CSwitch.cases)) - 1)[].length else 0) .. ++i {
            free_CExp(@(self[])[].get._CSwitch.cases[i])
        }
        if (self[])[].get._CSwitch.cases {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CSwitch.cases) then free((cast<*struc stbds_array_header>(((self[])[].get._CSwitch.cases)) - 1)) else cast<none>(0)))
                ((self[])[].get._CSwitch.cases) = nil
            }            
            (self[])[].get._CSwitch.cases = nil
        }
        break
        -> AST_CCase_t {
            free_CExp(@(self[])[].get._CCase.value)
        }
        free_CStatement(@(self[])[].get._CCase.jump_to)
        break
        -> AST_CDefault_t {
            free_CStatement(@(self[])[].get._CDefault.jump_to)
        }
        break
        -> AST_CBreak_t {
            break
        }
        -> AST_CContinue_t {
            break
        }
        -> AST_CNull_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CForInit(none) *struc CForInit {
    self: *struc CForInit = nil
    loop .. while 0 {
        free_CForInit(@self)
        self = cast<*struc CForInit>(malloc(sizeof<struc CForInit>))
        if not self {
            panic_sigabrt("alloc "                 "CForInit")
        }
    }    
    self[].tag = AST_CForInit_t
    return self
}

pub fn make_CInitDecl(init: **struc CVariableDeclaration) *struc CForInit {
    self: *struc CForInit = make_CForInit()
    self[].tag = AST_CInitDecl_t
    self[].get._CInitDecl.init = nil
    if init[] ~= self[].get._CInitDecl.init {
        free_CVariableDeclaration(@self[].get._CInitDecl.init)
        self[].get._CInitDecl.init = init[]
        init[] = nil
    }
    return self
}

pub fn make_CInitExp(init: **struc CExp) *struc CForInit {
    self: *struc CForInit = make_CForInit()
    self[].tag = AST_CInitExp_t
    self[].get._CInitExp.init = nil
    if init[] ~= self[].get._CInitExp.init {
        free_CExp(@self[].get._CInitExp.init)
        self[].get._CInitExp.init = init[]
        init[] = nil
    }
    return self
}

pub fn free_CForInit(self: **struc CForInit) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CForInit_t {
            break
        }
        -> AST_CInitDecl_t {
            free_CVariableDeclaration(@(self[])[].get._CInitDecl.init)
        }
        break
        -> AST_CInitExp_t {
            free_CExp(@(self[])[].get._CInitExp.init)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CBlock(none) *struc CBlock {
    self: *struc CBlock = nil
    loop .. while 0 {
        free_CBlock(@self)
        self = cast<*struc CBlock>(malloc(sizeof<struc CBlock>))
        if not self {
            panic_sigabrt("alloc "                 "CBlock")
        }
    }    
    self[].tag = AST_CBlock_t
    return self
}

pub fn make_CB(block_items: ***struc CBlockItem) *struc CBlock {
    self: *struc CBlock = make_CBlock()
    self[].tag = AST_CB_t
    self[].get._CB.block_items = nil
    if block_items[] ~= self[].get._CB.block_items {
        if self[].get._CB.block_items {
            loop .. while 0 {
                cast<none>((? (self[].get._CB.block_items) then free((cast<*struc stbds_array_header>((self[].get._CB.block_items)) - 1)) else cast<none>(0)))
                (self[].get._CB.block_items) = nil
            }            
            self[].get._CB.block_items = nil
        }
        self[].get._CB.block_items = block_items[]
        block_items[] = nil
    }
    return self
}

pub fn free_CBlock(self: **struc CBlock) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CBlock_t {
            break
        }
        -> AST_CB_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CB.block_items) then (cast<*struc stbds_array_header>(((self[])[].get._CB.block_items)) - 1)[].length else 0) .. ++i {
                free_CBlockItem(@(self[])[].get._CB.block_items[i])
            }
        }
        if (self[])[].get._CB.block_items {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CB.block_items) then free((cast<*struc stbds_array_header>(((self[])[].get._CB.block_items)) - 1)) else cast<none>(0)))
                ((self[])[].get._CB.block_items) = nil
            }            
            (self[])[].get._CB.block_items = nil
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CBlockItem(none) *struc CBlockItem {
    self: *struc CBlockItem = nil
    loop .. while 0 {
        free_CBlockItem(@self)
        self = cast<*struc CBlockItem>(malloc(sizeof<struc CBlockItem>))
        if not self {
            panic_sigabrt("alloc "                 "CBlockItem")
        }
    }    
    self[].tag = AST_CBlockItem_t
    return self
}

pub fn make_CS(statement: **struc CStatement) *struc CBlockItem {
    self: *struc CBlockItem = make_CBlockItem()
    self[].tag = AST_CS_t
    self[].get._CS.statement = nil
    if statement[] ~= self[].get._CS.statement {
        free_CStatement(@self[].get._CS.statement)
        self[].get._CS.statement = statement[]
        statement[] = nil
    }
    return self
}

pub fn make_CD(declaration: **struc CDeclaration) *struc CBlockItem {
    self: *struc CBlockItem = make_CBlockItem()
    self[].tag = AST_CD_t
    self[].get._CD.declaration = nil
    if declaration[] ~= self[].get._CD.declaration {
        free_CDeclaration(@self[].get._CD.declaration)
        self[].get._CD.declaration = declaration[]
        declaration[] = nil
    }
    return self
}

pub fn free_CBlockItem(self: **struc CBlockItem) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CBlockItem_t {
            break
        }
        -> AST_CS_t {
            free_CStatement(@(self[])[].get._CS.statement)
        }
        break
        -> AST_CD_t {
            free_CDeclaration(@(self[])[].get._CD.declaration)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CStorageClass(tag: i32) struc CStorageClass {
    self: struc CStorageClass = $(tag)
    match tag {
        -> AST_CStorageClass_t {
            -> AST_CStatic_t {
                -> AST_CExtern_t {
                    return self
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_CInitializer(none) *struc CInitializer {
    self: *struc CInitializer = nil
    loop .. while 0 {
        free_CInitializer(@self)
        self = cast<*struc CInitializer>(malloc(sizeof<struc CInitializer>))
        if not self {
            panic_sigabrt("alloc "                 "CInitializer")
        }
    }    
    self[].tag = AST_CInitializer_t
    self[].init_type = nil
    return self
}

pub fn make_CSingleInit(exp: **struc CExp) *struc CInitializer {
    self: *struc CInitializer = make_CInitializer()
    self[].tag = AST_CSingleInit_t
    self[].get._CSingleInit.exp = nil
    if exp[] ~= self[].get._CSingleInit.exp {
        free_CExp(@self[].get._CSingleInit.exp)
        self[].get._CSingleInit.exp = exp[]
        exp[] = nil
    }
    self[].get._CSingleInit._base = self
    return self
}

pub fn make_CCompoundInit(initializers: ***struc CInitializer) *struc CInitializer {
    self: *struc CInitializer = make_CInitializer()
    self[].tag = AST_CCompoundInit_t
    self[].get._CCompoundInit.initializers = nil
    if initializers[] ~= self[].get._CCompoundInit.initializers {
        if self[].get._CCompoundInit.initializers {
            loop .. while 0 {
                cast<none>((? (self[].get._CCompoundInit.initializers) then free((cast<*struc stbds_array_header>((self[].get._CCompoundInit.initializers)) - 1)) else cast<none>(0)))
                (self[].get._CCompoundInit.initializers) = nil
            }            
            self[].get._CCompoundInit.initializers = nil
        }
        self[].get._CCompoundInit.initializers = initializers[]
        initializers[] = nil
    }
    self[].get._CCompoundInit._base = self
    return self
}

pub fn free_CInitializer(self: **struc CInitializer) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CInitializer_t {
            break
        }
        -> AST_CSingleInit_t {
            free_CExp(@(self[])[].get._CSingleInit.exp)
        }
        break
        -> AST_CCompoundInit_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._CCompoundInit.initializers) then (cast<*struc stbds_array_header>(((self[])[].get._CCompoundInit.initializers)) - 1)[].length else 0) .. ++i {
                free_CInitializer(@(self[])[].get._CCompoundInit.initializers[i])
            }
        }
        if (self[])[].get._CCompoundInit.initializers {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._CCompoundInit.initializers) then free((cast<*struc stbds_array_header>(((self[])[].get._CCompoundInit.initializers)) - 1)) else cast<none>(0)))
                ((self[])[].get._CCompoundInit.initializers) = nil
            }            
            (self[])[].get._CCompoundInit.initializers = nil
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].init_type)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CMemberDeclaration(member_name: u64, member_type: **struc Type, info_at: u64) *struc CMemberDeclaration {
    self: *struc CMemberDeclaration = nil
    loop .. while 0 {
        free_CMemberDeclaration(@self)
        self = cast<*struc CMemberDeclaration>(malloc(sizeof<struc CMemberDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CMemberDeclaration")
        }
    }    
    self[].tag = AST_CMemberDeclaration_t
    self[].member_name = member_name
    self[].member_type = nil
    if member_type[] ~= self[].member_type {
        free_Type(@self[].member_type)
        self[].member_type = member_type[]
        member_type[] = nil
    }
    self[].info_at = info_at
    return self
}

pub fn free_CMemberDeclaration(self: **struc CMemberDeclaration) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CMemberDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].member_type)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CStructDeclaration(tag_name: u64, is_union: i32, members: ***struc CMemberDeclaration, info_at: u64) *struc CStructDeclaration {
    self: *struc CStructDeclaration = nil
    loop .. while 0 {
        free_CStructDeclaration(@self)
        self = cast<*struc CStructDeclaration>(malloc(sizeof<struc CStructDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CStructDeclaration")
        }
    }    
    self[].tag = AST_CStructDeclaration_t
    self[].tag_name = tag_name
    self[].is_union = is_union
    self[].members = nil
    if members[] ~= self[].members {
        if self[].members {
            loop .. while 0 {
                cast<none>((? (self[].members) then free((cast<*struc stbds_array_header>((self[].members)) - 1)) else cast<none>(0)))
                (self[].members) = nil
            }            
            self[].members = nil
        }
        self[].members = members[]
        members[] = nil
    }
    self[].info_at = info_at
    return self
}

pub fn free_CStructDeclaration(self: **struc CStructDeclaration) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CStructDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].members) then (cast<*struc stbds_array_header>(((self[])[].members)) - 1)[].length else 0) .. ++i {
        free_CMemberDeclaration(@(self[])[].members[i])
    }
    if (self[])[].members {
        loop .. while 0 {
            cast<none>((? ((self[])[].members) then free((cast<*struc stbds_array_header>(((self[])[].members)) - 1)) else cast<none>(0)))
            ((self[])[].members) = nil
        }        
        (self[])[].members = nil
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CFunctionDeclaration(name: u64, params: **u64, body: **struc CBlock, fun_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CFunctionDeclaration {
    self: *struc CFunctionDeclaration = nil
    loop .. while 0 {
        free_CFunctionDeclaration(@self)
        self = cast<*struc CFunctionDeclaration>(malloc(sizeof<struc CFunctionDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CFunctionDeclaration")
        }
    }    
    self[].tag = AST_CFunctionDeclaration_t
    self[].name = name
    self[].params = nil
    if params[] ~= self[].params {
        if self[].params {
            loop .. while 0 {
                cast<none>((? (self[].params) then free((cast<*struc stbds_array_header>((self[].params)) - 1)) else cast<none>(0)))
                (self[].params) = nil
            }            
            self[].params = nil
        }
        self[].params = params[]
        params[] = nil
    }
    self[].body = nil
    if body[] ~= self[].body {
        free_CBlock(@self[].body)
        self[].body = body[]
        body[] = nil
    }
    self[].fun_type = nil
    if fun_type[] ~= self[].fun_type {
        free_Type(@self[].fun_type)
        self[].fun_type = fun_type[]
        fun_type[] = nil
    }
    self[].storage_class = storage_class[]
    self[].info_at = info_at
    return self
}

pub fn free_CFunctionDeclaration(self: **struc CFunctionDeclaration) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CFunctionDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if (self[])[].params {
        loop .. while 0 {
            cast<none>((? ((self[])[].params) then free((cast<*struc stbds_array_header>(((self[])[].params)) - 1)) else cast<none>(0)))
            ((self[])[].params) = nil
        }        
        (self[])[].params = nil
    }
    free_CBlock(@(self[])[].body)
    free_Type(@(self[])[].fun_type)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CVariableDeclaration(name: u64, init: **struc CInitializer, var_type: **struc Type, storage_class: *struc CStorageClass, info_at: u64) *struc CVariableDeclaration {
    self: *struc CVariableDeclaration = nil
    loop .. while 0 {
        free_CVariableDeclaration(@self)
        self = cast<*struc CVariableDeclaration>(malloc(sizeof<struc CVariableDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CVariableDeclaration")
        }
    }    
    self[].tag = AST_CVariableDeclaration_t
    self[].name = name
    self[].init = nil
    if init[] ~= self[].init {
        free_CInitializer(@self[].init)
        self[].init = init[]
        init[] = nil
    }
    self[].var_type = nil
    if var_type[] ~= self[].var_type {
        free_Type(@self[].var_type)
        self[].var_type = var_type[]
        var_type[] = nil
    }
    self[].storage_class = storage_class[]
    self[].info_at = info_at
    return self
}

pub fn free_CVariableDeclaration(self: **struc CVariableDeclaration) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CVariableDeclaration_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_CInitializer(@(self[])[].init)
    free_Type(@(self[])[].var_type)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CDeclaration(none) *struc CDeclaration {
    self: *struc CDeclaration = nil
    loop .. while 0 {
        free_CDeclaration(@self)
        self = cast<*struc CDeclaration>(malloc(sizeof<struc CDeclaration>))
        if not self {
            panic_sigabrt("alloc "                 "CDeclaration")
        }
    }    
    self[].tag = AST_CDeclaration_t
    return self
}

pub fn make_CFunDecl(fun_decl: **struc CFunctionDeclaration) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CFunDecl_t
    self[].get._CFunDecl.fun_decl = nil
    if fun_decl[] ~= self[].get._CFunDecl.fun_decl {
        free_CFunctionDeclaration(@self[].get._CFunDecl.fun_decl)
        self[].get._CFunDecl.fun_decl = fun_decl[]
        fun_decl[] = nil
    }
    return self
}

pub fn make_CVarDecl(var_decl: **struc CVariableDeclaration) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CVarDecl_t
    self[].get._CVarDecl.var_decl = nil
    if var_decl[] ~= self[].get._CVarDecl.var_decl {
        free_CVariableDeclaration(@self[].get._CVarDecl.var_decl)
        self[].get._CVarDecl.var_decl = var_decl[]
        var_decl[] = nil
    }
    return self
}

pub fn make_CStructDecl(struct_decl: **struc CStructDeclaration) *struc CDeclaration {
    self: *struc CDeclaration = make_CDeclaration()
    self[].tag = AST_CStructDecl_t
    self[].get._CStructDecl.struct_decl = nil
    if struct_decl[] ~= self[].get._CStructDecl.struct_decl {
        free_CStructDeclaration(@self[].get._CStructDecl.struct_decl)
        self[].get._CStructDecl.struct_decl = struct_decl[]
        struct_decl[] = nil
    }
    return self
}

pub fn free_CDeclaration(self: **struc CDeclaration) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CDeclaration_t {
            break
        }
        -> AST_CFunDecl_t {
            free_CFunctionDeclaration(@(self[])[].get._CFunDecl.fun_decl)
        }
        break
        -> AST_CVarDecl_t {
            free_CVariableDeclaration(@(self[])[].get._CVarDecl.var_decl)
        }
        break
        -> AST_CStructDecl_t {
            free_CStructDeclaration(@(self[])[].get._CStructDecl.struct_decl)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_CProgram(declarations: ***struc CDeclaration) *struc CProgram {
    self: *struc CProgram = nil
    loop .. while 0 {
        free_CProgram(@self)
        self = cast<*struc CProgram>(malloc(sizeof<struc CProgram>))
        if not self {
            panic_sigabrt("alloc "                 "CProgram")
        }
    }    
    self[].tag = AST_CProgram_t
    self[].declarations = nil
    if declarations[] ~= self[].declarations {
        if self[].declarations {
            loop .. while 0 {
                cast<none>((? (self[].declarations) then free((cast<*struc stbds_array_header>((self[].declarations)) - 1)) else cast<none>(0)))
                (self[].declarations) = nil
            }            
            self[].declarations = nil
        }
        self[].declarations = declarations[]
        declarations[] = nil
    }
    return self
}

pub fn free_CProgram(self: **struc CProgram) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_CProgram_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].declarations) then (cast<*struc stbds_array_header>(((self[])[].declarations)) - 1)[].length else 0) .. ++i {
        free_CDeclaration(@(self[])[].declarations[i])
    }
    if (self[])[].declarations {
        loop .. while 0 {
            cast<none>((? ((self[])[].declarations) then free((cast<*struc stbds_array_header>(((self[])[].declarations)) - 1)) else cast<none>(0)))
            ((self[])[].declarations) = nil
        }        
        (self[])[].declarations = nil
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}
