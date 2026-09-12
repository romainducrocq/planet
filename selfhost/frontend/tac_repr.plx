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
type struc CProgram;
type struc TacProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram;
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

type struc TacReprContext(frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext, p_instrs: ***struc TacInstruction, p_toplvls: ***struc TacTopLevel, p_static_consts: ***struc TacTopLevel)

m4_define(`Ctx', `TODO')m4_dnl

fn repr_unop(node: *struc CUnaryOp) struc TacUnaryOp {
    match node[].tag {
        -> AST_CComplement_t {
            return make_TacUnaryOp(AST_TacComplement_t)
        }
        -> AST_CNegate_t {
            return make_TacUnaryOp(AST_TacNegate_t)
        }
        -> AST_CNot_t {
            return make_TacUnaryOp(AST_TacNot_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn repr_binop(node: *struc CBinaryOp) struc TacBinaryOp {
    match node[].tag {
        -> AST_CAdd_t {
            return make_TacBinaryOp(AST_TacAdd_t)
        }
        -> AST_CSubtract_t {
            return make_TacBinaryOp(AST_TacSubtract_t)
        }
        -> AST_CMultiply_t {
            return make_TacBinaryOp(AST_TacMultiply_t)
        }
        -> AST_CDivide_t {
            return make_TacBinaryOp(AST_TacDivide_t)
        }
        -> AST_CRemainder_t {
            return make_TacBinaryOp(AST_TacRemainder_t)
        }
        -> AST_CBitAnd_t {
            return make_TacBinaryOp(AST_TacBitAnd_t)
        }
        -> AST_CBitOr_t {
            return make_TacBinaryOp(AST_TacBitOr_t)
        }
        -> AST_CBitXor_t {
            return make_TacBinaryOp(AST_TacBitXor_t)
        }
        -> AST_CBitShiftLeft_t {
            return make_TacBinaryOp(AST_TacBitShiftLeft_t)
        }
        -> AST_CBitShiftRight_t {
            return make_TacBinaryOp(AST_TacBitShiftRight_t)
        }
        -> AST_CBitShrArithmetic_t {
            return make_TacBinaryOp(AST_TacBitShrArithmetic_t)
        }
        -> AST_CEqual_t {
            return make_TacBinaryOp(AST_TacEqual_t)
        }
        -> AST_CNotEqual_t {
            return make_TacBinaryOp(AST_TacNotEqual_t)
        }
        -> AST_CLessThan_t {
            return make_TacBinaryOp(AST_TacLessThan_t)
        }
        -> AST_CLessOrEqual_t {
            return make_TacBinaryOp(AST_TacLessOrEqual_t)
        }
        -> AST_CGreaterThan_t {
            return make_TacBinaryOp(AST_TacGreaterThan_t)
        }
        -> AST_CGreaterOrEqual_t {
            return make_TacBinaryOp(AST_TacGreaterOrEqual_t)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn const_value(node: *struc CConstant) *struc TacValue {
    constant: *struc CConst = nil
    if node[].constant ~= constant {
        "@MACRO@:sptr_copy(CConst, node->constant, constant)"
        free_CConst(@constant)
        constant = node[].constant
        (constant)[]._ref_count++
    }
    return make_TacConstant(@constant)
}

fn var_value(node: *struc CVar) *struc TacValue {
    name: u64 = node[].name
    return make_TacVariable(name)
}

fn exp_inner_value(ctx: *struc TacReprContext, node: *struc CExp, is_ptr: i32) *struc TacValue {
    inner_name: u64 = repr_var_identifier(ctx[].identifiers, node)
    if (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((inner_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp) == -1 {
        inner_type: *struc Type = nil
        if is_ptr {
            inner_type = make_Long()
        }
        else {
            if node[].exp_type ~= inner_type {
                "@MACRO@:sptr_copy(Type, node->exp_type, inner_type)"
                free_Type(@inner_type)
                inner_type = node[].exp_type
                (inner_type)[]._ref_count++
            }
        }
        inner_attrs: *struc IdentifierAttr = make_LocalAttr()
        symbol: *struc Symbol = make_Symbol(@inner_type, @inner_attrs)
        loop .. while 0 {
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((inner_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (inner_name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }            
            symbol = nil
        }        
    }
    return make_TacVariable(inner_name)
}

fn plain_inner_value(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    return exp_inner_value(ctx, node, false)
}

fn ptr_inner_value(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    return exp_inner_value(ctx, node, true)
}

fn repr_value(node: *struc CExp) *struc TacValue {
    match node[].tag {
        -> AST_CConstant_t {
            return const_value(@node[].get._CConstant)
        }
        -> AST_CVar_t {
            return var_value(@node[].get._CVar)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn push_instr(ctx: *struc TacReprContext, instr: *struc TacInstruction) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_instrs[]) or (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].capacity) then (((ctx[].p_instrs[]) = stbds_arrgrowf((ctx[].p_instrs[]), sizeof((ctx[].p_instrs[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_instrs[])[(cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length++] = (instr)
        }        
        instr = nil
    }    
}
fn repr_res_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacExpResult;
fn repr_exp_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue;

fn const_res_instr(node: *struc CConstant) *struc TacExpResult {
    val: *struc TacValue = repr_value(node[]._base)
    return make_TacPlainOperand(@val)
}

fn make_literal_identifier(ctx: *struc TacReprContext, node: *struc CStringLiteral) u64 {
    value: string = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}

fn string_res_instr(ctx: *struc TacReprContext, node: *struc CString) *struc TacExpResult {
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
    val: *struc TacValue = make_TacVariable(string_const_label)
    return make_TacPlainOperand(@val)
}

fn var_res_instr(node: *struc CVar) *struc TacExpResult {
    val: *struc TacValue = repr_value(node[]._base)
    return make_TacPlainOperand(@val)
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

fn get_type_scale(ctx: *struc TacReprContext, type_t: *struc Type) i64;

fn get_arr_scale(ctx: *struc TacReprContext, arr_type: *struc Array) i64 {
    size: i64 = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size *= arr_type[].size
    }
    return get_type_scale(ctx, arr_type[].elem_type) * size
}

fn get_struct_scale(ctx: *struc TacReprContext, struct_type: *struc Structure) i64 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
}

fn get_type_scale(ctx: *struc TacReprContext, type_t: *struc Type) i64 {
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

fn cast_complete_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    if node[].target_type[].tag == node[].exp[].exp_type[].tag {
        return make_TacPlainOperand(@src)
    }
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    if node[].exp[].exp_type[].tag == AST_Double_t {
        if is_type_signed(node[].target_type) {
            push_instr(ctx, make_TacDoubleToInt(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacDoubleToUInt(@src, @dst_cp))
        }
    }
    elif node[].target_type[].tag == AST_Double_t {
        if is_type_signed(node[].exp[].exp_type) {
            push_instr(ctx, make_TacIntToDouble(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacUIntToDouble(@src, @dst_cp))
        }
    }
    else {
        target_type_size: i32 = get_scalar_size(node[].target_type)
        inner_type_size: i32 = get_scalar_size(node[].exp[].exp_type)
        if target_type_size == inner_type_size {
            push_instr(ctx, make_TacCopy(@src, @dst_cp))
        }
        elif target_type_size < inner_type_size {
            push_instr(ctx, make_TacTruncate(@src, @dst_cp))
        }
        elif is_type_signed(node[].exp[].exp_type) {
            push_instr(ctx, make_TacSignExtend(@src, @dst_cp))
        }
        else {
            push_instr(ctx, make_TacZeroExtend(@src, @dst_cp))
        }
    }
    return make_TacPlainOperand(@dst)
}

fn cast_void_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    dst: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    free_TacValue(@dst)
    return make_TacPlainOperand(@dst)
}

fn cast_res_instr(ctx: *struc TacReprContext, node: *struc CCast) *struc TacExpResult {
    if node[].target_type[].tag == AST_Void_t {
        return cast_void_res_instr(ctx, node)
    }
    else {
        return cast_complete_res_instr(ctx, node)
    }
}

fn unary_res_instr(ctx: *struc TacReprContext, node: *struc CUnary) *struc TacExpResult {
    src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    unop: struc TacUnaryOp = repr_unop(@node[].unop)
    push_instr(ctx, make_TacUnary(@unop, @src, @dst_cp))
    return make_TacPlainOperand(@dst)
}
fn binary_any_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult;

fn binary_add_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    scale: i64;
    src_ptr: *struc TacValue = nil
    idx: *struc TacValue = nil
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t {
        scale = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].exp_left)
        idx = repr_exp_instr(ctx, node[].exp_right)
    }
    else {
        scale = get_type_scale(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].exp_right)
        idx = repr_exp_instr(ctx, node[].exp_left)
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_add_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        return binary_add_ptr_res_instr(ctx, node)
    }
    else {
        return binary_any_res_instr(ctx, node)
    }
}

fn binary_sub_to_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    scale: i64 = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
    src_ptr: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)

    idx: *struc TacValue = nil
    {
        idx = repr_exp_instr(ctx, node[].exp_right)
        dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        unop: struc TacUnaryOp = make_TacUnaryOp(AST_TacNegate_t)
        push_instr(ctx, make_TacUnary(@unop, @idx, @dst_cp))
        loop .. while 0 {
            "@MACRO@:sptr_move(TacValue, dst, idx)"
            if dst ~= idx {
                "@MACRO@:uptr_move(TacValue, dst, idx)"
                free_TacValue(@idx)
                idx = dst
                dst = nil
            }
        }        
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_subtract_ptr_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    src_1: *struc TacValue = nil
    {
        src_1 = repr_exp_instr(ctx, node[].exp_left)
        src_2: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        binop: struc TacBinaryOp = make_TacBinaryOp(AST_TacSubtract_t)
        push_instr(ctx, make_TacBinary(@binop, @src_1, @src_2, @dst_cp))
        loop .. while 0 {
            "@MACRO@:sptr_move(TacValue, dst, src_1)"
            if dst ~= src_1 {
                "@MACRO@:uptr_move(TacValue, dst, src_1)"
                free_TacValue(@src_1)
                src_1 = dst
                dst = nil
            }
        }        
    }

    src_2: *struc TacValue = nil
    {
        value: i64 = get_type_scale(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type)
        constant: *struc CConst = make_CConstLong(value)
        src_2 = make_TacConstant(@constant)
    }
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    binop: struc TacBinaryOp = make_TacBinaryOp(AST_TacDivide_t)
    push_instr(ctx, make_TacBinary(@binop, @src_1, @src_2, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_subtract_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t {
        if node[].exp_right[].exp_type[].tag == AST_Pointer_t {
            return binary_subtract_ptr_res_instr(ctx, node)
        }
        else {
            return binary_sub_to_ptr_res_instr(ctx, node)
        }
    }
    else {
        return binary_any_res_instr(ctx, node)
    }
}

fn binary_and_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Land_false)
    target_true: u64 = repr_label_identifier(ctx[].identifiers, LBL_Land_true)

    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition_left: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition_left))
    }

    {
        condition_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition_right))
    }
    {
        constant: *struc CConst = make_CConstInt(1)
        src_true: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_true, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_true))
    push_instr(ctx, make_TacLabel(target_false))
    {
        constant: *struc CConst = make_CConstInt(0)
        src_false: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_false, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_true))
    return make_TacPlainOperand(@dst)
}

fn binary_or_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    target_true: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lor_true)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lor_false)

    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition_left: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
        push_instr(ctx, make_TacJumpIfNotZero(target_true, @condition_left))
    }

    {
        condition_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        push_instr(ctx, make_TacJumpIfNotZero(target_true, @condition_right))
    }
    {
        constant: *struc CConst = make_CConstInt(0)
        src_false: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_false, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_true))
    {
        constant: *struc CConst = make_CConstInt(1)
        src_true: *struc TacValue = make_TacConstant(@constant)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_true, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}

