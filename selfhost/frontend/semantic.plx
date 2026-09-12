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
m4_define(`LABEL_KIND', `TODO')m4_dnl
m4_define(`LBL_Land_false', `0')m4_dnl
m4_define(`LBL_Land_true', `1')m4_dnl
m4_define(`LBL_Lbreak', `2')m4_dnl
m4_define(`LBL_Lcase', `3')m4_dnl
m4_define(`LBL_Lcontinue', `4')m4_dnl
m4_define(`LBL_Ldefault', `5')m4_dnl
m4_define(`LBL_Ldo_while', `6')m4_dnl
m4_define(`LBL_Ldo_while_start', `7')m4_dnl
m4_define(`LBL_Lfor', `8')m4_dnl
m4_define(`LBL_Lfor_start', `9')m4_dnl
m4_define(`LBL_Lif_else', `10')m4_dnl
m4_define(`LBL_Lif_false', `11')m4_dnl
m4_define(`LBL_Lor_false', `12')m4_dnl
m4_define(`LBL_Lor_true', `13')m4_dnl
m4_define(`LBL_Lstring', `14')m4_dnl
m4_define(`LBL_Lswitch', `15')m4_dnl
m4_define(`LBL_Lternary_else', `16')m4_dnl
m4_define(`LBL_Lternary_false', `17')m4_dnl
m4_define(`LBL_Lwhile', `18')m4_dnl
type struc CExp;
type struc IdentifierContext;
pub fn rslv_label_identifier(ctx: *struc IdentifierContext, target: u64) u64;
pub fn rslv_var_identifier(ctx: *struc IdentifierContext, variable: u64) u64;
pub fn rslv_struct_tag(ctx: *struc IdentifierContext, structure: u64) u64;
pub fn repr_label_identifier(ctx: *struc IdentifierContext, label_kind: i32) u64;
pub fn repr_loop_identifier(ctx: *struc IdentifierContext, label_kind: i32, target: u64) u64;
pub fn repr_case_identifier(ctx: *struc IdentifierContext, target: u64, is_label: i32, i: u64) u64;
pub fn repr_var_identifier(ctx: *struc IdentifierContext, node: *struc CExp) u64;
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
type struc CProgram;
type struc ErrorsContext;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32;
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
m4_define(`init_CUnaryOp', `TODO')m4_dnl
m4_define(`init_CComplement', `TODO')m4_dnl
m4_define(`init_CNegate', `TODO')m4_dnl
m4_define(`init_CNot', `TODO')m4_dnl
m4_define(`init_CPrefix', `TODO')m4_dnl
m4_define(`init_CPostfix', `TODO')m4_dnl

type struc CBinaryOp(tag: i32)
pub fn make_CBinaryOp(tag: i32) struc CBinaryOp;
m4_define(`init_CBinaryOp', `TODO')m4_dnl
m4_define(`init_CAdd', `TODO')m4_dnl
m4_define(`init_CSubtract', `TODO')m4_dnl
m4_define(`init_CMultiply', `TODO')m4_dnl
m4_define(`init_CDivide', `TODO')m4_dnl
m4_define(`init_CRemainder', `TODO')m4_dnl
m4_define(`init_CBitAnd', `TODO')m4_dnl
m4_define(`init_CBitOr', `TODO')m4_dnl
m4_define(`init_CBitXor', `TODO')m4_dnl
m4_define(`init_CBitShiftLeft', `TODO')m4_dnl
m4_define(`init_CBitShiftRight', `TODO')m4_dnl
m4_define(`init_CBitShrArithmetic', `TODO')m4_dnl
m4_define(`init_CAnd', `TODO')m4_dnl
m4_define(`init_COr', `TODO')m4_dnl
m4_define(`init_CEqual', `TODO')m4_dnl
m4_define(`init_CNotEqual', `TODO')m4_dnl
m4_define(`init_CLessThan', `TODO')m4_dnl
m4_define(`init_CLessOrEqual', `TODO')m4_dnl
m4_define(`init_CGreaterThan', `TODO')m4_dnl
m4_define(`init_CGreaterOrEqual', `TODO')m4_dnl

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
m4_define(`init_CStorageClass', `TODO')m4_dnl
m4_define(`init_CStatic', `TODO')m4_dnl
m4_define(`init_CExtern', `TODO')m4_dnl

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
m4_define(`StStructure', `TODO')m4_dnl

type struc PairTIdentifierStStructure(key: u64, value: struc Structure)

type struc SemanticContext(errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext, extern_scope_map: *struc PairTIdentifierulong_t, goto_map: *struc PairTIdentifierTIdentifier, scoped_identifier_maps: **struc PairTIdentifierTIdentifier, scoped_struct_maps: **struc PairTIdentifierStStructure, label_set: *struc ElementTIdentifier, break_loop_labels: *u64, continue_loop_labels: *u64, fun_def_name: u64, p_switch_statement: *struc CSwitch, fun_def_set: *struc ElementTIdentifier, struct_def_set: *struc ElementTIdentifier, union_def_set: *struc ElementTIdentifier, p_static_inits: ***struc StaticInit)

m4_define(`Ctx', `TODO')m4_dnl
fn is_same_type(type_1: *struc Type, type_2: *struc Type) i32;

fn is_same_ptr(ptr_type_1: *struc Pointer, ptr_type_2: *struc Pointer) i32 {
    return is_same_type(ptr_type_1[].ref_type, ptr_type_2[].ref_type)
}

fn is_same_arr(arr_type_1: *struc Array, arr_type_2: *struc Array) i32 {
    return arr_type_1[].size == arr_type_2[].size and is_same_type(arr_type_1[].elem_type, arr_type_2[].elem_type)
}

fn is_same_struct(struct_type_1: *struc Structure, struct_type_2: *struc Structure) i32 {
    return struct_type_1[].tag_name == struct_type_2[].tag_name
}

fn is_same_type(type_1: *struc Type, type_2: *struc Type) i32 {
    if type_1[].tag == type_2[].tag {
        match type_1[].tag {
            -> AST_Pointer_t {
                return is_same_ptr(@type_1[].get._Pointer, @type_2[].get._Pointer)
            }
            -> AST_Array_t {
                return is_same_arr(@type_1[].get._Array, @type_2[].get._Array)
            }
            -> AST_Structure_t {
                return is_same_struct(@type_1[].get._Structure, @type_2[].get._Structure)
            }
            -> AST_FunType_t {
                panic_sigabrt("abort")
            }
            otherwise {
                return true
            }
        }
    }
    return false
}

fn is_same_fun_type(fun_type_1: *struc FunType, fun_type_2: *struc FunType) i32 {
    if (? (fun_type_1[].param_types) then (cast<*struc stbds_array_header>((fun_type_1[].param_types)) - 1)[].length else 0) ~= (? (fun_type_2[].param_types) then (cast<*struc stbds_array_header>((fun_type_2[].param_types)) - 1)[].length else 0) or not is_same_type(fun_type_1[].ret_type, fun_type_2[].ret_type) {
        return false
    }
    loop i: u64 = 0 while i < (? (fun_type_1[].param_types) then (cast<*struc stbds_array_header>((fun_type_1[].param_types)) - 1)[].length else 0) .. ++i {
        if not is_same_type(fun_type_1[].param_types[i], fun_type_2[].param_types[i]) {
            return false
        }
    }
    return true
}

fn is_type_signed(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            return true
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

fn is_type_char(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_type_int(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_UChar_t {
                            -> AST_UInt_t {
                                -> AST_ULong_t {
                                    return true
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

fn is_type_arithmetic(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            -> AST_UChar_t {
                                -> AST_UInt_t {
                                    -> AST_ULong_t {
                                        return true
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

fn is_type_scalar(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            -> AST_UChar_t {
                                -> AST_UInt_t {
                                    -> AST_ULong_t {
                                        -> AST_Pointer_t {
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
        otherwise {
            return false
        }
    }
}

fn is_struct_complete(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    return (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp) ~= -1
}

fn is_type_complete(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Void_t {
            return false
        }
        -> AST_Structure_t {
            return is_struct_complete(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return true
        }
    }
}

fn is_valid_type(ctx: *struc SemanticContext, type_t: *struc Type) i32;

fn is_valid_ptr(ctx: *struc SemanticContext, ptr_type: *struc Pointer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, ptr_type->ref_type))"
        _errval = is_valid_type(ctx, ptr_type[].ref_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn is_valid_arr(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_complete(ctx, arr_type[].elem_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->errors->info_at_buf))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_arr), "MSG_incomplete_arr", "", get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, arr_type[].elem_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, arr_type->elem_type))"
        _errval = is_valid_type(ctx, arr_type[].elem_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn is_valid_type(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    _errval: i32 = 0
    match type_t[].tag {
        -> AST_Pointer_t {
            loop .. while 0 {
                "@MACRO@:TRY(is_valid_ptr(ctx, &type_t->get._Pointer))"
                _errval = is_valid_ptr(ctx, @type_t[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Array_t {
            loop .. while 0 {
                "@MACRO@:TRY(is_valid_arr(ctx, &type_t->get._Array))"
                _errval = is_valid_arr(ctx, @type_t[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_FunType_t {
            panic_sigabrt("abort")
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn is_exp_lvalue(node: *struc CExp) i32;

fn is_dot_exp_lvalue(node: *struc CDot) i32 {
    return is_exp_lvalue(node[].structure)
}

fn is_exp_lvalue(node: *struc CExp) i32 {
    match node[].tag {
        -> AST_CString_t {
            -> AST_CVar_t {
                -> AST_CDereference_t {
                    -> AST_CSubscript_t {
                        -> AST_CArrow_t {
                            return true
                        }
                    }
                }
            }
        }
        -> AST_CDot_t {
            return is_dot_exp_lvalue(@node[].get._CDot)
        }
        otherwise {
            return false
        }
    }
}

fn is_const_null_ptr(node: *struc CConstant) i32 {
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

fn get_scalar_size(type_t: *struc Type) i32 {
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

fn get_type_scale(ctx: *struc SemanticContext, type_t: *struc Type) i64;

fn get_arr_scale(ctx: *struc SemanticContext, arr_type: *struc Array) i64 {
    size: i64 = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size *= arr_type[].size
    }
    return get_type_scale(ctx, arr_type[].elem_type) * size
}

fn get_struct_scale(ctx: *struc SemanticContext, struct_type: *struc Structure) i64 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
}

fn get_type_scale(ctx: *struc SemanticContext, type_t: *struc Type) i64 {
    match type_t[].tag {
        -> AST_Array_t {
            return get_arr_scale(ctx, @type_t[].get._Array)
        }
        -> AST_Structure_t {
            return get_struct_scale(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type_t)
        }
    }
}

fn get_type_alignment(ctx: *struc SemanticContext, type_t: *struc Type) i32;

fn get_arr_alignment(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    return get_type_alignment(ctx, arr_type[].elem_type)
}

fn get_struct_alignment(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].alignment
}

fn get_type_alignment(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Array_t {
            return get_arr_alignment(ctx, @type_t[].get._Array)
        }
        -> AST_Structure_t {
            return get_struct_alignment(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type_t)
        }
    }
}

fn get_joint_type(node_1: *struc CExp, node_2: *struc CExp) *struc Type {
    joint_type: *struc Type = nil
    if is_type_char(node_1[].exp_type) {
        exp_type: *struc Type = nil
        loop .. while 0 {
            "@MACRO@:sptr_move(Type, node_1->exp_type, exp_type)"
            if node_1[].exp_type ~= exp_type {
                "@MACRO@:uptr_move(Type, node_1->exp_type, exp_type)"
                free_Type(@exp_type)
                exp_type = node_1[].exp_type
                node_1[].exp_type = nil
            }
        }
        node_1[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        loop .. while 0 {
            "@MACRO@:sptr_move(Type, exp_type, node_1->exp_type)"
            if exp_type ~= node_1[].exp_type {
                "@MACRO@:uptr_move(Type, exp_type, node_1->exp_type)"
                free_Type(@node_1[].exp_type)
                node_1[].exp_type = exp_type
                exp_type = nil
            }
        }
    }
    elif is_type_char(node_2[].exp_type) {
        exp_type: *struc Type = nil
        loop .. while 0 {
            "@MACRO@:sptr_move(Type, node_2->exp_type, exp_type)"
            if node_2[].exp_type ~= exp_type {
                "@MACRO@:uptr_move(Type, node_2->exp_type, exp_type)"
                free_Type(@exp_type)
                exp_type = node_2[].exp_type
                node_2[].exp_type = nil
            }
        }
        node_2[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        loop .. while 0 {
            "@MACRO@:sptr_move(Type, exp_type, node_2->exp_type)"
            if exp_type ~= node_2[].exp_type {
                "@MACRO@:uptr_move(Type, exp_type, node_2->exp_type)"
                free_Type(@node_2[].exp_type)
                node_2[].exp_type = exp_type
                exp_type = nil
            }
        }
    }
    elif is_same_type(node_1[].exp_type, node_2[].exp_type) {
        if node_1[].exp_type ~= joint_type {
            "@MACRO@:sptr_copy(Type, node_1->exp_type, joint_type)"
            free_Type(@joint_type)
            joint_type = node_1[].exp_type
            (joint_type)[]._ref_count++
        }
    }
    elif node_1[].exp_type[].tag == AST_Double_t or node_2[].exp_type[].tag == AST_Double_t {
        joint_type = make_Double()
    }
    else {
        type_size_1: i32 = get_scalar_size(node_1[].exp_type)
        type_size_2: i32 = get_scalar_size(node_2[].exp_type)
        if type_size_1 == type_size_2 {
            if is_type_signed(node_1[].exp_type) {
                if node_2[].exp_type ~= joint_type {
                    "@MACRO@:sptr_copy(Type, node_2->exp_type, joint_type)"
                    free_Type(@joint_type)
                    joint_type = node_2[].exp_type
                    (joint_type)[]._ref_count++
                }
            }
            else {
                if node_1[].exp_type ~= joint_type {
                    "@MACRO@:sptr_copy(Type, node_1->exp_type, joint_type)"
                    free_Type(@joint_type)
                    joint_type = node_1[].exp_type
                    (joint_type)[]._ref_count++
                }
            }
        }
        elif type_size_1 > type_size_2 {
            if node_1[].exp_type ~= joint_type {
                "@MACRO@:sptr_copy(Type, node_1->exp_type, joint_type)"
                free_Type(@joint_type)
                joint_type = node_1[].exp_type
                (joint_type)[]._ref_count++
            }
        }
        else {
            if node_2[].exp_type ~= joint_type {
                "@MACRO@:sptr_copy(Type, node_2->exp_type, joint_type)"
                free_Type(@joint_type)
                joint_type = node_2[].exp_type
                (joint_type)[]._ref_count++
            }
        }
    }
    return joint_type
}

fn get_joint_ptr_type(ctx: *struc SemanticContext, node_1: *struc CExp, node_2: *struc CExp, joint_type: **struc Type) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if is_same_type(node_1[].exp_type, node_2[].exp_type) {
        if node_1[].exp_type ~= joint_type[] {
            "@MACRO@:sptr_copy(Type, node_1->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_1[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    elif node_1[].tag == AST_CConstant_t and is_const_null_ptr(@node_1[].get._CConstant) {
        if node_2[].exp_type ~= joint_type[] {
            "@MACRO@:sptr_copy(Type, node_2->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_2[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    elif (node_2[].tag == AST_CConstant_t and is_const_null_ptr(@node_2[].get._CConstant)) or (node_1[].exp_type[].tag == AST_Pointer_t and node_1[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and node_2[].exp_type[].tag == AST_Pointer_t) {
        if node_1[].exp_type ~= joint_type[] {
            "@MACRO@:sptr_copy(Type, node_1->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_1[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    elif node_2[].exp_type[].tag == AST_Pointer_t and node_2[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and node_1[].exp_type[].tag == AST_Pointer_t {
        if node_2[].exp_type ~= joint_type[] {
            "@MACRO@:sptr_copy(Type, node_2->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_2[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node_1->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_joint_ptr_mismatch), "MSG_joint_ptr_mismatch", "", get_type_fmt(ctx[].identifiers, node_1[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node_2[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node_1[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn get_const_char_value(node: *struc CConstant) i8 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return node[].constant[].get._CConstChar.value
        }
        -> AST_CConstInt_t {
            return cast<i8>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<i8>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<i8>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<i8>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<i8>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<i8>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_int_value(node: *struc CConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<i32>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return node[].constant[].get._CConstInt.value
        }
        -> AST_CConstLong_t {
            return cast<i32>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<i32>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<i32>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<i32>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<i32>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_long_value(node: *struc CConstant) i64 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<i64>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<i64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return node[].constant[].get._CConstLong.value
        }
        -> AST_CConstDouble_t {
            return cast<i64>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<i64>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<i64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<i64>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_dbl_value(node: *struc CConstant) f64 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<f64>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<f64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<f64>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return node[].constant[].get._CConstDouble.value
        }
        -> AST_CConstUChar_t {
            return cast<f64>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<f64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<f64>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_uchar_value(node: *struc CConstant) u8 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<u8>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<u8>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u8>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<u8>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return node[].constant[].get._CConstUChar.value
        }
        -> AST_CConstUInt_t {
            return cast<u8>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<u8>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_uint_value(node: *struc CConstant) u32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<u32>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<u32>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u32>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<u32>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<u32>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return node[].constant[].get._CConstUInt.value
        }
        -> AST_CConstULong_t {
            return cast<u32>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_ulong_value(node: *struc CConstant) u64 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<u64>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<u64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u64>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<u64>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<u64>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<u64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_ptr_value(node: *struc CConstant) u64 {
    match node[].constant[].tag {
        -> AST_CConstInt_t {
            return cast<u64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u64>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstUInt_t {
            return cast<u64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_compound_info_at(node: *struc CCompoundInit) u64 {
    initializer: *struc CInitializer = node[].initializers[0]
    loop while initializer[].tag == AST_CCompoundInit_t {
        node = @initializer[].get._CCompoundInit
        initializer = node[].initializers[0]
    }
    return initializer[].get._CSingleInit.exp[].info_at
}

fn reslv_struct_type(ctx: *struc SemanticContext, type_t: *struc Type) i32;

fn check_const_exp(node: *struc CConstant) none {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            node[]._base[].exp_type = make_Char()
            break
        }
        -> AST_CConstInt_t {
            node[]._base[].exp_type = make_Int()
            break
        }
        -> AST_CConstLong_t {
            node[]._base[].exp_type = make_Long()
            break
        }
        -> AST_CConstDouble_t {
            node[]._base[].exp_type = make_Double()
            break
        }
        -> AST_CConstUChar_t {
            node[]._base[].exp_type = make_UChar()
            break
        }
        -> AST_CConstUInt_t {
            node[]._base[].exp_type = make_UInt()
            break
        }
        -> AST_CConstULong_t {
            node[]._base[].exp_type = make_ULong()
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn check_string_exp(node: *struc CString) none {
    size: i64 = (cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))) + 1l
    elem_type: *struc Type = make_Char()
    node[]._base[].exp_type = make_Array(size, @elem_type)
}

fn check_var_exp(ctx: *struc SemanticContext, node: *struc CVar) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    var_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    if var_type[].tag == AST_FunType_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_fun_used_as_var), "MSG_fun_used_as_var", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if var_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, var_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = var_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, node->target_type))"
        _errval = reslv_struct_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].target_type[].tag ~= AST_Void_t and ((node[].exp[].exp_type[].tag == AST_Double_t and node[].target_type[].tag == AST_Pointer_t) or (node[].exp[].exp_type[].tag == AST_Pointer_t and node[].target_type[].tag == AST_Double_t) or not is_type_scalar(node[].exp[].exp_type) or not is_type_scalar(node[].target_type)) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_illegal_cast), "MSG_illegal_cast", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].target_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, node->target_type))"
        _errval = is_valid_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].target_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, node->target_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].target_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn cast_exp(ctx: *struc SemanticContext, exp_type: **struc Type, exp: **struc CExp) i32 {
    exp_type_cp: *struc Type = nil
    _errval: i32 = 0
    info_at: u64 = (exp[])[].info_at
    if exp_type[] ~= exp_type_cp {
        "@MACRO@:sptr_copy(Type, *exp_type, exp_type_cp)"
        free_Type(@exp_type_cp)
        exp_type_cp = exp_type[]
        (exp_type_cp)[]._ref_count++
    }
    exp[] = make_CCast(exp, @exp_type_cp, info_at)
    loop .. while 0 {
        "@MACRO@:TRY(check_cast_exp(ctx, &(*exp)->get._CCast))"
        _errval = check_cast_exp(ctx, @(exp[])[].get._CCast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    free_Type(@exp_type_cp)
    return _errval
}

fn cast_assign(ctx: *struc SemanticContext, exp_type: **struc Type, exp: **struc CExp) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (is_type_arithmetic((exp[])[].exp_type) and is_type_arithmetic(exp_type[])) or ((exp[])[].tag == AST_CConstant_t and (exp_type[])[].tag == AST_Pointer_t and is_const_null_ptr(@(exp[])[].get._CConstant)) or ((exp_type[])[].tag == AST_Pointer_t and (exp_type[])[].get._Pointer.ref_type[].tag == AST_Void_t and (exp[])[].exp_type[].tag == AST_Pointer_t) or ((exp[])[].exp_type[].tag == AST_Pointer_t and (exp[])[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and (exp_type[])[].tag == AST_Pointer_t) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, exp_type, exp))"
            _errval = cast_exp(ctx, exp_type, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*exp)->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_illegal_cast), "MSG_illegal_cast", "", get_type_fmt(ctx[].identifiers, (exp[])[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, exp_type[], @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, (exp[])[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn promote_char_to_int(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    promote_type: *struc Type = nil
    _errval: i32 = 0
    promote_type = make_Int()
    loop .. while 0 {
        "@MACRO@:TRY(cast_exp(ctx, &promote_type, exp))"
        _errval = cast_exp(ctx, @promote_type, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    free_Type(@promote_type)
    return _errval
}

fn check_unary_complement_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].exp[].exp_type[].tag {
        -> AST_Double_t {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    loop .. while 0 {
                        "@MACRO@:TRY(promote_char_to_int(ctx, &node->exp))"
                        _errval = promote_char_to_int(ctx, @node[].exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    if node[].exp[].exp_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, node->exp->exp_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_unary_neg_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].exp[].exp_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    loop .. while 0 {
                        "@MACRO@:TRY(promote_char_to_int(ctx, &node->exp))"
                        _errval = promote_char_to_int(ctx, @node[].exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    if node[].exp[].exp_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, node->exp->exp_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_unary_not_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_scalar(node[].exp[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    _errval: i32 = 0
    match node[].unop.tag {
        -> AST_CComplement_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_unary_complement_exp(ctx, node))"
                _errval = check_unary_complement_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CNegate_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_unary_neg_exp(ctx, node))"
                _errval = check_unary_neg_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CNot_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_unary_not_exp(ctx, node))"
                _errval = check_unary_not_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_binary_add_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) and is_type_int(node[].exp_right[].exp_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_right[].exp_type, common_type) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
                _errval = cast_exp(ctx, @common_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    elif is_type_int(node[].exp_left[].exp_type) and node[].exp_right[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_left[].exp_type, common_type) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
                _errval = cast_exp(ctx, @common_type, @node[].exp_left)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_right[].exp_type ~= node[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->exp_right->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_right[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            "@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = nil
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_subtract_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) {
        if is_type_int(node[].exp_right[].exp_type) {
            common_type = make_Long()
            if not is_same_type(node[].exp_right[].exp_type, common_type) {
                loop .. while 0 {
                    "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
                    _errval = cast_exp(ctx, @common_type, @node[].exp_right)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
                "@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
                free_Type(@node[]._base[].exp_type)
                node[]._base[].exp_type = node[].exp_left[].exp_type
                (node[]._base[].exp_type)[]._ref_count++
            }
            jump _Lfinally
        }
        elif is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) and not (node[].exp_left[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_left[].get._CConstant)) {
            common_type = make_Long()
            loop .. while 0 {
                "@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
                if common_type ~= node[]._base[].exp_type {
                    "@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
                    free_Type(@node[]._base[].exp_type)
                    node[]._base[].exp_type = common_type
                    common_type = nil
                }
            }
            jump _Lfinally
        }
        else {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            "@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = nil
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_multiply_divide_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            "@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = nil
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_remainder_bitwise_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            "@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = nil
        }
    }
    if node[]._base[].exp_type[].tag == AST_Double_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_op), "MSG_invalid_binary_op", "", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[]._base[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_bitshift_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_int(node[].exp_right[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif is_type_char(node[].exp_left[].exp_type) {
        loop .. while 0 {
            "@MACRO@:TRY(promote_char_to_int(ctx, &node->exp_left))"
            _errval = promote_char_to_int(ctx, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &node->exp_left->exp_type, &node->exp_right))"
            _errval = cast_exp(ctx, @node[].exp_left[].exp_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp_left[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    if node[]._base[].exp_type[].tag == AST_Double_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_op), "MSG_invalid_binary_op", "", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[]._base[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_bitshift_right_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(check_binary_bitshift_exp(ctx, node))"
        _errval = check_binary_bitshift_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if is_type_signed(node[].exp_left[].exp_type) {
        node[].binop = make_CBinaryOp(AST_CBitShrArithmetic_t)
    }
    label _Lfinally
    return _errval
}

fn check_binary_logical_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_binary_equality_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        loop .. while 0 {
            "@MACRO@:TRY(get_joint_ptr_type(ctx, node->exp_left, node->exp_right, &common_type))"
            _errval = get_joint_ptr_type(ctx, node[].exp_left, node[].exp_right, @common_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    elif is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_relational_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) or (node[].exp_left[].exp_type[].tag == AST_Pointer_t and (not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) or (node[].exp_left[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_left[].get._CConstant)) or (node[].exp_right[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_right[].get._CConstant)))) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    match node[].binop.tag {
        -> AST_CAdd_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_binary_add_exp(ctx, node))"
                _errval = check_binary_add_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSubtract_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_binary_subtract_exp(ctx, node))"
                _errval = check_binary_subtract_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CMultiply_t {
            -> AST_CDivide_t {
                loop .. while 0 {
                    "@MACRO@:TRY(check_multiply_divide_exp(ctx, node))"
                    _errval = check_multiply_divide_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> AST_CRemainder_t {
            -> AST_CBitAnd_t {
                -> AST_CBitOr_t {
                    -> AST_CBitXor_t {
                        loop .. while 0 {
                            "@MACRO@:TRY(check_remainder_bitwise_exp(ctx, node))"
                            _errval = check_remainder_bitwise_exp(ctx, node)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        -> AST_CBitShiftLeft_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_binary_bitshift_exp(ctx, node))"
                _errval = check_binary_bitshift_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CBitShiftRight_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_bitshift_right_exp(ctx, node))"
                _errval = check_bitshift_right_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CAnd_t {
            -> AST_COr_t {
                loop .. while 0 {
                    "@MACRO@:TRY(check_binary_logical_exp(ctx, node))"
                    _errval = check_binary_logical_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> AST_CEqual_t {
            -> AST_CNotEqual_t {
                loop .. while 0 {
                    "@MACRO@:TRY(check_binary_equality_exp(ctx, node))"
                    _errval = check_binary_equality_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> AST_CLessThan_t {
            -> AST_CLessOrEqual_t {
                -> AST_CGreaterThan_t {
                    -> AST_CGreaterOrEqual_t {
                        loop .. while 0 {
                            "@MACRO@:TRY(check_binary_relational_exp(ctx, node))"
                            _errval = check_binary_relational_exp(ctx, node)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) i32 {
    _errval: i32 = 0
    if node[].exp_left {
        if node[].exp_left[].exp_type[].tag == AST_Void_t {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_assign_to_void), "MSG_assign_to_void", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_exp_lvalue(node[].exp_left) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_assign_to_rvalue), "MSG_assign_to_rvalue", "", "", get_assign_fmt(nil, @node[].unop)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_same_type(node[].exp_right[].exp_type, node[].exp_left[].exp_type) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_assign(ctx, &node->exp_left->exp_type, &node->exp_right))"
                _errval = cast_assign(ctx, @node[].exp_left[].exp_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
    }
    else {
        exp_left: *struc CExp = node[].exp_right[].get._CBinary.exp_left
        if exp_left[].tag == AST_CCast_t {
            exp_left = exp_left[].get._CCast.exp
        }
        if not is_exp_lvalue(exp_left) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_assign_to_rvalue), "MSG_assign_to_rvalue", "", "", get_assign_fmt(@node[].exp_right[].get._CBinary.binop, @node[].unop)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_same_type(node[].exp_right[].exp_type, exp_left[].exp_type) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_assign(ctx, &exp_left->exp_type, &node->exp_right))"
                _errval = cast_assign(ctx, @exp_left[].exp_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if exp_left[].exp_type ~= node[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, exp_left->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    return _errval
}

fn check_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = nil
    _errval: i32 = 0
    if not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_condition), "MSG_invalid_condition", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Void_t and node[].exp_right[].exp_type[].tag == AST_Void_t {
        if node[].exp_middle[].exp_type ~= node[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->exp_middle->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_middle[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Structure_t or node[].exp_right[].exp_type[].tag == AST_Structure_t {
        if not is_same_type(node[].exp_middle[].exp_type, node[].exp_right[].exp_type) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_ternary_op), "MSG_invalid_ternary_op", "", get_type_fmt(ctx[].identifiers, node[].exp_middle[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        if node[].exp_middle[].exp_type ~= node[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->exp_middle->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_middle[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    if is_type_arithmetic(node[].exp_middle[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_middle, node[].exp_right)
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        loop .. while 0 {
            "@MACRO@:TRY(get_joint_ptr_type(ctx, node->exp_middle, node->exp_right, &common_type))"
            _errval = get_joint_ptr_type(ctx, node[].exp_middle, node[].exp_right, @common_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_ternary_op), "MSG_invalid_ternary_op", "", get_type_fmt(ctx[].identifiers, node[].exp_middle[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_middle[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_middle))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_middle)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            "@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = nil
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    fun_symbol: *struc Symbol = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)
    fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
    if fun_symbol[].type_t[].tag ~= AST_FunType_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_var_used_as_fun), "MSG_var_used_as_fun", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) ~= (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) {
        strto_fmt_1 = ? ((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0))))
        strto_fmt_2 = ? ((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0))))
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_call_with_wrong_argc), "MSG_call_with_wrong_argc", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        if not is_same_type(node[].args[i][].exp_type, fun_type[].param_types[i]) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_assign(ctx, &fun_type->param_types[i], &node->args[i]))"
                _errval = cast_assign(ctx, @fun_type[].param_types[i], @node[].args[i])
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
    }
    if fun_type[].ret_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, fun_type->ret_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = fun_type[].ret_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].exp[].exp_type[].tag ~= AST_Pointer_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_deref_not_ptr), "MSG_deref_not_ptr", "", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].exp[].exp_type[].get._Pointer.ref_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, node->exp->exp_type->get._Pointer.ref_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type[].get._Pointer.ref_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_addrof_exp(ctx: *struc SemanticContext, node: *struc CAddrOf) i32 {
    ref_type: *struc Type = nil
    _errval: i32 = 0
    if not is_exp_lvalue(node[].exp) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_addrof_rvalue), "MSG_addrof_rvalue", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].exp[].exp_type ~= ref_type {
        "@MACRO@:sptr_copy(Type, node->exp->exp_type, ref_type)"
        free_Type(@ref_type)
        ref_type = node[].exp[].exp_type
        (ref_type)[]._ref_count++
    }
    node[]._base[].exp_type = make_Pointer(@ref_type)
    label _Lfinally
    free_Type(@ref_type)
    return _errval
}

fn check_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    ref_type: *struc Type = nil
    subscript_type: *struc Type = nil
    _errval: i32 = 0
    if node[].primary_exp[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type) and is_type_int(node[].subscript_exp[].exp_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].subscript_exp[].exp_type, subscript_type) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_exp(ctx, &subscript_type, &node->subscript_exp))"
                _errval = cast_exp(ctx, @subscript_type, @node[].subscript_exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].primary_exp[].exp_type[].get._Pointer.ref_type ~= ref_type {
            "@MACRO@:sptr_copy(Type, node->primary_exp->exp_type->get._Pointer.ref_type, ref_type)"
            free_Type(@ref_type)
            ref_type = node[].primary_exp[].exp_type[].get._Pointer.ref_type
            (ref_type)[]._ref_count++
        }
    }
    elif is_type_int(node[].primary_exp[].exp_type) and node[].subscript_exp[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].primary_exp[].exp_type, subscript_type) {
            loop .. while 0 {
                "@MACRO@:TRY(cast_exp(ctx, &subscript_type, &node->primary_exp))"
                _errval = cast_exp(ctx, @subscript_type, @node[].primary_exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].subscript_exp[].exp_type[].get._Pointer.ref_type ~= ref_type {
            "@MACRO@:sptr_copy(Type, node->subscript_exp->exp_type->get._Pointer.ref_type, ref_type)"
            free_Type(@ref_type)
            ref_type = node[].subscript_exp[].exp_type[].get._Pointer.ref_type
            (ref_type)[]._ref_count++
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_subscript), "MSG_invalid_subscript", "", get_type_fmt(ctx[].identifiers, node[].primary_exp[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].subscript_exp[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:sptr_move(Type, ref_type, node->_base->exp_type)"
        if ref_type ~= node[]._base[].exp_type {
            "@MACRO@:uptr_move(Type, ref_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = ref_type
            ref_type = nil
        }
    }
    label _Lfinally
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@ref_type)
    free_Type(@subscript_type)
    return _errval
}

fn check_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_complete(ctx, node[].exp[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_sizeof_incomplete), "MSG_sizeof_incomplete", "", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_ULong()
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, node->target_type))"
        _errval = reslv_struct_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if not is_type_complete(ctx, node[].target_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_sizeof_incomplete), "MSG_sizeof_incomplete", "", "", get_type_fmt(ctx[].identifiers, node[].target_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, node->target_type))"
        _errval = is_valid_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_ULong()
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].structure[].exp_type[].tag ~= AST_Structure_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_dot_not_struct), "MSG_dot_not_struct", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].structure[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_type = @node[].structure[].exp_type[].get._Structure
    struct_typedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    map_it = (? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_member_not_in_struct), "MSG_member_not_in_struct", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_name_fmt(ctx[].identifiers, node[].member, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    member_type = (struct_typedef[].members[map_it]).value[].member_type
    if member_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, member_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = member_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ptr_type: *struc Pointer;
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].pointer[].exp_type[].tag ~= AST_Pointer_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arrow_not_struct_ptr), "MSG_arrow_not_struct_ptr", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].pointer[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ptr_type = @node[].pointer[].exp_type[].get._Pointer
    if ptr_type[].ref_type[].tag ~= AST_Structure_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arrow_not_struct_ptr), "MSG_arrow_not_struct_ptr", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].pointer[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_type = @ptr_type[].ref_type[].get._Structure
    map_it = (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arrow_incomplete), "MSG_arrow_incomplete", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_typedef = (ctx[].frontend[].struct_typedef_table[map_it]).value
    map_it = (? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_member_not_in_struct), "MSG_member_not_in_struct", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_name_fmt(ctx[].identifiers, node[].member, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    member_type = (struct_typedef[].members[map_it]).value[].member_type
    if member_type ~= node[]._base[].exp_type {
        "@MACRO@:sptr_copy(Type, member_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = member_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arr_typed_exp(addrof: **struc CExp) none {
    {
        ref_type: *struc Type = nil
        if (addrof[])[].exp_type[].get._Array.elem_type ~= ref_type {
            "@MACRO@:sptr_copy(Type, (*addrof)->exp_type->get._Array.elem_type, ref_type)"
            free_Type(@ref_type)
            ref_type = (addrof[])[].exp_type[].get._Array.elem_type
            (ref_type)[]._ref_count++
        }
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = make_Pointer(@ref_type)
    }
    info_at: u64 = (addrof[])[].info_at
    addrof[] = make_CAddrOf(addrof, info_at)
    if (addrof[])[].get._CAddrOf.exp[].exp_type ~= (addrof[])[].exp_type {
        "@MACRO@:sptr_copy(Type, (*addrof)->get._CAddrOf.exp->exp_type, (*addrof)->exp_type)"
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = (addrof[])[].get._CAddrOf.exp[].exp_type
        ((addrof[])[].exp_type)[]._ref_count++
    }
}

fn check_struct_typed_exp(ctx: *struc SemanticContext, node: *struc CExp) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_struct_complete(ctx, @node[].exp_type[].get._Structure) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_exp_incomplete), "MSG_exp_incomplete", "", "", get_type_fmt(ctx[].identifiers, node[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    match (exp[])[].exp_type[].tag {
        -> AST_Array_t {
            check_arr_typed_exp(exp)
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_struct_typed_exp(ctx, *exp))"
                _errval = check_struct_typed_exp(ctx, exp[])
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn check_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((ctx[].fun_def_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    if fun_type[].ret_type[].tag == AST_Void_t {
        if node[].exp {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_ret_value_in_void_fun), "MSG_ret_value_in_void_fun", "", "", get_name_fmt(ctx[].identifiers, ctx[].fun_def_name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    elif not node[].exp {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_no_ret_value_in_fun), "MSG_no_ret_value_in_fun", "", get_name_fmt(ctx[].identifiers, ctx[].fun_def_name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif not is_same_type(node[].exp[].exp_type, fun_type[].ret_type) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_assign(ctx, &fun_type->ret_type, &node->exp))"
            _errval = cast_assign(ctx, @fun_type[].ret_type, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_typed_exp(ctx, &node->exp))"
        _errval = check_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_if_statement(ctx: *struc SemanticContext, node: *struc CIf) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_if), "MSG_invalid_if", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_while), "MSG_invalid_while", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_do_while), "MSG_invalid_do_while", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_for_statement(ctx: *struc SemanticContext, node: *struc CFor) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_for), "MSG_invalid_for", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_switch_int_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: *i32 = nil
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_int_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstInt(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = nil
        }
        values = nil
    }
    return _errval
}

fn check_switch_long_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: *i64 = nil
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_long_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstLong(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = nil
        }
        values = nil
    }
    return _errval
}

fn check_switch_uint_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: *u32 = nil
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_uint_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstUInt(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = nil
        }
        values = nil
    }
    return _errval
}

fn check_switch_ulong_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: *u64 = nil
    _errval: i32 = 0
    loop .. while 0 {
        (? (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].capacity else 0) < cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) then ((((values)) = stbds_arrgrowf(((values)), sizeof(((values))[]), (0), (cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))))))) and 0 else 0)
        ? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length = cast<u64>(((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0))) else 0
    }
    loop i: u64 = 0 while i < (? (values) then (cast<*struc stbds_array_header>((values)) - 1)[].length else 0) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_ulong_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstULong(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            "@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    if values {
        loop .. while 0 {
            cast<none>((? (values) then free((cast<*struc stbds_array_header>((values)) - 1)) else cast<none>(0)))
            (values) = nil
        }
        values = nil
    }
    return _errval
}

fn check_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_int(node[].lookup[].exp_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->lookup->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_switch), "MSG_invalid_switch", "", "", get_type_fmt(ctx[].identifiers, node[].lookup[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].lookup[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].lookup[].exp_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    loop .. while 0 {
                        "@MACRO@:TRY(promote_char_to_int(ctx, &node->lookup))"
                        _errval = promote_char_to_int(ctx, @node[].lookup)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    match node[].lookup[].exp_type[].tag {
        -> AST_Int_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_switch_int_cases(ctx, node))"
                _errval = check_switch_int_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Long_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_switch_long_cases(ctx, node))"
                _errval = check_switch_long_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_UInt_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_switch_uint_cases(ctx, node))"
                _errval = check_switch_uint_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_ULong_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_switch_ulong_cases(ctx, node))"
                _errval = check_switch_ulong_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_bound_string_init(ctx: *struc SemanticContext, node: *struc CString, arr_type: *struc Array) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_char(arr_type[].elem_type) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_string_init_not_char_arr), "MSG_string_init_not_char_arr", "", "", get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif (? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        strto_fmt_2 = ? ((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))))
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_string_init_overflow), "MSG_string_init_overflow", "", strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) i32 {
    _errval: i32 = 0
    if not is_same_type(node[].exp[].exp_type, init_type[]) {
        loop .. while 0 {
            "@MACRO@:TRY(cast_assign(ctx, init_type, &node->exp))"
            _errval = cast_assign(ctx, init_type, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        "@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
    label _Lfinally
    return _errval
}

fn check_string_init(node: *struc CSingleInit, init_type: **struc Type) none {
    if init_type[] ~= node[].exp[].exp_type {
        "@MACRO@:sptr_copy(Type, *init_type, node->exp->exp_type)"
        free_Type(@node[].exp[].exp_type)
        node[].exp[].exp_type = init_type[]
        (node[].exp[].exp_type)[]._ref_count++
    }
    if init_type[] ~= node[]._base[].init_type {
        "@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
}
fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer;

fn check_single_zero_init(elem_type: *struc Type) *struc CInitializer {
    exp: *struc CExp = nil
    {
        constant: *struc CConst = nil
        match elem_type[].tag {
            -> AST_Char_t {
                -> AST_SChar_t {
                    constant = make_CConstChar(0)
                    break
                }
            }
            -> AST_Int_t {
                constant = make_CConstInt(0)
                break
            }
            -> AST_Long_t {
                constant = make_CConstLong(0l)
                break
            }
            -> AST_Double_t {
                constant = make_CConstDouble(0.0)
                break
            }
            -> AST_UChar_t {
                constant = make_CConstUChar(0u)
                break
            }
            -> AST_UInt_t {
                constant = make_CConstUInt(0u)
                break
            }
            -> AST_ULong_t {
                -> AST_Pointer_t {
                    constant = make_CConstULong(0ul)
                    break
                }
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        exp = make_CConstant(@constant, 0)
    }

    return make_CSingleInit(@exp)
}

fn check_arr_zero_init(ctx: *struc SemanticContext, arr_type: *struc Array) *struc CInitializer {
    zero_inits: **struc CInitializer = nil
    arr_type_size: u64 = cast<u64>(arr_type[].size)
    (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (0), (arr_type_size))))
    loop i: u64 = 0 while i < arr_type_size .. ++i {
        initializer: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (zero_inits) or (cast<*struc stbds_array_header>((zero_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((zero_inits)) - 1)[].capacity) then (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (1), (0))) and 0) else 0)
                (zero_inits)[(cast<*struc stbds_array_header>((zero_inits)) - 1)[].length++] = (initializer)
            }
            initializer = nil
        }
    }
    return make_CCompoundInit(@zero_inits)
}

fn check_struct_zero_init(ctx: *struc SemanticContext, struct_type: *struc Structure) *struc CInitializer {
    zero_inits: **struc CInitializer = nil
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (0), ((? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (struct_typedef[].member_names) then (cast<*struc stbds_array_header>((struct_typedef[].member_names)) - 1)[].length else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        initializer: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (zero_inits) or (cast<*struc stbds_array_header>((zero_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((zero_inits)) - 1)[].capacity) then (((zero_inits) = stbds_arrgrowf((zero_inits), sizeof((zero_inits)[]), (1), (0))) and 0) else 0)
                (zero_inits)[(cast<*struc stbds_array_header>((zero_inits)) - 1)[].length++] = (initializer)
            }
            initializer = nil
        }
    }
    return make_CCompoundInit(@zero_inits)
}

fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer {
    match init_type[].tag {
        -> AST_Array_t {
            return check_arr_zero_init(ctx, @init_type[].get._Array)
        }
        -> AST_Structure_t {
            return check_struct_zero_init(ctx, @init_type[].get._Structure)
        }
        otherwise {
            return check_single_zero_init(init_type)
        }
    }
}

fn check_bound_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        strto_fmt_2 = ? ((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0))))
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arr_init_overflow), "MSG_arr_init_overflow", strto_fmt_1, get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt), strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_bound_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    bound: u64 = ? struct_type[].is_union then 1 else (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0)
    if (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) > bound {
        strto_fmt_1 = ? ((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)) > 0 then sdsfromunsignedlong(cast<u64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0)))) else sdsfromlong(cast<i64>(((? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0))))
        strto_fmt_2 = ? (bound) > 0 then sdsfromunsignedlong(cast<u64>((bound))) else sdsfromlong(cast<i64>((bound)))
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_struct_init_overflow), "MSG_struct_init_overflow", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) none {
    loop while (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) < cast<u64>(arr_type[].size) {
        zero_init: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (node[].initializers) or (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].capacity) then (((node[].initializers) = stbds_arrgrowf((node[].initializers), sizeof((node[].initializers)[]), (1), (0))) and 0) else 0)
                (node[].initializers)[(cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length++] = (zero_init)
            }
            zero_init = nil
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        "@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
}

fn check_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) none {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    loop i: u64 = (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) while i < (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        zero_init: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (node[].initializers) or (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].capacity) then (((node[].initializers) = stbds_arrgrowf((node[].initializers), sizeof((node[].initializers)[]), (1), (0))) and 0) else 0)
                (node[].initializers)[(cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length++] = (zero_init)
            }
            zero_init = nil
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        "@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
}

fn check_ret_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, fun_type->ret_type))"
        _errval = reslv_struct_type(ctx, fun_type[].ret_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, fun_type->ret_type))"
        _errval = is_valid_type(ctx, fun_type[].ret_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match fun_type[].ret_type[].tag {
        -> AST_Array_t {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_ret_arr), "MSG_ret_arr", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> AST_Structure_t {
            if node[].body and not is_struct_complete(ctx, @fun_type[].ret_type[].get._Structure) {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_ret_incomplete), "MSG_ret_incomplete", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            break
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arr_param_decl(fun_type: *struc FunType, i: u64) none {
    ref_type: *struc Type = nil
    if fun_type[].param_types[i][].get._Array.elem_type ~= ref_type {
        "@MACRO@:sptr_copy(Type, fun_type->param_types[i]->get._Array.elem_type, ref_type)"
        free_Type(@ref_type)
        ref_type = fun_type[].param_types[i][].get._Array.elem_type
        (ref_type)[]._ref_count++
    }
    free_Type(@fun_type[].param_types[i])
    fun_type[].param_types[i] = make_Pointer(@ref_type)
}

fn check_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt_1: string = ? nil then sdsnew(nil) else nil
    name_fmt_2: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    param_attrs: *struc IdentifierAttr = nil
    symbol: *struc Symbol = nil
    param_type: *struc Type = nil
    _errval: i32 = 0
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    loop i: u64 = 0 while i < (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) .. ++i {
        ctx[].errors[].info_at_buf = node[].info_at
        loop .. while 0 {
            "@MACRO@:TRY(reslv_struct_type(ctx, fun_type->param_types[i]))"
            _errval = reslv_struct_type(ctx, fun_type[].param_types[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if fun_type[].param_types[i][].tag == AST_Void_t {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_void_param), "MSG_void_param", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].params[i], @name_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(is_valid_type(ctx, fun_type->param_types[i]))"
            _errval = is_valid_type(ctx, fun_type[].param_types[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if fun_type[].param_types[i][].tag == AST_Array_t {
            check_arr_param_decl(fun_type, i)
        }
        if node[].body {
            if fun_type[].param_types[i][].tag == AST_Structure_t and not is_struct_complete(ctx, @fun_type[].param_types[i][].get._Structure) {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_param), "MSG_incomplete_param", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].params[i], @name_fmt_2), get_type_fmt(ctx[].identifiers, fun_type[].param_types[i], @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            if fun_type[].param_types[i] ~= param_type {
                "@MACRO@:sptr_copy(Type, fun_type->param_types[i], param_type)"
                free_Type(@param_type)
                param_type = fun_type[].param_types[i]
                (param_type)[]._ref_count++
            }
            param_attrs = make_LocalAttr()
            symbol = make_Symbol(@param_type, @param_attrs)
            loop .. while 0 {
                loop .. while 0 {
                    (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].params[i]))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].params[i])
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
                }
                symbol = nil
            }
        }
    }
    label _Lfinally
    if name_fmt_1 {
        sdsfree(name_fmt_1)
        name_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if name_fmt_2 {
        sdsfree(name_fmt_2)
        name_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@param_attrs)
    free_Symbol(@symbol)
    free_Type(@param_type)
    return _errval
}

fn check_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    glob_fun_attrs: *struc IdentifierAttr = nil
    symbol: *struc Symbol = nil
    glob_fun_type: *struc Type = nil
    _errval: i32 = 0
    is_def: i32 = (? ((ctx[].fun_def_set) = stbds_hmget_key((ctx[].fun_def_set), sizeof((ctx[].fun_def_set)[]), cast<*any>(@((node[].name))), sizeof((ctx[].fun_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp) ~= -1
    is_glob: i32 = node[].storage_class.tag ~= AST_CStatic_t
    map_it: i64 = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        fun_symbol: *struc Symbol = (ctx[].frontend[].symbol_table[map_it]).value
        fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
        if not (fun_symbol[].type_t[].tag == AST_FunType_t and (? (fun_type[].param_types) then (cast<*struc stbds_array_header>((fun_type[].param_types)) - 1)[].length else 0) == (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) and is_same_fun_type(@node[].fun_type[].get._FunType, fun_type)) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_fun_conflict), "MSG_redecl_fun_conflict", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].fun_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, fun_symbol[].type_t, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif is_def and node[].body {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redef_fun), "MSG_redef_fun", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].fun_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        fun_attrs: *struc FunAttr = @fun_symbol[].attrs[].get._FunAttr
        if not is_glob and fun_attrs[].is_glob {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_static_conflict), "MSG_redecl_static_conflict", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        is_glob = fun_attrs[].is_glob
        free_Symbol(@fun_symbol)
    }
    if node[].body {
        loop .. while 0 {
            (ctx[].fun_def_set) = stbds_hmput_key((ctx[].fun_def_set), sizeof((ctx[].fun_def_set)[]), cast<*any>(@((node[].name))), sizeof((ctx[].fun_def_set)[].key), 0)
            (ctx[].fun_def_set)[(cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].fun_def_set)[(cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp].value = (0)
        }
        is_def = true
        ctx[].fun_def_name = node[].name
    }
    if node[].fun_type ~= glob_fun_type {
        "@MACRO@:sptr_copy(Type, node->fun_type, glob_fun_type)"
        free_Type(@glob_fun_type)
        glob_fun_type = node[].fun_type
        (glob_fun_type)[]._ref_count++
    }
    glob_fun_attrs = make_FunAttr(is_def, is_glob)
    symbol = make_Symbol(@glob_fun_type, @glob_fun_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@glob_fun_attrs)
    free_Symbol(@symbol)
    free_Type(@glob_fun_type)
    return _errval
}

fn push_static_init(ctx: *struc SemanticContext, static_init: *struc StaticInit) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_static_inits[]) or (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].capacity) then (((ctx[].p_static_inits[]) = stbds_arrgrowf((ctx[].p_static_inits[]), sizeof((ctx[].p_static_inits[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_static_inits[])[(cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length++] = (static_init)
        }
        static_init = nil
    }
}

fn push_zero_static_init(ctx: *struc SemanticContext, byte: i64) none {
    if not ((? (ctx[].p_static_inits[]) then (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length else 0) == 0) and (ctx[].p_static_inits[])[(? (ctx[].p_static_inits[]) then (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length else 0) - 1][].tag == AST_ZeroInit_t {
        (ctx[].p_static_inits[])[(? (ctx[].p_static_inits[]) then (cast<*struc stbds_array_header>((ctx[].p_static_inits[])) - 1)[].length else 0) - 1][].get._ZeroInit.byte += byte
    }
    else {
        push_static_init(ctx, make_ZeroInit(byte))
    }
}

fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) i32;

fn check_static_no_init(ctx: *struc SemanticContext, static_init_type: *struc Type, size: i64) none {
    byte: i64 = ? static_init_type == nil then size else get_type_scale(ctx, static_init_type) * size
    push_zero_static_init(ctx, byte)
}

fn check_no_initializer(ctx: *struc SemanticContext, static_init_type: *struc Type) *struc InitialValue {
    static_inits: **struc StaticInit = nil
    {
        ctx[].p_static_inits = @static_inits
        check_static_no_init(ctx, static_init_type, 1l)
        ctx[].p_static_inits = nil
    }

    return make_Initial(@static_inits)
}

fn make_binary_identifier(ctx: *struc SemanticContext, binary: u64) u64 {
    strto_binary: string = ? (binary) > 0 then sdsfromunsignedlong(cast<u64>((binary))) else sdsfromlong(cast<i64>((binary)))
    return make_string_identifier(ctx[].identifiers, @strto_binary)
}

fn check_static_const_init(ctx: *struc SemanticContext, node: *struc CConstant, static_init_type: *struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match static_init_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = get_const_char_value(node)
                if value == 0 {
                    push_zero_static_init(ctx, 1l)
                }
                else {
                    push_static_init(ctx, make_CharInit(value))
                }
                break
            }
        }
        -> AST_Int_t {
            value: i32 = get_const_int_value(node)
            if value == 0 {
                push_zero_static_init(ctx, 4l)
            }
            else {
                push_static_init(ctx, make_IntInit(value))
            }
            break
        }
        -> AST_Long_t {
            value: i64 = get_const_long_value(node)
            if value == 0l {
                push_zero_static_init(ctx, 8l)
            }
            else {
                push_static_init(ctx, make_LongInit(value))
            }
            break
        }
        -> AST_Double_t {
            value: f64 = get_const_dbl_value(node)
            binary: u64 = dbl_to_binary(value)
            if binary == 0ul {
                push_zero_static_init(ctx, 8l)
            }
            else {
                dbl_const: u64 = make_binary_identifier(ctx, binary)
                push_static_init(ctx, make_DoubleInit(dbl_const))
            }
            break
        }
        -> AST_UChar_t {
            value: u8 = get_const_uchar_value(node)
            if value == 0u {
                push_zero_static_init(ctx, 1l)
            }
            else {
                push_static_init(ctx, make_UCharInit(value))
            }
            break
        }
        -> AST_UInt_t {
            value: u32 = get_const_uint_value(node)
            if value == 0u {
                push_zero_static_init(ctx, 4l)
            }
            else {
                push_static_init(ctx, make_UIntInit(value))
            }
            break
        }
        -> AST_ULong_t {
            value: u64 = get_const_ulong_value(node)
            if value == 0ul {
                push_zero_static_init(ctx, 8l)
            }
            else {
                push_static_init(ctx, make_ULongInit(value))
            }
            break
        }
        -> AST_Pointer_t {
            match node[].constant[].tag {
                -> AST_CConstChar_t {
                    -> AST_CConstDouble_t {
                        -> AST_CConstUChar_t {
                            loop .. while 0 {
                                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_ptr_init_not_int), "MSG_static_ptr_init_not_int", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt), get_const_fmt(node[].constant)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                                _errval = 1
                                jump _Lfinally
                            }
                        }
                    }
                }
                otherwise {
                    break
                }
            }
            value: u64 = get_const_ptr_value(node)
            if value ~= 0ul {
                strto_fmt = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_ptr_init_not_null), "MSG_static_ptr_init_not_null", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt), strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            push_zero_static_init(ctx, 8l)
            break
        }
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_agg_init_with_single), "MSG_agg_init_with_single", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt {
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_literal_string_init(ctx: *struc SemanticContext, node: *struc CString, static_ptr_type: *struc Pointer) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if static_ptr_type[].ref_type[].tag ~= AST_Char_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_ptr_init_string), "MSG_static_ptr_init_string", "", "", get_ptr_fmt(ctx[].identifiers, static_ptr_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn make_literal_identifier(ctx: *struc SemanticContext, node: *struc CStringLiteral) u64 {
    value: string = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}

fn check_static_ptr_string_init(ctx: *struc SemanticContext, node: *struc CString) none {
    string_const_label: u64;
    {
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        map_it: i64 = (? ((ctx[].frontend[].string_const_table) = stbds_hmget_key((ctx[].frontend[].string_const_table), sizeof((ctx[].frontend[].string_const_table)[]), cast<*any>(@((string_const))), sizeof((ctx[].frontend[].string_const_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            string_const_label = (ctx[].frontend[].string_const_table[map_it]).value
        }
        else {
            string_const_label = repr_label_identifier(ctx[].identifiers, LBL_Lstring)
            loop .. while 0 {
                (ctx[].frontend[].string_const_table) = stbds_hmput_key((ctx[].frontend[].string_const_table), sizeof((ctx[].frontend[].string_const_table)[]), cast<*any>(@((string_const))), sizeof((ctx[].frontend[].string_const_table)[].key), 0)
                (ctx[].frontend[].string_const_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp].key = (string_const)
                (ctx[].frontend[].string_const_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp].value = (string_const_label)
            }

            constant_type: *struc Type = nil
            {
                size: i64 = (cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))) + 1l
                elem_type: *struc Type = make_Char()
                constant_type = make_Array(size, @elem_type)
            }

            constant_attrs: *struc IdentifierAttr = nil
            {
                static_init: *struc StaticInit = nil
                {
                    literal: *struc CStringLiteral = nil
                    if node[].literal ~= literal {
                        "@MACRO@:sptr_copy(CStringLiteral, node->literal, literal)"
                        free_CStringLiteral(@literal)
                        literal = node[].literal
                        (literal)[]._ref_count++
                    }
                    static_init = make_StringInit(string_const, true, @literal)
                }

                constant_attrs = make_ConstantAttr(@static_init)
            }
            symbol: *struc Symbol = make_Symbol(@constant_type, @constant_attrs)
            loop .. while 0 {
                loop .. while 0 {
                    (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((string_const_label))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (string_const_label)
                    (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
                }
                symbol = nil
            }
        }
    }
    push_static_init(ctx, make_PointerInit(string_const_label))
}

fn check_static_arr_string_init(ctx: *struc SemanticContext, node: *struc CString, static_arr_type: *struc Array) i32 {
    literal: *struc CStringLiteral = nil
    _errval: i32 = 0
    byte: i64;
    loop .. while 0 {
        "@MACRO@:TRY(check_bound_string_init(ctx, node, static_arr_type))"
        _errval = check_bound_string_init(ctx, node, static_arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    byte = static_arr_type[].size - (cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0))) - 1l
    {
        is_null_term: i32 = byte >= 0l
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        if node[].literal ~= literal {
            "@MACRO@:sptr_copy(CStringLiteral, node->literal, literal)"
            free_CStringLiteral(@literal)
            literal = node[].literal
            (literal)[]._ref_count++
        }
        push_static_init(ctx, make_StringInit(string_const, is_null_term, @literal))
    }
    if byte > 0l {
        push_zero_static_init(ctx, byte)
    }
    label _Lfinally
    free_CStringLiteral(@literal)
    return _errval
}

fn check_static_string_init(ctx: *struc SemanticContext, node: *struc CString, static_init_type: *struc Type) i32 {
    _errval: i32 = 0
    match static_init_type[].tag {
        -> AST_Pointer_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_literal_string_init(ctx, node, &static_init_type->get._Pointer))"
                _errval = check_literal_string_init(ctx, node, @static_init_type[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        check_static_ptr_string_init(ctx, node)
        break
        -> AST_Array_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_arr_string_init(ctx, node, &static_init_type->get._Array))"
                _errval = check_static_arr_string_init(ctx, node, @static_init_type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_single_static_init(ctx: *struc SemanticContext, node: *struc CSingleInit, static_init_type: *struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match node[].exp[].tag {
        -> AST_CConstant_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_const_init(ctx, &node->exp->get._CConstant, static_init_type))"
                _errval = check_static_const_init(ctx, @node[].exp[].get._CConstant, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CString_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_string_init(ctx, &node->exp->get._CString, static_init_type))"
                _errval = check_static_string_init(ctx, @node[].exp[].get._CString, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->exp->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_init_not_const), "MSG_static_init_not_const", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].exp[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_static_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(check_bound_arr_init(ctx, node, arr_type))"
        _errval = check_bound_arr_init(ctx, node, arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            "@MACRO@:TRY(check_static_init(ctx, node->initializers[i], arr_type->elem_type))"
            _errval = check_static_init(ctx, node[].initializers[i], arr_type[].elem_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if cast<u64>(arr_type[].size) > (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) {
        check_static_no_init(ctx, arr_type[].elem_type, arr_type[].size - (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0))
    }
    label _Lfinally
    return _errval
}

fn check_static_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) i32 {
    _errval: i32 = 0
    size: i64;
    loop .. while 0 {
        "@MACRO@:TRY(check_bound_struct_init(ctx, node, struct_type))"
        _errval = check_bound_struct_init(ctx, node, struct_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    size = 0l
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        if member[].offset ~= size {
            check_static_no_init(ctx, nil, member[].offset - size)
            size = member[].offset
        }
        loop .. while 0 {
            "@MACRO@:TRY(check_static_init(ctx, node->initializers[i], member->member_type))"
            _errval = check_static_init(ctx, node[].initializers[i], member[].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        size += get_type_scale(ctx, member[].member_type)
    }
    size -= ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    if size ~= 0l {
        check_static_no_init(ctx, nil, -1l * size)
    }
    label _Lfinally
    return _errval
}

fn check_static_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, static_init_type: *struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match static_init_type[].tag {
        -> AST_Array_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_arr_init(ctx, node, &static_init_type->get._Array))"
                _errval = check_static_arr_init(ctx, node, @static_init_type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_struct_init(ctx, node, &static_init_type->get._Structure))"
                _errval = check_static_struct_init(ctx, node, @static_init_type[].get._Structure)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_scalar_init_with_compound), "MSG_scalar_init_with_compound", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CSingleInit_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_single_static_init(ctx, &node->get._CSingleInit, static_init_type))"
                _errval = check_single_static_init(ctx, @node[].get._CSingleInit, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCompoundInit_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_compound_init(ctx, &node->get._CCompoundInit, static_init_type))"
                _errval = check_static_compound_init(ctx, @node[].get._CCompoundInit, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type, init_value: **struc InitialValue) i32 {
    static_inits: **struc StaticInit = nil
    _errval: i32 = 0
    {
        ctx[].p_static_inits = @static_inits
        loop .. while 0 {
            "@MACRO@:TRY(check_static_init(ctx, node, static_init_type))"
            _errval = check_static_init(ctx, node, static_init_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].p_static_inits = nil
    }
    init_value[] = make_Initial(@static_inits)
    label _Lfinally
    loop i: u64 = 0 while i < (? (static_inits) then (cast<*struc stbds_array_header>((static_inits)) - 1)[].length else 0) .. ++i {
        free_StaticInit(@static_inits[i])
    }
    if static_inits {
        loop .. while 0 {
            cast<none>((? (static_inits) then free((cast<*struc stbds_array_header>((static_inits)) - 1)) else cast<none>(0)))
            (static_inits) = nil
        }
        static_inits = nil
    }
    return _errval
}

fn check_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    glob_var_attrs: *struc IdentifierAttr = nil
    symbol: *struc Symbol = nil
    init_value: *struc InitialValue = nil
    glob_var_type: *struc Type = nil
    _errval: i32 = 0
    is_glob: i32;
    map_it: i64;
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, node->var_type))"
        _errval = reslv_struct_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].var_type[].tag == AST_Void_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_void_var_decl), "MSG_void_var_decl", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, node->var_type))"
        _errval = is_valid_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    is_glob = node[].storage_class.tag ~= AST_CStatic_t
    if node[].init {
        if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_var_decl), "MSG_incomplete_var_decl", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(check_initializer(ctx, node->init, node->var_type, &init_value))"
            _errval = check_initializer(ctx, node[].init, node[].var_type, @init_value)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        if node[].storage_class.tag == AST_CExtern_t {
            init_value = make_NoInitializer()
        }
        else {
            if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_var_decl), "MSG_incomplete_var_decl", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            init_value = make_Tentative()
        }
    }
    map_it = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        var_symbol: *struc Symbol = (ctx[].frontend[].symbol_table[map_it]).value
        if not is_same_type(var_symbol[].type_t, node[].var_type) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_conflict), "MSG_redecl_var_conflict", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, var_symbol[].type_t, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        var_attrs: *struc StaticAttr = @var_symbol[].attrs[].get._StaticAttr
        if node[].storage_class.tag == AST_CExtern_t {
            is_glob = var_attrs[].is_glob
        }
        elif is_glob ~= var_attrs[].is_glob {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_storage), "MSG_redecl_var_storage", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        if var_attrs[].init[].tag == AST_Initial_t {
            if init_value[].tag == AST_Initial_t {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_storage), "MSG_redecl_var_storage", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            else {
                if var_attrs[].init ~= init_value {
                    "@MACRO@:sptr_copy(InitialValue, var_attrs->init, init_value)"
                    free_InitialValue(@init_value)
                    init_value = var_attrs[].init
                    (init_value)[]._ref_count++
                }
            }
        }
        free_Symbol(@var_symbol)
    }
    if node[].var_type ~= glob_var_type {
        "@MACRO@:sptr_copy(Type, node->var_type, glob_var_type)"
        free_Type(@glob_var_type)
        glob_var_type = node[].var_type
        (glob_var_type)[]._ref_count++
    }
    glob_var_attrs = make_StaticAttr(is_glob, @init_value)
    symbol = make_Symbol(@glob_var_type, @glob_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@glob_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@glob_var_type)
    return _errval
}

fn check_extern_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    local_var_attrs: *struc IdentifierAttr = nil
    symbol: *struc Symbol = nil
    init_value: *struc InitialValue = nil
    local_var_type: *struc Type = nil
    _errval: i32 = 0
    map_it: i64;
    if node[].init {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redef_extern_var), "MSG_redef_extern_var", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    map_it = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        var_type: *struc Type = (ctx[].frontend[].symbol_table[map_it]).value[].type_t
        if not is_same_type(var_type, node[].var_type) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_conflict), "MSG_redecl_var_conflict", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, var_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    if node[].var_type ~= local_var_type {
        "@MACRO@:sptr_copy(Type, node->var_type, local_var_type)"
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    init_value = make_NoInitializer()
    local_var_attrs = make_StaticAttr(true, @init_value)
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_1 {
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    return _errval
}

fn check_static_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    local_var_attrs: *struc IdentifierAttr = nil
    symbol: *struc Symbol = nil
    init_value: *struc InitialValue = nil
    local_var_type: *struc Type = nil
    _errval: i32 = 0
    if node[].init {
        loop .. while 0 {
            "@MACRO@:TRY(check_initializer(ctx, node->init, node->var_type, &init_value))"
            _errval = check_initializer(ctx, node[].init, node[].var_type, @init_value)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        init_value = check_no_initializer(ctx, node[].var_type)
    }
    if node[].var_type ~= local_var_type {
        "@MACRO@:sptr_copy(Type, node->var_type, local_var_type)"
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    local_var_attrs = make_StaticAttr(false, @init_value)
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = nil
    }
    label _Lfinally
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    return _errval
}

fn check_auto_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    local_var_attrs: *struc IdentifierAttr = nil
    symbol: *struc Symbol = nil
    local_var_type: *struc Type = nil
    _errval: i32 = 0
    if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_var_decl), "MSG_incomplete_var_decl", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].var_type ~= local_var_type {
        "@MACRO@:sptr_copy(Type, node->var_type, local_var_type)"
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    local_var_attrs = make_LocalAttr()
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_Type(@local_var_type)
    return _errval
}

fn check_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, node->var_type))"
        _errval = reslv_struct_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].var_type[].tag == AST_Void_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_void_var_decl), "MSG_void_var_decl", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(is_valid_type(ctx, node->var_type))"
        _errval = is_valid_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match node[].storage_class.tag {
        -> AST_CStorageClass_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_auto_block_var_decl(ctx, node))"
                _errval = check_auto_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CExtern_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_extern_block_var_decl(ctx, node))"
                _errval = check_extern_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CStatic_t {
            loop .. while 0 {
                "@MACRO@:TRY(check_static_block_var_decl(ctx, node))"
                _errval = check_static_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    struct_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) .. ++i {
        loop j: u64 = i + 1 while j < (? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) .. ++j {
            if node[].members[i][].member_name == node[].members[j][].member_name {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->members[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_member_decl), "MSG_duplicate_member_decl", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt), get_name_fmt(ctx[].identifiers, node[].members[i][].member_name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].members[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        ctx[].errors[].info_at_buf = node[].members[i][].info_at
        loop .. while 0 {
            "@MACRO@:TRY(reslv_struct_type(ctx, node->members[i]->member_type))"
            _errval = reslv_struct_type(ctx, node[].members[i][].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if not is_type_complete(ctx, node[].members[i][].member_type) {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->members[i]->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_member_decl), "MSG_incomplete_member_decl", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt), get_name_fmt(ctx[].identifiers, node[].members[i][].member_name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].members[i][].member_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].members[i][].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(is_valid_type(ctx, node->members[i]->member_type))"
            _errval = is_valid_type(ctx, node[].members[i][].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if struct_fmt {
        sdsfree(struct_fmt)
        struct_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    struct_fmt: string = ? nil then sdsnew(nil) else nil
    struct_member: *struc StructMember = nil
    struct_typedef: *struc StructTypedef = nil
    member_type: *struc Type = nil
    member_names: *u64 = nil
    members: *struc PairTIdentifierUPtrStructMember = nil
    _errval: i32 = 0
    alignment: i32;
    size: i64;
    if (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp) ~= -1 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_in_scope), "MSG_redecl_struct_in_scope", "", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    alignment = 0
    size = 0l
    (((member_names) = stbds_arrgrowf((member_names), sizeof((member_names)[]), (0), ((? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) .. ++i {
        {
            name: u64 = node[].members[i][].member_name
            loop .. while 0 {
                (? (not (member_names) or (cast<*struc stbds_array_header>((member_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((member_names)) - 1)[].capacity) then (((member_names) = stbds_arrgrowf((member_names), sizeof((member_names)[]), (1), (0))) and 0) else 0)
                (member_names)[(cast<*struc stbds_array_header>((member_names)) - 1)[].length++] = (name)
            }
        }
        member_alignment: i32 = get_type_alignment(ctx, node[].members[i][].member_type)
        member_size: i64 = get_type_scale(ctx, node[].members[i][].member_type)
        {
            offset: i64 = 0l
            if node[].is_union {
                if size < member_size {
                    size = member_size
                }
            }
            else {
                offset = size % member_alignment
                if offset ~= 0l {
                    size += member_alignment - offset
                }
                offset = size
                size += member_size
            }
            if node[].members[i][].member_type ~= member_type {
                "@MACRO@:sptr_copy(Type, node->members[i]->member_type, member_type)"
                free_Type(@member_type)
                member_type = node[].members[i][].member_type
                (member_type)[]._ref_count++
            }
            struct_member = make_StructMember(offset, @member_type)
            loop .. while 0 {
                loop .. while 0 {
                    (members) = stbds_hmput_key((members), sizeof((members)[]), cast<*any>(@(((member_names)[(? (member_names) then (cast<*struc stbds_array_header>((member_names)) - 1)[].length else 0) - 1]))), sizeof((members)[].key), 0)
                    (members)[(cast<*struc stbds_array_header>(((members) - 1)) - 1)[].temp].key = ((member_names)[(? (member_names) then (cast<*struc stbds_array_header>((member_names)) - 1)[].length else 0) - 1])
                    (members)[(cast<*struc stbds_array_header>(((members) - 1)) - 1)[].temp].value = (struct_member)
                }
                struct_member = nil
            }
        }
        if alignment < member_alignment {
            alignment = member_alignment
        }
    }
    {
        offset: i64 = size % alignment
        if offset ~= 0l {
            size += alignment - offset
        }
    }
    struct_typedef = make_StructTypedef(alignment, size, @member_names, @members)
    loop .. while 0 {
        loop .. while 0 {
            (ctx[].frontend[].struct_typedef_table) = stbds_hmput_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)
            (ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp].key = (node[].tag_name)
            (ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp].value = (struct_typedef)
        }
        struct_typedef = nil
    }
    label _Lfinally
    if struct_fmt {
        sdsfree(struct_fmt)
        struct_fmt = ? nil then sdsnew(nil) else nil
    }
    free_StructMember(@struct_member)
    free_StructTypedef(@struct_typedef)
    free_Type(@member_type)
    if member_names {
        loop .. while 0 {
            cast<none>((? (member_names) then free((cast<*struc stbds_array_header>((member_names)) - 1)) else cast<none>(0)))
            (member_names) = nil
        }
        member_names = nil
    }
    loop i: u64 = 0 while i < (? (members) then (cast<*struc stbds_array_header>(((members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@(members[i]).value)
    }
    if members {
        loop .. while 0 {
            cast<none>((? (members) ~= nil then stbds_hmfree_func((members) - 1, sizeof((members)[])) else cast<none>(0)))
            (members) = nil
        }
        members = nil
    }
    return _errval
}

fn annotate_goto_label(ctx: *struc SemanticContext, node: *struc CLabel) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (? ((ctx[].label_set) = stbds_hmget_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@((node[].target))), sizeof((ctx[].label_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp) ~= -1 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redef_label_in_scope), "MSG_redef_label_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].target, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        (ctx[].label_set) = stbds_hmput_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@((node[].target))), sizeof((ctx[].label_set)[].key), 0)
        (ctx[].label_set)[(cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp].key = (node[].target)
        (ctx[].label_set)[(cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp].value = (0)
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn annotate_while_loop(ctx: *struc SemanticContext, node: *struc CWhile) none {
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Lwhile)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
    loop .. while 0 {
        (? (not (ctx[].continue_loop_labels) or (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].capacity) then (((ctx[].continue_loop_labels) = stbds_arrgrowf((ctx[].continue_loop_labels), sizeof((ctx[].continue_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].continue_loop_labels)[(cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length++] = (node[].target)
    }
}

fn annotate_do_while_loop(ctx: *struc SemanticContext, node: *struc CDoWhile) none {
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Ldo_while)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
    loop .. while 0 {
        (? (not (ctx[].continue_loop_labels) or (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].capacity) then (((ctx[].continue_loop_labels) = stbds_arrgrowf((ctx[].continue_loop_labels), sizeof((ctx[].continue_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].continue_loop_labels)[(cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length++] = (node[].target)
    }
}

fn annotate_for_loop(ctx: *struc SemanticContext, node: *struc CFor) none {
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Lfor)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
    loop .. while 0 {
        (? (not (ctx[].continue_loop_labels) or (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].capacity) then (((ctx[].continue_loop_labels) = stbds_arrgrowf((ctx[].continue_loop_labels), sizeof((ctx[].continue_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].continue_loop_labels)[(cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length++] = (node[].target)
    }
}

fn annotate_switch_lookup(ctx: *struc SemanticContext, node: *struc CSwitch) none {
    node[].is_default = false
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Lswitch)
    loop .. while 0 {
        (? (not (ctx[].break_loop_labels) or (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].capacity) then (((ctx[].break_loop_labels) = stbds_arrgrowf((ctx[].break_loop_labels), sizeof((ctx[].break_loop_labels)[]), (1), (0))) and 0) else 0)
        (ctx[].break_loop_labels)[(cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length++] = (node[].target)
    }
}

fn annotate_case_jump(ctx: *struc SemanticContext, node: *struc CCase) i32 {
    _errval: i32 = 0
    if not ctx[].p_switch_statement {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->value->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_case_out_of_switch), "MSG_case_out_of_switch", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].value[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = repr_case_identifier(ctx[].identifiers, ctx[].p_switch_statement[].target, false, (? (ctx[].p_switch_statement[].cases) then (cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].length else 0))
    label _Lfinally
    return _errval
}

fn annotate_default_jump(ctx: *struc SemanticContext, node: *struc CDefault) i32 {
    _errval: i32 = 0
    if not ctx[].p_switch_statement {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_default_out_of_switch), "MSG_default_out_of_switch", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].p_switch_statement[].is_default {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_multiple_default), "MSG_multiple_default", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = ctx[].p_switch_statement[].target
    ctx[].p_switch_statement[].is_default = true
    label _Lfinally
    return _errval
}

fn annotate_break_jump(ctx: *struc SemanticContext, node: *struc CBreak) i32 {
    _errval: i32 = 0
    if ((? (ctx[].break_loop_labels) then (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_break_out_of_loop), "MSG_break_out_of_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = (ctx[].break_loop_labels)[(? (ctx[].break_loop_labels) then (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length else 0) - 1]
    label _Lfinally
    return _errval
}

fn annotate_continue_jump(ctx: *struc SemanticContext, node: *struc CContinue) i32 {
    _errval: i32 = 0
    if ((? (ctx[].continue_loop_labels) then (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_continue_out_of_loop), "MSG_continue_out_of_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = (ctx[].continue_loop_labels)[(? (ctx[].continue_loop_labels) then (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length else 0) - 1]
    label _Lfinally
    return _errval
}

fn deannotate_loop(ctx: *struc SemanticContext) none {
    ((cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length--)
    ((cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length--)
}

fn deannotate_lookup(ctx: *struc SemanticContext) none {
    ((cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length--)
}

fn is_file_scope(ctx: *struc SemanticContext) i32 {
    return (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) == 1
}

fn enter_scope(ctx: *struc SemanticContext) none {
    loop .. while 0 {
        (? (not (ctx[].scoped_identifier_maps) or (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].capacity) then (((ctx[].scoped_identifier_maps) = stbds_arrgrowf((ctx[].scoped_identifier_maps), sizeof((ctx[].scoped_identifier_maps)[]), (1), (0))) and 0) else 0)
        (ctx[].scoped_identifier_maps)[(cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length++] = (nil)
    }
    loop .. while 0 {
        (? (not (ctx[].scoped_struct_maps) or (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].capacity) then (((ctx[].scoped_struct_maps) = stbds_arrgrowf((ctx[].scoped_struct_maps), sizeof((ctx[].scoped_struct_maps)[]), (1), (0))) and 0) else 0)
        (ctx[].scoped_struct_maps)[(cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length++] = (nil)
    }
}

fn exit_scope(ctx: *struc SemanticContext) none {
    loop i: u64 = 0 while i < (? ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) then (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].length - 1 else 0) .. ++i {
        identifier: u64 = ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1][i]).key
        map_it: i64 = (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((identifier))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp)
        if map_it ~= -1 and (ctx[].extern_scope_map[map_it]).value == (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) {
            (? ((ctx[].extern_scope_map) = stbds_hmdel_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((identifier))), sizeof((ctx[].extern_scope_map)[].key), (cast<string>(@((ctx[].extern_scope_map))[].key) - cast<string>(((ctx[].extern_scope_map)))), 0)) then (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp else 0)
        }
    }
    if (ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1] {
        loop .. while 0 {
            cast<none>((? ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) ~= nil then stbds_hmfree_func(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1, sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[])) else cast<none>(0)))
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = nil
        }
        (ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1] = nil
    }
    ((cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length--)
    if (ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1] {
        loop .. while 0 {
            cast<none>((? ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) ~= nil then stbds_hmfree_func(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1, sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[])) else cast<none>(0)))
            ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = nil
        }
        (ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1] = nil
    }
    ((cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length--)
}

fn reslv_label(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt_1: string = ? nil then sdsnew(nil) else nil
    name_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (ctx[].goto_map) then (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (? ((ctx[].label_set) = stbds_hmget_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@(((ctx[].goto_map[i]).key))), sizeof((ctx[].label_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp) == -1 {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ((((((ctx->errors->info_at_map) = stbds_hmget_key((ctx->errors->info_at_map), sizeof(*(ctx->errors->info_at_map)), (void*)&(((ctx->goto_map[i]).value)), sizeof((ctx->errors->info_at_map)->key), 0)) && 0 ? 0 : ((struct stbds_array_header*)((ctx->errors->info_at_map)-1)-1)->temp)) && 0 ? 0 : &(ctx->errors->info_at_map)[((struct stbds_array_header*)((ctx->errors->info_at_map)-1)-1)->temp])->value)))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undef_goto_target), "MSG_undef_goto_target", "", get_name_fmt(ctx[].identifiers, (ctx[].goto_map[i]).key, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ((? ((? ((ctx[].errors[].info_at_map) = stbds_hmget_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@(((ctx[].goto_map[i]).value))), sizeof((ctx[].errors[].info_at_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp])[].value))) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if name_fmt_1 {
        sdsfree(name_fmt_1)
        name_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if name_fmt_2 {
        sdsfree(name_fmt_2)
        name_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_ptr_struct(ctx: *struc SemanticContext, ptr_type: *struc Pointer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, ptr_type->ref_type))"
        _errval = reslv_struct_type(ctx, ptr_type[].ref_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_arr_struct(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_type(ctx, arr_type->elem_type))"
        _errval = reslv_struct_type(ctx, arr_type[].elem_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_struct(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    struct_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if struct_type[].is_union {
        if (? ((ctx[].union_def_set) = stbds_hmget_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].union_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp) ~= -1 {
            jump _Lfinally
        }
    }
    elif (? ((ctx[].struct_def_set) = stbds_hmget_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp) ~= -1 {
        jump _Lfinally
    }
    loop i: u64 = (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_struct_maps[i]) = stbds_hmget_key((ctx[].scoped_struct_maps[i]), sizeof((ctx[].scoped_struct_maps[i])[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].scoped_struct_maps[i])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_struct_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            structure: *struc Structure = @(ctx[].scoped_struct_maps[i][map_it]).value
            if structure[].is_union ~= struct_type[].is_union {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->errors->info_at_buf))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_conflict), "MSG_redecl_struct_conflict", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_struct_name_fmt(ctx[].identifiers, struct_type[].tag_name, not struct_type[].is_union, @struct_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            struct_type[].tag_name = structure[].tag_name
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->errors->info_at_buf))"
        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undef_struct_in_scope), "MSG_undef_struct_in_scope", "", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort")
        _errval = 1
        jump _Lfinally
    }
    label _Lfinally
    if struct_fmt {
        sdsfree(struct_fmt)
        struct_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_struct_type(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    _errval: i32 = 0
    match type_t[].tag {
        -> AST_Pointer_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_ptr_struct(ctx, &type_t->get._Pointer))"
                _errval = reslv_ptr_struct(ctx, @type_t[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Array_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_arr_struct(ctx, &type_t->get._Array))"
                _errval = reslv_arr_struct(ctx, @type_t[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_struct(ctx, &type_t->get._Structure))"
                _errval = reslv_struct(ctx, @type_t[].get._Structure)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_FunType_t {
            panic_sigabrt("abort")
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) i32;
fn reslv_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32;

fn reslv_const_exp(node: *struc CConstant) none {
    check_const_exp(node)
}

fn reslv_string_exp(node: *struc CString) none {
    check_string_exp(node)
}

fn reslv_var_exp(ctx: *struc SemanticContext, node: *struc CVar) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_identifier_maps[i]) = stbds_hmget_key((ctx[].scoped_identifier_maps[i]), sizeof((ctx[].scoped_identifier_maps[i])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps[i])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_identifier_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            node[].name = (ctx[].scoped_identifier_maps[i][map_it]).value
            jump Lelse
        }
    }
    loop .. while 0 {
        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undecl_var_in_scope), "MSG_undecl_var_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
        _errval = 1
        jump _Lfinally
    }
    label Lelse
    loop .. while 0 {
        "@MACRO@:TRY(check_var_exp(ctx, node))"
        _errval = check_var_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_cast_exp(ctx, node))"
        _errval = check_cast_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_unary_exp(ctx, node))"
        _errval = check_unary_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_left))"
        _errval = reslv_typed_exp(ctx, @node[].exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_right))"
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_binary_exp(ctx, node))"
        _errval = check_binary_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) i32 {
    _errval: i32 = 0
    if node[].exp_left {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_left))"
            _errval = reslv_typed_exp(ctx, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_right))"
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_assign_exp(ctx, node))"
        _errval = check_assign_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_middle))"
        _errval = reslv_typed_exp(ctx, @node[].exp_middle)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_right))"
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_conditional_exp(ctx, node))"
        _errval = check_conditional_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = (? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_identifier_maps[i]) = stbds_hmget_key((ctx[].scoped_identifier_maps[i]), sizeof((ctx[].scoped_identifier_maps[i])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps[i])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_identifier_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            node[].name = (ctx[].scoped_identifier_maps[i][map_it]).value
            jump Lelse
        }
    }
    loop .. while 0 {
        "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undecl_fun_in_scope), "MSG_undecl_fun_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
        _errval = 1
        jump _Lfinally
    }
    label Lelse
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->args[i]))"
            _errval = reslv_typed_exp(ctx, @node[].args[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_call_exp(ctx, node))"
        _errval = check_call_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_deref_exp(ctx, node))"
        _errval = check_deref_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_addrof_expr(ctx: *struc SemanticContext, node: *struc CAddrOf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_exp(ctx, node->exp))"
        _errval = reslv_exp(ctx, node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_addrof_exp(ctx, node))"
        _errval = check_addrof_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->primary_exp))"
        _errval = reslv_typed_exp(ctx, @node[].primary_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->subscript_exp))"
        _errval = reslv_typed_exp(ctx, @node[].subscript_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_subscript_exp(ctx, node))"
        _errval = check_subscript_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_exp(ctx, node->exp))"
        _errval = reslv_exp(ctx, node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_sizeof_exp(ctx, node))"
        _errval = check_sizeof_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(check_sizeoft_exp(ctx, node))"
        _errval = check_sizeoft_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->structure))"
        _errval = reslv_typed_exp(ctx, @node[].structure)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_dot_exp(ctx, node))"
        _errval = check_dot_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->pointer))"
        _errval = reslv_typed_exp(ctx, @node[].pointer)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_arrow_exp(ctx, node))"
        _errval = check_arrow_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CConstant_t {
            reslv_const_exp(@node[].get._CConstant)
        }
        break
        -> AST_CString_t {
            reslv_string_exp(@node[].get._CString)
        }
        break
        -> AST_CVar_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_var_exp(ctx, &node->get._CVar))"
                _errval = reslv_var_exp(ctx, @node[].get._CVar)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCast_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_cast_exp(ctx, &node->get._CCast))"
                _errval = reslv_cast_exp(ctx, @node[].get._CCast)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CUnary_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_unary_exp(ctx, &node->get._CUnary))"
                _errval = reslv_unary_exp(ctx, @node[].get._CUnary)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CBinary_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_binary_exp(ctx, &node->get._CBinary))"
                _errval = reslv_binary_exp(ctx, @node[].get._CBinary)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CAssignment_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_assign_exp(ctx, &node->get._CAssignment))"
                _errval = reslv_assign_exp(ctx, @node[].get._CAssignment)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CConditional_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_conditional_exp(ctx, &node->get._CConditional))"
                _errval = reslv_conditional_exp(ctx, @node[].get._CConditional)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CFunctionCall_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_call_exp(ctx, &node->get._CFunctionCall))"
                _errval = reslv_call_exp(ctx, @node[].get._CFunctionCall)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDereference_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_deref_exp(ctx, &node->get._CDereference))"
                _errval = reslv_deref_exp(ctx, @node[].get._CDereference)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CAddrOf_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_addrof_expr(ctx, &node->get._CAddrOf))"
                _errval = reslv_addrof_expr(ctx, @node[].get._CAddrOf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSubscript_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_subscript_exp(ctx, &node->get._CSubscript))"
                _errval = reslv_subscript_exp(ctx, @node[].get._CSubscript)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSizeOf_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_sizeof_exp(ctx, &node->get._CSizeOf))"
                _errval = reslv_sizeof_exp(ctx, @node[].get._CSizeOf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSizeOfT_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_sizeoft_exp(ctx, &node->get._CSizeOfT))"
                _errval = reslv_sizeoft_exp(ctx, @node[].get._CSizeOfT)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDot_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_dot_exp(ctx, &node->get._CDot))"
                _errval = reslv_dot_exp(ctx, @node[].get._CDot)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CArrow_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_arrow_exp(ctx, &node->get._CArrow))"
                _errval = reslv_arrow_exp(ctx, @node[].get._CArrow)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_exp(ctx, *exp))"
        _errval = reslv_exp(ctx, exp[])
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_typed_exp(ctx, exp))"
        _errval = check_typed_exp(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) i32;
fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32;
fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) i32;

fn reslv_for_init_decl(ctx: *struc SemanticContext, node: *struc CInitDecl) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].init[].storage_class.tag ~= AST_CStorageClass_t {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->init->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_for_init_decl_not_auto), "MSG_for_init_decl_not_auto", "", get_name_fmt(ctx[].identifiers, node[].init[].name, @name_fmt), get_storage_class_fmt(@node[].init[].storage_class)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].init[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_block_var_decl(ctx, node->init))"
        _errval = reslv_block_var_decl(ctx, node[].init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_for_init_exp(ctx: *struc SemanticContext, node: *struc CInitExp) i32 {
    _errval: i32 = 0
    if node[].init {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->init))"
            _errval = reslv_typed_exp(ctx, @node[].init)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_for_init(ctx: *struc SemanticContext, node: *struc CForInit) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CInitDecl_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_for_init_decl(ctx, &node->get._CInitDecl))"
                _errval = reslv_for_init_decl(ctx, @node[].get._CInitDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CInitExp_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_for_init_exp(ctx, &node->get._CInitExp))"
                _errval = reslv_for_init_exp(ctx, @node[].get._CInitExp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) i32 {
    _errval: i32 = 0
    if node[].exp {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
            _errval = reslv_typed_exp(ctx, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_ret_statement(ctx, node))"
        _errval = check_ret_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_exp_statement(ctx: *struc SemanticContext, node: *struc CExpression) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_if_statement(ctx: *struc SemanticContext, node: *struc CIf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->then_fi))"
        _errval = reslv_statement(ctx, node[].then_fi)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].else_fi {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_statement(ctx, node->else_fi))"
            _errval = reslv_statement(ctx, node[].else_fi)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_if_statement(ctx, node))"
        _errval = check_if_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_goto_statement(ctx: *struc SemanticContext, node: *struc CGoto) none {
    map_it: i64 = (? ((ctx[].goto_map) = stbds_hmget_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].target = (ctx[].goto_map[map_it]).value
        loop .. while 0 {
            (ctx[].errors[].info_at_map) = stbds_hmput_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].errors[].info_at_map)[].key), 0)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].value = (node[].info_at)
        }
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        loop .. while 0 {
            (ctx[].goto_map) = stbds_hmput_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].value = (target)
        }
        node[].target = target
        loop .. while 0 {
            (ctx[].errors[].info_at_map) = stbds_hmput_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].errors[].info_at_map)[].key), 0)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].value = (node[].info_at)
        }
    }
}

fn reslv_label_statement(ctx: *struc SemanticContext, node: *struc CLabel) i32 {
    _errval: i32 = 0
    map_it: i64;
    loop .. while 0 {
        "@MACRO@:TRY(annotate_goto_label(ctx, node))"
        _errval = annotate_goto_label(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    map_it = (? ((ctx[].goto_map) = stbds_hmget_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].target = (ctx[].goto_map[map_it]).value
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        loop .. while 0 {
            (ctx[].goto_map) = stbds_hmput_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].key = (node[].target)
            (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].value = (target)
        }
        node[].target = target
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->jump_to))"
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_compound_statement(ctx: *struc SemanticContext, node: *struc CCompound) i32 {
    _errval: i32 = 0
    enter_scope(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(reslv_block(ctx, node->block))"
        _errval = reslv_block(ctx, node[].block)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exit_scope(ctx)
    label _Lfinally
    return _errval
}

fn reslv_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) i32 {
    _errval: i32 = 0
    annotate_while_loop(ctx, node)
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->body))"
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    deannotate_loop(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(check_while_statement(ctx, node))"
        _errval = check_while_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) i32 {
    _errval: i32 = 0
    annotate_do_while_loop(ctx, node)
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->body))"
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    deannotate_loop(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(check_do_while_statement(ctx, node))"
        _errval = check_do_while_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_for_statement(ctx: *struc SemanticContext, node: *struc CFor) i32 {
    _errval: i32 = 0
    annotate_for_loop(ctx, node)
    enter_scope(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(reslv_for_init(ctx, node->init))"
        _errval = reslv_for_init(ctx, node[].init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].condition {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
            _errval = reslv_typed_exp(ctx, @node[].condition)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if node[].post {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->post))"
            _errval = reslv_typed_exp(ctx, @node[].post)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->body))"
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exit_scope(ctx)
    deannotate_loop(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(check_for_statement(ctx, node))"
        _errval = check_for_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    _errval: i32 = 0
    annotate_switch_lookup(ctx, node)
    enter_scope(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->lookup))"
        _errval = reslv_typed_exp(ctx, @node[].lookup)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        p_switch_statement: *struc CSwitch = ctx[].p_switch_statement
        ctx[].p_switch_statement = node
        loop .. while 0 {
            "@MACRO@:TRY(reslv_statement(ctx, node->body))"
            _errval = reslv_statement(ctx, node[].body)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].p_switch_statement = p_switch_statement
    }
    exit_scope(ctx)
    deannotate_lookup(ctx)
    loop .. while 0 {
        "@MACRO@:TRY(check_switch_statement(ctx, node))"
        _errval = check_switch_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_case_statement(ctx: *struc SemanticContext, node: *struc CCase) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(annotate_case_jump(ctx, node))"
        _errval = annotate_case_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_typed_exp(ctx, &node->value))"
        _errval = reslv_typed_exp(ctx, @node[].value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_switch_statement[].cases) or (cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].capacity) then (((ctx[].p_switch_statement[].cases) = stbds_arrgrowf((ctx[].p_switch_statement[].cases), sizeof((ctx[].p_switch_statement[].cases)[]), (1), (0))) and 0) else 0)
            (ctx[].p_switch_statement[].cases)[(cast<*struc stbds_array_header>((ctx[].p_switch_statement[].cases)) - 1)[].length++] = (node[].value)
        }
        node[].value = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->jump_to))"
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_default_statement(ctx: *struc SemanticContext, node: *struc CDefault) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(annotate_default_jump(ctx, node))"
        _errval = annotate_default_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_statement(ctx, node->jump_to))"
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_break_statement(ctx: *struc SemanticContext, node: *struc CBreak) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(annotate_break_jump(ctx, node))"
        _errval = annotate_break_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_continue_statement(ctx: *struc SemanticContext, node: *struc CContinue) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(annotate_continue_jump(ctx, node))"
        _errval = annotate_continue_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CReturn_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_ret_statement(ctx, &node->get._CReturn))"
                _errval = reslv_ret_statement(ctx, @node[].get._CReturn)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CExpression_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_exp_statement(ctx, &node->get._CExpression))"
                _errval = reslv_exp_statement(ctx, @node[].get._CExpression)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CIf_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_if_statement(ctx, &node->get._CIf))"
                _errval = reslv_if_statement(ctx, @node[].get._CIf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CGoto_t {
            reslv_goto_statement(ctx, @node[].get._CGoto)
        }
        break
        -> AST_CLabel_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_label_statement(ctx, &node->get._CLabel))"
                _errval = reslv_label_statement(ctx, @node[].get._CLabel)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCompound_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_compound_statement(ctx, &node->get._CCompound))"
                _errval = reslv_compound_statement(ctx, @node[].get._CCompound)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CWhile_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_while_statement(ctx, &node->get._CWhile))"
                _errval = reslv_while_statement(ctx, @node[].get._CWhile)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDoWhile_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_do_while_statement(ctx, &node->get._CDoWhile))"
                _errval = reslv_do_while_statement(ctx, @node[].get._CDoWhile)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CFor_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_for_statement(ctx, &node->get._CFor))"
                _errval = reslv_for_statement(ctx, @node[].get._CFor)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSwitch_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_switch_statement(ctx, &node->get._CSwitch))"
                _errval = reslv_switch_statement(ctx, @node[].get._CSwitch)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCase_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_case_statement(ctx, &node->get._CCase))"
                _errval = reslv_case_statement(ctx, @node[].get._CCase)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDefault_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_default_statement(ctx, &node->get._CDefault))"
                _errval = reslv_default_statement(ctx, @node[].get._CDefault)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CBreak_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_break_statement(ctx, &node->get._CBreak))"
                _errval = reslv_break_statement(ctx, @node[].get._CBreak)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CContinue_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_continue_statement(ctx, &node->get._CContinue))"
                _errval = reslv_continue_statement(ctx, @node[].get._CContinue)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CNull_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) i32;

fn reslv_block_items(ctx: *struc SemanticContext, node_list: **struc CBlockItem) i32 {
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        match node_list[i][].tag {
            -> AST_CS_t {
                loop .. while 0 {
                    "@MACRO@:TRY(reslv_statement(ctx, node_list[i]->get._CS.statement))"
                    _errval = reslv_statement(ctx, node_list[i][].get._CS.statement)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            -> AST_CD_t {
                loop .. while 0 {
                    "@MACRO@:TRY(reslv_declaration(ctx, node_list[i]->get._CD.declaration))"
                    _errval = reslv_declaration(ctx, node_list[i][].get._CD.declaration)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_block_items(ctx, node->get._CB.block_items))"
        _errval = reslv_block_items(ctx, node[].get._CB.block_items)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) i32;

fn reslv_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) i32 {
    _errval: i32 = 0
    if node[].exp[].tag == AST_CString_t and (init_type[])[].tag == AST_Array_t {
        loop .. while 0 {
            "@MACRO@:TRY(check_bound_string_init(ctx, &node->exp->get._CString, &(*init_type)->get._Array))"
            _errval = check_bound_string_init(ctx, @node[].exp[].get._CString, @(init_type[])[].get._Array)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        check_string_init(node, init_type)
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
            _errval = reslv_typed_exp(ctx, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(check_single_init(ctx, node, init_type))"
            _errval = check_single_init(ctx, node, init_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(check_bound_arr_init(ctx, node, arr_type))"
        _errval = check_bound_arr_init(ctx, node, arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_initializer(ctx, node->initializers[i], &arr_type->elem_type))"
            _errval = reslv_initializer(ctx, node[].initializers[i], @arr_type[].elem_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    check_arr_init(ctx, node, arr_type, init_type)
    label _Lfinally
    return _errval
}

fn reslv_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(check_bound_struct_init(ctx, node, struct_type))"
        _errval = check_bound_struct_init(ctx, node, struct_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        loop .. while 0 {
            "@MACRO@:TRY(reslv_initializer(ctx, node->initializers[i], &member->member_type))"
            _errval = reslv_initializer(ctx, node[].initializers[i], @member[].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    check_struct_init(ctx, node, struct_type, init_type)
    label _Lfinally
    return _errval
}

fn reslv_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, init_type: **struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match (init_type[])[].tag {
        -> AST_Array_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_arr_init(ctx, node, &(*init_type)->get._Array, init_type))"
                _errval = reslv_arr_init(ctx, node, @(init_type[])[].get._Array, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_struct_init(ctx, node, &(*init_type)->get._Structure, init_type))"
                _errval = reslv_struct_init(ctx, node, @(init_type[])[].get._Structure, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_scalar_init_with_compound), "MSG_scalar_init_with_compound", "", "", get_type_fmt(ctx[].identifiers, init_type[], @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CSingleInit_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_single_init(ctx, &node->get._CSingleInit, init_type))"
                _errval = reslv_single_init(ctx, @node[].get._CSingleInit, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCompoundInit_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_compound_init(ctx, &node->get._CCompoundInit, init_type))"
                _errval = reslv_compound_init(ctx, @node[].get._CCompoundInit, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) .. ++i {
        param: u64 = node[].params[i]
        if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((param))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_in_scope), "MSG_redecl_var_in_scope", "", "", get_name_fmt(ctx[].identifiers, param, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        param = rslv_var_identifier(ctx[].identifiers, param)
        loop .. while 0 {
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].params[i]))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].params[i])
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (param)
        }
        node[].params[i] = param
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_fun_params_decl(ctx, node))"
        _errval = check_fun_params_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_fun_declaration(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_file_scope(ctx) {
        if node[].body {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_def_nested_fun), "MSG_def_nested_fun", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif node[].storage_class.tag == AST_CStatic_t {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_decl_nested_static_fun), "MSG_decl_nested_static_fun", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    if (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) == -1 {
        if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_fun_in_scope), "MSG_redecl_fun_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            (ctx[].extern_scope_map) = stbds_hmput_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].value = ((? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0))
        }
    }
    loop .. while 0 {
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (node[].name)
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_ret_fun_decl(ctx, node))"
        _errval = check_ret_fun_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    enter_scope(ctx)
    if not ((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_fun_params_decl(ctx, node))"
            _errval = reslv_fun_params_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_fun_decl(ctx, node))"
        _errval = check_fun_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].body {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_block(ctx, node->body))"
            _errval = reslv_block(ctx, node[].body)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    exit_scope(ctx)
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    _errval: i32 = 0
    if (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            (ctx[].extern_scope_map) = stbds_hmput_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].value = ((? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0))
        }
    }
    loop .. while 0 {
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
        ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (node[].name)
    }
    if is_file_scope(ctx) {
        loop .. while 0 {
            "@MACRO@:TRY(check_file_var_decl(ctx, node))"
            _errval = check_file_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(check_block_var_decl(ctx, node))"
            _errval = check_block_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 and not ((? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) ~= -1 and node[].storage_class.tag == AST_CExtern_t) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_in_scope), "MSG_redecl_var_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif node[].storage_class.tag == AST_CExtern_t {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_file_var_decl(ctx, node))"
            _errval = reslv_file_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    {
        name: u64 = rslv_var_identifier(ctx[].identifiers, node[].name)
        loop .. while 0 {
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (name)
        }
        node[].name = name
    }
    loop .. while 0 {
        "@MACRO@:TRY(check_block_var_decl(ctx, node))"
        _errval = check_block_var_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].init and node[].storage_class.tag == AST_CStorageClass_t {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_initializer(ctx, node->init, &node->var_type))"
            _errval = reslv_initializer(ctx, node[].init, @node[].var_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if name_fmt {
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(check_struct_members_decl(ctx, node))"
        _errval = check_struct_members_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_struct_declaration(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    struct_fmt_1: string = ? nil then sdsnew(nil) else nil
    struct_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    map_it: i64 = (? (((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].tag_name))), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].tag_name = ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1][map_it]).value.tag_name
        if node[].is_union {
            if (? ((ctx[].union_def_set) = stbds_hmget_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].union_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp) == -1 {
                loop .. while 0 {
                    "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_conflict), "MSG_redecl_struct_conflict", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt_1), get_struct_name_fmt(ctx[].identifiers, node[].tag_name, not node[].is_union, @struct_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        elif (? ((ctx[].struct_def_set) = stbds_hmget_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].struct_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp) == -1 {
            loop .. while 0 {
                "@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_conflict), "MSG_redecl_struct_conflict", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt_1), get_struct_name_fmt(ctx[].identifiers, node[].tag_name, not node[].is_union, @struct_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    else {
        {
            structure: struc Structure = $(rslv_struct_tag(ctx[].identifiers, node[].tag_name), node[].is_union)
            loop .. while 0 {
                ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].tag_name))), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[].key), 0)
                ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].tag_name)
                ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (structure)
            }
            node[].tag_name = structure.tag_name
        }
        if node[].is_union {
            loop .. while 0 {
                (ctx[].union_def_set) = stbds_hmput_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].union_def_set)[].key), 0)
                (ctx[].union_def_set)[(cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp].key = (node[].tag_name)
                (ctx[].union_def_set)[(cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp].value = (0)
            }
        }
        else {
            loop .. while 0 {
                (ctx[].struct_def_set) = stbds_hmput_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].struct_def_set)[].key), 0)
                (ctx[].struct_def_set)[(cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp].key = (node[].tag_name)
                (ctx[].struct_def_set)[(cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp].value = (0)
            }
        }
    }
    if not ((? (node[].members) then (cast<*struc stbds_array_header>((node[].members)) - 1)[].length else 0) == 0) {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_struct_members_decl(ctx, node))"
            _errval = reslv_struct_members_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            "@MACRO@:TRY(check_struct_decl(ctx, node))"
            _errval = check_struct_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if struct_fmt_1 {
        sdsfree(struct_fmt_1)
        struct_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if struct_fmt_2 {
        sdsfree(struct_fmt_2)
        struct_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_fun_decl(ctx: *struc SemanticContext, node: *struc CFunDecl) i32 {
    _errval: i32 = 0
    if is_file_scope(ctx) {
        if ctx[].goto_map {
            loop .. while 0 {
                cast<none>((? (ctx[].goto_map) ~= nil then stbds_hmfree_func((ctx[].goto_map) - 1, sizeof((ctx[].goto_map)[])) else cast<none>(0)))
                (ctx[].goto_map) = nil
            }
            ctx[].goto_map = nil
        }
        if ctx[].label_set {
            loop .. while 0 {
                cast<none>((? (ctx[].label_set) ~= nil then stbds_hmfree_func((ctx[].label_set) - 1, sizeof((ctx[].label_set)[])) else cast<none>(0)))
                (ctx[].label_set) = nil
            }
            ctx[].label_set = nil
        }
        if ctx[].break_loop_labels {
            (cast<*struc stbds_array_header>((ctx[].break_loop_labels)) - 1)[].length = 0
        }
        if ctx[].continue_loop_labels {
            (cast<*struc stbds_array_header>((ctx[].continue_loop_labels)) - 1)[].length = 0
        }
        ctx[].p_switch_statement = nil
    }
    loop .. while 0 {
        "@MACRO@:TRY(reslv_fun_declaration(ctx, node->fun_decl))"
        _errval = reslv_fun_declaration(ctx, node[].fun_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if is_file_scope(ctx) {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_label(ctx, node->fun_decl))"
            _errval = reslv_label(ctx, node[].fun_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_var_decl(ctx: *struc SemanticContext, node: *struc CVarDecl) i32 {
    _errval: i32 = 0
    if is_file_scope(ctx) {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_file_var_decl(ctx, node->var_decl))"
            _errval = reslv_file_var_decl(ctx, node[].var_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_block_var_decl(ctx, node->var_decl))"
            _errval = reslv_block_var_decl(ctx, node[].var_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDecl) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(reslv_struct_declaration(ctx, node->struct_decl))"
        _errval = reslv_struct_declaration(ctx, node[].struct_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CFunDecl_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_fun_decl(ctx, &node->get._CFunDecl))"
                _errval = reslv_fun_decl(ctx, @node[].get._CFunDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CVarDecl_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_var_decl(ctx, &node->get._CVarDecl))"
                _errval = reslv_var_decl(ctx, @node[].get._CVarDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CStructDecl_t {
            loop .. while 0 {
                "@MACRO@:TRY(reslv_struct_decl(ctx, &node->get._CStructDecl))"
                _errval = reslv_struct_decl(ctx, @node[].get._CStructDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn resolve_program(ctx: *struc SemanticContext, node: *struc CProgram) i32 {
    _errval: i32 = 0
    enter_scope(ctx)
    loop i: u64 = 0 while i < (? (node[].declarations) then (cast<*struc stbds_array_header>((node[].declarations)) - 1)[].length else 0) .. ++i {
        loop .. while 0 {
            "@MACRO@:TRY(reslv_declaration(ctx, node->declarations[i]))"
            _errval = reslv_declaration(ctx, node[].declarations[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32 {
    ctx: struc SemanticContext;
    {
        ctx.errors = errors
        ctx.frontend = frontend
        ctx.identifiers = identifiers
        ctx.extern_scope_map = nil
        ctx.goto_map = nil
        ctx.scoped_identifier_maps = nil
        ctx.scoped_struct_maps = nil
        ctx.label_set = nil
        ctx.break_loop_labels = nil
        ctx.continue_loop_labels = nil
        ctx.fun_def_set = nil
        ctx.struct_def_set = nil
        ctx.union_def_set = nil
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(resolve_program(&ctx, node))"
        _errval = resolve_program(@ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if ctx.extern_scope_map {
        loop .. while 0 {
            cast<none>((? (ctx.extern_scope_map) ~= nil then stbds_hmfree_func((ctx.extern_scope_map) - 1, sizeof((ctx.extern_scope_map)[])) else cast<none>(0)))
            (ctx.extern_scope_map) = nil
        }
        ctx.extern_scope_map = nil
    }
    if ctx.goto_map {
        loop .. while 0 {
            cast<none>((? (ctx.goto_map) ~= nil then stbds_hmfree_func((ctx.goto_map) - 1, sizeof((ctx.goto_map)[])) else cast<none>(0)))
            (ctx.goto_map) = nil
        }
        ctx.goto_map = nil
    }
    loop i: u64 = 0 while i < (? (ctx.scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx.scoped_identifier_maps)) - 1)[].length else 0) .. ++i {
        if ctx.scoped_identifier_maps[i] {
            loop .. while 0 {
                cast<none>((? (ctx.scoped_identifier_maps[i]) ~= nil then stbds_hmfree_func((ctx.scoped_identifier_maps[i]) - 1, sizeof((ctx.scoped_identifier_maps[i])[])) else cast<none>(0)))
                (ctx.scoped_identifier_maps[i]) = nil
            }
            ctx.scoped_identifier_maps[i] = nil
        }
    }
    if ctx.scoped_identifier_maps {
        loop .. while 0 {
            cast<none>((? (ctx.scoped_identifier_maps) then free((cast<*struc stbds_array_header>((ctx.scoped_identifier_maps)) - 1)) else cast<none>(0)))
            (ctx.scoped_identifier_maps) = nil
        }
        ctx.scoped_identifier_maps = nil
    }
    loop i: u64 = 0 while i < (? (ctx.scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx.scoped_struct_maps)) - 1)[].length else 0) .. ++i {
        if ctx.scoped_struct_maps[i] {
            loop .. while 0 {
                cast<none>((? (ctx.scoped_struct_maps[i]) ~= nil then stbds_hmfree_func((ctx.scoped_struct_maps[i]) - 1, sizeof((ctx.scoped_struct_maps[i])[])) else cast<none>(0)))
                (ctx.scoped_struct_maps[i]) = nil
            }
            ctx.scoped_struct_maps[i] = nil
        }
    }
    if ctx.scoped_struct_maps {
        loop .. while 0 {
            cast<none>((? (ctx.scoped_struct_maps) then free((cast<*struc stbds_array_header>((ctx.scoped_struct_maps)) - 1)) else cast<none>(0)))
            (ctx.scoped_struct_maps) = nil
        }
        ctx.scoped_struct_maps = nil
    }
    if ctx.label_set {
        loop .. while 0 {
            cast<none>((? (ctx.label_set) ~= nil then stbds_hmfree_func((ctx.label_set) - 1, sizeof((ctx.label_set)[])) else cast<none>(0)))
            (ctx.label_set) = nil
        }
        ctx.label_set = nil
    }
    if ctx.break_loop_labels {
        loop .. while 0 {
            cast<none>((? (ctx.break_loop_labels) then free((cast<*struc stbds_array_header>((ctx.break_loop_labels)) - 1)) else cast<none>(0)))
            (ctx.break_loop_labels) = nil
        }
        ctx.break_loop_labels = nil
    }
    if ctx.continue_loop_labels {
        loop .. while 0 {
            cast<none>((? (ctx.continue_loop_labels) then free((cast<*struc stbds_array_header>((ctx.continue_loop_labels)) - 1)) else cast<none>(0)))
            (ctx.continue_loop_labels) = nil
        }
        ctx.continue_loop_labels = nil
    }
    if ctx.fun_def_set {
        loop .. while 0 {
            cast<none>((? (ctx.fun_def_set) ~= nil then stbds_hmfree_func((ctx.fun_def_set) - 1, sizeof((ctx.fun_def_set)[])) else cast<none>(0)))
            (ctx.fun_def_set) = nil
        }
        ctx.fun_def_set = nil
    }
    if ctx.struct_def_set {
        loop .. while 0 {
            cast<none>((? (ctx.struct_def_set) ~= nil then stbds_hmfree_func((ctx.struct_def_set) - 1, sizeof((ctx.struct_def_set)[])) else cast<none>(0)))
            (ctx.struct_def_set) = nil
        }
        ctx.struct_def_set = nil
    }
    if ctx.union_def_set {
        loop .. while 0 {
            cast<none>((? (ctx.union_def_set) ~= nil then stbds_hmfree_func((ctx.union_def_set) - 1, sizeof((ctx.union_def_set)[])) else cast<none>(0)))
            (ctx.union_def_set) = nil
        }
        ctx.union_def_set = nil
    }
    if errors[].info_at_map {
        loop .. while 0 {
            cast<none>((? (errors[].info_at_map) ~= nil then stbds_hmfree_func((errors[].info_at_map) - 1, sizeof((errors[].info_at_map)[])) else cast<none>(0)))
            (errors[].info_at_map) = nil
        }
        errors[].info_at_map = nil
    }
    loop i: u64 = 0 while i < (? (errors[].fopen_lines) then (cast<*struc stbds_array_header>((errors[].fopen_lines)) - 1)[].length else 0) .. ++i {
        if errors[].fopen_lines[i].filename {
            sdsfree(errors[].fopen_lines[i].filename)
            errors[].fopen_lines[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if errors[].fopen_lines {
        loop .. while 0 {
            cast<none>((? (errors[].fopen_lines) then free((cast<*struc stbds_array_header>((errors[].fopen_lines)) - 1)) else cast<none>(0)))
            (errors[].fopen_lines) = nil
        }
        errors[].fopen_lines = nil
    }
    if errors[].token_infos {
        loop .. while 0 {
            cast<none>((? (errors[].token_infos) then free((cast<*struc stbds_array_header>((errors[].token_infos)) - 1)) else cast<none>(0)))
            (errors[].token_infos) = nil
        }
        errors[].token_infos = nil
    }
    return _errval
}
