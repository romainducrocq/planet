type struc stbds_array_header(    length: u64    , capacity: u64    , hash_table: *any    , temp: i64    )
extrn fn stbds_hash_string(str: string, seed: u64) u64;
extrn fn stbds_arrgrowf(a: *any, elemsize: u64, addlen: u64, min_cap: u64) *any;
extrn fn stbds_hmfree_func(p: *any, elemsize: u64) none;
extrn fn stbds_hmget_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmput_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any;
extrn fn stbds_hmdel_key(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32) *any;

extrn fn strtoimax(nptr: string, endptr: *string, base: i32) i64;
extrn fn strtoumax(nptr: string, endptr: *string, base: i32) u64;
type struc FILE;
extrn fn fclose(stream: *struc FILE) i32;
extrn fn fflush(stream: *struc FILE) i32;
extrn fn fopen(filename: string, mode: string) *struc FILE;
extrn fn fwrite(ptr: *any, size: u64, nmemb: u64, stream: *struc FILE) u64;
extrn fn printf(format: string, arg1: string) i32;
extrn fn snprintf(s: string, n: u64, format: string, arg1: string, arg2: string, arg3: string, arg4: string) i32;
extrn fn sprintf(s: string, format: string, arg1: u32) i32;
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
pub fn stbds_arrgrowf(a: *any, elemsize: u64, addlen: u64, min_cap: u64) *any {
    temp: struc stbds_array_header = $(0)
    b: *any;
    min_len: u64 = (? (a) then cast<i64>((cast<*struc stbds_array_header>((a)) - 1)[].length) else 0) + addlen
    cast<none>(sizeof(temp))
    if min_len > min_cap {
        min_cap = min_len
    }
    if min_cap <= (? (a) then (cast<*struc stbds_array_header>((a)) - 1)[].capacity else 0) {
        return a
    }
    if min_cap < 2 * (? (a) then (cast<*struc stbds_array_header>((a)) - 1)[].capacity else 0) {
        min_cap = 2 * (? (a) then (cast<*struc stbds_array_header>((a)) - 1)[].capacity else 0)
    }
    elif min_cap < 4 {
        min_cap = 4
    }
    b = realloc(? (a) then (cast<*struc stbds_array_header>((a)) - 1) else 0, elemsize * min_cap + sizeof<struc stbds_array_header>)
    b = cast<string>(b) + sizeof<struc stbds_array_header>
    if a == (cast<*any>(0)) {
        (cast<*struc stbds_array_header>((b)) - 1)[].length = 0
        (cast<*struc stbds_array_header>((b)) - 1)[].hash_table = 0
        (cast<*struc stbds_array_header>((b)) - 1)[].temp = 0
    }
    (cast<*struc stbds_array_header>((b)) - 1)[].capacity = min_cap
    return b
}
type struc stbds_string_block(    next: *struc stbds_string_block    , storage: [8]char    )
type struc stbds_string_arena(    storage: *struc stbds_string_block    , remaining: u64    , block: u8    , mode: u8    )
type struc stbds_hash_bucket(    hash: [8]u64    , index: [8]i64    )
type struc stbds_hash_index(    temp_key: string    , slot_count: u64    , used_count: u64    , used_count_threshold: u64    , used_count_shrink_threshold: u64    , tombstone_count: u64    , tombstone_count_threshold: u64    , seed: u64    , slot_count_log2: u64    , string: struc stbds_string_arena    , storage: *struc stbds_hash_bucket    )
stbds_hash_seed: u64 = 826366246
fn stbds_probe_position(hash: u64, slot_count: u64, slot_log2: u64) u64 {
    pos: u64;
    cast<none>(sizeof(slot_log2))
    pos = hash & (slot_count - 1)
    return pos
}
fn stbds_log2(slot_count: u64) u64 {
    n: u64 = 0
    loop while slot_count > 1 {
        slot_count >>= 1
        ++n
    }
    return n
}
fn stbds_make_hash_index(slot_count: u64, ot: *struc stbds_hash_index) *struc stbds_hash_index {
    t: *struc stbds_hash_index;
    t = cast<*struc stbds_hash_index>(realloc(0,         (slot_count >> (? 8 == 8 then 3 else 2)) * sizeof<struc stbds_hash_bucket> + sizeof<struc stbds_hash_index> + 64 - 1))
    t[].storage = cast<*struc stbds_hash_bucket>((((cast<u64>((t + 1))) + (64) - 1) & ~((64) - 1)))
    t[].slot_count = slot_count
    t[].slot_count_log2 = stbds_log2(slot_count)
    t[].tombstone_count = 0
    t[].used_count = 0
    t[].used_count_threshold = slot_count - (slot_count >> 2)
    t[].tombstone_count_threshold = (slot_count >> 3) + (slot_count >> 4)
    t[].used_count_shrink_threshold = slot_count >> 2
    if slot_count <= 8 {
        t[].used_count_shrink_threshold = 0
    }
    if ot {
        t[].string = ot[].string
        t[].seed = ot[].seed
    }
    else {
        a: u64;
        b: u64;
        temp: u64;
        memset(@t[].string, 0, sizeof(t[].string))
        t[].seed = stbds_hash_seed
        temp = 2276503805 ^ 2147001325
        temp <<= 16
        temp <<= 16
        temp >>= 16
        temp >>= 16
        a = 666578662
        a <<= 16
        a <<= 16
        a ^= temp ^ 2147001325
        temp = 3037000493 ^ 715136305
        temp <<= 16
        temp <<= 16
        temp >>= 16
        temp >>= 16
        b = 0
        b <<= 16
        b <<= 16
        b ^= temp ^ 715136305
        stbds_hash_seed = stbds_hash_seed * a + b
    }
    {
        i: u64;
        j: u64;
        loop i = 0 while i < slot_count >> (? 8 == 8 then 3 else 2) .. ++i {
            b: *struc stbds_hash_bucket = @t[].storage[i]
            loop j = 0 while j < 8 .. ++j {
                b[].hash[j] = 0
            }
            loop j = 0 while j < 8 .. ++j {
                b[].index[j] = -1
            }
        }
    }
    if ot {
        i: u64;
        j: u64;
        t[].used_count = ot[].used_count
        loop i = 0 while i < ot[].slot_count >> (? 8 == 8 then 3 else 2) .. ++i {
            ob: *struc stbds_hash_bucket = @ot[].storage[i]
            loop j = 0 while j < 8 .. ++j {
                if ((ob[].index[j]) >= 0) {
                    hash: u64 = ob[].hash[j]
                    pos: u64 = stbds_probe_position(hash, t[].slot_count, t[].slot_count_log2)
                    step: u64 = 8
                    loop {
                        limit: u64;
                        z: u64;
                        bucket: *struc stbds_hash_bucket;
                        bucket = @t[].storage[pos >> (? 8 == 8 then 3 else 2)]
                        loop z = pos & (8 - 1) while z < 8 .. ++z {
                            if bucket[].hash[z] == 0 {
                                bucket[].hash[z] = hash
                                bucket[].index[z] = ob[].index[j]
                                jump done
                            }
                        }
                        limit = pos & (8 - 1)
                        loop z = 0 while z < limit .. ++z {
                            if bucket[].hash[z] == 0 {
                                bucket[].hash[z] = hash
                                bucket[].index[z] = ob[].index[j]
                                jump done
                            }
                        }
                        pos += step
                        step += 8
                        pos &= (t[].slot_count - 1)
                    }
                }
                label done
                ;
            }
        }
    }
    return t
}
pub fn stbds_hash_string(str: string, seed: u64) u64 {
    hash: u64 = seed
    loop while str[] {
        hash = (((hash) << (9)) | ((hash) >> (((sizeof<u64>) * 8) - (9)))) + cast<u8>(str++[])
    }
    hash ^= seed
    hash = (~hash) + (hash << 18)
    hash ^= hash ^ (((hash) >> (31)) | ((hash) << (((sizeof<u64>) * 8) - (31))))
    hash = hash * 21
    hash ^= hash ^ (((hash) >> (11)) | ((hash) << (((sizeof<u64>) * 8) - (11))))
    hash += (hash << 6)
    hash ^= (((hash) >> (22)) | ((hash) << (((sizeof<u64>) * 8) - (22))))
    return hash + seed
}
fn stbds_siphash_bytes(p: *any, len: u64, seed: u64) u64 {
    d: *u8 = cast<*u8>(p)
    i: u64;
    j: u64;
    v0: u64;
    v1: u64;
    v2: u64;
    v3: u64;
    data: u64;
    v0 = (((cast<u64>(1936682341) << 16) << 16) + 1886610805) ^ seed
    v1 = (((cast<u64>(1685025377) << 16) << 16) + 1852075885) ^ ~seed
    v2 = (((cast<u64>(1819895653) << 16) << 16) + 1852142177) ^ seed
    v3 = (((cast<u64>(1952801890) << 16) << 16) + 2037671283) ^ ~seed
    loop i = 0 while i + sizeof<u64> <= len .. i += sizeof<u64> {
        data = d[0] | (d[1] << 8) | (d[2] << 16) | (d[3] << 24)
        data |= cast<u64>((d[4] | (d[5] << 8) | (d[6] << 16) | (d[7] << 24))) << 16 << 16
        v3 ^= data
        loop j = 0 while j < 1 .. ++j {
            loop .. while 0 {
                v0 += v1
                v1 = (((v1) << (13)) | ((v1) >> (((sizeof<u64>) * 8) - (13))))
                v1 ^= v0
                v0 = (((v0) << (((sizeof<u64>) * 8) / 2))                     | ((v0) >> (((sizeof<u64>) * 8) - (((sizeof<u64>) * 8) / 2))))
                v2 += v3
                v3 = (((v3) << (16)) | ((v3) >> (((sizeof<u64>) * 8) - (16))))
                v3 ^= v2
                v2 += v1
                v1 = (((v1) << (17)) | ((v1) >> (((sizeof<u64>) * 8) - (17))))
                v1 ^= v2
                v2 = (((v2) << (((sizeof<u64>) * 8) / 2))                     | ((v2) >> (((sizeof<u64>) * 8) - (((sizeof<u64>) * 8) / 2))))
                v0 += v3
                v3 = (((v3) << (21)) | ((v3) >> (((sizeof<u64>) * 8) - (21))))
                v3 ^= v0
            }        
        }
        v0 ^= data
        d += sizeof<u64>
    }
    data = len << (((sizeof<u64>) * 8) - 8)
    match len - i {
        -> 7 {
            data |= (cast<u64>(d[6]) << 24) << 24
        }
        -> 6 {
            data |= (cast<u64>(d[5]) << 20) << 20
        }
        -> 5 {
            data |= (cast<u64>(d[4]) << 16) << 16
        }
        -> 4 {
            data |= (d[3] << 24)
        }
        -> 3 {
            data |= (d[2] << 16)
        }
        -> 2 {
            data |= (d[1] << 8)
        }
        -> 1 {
            data |= d[0]
        }
        -> 0 {
            break
        }
    }
    v3 ^= data
    loop j = 0 while j < 1 .. ++j {
        loop .. while 0 {
            v0 += v1
            v1 = (((v1) << (13)) | ((v1) >> (((sizeof<u64>) * 8) - (13))))
            v1 ^= v0
            v0 = (((v0) << (((sizeof<u64>) * 8) / 2))                 | ((v0) >> (((sizeof<u64>) * 8) - (((sizeof<u64>) * 8) / 2))))
            v2 += v3
            v3 = (((v3) << (16)) | ((v3) >> (((sizeof<u64>) * 8) - (16))))
            v3 ^= v2
            v2 += v1
            v1 = (((v1) << (17)) | ((v1) >> (((sizeof<u64>) * 8) - (17))))
            v1 ^= v2
            v2 = (((v2) << (((sizeof<u64>) * 8) / 2))                 | ((v2) >> (((sizeof<u64>) * 8) - (((sizeof<u64>) * 8) / 2))))
            v0 += v3
            v3 = (((v3) << (21)) | ((v3) >> (((sizeof<u64>) * 8) - (21))))
            v3 ^= v0
        }    
    }
    v0 ^= data
    v2 ^= 255
    loop j = 0 while j < 1 .. ++j {
        loop .. while 0 {
            v0 += v1
            v1 = (((v1) << (13)) | ((v1) >> (((sizeof<u64>) * 8) - (13))))
            v1 ^= v0
            v0 = (((v0) << (((sizeof<u64>) * 8) / 2))                 | ((v0) >> (((sizeof<u64>) * 8) - (((sizeof<u64>) * 8) / 2))))
            v2 += v3
            v3 = (((v3) << (16)) | ((v3) >> (((sizeof<u64>) * 8) - (16))))
            v3 ^= v2
            v2 += v1
            v1 = (((v1) << (17)) | ((v1) >> (((sizeof<u64>) * 8) - (17))))
            v1 ^= v2
            v2 = (((v2) << (((sizeof<u64>) * 8) / 2))                 | ((v2) >> (((sizeof<u64>) * 8) - (((sizeof<u64>) * 8) / 2))))
            v0 += v3
            v3 = (((v3) << (21)) | ((v3) >> (((sizeof<u64>) * 8) - (21))))
            v3 ^= v0
        }    
    }
    return v1 ^ v2 ^ v3
}
fn stbds_hash_bytes(p: *any, len: u64, seed: u64) u64 {
    d: *u8 = cast<*u8>(p)
    if len == 4 {
        hash: u32 = d[0] | (d[1] << 8) | (d[2] << 16) | (d[3] << 24)
        hash ^= seed
        hash = (hash ^ 61) ^ (hash >> 16)
        hash = hash + (hash << 3)
        hash = hash ^ (hash >> 4)
        hash = hash * 668265261
        hash ^= seed
        hash = hash ^ (hash >> 15)
        return ((cast<u64>(hash) << 16 << 16) | hash) ^ seed
    }
    elif len == 8 and sizeof<u64> == 8 {
        hash: u64 = d[0] | (d[1] << 8) | (d[2] << 16) | (d[3] << 24)
        hash |= cast<u64>((d[4] | (d[5] << 8) | (d[6] << 16) | (d[7] << 24))) << 16 << 16
        hash ^= seed
        hash = (~hash) + (hash << 21)
        hash ^= (((hash) >> (24)) | ((hash) << (((sizeof<u64>) * 8) - (24))))
        hash *= 265
        hash ^= (((hash) >> (14)) | ((hash) << (((sizeof<u64>) * 8) - (14))))
        hash ^= seed
        hash *= 21
        hash ^= (((hash) >> (28)) | ((hash) << (((sizeof<u64>) * 8) - (28))))
        hash += (hash << 31)
        hash = (~hash) + (hash << 18)
        return hash
    }
    else {
        return stbds_siphash_bytes(p, len, seed)
    }
}
fn stbds_is_key_equal(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32, i: u64) i32 {
    if mode >= 1 {
        return 0 == strcmp(cast<string>(key), cast<*string>((cast<string>(a) + elemsize * i + keyoffset))[])
    }
    else {
        return 0 == memcmp(key, cast<string>(a) + elemsize * i + keyoffset, keysize)
    }
}
fn stbds_strreset(a: *struc stbds_string_arena) none;
pub fn stbds_hmfree_func(a: *any, elemsize: u64) none {
    if a == (cast<*any>(0)) {
        return none
    }
    if (cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)) ~= (cast<*any>(0)) {
        if (cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table))[].string.mode == 2 {
            i: u64;
            loop i = 1 while i < (cast<*struc stbds_array_header>((a)) - 1)[].length .. ++i {
                free(cast<*string>((cast<string>(a) + elemsize * i))[])
            }
        }
        stbds_strreset(@(cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table))[].string)
    }
    free((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)
    free((cast<*struc stbds_array_header>((a)) - 1))
}
fn stbds_hm_find_slot(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32) i64 {
    raw_a: *any = (cast<string>((a)) - (elemsize))
    table: *struc stbds_hash_index = (cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((raw_a)) - 1)[].hash_table))
    hash: u64 = ? mode >= 1 then stbds_hash_string(cast<string>(key), table[].seed) else stbds_hash_bytes(key, keysize, table[].seed)
    step: u64 = 8
    limit: u64;
    i: u64;
    pos: u64;
    bucket: *struc stbds_hash_bucket;
    if hash < 2 {
        hash += 2
    }
    pos = stbds_probe_position(hash, table[].slot_count, table[].slot_count_log2)
    loop {
        bucket = @table[].storage[pos >> (? 8 == 8 then 3 else 2)]
        loop i = pos & (8 - 1) while i < 8 .. ++i {
            if bucket[].hash[i] == hash {
                if stbds_is_key_equal(a, elemsize, key, keysize, keyoffset, mode, bucket[].index[i]) {
                    return (pos & ~(8 - 1)) + i
                }
            }
            elif bucket[].hash[i] == 0 {
                return -1
            }
        }
        limit = pos & (8 - 1)
        loop i = 0 while i < limit .. ++i {
            if bucket[].hash[i] == hash {
                if stbds_is_key_equal(a, elemsize, key, keysize, keyoffset, mode, bucket[].index[i]) {
                    return (pos & ~(8 - 1)) + i
                }
            }
            elif bucket[].hash[i] == 0 {
                return -1
            }
        }
        pos += step
        step += 8
        pos &= (table[].slot_count - 1)
    }
}
fn stbds_hmget_key_ts(a: *any, elemsize: u64, key: *any, keysize: u64, temp: *i64, mode: i32) *any {
    keyoffset: u64 = 0
    if a == (cast<*any>(0)) {
        a = stbds_arrgrowf(0, elemsize, 0, 1)
        (cast<*struc stbds_array_header>((a)) - 1)[].length += 1
        memset(a, 0, elemsize)
        temp[] = -1
        return (cast<string>((a)) + (elemsize))
    }
    else {
        table: *struc stbds_hash_index;
        raw_a: *any = (cast<string>((a)) - (elemsize))
        table = cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((raw_a)) - 1)[].hash_table)
        if table == 0 {
            temp[] = -1
        }
        else {
            slot: i64 = stbds_hm_find_slot(a, elemsize, key, keysize, keyoffset, mode)
            if slot < 0 {
                temp[] = -1
            }
            else {
                b: *struc stbds_hash_bucket = @table[].storage[slot >> (? 8 == 8 then 3 else 2)]
                temp[] = b[].index[slot & (8 - 1)]
            }
        }
        return a
    }
}
pub fn stbds_hmget_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any {
    temp: i64;
    p: *any = stbds_hmget_key_ts(a, elemsize, key, keysize, @temp, mode)
    (cast<*struc stbds_array_header>(((cast<string>((p)) - (elemsize)))) - 1)[].temp = temp
    return p
}
fn stbds_strdup(str: string) string;
fn stbds_stralloc(a: *struc stbds_string_arena, str: string) string;
pub fn stbds_hmput_key(a: *any, elemsize: u64, key: *any, keysize: u64, mode: i32) *any {
    keyoffset: u64 = 0
    raw_a: *any;
    table: *struc stbds_hash_index;
    if a == (cast<*any>(0)) {
        a = stbds_arrgrowf(0, elemsize, 0, 1)
        memset(a, 0, elemsize)
        (cast<*struc stbds_array_header>((a)) - 1)[].length += 1
        a = (cast<string>((a)) + (elemsize))
    }
    raw_a = a
    a = (cast<string>((a)) - (elemsize))
    table = cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)
    if table == (cast<*any>(0)) or table[].used_count >= table[].used_count_threshold {
        nt: *struc stbds_hash_index;
        slot_count: u64;
        slot_count = ? (table == (cast<*any>(0))) then 8 else table[].slot_count * 2
        nt = stbds_make_hash_index(slot_count, table)
        if table {
            free(table)
        }
        else {
            nt[].string.mode = ? mode >= 1 then 1 else 0
        }
        (cast<*struc stbds_array_header>((a)) - 1)[].hash_table = table = nt
    }
    {
        hash: u64 = ? mode >= 1 then stbds_hash_string(cast<string>(key), table[].seed) else stbds_hash_bytes(key, keysize, table[].seed)
        step: u64 = 8
        pos: u64;
        tombstone: i64 = -1
        bucket: *struc stbds_hash_bucket;
        if hash < 2 {
            hash += 2
        }
        pos = stbds_probe_position(hash, table[].slot_count, table[].slot_count_log2)
        loop {
            limit: u64;
            i: u64;
            bucket = @table[].storage[pos >> (? 8 == 8 then 3 else 2)]
            loop i = pos & (8 - 1) while i < 8 .. ++i {
                if bucket[].hash[i] == hash {
                    if stbds_is_key_equal(raw_a, elemsize, key, keysize, keyoffset, mode, bucket[].index[i]) {
                        (cast<*struc stbds_array_header>((a)) - 1)[].temp = bucket[].index[i]
                        if mode >= 1 {
                            (cast<*string>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)[]) =                             cast<*string>((cast<string>(raw_a) + elemsize * bucket[].index[i] + keyoffset))[]
                        }
                        return (cast<string>((a)) + (elemsize))
                    }
                }
                elif bucket[].hash[i] == 0 {
                    pos = (pos & ~(8 - 1)) + i
                    jump found_empty_slot
                }
                elif tombstone < 0 {
                    if bucket[].index[i] == -2 {
                        tombstone = cast<i64>(((pos & ~(8 - 1)) + i))
                    }
                }
            }
            limit = pos & (8 - 1)
            loop i = 0 while i < limit .. ++i {
                if bucket[].hash[i] == hash {
                    if stbds_is_key_equal(raw_a, elemsize, key, keysize, keyoffset, mode, bucket[].index[i]) {
                        (cast<*struc stbds_array_header>((a)) - 1)[].temp = bucket[].index[i]
                        return (cast<string>((a)) + (elemsize))
                    }
                }
                elif bucket[].hash[i] == 0 {
                    pos = (pos & ~(8 - 1)) + i
                    jump found_empty_slot
                }
                elif tombstone < 0 {
                    if bucket[].index[i] == -2 {
                        tombstone = cast<i64>(((pos & ~(8 - 1)) + i))
                    }
                }
            }
            pos += step
            step += 8
            pos &= (table[].slot_count - 1)
        }
        label found_empty_slot
        if tombstone >= 0 {
            pos = tombstone
            --table[].tombstone_count
        }
        ++table[].used_count
        {
            i: i64 = cast<i64>((? (a) then cast<i64>((cast<*struc stbds_array_header>((a)) - 1)[].length) else 0))
            if cast<u64>(i) + 1 > (? (a) then (cast<*struc stbds_array_header>((a)) - 1)[].capacity else 0) {
                cast<**any>(@a)[] = stbds_arrgrowf(a, elemsize, 1, 0)
            }
            raw_a = (cast<string>((a)) + (elemsize))
            (cast<*struc stbds_array_header>((a)) - 1)[].length = i + 1
            bucket = @table[].storage[pos >> (? 8 == 8 then 3 else 2)]
            bucket[].hash[pos & (8 - 1)] = hash
            bucket[].index[pos & (8 - 1)] = i - 1
            (cast<*struc stbds_array_header>((a)) - 1)[].temp = i - 1
            match table[].string.mode {
                -> 2 {
                    (cast<*string>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)[]) = cast<*string>((cast<string>(a) + elemsize * i))[] =                     stbds_strdup(cast<string>(key))
                }
                break
                -> 3 {
                    (cast<*string>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)[]) = cast<*string>((cast<string>(a) + elemsize * i))[] =                     stbds_stralloc(@table[].string, cast<string>(key))
                }
                break
                -> 1 {
                    (cast<*string>((cast<*struc stbds_array_header>((a)) - 1)[].hash_table)[]) = cast<*string>((cast<string>(a) + elemsize * i))[] =                     cast<string>(key)
                }
                break
                otherwise {
                    memcpy(cast<string>(a) + elemsize * i, key, keysize)
                }
                break
            }
        }
        return (cast<string>((a)) + (elemsize))
    }
}
pub fn stbds_hmdel_key(a: *any, elemsize: u64, key: *any, keysize: u64, keyoffset: u64, mode: i32) *any {
    if a == (cast<*any>(0)) {
        return 0
    }
    else {
        table: *struc stbds_hash_index;
        raw_a: *any = (cast<string>((a)) - (elemsize))
        table = cast<*struc stbds_hash_index>((cast<*struc stbds_array_header>((raw_a)) - 1)[].hash_table)
        (cast<*struc stbds_array_header>((raw_a)) - 1)[].temp = 0
        if table == 0 {
            return a
        }
        else {
            slot: i64;
            slot = stbds_hm_find_slot(a, elemsize, key, keysize, keyoffset, mode)
            if slot < 0 {
                return a
            }
            else {
                b: *struc stbds_hash_bucket = @table[].storage[slot >> (? 8 == 8 then 3 else 2)]
                i: i32 = slot & (8 - 1)
                old_index: i64 = b[].index[i]
                final_index: i64 = cast<i64>((? (raw_a) then cast<i64>((cast<*struc stbds_array_header>((raw_a)) - 1)[].length) else 0)) - 1 - 1
                --table[].used_count
                ++table[].tombstone_count
                (cast<*struc stbds_array_header>((raw_a)) - 1)[].temp = 1
                b[].hash[i] = 1
                b[].index[i] = -2
                if mode == 1 and table[].string.mode == 2 {
                    free(cast<*string>((cast<string>(a) + elemsize * old_index))[])
                }
                if old_index ~= final_index {
                    memmove(cast<string>(a) + elemsize * old_index, cast<string>(a) + elemsize * final_index, elemsize)
                    if mode == 1 {
                        slot = stbds_hm_find_slot(a, elemsize, cast<*string>((cast<string>(a) + elemsize * old_index + keyoffset))[],                             keysize, keyoffset, mode)
                    }
                    else {
                        slot = stbds_hm_find_slot(                            a, elemsize, cast<string>(a) + elemsize * old_index + keyoffset, keysize, keyoffset, mode)
                    }
                    b = @table[].storage[slot >> (? 8 == 8 then 3 else 2)]
                    i = slot & (8 - 1)
                    b[].index[i] = old_index
                }
                (cast<*struc stbds_array_header>((raw_a)) - 1)[].length -= 1
                if table[].used_count < table[].used_count_shrink_threshold and table[].slot_count > 8 {
                    (cast<*struc stbds_array_header>((raw_a)) - 1)[].hash_table =                     stbds_make_hash_index(table[].slot_count >> 1, table)
                    free(table)
                }
                elif table[].tombstone_count > table[].tombstone_count_threshold {
                    (cast<*struc stbds_array_header>((raw_a)) - 1)[].hash_table =                     stbds_make_hash_index(table[].slot_count, table)
                    free(table)
                }
                return a
            }
        }
    }
}
fn stbds_strdup(str: string) string {
    len: u64 = strlen(str) + 1
    p: string = cast<string>(realloc(0, len))
    memmove(p, str, len)
    return p
}
fn stbds_stralloc(a: *struc stbds_string_arena, str: string) string {
    p: string;
    len: u64 = strlen(str) + 1
    if len > a[].remaining {
        blocksize: u64 = a[].block
        blocksize = cast<u64>((512u)) << (blocksize >> 1)
        if blocksize < cast<u64>(((1u << 20))) {
            ++a[].block
        }
        if len > blocksize {
            sb: *struc stbds_string_block = cast<*struc stbds_string_block>(realloc(0, sizeof(sb[]) - 8 + len))
            memmove(sb[].storage, str, len)
            if a[].storage {
                sb[].next = a[].storage[].next
                a[].storage[].next = sb
            }
            else {
                sb[].next = 0
                a[].storage = sb
                a[].remaining = 0
            }
            return sb[].storage
        }
        else {
            sb: *struc stbds_string_block = cast<*struc stbds_string_block>(realloc(0, sizeof(sb[]) - 8 + blocksize))
            sb[].next = a[].storage
            a[].storage = sb
            a[].remaining = blocksize
        }
    }
    p = a[].storage[].storage + a[].remaining - len
    a[].remaining -= len
    memmove(p, str, len)
    return p
}
fn stbds_strreset(a: *struc stbds_string_arena) none {
    x: *struc stbds_string_block;
    y: *struc stbds_string_block;
    x = a[].storage
    loop while x {
        y = x[].next
        free(x)
        x = y
    }
    memset(a, 0, sizeof(a[]))
}
