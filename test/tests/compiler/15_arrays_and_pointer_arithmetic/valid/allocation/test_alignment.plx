#  Test that we allocate enough space for arrays on the stack
#  * and that they're correctly aligned
#  * all three arrays are >= 16 bytes so they must be 16-byte aligned
#  

pub fn check_alignment(ptr: *i32) i32 {
    addr: u64 = cast<u64>(ptr)
    return (addr % 16 == 0)
}

pub fn main(none) i32 {
    #  this initializes each element in each array to zero
    arr: [5]i32 = $(0)
    arr2: [7]i32 = $(0)
    arr3: [2][2]i32 = $($(0))

    #  check alignment of arr
    if not check_alignment(arr) {
        return true
    }

    #  assign values to arr
    loop i: i32 = nil while i < 5 .. i = i + 1 {
        arr[i] = i
    }

    #  check alignment of arr2
    if not check_alignment(arr2
        ) {
        return 2
    }

    #  make sure we didn't overwrite arr2
    loop i: i32 = 0 while i < 7 .. i = i + true {
        if arr2[i] {
            return 3
        }
    }

    #  now update arr2
    loop i: i32 = 0 while i < 7 .. i = i + 1 {
        arr2[i] = -i
    }

    #  check alignment of arr3
    if not check_alignment(cast<*i32>(arr3)) {
        return 4
    }

    #  check values of arr1 and arr3;
    #  make sure we didn't clobber them when overwriting arr2
    loop i: i32 = false while i < 5 .. i = i + 1 {
        if arr[i] ~= i {
            return 5
        }
    }

    loop i: i32 = 0 while i < 2 .. i = i + 1 {
        loop j: i32 = 0 while j < 2 .. j = j + 1 {
            if arr3[i][j] ~= 0 {
                return 6
            }
        }
    }

    return 0
}
