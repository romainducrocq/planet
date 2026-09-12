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
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none;
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
m4_define(`mask_t', `TODO')m4_dnl
type struc ControlFlowGraph;
type struc DataFlowAnalysis;
type struc DataFlowAnalysisO2;

type struc InferenceRegister(color: i32, reg_kind: i32, degree: u64, spill_cost: u64, linked_hard_mask: u64, linked_pseudo_names: *u64)

m4_define(`StInferenceRegister', `TODO')m4_dnl

type struc PairTIdentifierStInferenceRegister(key: u64, value: struc InferenceRegister)

type struc InferenceGraph(k: u64, offset: u64, hard_reg_mask: u64, unpruned_hard_mask_bits: *u64, unpruned_pseudo_names: *u64, pseudo_reg_map: *struc PairTIdentifierStInferenceRegister)

type struc RegAllocContext(backend: *struc BackEndContext, frontend: *struc FrontEndContext, callee_saved_reg_mask: u64, p_backend_fun: *struc BackendFun, p_infer_graph: *struc InferenceGraph, reg_color_map: [26]i32, hard_regs: [26]struc InferenceRegister, cfg: *struc ControlFlowGraph, dfa: *struc DataFlowAnalysis, dfa_o2: *struc DataFlowAnalysisO2, infer_graph: *struc InferenceGraph, sse_infer_graph: *struc InferenceGraph, p_instrs: ***struc AsmInstruction, is_with_coal: i32)

fn free_InferenceGraph(self: **struc InferenceGraph) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    if (self[])[].unpruned_hard_mask_bits {
        loop .. while 0 {
            cast<none>((? ((self[])[].unpruned_hard_mask_bits) then free((cast<*struc stbds_array_header>(((self[])[].unpruned_hard_mask_bits)) - 1)) else cast<none>(0)))
            ((self[])[].unpruned_hard_mask_bits) = nil
        }
        (self[])[].unpruned_hard_mask_bits = nil
    }
    ;
    if (self[])[].unpruned_pseudo_names {
        loop .. while 0 {
            cast<none>((? ((self[])[].unpruned_pseudo_names) then free((cast<*struc stbds_array_header>(((self[])[].unpruned_pseudo_names)) - 1)) else cast<none>(0)))
            ((self[])[].unpruned_pseudo_names) = nil
        }
        (self[])[].unpruned_pseudo_names = nil
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].pseudo_reg_map) then (cast<*struc stbds_array_header>((((self[])[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if ((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? (((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names) then free((cast<*struc stbds_array_header>((((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names)) - 1)) else cast<none>(0)))
                (((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names) = nil
            }
            ((self[])[].pseudo_reg_map[i]).value.linked_pseudo_names = nil
        }
        ;
    }
    if (self[])[].pseudo_reg_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].pseudo_reg_map) ~= nil then stbds_hmfree_func(((self[])[].pseudo_reg_map) - 1, sizeof(((self[])[].pseudo_reg_map)[])) else cast<none>(0)))
            ((self[])[].pseudo_reg_map) = nil
        }
        (self[])[].pseudo_reg_map = nil
    }
    ;
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
    ;
}

fn make_InferenceGraph(is_sse: i32) *struc InferenceGraph {
    self: *struc InferenceGraph = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(InferenceGraph, self)"
        free_InferenceGraph(@self)
        self = cast<*struc InferenceGraph>(malloc(sizeof<struc InferenceGraph>))
        if not self {
            panic_sigabrt("alloc "                 "InferenceGraph")
        }
    }
    self[].hard_reg_mask = 0ul
    self[].unpruned_hard_mask_bits = nil
    self[].unpruned_pseudo_names = nil
    self[].pseudo_reg_map = nil
    if is_sse {
        self[].k = 14
        self[].offset = 12
        register_mask_set(@self[].hard_reg_mask, REG_Xmm0, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm1, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm2, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm3, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm4, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm5, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm6, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm7, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm8, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm9, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm10, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm11, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm12, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm13, true)
    }
    else {
        self[].k = 12
        self[].offset = 0
        register_mask_set(@self[].hard_reg_mask, REG_Ax, true)
        register_mask_set(@self[].hard_reg_mask, REG_Bx, true)
        register_mask_set(@self[].hard_reg_mask, REG_Cx, true)
        register_mask_set(@self[].hard_reg_mask, REG_Dx, true)
        register_mask_set(@self[].hard_reg_mask, REG_Di, true)
        register_mask_set(@self[].hard_reg_mask, REG_Si, true)
        register_mask_set(@self[].hard_reg_mask, REG_R8, true)
        register_mask_set(@self[].hard_reg_mask, REG_R9, true)
        register_mask_set(@self[].hard_reg_mask, REG_R12, true)
        register_mask_set(@self[].hard_reg_mask, REG_R13, true)
        register_mask_set(@self[].hard_reg_mask, REG_R14, true)
        register_mask_set(@self[].hard_reg_mask, REG_R15, true)
    }
    return self
}

m4_define(`GET_INSTR', `TODO')m4_dnl
m4_define(`GET_CFG_BLOCK', `TODO')m4_dnl
m4_define(`AstInstruction', `TODO')m4_dnl
m4_define(`AstInstruction', `TODO')m4_dnl
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`free_AstInstruction', `TODO')m4_dnl
m4_define(`free_AstInstruction', `TODO')m4_dnl
m4_define(`uptr_move_AstInstruction', `TODO')m4_dnl
m4_define(`uptr_move_AstInstruction', `TODO')m4_dnl

type struc ControlFlowBlock(size: u64, instrs_front_idx: u64, instrs_back_idx: u64, pred_ids: *u64, succ_ids: *u64)

type struc ControlFlowGraph(entry_id: u64, exit_id: u64, entry_succ_ids: *u64, exit_pred_ids: *u64, reaching_code: *i32, blocks: *struc ControlFlowBlock, identifier_id_map: *struc PairTIdentifierulong_t)

type struc DataFlowAnalysis(set_size: u64, mask_size: u64, incoming_idx: u64, static_idx: u64, open_data_map: *u64, instr_idx_map: *u64, blocks_mask_sets: *u64, instrs_mask_sets: *u64)

type struc DataFlowAnalysisO2(data_name_map: *u64)

fn free_ControlFlowGraph(self: **struc ControlFlowGraph) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
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
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
    ;
}

fn make_ControlFlowGraph(none) *struc ControlFlowGraph {
    self: *struc ControlFlowGraph = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(ControlFlowGraph, self)"
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
        "@MACRO@:uptr_delete(*self)"
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
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
    ;
}

fn make_DataFlowAnalysis(none) *struc DataFlowAnalysis {
    self: *struc DataFlowAnalysis = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(DataFlowAnalysis, self)"
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

fn free_DataFlowAnalysisO2(self: **struc DataFlowAnalysisO2) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    if (self[])[].data_name_map {
        loop .. while 0 {
            cast<none>((? ((self[])[].data_name_map) then free((cast<*struc stbds_array_header>(((self[])[].data_name_map)) - 1)) else cast<none>(0)))
            ((self[])[].data_name_map) = nil
        }
        (self[])[].data_name_map = nil
    }
    ;
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = nil
    }
    ;
}

fn make_DataFlowAnalysisO2(none) *struc DataFlowAnalysisO2 {
    self: *struc DataFlowAnalysisO2 = nil
    loop .. while 0 {
        "@MACRO@:uptr_alloc(DataFlowAnalysisO2, self)"
        free_DataFlowAnalysisO2(@self)
        self = cast<*struc DataFlowAnalysisO2>(malloc(sizeof<struc DataFlowAnalysisO2>))
        if not self {
            panic_sigabrt("alloc "                 "DataFlowAnalysisO2")
        }
    }
    self[].data_name_map = nil
    return self
}

fn set_instr(ctx: *struc RegAllocContext, instr: *struc AsmInstruction, instr_idx: u64) none {
    if instr {
        if instr ~= (ctx[].p_instrs[])[instr_idx] {
            "@MACRO@:uptr_move(AsmInstruction, instr, (*ctx->p_instrs)[instr_idx])"
            free_AsmInstruction(@(ctx[].p_instrs[])[instr_idx])
            (ctx[].p_instrs[])[instr_idx] = instr
            instr = nil
        }
        ;
    }
    else {
        free_AsmInstruction(@(ctx[].p_instrs[])[instr_idx])
    }
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

fn cfg_add_succ_edge(ctx: *struc RegAllocContext, block_id: u64, succ_id: u64) none {
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

fn cfg_add_pred_edge(ctx: *struc RegAllocContext, block_id: u64, pred_id: u64) none {
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

fn cfg_rm_succ_edge(ctx: *struc RegAllocContext, block_id: u64, succ_id: u64, is_reachable: i32) none {
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

fn cfg_rm_pred_edge(ctx: *struc RegAllocContext, block_id: u64, pred_id: u64) none {
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

fn cfg_rm_empty_block(ctx: *struc RegAllocContext, block_id: u64, is_reachable: i32) none {
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

fn cfg_rm_block_instr(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) none {
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

fn cfg_init_label_block(ctx: *struc RegAllocContext, node: *struc AsmLabel) none {
    loop .. while 0 {
        (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
        (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (node[].name)
        (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1)
    }
}

fn cfg_init_block(ctx: *struc RegAllocContext, instr_idx: u64, instrs_back_idx: *u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmLabel_t {
            if instrs_back_idx[] ~= (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instrs_back_idx[]
                block: struc ControlFlowBlock = $(0, instr_idx, 0, nil, nil)
                loop .. while 0 {
                    (? (not (ctx[].cfg[].blocks) or (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].capacity) then (((ctx[].cfg[].blocks) = stbds_arrgrowf((ctx[].cfg[].blocks), sizeof((ctx[].cfg[].blocks)[]), (1), (0))) and 0) else 0)
                    (ctx[].cfg[].blocks)[(cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length++] = (block)
                }
            }
            cfg_init_label_block(ctx, @node[].get._AsmLabel)
            instrs_back_idx[] = instr_idx
            break
        }
        -> AST_AsmJmp_t {
            -> AST_AsmJmpCC_t {
                -> AST_AsmRet_t {
                    (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instr_idx
                    instrs_back_idx[] = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
                    break
                }
            }
        }
        otherwise {
            instrs_back_idx[] = instr_idx
            break
        }
    }
}

fn cfg_init_jmp_edges(ctx: *struc RegAllocContext, node: *struc AsmJmp, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
}

fn cfg_init_jmp_cc_edges(ctx: *struc RegAllocContext, node: *struc AsmJmpCC, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}

fn cfg_init_edges(ctx: *struc RegAllocContext, block_id: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
        -> AST_AsmRet_t {
            cfg_add_succ_edge(ctx, block_id, ctx[].cfg[].exit_id)
        }
        break
        -> AST_AsmJmp_t {
            cfg_init_jmp_edges(ctx, @node[].get._AsmJmp, block_id)
        }
        break
        -> AST_AsmJmpCC_t {
            cfg_init_jmp_cc_edges(ctx, @node[].get._AsmJmpCC, block_id)
        }
        break
        otherwise {
            cfg_add_succ_edge(ctx, block_id, block_id + 1)
        }
        break
    }
}

fn init_control_flow_graph(ctx: *struc RegAllocContext) none {
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
m4_define(`MASK_OFFSET', `TODO')m4_dnl
m4_define(`GET_DFA_BLOCK_SET_IDX', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_IDX', `TODO')m4_dnl
m4_define(`GET_DFA_BLOCK_SET_MASK', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_MASK', `TODO')m4_dnl
m4_define(`GET_DFA_BLOCK_SET_AT', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_AT', `TODO')m4_dnl
m4_define(`SET_DFA_INSTR_SET_AT', `TODO')m4_dnl

fn is_transfer_instr(ctx: *struc RegAllocContext, instr_idx: u64) i32 {
    match (ctx[].p_instrs[])[instr_idx][].tag {
        -> AST_AsmMov_t {
            -> AST_AsmMovSx_t {
                -> AST_AsmMovZeroExtend_t {
                    -> AST_AsmLea_t {
                        -> AST_AsmCvttsd2si_t {
                            -> AST_AsmCvtsi2sd_t {
                                -> AST_AsmUnary_t {
                                    -> AST_AsmBinary_t {
                                        -> AST_AsmCmp_t {
                                            -> AST_AsmIdiv_t {
                                                -> AST_AsmDiv_t {
                                                    -> AST_AsmCdq_t {
                                                        -> AST_AsmSetCC_t {
                                                            -> AST_AsmPush_t {
                                                                -> AST_AsmCall_t {
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
        otherwise {
            return false
        }
    }
}

fn infer_transfer_live_regs(ctx: *struc RegAllocContext, instr_idx: u64, next_instr_idx: u64) none;

fn dfa_backward_transfer_block(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) u64 {
    if instr_idx > 0 {
        loop next_instr_idx: u64 = instr_idx while next_instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
            if (ctx[].p_instrs[])[next_instr_idx] and is_transfer_instr(ctx, next_instr_idx) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
                infer_transfer_live_regs(ctx, instr_idx, next_instr_idx)
                instr_idx = next_instr_idx
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
    infer_transfer_live_regs(ctx, instr_idx, ctx[].dfa[].incoming_idx)
    return instr_idx
}

fn dfa_after_meet_block(ctx: *struc RegAllocContext, block_id: u64) i32 {
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

fn dfa_backward_meet_block(ctx: *struc RegAllocContext, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1
    loop while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
        if (ctx[].p_instrs[])[instr_idx] and is_transfer_instr(ctx, instr_idx) {
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

fn dfa_iter_alg(ctx: *struc RegAllocContext) none {
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

fn dfa_backward_open_block(ctx: *struc RegAllocContext, block_id: u64, i: *u64) none;

fn dfa_backward_succ_open_block(ctx: *struc RegAllocContext, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
        dfa_backward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}

fn dfa_backward_open_block(ctx: *struc RegAllocContext, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_backward_succ_open_block(ctx, block_id, i)
        ctx[].dfa[].open_data_map[i[]] = block_id
        (i[])++
    }
}

fn is_aliased_name(ctx: *struc RegAllocContext, name: u64) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t or (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1
}

fn infer_add_data_name(ctx: *struc RegAllocContext, name: u64) none {
    if not is_aliased_name(ctx, name) and (? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (name)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = (REGISTER_MASK_SIZE + ctx[].dfa[].set_size)
        }
        ctx[].dfa[].set_size++
    }
}

fn infer_add_data_op(ctx: *struc RegAllocContext, node: *struc AsmOperand) none {
    if node[].tag == AST_AsmPseudo_t {
        infer_add_data_name(ctx, node[].get._AsmPseudo.name)
    }
}

fn init_data_flow_analysis(ctx: *struc RegAllocContext, fun_name: u64) i32 {
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
        i = 2
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
    if ctx[].cfg[].identifier_id_map {
        loop .. while 0 {
            cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
            (ctx[].cfg[].identifier_id_map) = nil
        }
        ctx[].cfg[].identifier_id_map = nil
    }
    ;
    ctx[].dfa[].static_idx = ctx[].dfa[].incoming_idx + 1
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
                    match node[].tag {
                        -> AST_AsmMov_t {
                            p_node: *struc AsmMov = @node[].get._AsmMov
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmMovSx_t {
                            p_node: *struc AsmMovSx = @node[].get._AsmMovSx
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmMovZeroExtend_t {
                            p_node: *struc AsmMovZeroExtend = @node[].get._AsmMovZeroExtend
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmLea_t {
                            p_node: *struc AsmLea = @node[].get._AsmLea
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmCvttsd2si_t {
                            p_node: *struc AsmCvttsd2si = @node[].get._AsmCvttsd2si
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmCvtsi2sd_t {
                            p_node: *struc AsmCvtsi2sd = @node[].get._AsmCvtsi2sd
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmUnary_t {
                            infer_add_data_op(ctx, node[].get._AsmUnary.dst)
                        }
                        break
                        -> AST_AsmBinary_t {
                            p_node: *struc AsmBinary = @node[].get._AsmBinary
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmCmp_t {
                            p_node: *struc AsmCmp = @node[].get._AsmCmp
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmIdiv_t {
                            infer_add_data_op(ctx, node[].get._AsmIdiv.src)
                        }
                        break
                        -> AST_AsmDiv_t {
                            infer_add_data_op(ctx, node[].get._AsmDiv.src)
                        }
                        break
                        -> AST_AsmSetCC_t {
                            infer_add_data_op(ctx, node[].get._AsmSetCC.dst)
                        }
                        break
                        -> AST_AsmPush_t {
                            infer_add_data_op(ctx, node[].get._AsmPush.src)
                        }
                        break
                        -> AST_AsmCdq_t {
                            -> AST_AsmCall_t {
                                break
                            }
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
    if (? (ctx[].dfa_o2[].data_name_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o2[].data_name_map)) - 1)[].length else 0) < ctx[].dfa[].set_size {
        loop .. while 0 {
            (? (? (ctx[].dfa_o2[].data_name_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o2[].data_name_map)) - 1)[].capacity else 0) < cast<u64>((ctx[].dfa[].set_size)) then ((((ctx[].dfa_o2[].data_name_map)) = stbds_arrgrowf(((ctx[].dfa_o2[].data_name_map)), sizeof(((ctx[].dfa_o2[].data_name_map))[]), (0), (cast<u64>((ctx[].dfa[].set_size)))))) and 0 else 0)
            ? (ctx[].dfa_o2[].data_name_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o2[].data_name_map)) - 1)[].length = cast<u64>((ctx[].dfa[].set_size)) else 0
        }
    }
    ctx[].dfa[].set_size += REGISTER_MASK_SIZE
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
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
        memset(ctx[].dfa[].instrs_mask_sets, 0ul, sizeof<u64> * instrs_mask_sets_size)
    }
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
    {
        fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((fun_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (0)] = fun_type[].ret_reg_mask
    }
    loop i = 1 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        name_id: *struc PairTIdentifierulong_t = @ctx[].cfg[].identifier_id_map[i]
        ctx[].dfa_o2[].data_name_map[(name_id[]).value - REGISTER_MASK_SIZE] = (name_id[]).key
    }
    memset(ctx[].dfa[].blocks_mask_sets, 0ul, sizeof<u64> * blocks_mask_sets_size)
    return true
}

fn is_bitshift_cl(node: *struc AsmBinary) i32 {
    match node[].binop.tag {
        -> AST_AsmBitShiftLeft_t {
            -> AST_AsmBitShiftRight_t {
                -> AST_AsmBitShrArithmetic_t {
                    return node[].src[].tag ~= AST_AsmImm_t
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn find_identifier(xs: *u64, x: u64) i32 {
    loop i: u64 = 0 while i < (? (xs) then (cast<*struc stbds_array_header>((xs)) - 1)[].length else 0) .. ++i {
        if xs[i] == x {
            return true
        }
    }
    return false
}

fn infer_transfer_used_reg(ctx: *struc RegAllocContext, reg_kind: i32, next_instr_idx: u64) none {
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? register_mask_bit(reg_kind) > 63 then register_mask_bit(reg_kind) / 64 else 0)], register_mask_bit(reg_kind), true)
}

fn infer_transfer_used_name(ctx: *struc RegAllocContext, name: u64, next_instr_idx: u64) none {
    if not is_aliased_name(ctx, name) {
        i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
    }
}

fn infer_transfer_used_op(ctx: *struc RegAllocContext, node: *struc AsmOperand, next_instr_idx: u64) none {
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmPseudo_t {
            infer_transfer_used_name(ctx, node[].get._AsmPseudo.name, next_instr_idx)
        }
        break
        -> AST_AsmMemory_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmMemory.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmIndexed_t {
            p_node: *struc AsmIndexed = @node[].get._AsmIndexed
            {
                reg_kind: i32 = register_mask_kind(@p_node[].reg_base)
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }

            {
                reg_kind: i32 = register_mask_kind(@p_node[].reg_index)
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        otherwise {
            break
        }
    }
}

fn infer_transfer_used_call(ctx: *struc RegAllocContext, node: *struc AsmCall, next_instr_idx: u64) none {
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (0)] |= fun_type[].param_reg_mask
}

fn infer_transfer_updated_reg(ctx: *struc RegAllocContext, reg_kind: i32, next_instr_idx: u64) none {
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? register_mask_bit(reg_kind) > 63 then register_mask_bit(reg_kind) / 64 else 0)], register_mask_bit(reg_kind), false)
}

fn infer_transfer_updated_name(ctx: *struc RegAllocContext, name: u64, next_instr_idx: u64) none {
    if not is_aliased_name(ctx, name) {
        i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
    }
}

fn infer_transfer_updated_op(ctx: *struc RegAllocContext, node: *struc AsmOperand, next_instr_idx: u64) none {
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_updated_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmPseudo_t {
            infer_transfer_updated_name(ctx, node[].get._AsmPseudo.name, next_instr_idx)
        }
        break
        -> AST_AsmMemory_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmMemory.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmIndexed_t {
            panic_sigabrt("abort")
        }
        otherwise {
            break
        }
    }
}

fn infer_transfer_live_regs(ctx: *struc RegAllocContext, instr_idx: u64, next_instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            p_node: *struc AsmMov = @node[].get._AsmMov
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmMovSx_t {
            p_node: *struc AsmMovSx = @node[].get._AsmMovSx
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmMovZeroExtend_t {
            p_node: *struc AsmMovZeroExtend = @node[].get._AsmMovZeroExtend
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmLea_t {
            p_node: *struc AsmLea = @node[].get._AsmLea
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmCvttsd2si_t {
            p_node: *struc AsmCvttsd2si = @node[].get._AsmCvttsd2si
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmCvtsi2sd_t {
            p_node: *struc AsmCvtsi2sd = @node[].get._AsmCvtsi2sd
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmUnary_t {
            infer_transfer_used_op(ctx, node[].get._AsmUnary.dst, next_instr_idx)
        }
        break
        -> AST_AsmBinary_t {
            p_node: *struc AsmBinary = @node[].get._AsmBinary
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].dst, next_instr_idx)
            if is_bitshift_cl(p_node) {
                infer_transfer_used_reg(ctx, REG_Cx, next_instr_idx)
            }
            break
        }
        -> AST_AsmCmp_t {
            p_node: *struc AsmCmp = @node[].get._AsmCmp
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].dst, next_instr_idx)
            break
        }
        -> AST_AsmIdiv_t {
            infer_transfer_used_op(ctx, node[].get._AsmIdiv.src, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, REG_Ax, next_instr_idx)
        infer_transfer_used_reg(ctx, REG_Dx, next_instr_idx)
        break
        -> AST_AsmDiv_t {
            infer_transfer_used_op(ctx, node[].get._AsmDiv.src, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, REG_Ax, next_instr_idx)
        break
        -> AST_AsmCdq_t {
            infer_transfer_updated_reg(ctx, REG_Dx, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, REG_Ax, next_instr_idx)
        break
        -> AST_AsmSetCC_t {
            infer_transfer_updated_op(ctx, node[].get._AsmSetCC.dst, next_instr_idx)
        }
        break
        -> AST_AsmPush_t {
            infer_transfer_used_op(ctx, node[].get._AsmPush.src, next_instr_idx)
        }
        break
        -> AST_AsmCall_t {
            infer_transfer_updated_reg(ctx, REG_Ax, next_instr_idx)
        }
        infer_transfer_updated_reg(ctx, REG_Cx, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Dx, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Di, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Si, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_R8, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_R9, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm0, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm1, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm2, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm3, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm4, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm5, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm6, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm7, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm8, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm9, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm10, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm11, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm12, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm13, next_instr_idx)
        infer_transfer_used_call(ctx, @node[].get._AsmCall, next_instr_idx)
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn set_p_infer_graph(ctx: *struc RegAllocContext, is_dbl: i32) none {
    ctx[].p_infer_graph = ? is_dbl then ctx[].sse_infer_graph else ctx[].infer_graph
}

fn infer_add_pseudo_edges(ctx: *struc RegAllocContext, name_1: u64, name_2: u64) none {
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name_1))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not find_identifier(infer[].linked_pseudo_names, name_2) {
            loop .. while 0 {
                (? (not (infer[].linked_pseudo_names) or (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].capacity) then (((infer[].linked_pseudo_names) = stbds_arrgrowf((infer[].linked_pseudo_names), sizeof((infer[].linked_pseudo_names)[]), (1), (0))) and 0) else 0)
                (infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length++] = (name_2)
            }
            infer[].degree++
        }
    }
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name_2))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not find_identifier(infer[].linked_pseudo_names, name_1) {
            loop .. while 0 {
                (? (not (infer[].linked_pseudo_names) or (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].capacity) then (((infer[].linked_pseudo_names) = stbds_arrgrowf((infer[].linked_pseudo_names), sizeof((infer[].linked_pseudo_names)[]), (1), (0))) and 0) else 0)
                (infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length++] = (name_1)
            }
            infer[].degree++
        }
    }
}

fn infer_add_reg_edge(ctx: *struc RegAllocContext, reg_kind: i32, name: u64) none {
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not register_mask_get(infer[].linked_hard_mask, reg_kind) {
            register_mask_set(@infer[].linked_hard_mask, reg_kind, true)
            infer[].degree++
        }
    }
    {
        infer: *struc InferenceRegister = @ctx[].hard_regs[register_mask_bit(reg_kind)]
        if not find_identifier(infer[].linked_pseudo_names, name) {
            loop .. while 0 {
                (? (not (infer[].linked_pseudo_names) or (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].capacity) then (((infer[].linked_pseudo_names) = stbds_arrgrowf((infer[].linked_pseudo_names), sizeof((infer[].linked_pseudo_names)[]), (1), (0))) and 0) else 0)
                (infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length++] = (name)
            }
            infer[].degree++
        }
    }
}

fn infer_rm_pseudo_edge(infer: *struc InferenceRegister, name: u64) none {
    loop i: u64 = (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) while i-- > 0 {
        if infer[].linked_pseudo_names[i] == name {
            loop .. while 0 {
                (infer[].linked_pseudo_names)[i] = ((infer[].linked_pseudo_names)[(cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length - 1])
                (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length -= 1
            }
            infer[].degree--
            return none
        }
    }
    panic_sigabrt("abort")
}

fn infer_rm_unpruned_pseudo_name(ctx: *struc RegAllocContext, name: u64) none {
    loop i: u64 = (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) while i-- > 0 {
        if ctx[].p_infer_graph[].unpruned_pseudo_names[i] == name {
            loop .. while 0 {
                (ctx[].p_infer_graph[].unpruned_pseudo_names)[i] = ((ctx[].p_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length - 1])
                (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length -= 1
            }
            return none
        }
    }
    panic_sigabrt("abort")
}

fn infer_init_used_name_edges(ctx: *struc RegAllocContext, name: u64) none {
    if not is_aliased_name(ctx, name) {
        set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
    }
}

fn infer_init_used_op_edges(ctx: *struc RegAllocContext, node: *struc AsmOperand) none {
    if node[].tag == AST_AsmPseudo_t {
        infer_init_used_name_edges(ctx, node[].get._AsmPseudo.name)
    }
}

fn infer_init_updated_regs_edges(ctx: *struc RegAllocContext, reg_kinds: *i32, instr_idx: u64, reg_kinds_size: u64, is_dbl: i32) none {
    mov_mask_bit: u64 = ctx[].dfa[].set_size
    is_mov: i32 = (ctx[].p_instrs[])[instr_idx][].tag == AST_AsmMov_t
    if is_mov {
        mov: *struc AsmMov = @(ctx[].p_instrs[])[instr_idx][].get._AsmMov
        if mov[].src[].tag == AST_AsmPseudo_t {
            src_name: u64 = mov[].src[].get._AsmPseudo.name
            if is_aliased_name(ctx, src_name) {
                is_mov = false
            }
            else {
                is_src_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
                set_p_infer_graph(ctx, is_src_dbl)
                ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
                mov_mask_bit = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
                is_mov = is_dbl == is_src_dbl
            }
        }
        else {
            is_mov = false
        }
    }
    set_p_infer_graph(ctx, is_dbl)
    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (0)] ~= 0ul {
        loop i: u64 = ? ctx[].dfa[].set_size < 64 then ctx[].dfa[].set_size else 64 while i-- > REGISTER_MASK_SIZE {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    loop j: u64 = 0 while j < reg_kinds_size .. ++j {
                        infer_add_reg_edge(ctx, reg_kinds[j], pseudo_name)
                    }
                }
            }
        }
    }
    i: u64 = 64
    loop j: u64 = 1 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    loop k: u64 = 0 while k < reg_kinds_size .. ++k {
                        infer_add_reg_edge(ctx, reg_kinds[k], pseudo_name)
                    }
                }
            }
        }
    }
}

fn infer_init_updated_name_edges(ctx: *struc RegAllocContext, name: u64, instr_idx: u64) none {
    if is_aliased_name(ctx, name) {
        return none
    }
    is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
    mov_mask_bit: u64 = ctx[].dfa[].set_size
    is_mov: i32 = (ctx[].p_instrs[])[instr_idx][].tag == AST_AsmMov_t
    if is_mov {
        mov: *struc AsmMov = @(ctx[].p_instrs[])[instr_idx][].get._AsmMov
        match mov[].src[].tag {
            -> AST_AsmRegister_t {
                src_reg_kind: i32 = register_mask_kind(@mov[].src[].get._AsmRegister.reg)
                if src_reg_kind == REG_Sp {
                    is_mov = false
                }
                else {
                    mov_mask_bit = register_mask_bit(src_reg_kind)
                    is_mov = is_dbl == (mov_mask_bit > 11)
                }
                break
            }
            -> AST_AsmPseudo_t {
                src_name: u64 = mov[].src[].get._AsmPseudo.name
                if is_aliased_name(ctx, src_name) {
                    is_mov = false
                }
                else {
                    is_src_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
                    set_p_infer_graph(ctx, is_src_dbl)
                    ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
                    mov_mask_bit = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
                    is_mov = is_dbl == is_src_dbl
                }
                break
            }
            -> AST_AsmMemory_t {
                src_reg_kind: i32 = register_mask_kind(@mov[].src[].get._AsmMemory.reg)
                if src_reg_kind == REG_Sp {
                    is_mov = false
                }
                else {
                    mov_mask_bit = register_mask_bit(src_reg_kind)
                    is_mov = is_dbl == (mov_mask_bit > 11)
                }
                break
            }
            -> AST_AsmIndexed_t {
                panic_sigabrt("abort")
            }
            otherwise {
                is_mov = false
                break
            }
        }
    }
    set_p_infer_graph(ctx, is_dbl)
    ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (0)] ~= 0ul {
        i: u64 = ctx[].p_infer_graph[].offset
        mask_set_size: u64 = i + ctx[].p_infer_graph[].k
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                reg_kind: i32 = ctx[].hard_regs[i].reg_kind
                infer_add_reg_edge(ctx, reg_kind, name)
            }
        }
        i = REGISTER_MASK_SIZE
        mask_set_size = ? ctx[].dfa[].set_size < 64 then ctx[].dfa[].set_size else 64
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if name ~= pseudo_name and is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    infer_add_pseudo_edges(ctx, name, pseudo_name)
                }
            }
        }
    }
    i: u64 = 64
    loop j: u64 = 1 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if name ~= pseudo_name and is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    infer_add_pseudo_edges(ctx, name, pseudo_name)
                }
            }
        }
    }
}

fn infer_init_updated_op_edges(ctx: *struc RegAllocContext, node: *struc AsmOperand, instr_idx: u64) none {
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kinds: [1]i32 = $(register_mask_kind(@node[].get._AsmRegister.reg))
            if reg_kinds[0] ~= REG_Sp {
                is_dbl: i32 = register_mask_bit(reg_kinds[0]) > 11
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, is_dbl)
            }
            break
        }
        -> AST_AsmPseudo_t {
            infer_init_updated_name_edges(ctx, node[].get._AsmPseudo.name, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn infer_init_edges(ctx: *struc RegAllocContext, instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmMov.dst, instr_idx)
        }
        break
        -> AST_AsmMovSx_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmMovSx.dst, instr_idx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmMovZeroExtend.dst, instr_idx)
        }
        break
        -> AST_AsmLea_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmLea.dst, instr_idx)
        }
        break
        -> AST_AsmCvttsd2si_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmCvttsd2si.dst, instr_idx)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmCvtsi2sd.dst, instr_idx)
        }
        break
        -> AST_AsmUnary_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmUnary.dst, instr_idx)
        }
        break
        -> AST_AsmBinary_t {
            p_node: *struc AsmBinary = @node[].get._AsmBinary
            if is_bitshift_cl(p_node) {
                reg_kinds: [1]i32 = $(REG_Cx)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, false)
            }
            infer_init_updated_op_edges(ctx, p_node[].dst, instr_idx)
            infer_init_used_op_edges(ctx, p_node[].src)
            break
        }
        -> AST_AsmCmp_t {
            p_node: *struc AsmCmp = @node[].get._AsmCmp
            infer_init_used_op_edges(ctx, p_node[].src)
            infer_init_used_op_edges(ctx, p_node[].dst)
            break
        }
        -> AST_AsmIdiv_t {
            reg_kinds: [2]i32 = $(REG_Ax, REG_Dx)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 2, false)
            infer_init_used_op_edges(ctx, node[].get._AsmIdiv.src)
            break
        }
        -> AST_AsmDiv_t {
            reg_kinds: [1]i32 = $(REG_Ax)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, false)
            infer_init_used_op_edges(ctx, node[].get._AsmDiv.src)
            break
        }
        -> AST_AsmCdq_t {
            reg_kinds: [1]i32 = $(REG_Dx)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, false)
            break
        }
        -> AST_AsmSetCC_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmSetCC.dst, instr_idx)
        }
        break
        -> AST_AsmPush_t {
            infer_init_used_op_edges(ctx, node[].get._AsmPush.src)
        }
        break
        -> AST_AsmCall_t {
            {
                reg_kinds: [7]i32 = $(REG_Ax, REG_Cx, REG_Dx, REG_Di, REG_Si, REG_R8, REG_R9)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 7, false)
            }
            {
                reg_kinds: [14]i32 = $(REG_Xmm0, REG_Xmm1, REG_Xmm2, REG_Xmm3, REG_Xmm4, REG_Xmm5, REG_Xmm6, REG_Xmm7, REG_Xmm8, REG_Xmm9, REG_Xmm10, REG_Xmm11, REG_Xmm12, REG_Xmm13)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 14, true)
            }
            break
        }
        otherwise {
            break
        }
    }
}

fn init_inference_graph(ctx: *struc RegAllocContext, fun_name: u64) i32 {
    if not init_data_flow_analysis(ctx, fun_name) {
        return false
    }
    dfa_iter_alg(ctx)
    if ((? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        return false
    }
    ctx[].callee_saved_reg_mask = 0ul
    if ctx[].infer_graph[].unpruned_pseudo_names {
        (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx[].infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? ((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) then free((cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names)) - 1)) else cast<none>(0)))
                ((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) = nil
            }
            (ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names = nil
        }
        ;
    }
    if ctx[].infer_graph[].pseudo_reg_map {
        loop .. while 0 {
            cast<none>((? (ctx[].infer_graph[].pseudo_reg_map) ~= nil then stbds_hmfree_func((ctx[].infer_graph[].pseudo_reg_map) - 1, sizeof((ctx[].infer_graph[].pseudo_reg_map)[])) else cast<none>(0)))
            (ctx[].infer_graph[].pseudo_reg_map) = nil
        }
        ctx[].infer_graph[].pseudo_reg_map = nil
    }
    ;
    if ctx[].sse_infer_graph[].unpruned_pseudo_names {
        (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length = 0
    }
    ;
    loop i: u64 = 0 while i < (? (ctx[].sse_infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? ((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) then free((cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names)) - 1)) else cast<none>(0)))
                ((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) = nil
            }
            (ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names = nil
        }
        ;
    }
    if ctx[].sse_infer_graph[].pseudo_reg_map {
        loop .. while 0 {
            cast<none>((? (ctx[].sse_infer_graph[].pseudo_reg_map) ~= nil then stbds_hmfree_func((ctx[].sse_infer_graph[].pseudo_reg_map) - 1, sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[])) else cast<none>(0)))
            (ctx[].sse_infer_graph[].pseudo_reg_map) = nil
        }
        ctx[].sse_infer_graph[].pseudo_reg_map = nil
    }
    ;
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        name: u64 = (ctx[].cfg[].identifier_id_map[i]).key
        infer: struc InferenceRegister = $(REG_Sp, REG_Sp, 0, 0, 0ul, nil)
        if ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t {
            loop .. while 0 {
                (? (not (ctx[].sse_infer_graph[].unpruned_pseudo_names) or (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].capacity) then (((ctx[].sse_infer_graph[].unpruned_pseudo_names) = stbds_arrgrowf((ctx[].sse_infer_graph[].unpruned_pseudo_names), sizeof((ctx[].sse_infer_graph[].unpruned_pseudo_names)[]), (1), (0))) and 0) else 0)
                (ctx[].sse_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length++] = (name)
            }
            loop .. while 0 {
                (ctx[].sse_infer_graph[].pseudo_reg_map) = stbds_hmput_key((ctx[].sse_infer_graph[].pseudo_reg_map), sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[].key), 0)
                (ctx[].sse_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].sse_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].value = (infer)
            }
        }
        else {
            loop .. while 0 {
                (? (not (ctx[].infer_graph[].unpruned_pseudo_names) or (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].capacity) then (((ctx[].infer_graph[].unpruned_pseudo_names) = stbds_arrgrowf((ctx[].infer_graph[].unpruned_pseudo_names), sizeof((ctx[].infer_graph[].unpruned_pseudo_names)[]), (1), (0))) and 0) else 0)
                (ctx[].infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length++] = (name)
            }
            loop .. while 0 {
                (ctx[].infer_graph[].pseudo_reg_map) = stbds_hmput_key((ctx[].infer_graph[].pseudo_reg_map), sizeof((ctx[].infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].infer_graph[].pseudo_reg_map)[].key), 0)
                (ctx[].infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].value = (infer)
            }
        }
    }
    if not ((? (ctx[].infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        if (? (ctx[].infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) < 12 {
            loop .. while 0 {
                (? (? (ctx[].infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_hard_mask_bits)) - 1)[].capacity else 0) < cast<u64>((12)) then ((((ctx[].infer_graph[].unpruned_hard_mask_bits)) = stbds_arrgrowf(((ctx[].infer_graph[].unpruned_hard_mask_bits)), sizeof(((ctx[].infer_graph[].unpruned_hard_mask_bits))[]), (0), (cast<u64>((12)))))) and 0 else 0)
                ? (ctx[].infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_hard_mask_bits)) - 1)[].length = cast<u64>((12)) else 0
            }
        }
        hard_reg_mask: u64 = ctx[].infer_graph[].hard_reg_mask
        loop i: u64 = 0 while i < 12 .. ++i {
            ctx[].reg_color_map[i] = REG_Sp
            ctx[].hard_regs[i].color = REG_Sp
            ctx[].hard_regs[i].degree = 11
            ctx[].hard_regs[i].spill_cost = 0
            ctx[].hard_regs[i].linked_hard_mask = hard_reg_mask
            if ctx[].hard_regs[i].linked_pseudo_names {
                (cast<*struc stbds_array_header>((ctx[].hard_regs[i].linked_pseudo_names)) - 1)[].length = 0
            }
            ;
            ctx[].infer_graph[].unpruned_hard_mask_bits[i] = i
        }
    }
    if not ((? (ctx[].sse_infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        if (? (ctx[].sse_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) < 14 {
            loop .. while 0 {
                (? (? (ctx[].sse_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) - 1)[].capacity else 0) < cast<u64>((14)) then ((((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) = stbds_arrgrowf(((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)), sizeof(((ctx[].sse_infer_graph[].unpruned_hard_mask_bits))[]), (0), (cast<u64>((14)))))) and 0 else 0)
                ? (ctx[].sse_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length = cast<u64>((14)) else 0
            }
        }
        hard_reg_mask: u64 = ctx[].sse_infer_graph[].hard_reg_mask
        loop i: u64 = 12 while i < 26 .. ++i {
            ctx[].reg_color_map[i] = REG_Sp
            ctx[].hard_regs[i].color = REG_Sp
            ctx[].hard_regs[i].degree = 13
            ctx[].hard_regs[i].spill_cost = 0
            ctx[].hard_regs[i].linked_hard_mask = hard_reg_mask
            if ctx[].hard_regs[i].linked_pseudo_names {
                (cast<*struc stbds_array_header>((ctx[].hard_regs[i].linked_pseudo_names)) - 1)[].length = 0
            }
            ;
            ctx[].sse_infer_graph[].unpruned_hard_mask_bits[i - 12] = i
        }
    }
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    infer_init_edges(ctx, instr_idx)
                }
            }
        }
    }
    return true
}

