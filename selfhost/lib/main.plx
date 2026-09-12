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
type struc ErrorsContext;
type struc FileIoContext;
type struc IdentifierContext;

type struc Token(tok_kind: i32, tok: u64, info_at: u64)

pub fn lex_c_code(filename: string, includedirs: **string, stdlibdirs: **string, errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: **struc Token) i32;
type struc Token;
type struc CProgram;
type struc ErrorsContext;
type struc IdentifierContext;
pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32;
type struc CProgram;
type struc ErrorsContext;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32;
type struc CProgram;
type struc TacProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram;
type struc TacProgram;
type struc AsmProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram;
type struc AsmProgram;
type struc BackEndContext;
type struc FileIoContext;
type struc IdentifierContext;
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none;
type struc AsmInstruction;
type struc AsmProgram;
type struc BackEndContext;
pub fn alloc_stack_bytes(byte: i64) *struc AsmInstruction;
pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none;
type struc Type;
type struc AssemblyType;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) i32;
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType;
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none;
type struc TacProgram;
type struc FrontEndContext;
pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none;

type struc MainContext(errors: *struc ErrorsContext, is_verbose: i32, debug_code: u8, optim_1_mask: u8, optim_2_code: u8, filename: string, includedirs: *string, stdlibdirs: *string)

