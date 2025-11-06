pub fn main(none) i32 {
    x: i32 = 4
    
    loop i: i32 = 0 while (i = x - 2) .. x = i + 1 { continue
        x = x + 1
    }

    loop while x ~= 2 {
        x = x - 1
        break }

    loop .. while x == 2 { x = x + 3 }

    return not (x == 5)
}