fn is_reg_callee_saved(reg_kind: i32) i32 {
    match reg_kind {
        -> REG_Bx {
            -> REG_R12 {
                -> REG_R13 {
                    -> REG_R14 {
                        -> REG_R15 {
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

fn alloc_prune_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_idx: u64) none {
    if infer[].reg_kind == REG_Sp {
        loop .. while 0 {
            (ctx[].p_infer_graph[].unpruned_pseudo_names)[pruned_idx] = ((ctx[].p_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length - 1])
            (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length -= 1
        }
    }
    else {
        loop .. while 0 {
            (ctx[].p_infer_graph[].unpruned_hard_mask_bits)[pruned_idx] = ((ctx[].p_infer_graph[].unpruned_hard_mask_bits)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length - 1])
            (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length -= 1
        }
    }
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                linked_infer[].degree--
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).degree--
    }
}

fn alloc_unprune_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_name: u64) none {
    if infer[].reg_kind == REG_Sp {
        ;
        loop .. while 0 {
            (? (not (ctx[].p_infer_graph[].unpruned_pseudo_names) or (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].capacity) then (((ctx[].p_infer_graph[].unpruned_pseudo_names) = stbds_arrgrowf((ctx[].p_infer_graph[].unpruned_pseudo_names), sizeof((ctx[].p_infer_graph[].unpruned_pseudo_names)[]), (1), (0))) and 0) else 0)
            (ctx[].p_infer_graph[].unpruned_pseudo_names)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length++] = (pruned_name)
        }
    }
    else {
        pruned_mask_bit: u64 = register_mask_bit(infer[].reg_kind)
        ;
        loop .. while 0 {
            (? (not (ctx[].p_infer_graph[].unpruned_hard_mask_bits) or (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].capacity) then (((ctx[].p_infer_graph[].unpruned_hard_mask_bits) = stbds_arrgrowf((ctx[].p_infer_graph[].unpruned_hard_mask_bits), sizeof((ctx[].p_infer_graph[].unpruned_hard_mask_bits)[]), (1), (0))) and 0) else 0)
            (ctx[].p_infer_graph[].unpruned_hard_mask_bits)[(cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length++] = (pruned_mask_bit)
        }
    }
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                linked_infer[].degree++
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).degree++
    }
}

fn alloc_color_infer_graph(ctx: *struc RegAllocContext) none;

fn alloc_next_color_infer_graph(ctx: *struc RegAllocContext) none {
    if not ((? (ctx[].p_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) == 0) or not ((? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
        alloc_color_infer_graph(ctx)
    }
}

fn alloc_prune_infer_graph(ctx: *struc RegAllocContext, pruned_name: *u64) *struc InferenceRegister {
    pruned_idx: u64;
    infer: *struc InferenceRegister = nil
    loop i: u64 = 0 while i < (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) .. ++i {
        pruned_name[] = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
        infer = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((pruned_name[]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if infer[].degree < ctx[].p_infer_graph[].k {
            pruned_idx = i
            break
        }
        infer = nil
    }
    if not infer {
        loop i: u64 = 0 while i < (? (ctx[].p_infer_graph[].unpruned_hard_mask_bits) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_hard_mask_bits)) - 1)[].length else 0) .. ++i {
            pruned_mask_bit: u64 = ctx[].p_infer_graph[].unpruned_hard_mask_bits[i]
            infer = @ctx[].hard_regs[pruned_mask_bit]
            if infer[].degree < ctx[].p_infer_graph[].k {
                pruned_idx = i
                break
            }
            infer = nil
        }
    }
    if not infer {
        i: u64 = 0
        loop  while i < (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) .. ++i {
            pruned_name[] = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
            infer = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((pruned_name[]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if infer[].degree > 0 {
                pruned_idx = i
                break
            }
            infer = nil
        }
        ;
        min_spill_metric: f64 = (cast<f64>(infer[].spill_cost)) / infer[].degree
        loop  while i < (? (ctx[].p_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].p_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) .. ++i {
            spill_name: u64 = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
            spill_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((spill_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if spill_infer[].degree > 0 {
                spill_metric: f64 = (cast<f64>(spill_infer[].spill_cost)) / spill_infer[].degree
                if spill_metric < min_spill_metric {
                    pruned_idx = i
                    pruned_name[] = spill_name
                    infer = spill_infer
                    min_spill_metric = spill_metric
                }
            }
        }
    }
    alloc_prune_infer_reg(ctx, infer, pruned_idx)
    return infer
}

fn alloc_unprune_infer_graph(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_name: u64) none {
    color_reg_mask: u64 = ctx[].p_infer_graph[].hard_reg_mask
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                if linked_infer[].color ~= REG_Sp {
                    register_mask_set(@color_reg_mask, linked_infer[].color, false)
                }
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if linked_infer[].color ~= REG_Sp {
            register_mask_set(@color_reg_mask, linked_infer[].color, false)
        }
    }
    if color_reg_mask ~= 0ul {
        if is_reg_callee_saved(infer[].reg_kind) {
            loop i: u64 = ctx[].p_infer_graph[].k while i-- > 0 {
                color: i32 = ctx[].hard_regs[i + ctx[].p_infer_graph[].offset].reg_kind
                if register_mask_get(color_reg_mask, color) {
                    infer[].color = color
                    break
                }
            }
        }
        else {
            loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
                color: i32 = ctx[].hard_regs[i + ctx[].p_infer_graph[].offset].reg_kind
                if register_mask_get(color_reg_mask, color) {
                    infer[].color = color
                    break
                }
            }
        }
        alloc_unprune_infer_reg(ctx, infer, pruned_name)
    }
}

fn alloc_color_infer_graph(ctx: *struc RegAllocContext) none {
    pruned_name: u64 = 0
    infer: *struc InferenceRegister = alloc_prune_infer_graph(ctx, @pruned_name)
    alloc_next_color_infer_graph(ctx)
    alloc_unprune_infer_graph(ctx, infer, pruned_name)
}

fn alloc_color_reg_map(ctx: *struc RegAllocContext) none {
    loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
        infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
        if infer[].color ~= REG_Sp {
            ctx[].reg_color_map[register_mask_bit(infer[].color)] = infer[].reg_kind
        }
    }
}

fn alloc_hard_reg(ctx: *struc RegAllocContext, name: u64) *struc AsmOperand {
    if is_aliased_name(ctx, name) {
        return nil
    }
    set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
    color: i32 = ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).color
    if color ~= REG_Sp {
        reg_kind: i32 = ctx[].reg_color_map[register_mask_bit(color)]
        hard_reg: *struc AsmOperand = gen_register(reg_kind)
        if is_reg_callee_saved(reg_kind) and not register_mask_get(ctx[].callee_saved_reg_mask, reg_kind) {
            register_mask_set(@ctx[].callee_saved_reg_mask, reg_kind, true)
            callee_saved_reg: *struc AsmOperand = nil
            if hard_reg ~= callee_saved_reg {
                "@MACRO@:sptr_copy(AsmOperand, hard_reg, callee_saved_reg)"
                free_AsmOperand(@callee_saved_reg)
                callee_saved_reg = hard_reg
                (callee_saved_reg)[]._ref_count++
            }
            ;
            loop .. while 0 {
                loop .. while 0 {
                    (? (not (ctx[].p_backend_fun[].callee_saved_regs) or (cast<*struc stbds_array_header>((ctx[].p_backend_fun[].callee_saved_regs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].p_backend_fun[].callee_saved_regs)) - 1)[].capacity) then (((ctx[].p_backend_fun[].callee_saved_regs) = stbds_arrgrowf((ctx[].p_backend_fun[].callee_saved_regs), sizeof((ctx[].p_backend_fun[].callee_saved_regs)[]), (1), (0))) and 0) else 0)
                    (ctx[].p_backend_fun[].callee_saved_regs)[(cast<*struc stbds_array_header>((ctx[].p_backend_fun[].callee_saved_regs)) - 1)[].length++] = (callee_saved_reg)
                }
                callee_saved_reg = nil
            }
        }
        return hard_reg
    }
    else {
        return nil
    }
}

fn get_op_reg_kind(ctx: *struc RegAllocContext, node: *struc AsmOperand) i32 {
    match node[].tag {
        -> AST_AsmRegister_t {
            return register_mask_kind(@node[].get._AsmRegister.reg)
        }
        -> AST_AsmPseudo_t {
            name: u64 = node[].get._AsmPseudo.name
            if is_aliased_name(ctx, name) {
                return REG_Sp
            }
            set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
            color: i32 = ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).color
            if color == REG_Sp {
                return REG_Sp
            }
            else {
                return ctx[].reg_color_map[register_mask_bit(color)]
            }
        }
        -> AST_AsmMemory_t {
            return REG_Sp
        }
        -> AST_AsmIndexed_t {
            panic_sigabrt("abort")
        }
        otherwise {
            return REG_Sp
        }
    }
}

fn alloc_mov_instr(ctx: *struc RegAllocContext, node: *struc AsmMov, instr_idx: u64) none {
    src_reg_kind: i32 = get_op_reg_kind(ctx, node[].src)
    dst_reg_kind: i32 = get_op_reg_kind(ctx, node[].dst)
    if src_reg_kind ~= REG_Sp and src_reg_kind == dst_reg_kind {
        set_instr(ctx, nil, instr_idx)
    }
    else {
        if node[].src[].tag == AST_AsmPseudo_t {
            hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
            if hard_reg {
                loop .. while 0 {
                    "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                    if hard_reg ~= node[].src {
                        "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                        free_AsmOperand(@node[].src)
                        node[].src = hard_reg
                        hard_reg = nil
                    }
                }
            }
        }
        if node[].dst[].tag == AST_AsmPseudo_t {
            hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
            if hard_reg {
                loop .. while 0 {
                    "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                    if hard_reg ~= node[].dst {
                        "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                        free_AsmOperand(@node[].dst)
                        node[].dst = hard_reg
                        hard_reg = nil
                    }
                }
            }
        }
    }
}

