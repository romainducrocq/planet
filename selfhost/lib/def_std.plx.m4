m4_ifdef(`_LIB_C_STD_M4', `', `
m4_define(`_LIB_C_STD_M4', `')m4_dnl

m4_include(`../3rdparty/sds.plx.m4')m4_dnl
m4_include(`../3rdparty/stb_ds.plx.m4')m4_dnl

########################################################################################################################

# Def std

########################################################################################################################

# Memory

m4_define(`tagged_def_t', `$1_$2_t')m4_dnl
m4_define(`tagged_def_impl', `tag: $1')m4_dnl
m4_define(`tagged_def_init', `make_$2(tagged_def_t($1, $3))')m4_dnl
m4_define(`unique_ptr_t', `*struc $1')m4_dnl
m4_define(`unique_ptr_impl', `tagged_def_impl($1),')m4_dnl
m4_define(`uptr_new', `nil')m4_dnl
m4_define(`uptr_delete', `if not ($1) { return none }')m4_dnl
m4_define(`uptr_alloc', `{
    free_$1(@($2))
    ($2) = cast<*struc $1>(malloc(sizeof<struc $1>))
    if not ($2) { THROW_ALLOC($1) }
}')m4_dnl
m4_define(`uptr_free', `if ($1) {
    free($1)
    ($1) = uptr_new()
}')m4_dnl
m4_define(`uptr_move', `if ($2) ~= ($3) {
    free_$1(@($3))
    ($3) = ($2)
    ($2) = uptr_new()
}')m4_dnl

########################################################################################################################

# Shared pointer

m4_define(`shared_ptr_t', `unique_ptr_t($1)')m4_dnl
m4_define(`shared_ptr_impl', `_ref_count: u64, unique_ptr_impl($1)')m4_dnl
m4_define(`sptr_new', `nil')m4_dnl
m4_define(`sptr_delete', `uptr_delete($1)
elif ($1)[]._ref_count > 1 {
    ($1)[]._ref_count--
    ($1) = sptr_new()
    return none
}')m4_dnl
m4_define(`sptr_alloc', `{
    uptr_alloc($1, $2)
    ($2)[]._ref_count = 1
}')m4_dnl
m4_define(`sptr_free', `uptr_free($1)')m4_dnl
m4_define(`sptr_move', `uptr_move($1, $2, $3)')m4_dnl
m4_define(`sptr_copy', `if ($2) ~= ($3) {
    free_$1(@($3))
    ($3) = ($2)
    ($3)[]._ref_count++
}')m4_dnl

########################################################################################################################

')m4_dnl
