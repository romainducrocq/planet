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

#include "stb_ds.h"

#include "../lib/c_lib.h"

#define STBDS_SH_DEFAULT 1
#define STBDS_SH_STRDUP 2
#define STBDS_SH_ARENA 3

void* stbds_arrgrowf(void* a, unsigned long elemsize, unsigned long addlen, unsigned long min_cap) {
    struct stbds_array_header temp = {0};
    void* b;
    unsigned long min_len = ((a) ? (long)((struct stbds_array_header*)(a)-1)->length : 0) + addlen;
    (void)sizeof(temp);
    if (min_len > min_cap)
        min_cap = min_len;
    if (min_cap <= ((a) ? ((struct stbds_array_header*)(a)-1)->capacity : 0))
        return a;
    if (min_cap < 2 * ((a) ? ((struct stbds_array_header*)(a)-1)->capacity : 0))
        min_cap = 2 * ((a) ? ((struct stbds_array_header*)(a)-1)->capacity : 0);
    else if (min_cap < 4)
        min_cap = 4;
    b = realloc((a) ? ((struct stbds_array_header*)(a)-1) : 0, elemsize * min_cap + sizeof(struct stbds_array_header));
    b = (char*)b + sizeof(struct stbds_array_header);
    if (a == ((void*)0)) {
        ((struct stbds_array_header*)(b)-1)->length = 0;
        ((struct stbds_array_header*)(b)-1)->hash_table = 0;
        ((struct stbds_array_header*)(b)-1)->temp = 0;
    }
    ((struct stbds_array_header*)(b)-1)->capacity = min_cap;
    return b;
}

struct stbds_string_block {
    struct stbds_string_block* next;
    char storage[8];
};

struct stbds_string_arena {
    struct stbds_string_block* storage;
    unsigned long remaining;
    unsigned char block;
    unsigned char mode;
};

struct stbds_hash_bucket {
    unsigned long hash[8];
    long index[8];
};

struct stbds_hash_index {
    char* temp_key;
    unsigned long slot_count;
    unsigned long used_count;
    unsigned long used_count_threshold;
    unsigned long used_count_shrink_threshold;
    unsigned long tombstone_count;
    unsigned long tombstone_count_threshold;
    unsigned long seed;
    unsigned long slot_count_log2;
    struct stbds_string_arena string;
    struct stbds_hash_bucket* storage;
};

static unsigned long stbds_hash_seed = 826366246; // 0x31415926

static unsigned long stbds_probe_position(unsigned long hash, unsigned long slot_count, unsigned long slot_log2) {
    unsigned long pos;
    (void)sizeof(slot_log2);
    pos = hash & (slot_count - 1);
    return pos;
}

static unsigned long stbds_log2(unsigned long slot_count) {
    unsigned long n = 0;
    while (slot_count > 1) {
        slot_count >>= 1;
        ++n;
    }
    return n;
}