fn alloc_mov_sx_instr(ctx: *struc RegAllocContext, node: *struc AsmMovSx) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_zero_extend_instr(ctx: *struc RegAllocContext, node: *struc AsmMovZeroExtend) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_lea_instr(ctx: *struc RegAllocContext, node: *struc AsmLea) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_cvttsd2si_instr(ctx: *struc RegAllocContext, node: *struc AsmCvttsd2si) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_cvtsi2sd_instr(ctx: *struc RegAllocContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_unary_instr(ctx: *struc RegAllocContext, node: *struc AsmUnary) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_binary_instr(ctx: *struc RegAllocContext, node: *struc AsmBinary) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_cmp_instr(ctx: *struc RegAllocContext, node: *struc AsmCmp) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_idiv_instr(ctx: *struc RegAllocContext, node: *struc AsmIdiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_div_instr(ctx: *struc RegAllocContext, node: *struc AsmDiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_set_cc_instr(ctx: *struc RegAllocContext, node: *struc AsmSetCC) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_push_instr(ctx: *struc RegAllocContext, node: *struc AsmPush) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = nil
                }
            }
        }
    }
}

fn alloc_instr(ctx: *struc RegAllocContext, instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            alloc_mov_instr(ctx, @node[].get._AsmMov, instr_idx)
        }
        break
        -> AST_AsmMovSx_t {
            alloc_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            alloc_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            alloc_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            alloc_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            alloc_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            alloc_unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            alloc_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            alloc_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            alloc_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            alloc_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmSetCC_t {
            alloc_set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmPush_t {
            alloc_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> AST_AsmCdq_t {
            -> AST_AsmCall_t {
                break
            }
        }
        otherwise {
            break
        }
    }
}

fn reallocate_registers(ctx: *struc RegAllocContext) none {
    if not ((? (ctx[].infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
        set_p_infer_graph(ctx, false)
        alloc_color_infer_graph(ctx)
        alloc_color_reg_map(ctx)
    }
    if not ((? (ctx[].sse_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
        set_p_infer_graph(ctx, true)
        alloc_color_infer_graph(ctx)
        alloc_color_reg_map(ctx)
    }
    loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            alloc_instr(ctx, instr_idx)
        }
    }
}

fn get_type_size(type_t: *struc Type) i32 {
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

fn get_coalesced_idx(ctx: *struc RegAllocContext, node: *struc AsmOperand) u64 {
    coalesced_idx: u64 = ctx[].dfa[].set_size
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= REG_Sp {
                coalesced_idx = register_mask_bit(reg_kind)
            }
            break
        }
        -> AST_AsmPseudo_t {
            name: u64 = node[].get._AsmPseudo.name
            if not is_aliased_name(ctx, name) {
                coalesced_idx = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
            }
            break
        }
        otherwise {
            break
        }
    }
    if coalesced_idx < ctx[].dfa[].set_size {
        loop while coalesced_idx >= REGISTER_MASK_SIZE and coalesced_idx ~= ctx[].dfa[].open_data_map[coalesced_idx - REGISTER_MASK_SIZE] {
            coalesced_idx = ctx[].dfa[].open_data_map[coalesced_idx - REGISTER_MASK_SIZE]
        }
    }
    return coalesced_idx
}

fn get_coalescable_infer_regs(ctx: *struc RegAllocContext, src_infer: **struc InferenceRegister, dst_infer: **struc InferenceRegister, src_idx: u64, dst_idx: u64) i32 {
    if src_idx ~= dst_idx and (src_idx >= REGISTER_MASK_SIZE or dst_idx >= REGISTER_MASK_SIZE) and src_idx < ctx[].dfa[].set_size and dst_idx < ctx[].dfa[].set_size {
        if src_idx < REGISTER_MASK_SIZE {
            dst_name: u64 = ctx[].dfa_o2[].data_name_map[dst_idx - REGISTER_MASK_SIZE]
            is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
            if is_dbl == (src_idx > 11) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @ctx[].hard_regs[src_idx]
                dst_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                return not register_mask_get((dst_infer[])[].linked_hard_mask, (src_infer[])[].reg_kind)
            }
        }
        elif dst_idx < REGISTER_MASK_SIZE {
            src_name: u64 = ctx[].dfa_o2[].data_name_map[src_idx - REGISTER_MASK_SIZE]
            is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
            if is_dbl == (dst_idx > 11) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                dst_infer[] = @ctx[].hard_regs[dst_idx]
                return not register_mask_get((src_infer[])[].linked_hard_mask, (dst_infer[])[].reg_kind)
            }
        }
        else {
            src_name: u64 = ctx[].dfa_o2[].data_name_map[src_idx - REGISTER_MASK_SIZE]
            dst_name: u64 = ctx[].dfa_o2[].data_name_map[dst_idx - REGISTER_MASK_SIZE]
            src_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
            dst_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
            is_dbl: i32 = src_type[].tag == AST_Double_t
            if is_dbl == (dst_type[].tag == AST_Double_t) and get_type_size(src_type) == get_type_size(dst_type) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                dst_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                return not find_identifier((dst_infer[])[].linked_pseudo_names, src_name)
            }
        }
    }
    return false
}