fn binary_any_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    src1: *struc TacValue = repr_exp_instr(ctx, node[].exp_left)
    src2: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    binop: struc TacBinaryOp = repr_binop(@node[].binop)
    push_instr(ctx, make_TacBinary(@binop, @src1, @src2, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn binary_res_instr(ctx: *struc TacReprContext, node: *struc CBinary) *struc TacExpResult {
    match node[].binop.tag {
        -> AST_CAdd_t {
            return binary_add_res_instr(ctx, node)
        }
        -> AST_CSubtract_t {
            return binary_subtract_res_instr(ctx, node)
        }
        -> AST_CAnd_t {
            return binary_and_res_instr(ctx, node)
        }
        -> AST_COr_t {
            return binary_or_res_instr(ctx, node)
        }
        otherwise {
            return binary_any_res_instr(ctx, node)
        }
    }
}

fn plain_op_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, dst: **struc TacValue) none {
    src: *struc TacValue = nil
    if res[].val ~= src {
        "@MACRO@:sptr_copy(TacValue, res->val, src)"
        free_TacValue(@src)
        src = res[].val
        (src)[]._ref_count++
    }
    dst_cp: *struc TacValue = nil
    if dst[] ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, *dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopy(@src, @dst_cp))
}

fn deref_ptr_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, dst: **struc TacValue) none {
    src: *struc TacValue = nil
    if res[].val ~= src {
        "@MACRO@:sptr_copy(TacValue, res->val, src)"
        free_TacValue(@src)
        src = res[].val
        (src)[]._ref_count++
    }
    dst_cp: *struc TacValue = nil
    if dst[] ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, *dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacLoad(@src, @dst_cp))
}

fn sub_obj_postfix_exp_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, dst: **struc TacValue) none {
    src_name: u64 = res[].base_name
    offset: i64 = res[].offset
    dst_cp: *struc TacValue = nil
    if dst[] ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, *dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst[]
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopyFromOffset(src_name, offset, @dst_cp))
}

fn plain_op_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, src: **struc TacValue) none {
    dst: *struc TacValue = nil
    if res[].val ~= dst {
        "@MACRO@:sptr_copy(TacValue, res->val, dst)"
        free_TacValue(@dst)
        dst = res[].val
        (dst)[]._ref_count++
    }
    push_instr(ctx, make_TacCopy(src, @dst))
}

