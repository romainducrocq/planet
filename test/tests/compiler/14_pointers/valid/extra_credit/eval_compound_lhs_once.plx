#  Make sure we evaluate the lhs of a compound expression only once

pub i: i32 = 0

pub fn putchar(c: i32) i32;
pub fn print_A(none) *i32 {
    putchar(65) #  write A to stdout
    return @i
}

pub fn print_B(none) *i32 {
    putchar(66) #  write B to stdout
    return @i
}

pub fn main(none) i32 {

    #  we should print "A" to stdout only ONCE
    print_A()[] += 5
    if i ~= 5 {
        return 1
    }

    #  print "B" to stdout only ONCE. testing with casting operations
    print_B()[] += 5l
    if i ~= 10 {
        return 2
    }

    return 0 #  success
}

