#  if we use goto to jump into the middle of a for loop,
#  the initial expression isn't evaluated

pub fn main(none) i32 {
    i: i32 = 0
    jump target
    loop i = 5 while i < 10 .. i = i + 1 {
        label target
        if i == 0 {
            return 1
        }
    }
    return 0
}