static struct stbds_hash_index* stbds_make_hash_index(unsigned long slot_count, struct stbds_hash_index* ot) {
    struct stbds_hash_index* t;
    t = (struct stbds_hash_index*)realloc(0,
        (slot_count >> (8 == 8 ? 3 : 2)) * sizeof(struct stbds_hash_bucket) + sizeof(struct stbds_hash_index) + 64 - 1);
    t->storage = (struct stbds_hash_bucket*)((((unsigned long)(t + 1)) + (64) - 1) & ~((64) - 1));
    t->slot_count = slot_count;
    t->slot_count_log2 = stbds_log2(slot_count);
    t->tombstone_count = 0;
    t->used_count = 0;
    t->used_count_threshold = slot_count - (slot_count >> 2);
    t->tombstone_count_threshold = (slot_count >> 3) + (slot_count >> 4);
    t->used_count_shrink_threshold = slot_count >> 2;
    if (slot_count <= 8)
        t->used_count_shrink_threshold = 0;
    if (ot) {
        t->string = ot->string;
        t->seed = ot->seed;
    }
    else {
        unsigned long a;
        unsigned long b;
        unsigned long temp;
        memset(&t->string, 0, sizeof(t->string));
        t->seed = stbds_hash_seed;
        temp = 2276503805 ^ 2147001325; // 0x87b0b0fd
        temp <<= 16;
        temp <<= 16;
        temp >>= 16;
        temp >>= 16;
        a = 666578662; // 0x27bb2ee6
        a <<= 16;
        a <<= 16;
        a ^= temp ^ 2147001325;
        temp = 3037000493 ^ 715136305; // 0xb504f32d
        temp <<= 16;
        temp <<= 16;
        temp >>= 16;
        temp >>= 16;
        b = 0;
        b <<= 16;
        b <<= 16;
        b ^= temp ^ 715136305;
        stbds_hash_seed = stbds_hash_seed * a + b;
    }
    {
        unsigned long i;
        unsigned long j;
        for (i = 0; i < slot_count >> (8 == 8 ? 3 : 2); ++i) {
            struct stbds_hash_bucket* b = &t->storage[i];
            for (j = 0; j < 8; ++j)
                b->hash[j] = 0;
            for (j = 0; j < 8; ++j)
                b->index[j] = -1;
        }
    }
    if (ot) {
        unsigned long i;
        unsigned long j;
        t->used_count = ot->used_count;
        for (i = 0; i < ot->slot_count >> (8 == 8 ? 3 : 2); ++i) {
            struct stbds_hash_bucket* ob = &ot->storage[i];
            for (j = 0; j < 8; ++j) {
                if (((ob->index[j]) >= 0)) {
                    unsigned long hash = ob->hash[j];
                    unsigned long pos = stbds_probe_position(hash, t->slot_count, t->slot_count_log2);
                    unsigned long step = 8;
                    for (;;) {
                        unsigned long limit;
                        unsigned long z;
                        struct stbds_hash_bucket* bucket;
                        bucket = &t->storage[pos >> (8 == 8 ? 3 : 2)];
                        for (z = pos & (8 - 1); z < 8; ++z) {
                            if (bucket->hash[z] == 0) {
                                bucket->hash[z] = hash;
                                bucket->index[z] = ob->index[j];
                                goto done;
                            }
                        }
                        limit = pos & (8 - 1);
                        for (z = 0; z < limit; ++z) {
                            if (bucket->hash[z] == 0) {
                                bucket->hash[z] = hash;
                                bucket->index[z] = ob->index[j];
                                goto done;
                            }
                        }
                        pos += step;
                        step += 8;
                        pos &= (t->slot_count - 1);
                    }
                }
            done:;
            }
        }
    }
    return t;
}

unsigned long stbds_hash_string(char* str, unsigned long seed) {
    unsigned long hash = seed;
    while (*str)
        hash = (((hash) << (9)) | ((hash) >> (((sizeof(unsigned long)) * 8) - (9)))) + (unsigned char)*str++;
    hash ^= seed;
    hash = (~hash) + (hash << 18);
    hash ^= hash ^ (((hash) >> (31)) | ((hash) << (((sizeof(unsigned long)) * 8) - (31))));
    hash = hash * 21;
    hash ^= hash ^ (((hash) >> (11)) | ((hash) << (((sizeof(unsigned long)) * 8) - (11))));
    hash += (hash << 6);
    hash ^= (((hash) >> (22)) | ((hash) << (((sizeof(unsigned long)) * 8) - (22))));
    return hash + seed;
}

