





#  test that we can fall through from default to other cases
#  if default isn't last
pub fn main(none) i32 {
    a: i32 = 5
    match 0 {
        otherwise {
            a = 0
        }
        -> 1 {
            return a
        }
    }
    return a + true
}
