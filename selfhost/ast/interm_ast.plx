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
    self: *struc TacValue = nil
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
    self[].get._TacConstant.constant = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(CConst, *constant, self->get._TacConstant.constant)"
        if constant[] ~= self[].get._TacConstant.constant {
            "@MACRO@:uptr_move(CConst, *constant, self->get._TacConstant.constant)"
            free_CConst(@self[].get._TacConstant.constant)
            self[].get._TacConstant.constant = constant[]
            constant[] = nil
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
            self[] = nil
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
            self[] = nil
        }
    }
}

pub fn make_TacExpResult(none) *struc TacExpResult {
    self: *struc TacExpResult = nil
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
    self[].get._TacPlainOperand.val = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *val, self->get._TacPlainOperand.val)"
        if val[] ~= self[].get._TacPlainOperand.val {
            "@MACRO@:uptr_move(TacValue, *val, self->get._TacPlainOperand.val)"
            free_TacValue(@self[].get._TacPlainOperand.val)
            self[].get._TacPlainOperand.val = val[]
            val[] = nil
        }
    }
    return self
}

pub fn make_TacDereferencedPointer(val: **struc TacValue) *struc TacExpResult {
    self: *struc TacExpResult = make_TacExpResult()
    self[].tag = AST_TacDereferencedPointer_t
    self[].get._TacDereferencedPointer.val = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *val, self->get._TacDereferencedPointer.val)"
        if val[] ~= self[].get._TacDereferencedPointer.val {
            "@MACRO@:uptr_move(TacValue, *val, self->get._TacDereferencedPointer.val)"
            free_TacValue(@self[].get._TacDereferencedPointer.val)
            self[].get._TacDereferencedPointer.val = val[]
            val[] = nil
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
        self[] = nil
    }
}

pub fn make_TacInstruction(none) *struc TacInstruction {
    self: *struc TacInstruction = nil
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
    self[].get._TacReturn.val = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *val, self->get._TacReturn.val)"
        if val[] ~= self[].get._TacReturn.val {
            "@MACRO@:uptr_move(TacValue, *val, self->get._TacReturn.val)"
            free_TacValue(@self[].get._TacReturn.val)
            self[].get._TacReturn.val = val[]
            val[] = nil
        }
    }
    return self
}

