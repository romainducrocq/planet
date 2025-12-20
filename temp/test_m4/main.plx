m4_include(`value_0.plx.m4')m4_dnl
m4_include(`value_1.plx.m4')m4_dnl
m4_include(`value_2.plx.m4')m4_dnl
m4_include(`value_3.plx.m4')m4_dnl
m4_include(`value_4.plx.m4')m4_dnl
m4_include(`value_5.plx.m4')m4_dnl

use "stdio"

pub fn main(none) i32 {
    if VAL_0 ~= 1 {
        print("error 0\n")
        return 7
    }
    if VAL_1 ~= 10 {
        print("error 1\n")
        return 1
    }
    if VAL_2 ~= 20 {
        print("error 2\n")
        return 2
    }
    if VAL_3 ~= 30 {
        print("error 3\n")
        return 3
    }
    if VAL_4 ~= 40 {
        print("error 4\n")
        return 4
    }
    if VAL_5 ~= 50 {
        print("error 5\n")
        return 5
    }
m4_ifdef(`VAL_BONUS', `
    print("Success: planet\n")
    return 0
', `
    print("No val bonus...\n")
    return 6
')
}