fn deref_ptr_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, src: **struc TacValue, exp_res: **struc TacExpResult) none {
    src_cp: *struc TacValue = nil
    if src[] ~= src_cp {
        "@MACRO@:sptr_copy(TacValue, *src, src_cp)"
        free_TacValue(@src_cp)
        src_cp = src[]
        (src_cp)[]._ref_count++
    }
    dst: *struc TacValue = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, res->val, dst)"
        if res[].val ~= dst {
            "@MACRO@:uptr_move(TacValue, res->val, dst)"
            free_TacValue(@dst)
            dst = res[].val
            res[].val = nil
        }
    }    
    push_instr(ctx, make_TacStore(@src_cp, @dst))
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(src)
}

fn sub_obj_assign_res_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, src: **struc TacValue, exp_res: **struc TacExpResult) none {
    dst_name: u64 = res[].base_name
    offset: i64 = res[].offset
    src_cp: *struc TacValue = nil
    if src[] ~= src_cp {
        "@MACRO@:sptr_copy(TacValue, *src, src_cp)"
        free_TacValue(@src_cp)
        src_cp = src[]
        (src_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src_cp))
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(src)
}

fn assign_res_instr(ctx: *struc TacReprContext, node: *struc CAssignment) *struc TacExpResult {
    src: *struc TacValue = nil
    res: *struc TacExpResult = nil
    res_postfix: *struc TacExpResult = nil
    if node[].exp_left {
        src = repr_exp_instr(ctx, node[].exp_right)
        res = repr_res_instr(ctx, node[].exp_left)
    }
    else {
        label_count_1: u32 = ctx[].identifiers[].label_count
        var_count_1: u32 = ctx[].identifiers[].var_count
        struct_count_1: u32 = ctx[].identifiers[].struct_count
        src = repr_exp_instr(ctx, node[].exp_right)
        label_count_2: u32 = ctx[].identifiers[].label_count
        var_count_2: u32 = ctx[].identifiers[].var_count
        struct_count_2: u32 = ctx[].identifiers[].struct_count
        ctx[].identifiers[].label_count = label_count_1
        ctx[].identifiers[].var_count = var_count_1
        ctx[].identifiers[].struct_count = struct_count_1
        {
            exp_left: *struc CExp = node[].exp_right
            if exp_left[].tag == AST_CCast_t {
                exp_left = exp_left[].get._CCast.exp
            }
            exp_left = exp_left[].get._CBinary.exp_left
            if exp_left[].tag == AST_CCast_t {
                exp_left = exp_left[].get._CCast.exp
            }
            {
                noeval_instrs: **struc TacInstruction = nil
                p_instrs: ***struc TacInstruction = ctx[].p_instrs
                ctx[].p_instrs = @noeval_instrs
                res = repr_res_instr(ctx, exp_left)
                ctx[].p_instrs = p_instrs
                loop i: u64 = 0 while i < (? (noeval_instrs) then (cast<*struc stbds_array_header>((noeval_instrs)) - 1)[].length else 0) .. ++i {
                    free_TacInstruction(@noeval_instrs[i])
                }
                if noeval_instrs {
                    loop .. while 0 {
                        cast<none>((? (noeval_instrs) then free((cast<*struc stbds_array_header>((noeval_instrs)) - 1)) else cast<none>(0)))
                        (noeval_instrs) = nil
                    }                    
                    noeval_instrs = nil
                }
            }
            ctx[].identifiers[].label_count = label_count_2
            ctx[].identifiers[].var_count = var_count_2
            ctx[].identifiers[].struct_count = struct_count_2
            if node[].unop.tag == AST_CPostfix_t {
                dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
                match res[].tag {
                    -> AST_TacPlainOperand_t {
                        plain_op_postfix_exp_instr(ctx, @res[].get._TacPlainOperand, @dst)
                    }
                    break
                    -> AST_TacDereferencedPointer_t {
                        deref_ptr_postfix_exp_instr(ctx, @res[].get._TacDereferencedPointer, @dst)
                    }
                    break
                    -> AST_TacSubObject_t {
                        sub_obj_postfix_exp_instr(ctx, @res[].get._TacSubObject, @dst)
                    }
                    break
                    otherwise {
                        panic_sigabrt("abort")
                    }
                }
                res_postfix = make_TacPlainOperand(@dst)
            }
        }
    }
    match res[].tag {
        -> AST_TacPlainOperand_t {
            plain_op_assign_res_instr(ctx, @res[].get._TacPlainOperand, @src)
        }
        break
        -> AST_TacDereferencedPointer_t {
            deref_ptr_assign_res_instr(ctx, @res[].get._TacDereferencedPointer, @src, @res)
        }
        break
        -> AST_TacSubObject_t {
            sub_obj_assign_res_instr(ctx, @res[].get._TacSubObject, @src, @res)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if node[].unop.tag == AST_CPostfix_t {
        free_TacExpResult(@res)
        return res_postfix
    }
    else {
        return res
    }
}

fn conditional_complete_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_else)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_false)

    dst: *struc TacValue = plain_inner_value(ctx, node[]._base)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }

    {
        src_middle: *struc TacValue = repr_exp_instr(ctx, node[].exp_middle)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_middle, @dst_cp))
    }
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    {
        src_right: *struc TacValue = repr_exp_instr(ctx, node[].exp_right)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacCopy(@src_right, @dst_cp))
    }
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}

fn conditional_void_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_else)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lternary_false)

    dst: *struc TacValue = nil
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }

    dst = repr_exp_instr(ctx, node[].exp_middle)
    free_TacValue(@dst)
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    dst = repr_exp_instr(ctx, node[].exp_right)
    free_TacValue(@dst)
    push_instr(ctx, make_TacLabel(target_false))
    return make_TacPlainOperand(@dst)
}

fn conditional_res_instr(ctx: *struc TacReprContext, node: *struc CConditional) *struc TacExpResult {
    if node[].exp_middle[].exp_type[].tag == AST_Void_t {
        return conditional_void_res_instr(ctx, node)
    }
    else {
        return conditional_complete_res_instr(ctx, node)
    }
}

fn call_res_instr(ctx: *struc TacReprContext, node: *struc CFunctionCall) *struc TacExpResult {
    name: u64 = node[].name
    args: **struc TacValue = nil
    (((args) = stbds_arrgrowf((args), sizeof((args)[]), (0), ((? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        arg: *struc TacValue = repr_exp_instr(ctx, node[].args[i])
        loop .. while 0 {
            loop .. while 0 {
                (? (not (args) or (cast<*struc stbds_array_header>((args)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((args)) - 1)[].capacity) then (((args) = stbds_arrgrowf((args), sizeof((args)[]), (1), (0))) and 0) else 0)
                (args)[(cast<*struc stbds_array_header>((args)) - 1)[].length++] = (arg)
            }            
            arg = nil
        }        
    }
    dst: *struc TacValue = nil
    if node[]._base[].exp_type[].tag ~= AST_Void_t {
        dst = plain_inner_value(ctx, node[]._base)
    }
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacFunCall(name, @args, @dst_cp))
    return make_TacPlainOperand(@dst)
}

fn deref_res_instr(ctx: *struc TacReprContext, node: *struc CDereference) *struc TacExpResult {
    val: *struc TacValue = repr_exp_instr(ctx, node[].exp)
    return make_TacDereferencedPointer(@val)
}

fn plain_op_addrof_res_instr(ctx: *struc TacReprContext, res: *struc TacPlainOperand, node: *struc CAddrOf) none {
    src: *struc TacValue = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, res->val, src)"
        if res[].val ~= src {
            "@MACRO@:uptr_move(TacValue, res->val, src)"
            free_TacValue(@src)
            src = res[].val
            res[].val = nil
        }
    }    
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacGetAddress(@src, @dst_cp))
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, dst, res->val)"
        if dst ~= res[].val {
            "@MACRO@:uptr_move(TacValue, dst, res->val)"
            free_TacValue(@res[].val)
            res[].val = dst
            dst = nil
        }
    }    
}

