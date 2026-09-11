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

pub fn make_Type(none) *struc Type {
    self: *struc Type = nil
    loop .. while 0 {
        loop .. while 0 {
            free_Type(@self)
            self = cast<*struc Type>(malloc(sizeof<struc Type>))
            if not self {
                panic_sigabrt("alloc "                     "Type")
            }
        }        
        (self)[]._ref_count = 1
    }    
    self[].tag = AST_Type_t
    return self
}

pub fn make_Char(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Char_t
    return self
}

pub fn make_SChar(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_SChar_t
    return self
}

pub fn make_UChar(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_UChar_t
    return self
}

pub fn make_Int(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Int_t
    return self
}

pub fn make_Long(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Long_t
    return self
}

pub fn make_UInt(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_UInt_t
    return self
}

pub fn make_ULong(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_ULong_t
    return self
}

pub fn make_Double(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Double_t
    return self
}

pub fn make_Void(none) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Void_t
    return self
}

pub fn make_FunType(param_types: ***struc Type, ret_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_FunType_t
    self[].get._FunType.param_reg_mask = 0ul
    self[].get._FunType.ret_reg_mask = 0ul
    self[].get._FunType.param_types = nil
    if param_types[] ~= self[].get._FunType.param_types {
        if self[].get._FunType.param_types {
            loop .. while 0 {
                cast<none>((? (self[].get._FunType.param_types) then free((cast<*struc stbds_array_header>((self[].get._FunType.param_types)) - 1)) else cast<none>(0)))
                (self[].get._FunType.param_types) = nil
            }            
            self[].get._FunType.param_types = nil
        }
        self[].get._FunType.param_types = param_types[]
        param_types[] = nil
    }
    self[].get._FunType.ret_type = nil
    if ret_type[] ~= self[].get._FunType.ret_type {
        free_Type(@self[].get._FunType.ret_type)
        self[].get._FunType.ret_type = ret_type[]
        ret_type[] = nil
    }
    self[].get._FunType.param_reg_mask = (cast<u8>(1u)) << REGISTER_MASK_SIZE
    self[].get._FunType.ret_reg_mask = (cast<u8>(1u)) << REGISTER_MASK_SIZE
    return self
}

pub fn make_Pointer(ref_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Pointer_t
    self[].get._Pointer.ref_type = nil
    if ref_type[] ~= self[].get._Pointer.ref_type {
        free_Type(@self[].get._Pointer.ref_type)
        self[].get._Pointer.ref_type = ref_type[]
        ref_type[] = nil
    }
    return self
}

pub fn make_Array(size: i64, elem_type: **struc Type) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Array_t
    self[].get._Array.size = size
    self[].get._Array.elem_type = nil
    if elem_type[] ~= self[].get._Array.elem_type {
        free_Type(@self[].get._Array.elem_type)
        self[].get._Array.elem_type = elem_type[]
        elem_type[] = nil
    }
    return self
}

pub fn make_Structure(tag_name: u64, is_union: i32) *struc Type {
    self: *struc Type = make_Type()
    self[].tag = AST_Structure_t
    self[].get._Structure.tag_name = tag_name
    self[].get._Structure.is_union = is_union
    return self
}

