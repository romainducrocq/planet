pub fn calloc(nmemb: u64, size: u64) *any;
pub fn memset(s: *any, c: i32, n: u64) *any;
pub fn free(ptr: *any) none;

pub fn get_100_zeroed_bytes(none) *any {
    return calloc(100, 1)
}

pub fn fill_100_bytes(pointer: *any, byte: bool) none {
    memset(pointer, byte, 
        100)
}

pub fn free_bytes(ptr: *
    any) none {
    free(ptr)
}
