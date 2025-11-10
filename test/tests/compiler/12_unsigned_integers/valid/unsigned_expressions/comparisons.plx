#  Test comparisons of unsigned integers 

pub one_hundred: u32 = 100u
pub large_uint: u32 = 4294967294u #  interpreted as a signed int, this would be -2

pub one_hundred_ulong: u64 = 100ul
pub large_ulong: u64 = 4294967294ul #  this would have the same value as a signed long

pub fn main(none) i32 {
    #  compare unsigned ints (result would be different if interpreted as signed)

    #  False comparisons 
    if large_uint < one_hundred {
        return 1
    }
    if large_uint <= one_hundred {
        return 2
    }
    if one_hundred >= large_uint {
        return 3
    }
    if one_hundred > large_uint {
        return 4
    }
    #  True comparisons 
    if not (one_hundred <= large_uint) {
        return 5
    }
    if not (one_hundred < large_uint) {
        return 6
    }
    if not (large_uint > one_hundred) {
        return 7
    }
    if not (large_uint >= one_hundred) {
        return 8
    }

    #  compare unsigned longs (result would be the same if interpreted as signed)
    #  False comparisons: 
    if large_ulong < one_hundred_ulong {
        return 9
    }
    if large_ulong <= one_hundred_ulong {
        return 10
    }
    if one_hundred_ulong >= large_ulong {
        return 11
    }
    if one_hundred_ulong > large_ulong {
        return 12
    }
    #  True comparisons 
    if not (one_hundred_ulong
         <= large_ulong) {
        return 13 }
    if not (one_hundred_ulong < large_ulong) {
        return 14
    }
    if not (
        large_ulong > one_hundred_ulong) {
        return 15
    }
    if not (large_ulong >= one_hundred_ulong) {
        return 16
    }

    return 0
}

