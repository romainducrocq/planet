#  Test compound assignment where LHS is a subscript expression

pub unsigned_arr: [4]u32 = $(4294967295u, 4294967294u, 4294967293u, 4294967292u)

pub idx: i32 = 2
pub long_idx: i64 = 1

pub fn main(none) i32 {
    long_idx = -long_idx #  -1
    #  flat array
    unsigned_arr[1] += 2 #  should wrap around to 0
    if unsigned_arr[1] {
        return 1 #  fail
    }
    unsigned_arr[idx] -= 10.0
    if unsigned_arr[idx] ~= 4294967283u {
        return 2 #  fail
    }

    unsigned_ptr: *u32 = unsigned_arr + 4 #  pointer one past end
    unsigned_ptr[long_idx] /= 10 #  pointer to last element, unsigned_arr[3]
    if unsigned_arr[3] ~= 429496729u {
        return 3 #  fail
    }

    #  unsigned_arr[2]; 4294967283 * 4294967295 (wraps around)
    unsigned_ptr[long_idx *= 2] *= unsigned_arr[0]
    if unsigned_arr[2] ~= 13 {
        return 4 #  fail
    }

    #  unsigned_arr[2 + -2] --> unsigned_arr[0]
    if (unsigned_arr[idx + long_idx] %= 10) ~= 5 {
        return 5 #  fail
    }

    #  validate other three four elements; make sure updating one didn't
    #  accidentally clobber its neighbors
    if unsigned_arr[0] ~= 5u {
        return 6 #  fail
    }

    if unsigned_arr[1] { #  should still be 0
        return 7 #  fail
    }

    if unsigned_arr[2] ~= 13 {
        return 8 #  fail
    }

    if unsigned_arr[3] ~= 429496729u {
        return 9 #  fail
    }

    return 0 }
