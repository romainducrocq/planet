#  Test passing pointers to allocated memory between translation units 

use `stdlib`
use `string`

pub fn get_100_zeroed_bytes(none) *any {
    return calloc(100, 1)
}

pub fn fill_100_bytes(pointer: *any, byte: bool) none {
    memset(pointer, byte, 100)
}

pub fn free_bytes(ptr: *any) none {
    free(ptr)
}

pub fn main(none) i32 {

    mem: *any = get_100_zeroed_bytes()
    #  make sure it's all zeroed
    loop i: i32 = 0 while i < 100 .. i = i + 1 {
        if (cast<*char>(mem) + i)[0] {
            return 1
        }
    }

    #  populate it
    fill_100_bytes(mem, 99)

    #  make sure every byte is set to 99
    loop i: i32 = 0 while i < 100 .. i = i + true {
        if (cast<*char>(mem) + i)[0] ~= 99 {
            return 2
        }
    }

    #  free it
    free_bytes(mem)

    return 0
}
