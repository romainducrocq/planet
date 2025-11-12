#  Apply prefix and postfix ++/-- to dereferenced pointers
pub fn main(none) i32 {
    x: i32 = 10
    y: *i32 = @x

    #  Prefix ++
    if ++y[] ~= 11 {
        return 1
    }
    if x ~= 11 {
        return 2
    }

    #  Prefix --
    if --y[] ~= 10 {
        return 3
    }

    if x ~= 10 {
        return 4
    }

    #  Postfix ++
    if (y[])++ ~= 10 {
        return 5
    }

    if x ~= 11 {
        return 6
    }

    #  Postfix --
    if (y[])-- ~= 11 {
        return 7
    }

    if x ~= 10 {
        return 8
    }

    #  different types
    ul: u64 = 0
    ul_ptr: *u64 = @ul
    if (ul_ptr[])-- {
        return 9
    }
    if ul ~= 18446744073709551615ul {
        return 10
    }

    d: f64 = 0.0
    d_ptr: *f64 = @d
    if ++(d_ptr[]) ~= 1.0 {
        return 11
    }
    if d ~= 1.0 {
        return 12
    }

    return false
}
