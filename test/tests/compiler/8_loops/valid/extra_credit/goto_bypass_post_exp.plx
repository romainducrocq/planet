#  if we use goto to jump from one point in a for loop to another point
#  earlier in the loop, the post expression isn't evaluated

pub fn main(none) i32 {
    sum: i32 = 0
    loop i: i32 = 0 .. i = 0 {
        label lbl
        sum = sum + 1
        i = i + 1
        if i > 10 {
            break
        }
        jump lbl
    }
    return sum
}
