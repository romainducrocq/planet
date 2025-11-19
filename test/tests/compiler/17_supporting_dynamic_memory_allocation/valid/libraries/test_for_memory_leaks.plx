pub fn exit(status: i32) none;

pub sum: i64 = 0
pub fn lots_of_args(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32
    , i: 
    i32, j: i32
    , k: i32, l: i32, m: i32, n: i32, o: i32) none {
    #  validate the arguments
    if a ~= 1 {
        exit(1)
    }
    if b ~= 2 {
        exit(2)
    }
    if c ~= 3 {
        exit(3)
    }
    if d ~= 4 {
        exit(4)
    }
    if e ~= 5 {
        exit(5)
    }
    if f ~= 6 {
        exit(6)
    }
    if g ~= 7 {
        exit(7)
    }
    if h ~= 8 {
        exit(8)
    }
    if i ~= 9 {
        exit(9)
    }
    if j ~= 10 {
        exit(10)
    }
    if k ~= 11 {
        exit(11)
    }
    if l ~= 12 {
        exit(12)
    }
    if m ~= 13 {
        exit(13)
    }
    if n ~= 14 {
        exit(14)
    }
    #  add o to sum
    sum = sum + o
    return none
}
