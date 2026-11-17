m4_ifdef(`_UTIL_THROW_M4', `', `
m4_define(`_UTIL_THROW_M4', `')m4_dnl

use "stdio"
m4_include(`defsds.plx.m4')m4_dnl
m4_include(`defstb_ds.plx.m4')m4_dnl

type struc FileIoContext;

########################################################################################################################

# Throw

########################################################################################################################

# Errors

m4_define(`error_t', `i32')m4_dnl
m4_define(`ERROR_MSG_SIZE', `1024')m4_dnl
m4_define(`CATCH_ENTER', `_errval: error_t = 0')m4_dnl
m4_define(`CATCH_EXIT', `return _errval')m4_dnl
m4_define(`EARLY_EXIT', `jump _Lfinally')m4_dnl
m4_define(`FINALLY', `label _Lfinally')m4_dnl
m4_define(`TRY', `{
    _errval = ($1)
    if _errval ~= 0 { EARLY_EXIT }
}')m4_dnl
m4_define(`THROW_PANIC', `PANIC_FUNC($@)')m4_dnl
m4_define(`SET_ERROR_MSG', `snprint(ERROR_MSG_BUF, sizeof<char> * ERROR_MSG_SIZE, $1)')m4_dnl
m4_define(`THROW_ERROR', `{
    ? SET_ERROR_MSG($3) > 0 then cast<none>($2) else THROW_ABORT
    _errval = ($1)
    EARLY_EXIT
}')m4_dnl

########################################################################################################################

m4_define(`hash_t', `u64')m4_dnl
PairKeyValue(``hash_t'', ``hash_t'')

type struc FileOpenLine(linenum: u64, total_linenum: u64, filename: string_t)
type struc TokenInfo(tok_pos: i32, tok_len: i32, total_linenum: u64)
type struc ErrorsContext(
    errors: *struc ErrorsContext, fileio: *struc FileIoContext,
    # Throw
    msg: [ERROR_MSG_SIZE]char, is_stdout: bool, info_at_buf: u64, info_at_map: hashmap_t(``hash_t'', ``hash_t''),
    fopen_lines: vector_t(struc FileOpenLine), token_infos: vector_t(struc TokenInfo)
)

pub fn panic_sigabrt(msg: string) none;
m4_define(`PANIC_FUNC', `panic_sigabrt($1)')m4_dnl
m4_define(`THROW_ABORT', `THROW_PANIC("abort")')m4_dnl
m4_define(`THROW_ALLOC', `THROW_PANIC("alloc $1")')m4_dnl
m4_ifelse(1, `0', `
m4_define(`THROW_ABORT_IF', `if ($1) { THROW_ABORT }')m4_dnl
', `
m4_define(`THROW_ABORT_IF', `;')m4_dnl
')m4_dnl

pub fn raise_init_error(ctx: *struc ErrorsContext) none;
pub fn raise_base_error(ctx: *struc ErrorsContext) none;
pub fn raise_error_at_token(ctx: *struc ErrorsContext, info_at: u64) none;
m4_define(`ERROR_MSG_BUF', `ctx[].errors[].msg')m4_dnl
m4_define(`THROW_INIT', `THROW_ERROR(1, raise_init_error(ctx[].errors), $1)')m4_dnl
m4_define(`THROW_BASE', `THROW_ERROR(1, raise_base_error(ctx[].errors), $1)')m4_dnl
m4_define(`THROW_AT_TOKEN', `THROW_ERROR(1, raise_error_at_token(ctx[].errors, $1), $2)')m4_dnl

')m4_dnl
