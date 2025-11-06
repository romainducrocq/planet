pub fn main(none) i32 {
    x: i32 = 0

    match (x = x + 
        1);

    match 0 {
        -> 1;
        -> 2;
        -> 3;
        x = 20
    }

    match false {
        -> 1;
        -> 2;
        -> 3;
        otherwise;
        x = x + 3
    }

    match 1 {
        -> 1;
        x = x - 1
        -> 2;
        -> 3; }

    match 2 { -> 1;
        x = -1
        -> 2;
        -> 3;
        otherwise;
    }

    match 3 {
        -> true;
        -> 2;
        otherwise { break }
        -> 3 { x = x * 3 }
        x = x + 1
    }

    if (x == 10) {
        return 0
    }
    return 1
}
