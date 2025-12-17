#  Apply sizeof to a range of union types
import "../../no_structure_parameters/size_and_offset_calculations/struct_sizes"

#  size is 11 bytes; no padding
type union no_padding(    c: char    , uc: u8    , arr: [11]i8    )


#  size is 12 bytes; take largest member (10 bytes)
#  and pad to 4-byte alignment (b/c ui is 4-byte aligned)
type union with_padding(    arr: [10]i8    , ui: u32    
    )


#  size is 36 bytes
#  arr1 is 24 bytes, 4-byte aligned
#  arr2 is 33 bytes, 1-byte aligned
#  round 33 up to multiple of 4 to get 36
type union contains_array(    arr1: [2]union with_padding    
    , arr: [3]union no_padding    )


#  8 bytes, no padding
type union double_and_int(    i: i32    , d: f64    )

#  20 bytes, 4-byte aligned
type union contains_structs(    x: struc wonky#  19 bytes, 1-byte aligned
    , y: struc eight_bytes#  8 bytes, 4-byte aligned
    )

pub fn main(none) i32 {
    if sizeof<union no_padding> ~= 11 {
        return 1 #  fail
    }

    if sizeof<union with_padding> ~= 12 {
        return 2 #  fail
    }

    if sizeof<union contains_array> ~= 36 {
        return 3 #  fail
    }

    if sizeof<union double_and_int> ~= 8 {
        return 4 #  fail
    }

    if sizeof<union contains_structs> ~= 20 {
        return 5 #  fail
    }


    #  apply sizeof to some expressions with union type too
    x: union no_padding = $(1)
    y: union contains_array = $($($($(-1, 2))))
    fn get_union_ptr(none) *union contains_structs;

    if sizeof(x) ~= 11 {
        return 6 #  fail
    }

    if sizeof(y.arr1) ~= 24 { #  array of two union with_padding objects
        return 7 #  fail
    }

    if sizeof(get_union_ptr()[]) ~= 20 {
        return 8 #  fail
    }


    return 0 #  success
}

pub fn get_union_ptr(none) *union contains_structs {
    #  just return null pointer - okay b/c we never actually access this struct
    return false
}
