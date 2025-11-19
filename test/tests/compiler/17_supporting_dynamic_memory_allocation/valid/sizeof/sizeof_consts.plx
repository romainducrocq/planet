#  Test that we correctly determine the type, and size, of all constants 

pub fn main(none) i32 {
    #  test that character constants have integer type, not character type;
    #  we couldn't test this in the previous chapter
    if sizeof('a') ~= 4 {
        return 1
    }

    #  int
    if sizeof(2147483647) ~= 4 {
        return 2
    }

    #  unsigned int
    if sizeof(4294967295u) ~= 4 {
        return 3
    }

    #  long
    if sizeof(2l) ~= 8 {
        return 4
    }

    #  unsigned long
    if sizeof(0ul) ~= 8 {
        return 5
    }

    #  double
    if sizeof(1.0) ~= 8 {
        return 6
    }
    return 0
}
