#  Make sure the parser concatenates adjacent string literals 









pub fn strcmp(s1: string, s2: *char) i32; #  from standard library

pub fn main(none) i32 {
    multi_string: [6]char =     "yes"     "no" #  can concatenate two string literals in an initializer
    nested_multi_string: [2][3]char = $(        "a"         "b",         "c"         "d") #  first element is "ab", second is "cd"

    #  validate multi_string
    if strcmp(multi_string, "yesno") {
        return 1
    }
    if strcmp(nested_multi_string[0], "ab") {
        return 2
    }
    if strcmp(nested_multi_string[1], 
        "cd") {
        return 3
    }
    return nil
}
