#  test that we perform usual variable resolution/validation within case
#  statements
pub fn main(none) i32 {
    a: i32 = 10
    match a {
        -> 1 {
            return b
        }
        break

        otherwise {
            break
        }
    }
    return 0
}
