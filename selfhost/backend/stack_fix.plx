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
type struc AsmReg;
type struc AsmOperand;
pub fn gen_register(reg_kind: i32) *struc AsmOperand;
pub fn gen_memory(reg_kind: i32, value: i64) *struc AsmOperand;
pub fn gen_indexed(reg_kind_base: i32, reg_kind_idx: i32, scale: i64) *struc AsmOperand;
pub fn register_mask_kind(node: *struc AsmReg) i32;
pub fn register_mask_bit(reg_kind: i32) u64;
pub fn register_mask_get(reg_mask: u64, reg_kind: i32) i32;
pub fn register_mask_set(reg_mask: *u64, reg_kind: i32, value: i32) none;
type struc AsmInstruction;
type struc AsmProgram;
type struc BackEndContext;
pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction;
pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none;
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

type struc PairTIdentifierTLong(key: u64, value: i64)

type struc StackFixContext(backend: *struc BackEndContext, stack_bytes: i64, pseudo_stack_map: *struc PairTIdentifierTLong, p_fix_instrs: ***struc AsmInstruction)

m4_define(`Ctx', `TODO')m4_dnl

fn pseudo_data(node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    name: u64 = node[].name
    free_AsmOperand(pseudo_op)
    pseudo_op[] = make_AsmData(name, 0l)
}

fn pseudo_mem_data(node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    name: u64 = node[].name
    offset: i64 = node[].offset
    free_AsmOperand(pseudo_op)
    pseudo_op[] = make_AsmData(name, offset)
}

fn pseudo_memory(ctx: *struc StackFixContext, node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    value: i64 = -1l * ((? ((? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp])[].value)
    free_AsmOperand(pseudo_op)
    pseudo_op[] = gen_memory(REG_Bp, value)
}

fn pseudo_mem_memory(ctx: *struc StackFixContext, node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    value: i64 = -1l * (((? ((? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp])[].value) - node[].offset)
    free_AsmOperand(pseudo_op)
    pseudo_op[] = gen_memory(REG_Bp, value)
}

fn align_offset_stack_bytes(ctx: *struc StackFixContext, alignment: i32) none {
    offset: i64 = ctx[].stack_bytes % alignment
    if offset ~= 0l {
        ctx[].stack_bytes += alignment - offset
    }
}

fn align_offset_pseudo(ctx: *struc StackFixContext, size: i64, alignment: i32) none {
    ctx[].stack_bytes += size
    align_offset_stack_bytes(ctx, alignment)
}

fn alloc_offset_pseudo(ctx: *struc StackFixContext, asm_type: *struc AssemblyType) none {
    match asm_type[].tag {
        -> AST_Byte_t {
            align_offset_pseudo(ctx, 1l, 1)
        }
        break
        -> AST_LongWord_t {
            align_offset_pseudo(ctx, 4l, 4)
        }
        break
        -> AST_QuadWord_t {
            -> AST_BackendDouble_t {
                align_offset_pseudo(ctx, 8l, 8)
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn alloc_offset_pseudo_mem(ctx: *struc StackFixContext, asm_type: *struc AssemblyType) none {
    if asm_type[].tag == AST_ByteArray_t {
        bytearray_type: *struc ByteArray = @asm_type[].get._ByteArray
        align_offset_pseudo(ctx, bytearray_type[].size, bytearray_type[].alignment)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn repl_pseudo_op(ctx: *struc StackFixContext, node: *struc AsmPseudo, pseudo_op: **struc AsmOperand) none {
    if (? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp) == -1 {
        backend_obj: *struc BackendObj = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendObj
        if backend_obj[].is_static {
            pseudo_data(node, pseudo_op)
            return none
        }
        else {
            alloc_offset_pseudo(ctx, backend_obj[].asm_type)
            loop .. while 0 {
                (ctx[].pseudo_stack_map) = stbds_hmput_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].value = (ctx[].stack_bytes)
            }
        }
    }
    pseudo_memory(ctx, node, pseudo_op)
}

fn repl_pseudo_mem_op(ctx: *struc StackFixContext, node: *struc AsmPseudoMem, pseudo_op: **struc AsmOperand) none {
    if (? ((ctx[].pseudo_stack_map) = stbds_hmget_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp) == -1 {
        backend_obj: *struc BackendObj = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendObj
        if backend_obj[].is_static {
            pseudo_mem_data(node, pseudo_op)
            return none
        }
        else {
            alloc_offset_pseudo_mem(ctx, backend_obj[].asm_type)
            loop .. while 0 {
                (ctx[].pseudo_stack_map) = stbds_hmput_key((ctx[].pseudo_stack_map), sizeof((ctx[].pseudo_stack_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].pseudo_stack_map)[].key), 0)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].pseudo_stack_map)[(cast<*struc stbds_array_header>(((ctx[].pseudo_stack_map) - 1)) - 1)[].temp].value = (ctx[].stack_bytes)
            }
        }
    }
    pseudo_mem_memory(ctx, node, pseudo_op)
}

fn repl_mov_pseudo(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_mov_sx_pseudo(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_zero_extend_pseudo(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_lea_pseudo(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_cvttsd2si_pseudo(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_cvtsi2sd_pseudo(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_unary(ctx: *struc StackFixContext, node: *struc AsmUnary) none {
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_binary_pseudo(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_cmp_pseudo(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_idiv_pseudo(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_div_pseudo(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_set_cc_pseudo(ctx: *struc StackFixContext, node: *struc AsmSetCC) none {
    match node[].dst[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].dst[].get._AsmPseudo, @node[].dst)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].dst[].get._AsmPseudoMem, @node[].dst)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_push_pseudo(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    match node[].src[].tag {
        -> AST_AsmPseudo_t {
            repl_pseudo_op(ctx, @node[].src[].get._AsmPseudo, @node[].src)
        }
        break
        -> AST_AsmPseudoMem_t {
            repl_pseudo_mem_op(ctx, @node[].src[].get._AsmPseudoMem, @node[].src)
        }
        break
        otherwise {
            break
        }
    }
}

fn repl_pseudo_regs(ctx: *struc StackFixContext, node: *struc AsmInstruction) none {
    match node[].tag {
        -> AST_AsmMov_t {
            repl_mov_pseudo(ctx, @node[].get._AsmMov)
        }
        break
        -> AST_AsmMovSx_t {
            repl_mov_sx_pseudo(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            repl_zero_extend_pseudo(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            repl_lea_pseudo(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            repl_cvttsd2si_pseudo(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            repl_cvtsi2sd_pseudo(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            repl_unary(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            repl_binary_pseudo(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            repl_cmp_pseudo(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            repl_idiv_pseudo(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            repl_div_pseudo(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmSetCC_t {
            repl_set_cc_pseudo(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmPush_t {
            repl_push_pseudo(ctx, @node[].get._AsmPush)
        }
        break
        otherwise {
            break
        }
    }
}

pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction {
    binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmSub_t)
    asm_type: *struc AssemblyType = make_QuadWord()

    src: *struc AsmOperand = nil
    {
        value: u64 = cast<u64>(byte)
        is_byte: i32 = byte <= 127l and byte >= -128l
        is_quad: i32 = byte > 2147483647l or byte < -2147483648l
        is_neg: i32 = byte < 0l
        src = make_AsmImm(value, is_byte, is_quad, is_neg)
    }
    dst: *struc AsmOperand = gen_register(REG_Sp)
    return make_AsmBinary(@binop, @asm_type, @src, @dst)
}

fn push_fix_instr(ctx: *struc StackFixContext, instr: *struc AsmInstruction) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_fix_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].capacity) then (((ctx[].p_fix_instrs[]) = stbds_arrgrowf((ctx[].p_fix_instrs[]), sizeof((ctx[].p_fix_instrs[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_fix_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length++] = (instr)
        }
        instr = nil
    }
}

fn swap_fix_instr_back(ctx: *struc StackFixContext) none {
    swap_instr: *struc AsmInstruction = nil
    instr_back_1: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
    instr_back_2: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 2]
    if instr_back_1[] ~= swap_instr {
        "@MACRO@:uptr_move(AsmInstruction, *instr_back_1, swap_instr)"
        free_AsmInstruction(@swap_instr)
        swap_instr = instr_back_1[]
        instr_back_1[] = nil
    }
    if instr_back_2[] ~= instr_back_1[] {
        "@MACRO@:uptr_move(AsmInstruction, *instr_back_2, *instr_back_1)"
        free_AsmInstruction(@instr_back_1[])
        instr_back_1[] = instr_back_2[]
        instr_back_2[] = nil
    }
    if swap_instr ~= instr_back_2[] {
        "@MACRO@:uptr_move(AsmInstruction, swap_instr, *instr_back_2)"
        free_AsmInstruction(@instr_back_2[])
        instr_back_2[] = swap_instr
        swap_instr = nil
    }
}

fn fix_alloc_stack_bytes(ctx: *struc StackFixContext, callee_saved_size: i64) none {
    callee_saved_bytes: i64 = callee_saved_size * 8l
    ctx[].stack_bytes += callee_saved_bytes
    if ctx[].stack_bytes > 0l {
        align_offset_stack_bytes(ctx, 16)
        ctx[].stack_bytes -= callee_saved_bytes
        (ctx[].p_fix_instrs[])[0] = alloc_stack_bytes(ctx[].stack_bytes)
    }
}

fn push_callee_saved_regs(ctx: *struc StackFixContext, callee_saved_regs: **struc AsmOperand) none {
    loop i: u64 = 0 while i < (? (callee_saved_regs) then (cast<*struc stbds_array_header>((callee_saved_regs)) - 1)[].length else 0) .. ++i {
        src: *struc AsmOperand = nil
        if callee_saved_regs[i] ~= src {
            "@MACRO@:sptr_copy(AsmOperand, callee_saved_regs[i], src)"
            free_AsmOperand(@src)
            src = callee_saved_regs[i]
            (src)[]._ref_count++
        }
        push_fix_instr(ctx, make_AsmPush(@src))
    }
}

fn pop_callee_saved_regs(ctx: *struc StackFixContext, callee_saved_regs: **struc AsmOperand) none {
    loop i: u64 = (? (callee_saved_regs) then (cast<*struc stbds_array_header>((callee_saved_regs)) - 1)[].length else 0) while i-- > 0 {
        reg_kind: i32 = register_mask_kind(@callee_saved_regs[i][].get._AsmRegister.reg)
        reg: struc AsmReg = make_AsmReg(AST_AsmReg_t)
        match reg_kind {
            -> REG_Bx {
                reg = make_AsmReg(AST_AsmBx_t)
                break
            }
            -> REG_R12 {
                reg = make_AsmReg(AST_AsmR12_t)
                break
            }
            -> REG_R13 {
                reg = make_AsmReg(AST_AsmR13_t)
                break
            }
            -> REG_R14 {
                reg = make_AsmReg(AST_AsmR14_t)
                break
            }
            -> REG_R15 {
                reg = make_AsmReg(AST_AsmR15_t)
                break
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        push_fix_instr(ctx, make_AsmPop(@reg))
    }
}

fn is_op_addr(node: *struc AsmOperand) i32 {
    match node[].tag {
        -> AST_AsmMemory_t {
            -> AST_AsmData_t {
                -> AST_AsmIndexed_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn mov_dbl_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Xmm14)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn mov_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    if node[].dst[].tag == AST_AsmRegister_t {
        if node[].asm_type[].tag ~= AST_QuadWord_t {
            free_AssemblyType(@node[].asm_type)
            node[].asm_type = make_QuadWord()
        }
        return none
    }
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn mov_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_mov_instr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            mov_dbl_from_addr_to_addr(ctx, node)
        }
    }
    else {
        if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
            mov_from_quad_imm(ctx, node)
        }
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            mov_from_addr_to_addr(ctx, node)
        }
    }
}

fn mov_sx_from_imm(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type_src ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type_src, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_src
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn mov_sx_to_addr(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = nil
    if node[].asm_type_dst ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type_dst, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_dst
        (asm_type)[]._ref_count++
    }
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_mov_sx_instr(ctx: *struc StackFixContext, node: *struc AsmMovSx) none {
    if node[].src[].tag == AST_AsmImm_t {
        mov_sx_from_imm(ctx, node)
    }
    if is_op_addr(node[].dst) {
        mov_sx_to_addr(ctx, node)
    }
}

fn byte_zero_extend_from_imm(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_Byte()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn byte_zero_extend_to_addr(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = nil
    if node[].asm_type_dst ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type_dst, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type_dst
        (asm_type)[]._ref_count++
    }
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn zero_extend_as_mov(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) *struc AsmMov {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = make_LongWord()
    instr_back: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
    free_AsmInstruction(instr_back)
    instr_back[] = make_AsmMov(@asm_type, @src, @dst)
    return @(instr_back[])[].get._AsmMov
}

fn zero_extend_to_addr(ctx: *struc StackFixContext, node: *struc AsmMov) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = make_QuadWord()
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_zero_extend_instr(ctx: *struc StackFixContext, node: *struc AsmMovZeroExtend) none {
    if node[].asm_type_src[].tag == AST_Byte_t {
        if node[].src[].tag == AST_AsmImm_t {
            byte_zero_extend_from_imm(ctx, node)
        }
        if is_op_addr(node[].dst) {
            byte_zero_extend_to_addr(ctx, node)
        }
    }
    else {
        mov: *struc AsmMov = zero_extend_as_mov(ctx, node)
        if is_op_addr(mov[].dst) {
            zero_extend_to_addr(ctx, mov)
        }
    }
}

fn lea_to_addr(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = make_QuadWord()
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_lea_instr(ctx: *struc StackFixContext, node: *struc AsmLea) none {
    if is_op_addr(node[].dst) {
        lea_to_addr(ctx, node)
    }
}

fn cvttsd2si_to_addr(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    src: *struc AsmOperand = gen_register(REG_R11)
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_cvttsd2si_instr(ctx: *struc StackFixContext, node: *struc AsmCvttsd2si) none {
    if is_op_addr(node[].dst) {
        cvttsd2si_to_addr(ctx, node)
    }
}

fn cvtsi2sd_from_imm(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cvtsi2sd_to_addr(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    src: *struc AsmOperand = gen_register(REG_Xmm15)
    dst: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, dst)"
        if node[].dst ~= dst {
            "@MACRO@:uptr_move(AsmOperand, node->dst, dst)"
            free_AsmOperand(@dst)
            dst = node[].dst
            node[].dst = nil
        }
    }
    asm_type: *struc AssemblyType = make_BackendDouble()
    if src ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, src, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = src
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
}

fn fix_cvtsi2sd_instr(ctx: *struc StackFixContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].tag == AST_AsmImm_t {
        cvtsi2sd_from_imm(ctx, node)
    }
    if is_op_addr(node[].dst) {
        cvtsi2sd_to_addr(ctx, node)
    }
}

fn binary_dbl_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Xmm15)
    asm_type: *struc AssemblyType = make_BackendDouble()
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    {
        src_cp: *struc AsmOperand = nil
        if src ~= src_cp {
            "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        dst_cp: *struc AsmOperand = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        asm_type_cp: *struc AssemblyType = nil
        if asm_type ~= asm_type_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type, asm_type_cp)"
            free_AssemblyType(@asm_type_cp)
            asm_type_cp = asm_type
            (asm_type_cp)[]._ref_count++
        }
        push_fix_instr(ctx, make_AsmMov(@asm_type_cp, @src_cp, @dst_cp))
    }
    swap_fix_instr_back(ctx)
    push_fix_instr(ctx, make_AsmMov(@asm_type, @dst, @src))
}

fn binary_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn binary_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn binary_imul_to_addr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R11)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    {
        src_cp: *struc AsmOperand = nil
        if src ~= src_cp {
            "@MACRO@:sptr_copy(AsmOperand, src, src_cp)"
            free_AsmOperand(@src_cp)
            src_cp = src
            (src_cp)[]._ref_count++
        }
        dst_cp: *struc AsmOperand = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(AsmOperand, dst, dst_cp)"
            free_AsmOperand(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        asm_type_cp: *struc AssemblyType = nil
        if asm_type ~= asm_type_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type, asm_type_cp)"
            free_AssemblyType(@asm_type_cp)
            asm_type_cp = asm_type
            (asm_type_cp)[]._ref_count++
        }
        push_fix_instr(ctx, make_AsmMov(@asm_type_cp, @src_cp, @dst_cp))
    }
    swap_fix_instr_back(ctx)
    push_fix_instr(ctx, make_AsmMov(@asm_type, @dst, @src))
}

fn binary_shx_from_not_imm(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    if node[].src[].tag == AST_AsmRegister_t and register_mask_kind(@node[].src[].get._AsmRegister.reg) == REG_Cx {
        return none
    }
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Cx)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_binary_instr(ctx: *struc StackFixContext, node: *struc AsmBinary) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        if is_op_addr(node[].dst) {
            binary_dbl_to_addr(ctx, node)
        }
    }
    else {
        match node[].binop.tag {
            -> AST_AsmAdd_t {
                -> AST_AsmSub_t {
                    -> AST_AsmBitAnd_t {
                        -> AST_AsmBitOr_t {
                            -> AST_AsmBitXor_t {
                                if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
                                    binary_from_quad_imm(ctx, node)
                                }
                                if is_op_addr(node[].src) and is_op_addr(node[].dst) {
                                    binary_from_addr_to_addr(ctx, node)
                                }
                                break
                            }
                        }
                    }
                }
            }
            -> AST_AsmMult_t {
                if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
                    binary_from_quad_imm(ctx, node)
                }
                if is_op_addr(node[].dst) {
                    binary_imul_to_addr(ctx, node)
                }
                break
            }
            -> AST_AsmBitShiftLeft_t {
                -> AST_AsmBitShiftRight_t {
                    -> AST_AsmBitShrArithmetic_t {
                        if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
                            binary_from_quad_imm(ctx, node)
                        }
                        if node[].src[].tag ~= AST_AsmImm_t {
                            binary_shx_from_not_imm(ctx, node)
                        }
                        break
                    }
                }
            }
            otherwise {
                break
            }
        }
    }
}

fn cmp_dbl_to_addr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_Xmm15)
    asm_type: *struc AssemblyType = make_BackendDouble()
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cmp_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cmp_from_addr_to_addr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn cmp_to_imm(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->dst, src)"
        if node[].dst ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->dst, src)"
            free_AsmOperand(@src)
            src = node[].dst
            node[].dst = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R11)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].dst {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->dst)"
        free_AsmOperand(@node[].dst)
        node[].dst = dst
        (node[].dst)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_cmp_instr(ctx: *struc StackFixContext, node: *struc AsmCmp) none {
    if node[].asm_type[].tag == AST_BackendDouble_t {
        if is_op_addr(node[].dst) {
            cmp_dbl_to_addr(ctx, node)
        }
    }
    else {
        if node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
            cmp_from_quad_imm(ctx, node)
        }
        if is_op_addr(node[].src) and is_op_addr(node[].dst) {
            cmp_from_addr_to_addr(ctx, node)
        }
        elif node[].dst[].tag == AST_AsmImm_t {
            cmp_to_imm(ctx, node)
        }
    }
}

fn idiv_from_imm(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_idiv_instr(ctx: *struc StackFixContext, node: *struc AsmIdiv) none {
    if node[].src[].tag == AST_AsmImm_t {
        idiv_from_imm(ctx, node)
    }
}

fn div_from_imm(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = nil
    if node[].asm_type ~= asm_type {
        "@MACRO@:sptr_copy(AssemblyType, node->asm_type, asm_type)"
        free_AssemblyType(@asm_type)
        asm_type = node[].asm_type
        (asm_type)[]._ref_count++
    }
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_div_instr(ctx: *struc StackFixContext, node: *struc AsmDiv) none {
    if node[].src[].tag == AST_AsmImm_t {
        div_from_imm(ctx, node)
    }
}

fn push_dbl_from_xmm_reg(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    src_reg: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src_reg)"
        if node[].src ~= src_reg {
            "@MACRO@:uptr_move(AsmOperand, node->src, src_reg)"
            free_AsmOperand(@src_reg)
            src_reg = node[].src
            node[].src = nil
        }
    }

    asm_type_src: *struc AssemblyType = make_QuadWord()
    {
        binop: struc AsmBinaryOp = make_AsmBinaryOp(AST_AsmSub_t)
        src: *struc AsmOperand = make_AsmImm(8ul, true, false, false)
        dst: *struc AsmOperand = gen_register(REG_Sp)
        asm_type_src_cp: *struc AssemblyType = nil
        if asm_type_src ~= asm_type_src_cp {
            "@MACRO@:sptr_copy(AssemblyType, asm_type_src, asm_type_src_cp)"
            free_AssemblyType(@asm_type_src_cp)
            asm_type_src_cp = asm_type_src
            (asm_type_src_cp)[]._ref_count++
        }
        instr_back: **struc AsmInstruction = @(ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1]
        free_AsmInstruction(instr_back)
        instr_back[] = make_AsmBinary(@binop, @asm_type_src_cp, @src, @dst)
    }

    {
        dst: *struc AsmOperand = gen_memory(REG_Sp, 0l)
        push_fix_instr(ctx, make_AsmMov(@asm_type_src, @src_reg, @dst))
    }
}

fn push_from_quad_imm(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    src: *struc AsmOperand = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(AsmOperand, node->src, src)"
        if node[].src ~= src {
            "@MACRO@:uptr_move(AsmOperand, node->src, src)"
            free_AsmOperand(@src)
            src = node[].src
            node[].src = nil
        }
    }
    dst: *struc AsmOperand = gen_register(REG_R10)
    asm_type: *struc AssemblyType = make_QuadWord()
    if dst ~= node[].src {
        "@MACRO@:sptr_copy(AsmOperand, dst, node->src)"
        free_AsmOperand(@node[].src)
        node[].src = dst
        (node[].src)[]._ref_count++
    }
    push_fix_instr(ctx, make_AsmMov(@asm_type, @src, @dst))
    swap_fix_instr_back(ctx)
}

fn fix_push_instr(ctx: *struc StackFixContext, node: *struc AsmPush) none {
    if node[].src[].tag == AST_AsmRegister_t {
        reg_kind: i32 = register_mask_kind(@node[].src[].get._AsmRegister.reg)
        if reg_kind ~= REG_Sp and register_mask_bit(reg_kind) > 11 {
            push_dbl_from_xmm_reg(ctx, node)
        }
    }
    elif node[].src[].tag == AST_AsmImm_t and node[].src[].get._AsmImm.is_quad {
        push_from_quad_imm(ctx, node)
    }
}

fn fix_instr(ctx: *struc StackFixContext, node: *struc AsmInstruction) none {
    match node[].tag {
        -> AST_AsmMov_t {
            fix_mov_instr(ctx, @node[].get._AsmMov)
        }
        break
        -> AST_AsmMovSx_t {
            fix_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            fix_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            fix_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            fix_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            fix_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmBinary_t {
            fix_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            fix_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            fix_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            fix_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmPush_t {
            fix_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        otherwise {
            break
        }
    }
}

fn fix_fun_toplvl(ctx: *struc StackFixContext, node: *struc AsmFunction) none {
    instructions: **struc AsmInstruction = nil
    if node[].instructions ~= instructions {
        if instructions {
            loop .. while 0 {
                cast<none>((? (instructions) then free((cast<*struc stbds_array_header>((instructions)) - 1)) else cast<none>(0)))
                (instructions) = nil
            }
            instructions = nil
        }
        instructions = node[].instructions
        node[].instructions = nil
    }
    backend_fun: *struc BackendFun = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendFun
    if node[].instructions {
        (cast<*struc stbds_array_header>((node[].instructions)) - 1)[].length = 0
    }
    (((node[].instructions) = stbds_arrgrowf((node[].instructions), sizeof((node[].instructions)[]), (0), ((? (instructions) then (cast<*struc stbds_array_header>((instructions)) - 1)[].length else 0)))))
    ctx[].stack_bytes = ? node[].is_ret_memory then 8l else 0l
    if ctx[].pseudo_stack_map {
        loop .. while 0 {
            cast<none>((? (ctx[].pseudo_stack_map) ~= nil then stbds_hmfree_func((ctx[].pseudo_stack_map) - 1, sizeof((ctx[].pseudo_stack_map)[])) else cast<none>(0)))
            (ctx[].pseudo_stack_map) = nil
        }
        ctx[].pseudo_stack_map = nil
    }
    ctx[].p_fix_instrs = @node[].instructions
    loop .. while 0 {
        (? (not (ctx[].p_fix_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].capacity) then (((ctx[].p_fix_instrs[]) = stbds_arrgrowf((ctx[].p_fix_instrs[]), sizeof((ctx[].p_fix_instrs[])[]), (1), (0))) and 0) else 0)
        (ctx[].p_fix_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length++] = (nil)
    }
    is_ret: i32 = false
    push_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
    loop i: u64 = 0 while i < (? (instructions) then (cast<*struc stbds_array_header>((instructions)) - 1)[].length else 0) .. ++i {
        if instructions[i] {
            if instructions[i][].tag == AST_AsmRet_t {
                pop_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
                is_ret = true
            }
            push_fix_instr(ctx, instructions[i])
            instructions[i] = nil
            repl_pseudo_regs(ctx, (ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1])
            fix_instr(ctx, (ctx[].p_fix_instrs[])[(? (ctx[].p_fix_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_fix_instrs[])) - 1)[].length else 0) - 1])
        }
    }
    if not is_ret {
        pop_callee_saved_regs(ctx, backend_fun[].callee_saved_regs)
    }
    {
        callee_saved_size: i64 = cast<i64>((? (backend_fun[].callee_saved_regs) then (cast<*struc stbds_array_header>((backend_fun[].callee_saved_regs)) - 1)[].length else 0))
        fix_alloc_stack_bytes(ctx, callee_saved_size)
    }
    ctx[].p_fix_instrs = nil
    if instructions {
        loop .. while 0 {
            cast<none>((? (instructions) then free((cast<*struc stbds_array_header>((instructions)) - 1)) else cast<none>(0)))
            (instructions) = nil
        }
        instructions = nil
    }
}

fn fix_toplvl(ctx: *struc StackFixContext, node: *struc AsmTopLevel) none {
    match node[].tag {
        -> AST_AsmFunction_t {
            fix_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> AST_AsmStaticVariable_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fix_program(ctx: *struc StackFixContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        fix_toplvl(ctx, node[].top_levels[i])
    }
}

pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none {
    ctx: struc StackFixContext;
    {
        ctx.backend = backend
        ctx.stack_bytes = 0l
        ctx.pseudo_stack_map = nil
    }

    fix_program(@ctx, node)
    if ctx.pseudo_stack_map {
        loop .. while 0 {
            cast<none>((? (ctx.pseudo_stack_map) ~= nil then stbds_hmfree_func((ctx.pseudo_stack_map) - 1, sizeof((ctx.pseudo_stack_map)[])) else cast<none>(0)))
            (ctx.pseudo_stack_map) = nil
        }
        ctx.pseudo_stack_map = nil
    }
}