pub fn make_TacSignExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacSignExtend_t
    self[].get._TacSignExtend.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacSignExtend.src)"
        if src[] ~= self[].get._TacSignExtend.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacSignExtend.src)"
            free_TacValue(@self[].get._TacSignExtend.src)
            self[].get._TacSignExtend.src = src[]
            src[] = nil
        }
    }
    self[].get._TacSignExtend.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacSignExtend.dst)"
        if dst[] ~= self[].get._TacSignExtend.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacSignExtend.dst)"
            free_TacValue(@self[].get._TacSignExtend.dst)
            self[].get._TacSignExtend.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacTruncate(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacTruncate_t
    self[].get._TacTruncate.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacTruncate.src)"
        if src[] ~= self[].get._TacTruncate.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacTruncate.src)"
            free_TacValue(@self[].get._TacTruncate.src)
            self[].get._TacTruncate.src = src[]
            src[] = nil
        }
    }
    self[].get._TacTruncate.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacTruncate.dst)"
        if dst[] ~= self[].get._TacTruncate.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacTruncate.dst)"
            free_TacValue(@self[].get._TacTruncate.dst)
            self[].get._TacTruncate.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacZeroExtend(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacZeroExtend_t
    self[].get._TacZeroExtend.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacZeroExtend.src)"
        if src[] ~= self[].get._TacZeroExtend.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacZeroExtend.src)"
            free_TacValue(@self[].get._TacZeroExtend.src)
            self[].get._TacZeroExtend.src = src[]
            src[] = nil
        }
    }
    self[].get._TacZeroExtend.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacZeroExtend.dst)"
        if dst[] ~= self[].get._TacZeroExtend.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacZeroExtend.dst)"
            free_TacValue(@self[].get._TacZeroExtend.dst)
            self[].get._TacZeroExtend.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacDoubleToInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacDoubleToInt_t
    self[].get._TacDoubleToInt.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacDoubleToInt.src)"
        if src[] ~= self[].get._TacDoubleToInt.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacDoubleToInt.src)"
            free_TacValue(@self[].get._TacDoubleToInt.src)
            self[].get._TacDoubleToInt.src = src[]
            src[] = nil
        }
    }
    self[].get._TacDoubleToInt.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacDoubleToInt.dst)"
        if dst[] ~= self[].get._TacDoubleToInt.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacDoubleToInt.dst)"
            free_TacValue(@self[].get._TacDoubleToInt.dst)
            self[].get._TacDoubleToInt.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacDoubleToUInt(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacDoubleToUInt_t
    self[].get._TacDoubleToUInt.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacDoubleToUInt.src)"
        if src[] ~= self[].get._TacDoubleToUInt.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacDoubleToUInt.src)"
            free_TacValue(@self[].get._TacDoubleToUInt.src)
            self[].get._TacDoubleToUInt.src = src[]
            src[] = nil
        }
    }
    self[].get._TacDoubleToUInt.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacDoubleToUInt.dst)"
        if dst[] ~= self[].get._TacDoubleToUInt.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacDoubleToUInt.dst)"
            free_TacValue(@self[].get._TacDoubleToUInt.dst)
            self[].get._TacDoubleToUInt.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacIntToDouble_t
    self[].get._TacIntToDouble.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacIntToDouble.src)"
        if src[] ~= self[].get._TacIntToDouble.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacIntToDouble.src)"
            free_TacValue(@self[].get._TacIntToDouble.src)
            self[].get._TacIntToDouble.src = src[]
            src[] = nil
        }
    }
    self[].get._TacIntToDouble.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacIntToDouble.dst)"
        if dst[] ~= self[].get._TacIntToDouble.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacIntToDouble.dst)"
            free_TacValue(@self[].get._TacIntToDouble.dst)
            self[].get._TacIntToDouble.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacUIntToDouble(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacUIntToDouble_t
    self[].get._TacUIntToDouble.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacUIntToDouble.src)"
        if src[] ~= self[].get._TacUIntToDouble.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacUIntToDouble.src)"
            free_TacValue(@self[].get._TacUIntToDouble.src)
            self[].get._TacUIntToDouble.src = src[]
            src[] = nil
        }
    }
    self[].get._TacUIntToDouble.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacUIntToDouble.dst)"
        if dst[] ~= self[].get._TacUIntToDouble.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacUIntToDouble.dst)"
            free_TacValue(@self[].get._TacUIntToDouble.dst)
            self[].get._TacUIntToDouble.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacFunCall(name: u64, args: ***struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacFunCall_t
    self[].get._TacFunCall.name = name
    self[].get._TacFunCall.args = nil
    if args[] ~= self[].get._TacFunCall.args {
        if self[].get._TacFunCall.args {
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunCall.args) then free((cast<*struc stbds_array_header>((self[].get._TacFunCall.args)) - 1)) else cast<none>(0)))
                (self[].get._TacFunCall.args) = nil
            }
            self[].get._TacFunCall.args = nil
        }
        self[].get._TacFunCall.args = args[]
        args[] = nil
    }
    self[].get._TacFunCall.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacFunCall.dst)"
        if dst[] ~= self[].get._TacFunCall.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacFunCall.dst)"
            free_TacValue(@self[].get._TacFunCall.dst)
            self[].get._TacFunCall.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacUnary(unop: *struc TacUnaryOp, src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacUnary_t
    self[].get._TacUnary.unop = unop[]
    self[].get._TacUnary.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacUnary.src)"
        if src[] ~= self[].get._TacUnary.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacUnary.src)"
            free_TacValue(@self[].get._TacUnary.src)
            self[].get._TacUnary.src = src[]
            src[] = nil
        }
    }
    self[].get._TacUnary.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacUnary.dst)"
        if dst[] ~= self[].get._TacUnary.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacUnary.dst)"
            free_TacValue(@self[].get._TacUnary.dst)
            self[].get._TacUnary.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacBinary(binop: *struc TacBinaryOp, src1: **struc TacValue, src2: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacBinary_t
    self[].get._TacBinary.binop = binop[]
    self[].get._TacBinary.src1 = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src1, self->get._TacBinary.src1)"
        if src1[] ~= self[].get._TacBinary.src1 {
            "@MACRO@:uptr_move(TacValue, *src1, self->get._TacBinary.src1)"
            free_TacValue(@self[].get._TacBinary.src1)
            self[].get._TacBinary.src1 = src1[]
            src1[] = nil
        }
    }
    self[].get._TacBinary.src2 = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src2, self->get._TacBinary.src2)"
        if src2[] ~= self[].get._TacBinary.src2 {
            "@MACRO@:uptr_move(TacValue, *src2, self->get._TacBinary.src2)"
            free_TacValue(@self[].get._TacBinary.src2)
            self[].get._TacBinary.src2 = src2[]
            src2[] = nil
        }
    }
    self[].get._TacBinary.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacBinary.dst)"
        if dst[] ~= self[].get._TacBinary.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacBinary.dst)"
            free_TacValue(@self[].get._TacBinary.dst)
            self[].get._TacBinary.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacCopy(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacCopy_t
    self[].get._TacCopy.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacCopy.src)"
        if src[] ~= self[].get._TacCopy.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacCopy.src)"
            free_TacValue(@self[].get._TacCopy.src)
            self[].get._TacCopy.src = src[]
            src[] = nil
        }
    }
    self[].get._TacCopy.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacCopy.dst)"
        if dst[] ~= self[].get._TacCopy.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacCopy.dst)"
            free_TacValue(@self[].get._TacCopy.dst)
            self[].get._TacCopy.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacGetAddress(src: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacGetAddress_t
    self[].get._TacGetAddress.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacGetAddress.src)"
        if src[] ~= self[].get._TacGetAddress.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacGetAddress.src)"
            free_TacValue(@self[].get._TacGetAddress.src)
            self[].get._TacGetAddress.src = src[]
            src[] = nil
        }
    }
    self[].get._TacGetAddress.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacGetAddress.dst)"
        if dst[] ~= self[].get._TacGetAddress.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacGetAddress.dst)"
            free_TacValue(@self[].get._TacGetAddress.dst)
            self[].get._TacGetAddress.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacLoad(src_ptr: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacLoad_t
    self[].get._TacLoad.src_ptr = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src_ptr, self->get._TacLoad.src_ptr)"
        if src_ptr[] ~= self[].get._TacLoad.src_ptr {
            "@MACRO@:uptr_move(TacValue, *src_ptr, self->get._TacLoad.src_ptr)"
            free_TacValue(@self[].get._TacLoad.src_ptr)
            self[].get._TacLoad.src_ptr = src_ptr[]
            src_ptr[] = nil
        }
    }
    self[].get._TacLoad.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacLoad.dst)"
        if dst[] ~= self[].get._TacLoad.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacLoad.dst)"
            free_TacValue(@self[].get._TacLoad.dst)
            self[].get._TacLoad.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacStore(src: **struc TacValue, dst_ptr: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacStore_t
    self[].get._TacStore.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacStore.src)"
        if src[] ~= self[].get._TacStore.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacStore.src)"
            free_TacValue(@self[].get._TacStore.src)
            self[].get._TacStore.src = src[]
            src[] = nil
        }
    }
    self[].get._TacStore.dst_ptr = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst_ptr, self->get._TacStore.dst_ptr)"
        if dst_ptr[] ~= self[].get._TacStore.dst_ptr {
            "@MACRO@:uptr_move(TacValue, *dst_ptr, self->get._TacStore.dst_ptr)"
            free_TacValue(@self[].get._TacStore.dst_ptr)
            self[].get._TacStore.dst_ptr = dst_ptr[]
            dst_ptr[] = nil
        }
    }
    return self
}

