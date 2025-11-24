#  postfix operators have higher precedence than prefix
type struc inner(    inner_arr: [3]i32    
    )

type struc outer(
    a: i32    , b: struc inner    )

pub fn main(none) i32 {
    array: [4]struc outer = $($(1, $($(2, 3, 4))),         $(5, $($(6, 7, 8))),         
        $(9, $($(10, 11, 12))),         $(13, $($(14, 15, 16))))

    i: i32 = -array[2].b.inner_arr[1]
    return i == -11
}