fn deref_ptr_addrof_res_instr(res: *struc TacDereferencedPointer, exp_res: **struc TacExpResult) none {
    val: *struc TacValue = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, res->val, val)"
        if res[].val ~= val {
            "@MACRO@:uptr_move(TacValue, res->val, val)"
            free_TacValue(@val)
            val = res[].val
            res[].val = nil
        }
    }    
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(@val)
}

fn sub_obj_addrof_res_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, node: *struc CAddrOf, exp_res: **struc TacExpResult) none {
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    {
        name: u64 = res[].base_name
        src: *struc TacValue = make_TacVariable(name)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacGetAddress(@src, @dst_cp))
    }

    if res[].offset > 0l {
        src_ptr: *struc TacValue = nil
        if dst ~= src_ptr {
            "@MACRO@:sptr_copy(TacValue, dst, src_ptr)"
            free_TacValue(@src_ptr)
            src_ptr = dst
            (src_ptr)[]._ref_count++
        }

        idx: *struc TacValue = nil
        {
            offset: i64 = res[].offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacAddPtr(1l, @src_ptr, @idx, @dst_cp))
    }
    free_TacExpResult(exp_res)
    exp_res[] = make_TacPlainOperand(@dst)
}

fn addrof_res_instr(ctx: *struc TacReprContext, node: *struc CAddrOf) *struc TacExpResult {
    res: *struc TacExpResult = repr_res_instr(ctx, node[].exp)
    match res[].tag {
        -> AST_TacPlainOperand_t {
            plain_op_addrof_res_instr(ctx, @res[].get._TacPlainOperand, node)
        }
        break
        -> AST_TacDereferencedPointer_t {
            deref_ptr_addrof_res_instr(@res[].get._TacDereferencedPointer, @res)
        }
        break
        -> AST_TacSubObject_t {
            sub_obj_addrof_res_instr(ctx, @res[].get._TacSubObject, node, @res)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return res
}

fn subscript_res_instr(ctx: *struc TacReprContext, node: *struc CSubscript) *struc TacExpResult {
    scale: i64;
    src_ptr: *struc TacValue = nil
    idx: *struc TacValue = nil
    if node[].primary_exp[].exp_type[].tag == AST_Pointer_t {
        scale = get_type_scale(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].primary_exp)
        idx = repr_exp_instr(ctx, node[].subscript_exp)
    }
    else {
        scale = get_type_scale(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type)
        src_ptr = repr_exp_instr(ctx, node[].subscript_exp)
        idx = repr_exp_instr(ctx, node[].primary_exp)
    }
    dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacAddPtr(scale, @src_ptr, @idx, @dst_cp))
    return make_TacDereferencedPointer(@dst)
}

fn sizeof_res_instr(ctx: *struc TacReprContext, node: *struc CSizeOf) *struc TacExpResult {
    constant: *struc CConst = nil
    {
        value: u64 = cast<u64>(get_type_scale(ctx, node[].exp[].exp_type))
        constant = make_CConstULong(value)
    }
    val: *struc TacValue = make_TacConstant(@constant)
    return make_TacPlainOperand(@val)
}

fn sizeoft_res_instr(ctx: *struc TacReprContext, node: *struc CSizeOfT) *struc TacExpResult {
    constant: *struc CConst = nil
    {
        value: u64 = cast<u64>(get_type_scale(ctx, node[].target_type))
        constant = make_CConstULong(value)
    }
    val: *struc TacValue = make_TacConstant(@constant)
    return make_TacPlainOperand(@val)
}

fn plain_op_dot_res_instr(res: *struc TacPlainOperand, member_offset: i64, exp_res: **struc TacExpResult) none {
    base_name: u64 = res[].val[].get._TacVariable.name
    offset: i64 = member_offset
    free_TacExpResult(exp_res)
    exp_res[] = make_TacSubObject(base_name, offset)
}

fn deref_ptr_dot_res_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, node: *struc CDot, member_offset: i64) none {
    if member_offset > 0l {
        src_ptr: *struc TacValue = nil
        loop .. while 0 {
            "@MACRO@:sptr_move(TacValue, res->val, src_ptr)"
            if res[].val ~= src_ptr {
                "@MACRO@:uptr_move(TacValue, res->val, src_ptr)"
                free_TacValue(@src_ptr)
                src_ptr = res[].val
                res[].val = nil
            }
        }        

        idx: *struc TacValue = nil
        {
            offset: i64 = member_offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacAddPtr(1l, @src_ptr, @idx, @dst_cp))
        loop .. while 0 {
            "@MACRO@:sptr_move(TacValue, dst, res->val)"
            if dst ~= res[].val {
                "@MACRO@:uptr_move(TacValue, dst, res->val)"
                free_TacValue(@res[].val)
                res[].val = dst
                dst = nil
            }
        }        
    }
}

fn sub_obj_dot_res_instr(res: *struc TacSubObject, member_offset: i64) none {
    res[].offset += member_offset
}

