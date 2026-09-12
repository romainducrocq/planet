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
m4_define(`STBDS_ADDRESSOF', `TODO')m4_dnl
m4_define(`STBDS_OFFSETOF', `TODO')m4_dnl
m4_define(`stbds_header', `TODO')m4_dnl
m4_define(`stbds_temp', `TODO')m4_dnl
m4_define(`stbds_arrsetcap', `TODO')m4_dnl
m4_define(`stbds_arrsetlen', `TODO')m4_dnl
m4_define(`stbds_arrcap', `TODO')m4_dnl
m4_define(`stbds_arrlenu', `TODO')m4_dnl
m4_define(`stbds_arrput', `TODO')m4_dnl
m4_define(`stbds_arrpop', `TODO')m4_dnl
m4_define(`stbds_arrlast', `TODO')m4_dnl
m4_define(`stbds_arrfree', `TODO')m4_dnl
m4_define(`stbds_arrdelswap', `TODO')m4_dnl
m4_define(`stbds_arrmaybegrow', `TODO')m4_dnl
m4_define(`stbds_arrgrow', `TODO')m4_dnl
m4_define(`stbds_hmput', `TODO')m4_dnl
m4_define(`stbds_hmgeti', `TODO')m4_dnl
m4_define(`stbds_hmgetp', `TODO')m4_dnl
m4_define(`stbds_hmdel', `TODO')m4_dnl
m4_define(`stbds_hmfree', `TODO')m4_dnl
m4_define(`stbds_hmget', `TODO')m4_dnl
m4_define(`stbds_hmlenu', `TODO')m4_dnl

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
m4_define(`TRY', `TODO')m4_dnl
m4_define(`THROW_PANIC', `TODO')m4_dnl
m4_define(`SET_ERROR_MSG', `TODO')m4_dnl
m4_define(`THROW_ERROR', `TODO')m4_dnl
m4_define(`tagged_def_t', `TODO')m4_dnl
m4_define(`tagged_def_impl', `TODO')m4_dnl
m4_define(`tagged_def_init', `TODO')m4_dnl
m4_define(`unique_ptr_t', `TODO')m4_dnl
m4_define(`unique_ptr_impl', `TODO')m4_dnl
m4_define(`uptr_new', `TODO')m4_dnl
m4_define(`uptr_delete', `TODO')m4_dnl
m4_define(`uptr_alloc', `TODO')m4_dnl
m4_define(`uptr_free', `TODO')m4_dnl
m4_define(`uptr_move', `TODO')m4_dnl
m4_define(`shared_ptr_t', `TODO')m4_dnl
m4_define(`shared_ptr_impl', `TODO')m4_dnl
m4_define(`sptr_new', `TODO')m4_dnl
m4_define(`sptr_delete', `TODO')m4_dnl
m4_define(`sptr_alloc', `TODO')m4_dnl
m4_define(`sptr_free', `TODO')m4_dnl
m4_define(`sptr_move', `TODO')m4_dnl
m4_define(`sptr_copy', `TODO')m4_dnl
m4_define(`string_t', `TODO')m4_dnl
m4_define(`str_new', `TODO')m4_dnl
m4_define(`str_delete', `TODO')m4_dnl
m4_define(`str_move', `TODO')m4_dnl
m4_define(`str_size', `TODO')m4_dnl
m4_define(`str_back', `TODO')m4_dnl
m4_define(`str_append', `TODO')m4_dnl
m4_define(`str_clear', `TODO')m4_dnl
m4_define(`str_copy', `TODO')m4_dnl
m4_define(`str_hash', `TODO')m4_dnl
m4_define(`str_pop_back', `TODO')m4_dnl
m4_define(`str_push_back', `TODO')m4_dnl
m4_define(`str_reserve', `TODO')m4_dnl
m4_define(`str_resize', `TODO')m4_dnl
m4_define(`str_substr', `TODO')m4_dnl
m4_define(`str_to_string', `TODO')m4_dnl
m4_define(`vector_t', `TODO')m4_dnl
m4_define(`vec_new', `TODO')m4_dnl
m4_define(`vec_delete', `TODO')m4_dnl
m4_define(`vec_move', `TODO')m4_dnl
m4_define(`vec_size', `TODO')m4_dnl
m4_define(`vec_back', `TODO')m4_dnl
m4_define(`vec_clear', `TODO')m4_dnl
m4_define(`vec_empty', `TODO')m4_dnl
m4_define(`vec_move_back', `TODO')m4_dnl
m4_define(`vec_pop_back', `TODO')m4_dnl
m4_define(`vec_push_back', `TODO')m4_dnl
m4_define(`vec_remove_swap', `TODO')m4_dnl
m4_define(`vec_resize', `TODO')m4_dnl
m4_define(`vec_reserve', `TODO')m4_dnl
m4_define(`pair_t', `TODO')m4_dnl
m4_define(`PairKeyValue', `TODO')m4_dnl
m4_define(`pair_first', `TODO')m4_dnl
m4_define(`pair_second', `TODO')m4_dnl
m4_define(`hashmap_t', `TODO')m4_dnl
m4_define(`map_new', `TODO')m4_dnl
m4_define(`map_delete', `TODO')m4_dnl
m4_define(`map_move', `TODO')m4_dnl
m4_define(`map_size', `TODO')m4_dnl
m4_define(`map_add', `TODO')m4_dnl
m4_define(`map_clear', `TODO')m4_dnl
m4_define(`map_empty', `TODO')m4_dnl
m4_define(`map_end', `TODO')m4_dnl
m4_define(`map_erase', `TODO')m4_dnl
m4_define(`map_find', `TODO')m4_dnl
m4_define(`map_get', `TODO')m4_dnl
m4_define(`map_move_add', `TODO')m4_dnl
m4_define(`element_t', `TODO')m4_dnl
m4_define(`ElementKey', `TODO')m4_dnl
m4_define(`element_get', `TODO')m4_dnl
m4_define(`hashset_t', `TODO')m4_dnl
m4_define(`set_new', `TODO')m4_dnl
m4_define(`set_delete', `TODO')m4_dnl
m4_define(`set_size', `TODO')m4_dnl
m4_define(`set_clear', `TODO')m4_dnl
m4_define(`set_end', `TODO')m4_dnl
m4_define(`set_find', `TODO')m4_dnl
m4_define(`set_insert', `TODO')m4_dnl
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

pub fn make_AsmReg(tag: i32) struc AsmReg {
    self: struc AsmReg = $(tag)
    match tag {
        -> AST_AsmReg_t {
            -> AST_AsmAx_t {
                -> AST_AsmBx_t {
                    -> AST_AsmCx_t {
                        -> AST_AsmDx_t {
                            -> AST_AsmDi_t {
                                -> AST_AsmSi_t {
                                    -> AST_AsmR8_t {
                                        -> AST_AsmR9_t {
                                            -> AST_AsmR10_t {
                                                -> AST_AsmR11_t {
                                                    -> AST_AsmR12_t {
                                                        -> AST_AsmR13_t {
                                                            -> AST_AsmR14_t {
                                                                -> AST_AsmR15_t {
                                                                    -> AST_AsmSp_t {
                                                                        -> AST_AsmBp_t {
                                                                            -> AST_AsmXMM0_t {
                                                                                -> AST_AsmXMM1_t {
                                                                                    -> AST_AsmXMM2_t {
                                                                                        -> AST_AsmXMM3_t {
                                                                                            -> AST_AsmXMM4_t {
                                                                                                -> AST_AsmXMM5_t {
                                                                                                    -> AST_AsmXMM6_t {
                                                                                                        -> AST_AsmXMM7_t {
                                                                                                            -> AST_AsmXMM8_t {
                                                                                                                -> AST_AsmXMM9_t {
                                                                                                                    -> AST_AsmXMM10_t {
                                                                                                                        -> AST_AsmXMM11_t {
                                                                                                                            -> AST_AsmXMM12_t {
                                                                                                                                -> AST_AsmXMM13_t {
                                                                                                                                    -> AST_AsmXMM14_t {
                                                                                                                                        -> AST_AsmXMM15_t {
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

pub fn make_AsmCondCode(tag: i32) struc AsmCondCode {
    self: struc AsmCondCode = $(tag)
    match tag {
        -> AST_AsmCondCode_t {
            -> AST_AsmE_t {
                -> AST_AsmNE_t {
                    -> AST_AsmG_t {
                        -> AST_AsmGE_t {
                            -> AST_AsmL_t {
                                -> AST_AsmLE_t {
                                    -> AST_AsmA_t {
                                        -> AST_AsmAE_t {
                                            -> AST_AsmB_t {
                                                -> AST_AsmBE_t {
                                                    -> AST_AsmP_t {
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
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_AsmOperand(none) *struc AsmOperand {
    self: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_alloc(AsmOperand, self)"
        loop .. while 0 {
            "@MACRO@:uptr_alloc(AsmOperand, self)"
            free_AsmOperand(@self)
            self = cast<*struc AsmOperand>(malloc(sizeof<struc AsmOperand>))
            if not self {
                panic_sigabrt("alloc "                     "AsmOperand")
            }
        }
        (self)[]._ref_count = 1
    }
    self[].tag = AST_AsmOperand_t
    return self
}

pub fn make_AsmImm(value: u64, is_byte: i32, is_quad: i32, is_neg: i32) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmImm_t
    self[].get._AsmImm.value = value
    self[].get._AsmImm.is_byte = is_byte
    self[].get._AsmImm.is_quad = is_quad
    self[].get._AsmImm.is_neg = is_neg
    return self
}

pub fn make_AsmRegister(reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmRegister_t
    self[].get._AsmRegister.reg = reg[]
    return self
}

pub fn make_AsmPseudo(name: u64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmPseudo_t
    self[].get._AsmPseudo.name = name
    return self
}

pub fn make_AsmMemory(value: i64, reg: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmMemory_t
    self[].get._AsmMemory.value = value
    self[].get._AsmMemory.reg = reg[]
    return self
}

pub fn make_AsmData(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmData_t
    self[].get._AsmData.name = name
    self[].get._AsmData.offset = offset
    return self
}

pub fn make_AsmPseudoMem(name: u64, offset: i64) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmPseudoMem_t
    self[].get._AsmPseudoMem.name = name
    self[].get._AsmPseudoMem.offset = offset
    return self
}

pub fn make_AsmIndexed(scale: i64, reg_base: *struc AsmReg, reg_index: *struc AsmReg) *struc AsmOperand {
    self: *struc AsmOperand = make_AsmOperand()
    self[].tag = AST_AsmIndexed_t
    self[].get._AsmIndexed.scale = scale
    self[].get._AsmIndexed.reg_base = reg_base[]
    self[].get._AsmIndexed.reg_index = reg_index[]
    return self
}

pub fn free_AsmOperand(self: **struc AsmOperand) none {
    loop .. while 0 {
        "@MACRO@:sptr_delete(*self)"
        if not self[] {
            "@MACRO@:uptr_delete(*self)"
            return none
        }
        elif (self[])[]._ref_count > 1 {
            (self[])[]._ref_count--
            self[] = nil
            return none
        }
    }
    match (self[])[].tag {
        -> AST_AsmOperand_t {
            -> AST_AsmImm_t {
                break
            }
        }
        -> AST_AsmRegister_t {
            break
        }
        -> AST_AsmPseudo_t {
            break
        }
        -> AST_AsmMemory_t {
            break
        }
        -> AST_AsmData_t {
            break
        }
        -> AST_AsmPseudoMem_t {
            break
        }
        -> AST_AsmIndexed_t {
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
            self[] = nil
        }
    }
}

pub fn make_AsmBinaryOp(tag: i32) struc AsmBinaryOp {
    self: struc AsmBinaryOp = $(tag)
    match tag {
        -> AST_AsmBinaryOp_t {
            -> AST_AsmAdd_t {
                -> AST_AsmSub_t {
                    -> AST_AsmMult_t {
                        -> AST_AsmDivDouble_t {
                            -> AST_AsmBitAnd_t {
                                -> AST_AsmBitOr_t {
                                    -> AST_AsmBitXor_t {
                                        -> AST_AsmBitShiftLeft_t {
                                            -> AST_AsmBitShiftRight_t {
                                                -> AST_AsmBitShrArithmetic_t {
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
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

pub fn make_AsmUnaryOp(tag: i32) struc AsmUnaryOp {
    self: struc AsmUnaryOp = $(tag)
    match tag {
        -> AST_AsmUnaryOp_t {
            -> AST_AsmNot_t {
                -> AST_AsmNeg_t {
                    -> AST_AsmShr_t {
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

pub fn make_AsmInstruction(none) *struc AsmInstruction {
    self: *struc AsmInstruction = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(AsmInstruction, self)"
        free_AsmInstruction(@self)
        self = cast<*struc AsmInstruction>(malloc(sizeof<struc AsmInstruction>))
        if not self {
            panic_sigabrt("alloc "                 "AsmInstruction")
        }
    }
    self[].tag = AST_AsmInstruction_t
    return self
}

pub fn make_AsmMov(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMov_t
    self[].get._AsmMov.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmMov.asm_type)"
        if asm_type[] ~= self[].get._AsmMov.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmMov.asm_type)"
            free_AssemblyType(@self[].get._AsmMov.asm_type)
            self[].get._AsmMov.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmMov.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmMov.src)"
        if src[] ~= self[].get._AsmMov.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmMov.src)"
            free_AsmOperand(@self[].get._AsmMov.src)
            self[].get._AsmMov.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmMov.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmMov.dst)"
        if dst[] ~= self[].get._AsmMov.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmMov.dst)"
            free_AsmOperand(@self[].get._AsmMov.dst)
            self[].get._AsmMov.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmMovSx(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMovSx_t
    self[].get._AsmMovSx.asm_type_src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_src, self->get._AsmMovSx.asm_type_src)"
        if asm_type_src[] ~= self[].get._AsmMovSx.asm_type_src {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_src, self->get._AsmMovSx.asm_type_src)"
            free_AssemblyType(@self[].get._AsmMovSx.asm_type_src)
            self[].get._AsmMovSx.asm_type_src = asm_type_src[]
            asm_type_src[] = nil
        }
    }
    self[].get._AsmMovSx.asm_type_dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovSx.asm_type_dst)"
        if asm_type_dst[] ~= self[].get._AsmMovSx.asm_type_dst {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovSx.asm_type_dst)"
            free_AssemblyType(@self[].get._AsmMovSx.asm_type_dst)
            self[].get._AsmMovSx.asm_type_dst = asm_type_dst[]
            asm_type_dst[] = nil
        }
    }
    self[].get._AsmMovSx.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmMovSx.src)"
        if src[] ~= self[].get._AsmMovSx.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmMovSx.src)"
            free_AsmOperand(@self[].get._AsmMovSx.src)
            self[].get._AsmMovSx.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmMovSx.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmMovSx.dst)"
        if dst[] ~= self[].get._AsmMovSx.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmMovSx.dst)"
            free_AsmOperand(@self[].get._AsmMovSx.dst)
            self[].get._AsmMovSx.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmMovZeroExtend(asm_type_src: **struc AssemblyType, asm_type_dst: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmMovZeroExtend_t
    self[].get._AsmMovZeroExtend.asm_type_src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_src, self->get._AsmMovZeroExtend.asm_type_src)"
        if asm_type_src[] ~= self[].get._AsmMovZeroExtend.asm_type_src {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_src, self->get._AsmMovZeroExtend.asm_type_src)"
            free_AssemblyType(@self[].get._AsmMovZeroExtend.asm_type_src)
            self[].get._AsmMovZeroExtend.asm_type_src = asm_type_src[]
            asm_type_src[] = nil
        }
    }
    self[].get._AsmMovZeroExtend.asm_type_dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovZeroExtend.asm_type_dst)"
        if asm_type_dst[] ~= self[].get._AsmMovZeroExtend.asm_type_dst {
            "@MACRO@:uptr_move(AssemblyType, *asm_type_dst, self->get._AsmMovZeroExtend.asm_type_dst)"
            free_AssemblyType(@self[].get._AsmMovZeroExtend.asm_type_dst)
            self[].get._AsmMovZeroExtend.asm_type_dst = asm_type_dst[]
            asm_type_dst[] = nil
        }
    }
    self[].get._AsmMovZeroExtend.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmMovZeroExtend.src)"
        if src[] ~= self[].get._AsmMovZeroExtend.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmMovZeroExtend.src)"
            free_AsmOperand(@self[].get._AsmMovZeroExtend.src)
            self[].get._AsmMovZeroExtend.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmMovZeroExtend.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmMovZeroExtend.dst)"
        if dst[] ~= self[].get._AsmMovZeroExtend.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmMovZeroExtend.dst)"
            free_AsmOperand(@self[].get._AsmMovZeroExtend.dst)
            self[].get._AsmMovZeroExtend.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmLea(src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmLea_t
    self[].get._AsmLea.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmLea.src)"
        if src[] ~= self[].get._AsmLea.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmLea.src)"
            free_AsmOperand(@self[].get._AsmLea.src)
            self[].get._AsmLea.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmLea.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmLea.dst)"
        if dst[] ~= self[].get._AsmLea.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmLea.dst)"
            free_AsmOperand(@self[].get._AsmLea.dst)
            self[].get._AsmLea.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmCvttsd2si(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCvttsd2si_t
    self[].get._AsmCvttsd2si.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCvttsd2si.asm_type)"
        if asm_type[] ~= self[].get._AsmCvttsd2si.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCvttsd2si.asm_type)"
            free_AssemblyType(@self[].get._AsmCvttsd2si.asm_type)
            self[].get._AsmCvttsd2si.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmCvttsd2si.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmCvttsd2si.src)"
        if src[] ~= self[].get._AsmCvttsd2si.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmCvttsd2si.src)"
            free_AsmOperand(@self[].get._AsmCvttsd2si.src)
            self[].get._AsmCvttsd2si.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmCvttsd2si.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmCvttsd2si.dst)"
        if dst[] ~= self[].get._AsmCvttsd2si.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmCvttsd2si.dst)"
            free_AsmOperand(@self[].get._AsmCvttsd2si.dst)
            self[].get._AsmCvttsd2si.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmCvtsi2sd(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCvtsi2sd_t
    self[].get._AsmCvtsi2sd.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCvtsi2sd.asm_type)"
        if asm_type[] ~= self[].get._AsmCvtsi2sd.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCvtsi2sd.asm_type)"
            free_AssemblyType(@self[].get._AsmCvtsi2sd.asm_type)
            self[].get._AsmCvtsi2sd.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmCvtsi2sd.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmCvtsi2sd.src)"
        if src[] ~= self[].get._AsmCvtsi2sd.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmCvtsi2sd.src)"
            free_AsmOperand(@self[].get._AsmCvtsi2sd.src)
            self[].get._AsmCvtsi2sd.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmCvtsi2sd.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmCvtsi2sd.dst)"
        if dst[] ~= self[].get._AsmCvtsi2sd.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmCvtsi2sd.dst)"
            free_AsmOperand(@self[].get._AsmCvtsi2sd.dst)
            self[].get._AsmCvtsi2sd.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmUnary(unop: *struc AsmUnaryOp, asm_type: **struc AssemblyType, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmUnary_t
    self[].get._AsmUnary.unop = unop[]
    self[].get._AsmUnary.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmUnary.asm_type)"
        if asm_type[] ~= self[].get._AsmUnary.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmUnary.asm_type)"
            free_AssemblyType(@self[].get._AsmUnary.asm_type)
            self[].get._AsmUnary.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmUnary.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmUnary.dst)"
        if dst[] ~= self[].get._AsmUnary.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmUnary.dst)"
            free_AsmOperand(@self[].get._AsmUnary.dst)
            self[].get._AsmUnary.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmBinary(binop: *struc AsmBinaryOp, asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmBinary_t
    self[].get._AsmBinary.binop = binop[]
    self[].get._AsmBinary.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmBinary.asm_type)"
        if asm_type[] ~= self[].get._AsmBinary.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmBinary.asm_type)"
            free_AssemblyType(@self[].get._AsmBinary.asm_type)
            self[].get._AsmBinary.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmBinary.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmBinary.src)"
        if src[] ~= self[].get._AsmBinary.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmBinary.src)"
            free_AsmOperand(@self[].get._AsmBinary.src)
            self[].get._AsmBinary.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmBinary.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmBinary.dst)"
        if dst[] ~= self[].get._AsmBinary.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmBinary.dst)"
            free_AsmOperand(@self[].get._AsmBinary.dst)
            self[].get._AsmBinary.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmCmp(asm_type: **struc AssemblyType, src: **struc AsmOperand, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCmp_t
    self[].get._AsmCmp.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCmp.asm_type)"
        if asm_type[] ~= self[].get._AsmCmp.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCmp.asm_type)"
            free_AssemblyType(@self[].get._AsmCmp.asm_type)
            self[].get._AsmCmp.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmCmp.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmCmp.src)"
        if src[] ~= self[].get._AsmCmp.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmCmp.src)"
            free_AsmOperand(@self[].get._AsmCmp.src)
            self[].get._AsmCmp.src = src[]
            src[] = nil
        }
    }
    self[].get._AsmCmp.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmCmp.dst)"
        if dst[] ~= self[].get._AsmCmp.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmCmp.dst)"
            free_AsmOperand(@self[].get._AsmCmp.dst)
            self[].get._AsmCmp.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmIdiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmIdiv_t
    self[].get._AsmIdiv.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmIdiv.asm_type)"
        if asm_type[] ~= self[].get._AsmIdiv.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmIdiv.asm_type)"
            free_AssemblyType(@self[].get._AsmIdiv.asm_type)
            self[].get._AsmIdiv.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmIdiv.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmIdiv.src)"
        if src[] ~= self[].get._AsmIdiv.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmIdiv.src)"
            free_AsmOperand(@self[].get._AsmIdiv.src)
            self[].get._AsmIdiv.src = src[]
            src[] = nil
        }
    }
    return self
}

pub fn make_AsmDiv(asm_type: **struc AssemblyType, src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmDiv_t
    self[].get._AsmDiv.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmDiv.asm_type)"
        if asm_type[] ~= self[].get._AsmDiv.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmDiv.asm_type)"
            free_AssemblyType(@self[].get._AsmDiv.asm_type)
            self[].get._AsmDiv.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    self[].get._AsmDiv.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmDiv.src)"
        if src[] ~= self[].get._AsmDiv.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmDiv.src)"
            free_AsmOperand(@self[].get._AsmDiv.src)
            self[].get._AsmDiv.src = src[]
            src[] = nil
        }
    }
    return self
}

pub fn make_AsmCdq(asm_type: **struc AssemblyType) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCdq_t
    self[].get._AsmCdq.asm_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AssemblyType, *asm_type, self->get._AsmCdq.asm_type)"
        if asm_type[] ~= self[].get._AsmCdq.asm_type {
            "@MACRO@:uptr_move(AssemblyType, *asm_type, self->get._AsmCdq.asm_type)"
            free_AssemblyType(@self[].get._AsmCdq.asm_type)
            self[].get._AsmCdq.asm_type = asm_type[]
            asm_type[] = nil
        }
    }
    return self
}

pub fn make_AsmJmp(target: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmJmp_t
    self[].get._AsmJmp.target = target
    return self
}

pub fn make_AsmJmpCC(target: u64, cond_code: *struc AsmCondCode) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmJmpCC_t
    self[].get._AsmJmpCC.target = target
    self[].get._AsmJmpCC.cond_code = cond_code[]
    return self
}

pub fn make_AsmSetCC(cond_code: *struc AsmCondCode, dst: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmSetCC_t
    self[].get._AsmSetCC.cond_code = cond_code[]
    self[].get._AsmSetCC.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *dst, self->get._AsmSetCC.dst)"
        if dst[] ~= self[].get._AsmSetCC.dst {
            "@MACRO@:uptr_move(AsmOperand, *dst, self->get._AsmSetCC.dst)"
            free_AsmOperand(@self[].get._AsmSetCC.dst)
            self[].get._AsmSetCC.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_AsmLabel(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmLabel_t
    self[].get._AsmLabel.name = name
    return self
}

pub fn make_AsmPush(src: **struc AsmOperand) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmPush_t
    self[].get._AsmPush.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, *src, self->get._AsmPush.src)"
        if src[] ~= self[].get._AsmPush.src {
            "@MACRO@:uptr_move(AsmOperand, *src, self->get._AsmPush.src)"
            free_AsmOperand(@self[].get._AsmPush.src)
            self[].get._AsmPush.src = src[]
            src[] = nil
        }
    }
    return self
}

pub fn make_AsmPop(reg: *struc AsmReg) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmPop_t
    self[].get._AsmPop.reg = reg[]
    return self
}

pub fn make_AsmCall(name: u64) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmCall_t
    self[].get._AsmCall.name = name
    return self
}

pub fn make_AsmRet(none) *struc AsmInstruction {
    self: *struc AsmInstruction = make_AsmInstruction()
    self[].tag = AST_AsmRet_t
    return self
}

pub fn free_AsmInstruction(self: **struc AsmInstruction) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_AsmInstruction_t {
            break
        }
        -> AST_AsmMov_t {
            free_AssemblyType(@(self[])[].get._AsmMov.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmMov.src)
        free_AsmOperand(@(self[])[].get._AsmMov.dst)
        break
        -> AST_AsmMovSx_t {
            free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovSx.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovSx.src)
        free_AsmOperand(@(self[])[].get._AsmMovSx.dst)
        break
        -> AST_AsmMovZeroExtend_t {
            free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_src)
        }
        free_AssemblyType(@(self[])[].get._AsmMovZeroExtend.asm_type_dst)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.src)
        free_AsmOperand(@(self[])[].get._AsmMovZeroExtend.dst)
        break
        -> AST_AsmLea_t {
            free_AsmOperand(@(self[])[].get._AsmLea.src)
        }
        free_AsmOperand(@(self[])[].get._AsmLea.dst)
        break
        -> AST_AsmCvttsd2si_t {
            free_AssemblyType(@(self[])[].get._AsmCvttsd2si.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.src)
        free_AsmOperand(@(self[])[].get._AsmCvttsd2si.dst)
        break
        -> AST_AsmCvtsi2sd_t {
            free_AssemblyType(@(self[])[].get._AsmCvtsi2sd.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.src)
        free_AsmOperand(@(self[])[].get._AsmCvtsi2sd.dst)
        break
        -> AST_AsmUnary_t {
            free_AssemblyType(@(self[])[].get._AsmUnary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmUnary.dst)
        break
        -> AST_AsmBinary_t {
            free_AssemblyType(@(self[])[].get._AsmBinary.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmBinary.src)
        free_AsmOperand(@(self[])[].get._AsmBinary.dst)
        break
        -> AST_AsmCmp_t {
            free_AssemblyType(@(self[])[].get._AsmCmp.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmCmp.src)
        free_AsmOperand(@(self[])[].get._AsmCmp.dst)
        break
        -> AST_AsmIdiv_t {
            free_AssemblyType(@(self[])[].get._AsmIdiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmIdiv.src)
        break
        -> AST_AsmDiv_t {
            free_AssemblyType(@(self[])[].get._AsmDiv.asm_type)
        }
        free_AsmOperand(@(self[])[].get._AsmDiv.src)
        break
        -> AST_AsmCdq_t {
            free_AssemblyType(@(self[])[].get._AsmCdq.asm_type)
        }
        break
        -> AST_AsmJmp_t {
            break
        }
        -> AST_AsmJmpCC_t {
            break
        }
        -> AST_AsmSetCC_t {
            free_AsmOperand(@(self[])[].get._AsmSetCC.dst)
        }
        break
        -> AST_AsmLabel_t {
            break
        }
        -> AST_AsmPush_t {
            free_AsmOperand(@(self[])[].get._AsmPush.src)
        }
        break
        -> AST_AsmPop_t {
            break
        }
        -> AST_AsmCall_t {
            break
        }
        -> AST_AsmRet_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
}

pub fn make_AsmTopLevel(none) *struc AsmTopLevel {
    self: *struc AsmTopLevel = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(AsmTopLevel, self)"
        free_AsmTopLevel(@self)
        self = cast<*struc AsmTopLevel>(malloc(sizeof<struc AsmTopLevel>))
        if not self {
            panic_sigabrt("alloc "                 "AsmTopLevel")
        }
    }
    self[].tag = AST_AsmTopLevel_t
    return self
}

pub fn make_AsmFunction(name: u64, is_glob: i32, is_ret_memory: i32, instructions: ***struc AsmInstruction) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmFunction_t
    self[].get._AsmFunction.name = name
    self[].get._AsmFunction.is_glob = is_glob
    self[].get._AsmFunction.is_ret_memory = is_ret_memory
    self[].get._AsmFunction.instructions = nil
    if instructions[] ~= self[].get._AsmFunction.instructions {
        if self[].get._AsmFunction.instructions {
            loop .. while 0 {
                cast<none>((? (self[].get._AsmFunction.instructions) then free((cast<*struc stbds_array_header>((self[].get._AsmFunction.instructions)) - 1)) else cast<none>(0)))
                (self[].get._AsmFunction.instructions) = nil
            }
            self[].get._AsmFunction.instructions = nil
        }
        self[].get._AsmFunction.instructions = instructions[]
        instructions[] = nil
    }
    return self
}

pub fn make_AsmStaticVariable(name: u64, alignment: i32, is_glob: i32, static_inits: ***struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmStaticVariable_t
    self[].get._AsmStaticVariable.name = name
    self[].get._AsmStaticVariable.alignment = alignment
    self[].get._AsmStaticVariable.is_glob = is_glob
    self[].get._AsmStaticVariable.static_inits = nil
    if static_inits[] ~= self[].get._AsmStaticVariable.static_inits {
        if self[].get._AsmStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? (self[].get._AsmStaticVariable.static_inits) then free((cast<*struc stbds_array_header>((self[].get._AsmStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._AsmStaticVariable.static_inits) = nil
            }
            self[].get._AsmStaticVariable.static_inits = nil
        }
        self[].get._AsmStaticVariable.static_inits = static_inits[]
        static_inits[] = nil
    }
    return self
}

pub fn make_AsmStaticConstant(name: u64, alignment: i32, static_init: **struc StaticInit) *struc AsmTopLevel {
    self: *struc AsmTopLevel = make_AsmTopLevel()
    self[].tag = AST_AsmStaticConstant_t
    self[].get._AsmStaticConstant.name = name
    self[].get._AsmStaticConstant.alignment = alignment
    self[].get._AsmStaticConstant.static_init = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(StaticInit, *static_init, self->get._AsmStaticConstant.static_init)"
        if static_init[] ~= self[].get._AsmStaticConstant.static_init {
            "@MACRO@:uptr_move(StaticInit, *static_init, self->get._AsmStaticConstant.static_init)"
            free_StaticInit(@self[].get._AsmStaticConstant.static_init)
            self[].get._AsmStaticConstant.static_init = static_init[]
            static_init[] = nil
        }
    }
    return self
}

pub fn free_AsmTopLevel(self: **struc AsmTopLevel) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_AsmTopLevel_t {
            break
        }
        -> AST_AsmFunction_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._AsmFunction.instructions) then (cast<*struc stbds_array_header>(((self[])[].get._AsmFunction.instructions)) - 1)[].length else 0) .. ++i {
                free_AsmInstruction(@(self[])[].get._AsmFunction.instructions[i])
            }
        }
        if (self[])[].get._AsmFunction.instructions {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._AsmFunction.instructions) then free((cast<*struc stbds_array_header>(((self[])[].get._AsmFunction.instructions)) - 1)) else cast<none>(0)))
                ((self[])[].get._AsmFunction.instructions) = nil
            }
            (self[])[].get._AsmFunction.instructions = nil
        }
        break
        -> AST_AsmStaticVariable_t {
            loop i: u64 = 0 while i < (? ((self[])[].get._AsmStaticVariable.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._AsmStaticVariable.static_inits)) - 1)[].length else 0) .. ++i {
                free_StaticInit(@(self[])[].get._AsmStaticVariable.static_inits[i])
            }
        }
        if (self[])[].get._AsmStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._AsmStaticVariable.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._AsmStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._AsmStaticVariable.static_inits) = nil
            }
            (self[])[].get._AsmStaticVariable.static_inits = nil
        }
        break
        -> AST_AsmStaticConstant_t {
            free_StaticInit(@(self[])[].get._AsmStaticConstant.static_init)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
}

pub fn make_AsmProgram(static_const_toplvls: ***struc AsmTopLevel, top_levels: ***struc AsmTopLevel) *struc AsmProgram {
    self: *struc AsmProgram = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(AsmProgram, self)"
        free_AsmProgram(@self)
        self = cast<*struc AsmProgram>(malloc(sizeof<struc AsmProgram>))
        if not self {
            panic_sigabrt("alloc "                 "AsmProgram")
        }
    }
    self[].tag = AST_AsmProgram_t
    self[].static_const_toplvls = nil
    if static_const_toplvls[] ~= self[].static_const_toplvls {
        if self[].static_const_toplvls {
            loop .. while 0 {
                cast<none>((? (self[].static_const_toplvls) then free((cast<*struc stbds_array_header>((self[].static_const_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_const_toplvls) = nil
            }
            self[].static_const_toplvls = nil
        }
        self[].static_const_toplvls = static_const_toplvls[]
        static_const_toplvls[] = nil
    }
    self[].top_levels = nil
    if top_levels[] ~= self[].top_levels {
        if self[].top_levels {
            loop .. while 0 {
                cast<none>((? (self[].top_levels) then free((cast<*struc stbds_array_header>((self[].top_levels)) - 1)) else cast<none>(0)))
                (self[].top_levels) = nil
            }
            self[].top_levels = nil
        }
        self[].top_levels = top_levels[]
        top_levels[] = nil
    }
    return self
}

pub fn free_AsmProgram(self: **struc AsmProgram) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    match (self[])[].tag {
        -> AST_AsmProgram_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_const_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)[].length else 0) .. ++i {
        free_AsmTopLevel(@(self[])[].static_const_toplvls[i])
    }
    if (self[])[].static_const_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].static_const_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_const_toplvls) = nil
        }
        (self[])[].static_const_toplvls = nil
    }
    loop i: u64 = 0 while i < (? ((self[])[].top_levels) then (cast<*struc stbds_array_header>(((self[])[].top_levels)) - 1)[].length else 0) .. ++i {
        free_AsmTopLevel(@(self[])[].top_levels[i])
    }
    if (self[])[].top_levels {
        loop .. while 0 {
            cast<none>((? ((self[])[].top_levels) then free((cast<*struc stbds_array_header>(((self[])[].top_levels)) - 1)) else cast<none>(0)))
            ((self[])[].top_levels) = nil
        }
        (self[])[].top_levels = nil
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
}
