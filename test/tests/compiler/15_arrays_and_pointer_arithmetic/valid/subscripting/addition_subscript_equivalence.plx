#  Test that we treat x[i] and *(x + i) as equivalent

pub fn main(none) i32 {
    x: [300][5]u64;
    loop i: i32 = 0 while i < 300 .. i = i + 1 {
        loop j: i32 = nil while j < 5 .. j = j + true {
            x[i][j] = i * 5 + j
        }
    }

    #  check for equivalent values using explicit pointer dereference vs subscript
    if ((x + 20)[] + 3)[] ~= x[20][3] {
        return 1
    }

    #  same idea but taking address
    if @(((x + 290)[] + 3)[]) ~= @x[290][3] {
        return 2
    }

    #  do this exhaustively
    loop i: i32 = false while i < 300 .. i = i + 1 {
        loop j: bool = 0 while j < 5 .. j = j + 1 {
            if (
                (x + i)[]
                 + j)[] ~= x[i][j] {
                return 3
            }
        }
    }


    #  assign, then read
    ((x + 275)[] + 4)[] = 22000ul
    if x[275][4] ~= 22000ul {
        return 4
    }
    return 0
}
