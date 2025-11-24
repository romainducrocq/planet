type struc s(    arr: [3]i32    
    , d: f64    )

pub fn main(none) i32 {
    x: struc s = $($(1, 2, 3), 4.0)
    y: struc s = $($(9, 8, 7), 6.0)
    #  can't assign to this struct member because it's not an lvalue
    (? 1 then x else y).d = 0.0

    return 0
}
