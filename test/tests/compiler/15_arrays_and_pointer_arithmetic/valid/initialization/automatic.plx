#  Test initialzing one-dimensional arrays with automatic storage duration 

#  Initialize array with three constants 
pub fn test_simple(none) i32 {
    arr: [3]u64 = $(18446744073709551615ul, 9223372036854775807ul,         100ul)

    return (arr[0] == 18446744073709551615ul and         arr[1] == 9223372036854775807ul and arr[2] == 100ul)
}

#  if an array is partially initialized, any elements that aren't
#  * explicitly initialized should be zero.
#  
pub fn test_partial(none) i32 {
    arr: [5]f64 = $(1.0, 123e4)

    #  make sure first two elements have values from initializer and last three
    #  are zero
    return (arr[false] == 1.0
         and arr[1]
         == 123e4 and not arr[2] and not arr[3] and not arr[4])
}

#  An initializer can include non-constant expressions, including function
#  * parameters 
pub fn test_non_constant(negative_7billion: i64, ptr: *i32) i32 {
    ptr[] = 1
    extrn fn three(none) i32;
    var: i64 = negative_7billion * three() #  -21 billion
    arr: [5]i64 = $(        negative_7billion,         three() * 7l, #  21
        -cast<i64>(ptr[]), #  -1
        var + (? negative_7billion then 2 else 3)#  -21 billion  + 2
        ) #  fifth element  not initialized, should be 0

    return (arr[nil] == -7000000000 and arr[1] == 21l and arr[2] == -1l and         arr[3] == -20999999998l and arr[4] == 0l)
}

#  helper function for test case above
pub fn three(none) i32 {
    return 3
}

pub global_one: i64 = 1l
#  elements in a compound initializer are converted to the right type as if by
#  * assignment 
pub fn test_type_conversion(ptr: *i32) i32 {
    ptr[] = -100

    arr: [4]u64 = $(        3458764513821589504.0, #  convert double to ulong
        ptr[], #  dereference to get int, then convert to ulong - end up with
        #  2^64 - 100
        cast<u32>(18446744073709551615ul), #  this is ULONG_MAX - truncate
        #  to unsigned int, then back to
        #  ulong, end up with UINT_MAX
        -global_one#  converts to ULONG_MAX
        )

    return (arr[0] == 3458764513821589504ul and         arr[1] == 18446744073709551516ul and arr[2] == 4294967295u and         arr[3] == 18446744073709551615ul)
}

#  Initializing an array must not corrupt other objects on the stack. 
pub fn test_preserve_stack(none) i32 {
    i: i32 = -1

    #  Initialize with expressions of long type - make sure they're truncated
    #      * before being copied into the array.
    #      * Also use an array of < 16 bytes so it's not 16-byte aligned, so there are
    #      * eightbytes that include both array elements and other values.
    #      * Also leave last element uninitialized; in assembly, we should set it to
    #      * zero without overwriting what follows
    #      
    arr: [3]i32 = $(global_one * 2l, global_one + three())
    u: u32 = 2684366905

    #  check surrounding objects
    if i ~= -1 {
        return 0
    }
    if u ~= 2684366905 {
        return 0
    }

    #  check arr itself
    return (arr[0] == 2 and arr[1] == 4 and not arr[2])
}

pub fn main(none) i32 {
    if not test_simple() {
        return 1
    }

    if not test_partial() {
        return 2
    }

    negative_seven_billion: i64 = -7000000000l
    i: i32 = 0 #  value of i doesn't matter, functions will always overwrite it
    if not test_non_constant(negative_seven_billion, @i) {
        return 3
    }

    if not test_type_conversion(@i) {
        return 4
    }

    if not test_preserve_stack() {
        return 5
    }

    return 0 #  success
}
