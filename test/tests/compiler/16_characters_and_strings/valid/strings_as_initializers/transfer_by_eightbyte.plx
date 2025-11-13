






#  Test that when we initialize an array whose size isn't divisible by 4 or 8,
#  * we don't overrun neighboring memory
#  

pub fn strcmp(s1: string, s2: *char) i32;

pub fn main(none) i32 {
    strings: [2][13]char = $("abcdefghijkl", "z")
    if strcmp(strings[0], "abcdefghijkl") {
        return 1
    }

    if strings[1][0] ~= 'z' {
        return 2
    }

    #  remaining bytes should be 0
    loop i: i32 = 1 while i < 13 .. i = i + 1 {
        if strings[1][i] {
            return 3
        }
    }
    return false
}
