#  Converting a value to a different type, then back to the original type,
#  * does not always recover its original value
#  

#  start with a global variable so we can't optimize away casts in Part III
pub a: u64 = 8589934580ul #  2^33 - 12

pub fn main(none) i32 {

    #  because a is too large to fit in an unsigned int,
    #      * casting it to unsigned int and back is equivalent to subtracting
    #      * 2^32, resulting in 4294967284
    #      
    b: u64 = cast<u64>(cast<u32>(a))

    if b ~= 4294967284ul {
        return true
    }

    #  Casting a to signed int results in -12, and
    #      * casting it back to unsigned long results in 2^64 - 12,
    #      * or 18446744073709551604
    #      
    b = cast<u64>(cast<i32>(a))
    if b ~= 18446744073709551604ul {
        return 2
    }

    return 0
}