fn dot_res_instr(ctx: *struc TacReprContext, node: *struc CDot) *struc TacExpResult {
    struct_type: *struc Structure = @node[].structure[].exp_type[].get._Structure
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    member_offset: i64 = ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)[].offset
    res: *struc TacExpResult = repr_res_instr(ctx, node[].structure)
    match res[].tag {
        -> AST_TacPlainOperand_t {
            plain_op_dot_res_instr(@res[].get._TacPlainOperand, member_offset, @res)
        }
        break
        -> AST_TacDereferencedPointer_t {
            deref_ptr_dot_res_instr(ctx, @res[].get._TacDereferencedPointer, node, member_offset)
        }
        break
        -> AST_TacSubObject_t {
            sub_obj_dot_res_instr(@res[].get._TacSubObject, member_offset)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return res
}

fn arrow_res_instr(ctx: *struc TacReprContext, node: *struc CArrow) *struc TacExpResult {
    ptr_type: *struc Pointer = @node[].pointer[].exp_type[].get._Pointer
    struct_type: *struc Structure = @ptr_type[].ref_type[].get._Structure
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    member_offset: i64 = ((? ((? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)) and 0 then 0 else @(struct_typedef[].members)[(cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp])[].value)[].offset
    val: *struc TacValue = repr_exp_instr(ctx, node[].pointer)
    if member_offset > 0l {
        idx: *struc TacValue = nil
        {
            offset: i64 = member_offset
            constant: *struc CConst = make_CConstLong(offset)
            idx = make_TacConstant(@constant)
        }
        dst: *struc TacValue = ptr_inner_value(ctx, node[]._base)
        dst_cp: *struc TacValue = nil
        if dst ~= dst_cp {
            "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
            free_TacValue(@dst_cp)
            dst_cp = dst
            (dst_cp)[]._ref_count++
        }
        push_instr(ctx, make_TacAddPtr(1l, @val, @idx, @dst_cp))
        loop .. while 0 {
            "@MACRO@:sptr_move(TacValue, dst, val)"
            if dst ~= val {
                "@MACRO@:uptr_move(TacValue, dst, val)"
                free_TacValue(@val)
                val = dst
                dst = nil
            }
        }        
    }
    return make_TacDereferencedPointer(@val)
}

fn repr_res_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacExpResult {
    match node[].tag {
        -> AST_CConstant_t {
            return const_res_instr(@node[].get._CConstant)
        }
        -> AST_CString_t {
            return string_res_instr(ctx, @node[].get._CString)
        }
        -> AST_CVar_t {
            return var_res_instr(@node[].get._CVar)
        }
        -> AST_CCast_t {
            return cast_res_instr(ctx, @node[].get._CCast)
        }
        -> AST_CUnary_t {
            return unary_res_instr(ctx, @node[].get._CUnary)
        }
        -> AST_CBinary_t {
            return binary_res_instr(ctx, @node[].get._CBinary)
        }
        -> AST_CAssignment_t {
            return assign_res_instr(ctx, @node[].get._CAssignment)
        }
        -> AST_CConditional_t {
            return conditional_res_instr(ctx, @node[].get._CConditional)
        }
        -> AST_CFunctionCall_t {
            return call_res_instr(ctx, @node[].get._CFunctionCall)
        }
        -> AST_CDereference_t {
            return deref_res_instr(ctx, @node[].get._CDereference)
        }
        -> AST_CAddrOf_t {
            return addrof_res_instr(ctx, @node[].get._CAddrOf)
        }
        -> AST_CSubscript_t {
            return subscript_res_instr(ctx, @node[].get._CSubscript)
        }
        -> AST_CSizeOf_t {
            return sizeof_res_instr(ctx, @node[].get._CSizeOf)
        }
        -> AST_CSizeOfT_t {
            return sizeoft_res_instr(ctx, @node[].get._CSizeOfT)
        }
        -> AST_CDot_t {
            return dot_res_instr(ctx, @node[].get._CDot)
        }
        -> AST_CArrow_t {
            return arrow_res_instr(ctx, @node[].get._CArrow)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn plain_op_exp_instr(res: *struc TacPlainOperand) *struc TacValue {
    dst: *struc TacValue = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, res->val, dst)"
        if res[].val ~= dst {
            "@MACRO@:uptr_move(TacValue, res->val, dst)"
            free_TacValue(@dst)
            dst = res[].val
            res[].val = nil
        }
    }    
    return dst
}

fn deref_ptr_exp_instr(ctx: *struc TacReprContext, res: *struc TacDereferencedPointer, node: *struc CExp) *struc TacValue {
    src: *struc TacValue = nil
    loop .. while 0 {
        "@MACRO@:sptr_move(TacValue, res->val, src)"
        if res[].val ~= src {
            "@MACRO@:uptr_move(TacValue, res->val, src)"
            free_TacValue(@src)
            src = res[].val
            res[].val = nil
        }
    }    
    dst: *struc TacValue = plain_inner_value(ctx, node)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacLoad(@src, @dst_cp))
    return dst
}

fn sub_obj_exp_instr(ctx: *struc TacReprContext, res: *struc TacSubObject, node: *struc CExp) *struc TacValue {
    src_name: u64 = res[].base_name
    offset: i64 = res[].offset
    dst: *struc TacValue = plain_inner_value(ctx, node)
    dst_cp: *struc TacValue = nil
    if dst ~= dst_cp {
        "@MACRO@:sptr_copy(TacValue, dst, dst_cp)"
        free_TacValue(@dst_cp)
        dst_cp = dst
        (dst_cp)[]._ref_count++
    }
    push_instr(ctx, make_TacCopyFromOffset(src_name, offset, @dst_cp))
    return dst
}

fn repr_exp_instr(ctx: *struc TacReprContext, node: *struc CExp) *struc TacValue {
    val: *struc TacValue = nil
    res: *struc TacExpResult = repr_res_instr(ctx, node)
    match res[].tag {
        -> AST_TacPlainOperand_t {
            val = plain_op_exp_instr(@res[].get._TacPlainOperand)
            break
        }
        -> AST_TacDereferencedPointer_t {
            val = deref_ptr_exp_instr(ctx, @res[].get._TacDereferencedPointer, node)
            break
        }
        -> AST_TacSubObject_t {
            val = sub_obj_exp_instr(ctx, @res[].get._TacSubObject, node)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    free_TacExpResult(@res)
    return val
}

fn repr_block(ctx: *struc TacReprContext, node: *struc CBlock) none;
fn statement_instr(ctx: *struc TacReprContext, node: *struc CStatement) none;
fn var_decl_instr(ctx: *struc TacReprContext, node: *struc CVariableDeclaration) none;

fn ret_statement_instr(ctx: *struc TacReprContext, node: *struc CReturn) none {
    val: *struc TacValue = nil
    if node[].exp {
        val = repr_exp_instr(ctx, node[].exp)
    }
    push_instr(ctx, make_TacReturn(@val))
}

fn exp_statement_instr(ctx: *struc TacReprContext, node: *struc CExpression) none {
    res: *struc TacExpResult = repr_res_instr(ctx, node[].exp)
    free_TacExpResult(@res)
}

fn if_only_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lif_false)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_false, @condition))
    }
    statement_instr(ctx, node[].then_fi)
    push_instr(ctx, make_TacLabel(target_false))
}

fn if_else_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    target_else: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lif_else)
    target_false: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lif_false)
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_else, @condition))
    }
    statement_instr(ctx, node[].then_fi)
    push_instr(ctx, make_TacJump(target_false))
    push_instr(ctx, make_TacLabel(target_else))
    statement_instr(ctx, node[].else_fi)
    push_instr(ctx, make_TacLabel(target_false))
}

fn if_statement_instr(ctx: *struc TacReprContext, node: *struc CIf) none {
    if node[].else_fi {
        if_else_statement_instr(ctx, node)
    }
    else {
        if_only_statement_instr(ctx, node)
    }
}

fn goto_statement_instr(ctx: *struc TacReprContext, node: *struc CGoto) none {
    target_label: u64 = node[].target
    push_instr(ctx, make_TacJump(target_label))
}

fn label_statement_instr(ctx: *struc TacReprContext, node: *struc CLabel) none {
    target_label: u64 = node[].target
    push_instr(ctx, make_TacLabel(target_label))
    statement_instr(ctx, node[].jump_to)
}

fn statement_compound_instr(ctx: *struc TacReprContext, node: *struc CCompound) none {
    repr_block(ctx, node[].block)
}

fn while_statement_instr(ctx: *struc TacReprContext, node: *struc CWhile) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    push_instr(ctx, make_TacLabel(target_continue))
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_break, @condition))
    }
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacJump(target_continue))
    push_instr(ctx, make_TacLabel(target_break))
}

fn do_while_statement_instr(ctx: *struc TacReprContext, node: *struc CDoWhile) none {
    target_do_while_start: u64 = repr_label_identifier(ctx[].identifiers, LBL_Ldo_while_start)
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    push_instr(ctx, make_TacLabel(target_do_while_start))
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacLabel(target_continue))
    {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfNotZero(target_do_while_start, @condition))
    }
    push_instr(ctx, make_TacLabel(target_break))
}

fn for_init_decl_instr(ctx: *struc TacReprContext, node: *struc CInitDecl) none {
    if node[].init and node[].init[].init {
        var_decl_instr(ctx, node[].init)
    }
}