static unsigned long stbds_siphash_bytes(void* p, unsigned long len, unsigned long seed) {
    unsigned char* d = (unsigned char*)p;
    unsigned long i;
    unsigned long j;
    unsigned long v0;
    unsigned long v1;
    unsigned long v2;
    unsigned long v3;
    unsigned long data;
    v0 = ((((unsigned long)1936682341 << 16) << 16) + 1886610805) ^ seed;  // 0x736f6d65, 0x70736575
    v1 = ((((unsigned long)1685025377 << 16) << 16) + 1852075885) ^ ~seed; // 0x646f7261, 0x6e646f6d
    v2 = ((((unsigned long)1819895653 << 16) << 16) + 1852142177) ^ seed;  // 0x6c796765, 0x6e657261
    v3 = ((((unsigned long)1952801890 << 16) << 16) + 2037671283) ^ ~seed; // 0x74656462, 0x79746573
    for (i = 0; i + sizeof(unsigned long) <= len; i += sizeof(unsigned long)) {
        data = d[0] | (d[1] << 8) | (d[2] << 16) | (d[3] << 24);
        data |= (unsigned long)(d[4] | (d[5] << 8) | (d[6] << 16) | (d[7] << 24)) << 16 << 16;
        v3 ^= data;
        for (j = 0; j < 1; ++j)
            do {
                v0 += v1;
                v1 = (((v1) << (13)) | ((v1) >> (((sizeof(unsigned long)) * 8) - (13))));
                v1 ^= v0;
                v0 = (((v0) << (((sizeof(unsigned long)) * 8) / 2))
                      | ((v0) >> (((sizeof(unsigned long)) * 8) - (((sizeof(unsigned long)) * 8) / 2))));
                v2 += v3;
                v3 = (((v3) << (16)) | ((v3) >> (((sizeof(unsigned long)) * 8) - (16))));
                v3 ^= v2;
                v2 += v1;
                v1 = (((v1) << (17)) | ((v1) >> (((sizeof(unsigned long)) * 8) - (17))));
                v1 ^= v2;
                v2 = (((v2) << (((sizeof(unsigned long)) * 8) / 2))
                      | ((v2) >> (((sizeof(unsigned long)) * 8) - (((sizeof(unsigned long)) * 8) / 2))));
                v0 += v3;
                v3 = (((v3) << (21)) | ((v3) >> (((sizeof(unsigned long)) * 8) - (21))));
                v3 ^= v0;
            }
            while (0);
        v0 ^= data;
        d += sizeof(unsigned long);
    }
    data = len << (((sizeof(unsigned long)) * 8) - 8);
    switch (len - i) {
        case 7:
            data |= ((unsigned long)d[6] << 24) << 24; // fall through
        case 6:
            data |= ((unsigned long)d[5] << 20) << 20; // fall through
        case 5:
            data |= ((unsigned long)d[4] << 16) << 16; // fall through
        case 4:
            data |= (d[3] << 24); // fall through
        case 3:
            data |= (d[2] << 16); // fall through
        case 2:
            data |= (d[1] << 8); // fall through
        case 1:
            data |= d[0]; // fall through
        case 0:
            break; // fall through
    }
    v3 ^= data;
    for (j = 0; j < 1; ++j)
        do {
            v0 += v1;
            v1 = (((v1) << (13)) | ((v1) >> (((sizeof(unsigned long)) * 8) - (13))));
            v1 ^= v0;
            v0 = (((v0) << (((sizeof(unsigned long)) * 8) / 2))
                  | ((v0) >> (((sizeof(unsigned long)) * 8) - (((sizeof(unsigned long)) * 8) / 2))));
            v2 += v3;
            v3 = (((v3) << (16)) | ((v3) >> (((sizeof(unsigned long)) * 8) - (16))));
            v3 ^= v2;
            v2 += v1;
            v1 = (((v1) << (17)) | ((v1) >> (((sizeof(unsigned long)) * 8) - (17))));
            v1 ^= v2;
            v2 = (((v2) << (((sizeof(unsigned long)) * 8) / 2))
                  | ((v2) >> (((sizeof(unsigned long)) * 8) - (((sizeof(unsigned long)) * 8) / 2))));
            v0 += v3;
            v3 = (((v3) << (21)) | ((v3) >> (((sizeof(unsigned long)) * 8) - (21))));
            v3 ^= v0;
        }
        while (0);
    v0 ^= data;
    v2 ^= 255;
    for (j = 0; j < 1; ++j)
        do {
            v0 += v1;
            v1 = (((v1) << (13)) | ((v1) >> (((sizeof(unsigned long)) * 8) - (13))));
            v1 ^= v0;
            v0 = (((v0) << (((sizeof(unsigned long)) * 8) / 2))
                  | ((v0) >> (((sizeof(unsigned long)) * 8) - (((sizeof(unsigned long)) * 8) / 2))));
            v2 += v3;
            v3 = (((v3) << (16)) | ((v3) >> (((sizeof(unsigned long)) * 8) - (16))));
            v3 ^= v2;
            v2 += v1;
            v1 = (((v1) << (17)) | ((v1) >> (((sizeof(unsigned long)) * 8) - (17))));
            v1 ^= v2;
            v2 = (((v2) << (((sizeof(unsigned long)) * 8) / 2))
                  | ((v2) >> (((sizeof(unsigned long)) * 8) - (((sizeof(unsigned long)) * 8) / 2))));
            v0 += v3;
            v3 = (((v3) << (21)) | ((v3) >> (((sizeof(unsigned long)) * 8) - (21))));
            v3 ^= v0;
        }
        while (0);
    return v1 ^ v2 ^ v3;
}