fn coal_briggs_test(ctx: *struc RegAllocContext, src_infer: *struc InferenceRegister, dst_infer: *struc InferenceRegister) i32 {
    degree: u64 = 0
    if src_infer[].linked_hard_mask ~= 0ul or dst_infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(src_infer[].linked_hard_mask, linked_infer[].reg_kind) {
                if register_mask_get(dst_infer[].linked_hard_mask, linked_infer[].reg_kind) {
                    if linked_infer[].degree > ctx[].p_infer_graph[].k {
                        degree++
                    }
                }
                elif linked_infer[].degree >= ctx[].p_infer_graph[].k {
                    degree++
                }
            }
            elif register_mask_get(dst_infer[].linked_hard_mask, linked_infer[].reg_kind) and linked_infer[].degree >= ctx[].p_infer_graph[].k {
                degree++
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < (? (dst_infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((dst_infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j, true)
    }
    loop i: u64 = 0 while i < (? (src_infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((src_infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_infer[].linked_pseudo_names[i]))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
            if linked_infer[].degree > ctx[].p_infer_graph[].k {
                degree++
            }
            mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j, false)
        }
        elif linked_infer[].degree >= ctx[].p_infer_graph[].k {
            degree++
        }
    }
    loop i: u64 = 0 while i < (? (dst_infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((dst_infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
            linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if linked_infer[].degree >= ctx[].p_infer_graph[].k {
                degree++
            }
        }
    }
    return degree < ctx[].p_infer_graph[].k
}

fn coal_george_test(ctx: *struc RegAllocContext, reg_kind: i32, infer: *struc InferenceRegister) i32 {
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not register_mask_get(linked_infer[].linked_hard_mask, reg_kind) and linked_infer[].degree >= ctx[].p_infer_graph[].k {
            return false
        }
    }
    return true
}

fn coal_conservative_tests(ctx: *struc RegAllocContext, src_infer: *struc InferenceRegister, dst_infer: *struc InferenceRegister) i32 {
    if coal_briggs_test(ctx, src_infer, dst_infer) {
        return true
    }
    elif src_infer[].reg_kind ~= REG_Sp {
        return coal_george_test(ctx, src_infer[].reg_kind, dst_infer)
    }
    elif dst_infer[].reg_kind ~= REG_Sp {
        return coal_george_test(ctx, dst_infer[].reg_kind, src_infer)
    }
    else {
        return false
    }
}

fn coal_pseudo_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, merge_idx: u64, keep_idx: u64) none {
    merge_name: u64 = ctx[].dfa_o2[].data_name_map[merge_idx - REGISTER_MASK_SIZE]
    keep_name: u64 = ctx[].dfa_o2[].data_name_map[keep_idx - REGISTER_MASK_SIZE]
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                infer_rm_pseudo_edge(linked_infer, merge_name)
                infer_add_reg_edge(ctx, linked_infer[].reg_kind, keep_name)
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        infer_rm_pseudo_edge(linked_infer, merge_name)
        infer_add_pseudo_edges(ctx, keep_name, infer[].linked_pseudo_names[i])
    }
    infer_rm_unpruned_pseudo_name(ctx, merge_name)
}

fn coal_hard_infer_reg(ctx: *struc RegAllocContext, reg_kind: i32, infer: *struc InferenceRegister, merge_idx: u64) none {
    merge_name: u64 = ctx[].dfa_o2[].data_name_map[merge_idx - REGISTER_MASK_SIZE]
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                infer_rm_pseudo_edge(linked_infer, merge_name)
            }
        }
    }
    loop i: u64 = 0 while i < (? (infer[].linked_pseudo_names) then (cast<*struc stbds_array_header>((infer[].linked_pseudo_names)) - 1)[].length else 0) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        infer_rm_pseudo_edge(linked_infer, merge_name)
        infer_add_reg_edge(ctx, reg_kind, infer[].linked_pseudo_names[i])
    }
    infer_rm_unpruned_pseudo_name(ctx, merge_name)
}

