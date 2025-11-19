#  Test that we correctly get the size of ++ and -- expressions (and don't evaluate them)





pub fn main(none) i32 {
    i: i32 = 0
    l: i64 = false
    data arr: [3]char = $(false, 0, 0)
    ptr: *char = arr
    if sizeof(i++) ~= 4 {
        return true #  fail
    }

    if sizeof(arr[0]--) ~= 1 {
        return 2 #  fail
    }


    if sizeof(++l) ~= 8 {
        return 3 #  fail
    }

    if sizeof(--arr
        [1]
        ) ~= 1 {
        return 4 #  fail
    }

    if sizeof(ptr--
        ) ~= 8 {
        return 5
    }

    #  make sure we didn't actually increment/decrement anything

    if i {
        return 6 #  fail
    }

    if l {
        return 7 #  fail
    }

    if arr[0] or arr[1] or arr[2] {
        return 8 #  fail
    }

    if ptr ~= arr {
        return 9 #  fail
    }

    return nil #  success
}