pub fn make_TacAddPtr(scale: i64, src_ptr: **struc TacValue, idx: **struc TacValue, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacAddPtr_t
    self[].get._TacAddPtr.scale = scale
    self[].get._TacAddPtr.src_ptr = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src_ptr, self->get._TacAddPtr.src_ptr)"
        if src_ptr[] ~= self[].get._TacAddPtr.src_ptr {
            "@MACRO@:uptr_move(TacValue, *src_ptr, self->get._TacAddPtr.src_ptr)"
            free_TacValue(@self[].get._TacAddPtr.src_ptr)
            self[].get._TacAddPtr.src_ptr = src_ptr[]
            src_ptr[] = nil
        }
    }
    self[].get._TacAddPtr.idx = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *idx, self->get._TacAddPtr.idx)"
        if idx[] ~= self[].get._TacAddPtr.idx {
            "@MACRO@:uptr_move(TacValue, *idx, self->get._TacAddPtr.idx)"
            free_TacValue(@self[].get._TacAddPtr.idx)
            self[].get._TacAddPtr.idx = idx[]
            idx[] = nil
        }
    }
    self[].get._TacAddPtr.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacAddPtr.dst)"
        if dst[] ~= self[].get._TacAddPtr.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacAddPtr.dst)"
            free_TacValue(@self[].get._TacAddPtr.dst)
            self[].get._TacAddPtr.dst = dst[]
            dst[] = nil
        }
    }
    return self
}