fn coal_infer_regs(ctx: *struc RegAllocContext, node: *struc AsmMov) i32 {
    src_infer: *struc InferenceRegister = nil
    dst_infer: *struc InferenceRegister = nil
    src_idx: u64 = get_coalesced_idx(ctx, node[].src)
    dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
    if get_coalescable_infer_regs(ctx, @src_infer, @dst_infer, src_idx, dst_idx) and coal_conservative_tests(ctx, src_infer, dst_infer) {
        if src_idx < REGISTER_MASK_SIZE {
            coal_hard_infer_reg(ctx, src_infer[].reg_kind, dst_infer, dst_idx)
            ctx[].dfa[].open_data_map[dst_idx - REGISTER_MASK_SIZE] = src_idx
        }
        else {
            if dst_idx < REGISTER_MASK_SIZE {
                coal_hard_infer_reg(ctx, dst_infer[].reg_kind, src_infer, src_idx)
            }
            else {
                coal_pseudo_infer_reg(ctx, src_infer, src_idx, dst_idx)
            }
            ctx[].dfa[].open_data_map[src_idx - REGISTER_MASK_SIZE] = dst_idx
        }
        return true
    }
    else {
        return false
    }
}

fn coal_op_reg(ctx: *struc RegAllocContext, name: u64, coalesced_idx: u64) *struc AsmOperand {
    if coalesced_idx < ctx[].dfa[].set_size and coalesced_idx ~= ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value) {
        if coalesced_idx < REGISTER_MASK_SIZE {
            reg_kind: i32 = ctx[].hard_regs[coalesced_idx].reg_kind
            return gen_register(reg_kind)
        }
        else {
            set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
            name = ctx[].dfa_o2[].data_name_map[coalesced_idx - REGISTER_MASK_SIZE]
            ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
            return make_AsmPseudo(name)
        }
    }
    else {
        return nil
    }
}