fn for_init_exp_instr(ctx: *struc TacReprContext, node: *struc CInitExp) none {
    if node[].init {
        res: *struc TacExpResult = repr_res_instr(ctx, node[].init)
        free_TacExpResult(@res)
    }
}

fn for_init_statement_instr(ctx: *struc TacReprContext, node: *struc CForInit) none {
    match node[].tag {
        -> AST_CInitDecl_t {
            for_init_decl_instr(ctx, @node[].get._CInitDecl)
        }
        break
        -> AST_CInitExp_t {
            for_init_exp_instr(ctx, @node[].get._CInitExp)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn for_statement_instr(ctx: *struc TacReprContext, node: *struc CFor) none {
    target_for_start: u64 = repr_label_identifier(ctx[].identifiers, LBL_Lfor_start)
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    for_init_statement_instr(ctx, node[].init)
    push_instr(ctx, make_TacLabel(target_for_start))
    if node[].condition {
        condition: *struc TacValue = repr_exp_instr(ctx, node[].condition)
        push_instr(ctx, make_TacJumpIfZero(target_break, @condition))
    }
    statement_instr(ctx, node[].body)
    push_instr(ctx, make_TacLabel(target_continue))
    if node[].post {
        res: *struc TacExpResult = repr_res_instr(ctx, node[].post)
        free_TacExpResult(@res)
    }
    push_instr(ctx, make_TacJump(target_for_start))
    push_instr(ctx, make_TacLabel(target_break))
}

fn switch_statement_instr(ctx: *struc TacReprContext, node: *struc CSwitch) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    {
        lookup: *struc TacValue = repr_exp_instr(ctx, node[].lookup)
        loop i: u64 = 0 while i < (? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0) .. ++i {
            target_case: u64 = repr_case_identifier(ctx[].identifiers, node[].target, true, i)

            case_match: *struc TacValue = nil
            {
                lookup_cp: *struc TacValue = nil
                if lookup ~= lookup_cp {
                    "@MACRO@:sptr_copy(TacValue, lookup, lookup_cp)"
                    free_TacValue(@lookup_cp)
                    lookup_cp = lookup
                    (lookup_cp)[]._ref_count++
                }
                esac: *struc TacValue = repr_exp_instr(ctx, node[].cases[i])
                case_match = plain_inner_value(ctx, node[].cases[i])
                case_match_cp: *struc TacValue = nil
                if case_match ~= case_match_cp {
                    "@MACRO@:sptr_copy(TacValue, case_match, case_match_cp)"
                    free_TacValue(@case_match_cp)
                    case_match_cp = case_match
                    (case_match_cp)[]._ref_count++
                }
                binop: struc TacBinaryOp = make_TacBinaryOp(AST_TacEqual_t)
                push_instr(ctx, make_TacBinary(@binop, @lookup_cp, @esac, @case_match_cp))
            }

            push_instr(ctx, make_TacJumpIfNotZero(target_case, @case_match))
        }
        free_TacValue(@lookup)
    }
    if node[].is_default {
        target_default: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Ldefault, node[].target)
        push_instr(ctx, make_TacJump(target_default))
        statement_instr(ctx, node[].body)
    }
    elif not ((? (node[].cases) then (cast<*struc stbds_array_header>((node[].cases)) - 1)[].length else 0) == 0) {
        push_instr(ctx, make_TacJump(target_break))
        statement_instr(ctx, node[].body)
    }
    push_instr(ctx, make_TacLabel(target_break))
}

fn case_statement_instr(ctx: *struc TacReprContext, node: *struc CCase) none {
    target_case: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcase, node[].target)
    push_instr(ctx, make_TacLabel(target_case))
    statement_instr(ctx, node[].jump_to)
}

fn default_statement_instr(ctx: *struc TacReprContext, node: *struc CDefault) none {
    target_default: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Ldefault, node[].target)
    push_instr(ctx, make_TacLabel(target_default))
    statement_instr(ctx, node[].jump_to)
}

fn break_statement_instr(ctx: *struc TacReprContext, node: *struc CBreak) none {
    target_break: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lbreak, node[].target)
    push_instr(ctx, make_TacJump(target_break))
}

fn continue_statement_instr(ctx: *struc TacReprContext, node: *struc CContinue) none {
    target_continue: u64 = repr_loop_identifier(ctx[].identifiers, LBL_Lcontinue, node[].target)
    push_instr(ctx, make_TacJump(target_continue))
}