pub fn make_TacCopyToOffset(dst_name: u64, offset: i64, src: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacCopyToOffset_t
    self[].get._TacCopyToOffset.dst_name = dst_name
    self[].get._TacCopyToOffset.offset = offset
    self[].get._TacCopyToOffset.src = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *src, self->get._TacCopyToOffset.src)"
        if src[] ~= self[].get._TacCopyToOffset.src {
            "@MACRO@:uptr_move(TacValue, *src, self->get._TacCopyToOffset.src)"
            free_TacValue(@self[].get._TacCopyToOffset.src)
            self[].get._TacCopyToOffset.src = src[]
            src[] = nil
        }
    }
    return self
}

pub fn make_TacCopyFromOffset(src_name: u64, offset: i64, dst: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacCopyFromOffset_t
    self[].get._TacCopyFromOffset.src_name = src_name
    self[].get._TacCopyFromOffset.offset = offset
    self[].get._TacCopyFromOffset.dst = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *dst, self->get._TacCopyFromOffset.dst)"
        if dst[] ~= self[].get._TacCopyFromOffset.dst {
            "@MACRO@:uptr_move(TacValue, *dst, self->get._TacCopyFromOffset.dst)"
            free_TacValue(@self[].get._TacCopyFromOffset.dst)
            self[].get._TacCopyFromOffset.dst = dst[]
            dst[] = nil
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
    self[].get._TacJumpIfZero.condition = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *condition, self->get._TacJumpIfZero.condition)"
        if condition[] ~= self[].get._TacJumpIfZero.condition {
            "@MACRO@:uptr_move(TacValue, *condition, self->get._TacJumpIfZero.condition)"
            free_TacValue(@self[].get._TacJumpIfZero.condition)
            self[].get._TacJumpIfZero.condition = condition[]
            condition[] = nil
        }
    }
    return self
}

pub fn make_TacJumpIfNotZero(target: u64, condition: **struc TacValue) *struc TacInstruction {
    self: *struc TacInstruction = make_TacInstruction()
    self[].tag = AST_TacJumpIfNotZero_t
    self[].get._TacJumpIfNotZero.target = target
    self[].get._TacJumpIfNotZero.condition = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, *condition, self->get._TacJumpIfNotZero.condition)"
        if condition[] ~= self[].get._TacJumpIfNotZero.condition {
            "@MACRO@:uptr_move(TacValue, *condition, self->get._TacJumpIfNotZero.condition)"
            free_TacValue(@self[].get._TacJumpIfNotZero.condition)
            self[].get._TacJumpIfNotZero.condition = condition[]
            condition[] = nil
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
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacFunCall.args) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunCall.args)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacFunCall.args) = nil
            }
            (self[])[].get._TacFunCall.args = nil
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
        self[] = nil
    }
}

