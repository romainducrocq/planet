type struc s(    arr: [3]i32    
    , d: f64    )

pub fn main(none) i32 {
    x: struc s = $($(1, 2, 3), 4.0)
    y: struc s = $($(9, 8, 7), 6.0)
    #  can't take address of element b/c it's not an lvalue
    #  (even though it has temporary lifetime)
    arr: [3]*i32 = @((? true then x else y).arr)
    return 0
}