fn statement_instr(ctx: *struc TacReprContext, node: *struc CStatement) none {
    match node[].tag {
        -> AST_CReturn_t {
            ret_statement_instr(ctx, @node[].get._CReturn)
        }
        break
        -> AST_CExpression_t {
            exp_statement_instr(ctx, @node[].get._CExpression)
        }
        break
        -> AST_CIf_t {
            if_statement_instr(ctx, @node[].get._CIf)
        }
        break
        -> AST_CGoto_t {
            goto_statement_instr(ctx, @node[].get._CGoto)
        }
        break
        -> AST_CLabel_t {
            label_statement_instr(ctx, @node[].get._CLabel)
        }
        break
        -> AST_CCompound_t {
            statement_compound_instr(ctx, @node[].get._CCompound)
        }
        break
        -> AST_CWhile_t {
            while_statement_instr(ctx, @node[].get._CWhile)
        }
        break
        -> AST_CDoWhile_t {
            do_while_statement_instr(ctx, @node[].get._CDoWhile)
        }
        break
        -> AST_CFor_t {
            for_statement_instr(ctx, @node[].get._CFor)
        }
        break
        -> AST_CSwitch_t {
            switch_statement_instr(ctx, @node[].get._CSwitch)
        }
        break
        -> AST_CCase_t {
            case_statement_instr(ctx, @node[].get._CCase)
        }
        break
        -> AST_CDefault_t {
            default_statement_instr(ctx, @node[].get._CDefault)
        }
        break
        -> AST_CBreak_t {
            break_statement_instr(ctx, @node[].get._CBreak)
        }
        break
        -> AST_CContinue_t {
            continue_statement_instr(ctx, @node[].get._CContinue)
        }
        break
        -> AST_CNull_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn compound_init_instr(ctx: *struc TacReprContext, node: *struc CInitializer, init_type: *struc Type, symbol: u64, size: *i64) none;

fn string_single_init_instr(ctx: *struc TacReprContext, node: *struc CString, arr_type: *struc Array, symbol: u64, size: i64) none {
    byte_at: u64 = 0
    bytes_size: u64 = cast<u64>(arr_type[].size)
    bytes_copy: u64 = ? arr_type[].size > cast<i64>((? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0)) then (? (node[].literal[].value) then (cast<*struc stbds_array_header>((node[].literal[].value)) - 1)[].length else 0) else bytes_size
    loop while byte_at < bytes_copy {
        dst_name: u64 = symbol
        offset: i64 = size + (cast<i64>(byte_at))

        src: *struc TacValue = nil
        {
            constant: *struc CConst = nil
            {
                bytes_left: u64 = bytes_size - byte_at
                if bytes_left < 4 {
                    value: i8 = string_bytes_to_int8(node[].literal[].value, byte_at)
                    constant = make_CConstChar(value)
                    byte_at++
                }
                elif bytes_left < 8 {
                    value: i32 = string_bytes_to_int32(node[].literal[].value, byte_at)
                    constant = make_CConstInt(value)
                    byte_at += 4
                }
                else {
                    value: i64 = string_bytes_to_int64(node[].literal[].value, byte_at)
                    constant = make_CConstLong(value)
                    byte_at += 8
                }
            }

            src = make_TacConstant(@constant)
        }

        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
    loop while byte_at < bytes_size {
        dst_name: u64 = symbol
        offset: i64 = size + (cast<i64>(byte_at))

        src: *struc TacValue = nil
        {
            constant: *struc CConst = nil
            {
                bytes_left: u64 = bytes_size - byte_at
                if bytes_left < 4 {
                    constant = make_CConstChar(0)
                    byte_at++
                }
                elif bytes_left < 8 {
                    constant = make_CConstInt(0)
                    byte_at += 4
                }
                else {
                    constant = make_CConstLong(0l)
                    byte_at += 8
                }
            }

            src = make_TacConstant(@constant)
        }

        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
}

fn single_init_instr(ctx: *struc TacReprContext, node: *struc CSingleInit, init_type: *struc Type, symbol: u64) none {
    if node[].exp[].tag == AST_CString_t and init_type[].tag == AST_Array_t {
        string_single_init_instr(ctx, @node[].exp[].get._CString, @init_type[].get._Array, symbol, 0l)
    }
    else {
        src: *struc TacValue = repr_exp_instr(ctx, node[].exp)

        dst: *struc TacValue = nil
        {
            name: u64 = symbol
            exp: *struc CExp = make_CVar(name, 0)
            dst = repr_value(exp)
            free_CExp(@exp)
        }

        push_instr(ctx, make_TacCopy(@src, @dst))
    }
}

fn scalar_compound_init_instr(ctx: *struc TacReprContext, node: *struc CSingleInit, init_type: *struc Type, symbol: u64, size: i64) none {
    if node[].exp[].tag == AST_CString_t and init_type[].tag == AST_Array_t {
        string_single_init_instr(ctx, @node[].exp[].get._CString, @init_type[].get._Array, symbol, size)
    }
    else {
        dst_name: u64 = symbol
        offset: i64 = size
        src: *struc TacValue = repr_exp_instr(ctx, node[].exp)
        push_instr(ctx, make_TacCopyToOffset(dst_name, offset, @src))
    }
}

fn arr_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, arr_type: *struc Array, symbol: u64, size: *i64) none {
    loop i: u64 = 0 while i < (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) .. ++i {
        compound_init_instr(ctx, node[].initializers[i], arr_type[].elem_type, symbol, size)
        if node[].initializers[i][].tag == AST_CSingleInit_t {
            size[] += get_type_scale(ctx, arr_type[].elem_type)
        }
    }
}

fn struct_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, struct_type: *struc Structure, symbol: u64, size: *i64) none {
    loop i: u64 = (? (node[].initializers) then (cast<*struc stbds_array_header>((node[].initializers)) - 1)[].length else 0) while i-- > 0 {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        offset: i64 = size[] + member[].offset
        compound_init_instr(ctx, node[].initializers[i], member[].member_type, symbol, @offset)
    }
    size[] += get_struct_scale(ctx, struct_type)
}

fn aggr_compound_init_instr(ctx: *struc TacReprContext, node: *struc CCompoundInit, init_type: *struc Type, symbol: u64, size: *i64) none {
    match init_type[].tag {
        -> AST_Array_t {
            arr_compound_init_instr(ctx, node, @init_type[].get._Array, symbol, size)
        }
        break
        -> AST_Structure_t {
            struct_compound_init_instr(ctx, node, @init_type[].get._Structure, symbol, size)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn compound_init_instr(ctx: *struc TacReprContext, node: *struc CInitializer, init_type: *struc Type, symbol: u64, size: *i64) none {
    match node[].tag {
        -> AST_CSingleInit_t {
            scalar_compound_init_instr(ctx, @node[].get._CSingleInit, init_type, symbol, size[])
        }
        break
        -> AST_CCompoundInit_t {
            aggr_compound_init_instr(ctx, @node[].get._CCompoundInit, init_type, symbol, size)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn var_decl_instr(ctx: *struc TacReprContext, node: *struc CVariableDeclaration) none {
    init_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    match node[].init[].tag {
        -> AST_CSingleInit_t {
            single_init_instr(ctx, @node[].init[].get._CSingleInit, init_type, node[].name)
        }
        break
        -> AST_CCompoundInit_t {
            size: i64 = 0l
            aggr_compound_init_instr(ctx, @node[].init[].get._CCompoundInit, init_type, node[].name, @size)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn var_declaration_instr(ctx: *struc TacReprContext, node: *struc CVarDecl) none {
    if node[].var_decl[].init and ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].var_decl[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag ~= AST_StaticAttr_t {
        var_decl_instr(ctx, node[].var_decl)
    }
}

fn declaration_instr(ctx: *struc TacReprContext, node: *struc CDeclaration) none {
    match node[].tag {
        -> AST_CFunDecl_t {
            -> AST_CStructDecl_t {
                break
            }
        }
        -> AST_CVarDecl_t {
            var_declaration_instr(ctx, @node[].get._CVarDecl)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn repr_instr_list(ctx: *struc TacReprContext, node_list: **struc CBlockItem) none {
    loop i: u64 = 0 while i < (? (node_list) then (cast<*struc stbds_array_header>((node_list)) - 1)[].length else 0) .. ++i {
        match node_list[i][].tag {
            -> AST_CS_t {
                statement_instr(ctx, node_list[i][].get._CS.statement)
            }
            break
            -> AST_CD_t {
                declaration_instr(ctx, node_list[i][].get._CD.declaration)
            }
            break
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
}

fn repr_block(ctx: *struc TacReprContext, node: *struc CBlock) none {
    if node[].tag == AST_CB_t {
        repr_instr_list(ctx, node[].get._CB.block_items)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn repr_fun_toplvl(ctx: *struc TacReprContext, node: *struc CFunctionDeclaration) *struc TacTopLevel {
    name: u64 = node[].name
    is_glob: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].get._FunAttr.is_glob
    params: *u64 = nil
    loop .. while 0 {
        (? (? (params) then (cast<*struc stbds_array_header>((params)) - 1)[].capacity else 0) < cast<u64>(((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))) then ((((params)) = stbds_arrgrowf(((params)), sizeof(((params))[]), (0), (cast<u64>(((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))))))) and 0 else 0)
        ? (params) then (cast<*struc stbds_array_header>((params)) - 1)[].length = cast<u64>(((? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))) else 0
    }    
    memcpy(params, node[].params, sizeof<u64> * (? (node[].params) then (cast<*struc stbds_array_header>((node[].params)) - 1)[].length else 0))

    body: **struc TacInstruction = nil
    {
        ctx[].p_instrs = @body
        repr_block(ctx, node[].body)
        {
            constant: *struc CConst = make_CConstInt(0)
            val: *struc TacValue = make_TacConstant(@constant)
            push_instr(ctx, make_TacReturn(@val))
        }
        ctx[].p_instrs = nil
    }

    return make_TacFunction(name, is_glob, @params, @body)
}

fn push_toplvl(ctx: *struc TacReprContext, top_level: *struc TacTopLevel) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_toplvls[]) or (cast<*struc stbds_array_header>((ctx[].p_toplvls[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_toplvls[])) - 1)[].capacity) then (((ctx[].p_toplvls[]) = stbds_arrgrowf((ctx[].p_toplvls[]), sizeof((ctx[].p_toplvls[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_toplvls[])[(cast<*struc stbds_array_header>((ctx[].p_toplvls[])) - 1)[].length++] = (top_level)
        }        
        top_level = nil
    }    
}

fn fun_decl_toplvl(ctx: *struc TacReprContext, node: *struc CFunDecl) none {
    if node[].fun_decl[].body {
        push_toplvl(ctx, repr_fun_toplvl(ctx, node[].fun_decl))
    }
}

fn declaration_toplvl(ctx: *struc TacReprContext, node: *struc CDeclaration) none {
    match node[].tag {
        -> AST_CFunDecl_t {
            fun_decl_toplvl(ctx, @node[].get._CFunDecl)
        }
        break
        -> AST_CVarDecl_t {
            -> AST_CStructDecl_t {
                break
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn tentative_static_toplvl(ctx: *struc TacReprContext, static_init_type: *struc Type) **struc StaticInit {
    static_inits: **struc StaticInit = nil
    {
        byte: i64 = get_type_scale(ctx, static_init_type)
        static_init: *struc StaticInit = make_ZeroInit(byte)
        loop .. while 0 {
            loop .. while 0 {
                (? (not (static_inits) or (cast<*struc stbds_array_header>((static_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_inits)) - 1)[].capacity) then (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (1), (0))) and 0) else 0)
                (static_inits)[(cast<*struc stbds_array_header>((static_inits)) - 1)[].length++] = (static_init)
            }            
            static_init = nil
        }        
    }

    return static_inits
}

fn initial_static_toplvl(node: *struc Initial) **struc StaticInit {
    static_inits: **struc StaticInit = nil
    (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (0), ((? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0)))))
    loop i: u64 = 0 while i < (? (node[].static_inits) then (cast<*struc stbds_array_header>((node[].static_inits)) - 1)[].length else 0) .. ++i {
        static_init: *struc StaticInit = nil
        if node[].static_inits[i] ~= static_init {
            "@MACRO@:sptr_copy(StaticInit, node->static_inits[i], static_init)"
            free_StaticInit(@static_init)
            static_init = node[].static_inits[i]
            (static_init)[]._ref_count++
        }
        loop .. while 0 {
            loop .. while 0 {
                (? (not (static_inits) or (cast<*struc stbds_array_header>((static_inits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((static_inits)) - 1)[].capacity) then (((static_inits) = stbds_arrgrowf((static_inits), sizeof((static_inits)[]), (1), (0))) and 0) else 0)
                (static_inits)[(cast<*struc stbds_array_header>((static_inits)) - 1)[].length++] = (static_init)
            }            
            static_init = nil
        }        
    }
    return static_inits
}

fn repr_static_var_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    static_attr: *struc StaticAttr = @node[].attrs[].get._StaticAttr
    if static_attr[].init[].tag == AST_NoInitializer_t {
        return none
    }
    name: u64 = symbol
    is_glob: i32 = static_attr[].is_glob
    static_init_type: *struc Type = nil
    if node[].type_t ~= static_init_type {
        "@MACRO@:sptr_copy(Type, node->type_t, static_init_type)"
        free_Type(@static_init_type)
        static_init_type = node[].type_t
        (static_init_type)[]._ref_count++
    }
    static_inits: **struc StaticInit = nil
    match static_attr[].init[].tag {
        -> AST_Tentative_t {
            static_inits = tentative_static_toplvl(ctx, static_init_type)
        }
        break
        -> AST_Initial_t {
            static_inits = initial_static_toplvl(@static_attr[].init[].get._Initial)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    push_toplvl(ctx, make_TacStaticVariable(name, is_glob, @static_init_type, @static_inits))
}

fn push_static_const_toplvl(ctx: *struc TacReprContext, static_const_toplvls: *struc TacTopLevel) none {
    loop .. while 0 {
        loop .. while 0 {
            (? (not (ctx[].p_static_consts[]) or (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].capacity) then (((ctx[].p_static_consts[]) = stbds_arrgrowf((ctx[].p_static_consts[]), sizeof((ctx[].p_static_consts[])[]), (1), (0))) and 0) else 0)
            (ctx[].p_static_consts[])[(cast<*struc stbds_array_header>((ctx[].p_static_consts[])) - 1)[].length++] = (static_const_toplvls)
        }        
        static_const_toplvls = nil
    }    
}

fn repr_static_const_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    name: u64 = symbol
    static_init_type: *struc Type = nil
    if node[].type_t ~= static_init_type {
        "@MACRO@:sptr_copy(Type, node->type_t, static_init_type)"
        free_Type(@static_init_type)
        static_init_type = node[].type_t
        (static_init_type)[]._ref_count++
    }
    static_init: *struc StaticInit = nil
    if node[].attrs[].get._ConstantAttr.static_init ~= static_init {
        "@MACRO@:sptr_copy(StaticInit, node->attrs->get._ConstantAttr.static_init, static_init)"
        free_StaticInit(@static_init)
        static_init = node[].attrs[].get._ConstantAttr.static_init
        (static_init)[]._ref_count++
    }
    push_static_const_toplvl(ctx, make_TacStaticConstant(name, @static_init_type, @static_init))
}

fn symbol_toplvl(ctx: *struc TacReprContext, node: *struc Symbol, symbol: u64) none {
    match node[].attrs[].tag {
        -> AST_StaticAttr_t {
            repr_static_var_toplvl(ctx, node, symbol)
        }
        break
        -> AST_ConstantAttr_t {
            repr_static_const_toplvl(ctx, node, symbol)
        }
        break
        otherwise {
            break
        }
    }
}

fn repr_program(ctx: *struc TacReprContext, node: *struc CProgram) *struc TacProgram {
    fun_toplvls: **struc TacTopLevel = nil
    {
        ctx[].p_toplvls = @fun_toplvls
        loop i: u64 = 0 while i < (? (node[].declarations) then (cast<*struc stbds_array_header>((node[].declarations)) - 1)[].length else 0) .. ++i {
            declaration_toplvl(ctx, node[].declarations[i])
        }
        ctx[].p_toplvls = nil
    }
    static_var_toplvls: **struc TacTopLevel = nil

    static_const_toplvls: **struc TacTopLevel = nil
    {
        ctx[].p_toplvls = @static_var_toplvls
        ctx[].p_static_consts = @static_const_toplvls
        loop i: u64 = 0 while i < (? (ctx[].frontend[].symbol_table) then (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
            symbol: *struc PairTIdentifierUPtrSymbol = @ctx[].frontend[].symbol_table[i]
            symbol_toplvl(ctx, (symbol[]).value, (symbol[]).key)
        }
        ctx[].p_toplvls = nil
        ctx[].p_static_consts = nil
    }

    return make_TacProgram(@static_const_toplvls, @static_var_toplvls, @fun_toplvls)
}

pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram {
    ctx: struc TacReprContext;
    {
        ctx.frontend = frontend
        ctx.identifiers = identifiers
    }
    tac_ast: *struc TacProgram = repr_program(@ctx, c_ast[])
    free_CProgram(c_ast)
    return tac_ast
}