pub fn make_TacTopLevel(none) *struc TacTopLevel {
    self: *struc TacTopLevel = nil
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
    self[].get._TacFunction.params = nil
    if params[] ~= self[].get._TacFunction.params {
        if self[].get._TacFunction.params {
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunction.params) then free((cast<*struc stbds_array_header>((self[].get._TacFunction.params)) - 1)) else cast<none>(0)))
                (self[].get._TacFunction.params) = nil
            }
            self[].get._TacFunction.params = nil
        }
        self[].get._TacFunction.params = params[]
        params[] = nil
    }
    self[].get._TacFunction.body = nil
    if body[] ~= self[].get._TacFunction.body {
        if self[].get._TacFunction.body {
            loop .. while 0 {
                cast<none>((? (self[].get._TacFunction.body) then free((cast<*struc stbds_array_header>((self[].get._TacFunction.body)) - 1)) else cast<none>(0)))
                (self[].get._TacFunction.body) = nil
            }
            self[].get._TacFunction.body = nil
        }
        self[].get._TacFunction.body = body[]
        body[] = nil
    }
    return self
}

pub fn make_TacStaticVariable(name: u64, is_glob: i32, static_init_type: **struc Type, static_inits: ***struc StaticInit) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].tag = AST_TacStaticVariable_t
    self[].get._TacStaticVariable.name = name
    self[].get._TacStaticVariable.is_glob = is_glob
    self[].get._TacStaticVariable.static_init_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *static_init_type, self->get._TacStaticVariable.static_init_type)"
        if static_init_type[] ~= self[].get._TacStaticVariable.static_init_type {
            "@MACRO@:uptr_move(Type, *static_init_type, self->get._TacStaticVariable.static_init_type)"
            free_Type(@self[].get._TacStaticVariable.static_init_type)
            self[].get._TacStaticVariable.static_init_type = static_init_type[]
            static_init_type[] = nil
        }
    }
    self[].get._TacStaticVariable.static_inits = nil
    if static_inits[] ~= self[].get._TacStaticVariable.static_inits {
        if self[].get._TacStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? (self[].get._TacStaticVariable.static_inits) then free((cast<*struc stbds_array_header>((self[].get._TacStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                (self[].get._TacStaticVariable.static_inits) = nil
            }
            self[].get._TacStaticVariable.static_inits = nil
        }
        self[].get._TacStaticVariable.static_inits = static_inits[]
        static_inits[] = nil
    }
    return self
}

pub fn make_TacStaticConstant(name: u64, static_init_type: **struc Type, static_init: **struc StaticInit) *struc TacTopLevel {
    self: *struc TacTopLevel = make_TacTopLevel()
    self[].tag = AST_TacStaticConstant_t
    self[].get._TacStaticConstant.name = name
    self[].get._TacStaticConstant.static_init_type = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, *static_init_type, self->get._TacStaticConstant.static_init_type)"
        if static_init_type[] ~= self[].get._TacStaticConstant.static_init_type {
            "@MACRO@:uptr_move(Type, *static_init_type, self->get._TacStaticConstant.static_init_type)"
            free_Type(@self[].get._TacStaticConstant.static_init_type)
            self[].get._TacStaticConstant.static_init_type = static_init_type[]
            static_init_type[] = nil
        }
    }
    self[].get._TacStaticConstant.static_init = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(StaticInit, *static_init, self->get._TacStaticConstant.static_init)"
        if static_init[] ~= self[].get._TacStaticConstant.static_init {
            "@MACRO@:uptr_move(StaticInit, *static_init, self->get._TacStaticConstant.static_init)"
            free_StaticInit(@self[].get._TacStaticConstant.static_init)
            self[].get._TacStaticConstant.static_init = static_init[]
            static_init[] = nil
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
                loop .. while 0 {
                    cast<none>((? ((self[])[].get._TacFunction.params) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunction.params)) - 1)) else cast<none>(0)))
                    ((self[])[].get._TacFunction.params) = nil
                }
                (self[])[].get._TacFunction.params = nil
            }
        }
        loop i: u64 = 0 while i < (? ((self[])[].get._TacFunction.body) then (cast<*struc stbds_array_header>(((self[])[].get._TacFunction.body)) - 1)[].length else 0) .. ++i {
            free_TacInstruction(@(self[])[].get._TacFunction.body[i])
        }
        if (self[])[].get._TacFunction.body {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacFunction.body) then free((cast<*struc stbds_array_header>(((self[])[].get._TacFunction.body)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacFunction.body) = nil
            }
            (self[])[].get._TacFunction.body = nil
        }
        break
        -> AST_TacStaticVariable_t {
            free_Type(@(self[])[].get._TacStaticVariable.static_init_type)
        }
        loop i: u64 = 0 while i < (? ((self[])[].get._TacStaticVariable.static_inits) then (cast<*struc stbds_array_header>(((self[])[].get._TacStaticVariable.static_inits)) - 1)[].length else 0) .. ++i {
            free_StaticInit(@(self[])[].get._TacStaticVariable.static_inits[i])
        }
        if (self[])[].get._TacStaticVariable.static_inits {
            loop .. while 0 {
                cast<none>((? ((self[])[].get._TacStaticVariable.static_inits) then free((cast<*struc stbds_array_header>(((self[])[].get._TacStaticVariable.static_inits)) - 1)) else cast<none>(0)))
                ((self[])[].get._TacStaticVariable.static_inits) = nil
            }
            (self[])[].get._TacStaticVariable.static_inits = nil
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
        self[] = nil
    }
}

