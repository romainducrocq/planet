/* stb_ds.h - v0.67 - public domain data structures - Sean Barrett 2019
 *
 * ------------------------------------------------------------------------------
 * This software is available under 2 licenses -- choose whichever you prefer.
 * ------------------------------------------------------------------------------
 * ALTERNATIVE A - MIT License
 * Copyright (c) 2019 Sean Barrett
 * Permission is hereby granted, free of charge, to any person obtaining a copy of
 * this software and associated documentation files (the "Software"), to deal in
 * the Software without restriction, including without limitation the rights to
 * use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
 * of the Software, and to permit persons to whom the Software is furnished to do
 * so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 * ------------------------------------------------------------------------------
 * ALTERNATIVE B - Public Domain (www.unlicense.org)
 * This is free and unencumbered software released into the public domain.
 * Anyone is free to copy, modify, publish, use, compile, sell, or distribute this
 * software, either in source code form or as a compiled binary, for any purpose,
 * commercial or non-commercial, and by any means.
 * In jurisdictions that recognize copyright laws, the author or authors of this
 * software dedicate any and all copyright interest in the software to the public
 * domain. We make this dedication for the benefit of the public at large and to
 * the detriment of our heirs and successors. We intend this dedication to be an
 * overt act of relinquishment in perpetuity of all present and future rights to
 * this software under copyright law.
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN
 * ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
 * WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 * ------------------------------------------------------------------------------
 */

#ifndef _LIB_STB_DS_H
#define _LIB_STB_DS_H

#define arrlenu stbds_arrlenu
#define arrput stbds_arrput
#define arrpop stbds_arrpop
#define arrfree stbds_arrfree
#define arrsetlen stbds_arrsetlen
#define arrdelswap stbds_arrdelswap
#define arrsetcap stbds_arrsetcap

#define hmput stbds_hmput
#define hmget stbds_hmget
#define hmgeti stbds_hmgeti
#define hmdel stbds_hmdel
#define hmlenu stbds_hmlenu
#define hmfree stbds_hmfree

#define STBDS_ADDRESSOF(typevar, value) &(value)
#define STBDS_OFFSETOF(var, field) ((char*)&(var)->field - (char*)(var))

#define stbds_header(t) ((struct stbds_array_header*)(t)-1)
#define stbds_temp(t) stbds_header(t)->temp

#define stbds_arrsetcap(a, n) (stbds_arrgrow(a, 0, n))
#define stbds_arrsetlen(a, n)                                                                       \
    do {                                                                                            \
        (stbds_arrcap(a) < (unsigned long)(n) ? stbds_arrsetcap((a), (unsigned long)(n)) && 0 : 0); \
        (a) ? stbds_header(a)->length = (unsigned long)(n) : 0;                                     \
    }                                                                                               \
    while (0)
#define stbds_arrcap(a) ((a) ? stbds_header(a)->capacity : 0)
#define stbds_arrlenu(a) ((a) ? stbds_header(a)->length : 0)
#define stbds_arrput(a, v)                    \
    do {                                      \
        stbds_arrmaybegrow(a, 1);             \
        (a)[stbds_header(a)->length++] = (v); \
    }                                         \
    while (0)
#define stbds_arrpop(a) (stbds_header(a)->length--)
#define stbds_arrlast(a) ((a)[stbds_header(a)->length - 1])
#define stbds_arrfree(a)                               \
    do {                                               \
        (void)((a) ? free(stbds_header(a)) : (void)0); \
        (a) = NULL;                                    \
    }                                                  \
    while (0)
#define stbds_arrdelswap(a, i)        \
    do {                              \
        (a)[i] = stbds_arrlast(a);    \
        stbds_header(a)->length -= 1; \
    }                                 \
    while (0)

#define stbds_arrmaybegrow(a, n) \
    ((!(a) || stbds_header(a)->length + (n) > stbds_header(a)->capacity) ? (stbds_arrgrow(a, n, 0) && 0) : 0)

#define stbds_arrgrow(a, b, c) ((a) = stbds_arrgrowf((a), sizeof *(a), (b), (c)))

#define stbds_hmput(t, k, v)                                                                               \
    do {                                                                                                   \
        (t) = stbds_hmput_key((t), sizeof *(t), (void*)STBDS_ADDRESSOF((t)->key, (k)), sizeof(t)->key, 0); \
        (t)[stbds_temp((t)-1)].key = (k);                                                                  \
        (t)[stbds_temp((t)-1)].value = (v);                                                                \
    }                                                                                                      \
    while (0)

#define stbds_hmgeti(t, k)                                                                                      \
    (((t) = stbds_hmget_key((t), sizeof *(t), (void*)STBDS_ADDRESSOF((t)->key, (k)), sizeof(t)->key, 0)) && 0 ? \
            0 :                                                                                                 \
            stbds_temp((t)-1))

#define stbds_hmgetp(t, k) ((stbds_hmgeti(t, k)) && 0 ? 0 : &(t)[stbds_temp((t)-1)])

#define stbds_hmdel(t, k)                                                                                          \
    (((t) = stbds_hmdel_key(                                                                                       \
          (t), sizeof *(t), (void*)STBDS_ADDRESSOF((t)->key, (k)), sizeof(t)->key, STBDS_OFFSETOF((t), key), 0)) ? \
            stbds_temp((t)-1) :                                                                                    \
            0)

#define stbds_hmfree(p)                                                        \
    do {                                                                       \
        (void)((p) != NULL ? stbds_hmfree_func((p)-1, sizeof *(p)) : (void)0); \
        (p) = NULL;                                                            \
    }                                                                          \
    while (0)

#define stbds_hmget(t, k) (stbds_hmgetp(t, k)->value)
#define stbds_hmlenu(t) ((t) ? stbds_header((t)-1)->length - 1 : 0)

struct stbds_array_header {
    unsigned long length;
    unsigned long capacity;
    void* hash_table;
    long temp;
};

extern unsigned long stbds_hash_string(char* str, unsigned long seed);
extern void* stbds_arrgrowf(void* a, unsigned long elemsize, unsigned long addlen, unsigned long min_cap);
extern void stbds_hmfree_func(void* p, unsigned long elemsize);
extern void* stbds_hmget_key(void* a, unsigned long elemsize, void* key, unsigned long keysize, int mode);
extern void* stbds_hmput_key(void* a, unsigned long elemsize, void* key, unsigned long keysize, int mode);
extern void* stbds_hmdel_key(
    void* a, unsigned long elemsize, void* key, unsigned long keysize, unsigned long keyoffset, int mode);

#endif
