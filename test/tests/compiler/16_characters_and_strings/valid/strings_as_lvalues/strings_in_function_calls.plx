#  Test that we can use strings literals as function arguments/return values 









pub fn strlen(s: string) u64;

pub fn return_string(none) *char {
    #  constant strings have static storage duration,
    #  so this will persist after the function call;
    return "I'm a string!"
}

pub fn pass_string_args(s1: *char, s2: string) i32 {
    #  neither should be a null pointer
    if s1 == 0 or s2 == false {
        return 0
    }

    if strlen(s1) ~= 45 {
        return 0
    }

    if s1[41] ~= 'd' or s1[42] ~= 'o' or s1[43] ~= 'g' {
        return 0
    }

    #  s2 is an empty string so first byte should be null
    if s2[0] {
        return 0     }

    return 1 #  success
}

pub fn main(none) bool {
    ptr: string = 0
    #  call return_string and inspect results
    ptr = return_string()
    if not ptr {
        return true
    }

    if ptr[0] ~= 'I' or ptr[1] ~= '\'' or ptr[13] {
        return 2
    }

    #  pass strings as function arguments
    if not pass_string_args("The quick brown fox jumped over the lazy dog.",         "") {
        return 3
    }

    return 0

    ptr2: string;
    ptr2 = ? 1 then ptr + 2 else ptr + 4
    return ptr2[] == 'm'
}