pub fn free_Type(self: **struc Type) none {
    if not self[] {
        return none
    }
    elif (self[])[]._ref_count > 1 {
        (self[])[]._ref_count--
        self[] = nil
        return none
    }
    match (self[])[].tag {
        -> AST_Type_t {
            -> AST_Char_t {
                -> AST_SChar_t {
                    -> AST_UChar_t {
                        -> AST_Int_t {
                            -> AST_Long_t {
                                -> AST_UInt_t {
                                    -> AST_ULong_t {
                                        -> AST_Double_t {
                                            -> AST_Void_t {
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
        -> AST_FunType_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._FunType.param_types) then (cast<*struc stbds_array_header>(((self[])[].get._FunType.param_types)) - 1)[].length else 0) .. ++i {
                free_Type(@(self[])[].get._FunType.param_types[i])
            }
        }
        if (self[])[].get._FunType.param_types {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._FunType.param_types) then free((cast<*struc stbds_array_header>(((self[])[].get._FunType.param_types)) - 1)) else cast<none>(0)))
                ((self[])[].get._FunType.param_types) = nil
            }            
            (self[])[].get._FunType.param_types = nil
        }
        free_Type(@(self[])[].get._FunType.ret_type)
        break
        -> AST_Pointer_t {
            free_Type(@(self[])[].get._Pointer.ref_type)
        }
        break
        -> AST_Array_t {
            free_Type(@(self[])[].get._Array.elem_type)
        }
        break
        -> AST_Structure_t {
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

pub fn make_StaticInit(none) *struc StaticInit {
    self: *struc StaticInit = nil
    loop .. while 0 {
        loop .. while 0 {
            free_StaticInit(@self)
            self = cast<*struc StaticInit>(malloc(sizeof<struc StaticInit>))
            if not self {
                panic_sigabrt("alloc "                     "StaticInit")
            }
        }        
        (self)[]._ref_count = 1
    }    
    self[].tag = AST_StaticInit_t
    return self
}

pub fn make_IntInit(value: i32) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_IntInit_t
    self[].get._IntInit.value = value
    return self
}

pub fn make_LongInit(value: i64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_LongInit_t
    self[].get._LongInit.value = value
    return self
}

pub fn make_UIntInit(value: u32) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_UIntInit_t
    self[].get._UIntInit.value = value
    return self
}

pub fn make_ULongInit(value: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_ULongInit_t
    self[].get._ULongInit.value = value
    return self
}

pub fn make_CharInit(value: i8) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_CharInit_t
    self[].get._CharInit.value = value
    return self
}

pub fn make_UCharInit(value: u8) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_UCharInit_t
    self[].get._UCharInit.value = value
    return self
}

pub fn make_DoubleInit(dbl_const: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_DoubleInit_t
    self[].get._DoubleInit.dbl_const = dbl_const
    return self
}

pub fn make_ZeroInit(byte: i64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_ZeroInit_t
    self[].get._ZeroInit.byte = byte
    return self
}

pub fn make_StringInit(string_const: u64, is_null_term: i32, literal: **struc CStringLiteral) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_StringInit_t
    self[].get._StringInit.string_const = string_const
    self[].get._StringInit.is_null_term = is_null_term
    self[].get._StringInit.literal = nil
    if literal[] ~= self[].get._StringInit.literal {
        free_CStringLiteral(@self[].get._StringInit.literal)
        self[].get._StringInit.literal = literal[]
        literal[] = nil
    }
    return self
}

pub fn make_PointerInit(name: u64) *struc StaticInit {
    self: *struc StaticInit = make_StaticInit()
    self[].tag = AST_PointerInit_t
    self[].get._PointerInit.name = name
    return self
}

pub fn free_StaticInit(self: **struc StaticInit) none {
    if not self[] {
        return none
    }
    elif (self[])[]._ref_count > 1 {
        (self[])[]._ref_count--
        self[] = nil
        return none
    }
    match (self[])[].tag {
        -> AST_StaticInit_t {
            -> AST_IntInit_t {
                -> AST_LongInit_t {
                    -> AST_UIntInit_t {
                        -> AST_ULongInit_t {
                            -> AST_CharInit_t {
                                -> AST_UCharInit_t {
                                    break
                                }
                            }
                        }
                    }
                }
            }
        }
        -> AST_DoubleInit_t {
            break
        }
        -> AST_ZeroInit_t {
            break
        }
        -> AST_StringInit_t {
            free_CStringLiteral(@(self[])[].get._StringInit.literal)
        }
        break
        -> AST_PointerInit_t {
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

pub fn make_InitialValue(none) *struc InitialValue {
    self: *struc InitialValue = nil
    loop .. while 0 {
        loop .. while 0 {
            free_InitialValue(@self)
            self = cast<*struc InitialValue>(malloc(sizeof<struc InitialValue>))
            if not self {
                panic_sigabrt("alloc "                     "InitialValue")
            }
        }        
        (self)[]._ref_count = 1
    }    
    self[].tag = AST_InitialValue_t
    return self
}

pub fn make_Tentative(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_Tentative_t
    return self
}

pub fn make_Initial(static_inits: ***struc StaticInit) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_Initial_t
    self[].get._Initial.static_inits = nil
    if static_inits[] ~= self[].get._Initial.static_inits {
        if self[].get._Initial.static_inits {
            loop .. while 0 {
                cast<none>((? (self[].get._Initial.static_inits) then free((cast<*struc stbds_array_header>((self[].get._Initial.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._Initial.static_inits) = nil
            }            
            self[].get._Initial.static_inits = nil
        }
        self[].get._Initial.static_inits = static_inits[]
        static_inits[] = nil
    }
    return self
}

pub fn make_NoInitializer(none) *struc InitialValue {
    self: *struc InitialValue = make_InitialValue()
    self[].tag = AST_NoInitializer_t
    return self
}

pub fn free_InitialValue(self: **struc InitialValue) none {
    if not self[] {
        return none
    }
    elif (self[])[]._ref_count > 1 {
        (self[])[]._ref_count--
        self[] = nil
        return none
    }
    match (self[])[].tag {
        -> AST_InitialValue_t {
            -> AST_Tentative_t {
                break
            }
        }
        -> AST_Initial_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._Initial.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._Initial.static_inits)) - 1)[].length else 0) .. ++i {
                free_StaticInit(@(self[])[].get._Initial.static_inits[i])
            }
        }
        if (self[])[].get._Initial.static_inits {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._Initial.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._Initial.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._Initial.static_inits) = nil
            }            
            (self[])[].get._Initial.static_inits = nil
        }
        break
        -> AST_NoInitializer_t {
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

pub fn make_IdentifierAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = nil
    loop .. while 0 {
        free_IdentifierAttr(@self)
        self = cast<*struc IdentifierAttr>(malloc(sizeof<struc IdentifierAttr>))
        if not self {
            panic_sigabrt("alloc "                 "IdentifierAttr")
        }
    }    
    self[].tag = AST_IdentifierAttr_t
    return self
}

pub fn make_FunAttr(is_def: i32, is_glob: i32) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_FunAttr_t
    self[].get._FunAttr.is_def = is_def
    self[].get._FunAttr.is_glob = is_glob
    return self
}

pub fn make_StaticAttr(is_glob: i32, init: **struc InitialValue) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_StaticAttr_t
    self[].get._StaticAttr.is_glob = is_glob
    self[].get._StaticAttr.init = nil
    if init[] ~= self[].get._StaticAttr.init {
        free_InitialValue(@self[].get._StaticAttr.init)
        self[].get._StaticAttr.init = init[]
        init[] = nil
    }
    return self
}

pub fn make_ConstantAttr(static_init: **struc StaticInit) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_ConstantAttr_t
    self[].get._ConstantAttr.static_init = nil
    if static_init[] ~= self[].get._ConstantAttr.static_init {
        free_StaticInit(@self[].get._ConstantAttr.static_init)
        self[].get._ConstantAttr.static_init = static_init[]
        static_init[] = nil
    }
    return self
}