fn coal_mov_instr(ctx: *struc RegAllocContext, node: *struc AsmMov, instr_idx: u64, block_id: u64) none {
    src_idx: u64 = get_coalesced_idx(ctx, node[].src)
    dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
    if src_idx < ctx[].dfa[].set_size and src_idx == dst_idx {
        cfg_rm_block_instr(ctx, instr_idx, block_id)
    }
    else {
        if node[].src[].tag == AST_AsmPseudo_t {
            op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
            if op_reg {
                loop .. while 0 {
                    "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                    if op_reg ~= node[].src {
                        "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                        free_AsmOperand(@node[].src)
                        node[].src = op_reg
                        op_reg = nil
                    }
                }
            }
        }
        if node[].dst[].tag == AST_AsmPseudo_t {
            op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
            if op_reg {
                loop .. while 0 {
                    "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                    if op_reg ~= node[].dst {
                        "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                        free_AsmOperand(@node[].dst)
                        node[].dst = op_reg
                        op_reg = nil
                    }
                }
            }
        }
    }
}

fn coal_mov_sx_instr(ctx: *struc RegAllocContext, node: *struc AsmMovSx) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_zero_extend_instr(ctx: *struc RegAllocContext, node: *struc AsmMovZeroExtend) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_lea_instr(ctx: *struc RegAllocContext, node: *struc AsmLea) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_cvttsd2si_instr(ctx: *struc RegAllocContext, node: *struc AsmCvttsd2si) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_cvtsi2sd_instr(ctx: *struc RegAllocContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_unary_instr(ctx: *struc RegAllocContext, node: *struc AsmUnary) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_binary_instr(ctx: *struc RegAllocContext, node: *struc AsmBinary) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_cmp_instr(ctx: *struc RegAllocContext, node: *struc AsmCmp) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_idiv_instr(ctx: *struc RegAllocContext, node: *struc AsmIdiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_div_instr(ctx: *struc RegAllocContext, node: *struc AsmDiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_set_cc_instr(ctx: *struc RegAllocContext, node: *struc AsmSetCC) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_push_instr(ctx: *struc RegAllocContext, node: *struc AsmPush) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                "@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    "@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = nil
                }
            }
        }
    }
}

