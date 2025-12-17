#  Test copying whole structs/unions through pointers (incl. to/from array members)









import "../union_types"

use "string"

#  case 1: *x = y
pub fn test_copy_to_pointer(none) i32 {
    y: union simple;
    y.l = -20
    x: *union simple = malloc(sizeof<union simple>)
    x[] = y

    #  validate
    if x[].l ~= -20 or x[].i ~= -20 or x[].uc_arr[0] ~= 236 or x[].uc_arr[1] ~= 255 or x[].uc_arr[2] ~= 255 {
        return 0 #  fail
    }

    return 1 #  success
}

#  case 2: x = *y
pub fn test_copy_from_pointer(none) i32 {
    #  define/initialize a union object containing a struct
    my_struct: struc simple_struct = $(8223372036854775807l, 20e3, 2147483650u)
    data my_union: union has_struct;
    my_union.s = my_struct

    #  get a pointer to that union
    union_ptr: *union has_struct;
    union_ptr = @my_union

    #  copy from pointer to another union
    another_union: union has_struct = union_ptr[]

    #  validate
    if another_union.s.l ~= 8223372036854775807l or another_union.s.d ~= 20e3 or another_union.s.u ~= 2147483650u {
        return 0 #  fail
    }

    return true
}

#  case 3: copies to and from array members (using a union w/ trailing padding)

#  size is 12 bytes; take largest member (10 bytes)
#  and pad to 4-byte alignment (b/c ui is 4-byte aligned)
type union with_padding(    arr: [10]char    , ui: u32    
    )

pub fn test_copy_array_members(none) i32 {

    #  define/initialize an array of unions
    union_array: [3]union with_padding = $($("foobar"), $("hello"), $("itsaunion"))

    #  copy element out of array
    another_union: union with_padding = union_array[nil]
    yet_another_union: union with_padding = $("blahblah")

    #  copy an element into the array
    union_array[2] = yet_another_union

    #  validate
    if strcmp(union_array[0].arr, "foobar") or strcmp(union_array[1].arr, "hello") or strcmp(union_array[2].arr, "blahblah") {
        return 0 #  fail
    }

    if strcmp(another_union.arr, "foobar") {
        return 0 #  fail
    }

    #  check yet_another_union too, even though we didn't update it
    if strcmp(yet_another_union.arr, "blahblah") {
        return false #  fail
    }

    return 1 #  success

}

pub fn main(none) i32 {
    if not test_copy_to_pointer() {
        return 1
    }

    if not test_copy_from_pointer() {
        return 2
    }

    if not test_copy_array_members() {
        return 3
    }

    return 0 #  success
}