pub fn make_LocalAttr(none) *struc IdentifierAttr {
    self: *struc IdentifierAttr = make_IdentifierAttr()
    self[].tag = AST_LocalAttr_t
    return self
}

pub fn free_IdentifierAttr(self: **struc IdentifierAttr) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_IdentifierAttr_t {
            -> AST_FunAttr_t {
                break
            }
        }
        -> AST_StaticAttr_t {
            free_InitialValue(@(self[])[].get._StaticAttr.init)
        }
        break
        -> AST_ConstantAttr_t {
            free_StaticInit(@(self[])[].get._ConstantAttr.static_init)
        }
        break
        -> AST_LocalAttr_t {
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

pub fn make_Symbol(type_t: **struc Type, attrs: **struc IdentifierAttr) *struc Symbol {
    self: *struc Symbol = nil
    loop .. while 0 {
        free_Symbol(@self)
        self = cast<*struc Symbol>(malloc(sizeof<struc Symbol>))
        if not self {
            panic_sigabrt("alloc "                 "Symbol")
        }
    }    
    self[].tag = AST_Symbol_t
    self[].type_t = nil
    if type_t[] ~= self[].type_t {
        free_Type(@self[].type_t)
        self[].type_t = type_t[]
        type_t[] = nil
    }
    self[].attrs = nil
    if attrs[] ~= self[].attrs {
        free_IdentifierAttr(@self[].attrs)
        self[].attrs = attrs[]
        attrs[] = nil
    }
    return self
}

pub fn free_Symbol(self: **struc Symbol) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_Symbol_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_Type(@(self[])[].type_t)
    free_IdentifierAttr(@(self[])[].attrs)
    if self[] {
        free(self[])
        self[] = nil
    }
}

