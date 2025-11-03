pub fn main(none) i32 {
    x: i32 = 1

    if x = 0 {
        return 2
    }
    elif x == 1 {
        return 3
    }
    elif x = x + 1 {
        if x ~= 1 {
            return 5
        } 
        else {
            return 0
        }
    }
    else {
        return 4
    }

    return 1
}