fn coal_instr(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            coal_mov_instr(ctx, @node[].get._AsmMov, instr_idx, block_id)
        }
        break
        -> AST_AsmMovSx_t {
            coal_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            coal_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            coal_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            coal_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            coal_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            coal_unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            coal_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            coal_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            coal_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            coal_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmSetCC_t {
            coal_set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmPush_t {
            coal_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> AST_AsmCdq_t {
            -> AST_AsmCall_t {
                break
            }
        }
        otherwise {
            break
        }
    }
}

fn coalesce_registers(ctx: *struc RegAllocContext) i32 {
    {
        open_data_map_size: u64 = ctx[].dfa[].set_size - REGISTER_MASK_SIZE
        if (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) < open_data_map_size {
            loop .. while 0 {
                (? (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity else 0) < cast<u64>((open_data_map_size)) then ((((ctx[].dfa[].open_data_map)) = stbds_arrgrowf(((ctx[].dfa[].open_data_map)), sizeof(((ctx[].dfa[].open_data_map))[]), (0), (cast<u64>((open_data_map_size)))))) and 0 else 0)
                ? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length = cast<u64>((open_data_map_size)) else 0
            }
        }
    }
    loop i: u64 = REGISTER_MASK_SIZE while i < ctx[].dfa[].set_size .. ++i {
        ctx[].dfa[].open_data_map[i - REGISTER_MASK_SIZE] = i
    }
    {
        is_fixed_point: i32 = true
        loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] and (ctx[].p_instrs[])[instr_idx][].tag == AST_AsmMov_t and coal_infer_regs(ctx, @(ctx[].p_instrs[])[instr_idx][].get._AsmMov) {
                is_fixed_point = false
            }
        }
        if is_fixed_point {
            return false
        }
    }
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    coal_instr(ctx, instr_idx, block_id)
                }
            }
        }
    }
    return true
}

