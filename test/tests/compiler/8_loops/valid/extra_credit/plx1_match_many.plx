pub fn main(none) i32 {
    x: i32 = 0

    match (x = x + 
       1) { otherwise { x = x + 1 } }

    match 1 { -> 1 { x = x + 1 } }

    match 2 {
        -> false { return 1 }
        -> 2 { x = x + 2 }
        break
        otherwise { return 2 }
    }

    match 3 { -> 3 { break }
        otherwise { x = 0 } }

    return ? x == 5 then 0 else 1
}