pub fn make_StructMember(offset: i64, member_type: **struc Type) *struc StructMember {
    self: *struc StructMember = nil
    loop .. while 0 {
        free_StructMember(@self)
        self = cast<*struc StructMember>(malloc(sizeof<struc StructMember>))
        if not self {
            panic_sigabrt("alloc "                 "StructMember")
        }
    }    
    self[].tag = AST_StructMember_t
    self[].offset = offset
    self[].member_type = nil
    if member_type[] ~= self[].member_type {
        free_Type(@self[].member_type)
        self[].member_type = member_type[]
        member_type[] = nil
    }
    return self
}

pub fn free_StructMember(self: **struc StructMember) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_StructMember_t {
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

pub fn make_StructTypedef(alignment: i32, size: i64, member_names: **u64, members: **struc PairTIdentifierUPtrStructMember) *struc StructTypedef {
    self: *struc StructTypedef = nil
    loop .. while 0 {
        free_StructTypedef(@self)
        self = cast<*struc StructTypedef>(malloc(sizeof<struc StructTypedef>))
        if not self {
            panic_sigabrt("alloc "                 "StructTypedef")
        }
    }    
    self[].tag = AST_StructTypedef_t
    self[].alignment = alignment
    self[].size = size
    self[].member_names = nil
    if member_names[] ~= self[].member_names {
        if self[].member_names {
            loop .. while 0 {
                cast<none>((? (self[].member_names) then free((cast<*struc stbds_array_header>((self[].member_names)) - 1)) else cast<none>(0)))
                (self[].member_names) = nil
            }            
            self[].member_names = nil
        }
        self[].member_names = member_names[]
        member_names[] = nil
    }
    self[].members = nil
    if members[] ~= self[].members {
        if self[].members {
            loop .. while 0 {
                cast<none>((? (self[].members) ~= nil then stbds_hmfree_func((self[].members) - 1, sizeof((self[].members)[])) else cast<none>(0)))
                (self[].members) = nil
            }            
            self[].members = nil
        }
        self[].members = members[]
        members[] = nil
    }
    return self
}

pub fn free_StructTypedef(self: **struc StructTypedef) none {
    if not self[] {
        return none
    }
    match (self[])[].tag {
        -> AST_StructTypedef_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if (self[])[].member_names {
        loop .. while 0 {
            cast<none>((? ((self[])[].member_names) then free((cast<*struc stbds_array_header>(((self[])[].member_names)) - 1)) else cast<none>(0)))
            ((self[])[].member_names) = nil
        }        
        (self[])[].member_names = nil
    }
    loop i: u64 = 0 while i < (? ((self[])[].members) then (cast<*struc stbds_array_header>((((self[])[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@((self[])[].members[i]).value)
    }
    if (self[])[].members {
        loop .. while 0 {
            cast<none>((? ((self[])[].members) ~= nil then stbds_hmfree_func(((self[])[].members) - 1, sizeof(((self[])[].members)[])) else cast<none>(0)))
            ((self[])[].members) = nil
        }        
        (self[])[].members = nil
    }
    if self[] {
        free(self[])
        self[] = nil
    }
}

m4_define(`Ctx', `TODO')m4_dnl

pub fn get_struct_typedef_member(ctx: *struc FrontEndContext, tag_name: u64, member_name: u64) *struc StructMember {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((struct_typedef[].member_names[member_name]))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}

pub fn get_struct_typedef_back(ctx: *struc FrontEndContext, tag_name: u64) *struc StructMember {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    return ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@(((struct_typedef[].member_names)[(? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0) - 1]))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)
}