static unsigned long stbds_hash_bytes(void* p, unsigned long len, unsigned long seed) {
    unsigned char* d = (unsigned char*)p;
    if (len == 4) {
        unsigned int hash = d[0] | (d[1] << 8) | (d[2] << 16) | (d[3] << 24);
        hash ^= seed;
        hash = (hash ^ 61) ^ (hash >> 16);
        hash = hash + (hash << 3);
        hash = hash ^ (hash >> 4);
        hash = hash * 668265261;
        hash ^= seed;
        hash = hash ^ (hash >> 15);
        return (((unsigned long)hash << 16 << 16) | hash) ^ seed;
    }
    else if (len == 8 && sizeof(unsigned long) == 8) {
        unsigned long hash = d[0] | (d[1] << 8) | (d[2] << 16) | (d[3] << 24);
        hash |= (unsigned long)(d[4] | (d[5] << 8) | (d[6] << 16) | (d[7] << 24)) << 16 << 16;
        hash ^= seed;
        hash = (~hash) + (hash << 21);
        hash ^= (((hash) >> (24)) | ((hash) << (((sizeof(unsigned long)) * 8) - (24))));
        hash *= 265;
        hash ^= (((hash) >> (14)) | ((hash) << (((sizeof(unsigned long)) * 8) - (14))));
        hash ^= seed;
        hash *= 21;
        hash ^= (((hash) >> (28)) | ((hash) << (((sizeof(unsigned long)) * 8) - (28))));
        hash += (hash << 31);
        hash = (~hash) + (hash << 18);
        return hash;
    }
    else {
        return stbds_siphash_bytes(p, len, seed);
    }
}

static int stbds_is_key_equal(void* a, unsigned long elemsize, void* key, unsigned long keysize,
    unsigned long keyoffset, int mode, unsigned long i) {
    if (mode >= 1)
        return 0 == strcmp((char*)key, *(char**)((char*)a + elemsize * i + keyoffset));
    else
        return 0 == memcmp(key, (char*)a + elemsize * i + keyoffset, keysize);
}

static void stbds_strreset(struct stbds_string_arena* a);
void stbds_hmfree_func(void* a, unsigned long elemsize) {
    if (a == ((void*)0))
        return;
    if (((struct stbds_hash_index*)((struct stbds_array_header*)(a)-1)->hash_table) != ((void*)0)) {
        if (((struct stbds_hash_index*)((struct stbds_array_header*)(a)-1)->hash_table)->string.mode == 2) {
            unsigned long i;
            for (i = 1; i < ((struct stbds_array_header*)(a)-1)->length; ++i)
                free(*(char**)((char*)a + elemsize * i));
        }
        stbds_strreset(&((struct stbds_hash_index*)((struct stbds_array_header*)(a)-1)->hash_table)->string);
    }
    free(((struct stbds_array_header*)(a)-1)->hash_table);
    free(((struct stbds_array_header*)(a)-1));
}

