#  if goto jumps past the controlling condition in a loop,
#  the condition isn't evaluated

pub fn main(none) i32 {
    i: i32 = 1
    loop .. while false {
        label while_start
        i = i + 1
        if i < 10 {
            jump while_start
        }

    }
    return i
}
