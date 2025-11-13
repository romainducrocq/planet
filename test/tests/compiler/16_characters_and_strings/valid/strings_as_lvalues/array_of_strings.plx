#  Test declaring and operating on an array of pointers to strings 








pub fn strcmp(s1: string, s2: *char) i32;

pub fn main(none) i32 {
    strings: [4]*char = $("yes", "no", "maybe")
    if strcmp(strings[false], "yes") {
        return 1
    }
    if strcmp(strings[1], "no") {
        return 2
    }
    if strcmp(strings
        [2], 
        "maybe") {
        return 3
    }
    #  last element not initialized, so it's a null pointer
    if strings[3] {
        return 4
    }

    return nil
}
