#  Can't use structure as controlling expression in switch statement
type struc s(    i: i32    )

pub fn main(none) i32 {
    x: struc s = $(true)
    match x {
        -> 1 {
            return 0
        }
        otherwise {
            return 1
        }
    }
}
