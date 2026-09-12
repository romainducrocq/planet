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
type struc FileIoContext;
type struc IdentifierContext;

type struc Token(tok_kind: i32, tok: u64, info_at: u64)

pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32;
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

type struc Elementhash_t(key: u64, value: char)

type struc LexerContext(errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, line: string, line_size: u64, match_at: u64, match_size: u64, includename_set: *struc Elementhash_t, p_includedirs: **string, p_stdlibdirs: **string, p_toks: **struc Token, paren_depth: u64, total_linenum: u64)

m4_define(`Ctx', `TODO')m4_dnl

fn get_char(ctx: *struc LexerContext) char {
    i: u64 = ctx[].match_at + ctx[].match_size
    if i < ctx[].line_size {
        return ctx[].line[i]
    }
    else {
        return 0
    }
}

m4_define(`LEX_SPACE', `TODO')m4_dnl
m4_define(`LEX_DIGIT', `TODO')m4_dnl
m4_define(`LEX_LETTER', `TODO')m4_dnl
m4_define(`LEX_WORD', `TODO')m4_dnl

fn match_char(ctx: *struc LexerContext, c: char) i32 {
    if c == get_char(ctx) {
        ctx[].match_size++
        return true
    }
    else {
        return false
    }
}

fn match_chars(ctx: *struc LexerContext, cs: string, n: u64) i32 {
    loop i: u64 = 0 while i < n .. ++i {
        if not match_char(ctx, cs[i]) {
            return false
        }
    }
    return true
}

fn match_invert(ctx: *struc LexerContext, c: char) i32 {
    inv: char = get_char(ctx)
    if inv ~= 0 and c ~= inv {
        ctx[].match_size++
        return true
    }
    else {
        return false
    }
}

fn match_space(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> ' ' {
            -> '\t' {
                ctx[].match_size++
                return true
            }
        }
        otherwise {
            return false
        }
    }
}

fn match_digit(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                ctx[].match_size++
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
        otherwise {
            return false
        }
    }
}

fn match_word(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                -> '_' {
                                                    -> 'a' {
                                                        -> 'b' {
                                                            -> 'c' {
                                                                -> 'd' {
                                                                    -> 'e' {
                                                                        -> 'f' {
                                                                            -> 'g' {
                                                                                -> 'h' {
                                                                                    -> 'i' {
                                                                                        -> 'j' {
                                                                                            -> 'k' {
                                                                                                -> 'l' {
                                                                                                    -> 'm' {
                                                                                                        -> 'n' {
                                                                                                            -> 'o' {
                                                                                                                -> 'p' {
                                                                                                                    -> 'q' {
                                                                                                                        -> 'r' {
                                                                                                                            -> 's' {
                                                                                                                                -> 't' {
                                                                                                                                    -> 'u' {
                                                                                                                                        -> 'v' {
                                                                                                                                            -> 'w' {
                                                                                                                                                -> 'x' {
                                                                                                                                                    -> 'y' {
                                                                                                                                                        -> 'z' {
                                                                                                                                                            -> 'A' {
                                                                                                                                                                -> 'B' {
                                                                                                                                                                    -> 'C' {
                                                                                                                                                                        -> 'D' {
                                                                                                                                                                            -> 'E' {
                                                                                                                                                                                -> 'F' {
                                                                                                                                                                                    -> 'G' {
                                                                                                                                                                                        -> 'H' {
                                                                                                                                                                                            -> 'I' {
                                                                                                                                                                                                -> 'J' {
                                                                                                                                                                                                    -> 'K' {
                                                                                                                                                                                                        -> 'L' {
                                                                                                                                                                                                            -> 'M' {
                                                                                                                                                                                                                -> 'N' {
                                                                                                                                                                                                                    -> 'O' {
                                                                                                                                                                                                                        -> 'P' {
                                                                                                                                                                                                                            -> 'Q' {
                                                                                                                                                                                                                                -> 'R' {
                                                                                                                                                                                                                                    -> 'S' {
                                                                                                                                                                                                                                        -> 'T' {
                                                                                                                                                                                                                                            -> 'U' {
                                                                                                                                                                                                                                                -> 'V' {
                                                                                                                                                                                                                                                    -> 'W' {
                                                                                                                                                                                                                                                        -> 'X' {
                                                                                                                                                                                                                                                            -> 'Y' {
                                                                                                                                                                                                                                                                -> 'Z' {
                                                                                                                                                                                                                                                                    ctx[].match_size++
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
            return false
        }
    }
}

fn match_error(ctx: *struc LexerContext) i32 {
    ctx[].match_size++
    return TOK_error
}

fn match_include(ctx: *struc LexerContext, tok_kind: i32) i32 {
    loop while match_space(ctx) {
        ;
    }
    if match_char(ctx, '!') {
        match tok_kind {
            -> TOK_import_file {
                tok_kind = TOK_import_force
                break
            }
            -> TOK_use_file {
                tok_kind = TOK_use_force
                break
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        loop while match_space(ctx) {
            ;
        }
    }
    if match_char(ctx, '"') {
        ctx[].match_at += ctx[].match_size - 1
        ctx[].match_size = 1
        loop while match_invert(ctx, '"') {
            ;
        }
        if get_char(ctx) == '"' {
            ctx[].match_size++
            return tok_kind
        }
    }
    return match_error(ctx)
}

fn match_char_const(ctx: *struc LexerContext, is_str: i32) i32 {
    match get_char(ctx) {
        -> '\'' {
            if not is_str {
                return match_error(ctx)
            }
            break
        }
        -> '"' {
            if is_str {
                ctx[].match_size++
                return TOK_string_literal
            }
            break
        }
        -> '\n' {
            return match_error(ctx)
        }
        -> '\\' {
            ctx[].match_size++
            match get_char(ctx) {
                -> '\'' {
                    -> '"' {
                        -> '\\' {
                            -> '?' {
                                -> 'a' {
                                    -> 'b' {
                                        -> 'f' {
                                            -> 'n' {
                                                -> 'r' {
                                                    -> 't' {
                                                        -> 'v' {
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
                otherwise {
                    return match_error(ctx)
                }
            }
        }
        otherwise {
            break
        }
    }
    ctx[].match_size++
    if is_str or match_char(ctx, '\'') {
        return TOK_char_const
    }
    else {
        return match_error(ctx)
    }
}

fn match_string_literal(ctx: *struc LexerContext) i32 {
    tok_kind: i32;
    loop .. while tok_kind == TOK_char_const {
        tok_kind = match_char_const(ctx, true)
    }    
    return tok_kind
}

fn match_const_end(ctx: *struc LexerContext, tok_kind: i32) i32 {
    match get_char(ctx) {
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                -> '_' {
                                                    -> 'a' {
                                                        -> 'b' {
                                                            -> 'c' {
                                                                -> 'd' {
                                                                    -> 'e' {
                                                                        -> 'f' {
                                                                            -> 'g' {
                                                                                -> 'h' {
                                                                                    -> 'i' {
                                                                                        -> 'j' {
                                                                                            -> 'k' {
                                                                                                -> 'l' {
                                                                                                    -> 'm' {
                                                                                                        -> 'n' {
                                                                                                            -> 'o' {
                                                                                                                -> 'p' {
                                                                                                                    -> 'q' {
                                                                                                                        -> 'r' {
                                                                                                                            -> 's' {
                                                                                                                                -> 't' {
                                                                                                                                    -> 'u' {
                                                                                                                                        -> 'v' {
                                                                                                                                            -> 'w' {
                                                                                                                                                -> 'x' {
                                                                                                                                                    -> 'y' {
                                                                                                                                                        -> 'z' {
                                                                                                                                                            -> 'A' {
                                                                                                                                                                -> 'B' {
                                                                                                                                                                    -> 'C' {
                                                                                                                                                                        -> 'D' {
                                                                                                                                                                            -> 'E' {
                                                                                                                                                                                -> 'F' {
                                                                                                                                                                                    -> 'G' {
                                                                                                                                                                                        -> 'H' {
                                                                                                                                                                                            -> 'I' {
                                                                                                                                                                                                -> 'J' {
                                                                                                                                                                                                    -> 'K' {
                                                                                                                                                                                                        -> 'L' {
                                                                                                                                                                                                            -> 'M' {
                                                                                                                                                                                                                -> 'N' {
                                                                                                                                                                                                                    -> 'O' {
                                                                                                                                                                                                                        -> 'P' {
                                                                                                                                                                                                                            -> 'Q' {
                                                                                                                                                                                                                                -> 'R' {
                                                                                                                                                                                                                                    -> 'S' {
                                                                                                                                                                                                                                        -> 'T' {
                                                                                                                                                                                                                                            -> 'U' {
                                                                                                                                                                                                                                                -> 'V' {
                                                                                                                                                                                                                                                    -> 'W' {
                                                                                                                                                                                                                                                        -> 'X' {
                                                                                                                                                                                                                                                            -> 'Y' {
                                                                                                                                                                                                                                                                -> 'Z' {
                                                                                                                                                                                                                                                                    -> '.' {
                                                                                                                                                                                                                                                                        return match_error(ctx)
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
            return tok_kind
        }
    }
}

fn match_dbl_exponent(ctx: *struc LexerContext) i32 {
    match get_char(ctx) {
        -> '+' {
            -> '-' {
                ctx[].match_size++
                break
            }
        }
        otherwise {
            break
        }
    }
    if not match_digit(ctx) {
        return TOK_error
    }
    loop while match_digit(ctx) {
        ;
    }
    return match_const_end(ctx, TOK_dbl_const)
}

fn match_dbl_fraction(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
        ;
    }
    if match_char(ctx, 'e') {
        return match_dbl_exponent(ctx)
    }
    else {
        return match_const_end(ctx, TOK_dbl_const)
    }
}

fn match_const(ctx: *struc LexerContext) i32 {
    loop while match_digit(ctx) {
        ;
    }
    match get_char(ctx) {
        -> 'l' {
            ctx[].match_size++
            return match_const_end(ctx, TOK_long_const)
        }
        -> 'u' {
            ctx[].match_size++
            if match_char(ctx, 'l') {
                return match_const_end(ctx, TOK_ulong_const)
            }
            else {
                return match_const_end(ctx, TOK_uint_const)
            }
        }
        -> 'e' {
            ctx[].match_size++
            return match_dbl_exponent(ctx)
        }
        -> '.' {
            ctx[].match_size++
            return match_dbl_fraction(ctx)
        }
        otherwise {
            return match_const_end(ctx, TOK_int_const)
        }
    }
}

fn match_identifier(ctx: *struc LexerContext) i32 {
    match ctx[].line[ctx[].match_at] {
        -> 'a' {
            if match_char(ctx, 'n') {
                if match_char(ctx, 'd') {
                    if not match_word(ctx) {
                        return TOK_binop_and
                    }
                }
                elif match_char(ctx, 'y') and not match_word(ctx) {
                    return TOK_key_any
                }
            }
            break
        }
        -> 'b' {
            if match_char(ctx, 'r') {
                if match_chars(ctx, "eak", 3) and not match_word(ctx) {
                    return TOK_key_break
                }
            }
            elif match_chars(ctx, "ool", 3) and not match_word(ctx) {
                return TOK_key_i32
            }
            break
        }
        -> 'c' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "st", 2) and not match_word(ctx) {
                    return TOK_key_cast
                }
            }
            elif match_char(ctx, 'h') {
                if match_chars(ctx, "ar", 2) and not match_word(ctx) {
                    return TOK_key_char
                }
            }
            elif match_chars(ctx, "ontinue", 7) and not match_word(ctx) {
                return TOK_key_continue
            }
            break
        }
        -> 'd' {
            if match_chars(ctx, "ata", 3) and not match_word(ctx) {
                return TOK_key_data
            }
            break
        }
        -> 'e' {
            if match_char(ctx, 'l') {
                if match_char(ctx, 'i') {
                    if match_char(ctx, 'f') and not match_word(ctx) {
                        return TOK_key_elif
                    }
                }
                elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                    return TOK_key_else
                }
            }
            elif match_chars(ctx, "xtrn", 4) and not match_word(ctx) {
                return TOK_key_extrn
            }
            break
        }
        -> 'f' {
            if match_char(ctx, 'n') {
                if not match_word(ctx) {
                    return TOK_key_fn
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_f64
                }
            }
            elif match_chars(ctx, "alse", 4) and not match_word(ctx) {
                return TOK_key_false
            }
            break
        }
        -> 'i' {
            if match_char(ctx, 'f') {
                if not match_word(ctx) {
                    return TOK_key_if
                }
            }
            elif match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return TOK_key_i32
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_i64
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return TOK_key_i8
                }
            }
            elif match_chars(ctx, "mport", 5) and not match_word(ctx) {
                return match_include(ctx, TOK_import_file)
            }
            break
        }
        -> 'j' {
            if match_chars(ctx, "ump", 3) and not match_word(ctx) {
                return TOK_key_jump
            }
            break
        }
        -> 'l' {
            if match_char(ctx, 'o') {
                if match_chars(ctx, "op", 2) and not match_word(ctx) {
                    return TOK_key_loop
                }
            }
            elif match_chars(ctx, "abel", 4) and not match_word(ctx) {
                return TOK_key_label
            }
            break
        }
        -> 'm' {
            if match_char(ctx, 'a') {
                if match_chars(ctx, "tch", 3) and not match_word(ctx) {
                    return TOK_key_match
                }
            }
            elif match_chars(ctx, "4_", 2) {
                loop while match_word(ctx) {
                    ;
                }
                return TOK_m4_prefix
            }
            break
        }
        -> 'n' {
            if match_char(ctx, 'o') {
                if match_char(ctx, 'n') {
                    if match_char(ctx, 'e') and not match_word(ctx) {
                        return TOK_key_none
                    }
                }
                elif match_char(ctx, 't') and not match_word(ctx) {
                    return TOK_unop_not
                }
            }
            elif match_chars(ctx, "il", 2) and not match_word(ctx) {
                return TOK_key_false
            }
            break
        }
        -> 'o' {
            if match_char(ctx, 'r') {
                if not match_word(ctx) {
                    return TOK_binop_or
                }
            }
            elif match_chars(ctx, "therwise", 8) and not match_word(ctx) {
                return TOK_key_otherwise
            }
            break
        }
        -> 'p' {
            if match_chars(ctx, "ub", 2) and not match_word(ctx) {
                return TOK_key_pub
            }
            break
        }
        -> 'r' {
            if match_chars(ctx, "eturn", 5) and not match_word(ctx) {
                return TOK_key_return
            }
            break
        }
        -> 's' {
            if match_char(ctx, 'i') {
                if match_chars(ctx, "zeof", 4) and not match_word(ctx) {
                    return TOK_key_sizeof
                }
            }
            elif match_chars(ctx, "tr", 2) {
                if match_char(ctx, 'u') {
                    if match_char(ctx, 'c') and not match_word(ctx) {
                        return TOK_key_struc
                    }
                }
                elif match_chars(ctx, "ing", 3) and not match_word(ctx) {
                    return TOK_key_string
                }
            }
            break
        }
        -> 't' {
            if match_char(ctx, 'h') {
                if match_chars(ctx, "en", 2) and not match_word(ctx) {
                    return TOK_key_then
                }
            }
            elif match_char(ctx, 'y') {
                if match_chars(ctx, "pe", 2) and not match_word(ctx) {
                    return TOK_key_type
                }
            }
            elif match_chars(ctx, "rue", 3) and not match_word(ctx) {
                return TOK_key_true
            }
            break
        }
        -> 'u' {
            if match_char(ctx, '3') {
                if match_char(ctx, '2') and not match_word(ctx) {
                    return TOK_key_u32
                }
            }
            elif match_char(ctx, '6') {
                if match_char(ctx, '4') and not match_word(ctx) {
                    return TOK_key_u64
                }
            }
            elif match_char(ctx, '8') {
                if not match_word(ctx) {
                    return TOK_key_u8
                }
            }
            elif match_char(ctx, 'n') {
                if match_chars(ctx, "ion", 3) and not match_word(ctx) {
                    return TOK_key_union
                }
            }
            elif match_chars(ctx, "se", 2) and not match_word(ctx) {
                return match_include(ctx, TOK_use_file)
            }
            break
        }
        -> 'w' {
            if match_chars(ctx, "hile", 4) and not match_word(ctx) {
                return TOK_key_while
            }
            break
        }
        otherwise {
            break
        }
    }
    loop while match_word(ctx) {
        ;
    }
    return TOK_identifier
}

fn match_token(ctx: *struc LexerContext) i32 {
    ctx[].match_size = 1
    match ctx[].line[ctx[].match_at] {
        -> '(' {
            return TOK_open_paren
        }
        -> ')' {
            return TOK_close_paren
        }
        -> '{' {
            return TOK_open_brace
        }
        -> '}' {
            return TOK_close_brace
        }
        -> '[' {
            return TOK_open_bracket
        }
        -> ']' {
            return TOK_close_bracket
        }
        -> ',' {
            return TOK_comma_separator
        }
        -> ';' {
            return TOK_semicolon
        }
        -> '@' {
            return TOK_unop_addrof
        }
        -> ':' {
            return TOK_assign_type
        }
        -> '!' {
            return TOK_force_exec
        }
        -> '?' {
            return TOK_ternary_if
        }
        -> '$' {
            return TOK_compound_init
        }
        -> '=' {
            if match_char(ctx, '=') {
                return TOK_binop_eq
            }
            else {
                return TOK_assign
            }
        }
        -> '~' {
            if match_char(ctx, '=') {
                return TOK_binop_ne
            }
            else {
                return TOK_unop_complement
            }
        }
        -> '-' {
            if match_char(ctx, '>') {
                return TOK_match_with
            }
            elif match_char(ctx, '-') {
                return TOK_unop_decr
            }
            elif match_char(ctx, '=') {
                return TOK_assign_subtract
            }
            else {
                return TOK_unop_neg
            }
        }
        -> '+' {
            if match_char(ctx, '+') {
                return TOK_unop_incr
            }
            elif match_char(ctx, '=') {
                return TOK_assign_add
            }
            else {
                return TOK_binop_add
            }
        }
        -> '*' {
            if match_char(ctx, '=') {
                return TOK_assign_multiply
            }
            else {
                return TOK_binop_multiply
            }
        }
        -> '/' {
            if match_char(ctx, '=') {
                return TOK_assign_divide
            }
            else {
                return TOK_binop_divide
            }
        }
        -> '%' {
            if match_char(ctx, '=') {
                return TOK_assign_remainder
            }
            else {
                return TOK_binop_remainder
            }
        }
        -> '&' {
            if match_char(ctx, '=') {
                return TOK_assign_bitand
            }
            else {
                return TOK_binop_bitand
            }
        }
        -> '|' {
            if match_char(ctx, '=') {
                return TOK_assign_bitor
            }
            else {
                return TOK_binop_bitor
            }
        }
        -> '<' {
            if match_char(ctx, '<') {
                if match_char(ctx, '=') {
                    return TOK_assign_shiftleft
                }
                else {
                    return TOK_binop_shiftleft
                }
            }
            elif match_char(ctx, '=') {
                return TOK_binop_le
            }
            else {
                return TOK_binop_lt
            }
        }
        -> '>' {
            if match_char(ctx, '>') {
                if match_char(ctx, '=') {
                    return TOK_assign_shiftright
                }
                else {
                    return TOK_binop_shiftright
                }
            }
            elif match_char(ctx, '=') {
                return TOK_binop_ge
            }
            else {
                return TOK_binop_gt
            }
        }
        -> '^' {
            if match_char(ctx, '=') {
                return TOK_assign_xor
            }
            else {
                return TOK_binop_xor
            }
        }
        -> '.' {
            match get_char(ctx) {
                -> '0' {
                    -> '1' {
                        -> '2' {
                            -> '3' {
                                -> '4' {
                                    -> '5' {
                                        -> '6' {
                                            -> '7' {
                                                -> '8' {
                                                    -> '9' {
                                                        return match_dbl_fraction(ctx)
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
                -> '.' {
                    ctx[].match_size++
                    return TOK_loop_post
                }
                otherwise {
                    return TOK_typeop_member
                }
            }
        }
        -> '\'' {
            return match_char_const(ctx, false)
        }
        -> '"' {
            return match_string_literal(ctx)
        }
        -> '0' {
            -> '1' {
                -> '2' {
                    -> '3' {
                        -> '4' {
                            -> '5' {
                                -> '6' {
                                    -> '7' {
                                        -> '8' {
                                            -> '9' {
                                                return match_const(ctx)
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
        -> '_' {
            -> 'a' {
                -> 'b' {
                    -> 'c' {
                        -> 'd' {
                            -> 'e' {
                                -> 'f' {
                                    -> 'g' {
                                        -> 'h' {
                                            -> 'i' {
                                                -> 'j' {
                                                    -> 'k' {
                                                        -> 'l' {
                                                            -> 'm' {
                                                                -> 'n' {
                                                                    -> 'o' {
                                                                        -> 'p' {
                                                                            -> 'q' {
                                                                                -> 'r' {
                                                                                    -> 's' {
                                                                                        -> 't' {
                                                                                            -> 'u' {
                                                                                                -> 'v' {
                                                                                                    -> 'w' {
                                                                                                        -> 'x' {
                                                                                                            -> 'y' {
                                                                                                                -> 'z' {
                                                                                                                    -> 'A' {
                                                                                                                        -> 'B' {
                                                                                                                            -> 'C' {
                                                                                                                                -> 'D' {
                                                                                                                                    -> 'E' {
                                                                                                                                        -> 'F' {
                                                                                                                                            -> 'G' {
                                                                                                                                                -> 'H' {
                                                                                                                                                    -> 'I' {
                                                                                                                                                        -> 'J' {
                                                                                                                                                            -> 'K' {
                                                                                                                                                                -> 'L' {
                                                                                                                                                                    -> 'M' {
                                                                                                                                                                        -> 'N' {
                                                                                                                                                                            -> 'O' {
                                                                                                                                                                                -> 'P' {
                                                                                                                                                                                    -> 'Q' {
                                                                                                                                                                                        -> 'R' {
                                                                                                                                                                                            -> 'S' {
                                                                                                                                                                                                -> 'T' {
                                                                                                                                                                                                    -> 'U' {
                                                                                                                                                                                                        -> 'V' {
                                                                                                                                                                                                            -> 'W' {
                                                                                                                                                                                                                -> 'X' {
                                                                                                                                                                                                                    -> 'Y' {
                                                                                                                                                                                                                        -> 'Z' {
                                                                                                                                                                                                                            return match_identifier(ctx)
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
        -> '#' {
            -> '\n' {
                -> '\r' {
                    return TOK_line_break
                }
            }
        }
        -> ' ' {
            -> '\t' {
                -> '\f' {
                    -> '\v' {
                        return TOK_skip
                    }
                }
            }
        }
        otherwise {
            return TOK_error
        }
    }
}

fn get_match(ctx: *struc LexerContext, match_at: u64, match_size: u64) string {
    smatch: string = ? "" then sdsnew("") else nil
    loop .. while 0 {
        smatch = sdsgrowzero(smatch, match_size)
    }    
    loop i: u64 = 0 while i < match_size .. ++i {
        smatch[i] = ctx[].line[match_at + i]
    }
    return smatch
}

fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32;

fn push_token_info(ctx: *struc LexerContext) u64 {
    token_info: struc TokenInfo = $(cast<i32>(ctx[].match_at), cast<i32>(ctx[].match_size), ctx[].total_linenum)
    loop .. while 0 {
        (? (not (ctx[].errors[].token_infos) or (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].capacity) then (((ctx[].errors[].token_infos) = stbds_arrgrowf((ctx[].errors[].token_infos), sizeof((ctx[].errors[].token_infos)[]), (1), (0))) and 0) else 0)
        (ctx[].errors[].token_infos)[(cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length++] = (token_info)
    }    
    return (? (ctx[].errors[].token_infos) then (cast<*struc stbds_array_header>((ctx[].errors[].token_infos)) - 1)[].length else 0) - 1
}

fn tokenize_file(ctx: *struc LexerContext) i32 {
    smatch: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop linenum: u64 = 1 while read_line(ctx[].fileio, @ctx[].line, @ctx[].line_size) .. ++linenum {
        ctx[].total_linenum++
        is_empty: i32 = true
        loop ctx[].match_at = 0 while ctx[].match_at < ctx[].line_size .. ctx[].match_at += ctx[].match_size {
            match_kind: i32 = match_token(ctx)
            match_tok: u64 = 0
            match match_kind {
                -> TOK_skip {
                    jump Lcontinue
                }
                -> TOK_import_file {
                    -> TOK_import_force {
                        -> TOK_use_file {
                            -> TOK_use_force {
                                loop .. while 0 {
                                    "@MACRO@:TRY(tokenize_include(ctx, match_kind, linenum, is_empty))"
                                    _errval = tokenize_include(ctx, match_kind, linenum, is_empty)
                                    if _errval ~= 0 {
                                        jump _Lfinally
                                    }
                                }                            
                            }
                        }
                    }
                }
                jump Lbreak
                -> TOK_line_break {
                    if is_empty or ctx[].paren_depth > 0 {
                        jump Lbreak
                    }
                    jump Lpass
                }
                -> TOK_open_paren {
                    ctx[].paren_depth++
                    jump Lpass
                }
                -> TOK_close_paren {
                    if ctx[].paren_depth == 0 {
                        smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                        info_at: u64 = push_token_info(ctx)
                        loop .. while 0 {
                            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_unmatched_close), "MSG_unmatched_close", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                            _errval = 1
                            jump _Lfinally
                        }                        
                    }
                    ctx[].paren_depth--
                    jump Lpass
                }
                -> TOK_identifier {
                    -> TOK_string_literal {
                        -> TOK_char_const {
                            -> TOK_int_const {
                                -> TOK_long_const {
                                    -> TOK_uint_const {
                                        -> TOK_ulong_const {
                                            -> TOK_dbl_const {
                                                smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                                                match_tok = make_string_identifier(ctx[].identifiers, @smatch)
                                                jump Lpass
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                -> TOK_m4_prefix {
                    smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_preproc_macro), "MSG_preproc_macro", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }                    
                }
                -> TOK_error {
                    smatch = get_match(ctx, ctx[].match_at, ctx[].match_size)
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_invalid_tok), "MSG_invalid_tok", "", "", smatch) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }                    
                }
                otherwise {
                    jump Lpass
                }
            }
            label Lbreak
            break
            label Lcontinue
            continue
            label Lpass
            ;
            info_at: u64 = push_token_info(ctx)
            token: struc Token = $(match_kind, match_tok, info_at)
            loop .. while 0 {
                (? (not (ctx[].p_toks[]) or (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].capacity) then (((ctx[].p_toks[]) = stbds_arrgrowf((ctx[].p_toks[]), sizeof((ctx[].p_toks[])[]), (1), (0))) and 0) else 0)
                (ctx[].p_toks[])[(cast<*struc stbds_array_header>((ctx[].p_toks[])) - 1)[].length++] = (token)
            }            
            if match_kind == TOK_line_break {
                break
            }
            is_empty = false
        }
    }
    label _Lfinally
    ;
    if smatch {
        sdsfree(smatch)
        smatch = ? nil then sdsnew(nil) else nil
    }
    ;
    return _errval
}

fn find_include(dirnames: *string, filename: *string) i32 {
    loop i: u64 = 0 while i < (? (dirnames) then (cast<*struc stbds_array_header>((dirnames)) - 1)[].length else 0) .. ++i {
        dirname: string = ? dirnames[i] then sdsnew(dirnames[i]) else nil
        loop .. while 0 {
            dirname = sdscat(dirname, filename[])
        }        
        if find_file(dirname) {
            if dirname ~= filename[] {
                if filename[] {
                    sdsfree(filename[])
                    filename[] = ? nil then sdsnew(nil) else nil
                }
                ;
                filename[] = dirname
                dirname = ? nil then sdsnew(nil) else nil
            }
            ;
            return true
        }
        if dirname {
            sdsfree(dirname)
            dirname = ? nil then sdsnew(nil) else nil
        }
        ;
    }
    return false
}

fn tokenize_include(ctx: *struc LexerContext, match_tok: u64, linenum: u64, is_empty: i32) i32 {
    filename: string = ? nil then sdsnew(nil) else nil
    fopen_name: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    line: string;
    line_size: u64;
    match_at: u64;
    match_size: u64;
    filename = get_match(ctx, ctx[].match_at + 1, ctx[].match_size - 2)
    loop .. while 0 {
        filename = sdscat(filename, ".etc")
    }    
    if not is_empty {
        info_at: u64 = push_token_info(ctx)
        match match_tok {
            -> TOK_import_file {
                -> TOK_import_force {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_import_in_line), "MSG_import_in_line", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }                
                }
            }
            -> TOK_use_file {
                -> TOK_use_force {
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_use_in_line), "MSG_use_in_line", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }                
                }
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    {
        includename: u64 = stbds_hash_string(filename, 42)
        if (? ((ctx[].includename_set) = stbds_hmget_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof((ctx[].includename_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp) ~= -1 {
            match match_tok {
                -> TOK_import_file {
                    -> TOK_use_file {
                        jump _Lfinally
                    }
                }
                -> TOK_import_force {
                    -> TOK_use_force {
                        break
                    }
                }
                otherwise {
                    panic_sigabrt("abort")
                }
            }
        }
        else {
            loop .. while 0 {
                (ctx[].includename_set) = stbds_hmput_key((ctx[].includename_set), sizeof((ctx[].includename_set)[]), cast<*any>(@((includename))), sizeof((ctx[].includename_set)[].key), 0)
                (ctx[].includename_set)[(cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp].key = (includename)
                (ctx[].includename_set)[(cast<*struc stbds_array_header>(((ctx[].includename_set) - 1)) - 1)[].temp].value = (0)
            }            
        }
    }
    match match_tok {
        -> TOK_import_file {
            -> TOK_import_force {
                if not find_include(ctx[].p_includedirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_failed_import), "MSG_failed_import", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }                    
                }
                break
            }
        }
        -> TOK_use_file {
            -> TOK_use_force {
                if not find_include(ctx[].p_stdlibdirs[], @filename) {
                    info_at: u64 = push_token_info(ctx)
                    loop .. while 0 {
                        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, info_at))"
                        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_lexer_msg(MSG_failed_use), "MSG_failed_use", "", "", filename) > 0 then cast<none>(raise_error_at_token(ctx[].errors, info_at)) else panic_sigabrt("abort")
                        _errval = 1
                        jump _Lfinally
                    }                    
                }
                break
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    line = ctx[].line
    line_size = ctx[].line_size
    match_at = ctx[].match_at
    match_size = ctx[].match_size
    if (ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename ~= fopen_name {
        if fopen_name {
            sdsfree(fopen_name)
            fopen_name = ? nil then sdsnew(nil) else nil
        }
        ;
        fopen_name = sdsdup((ctx[].errors[].fopen_lines)[(? (ctx[].errors[].fopen_lines) then (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length else 0) - 1].filename)
    }
    ;
    loop .. while 0 {
        "@MACRO@:TRY(open_fread(ctx->fileio, filename))"
        _errval = open_fread(ctx[].fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }    
    {
        fopen_line: struc FileOpenLine = $(1, ctx[].total_linenum + 1, ? nil then sdsnew(nil) else nil)
        if filename ~= fopen_line.filename {
            if fopen_line.filename {
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = filename
            filename = ? nil then sdsnew(nil) else nil
        }
        ;
        loop .. while 0 {
            (? (not (ctx[].errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].capacity) then (((ctx[].errors[].fopen_lines) = stbds_arrgrowf((ctx[].errors[].fopen_lines), sizeof((ctx[].errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
            (ctx[].errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
        }        
    }
    loop .. while 0 {
        "@MACRO@:TRY(tokenize_file(ctx))"
        _errval = tokenize_file(ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }    
    loop .. while 0 {
        "@MACRO@:TRY(close_fread(ctx->fileio, linenum))"
        _errval = close_fread(ctx[].fileio, linenum)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }    
    {
        fopen_line: struc FileOpenLine = $(linenum + 1, ctx[].total_linenum + 1, ? nil then sdsnew(nil) else nil)
        if fopen_name ~= fopen_line.filename {
            if fopen_line.filename {
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = fopen_name
            fopen_name = ? nil then sdsnew(nil) else nil
        }
        ;
        loop .. while 0 {
            (? (not (ctx[].errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].capacity) then (((ctx[].errors[].fopen_lines) = stbds_arrgrowf((ctx[].errors[].fopen_lines), sizeof((ctx[].errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
            (ctx[].errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx[].errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
        }        
    }
    ctx[].line = line
    ctx[].line_size = line_size
    ctx[].match_at = match_at
    ctx[].match_size = match_size
    label _Lfinally
    ;
    if filename {
        sdsfree(filename)
        filename = ? nil then sdsnew(nil) else nil
    }
    ;
    if fopen_name {
        sdsfree(fopen_name)
        fopen_name = ? nil then sdsnew(nil) else nil
    }
    ;
    return _errval
}

pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32 {
    ctx: struc LexerContext;
    {
        ctx.errors = errors
        ctx.fileio = fileio
        ctx.identifiers = identifiers
        ctx.includename_set = nil
        ctx.p_includedirs = includedirs
        ctx.p_stdlibdirs = stdlibdirs
        ctx.p_toks = tokens
        ctx.paren_depth = 0
        ctx.total_linenum = 0
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(open_fread(ctx.fileio, filename))"
        _errval = open_fread(ctx.fileio, filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }    
    {
        fopen_line: struc FileOpenLine = $(1, 1, ? nil then sdsnew(nil) else nil)
        if filename ~= fopen_line.filename {
            if fopen_line.filename {
                sdsfree(fopen_line.filename)
                fopen_line.filename = ? nil then sdsnew(nil) else nil
            }
            ;
            fopen_line.filename = sdsdup(filename)
        }
        ;
        loop .. while 0 {
            (? (not (ctx.errors[].fopen_lines) or (cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].capacity) then (((ctx.errors[].fopen_lines) = stbds_arrgrowf((ctx.errors[].fopen_lines), sizeof((ctx.errors[].fopen_lines)[]), (1), (0))) and 0) else 0)
            (ctx.errors[].fopen_lines)[(cast<*struc stbds_array_header>((ctx.errors[].fopen_lines)) - 1)[].length++] = (fopen_line)
        }        
    }
    loop .. while 0 {
        "@MACRO@:TRY(tokenize_file(&ctx))"
        _errval = tokenize_file(@ctx)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }    
    loop .. while 0 {
        "@MACRO@:TRY(close_fread(ctx.fileio, 0))"
        _errval = close_fread(ctx.fileio, 0)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }    
    set_filename(ctx.fileio, filename)
    label _Lfinally
    ;
    if ctx.includename_set {
        loop .. while 0 {
            cast<none>((? (ctx.includename_set) ~= nil then stbds_hmfree_func((ctx.includename_set) - 1, sizeof((ctx.includename_set)[])) else cast<none>(0)))
            (ctx.includename_set) = nil
        }        
        ctx.includename_set = nil
    }
    ;
    loop i: u64 = 0 while i < (? (fileio[].file_reads) then (cast<*struc stbds_array_header>((fileio[].file_reads)) - 1)[].length else 0) .. ++i {
        if fileio[].file_reads[i].filename {
            sdsfree(fileio[].file_reads[i].filename)
            fileio[].file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
        ;
    }
    if fileio[].file_reads {
        loop .. while 0 {
            cast<none>((? (fileio[].file_reads) then free((cast<*struc stbds_array_header>((fileio[].file_reads)) - 1)) else cast<none>(0)))
            (fileio[].file_reads) = nil
        }        
        fileio[].file_reads = nil
    }
    ;
    if includedirs[] {
        loop .. while 0 {
            cast<none>((? (includedirs[]) then free((cast<*struc stbds_array_header>((includedirs[])) - 1)) else cast<none>(0)))
            (includedirs[]) = nil
        }        
        includedirs[] = nil
    }
    ;
    if stdlibdirs[] {
        loop .. while 0 {
            cast<none>((? (stdlibdirs[]) then free((cast<*struc stbds_array_header>((stdlibdirs[])) - 1)) else cast<none>(0)))
            (stdlibdirs[]) = nil
        }        
        stdlibdirs[] = nil
    }
    ;
    return _errval
}
