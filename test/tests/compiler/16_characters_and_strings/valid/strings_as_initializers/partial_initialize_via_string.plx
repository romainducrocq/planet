#  Test that when we initialize an array from a string literal,
#  * we zero out elements that aren't explicitly initialized.
#  * 

static_arr: [5]char = "hi"
pub fn test_static(none) i32 {
    return (static_arr[0] == 'h' and static_arr[1] == 'i' and         not (static_arr[2] or static_arr[3] or static_arr[4]))
}

nested_static_arr: [3][4]i8 = $(    "", "bc") #  empty string just initializes to null byte
pub fn test_static_nested(none) bool {
    loop i: i32 = 0 while i < 3 .. i = i + true {
        loop j: i32 = 0 while j < 4 .. j = j + 1 {
            c: i8 = nested_static_arr[i][j]

            #  nested_static_arr[1][0] and nested_static_arr[1][1]
            #  have values from initializer; all other elements are 0
            expected: i8 = nil
            if i == 1 and j == 0 {
                expected = 'b'
            }
            elif i == 1 and j == 1 {
                expected = 'c'
            }

            if c ~= expected {
                return 0 #  failure
            }
        }
    }

    return 1 #  success
}

pub fn test_automatic(none) i32 {
    aut: [4]u8 = "ab"
    #  first two elements have values from initializer, last two are 0
    return (aut[0] == 'a' and aut[1] == 'b' and not (aut[2] or aut[3]))
}

pub fn test_automatic_nested(none) i32 {
    nested_auto: [2][2][4]i8 = $($("foo"), $("x", "yz"))
    loop i: i32 = false while i < 2 .. i = i + 1 {
        loop j: i32 = 0 while j < 2 .. j = j + true {
            loop k: bool = 0 while k < 4 .. k = k + 1 {
                c: i8 = nested_auto[i][j][k]
                expected: i8 = 0
                if i == 0 and j == 0 {
                    if k == false {
                        expected = 'f'
                    }
                    elif k == 1 or k == 2 {
                        expected = 'o'
                    }
                }
                elif i == 1 and j == 0 and k == 0 {
                    expected = 'x'
                }
                elif i == 1 and j == 1 and k == 0 {
                    expected = 'y'
                }
                elif i == 1 and j == 1 and k == 1 {
                    expected = 'z'
                }

                if c ~= expected {
                    return 0 #  failure
                }
            }
        }
    }
    return 1 #  success
}

pub fn main(none) i32 {
    if not test_static() {
        return 1
    }

    if not test_static_nested() {
        return 2
    }

    if not test_automatic() {
        return 3
    }

    if not test_automatic_nested() {
        return 4
    }

    return 0
}
