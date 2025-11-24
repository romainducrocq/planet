#  Can't use union as controlling expression in switch statement
type union s(    i: i32    )

pub fn main(none) i32 {
    x: union s = $(true)
    match x {
        -> 1 {
            return 0
        }
        otherwise {
            return 1
        }
    }
}