pub fn make_TacProgram(static_const_toplvls: ***struc TacTopLevel, static_var_toplvls: ***struc TacTopLevel, fun_toplvls: ***struc TacTopLevel) *struc TacProgram {
    self: *struc TacProgram = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(TacProgram, self)"
        free_TacProgram(@self)
        self = cast<*struc TacProgram>(malloc(sizeof<struc TacProgram>))
        if not self {
            panic_sigabrt("alloc "                 "TacProgram")
        }
    }
    self[].tag = AST_TacProgram_t
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
    self[].static_var_toplvls = nil
    if static_var_toplvls[] ~= self[].static_var_toplvls {
        if self[].static_var_toplvls {
            loop .. while 0 {
                cast<none>((? (self[].static_var_toplvls) then free((cast<*struc stbds_array_header>((self[].static_var_toplvls)) - 1)) else cast<none>(0)))
                (self[].static_var_toplvls) = nil
            }
            self[].static_var_toplvls = nil
        }
        self[].static_var_toplvls = static_var_toplvls[]
        static_var_toplvls[] = nil
    }
    self[].fun_toplvls = nil
    if fun_toplvls[] ~= self[].fun_toplvls {
        if self[].fun_toplvls {
            loop .. while 0 {
                cast<none>((? (self[].fun_toplvls) then free((cast<*struc stbds_array_header>((self[].fun_toplvls)) - 1)) else cast<none>(0)))
                (self[].fun_toplvls) = nil
            }
            self[].fun_toplvls = nil
        }
        self[].fun_toplvls = fun_toplvls[]
        fun_toplvls[] = nil
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
        loop .. while 0 {
            cast<none>((? ((self[])[].static_const_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_const_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_const_toplvls) = nil
        }
        (self[])[].static_const_toplvls = nil
    }
    loop i: u64 = 0 while i < (? ((self[])[].static_var_toplvls) then (cast<*struc stbds_array_header>(((self[])[].static_var_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].static_var_toplvls[i])
    }
    if (self[])[].static_var_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].static_var_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].static_var_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].static_var_toplvls) = nil
        }
        (self[])[].static_var_toplvls = nil
    }
    loop i: u64 = 0 while i < (? ((self[])[].fun_toplvls) then (cast<*struc stbds_array_header>(((self[])[].fun_toplvls)) - 1)[].length else 0) .. ++i {
        free_TacTopLevel(@(self[])[].fun_toplvls[i])
    }
    if (self[])[].fun_toplvls {
        loop .. while 0 {
            cast<none>((? ((self[])[].fun_toplvls) then free((cast<*struc stbds_array_header>(((self[])[].fun_toplvls)) - 1)) else cast<none>(0)))
            ((self[])[].fun_toplvls) = nil
        }
        (self[])[].fun_toplvls = nil
    }
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
}
