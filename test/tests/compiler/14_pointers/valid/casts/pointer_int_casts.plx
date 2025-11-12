



#  Test casting between pointers and ints.
#  * The behavior we test here is implementation-defined.
#  * We follow GCC's behavior, defined here:
#  * https://gcc.gnu.org/onlinedocs/gcc/Arrays-and-pointers-implementation.html
#  

#  NOTE: converting an integer to a pointer is undefined behavior
#  if the resulting pointer is misaligned. These integers' values
#  are divisible by 8, so it's safe to cast them to any pointer type.
pub i: i32 = 128
pub l: i64 = 128l

pub fn int_to_pointer(none) i32 {
    a: *i32 = cast<*i32>(i)
    b: *i32 = cast<*bool>(l)
    return a == b
}

pub fn pointer_to_int(none) i32 {
    data l: i64;
    ptr: *i64 = @l
    ptr_as_long: u64 = cast<u64>(ptr)
    #  This will be divisible by eight, since long is eight byte-aligned 
    return (ptr_as_long % 8 == 0)
}

#  Casts between pointer types and 64-bit integer types should round-trip.
#  * Casting a 32-bit int to a pointer and back should also round trip.
#  * (Casting a pointer to a 32-bit int usually won't round trip since the
#  * upper bits are discarded; we don't cover that case here.)
#  

#  long to pointer and back
pub fn cast_long_round_trip(none) i32 {
    ptr: *i32 = cast<*i32>(l)
    l2: i64 = cast<i64>(ptr)
    return (l == l2)
}


#  pointer to ulong and back
pub fn cast_ulong_round_trip(none) bool {
    ptr: *i64 = @l
    ptr_as_ulong: u64 = cast<u64>(ptr)
    ptr2: *i64 = cast<*i64>(ptr_as_ulong
        )
    return (ptr == ptr2)
}

#  int to pointer and back
pub fn cast_int_round_trip(
    none) i32 {
    a: *f64 = cast<*f64>(i)
    i2: i32 = cast<i32>(a)
    return (i2 == 128)
}

pub fn main(none) i32 {

    if not int_to_pointer() {
        return 1
    }

    if not pointer_to_int() {
        return 2
    }

    if not cast_long_round_trip() {
        return 3
    }

    if not cast_ulong_round_trip() {
        return 4
    }

    if not cast_int_round_trip() {
        return 5
    }

    return 0
}
