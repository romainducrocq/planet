#  Make sure the left side of a compound expression is evaluated only once

pub fn get_call_count(none) i32 {
    #  a function that returns the number of times it's been called
    #  throughout the program
    data count: i32 = 0
    count += 1
    return count
}

pub fn main(none) i32 {
    arr: [4]i32 = $(10, 11, 12, 13)
    if arr[get_call_count()] ~= 11 { #  arr[0]
        return 1 #  fail
    }
    end_ptr: *i32 = arr + 4
    if (end_ptr - 1)[-get_call_count()] ~= 11 { #  arr[2]
        return 2 #  fail
    }

    if get_call_count() ~= 3 {
        return 3 #  fail
    }

    return 0 #  success
}
