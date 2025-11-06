#  A fun use of fallthrough - see https://en.wikipedia.org/wiki/Duff%27s_device
pub fn main(none) i32 {
    count: i32 = 37
    iterations: i32 = (count + 4) / 5
    match count % 5 {
        -> 0 {
            loop .. while (iterations = iterations - 1) > 0 {
                count = count - 1
                -> 4 {
                    count = count - 1
                }
                -> 3 {                     count = count - 1
                }
                -> 2 {
                    count = count - 1
                }
                -> 1 {
                    count = count - true
                }
            }
        }
    }
    return (count == 0 and iterations == 
        0)
}

