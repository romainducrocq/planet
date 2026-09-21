m4_ifdef(`_LIB_C_STD_M4', `', `
m4_define(`_LIB_C_STD_M4', `')m4_dnl

m4_include(`../lib/c_lib.plx.m4')m4_dnl

m4_include(`../3rdparty/sds.plx.m4')m4_dnl
m4_include(`../3rdparty/stb_ds.plx.m4')m4_dnl

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
m4_define(`unique_ptr_t', `*struc $1')m4_dnl
m4_define(`unique_ptr_impl', `TODO')m4_dnl
m4_define(`uptr_new', `nil')m4_dnl
m4_define(`uptr_delete', `TODO')m4_dnl
m4_define(`uptr_alloc', `TODO')m4_dnl
m4_define(`uptr_free', `TODO')m4_dnl
m4_define(`uptr_move', `TODO')m4_dnl
m4_define(`shared_ptr_t', `unique_ptr_t($1)')m4_dnl
m4_define(`shared_ptr_impl', `TODO')m4_dnl
m4_define(`sptr_new', `nil')m4_dnl
m4_define(`sptr_delete', `TODO')m4_dnl
m4_define(`sptr_alloc', `TODO')m4_dnl
m4_define(`sptr_free', `TODO')m4_dnl
m4_define(`sptr_move', `TODO')m4_dnl
m4_define(`sptr_copy', `TODO')m4_dnl
m4_define(`string_t', `sds')m4_dnl
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
m4_define(`str_to_string', `? ($1) > 0 then sdsfromunsignedlong(cast<u64>($1)) else sdsfromlong(cast<i64>($1))')m4_dnl

m4_define(`vector_t', `*$1')m4_dnl
m4_define(`vec_new', `nil')m4_dnl
m4_define(`vec_delete', `if $1 {
    arrfree($1)
    $1 = vec_new()
}')m4_dnl
m4_define(`vec_move', `if $1 ~= $2 {
    vec_delete($2)
    $2 = $1
    $1 = vec_new()
}')m4_dnl
#TODO
m4_define(`vec_size', `arrlenu($1)')m4_dnl
#TODO
m4_define(`vec_back', `($1)[vec_size($1) - 1]')m4_dnl
m4_define(`vec_clear', `if $1 {
    stbds_header($1)[].length = 0
}')m4_dnl
m4_define(`vec_empty', `(vec_size($1) == 0)')m4_dnl
m4_define(`vec_move_back', `{
    vec_push_back($1, $2)
    $2 = nil
}')m4_dnl
m4_define(`vec_pop_back', `arrpop($1)')m4_dnl
m4_define(`vec_push_back', `arrput($1, $2)')m4_dnl
m4_define(`vec_remove_swap', `arrdelswap($1, $2)')m4_dnl
m4_define(`vec_resize', `arrsetlen($1, $2)')m4_dnl
m4_define(`vec_reserve', `arrsetcap($1, $2)')m4_dnl

m4_define(`xarg', `$1')m4_dnl
m4_define(`pair_t', `struc Pair$1$2')m4_dnl
m4_define(`PairKeyValue', `type pair_t($1, $2)(key: xarg($1), value: xarg($2))')m4_dnl
# TODO
m4_define(`pair_first', `($1).key')m4_dnl
# TODO
m4_define(`pair_second', `($1).value')m4_dnl
# TODO
m4_define(`hashmap_t', `*pair_t($1, $2)')m4_dnl
# TODO
m4_define(`map_new', `nil')m4_dnl
# TODO
m4_define(`map_delete', `if $1 {
    hmfree($1)
    $1 = map_new()
}')m4_dnl
m4_define(`map_move', `if $1 ~= $2 {
    map_delete($2)
    $2 = $1
    $1 = map_new()
}')m4_dnl
# TODO
m4_define(`map_size', `TODO')m4_dnl
# TODO
m4_define(`map_add', `hmput($1, $2, $3)')m4_dnl
m4_define(`map_clear', `map_delete($1)')m4_dnl
# TODO
m4_define(`map_empty', `TODO')m4_dnl
# TODO
m4_define(`map_end', `-1')m4_dnl
# TODO
m4_define(`map_erase', `TODO')m4_dnl
# TODO
m4_define(`map_find', `hmgeti($1, $2)')m4_dnl
# TODO
m4_define(`map_get', `TODO')m4_dnl
# TODO
m4_define(`map_move_add', `TODO')m4_dnl

m4_define(`element_t', `struc Element$1')m4_dnl
m4_define(`ElementKey', `type element_t($1)(key: xarg($1), value: char)')m4_dnl
m4_define(`element_get', `($1).key')m4_dnl
m4_define(`hashset_t', `*element_t($1)')m4_dnl
m4_define(`set_new', `map_new()')m4_dnl
m4_define(`set_delete', `map_delete($1)')m4_dnl
m4_define(`set_clear', `map_clear($1)')m4_dnl
m4_define(`set_end', `map_end()')m4_dnl
m4_define(`set_find', `map_find($1, $2)')m4_dnl
m4_define(`set_insert', `map_add($1, $2, 0)')m4_dnl

')m4_dnl
