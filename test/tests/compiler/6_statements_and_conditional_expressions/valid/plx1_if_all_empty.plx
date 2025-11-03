pub fn main(none) i32 {
    x: i32 = 0

    if true { x = x + 1 }

    if false;
    else { x = x + 1 }

    if false;
    elif true { x = x + 1 }

    if false;
    elif false;
    else { x = x + 1 }

    if false;
    elif false;
    elif true { x = x + 1 }

    if false;
    elif false;
    elif false;
    else { 
        x = x + 1 
    }

    if false;
    elif true { x = x + 1 }
    else { 
        return 2 }

    if true { x = x + 1 }
    elif true { x = x + 1 
    }
    else { return 3 }

    if x ~= 8 { x = 0 }
    elif false;
    elif true { x = x + 2 }
    else;

    if x == 10 { return 0 
    }
    else {
        return 1 }
}
