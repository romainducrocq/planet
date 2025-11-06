#  test that we perform usual variable resolution/validation within default
#  statements
pub fn main(none) i32 {
    a: i32 = 10
    match a {
        -> 1 {
            break
        }

        otherwise {
            return b
        }
        break
    }
    return 0
}