static long stbds_hm_find_slot(
    void* a, unsigned long elemsize, void* key, unsigned long keysize, unsigned long keyoffset, int mode) {
    void* raw_a = ((char*)(a) - (elemsize));
    struct stbds_hash_index* table = ((struct stbds_hash_index*)((struct stbds_array_header*)(raw_a)-1)->hash_table);
    unsigned long hash =
        mode >= 1 ? stbds_hash_string((char*)key, table->seed) : stbds_hash_bytes(key, keysize, table->seed);
    unsigned long step = 8;
    unsigned long limit;
    unsigned long i;
    unsigned long pos;
    struct stbds_hash_bucket* bucket;
    if (hash < 2)
        hash += 2;
    pos = stbds_probe_position(hash, table->slot_count, table->slot_count_log2);
    for (;;) {
        bucket = &table->storage[pos >> (8 == 8 ? 3 : 2)];
        for (i = pos & (8 - 1); i < 8; ++i) {
            if (bucket->hash[i] == hash) {
                if (stbds_is_key_equal(a, elemsize, key, keysize, keyoffset, mode, bucket->index[i])) {
                    return (pos & ~(8 - 1)) + i;
                }
            }
            else if (bucket->hash[i] == 0) {
                return -1;
            }
        }
        limit = pos & (8 - 1);
        for (i = 0; i < limit; ++i) {
            if (bucket->hash[i] == hash) {
                if (stbds_is_key_equal(a, elemsize, key, keysize, keyoffset, mode, bucket->index[i])) {
                    return (pos & ~(8 - 1)) + i;
                }
            }
            else if (bucket->hash[i] == 0) {
                return -1;
            }
        }
        pos += step;
        step += 8;
        pos &= (table->slot_count - 1);
    }
}

static void* stbds_hmget_key_ts(
    void* a, unsigned long elemsize, void* key, unsigned long keysize, long* temp, int mode) {
    unsigned long keyoffset = 0;
    if (a == ((void*)0)) {
        a = stbds_arrgrowf(0, elemsize, 0, 1);
        ((struct stbds_array_header*)(a)-1)->length += 1;
        memset(a, 0, elemsize);
        *temp = -1;
        return ((char*)(a) + (elemsize));
    }
    else {
        struct stbds_hash_index* table;
        void* raw_a = ((char*)(a) - (elemsize));
        table = (struct stbds_hash_index*)((struct stbds_array_header*)(raw_a)-1)->hash_table;
        if (table == 0) {
            *temp = -1;
        }
        else {
            long slot = stbds_hm_find_slot(a, elemsize, key, keysize, keyoffset, mode);
            if (slot < 0) {
                *temp = -1;
            }
            else {
                struct stbds_hash_bucket* b = &table->storage[slot >> (8 == 8 ? 3 : 2)];
                *temp = b->index[slot & (8 - 1)];
            }
        }
        return a;
    }
}

void* stbds_hmget_key(void* a, unsigned long elemsize, void* key, unsigned long keysize, int mode) {
    long temp;
    void* p = stbds_hmget_key_ts(a, elemsize, key, keysize, &temp, mode);
    ((struct stbds_array_header*)(((char*)(p) - (elemsize))) - 1)->temp = temp;
    return p;
}

