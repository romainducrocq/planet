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
m4_define(`unique_ptr_t', `TODO')m4_dnl
m4_define(`unique_ptr_impl', `TODO')m4_dnl
m4_define(`uptr_new', `nil')m4_dnl
m4_define(`uptr_delete', `TODO')m4_dnl
m4_define(`uptr_alloc', `TODO')m4_dnl
m4_define(`uptr_free', `TODO')m4_dnl
m4_define(`uptr_move', `TODO')m4_dnl
m4_define(`shared_ptr_t', `TODO')m4_dnl
m4_define(`shared_ptr_impl', `TODO')m4_dnl
m4_define(`sptr_new', `nil')m4_dnl
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

#TODO
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
#TODO
m4_define(`vec_empty', `(vec_size($1) == 0)')m4_dnl
#TODO
m4_define(`vec_move_back', `{
    vec_push_back($1, $2)
    $2 = nil
}')m4_dnl
#TODO
m4_define(`vec_pop_back', `arrpop($1)')m4_dnl
#TODO
m4_define(`vec_push_back', `arrput($1, $2)')m4_dnl
m4_define(`vec_remove_swap', `arrdelswap($1, $2)')m4_dnl
m4_define(`vec_resize', `arrsetlen($1, $2)')m4_dnl
m4_define(`vec_reserve', `arrsetcap($1, $2)')m4_dnl

m4_define(`pair_t', `TODO')m4_dnl
m4_define(`PairKeyValue', `TODO')m4_dnl
m4_define(`pair_first', `TODO')m4_dnl
m4_define(`pair_second', `TODO')m4_dnl
m4_define(`hashmap_t', `TODO')m4_dnl
m4_define(`map_new', `nil')m4_dnl
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
m4_define(`set_new', `nil')m4_dnl
m4_define(`set_delete', `TODO')m4_dnl
m4_define(`set_size', `TODO')m4_dnl
m4_define(`set_clear', `TODO')m4_dnl
m4_define(`set_end', `TODO')m4_dnl
m4_define(`set_find', `TODO')m4_dnl
m4_define(`set_insert', `TODO')m4_dnl

')m4_dnl
