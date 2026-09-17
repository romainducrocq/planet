m4_ifdef(`_LIB_STB_DS_M4', `', `
m4_define(`_LIB_STB_DS_M4', `')m4_dnl

# stb_ds.h - v0.67 - public domain data structures - Sean Barrett 2019
#
# ------------------------------------------------------------------------------
# This software is available under 2 licenses -- choose whichever you prefer.
# ------------------------------------------------------------------------------
# ALTERNATIVE A - MIT License
# Copyright (c) 2019 Sean Barrett
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this software and associated documentation files (the "Software"), to deal in
# the Software without restriction, including without limitation the rights to
# use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
# of the Software, and to permit persons to whom the Software is furnished to do
# so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.
# ------------------------------------------------------------------------------
# ALTERNATIVE B - Public Domain (www.unlicense.org)
# This is free and unencumbered software released into the public domain.
# Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
# software, either in source code form or as a compiled binary, for any purpose,
# commercial or non-commercial, and by any means.
# In jurisdictions that recognize copyright laws, the author or authors of this
# software dedicate any and all copyright interest in the software to the public
# domain. We make this dedication for the benefit of the public at large and to
# the detriment of our heirs and successors. We intend this dedication to be an
# overt act of relinquishment in perpetuity of all present and future rights to
# this software under copyright law.
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
# ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
# WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# ------------------------------------------------------------------------------
#

m4_define(`arrlenu', `stbds_arrlenu($1)')m4_dnl
m4_define(`arrput', `stbds_arrput($1, $2)')m4_dnl
m4_define(`arrpop', `stbds_arrpop')m4_dnl
m4_define(`arrfree', `stbds_arrfree')m4_dnl
m4_define(`arrsetlen', `stbds_arrsetlen($1, $2)')m4_dnl
m4_define(`arrdelswap', `stbds_arrdelswap')m4_dnl
m4_define(`arrsetcap', `stbds_arrsetcap($1, $2)')m4_dnl

m4_define(`hmput', `stbds_hmput')m4_dnl
m4_define(`hmget', `stbds_hmget')m4_dnl
m4_define(`hmgeti', `stbds_hmgeti')m4_dnl
m4_define(`hmdel', `stbds_hmdel')m4_dnl
m4_define(`hmlenu', `stbds_hmlenu')m4_dnl
m4_define(`hmfree', `stbds_hmfree')m4_dnl

m4_define(`STBDS_ADDRESSOF', `@($2)')m4_dnl
m4_define(`STBDS_OFFSETOF', `(cast<string>(@($1)[].$2) - cast<string>($1))')m4_dnl

m4_define(`stbds_header', `(cast<*struc stbds_array_header>($1) - 1)')m4_dnl
m4_define(`stbds_temp', `stbds_header($1)[].temp')m4_dnl

m4_define(`stbds_arrsetcap', `(stbds_arrgrow($1, 0, $2))')m4_dnl
m4_define(`stbds_arrsetlen', `{
    (? stbds_arrcap($1) < cast<u64>($2) then stbds_arrsetcap(($1), cast<u64>($2)) and 0 else 0)
    ? ($1) then stbds_header($1)[].length = cast<u64>($2) else 0
}')m4_dnl
m4_define(`stbds_arrcap', `(? ($1) then stbds_header($1)[].capacity else 0)')m4_dnl
m4_define(`stbds_arrlenu', `(? ($1) then stbds_header($1)[].length else 0)')m4_dnl
m4_define(`stbds_arrput', `{
    stbds_arrmaybegrow($1, 1)
    ($1)[stbds_header($1)[].length++] = ($2)
}')m4_dnl
m4_define(`stbds_arrpop', `TODO')m4_dnl
m4_define(`stbds_arrlast', `TODO')m4_dnl
m4_define(`stbds_arrfree', `TODO')m4_dnl
m4_define(`stbds_arrdelswap', `TODO')m4_dnl
m4_define(`stbds_arrmaybegrow', `(? (not ($1) or stbds_header($1)[].length + ($2) > stbds_header($1)[].capacity) then ((stbds_arrgrow($1, $2, 0)) and 0) else 0)')m4_dnl
m4_define(`stbds_arrgrow', `($1) = stbds_arrgrowf(($1), sizeof(($1)[]), ($2), ($3))')m4_dnl
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

')m4_dnl