static char* stbds_strdup(char* str);
static char* stbds_stralloc(struct stbds_string_arena* a, char* str);
void* stbds_hmput_key(void* a, unsigned long elemsize, void* key, unsigned long keysize, int mode) {
    unsigned long keyoffset = 0;
    void* raw_a;
    struct stbds_hash_index* table;
    if (a == ((void*)0)) {
        a = stbds_arrgrowf(0, elemsize, 0, 1);
        memset(a, 0, elemsize);
        ((struct stbds_array_header*)(a)-1)->length += 1;
        a = ((char*)(a) + (elemsize));
    }
    raw_a = a;
    a = ((char*)(a) - (elemsize));
    table = (struct stbds_hash_index*)((struct stbds_array_header*)(a)-1)->hash_table;
    if (table == ((void*)0) || table->used_count >= table->used_count_threshold) {
        struct stbds_hash_index* nt;
        unsigned long slot_count;
        slot_count = (table == ((void*)0)) ? 8 : table->slot_count * 2;
        nt = stbds_make_hash_index(slot_count, table);
        if (table)
            free(table);
        else
            nt->string.mode = mode >= 1 ? 1 : 0;
        ((struct stbds_array_header*)(a)-1)->hash_table = table = nt;
    }
    {
        unsigned long hash =
            mode >= 1 ? stbds_hash_string((char*)key, table->seed) : stbds_hash_bytes(key, keysize, table->seed);
        unsigned long step = 8;
        unsigned long pos;
        long tombstone = -1;
        struct stbds_hash_bucket* bucket;
        if (hash < 2)
            hash += 2;
        pos = stbds_probe_position(hash, table->slot_count, table->slot_count_log2);
        for (;;) {
            unsigned long limit;
            unsigned long i;
            bucket = &table->storage[pos >> (8 == 8 ? 3 : 2)];
            for (i = pos & (8 - 1); i < 8; ++i) {
                if (bucket->hash[i] == hash) {
                    if (stbds_is_key_equal(raw_a, elemsize, key, keysize, keyoffset, mode, bucket->index[i])) {
                        ((struct stbds_array_header*)(a)-1)->temp = bucket->index[i];
                        if (mode >= 1)
                            (*(char**)((struct stbds_array_header*)(a)-1)->hash_table) =
                                *(char**)((char*)raw_a + elemsize * bucket->index[i] + keyoffset);
                        return ((char*)(a) + (elemsize));
                    }
                }
                else if (bucket->hash[i] == 0) {
                    pos = (pos & ~(8 - 1)) + i;
                    goto found_empty_slot;
                }
                else if (tombstone < 0) {
                    if (bucket->index[i] == -2)
                        tombstone = (long)((pos & ~(8 - 1)) + i);
                }
            }
            limit = pos & (8 - 1);
            for (i = 0; i < limit; ++i) {
                if (bucket->hash[i] == hash) {
                    if (stbds_is_key_equal(raw_a, elemsize, key, keysize, keyoffset, mode, bucket->index[i])) {
                        ((struct stbds_array_header*)(a)-1)->temp = bucket->index[i];
                        return ((char*)(a) + (elemsize));
                    }
                }
                else if (bucket->hash[i] == 0) {
                    pos = (pos & ~(8 - 1)) + i;
                    goto found_empty_slot;
                }
                else if (tombstone < 0) {
                    if (bucket->index[i] == -2)
                        tombstone = (long)((pos & ~(8 - 1)) + i);
                }
            }
            pos += step;
            step += 8;
            pos &= (table->slot_count - 1);
        }
    found_empty_slot:
        if (tombstone >= 0) {
            pos = tombstone;
            --table->tombstone_count;
        }
        ++table->used_count;
        {
            long i = (long)((a) ? (long)((struct stbds_array_header*)(a)-1)->length : 0);
            if ((unsigned long)i + 1 > ((a) ? ((struct stbds_array_header*)(a)-1)->capacity : 0))
                *(void**)&a = stbds_arrgrowf(a, elemsize, 1, 0);
            raw_a = ((char*)(a) + (elemsize));
            ((struct stbds_array_header*)(a)-1)->length = i + 1;
            bucket = &table->storage[pos >> (8 == 8 ? 3 : 2)];
            bucket->hash[pos & (8 - 1)] = hash;
            bucket->index[pos & (8 - 1)] = i - 1;
            ((struct stbds_array_header*)(a)-1)->temp = i - 1;
            switch (table->string.mode) {
                case STBDS_SH_STRDUP:
                    (*(char**)((struct stbds_array_header*)(a)-1)->hash_table) = *(char**)((char*)a + elemsize * i) =
                        stbds_strdup((char*)key);
                    break;
                case STBDS_SH_ARENA:
                    (*(char**)((struct stbds_array_header*)(a)-1)->hash_table) = *(char**)((char*)a + elemsize * i) =
                        stbds_stralloc(&table->string, (char*)key);
                    break;
                case STBDS_SH_DEFAULT:
                    (*(char**)((struct stbds_array_header*)(a)-1)->hash_table) = *(char**)((char*)a + elemsize * i) =
                        (char*)key;
                    break;
                default:
                    memcpy((char*)a + elemsize * i, key, keysize);
                    break;
            }
        }
        return ((char*)(a) + (elemsize));
    }
}

