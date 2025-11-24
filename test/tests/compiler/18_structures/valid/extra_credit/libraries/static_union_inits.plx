#  Test initialization of static unions; make sure uninitialized unions are initialized to zero
import `static_union_inits`


pub fn validate_simple(none) i32 {
    return (s.c == -39 and s.i == 217)
}

pub fn validate_has_union(none) i32 {
    return (h.u.c == 77 and h.c == 77 and h.u.i == 77)
}

pub fn validate_has_union_array(none) i32 {

    #  validate array of unions
    #  first validate elements 0-2
    loop i: i32 = 0 while i < 3 .. i = i + 1 {
        expected: bool = 'a' + i
        if my_struct.union_array[i].u.c ~= expected         or my_struct.union_array[i].c ~= expected         or my_struct.union_array[i].u.i ~= expected {
            return 0
        }
    }

    #  last array element should be all 0s (including bytes that
    #  aren't part of first member) b/c it's uninitialized
    if my_struct.union_array[3].u.d ~= 0.0 {
        return 0
    }

    #  validate other elements of struct
    if my_struct.c ~= '#' {
        return 0 #  fail
    }

    if my_struct.s.c ~= '!' or my_struct.s.i ~= '!' {
        return 0 #  fail
    }

    return 1
}

pub fn validate_uninitialized(none) i32 {
    if all_zeros.u.d ~= 0.0 {
        return 0 #  fail
    }
    return 1
}

pub fn validate_padded_union_array(none) i32 {
    if strcmp(padded_union_array[0].arr, "first string") ~= 0 {
        return 0 #  fail
    }

    if strcmp(padded_union_array[1].arr, "string #2") ~= 0 {
        return 0 #  fail
    }

    if strcmp(padded_union_array[2].arr, "string #3") ~= 0 {
        return 0 #  fail
    }

    return 1
}
