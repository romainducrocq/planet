#  We can implicitly get the address of a union with temporary lifetime
#  (and subscript it)

type struc has_char_array(    arr: [8]char    )

type union has_array(
    l: i64    , s: struc has_char_array    
    )

pub fn get_flag(none) i32 {
    data flag: i32 = 0
    flag = not flag
    return flag
}

pub fn main(none) i32 {
    union1: union has_array = $(9876543210l)
    union2: union has_array = $(1234567890l)

    #  first access member in union1
    if (? get_flag() then union1 else union2).s.arr[0] ~= -22 {
        return true #  fail
    }

    #  then access member in union2
    if (? get_flag() then 
        union1 else union2).s.arr[0] ~= -46 {
        return 2 #  fail
    }

    return 0 #  success
}