m4_define(`Ctx', `TODO')m4_dnl

fn verbose(ctx: *struc MainContext, msg: string) none {
    if ctx[].is_verbose {
        printf("%s", msg)
    }
}

fn set_filename_ext(ctx: *struc MainContext, ext: string) none {
    loop i: u64 = sdslen(ctx[].filename) while i-- > 0 {
        if ctx[].filename[i] == '.' {
            sdsrange(ctx[].filename, 0, i)
            loop .. while 0 {
                ctx[].filename = sdscat(ctx[].filename, ext)
            }
            return none
        }
    }
    panic_sigabrt("abort")
}

fn compile(ctx: *struc MainContext, errors: *struc ErrorsContext, fileio: *struc FileIoContext) i32 {
    identifiers: struc IdentifierContext;
    frontend: struc FrontEndContext;
    backend: struc BackEndContext;
    tokens: *struc Token = nil
    c_ast: *struc CProgram = nil
    tac_ast: *struc TacProgram = nil

    asm_ast: *struc AsmProgram = nil
    {
        if ctx[].debug_code > 0 and ctx[].debug_code <= 127 {
            ctx[].is_verbose = true
            errors[].is_stdout = true
        }
        identifiers.label_count = 0u
        identifiers.var_count = 0u
        identifiers.struct_count = 0u
        identifiers.hash_table = nil
        frontend.string_const_table = nil
        frontend.struct_typedef_table = nil
        frontend.symbol_table = nil
        frontend.addressed_set = nil
        backend.symbol_table = nil
    }

    _errval: i32 = 0
    verbose(ctx, "-- Lexing ... ")
    loop .. while 0 {
        "@MACRO@:TRY(lex_c_code(ctx->filename, &ctx->includedirs, &ctx->stdlibdirs, errors, fileio, &identifiers, &tokens))"
        _errval = lex_c_code(ctx[].filename, @ctx[].includedirs, @ctx[].stdlibdirs, errors, fileio, @identifiers, @tokens)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 255 {
        jump _Lfinally
    }
    verbose(ctx, "-- Parsing ... ")
    loop .. while 0 {
        "@MACRO@:TRY(parse_tokens(&tokens, errors, &identifiers, &c_ast))"
        _errval = parse_tokens(@tokens, errors, @identifiers, @c_ast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 254 {
        jump _Lfinally
    }
    verbose(ctx, "-- Semantic analysis ... ")
    loop .. while 0 {
        "@MACRO@:TRY(analyze_semantic(c_ast, errors, &frontend, &identifiers))"
        _errval = analyze_semantic(c_ast, errors, @frontend, @identifiers)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 253 {
        jump _Lfinally
    }
    verbose(ctx, "-- TAC representation ... ")
    tac_ast = represent_three_address_code(@c_ast, @frontend, @identifiers)
    if ctx[].optim_1_mask > 0 {
        verbose(ctx, "OK\n-- Level 1 optimization ... ")
        optimize_three_address_code(tac_ast, @frontend, ctx[].optim_1_mask)
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 252 {
        jump _Lfinally
    }
    verbose(ctx, "-- Assembly generation ... ")
    asm_ast = generate_assembly(@tac_ast, @frontend, @identifiers)
    convert_symbol_table(asm_ast, @backend, @frontend)
    if ctx[].optim_2_code > 0 {
        verbose(ctx, "OK\n-- Level 2 optimization ... ")
        allocate_registers(asm_ast, @backend, @frontend, ctx[].optim_2_code)
    }
    fix_stack(asm_ast, @backend)
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 251 {
        jump _Lfinally
    }
    verbose(ctx, "-- Code emission ... ")
    set_filename_ext(ctx, "s")
    loop .. while 0 {
        "@MACRO@:TRY(open_fwrite(fileio, ctx->filename))"
        _errval = open_fwrite(fileio, ctx[].filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    emit_gas_code(@asm_ast, @backend, fileio, @identifiers)
    close_fwrite(fileio)
    verbose(ctx, "OK\n")
    label _Lfinally
    loop i: u64 = 0 while i < (? (identifiers.hash_table) then (cast<*struc stbds_array_header>(((identifiers.hash_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (identifiers.hash_table[i]).value {
            sdsfree((identifiers.hash_table[i]).value)
            (identifiers.hash_table[i]).value = ? nil then sdsnew(nil) else nil
        }
    }
    if identifiers.hash_table {
        loop .. while 0 {
            cast<none>((? (identifiers.hash_table) ~= nil then stbds_hmfree_func((identifiers.hash_table) - 1, sizeof((identifiers.hash_table)[])) else cast<none>(0)))
            (identifiers.hash_table) = nil
        }
        identifiers.hash_table = nil
    }
    if frontend.string_const_table {
        loop .. while 0 {
            cast<none>((? (frontend.string_const_table) ~= nil then stbds_hmfree_func((frontend.string_const_table) - 1, sizeof((frontend.string_const_table)[])) else cast<none>(0)))
            (frontend.string_const_table) = nil
        }
        frontend.string_const_table = nil
    }
    loop i: u64 = 0 while i < (? (frontend.struct_typedef_table) then (cast<*struc stbds_array_header>(((frontend.struct_typedef_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructTypedef(@(frontend.struct_typedef_table[i]).value)
    }
    if frontend.struct_typedef_table {
        loop .. while 0 {
            cast<none>((? (frontend.struct_typedef_table) ~= nil then stbds_hmfree_func((frontend.struct_typedef_table) - 1, sizeof((frontend.struct_typedef_table)[])) else cast<none>(0)))
            (frontend.struct_typedef_table) = nil
        }
        frontend.struct_typedef_table = nil
    }
    loop i: u64 = 0 while i < (? (frontend.symbol_table) then (cast<*struc stbds_array_header>(((frontend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_Symbol(@(frontend.symbol_table[i]).value)
    }
    if frontend.symbol_table {
        loop .. while 0 {
            cast<none>((? (frontend.symbol_table) ~= nil then stbds_hmfree_func((frontend.symbol_table) - 1, sizeof((frontend.symbol_table)[])) else cast<none>(0)))
            (frontend.symbol_table) = nil
        }
        frontend.symbol_table = nil
    }
    if frontend.addressed_set {
        loop .. while 0 {
            cast<none>((? (frontend.addressed_set) ~= nil then stbds_hmfree_func((frontend.addressed_set) - 1, sizeof((frontend.addressed_set)[])) else cast<none>(0)))
            (frontend.addressed_set) = nil
        }
        frontend.addressed_set = nil
    }
    loop i: u64 = 0 while i < (? (backend.symbol_table) then (cast<*struc stbds_array_header>(((backend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_BackendSymbol(@(backend.symbol_table[i]).value)
    }
    if backend.symbol_table {
        loop .. while 0 {
            cast<none>((? (backend.symbol_table) ~= nil then stbds_hmfree_func((backend.symbol_table) - 1, sizeof((backend.symbol_table)[])) else cast<none>(0)))
            (backend.symbol_table) = nil
        }
        backend.symbol_table = nil
    }
    if tokens {
        loop .. while 0 {
            cast<none>((? (tokens) then free((cast<*struc stbds_array_header>((tokens)) - 1)) else cast<none>(0)))
            (tokens) = nil
        }
        tokens = nil
    }
    free_CProgram(@c_ast)
    free_TacProgram(@tac_ast)
    free_AsmProgram(@asm_ast)
    return _errval
}

fn arg_parse_uint8(arg: string, value: *u8) i32 {
    end_ptr: string = nil
    value[] = cast<u8>(strtol(arg, @end_ptr, 10))
    return end_ptr == arg
}

fn arg_parse(ctx: *struc MainContext, argc: i32, argv: *string) i32 {
    _errval: i32 = 0
    i: u64 = 0
    if argc == 2 and strcmp(argv[1], "--help") == 0 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_print_help), "MSG_print_help", "", "", argv[0]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_debug_arg), "MSG_no_debug_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].debug_code) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_debug_arg), "MSG_invalid_debug_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_1_arg), "MSG_no_optim_1_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_1_mask) or ctx[].optim_1_mask > 15 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_1_arg), "MSG_invalid_optim_1_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_2_arg), "MSG_no_optim_2_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_2_code) or ctx[].optim_2_code > 2 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_2_arg), "MSG_invalid_optim_2_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_input_files_arg), "MSG_no_input_files_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].filename = ? argv[i] then sdsnew(argv[i]) else nil
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_stdlib_dir_arg), "MSG_no_stdlib_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        (? (not (ctx[].stdlibdirs) or (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].capacity) then (((ctx[].stdlibdirs) = stbds_arrgrowf((ctx[].stdlibdirs), sizeof((ctx[].stdlibdirs)[]), (1), (0))) and 0) else 0)
        (ctx[].stdlibdirs)[(cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length++] = (cast<string>(argv[i]))
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_include_dir_arg), "MSG_no_include_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while argv[++i] {
        loop .. while 0 {
            (? (not (ctx[].includedirs) or (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].capacity) then (((ctx[].includedirs) = stbds_arrgrowf((ctx[].includedirs), sizeof((ctx[].includedirs)[]), (1), (0))) and 0) else 0)
            (ctx[].includedirs)[(cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length++] = (cast<string>(argv[i]))
        }
    }
    label _Lfinally
    return _errval
}

pub fn main(argc: i32, argv: *string) i32 {
    errors: struc ErrorsContext;
    fileio: struc FileIoContext;

    ctx: struc MainContext;
    {
        errors.errors = @errors
        errors.fileio = @fileio
        errors.is_stdout = false
        errors.info_at_map = nil
        errors.fopen_lines = nil
        errors.token_infos = nil
        fileio.errors = @errors
        fileio.fd_write = nil
        fileio.write_buf = ? nil then sdsnew(nil) else nil
        fileio.filename = ? nil then sdsnew(nil) else nil
        fileio.file_reads = nil
        ctx.errors = @errors
        ctx.is_verbose = false
        ctx.filename = ? nil then sdsnew(nil) else nil
        ctx.includedirs = nil
        ctx.stdlibdirs = nil
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(arg_parse(&ctx, argc, argv))"
        _errval = arg_parse(@ctx, argc, argv)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(compile(&ctx, &errors, &fileio))"
        _errval = compile(@ctx, @errors, @fileio)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if errors.info_at_map {
        loop .. while 0 {
            cast<none>((? (errors.info_at_map) ~= nil then stbds_hmfree_func((errors.info_at_map) - 1, sizeof((errors.info_at_map)[])) else cast<none>(0)))
            (errors.info_at_map) = nil
        }
        errors.info_at_map = nil
    }
    loop i: u64 = 0 while i < (? (errors.fopen_lines) then (cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)[].length else 0) .. ++i {
        if errors.fopen_lines[i].filename {
            sdsfree(errors.fopen_lines[i].filename)
            errors.fopen_lines[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if errors.fopen_lines {
        loop .. while 0 {
            cast<none>((? (errors.fopen_lines) then free((cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)) else cast<none>(0)))
            (errors.fopen_lines) = nil
        }
        errors.fopen_lines = nil
    }
    if errors.token_infos {
        loop .. while 0 {
            cast<none>((? (errors.token_infos) then free((cast<*struc stbds_array_header>((errors.token_infos)) - 1)) else cast<none>(0)))
            (errors.token_infos) = nil
        }
        errors.token_infos = nil
    }
    if fileio.write_buf {
        sdsfree(fileio.write_buf)
        fileio.write_buf = ? nil then sdsnew(nil) else nil
    }
    if fileio.filename {
        sdsfree(fileio.filename)
        fileio.filename = ? nil then sdsnew(nil) else nil
    }
    loop i: u64 = 0 while i < (? (fileio.file_reads) then (cast<*struc stbds_array_header>((fileio.file_reads)) - 1)[].length else 0) .. ++i {
        if fileio.file_reads[i].filename {
            sdsfree(fileio.file_reads[i].filename)
            fileio.file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if fileio.file_reads {
        loop .. while 0 {
            cast<none>((? (fileio.file_reads) then free((cast<*struc stbds_array_header>((fileio.file_reads)) - 1)) else cast<none>(0)))
            (fileio.file_reads) = nil
        }
        fileio.file_reads = nil
    }
    if ctx.filename {
        sdsfree(ctx.filename)
        ctx.filename = ? nil then sdsnew(nil) else nil
    }
    if ctx.includedirs {
        loop .. while 0 {
            cast<none>((? (ctx.includedirs) then free((cast<*struc stbds_array_header>((ctx.includedirs)) - 1)) else cast<none>(0)))
            (ctx.includedirs) = nil
        }
        ctx.includedirs = nil
    }
    if ctx.stdlibdirs {
        loop .. while 0 {
            cast<none>((? (ctx.stdlibdirs) then free((cast<*struc stbds_array_header>((ctx.stdlibdirs)) - 1)) else cast<none>(0)))
            (ctx.stdlibdirs) = nil
        }
        ctx.stdlibdirs = nil
    }
    return _errval
}