void* stbds_hmdel_key(
    void* a, unsigned long elemsize, void* key, unsigned long keysize, unsigned long keyoffset, int mode) {
    if (a == ((void*)0)) {
        return 0;
    }
    else {
        struct stbds_hash_index* table;
        void* raw_a = ((char*)(a) - (elemsize));
        table = (struct stbds_hash_index*)((struct stbds_array_header*)(raw_a)-1)->hash_table;
        ((struct stbds_array_header*)(raw_a)-1)->temp = 0;
        if (table == 0) {
            return a;
        }
        else {
            long slot;
            slot = stbds_hm_find_slot(a, elemsize, key, keysize, keyoffset, mode);
            if (slot < 0)
                return a;
            else {
                struct stbds_hash_bucket* b = &table->storage[slot >> (8 == 8 ? 3 : 2)];
                int i = slot & (8 - 1);
                long old_index = b->index[i];
                long final_index = (long)((raw_a) ? (long)((struct stbds_array_header*)(raw_a)-1)->length : 0) - 1 - 1;
                --table->used_count;
                ++table->tombstone_count;
                ((struct stbds_array_header*)(raw_a)-1)->temp = 1;
                b->hash[i] = 1;
                b->index[i] = -2;
                if (mode == 1 && table->string.mode == 2)
                    free(*(char**)((char*)a + elemsize * old_index));
                if (old_index != final_index) {
                    memmove((char*)a + elemsize * old_index, (char*)a + elemsize * final_index, elemsize);
                    if (mode == 1)
                        slot = stbds_hm_find_slot(a, elemsize, *(char**)((char*)a + elemsize * old_index + keyoffset),
                            keysize, keyoffset, mode);
                    else
                        slot = stbds_hm_find_slot(
                            a, elemsize, (char*)a + elemsize * old_index + keyoffset, keysize, keyoffset, mode);
                    b = &table->storage[slot >> (8 == 8 ? 3 : 2)];
                    i = slot & (8 - 1);
                    b->index[i] = old_index;
                }
                ((struct stbds_array_header*)(raw_a)-1)->length -= 1;
                if (table->used_count < table->used_count_shrink_threshold && table->slot_count > 8) {
                    ((struct stbds_array_header*)(raw_a)-1)->hash_table =
                        stbds_make_hash_index(table->slot_count >> 1, table);
                    free(table);
                }
                else if (table->tombstone_count > table->tombstone_count_threshold) {
                    ((struct stbds_array_header*)(raw_a)-1)->hash_table =
                        stbds_make_hash_index(table->slot_count, table);
                    free(table);
                }
                return a;
            }
        }
    }
}

static char* stbds_strdup(char* str) {
    unsigned long len = strlen(str) + 1;
    char* p = (char*)realloc(0, len);
    memmove(p, str, len);
    return p;
}

static char* stbds_stralloc(struct stbds_string_arena* a, char* str) {
    char* p;
    unsigned long len = strlen(str) + 1;
    if (len > a->remaining) {
        unsigned long blocksize = a->block;
        blocksize = (unsigned long)(512u) << (blocksize >> 1);
        if (blocksize < (unsigned long)((1u << 20)))
            ++a->block;
        if (len > blocksize) {
            struct stbds_string_block* sb = (struct stbds_string_block*)realloc(0, sizeof(*sb) - 8 + len);
            memmove(sb->storage, str, len);
            if (a->storage) {
                sb->next = a->storage->next;
                a->storage->next = sb;
            }
            else {
                sb->next = 0;
                a->storage = sb;
                a->remaining = 0;
            }
            return sb->storage;
        }
        else {
            struct stbds_string_block* sb = (struct stbds_string_block*)realloc(0, sizeof(*sb) - 8 + blocksize);
            sb->next = a->storage;
            a->storage = sb;
            a->remaining = blocksize;
        }
    }
    p = a->storage->storage + a->remaining - len;
    a->remaining -= len;
    memmove(p, str, len);
    return p;
}

static void stbds_strreset(struct stbds_string_arena* a) {
    struct stbds_string_block* x;
    struct stbds_string_block* y;
    x = a->storage;
    while (x) {
        y = x->next;
        free(x);
        x = y;
    }
    memset(a, 0, sizeof(*a));
}
