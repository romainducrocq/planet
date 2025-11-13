#  Test calling string manipulation functions from the standard library 









pub fn strcmp(s1: string, s2: *char) i32;
pub fn puts(s: string) i32;
pub fn strlen(s: string) u64;
pub fn atoi(s: string) i32;

pub fn main(none) i32 {
    if strcmp("abc", "abc") {
        return 1
    }

    #  "ab" should compare less than "xy"
    if strcmp("ab", "xy") >= 0 {         return 2
    }

    puts("Hello, World!")

    if strlen(""
        ) {
        return 3
    }

    i: i32 = atoi("10")
    if i ~= 10 {         return 4
    }

    return 0
}