fn alloc_fun_toplvl(ctx: *struc RegAllocContext, node: *struc AsmFunction) none {
    ctx[].p_instrs = @node[].instructions
    init_control_flow_graph(ctx)
    label Ldowhile
    if init_inference_graph(ctx, node[].name) {
        if ctx[].is_with_coal and coalesce_registers(ctx) {
            if ((? (ctx[].infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) and ((? (ctx[].sse_infer_graph[].unpruned_pseudo_names) then (cast<*struc stbds_array_header>((ctx[].sse_infer_graph[].unpruned_pseudo_names)) - 1)[].length else 0) == 0) {
                jump Lbreak
            }
            jump Ldowhile
        }
        {
            backend_fun: *struc BackendFun = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendFun
            ctx[].p_backend_fun = backend_fun
        }
        reallocate_registers(ctx)
        ctx[].p_backend_fun = nil
    }
    label Lbreak
    ctx[].p_infer_graph = nil
    ctx[].p_instrs = nil
}

fn alloc_toplvl(ctx: *struc RegAllocContext, node: *struc AsmTopLevel) none {
    match node[].tag {
        -> AST_AsmFunction_t {
            alloc_fun_toplvl(ctx, @node[].get._AsmFunction)
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

fn alloc_program(ctx: *struc RegAllocContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (node[].top_levels) then (cast<*struc stbds_array_header>((node[].top_levels)) - 1)[].length else 0) .. ++i {
        alloc_toplvl(ctx, node[].top_levels[i])
    }
}

pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none {
    ctx: struc RegAllocContext;
    {
        ctx.backend = backend
        ctx.frontend = frontend
        ctx.is_with_coal = optim_2_code > 1u
        ctx.hard_regs[0].reg_kind = REG_Ax
        ctx.hard_regs[1].reg_kind = REG_Bx
        ctx.hard_regs[2].reg_kind = REG_Cx
        ctx.hard_regs[3].reg_kind = REG_Dx
        ctx.hard_regs[4].reg_kind = REG_Di
        ctx.hard_regs[5].reg_kind = REG_Si
        ctx.hard_regs[6].reg_kind = REG_R8
        ctx.hard_regs[7].reg_kind = REG_R9
        ctx.hard_regs[8].reg_kind = REG_R12
        ctx.hard_regs[9].reg_kind = REG_R13
        ctx.hard_regs[10].reg_kind = REG_R14
        ctx.hard_regs[11].reg_kind = REG_R15
        ctx.hard_regs[12].reg_kind = REG_Xmm0
        ctx.hard_regs[13].reg_kind = REG_Xmm1
        ctx.hard_regs[14].reg_kind = REG_Xmm2
        ctx.hard_regs[15].reg_kind = REG_Xmm3
        ctx.hard_regs[16].reg_kind = REG_Xmm4
        ctx.hard_regs[17].reg_kind = REG_Xmm5
        ctx.hard_regs[18].reg_kind = REG_Xmm6
        ctx.hard_regs[19].reg_kind = REG_Xmm7
        ctx.hard_regs[20].reg_kind = REG_Xmm8
        ctx.hard_regs[21].reg_kind = REG_Xmm9
        ctx.hard_regs[22].reg_kind = REG_Xmm10
        ctx.hard_regs[23].reg_kind = REG_Xmm11
        ctx.hard_regs[24].reg_kind = REG_Xmm12
        ctx.hard_regs[25].reg_kind = REG_Xmm13
        loop i: u64 = 0 while i < 26 .. ++i {
            ctx.hard_regs[i].linked_pseudo_names = nil
        }
        ctx.cfg = make_ControlFlowGraph()
        ctx.dfa = make_DataFlowAnalysis()
        ctx.dfa_o2 = make_DataFlowAnalysisO2()
        ctx.infer_graph = make_InferenceGraph(false)
        ctx.sse_infer_graph = make_InferenceGraph(true)
    }

    alloc_program(@ctx, node)
    loop i: u64 = 0 while i < 26 .. ++i {
        if ctx.hard_regs[i].linked_pseudo_names {
            loop .. while 0 {
                cast<none>((? (ctx.hard_regs[i].linked_pseudo_names) then free((cast<*struc stbds_array_header>((ctx.hard_regs[i].linked_pseudo_names)) - 1)) else cast<none>(0)))
                (ctx.hard_regs[i].linked_pseudo_names) = nil
            }
            ctx.hard_regs[i].linked_pseudo_names = nil
        }
        ;
    }
    free_ControlFlowGraph(@ctx.cfg)
    free_DataFlowAnalysis(@ctx.dfa)
    free_DataFlowAnalysisO2(@ctx.dfa_o2)
    free_InferenceGraph(@ctx.infer_graph)
    free_InferenceGraph(@ctx.sse_infer_graph)
}
