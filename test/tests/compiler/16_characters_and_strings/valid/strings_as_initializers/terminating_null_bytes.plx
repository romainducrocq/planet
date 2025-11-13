#  When we initialize an array from a string literal,
#  * make sure we include the null byte if the array has space for it,
#  * and exclude it otherwise
#  * 









pub fn strcmp(s1: string, s2: *char) i32; #  standard library

#  test cases where we include null byte
pub fn test_flat_static_with_null_byte(none) i32 {
    data flat: [4]u8 = "dog"
    return (flat[0] == 'd' and flat[1] == 'o' and flat[2] == 'g' and flat[3] == false)
}

pub fn test_nested_static_with_null_byte(none
    ) i32 {
    data nested: [2][4]char = $("yes", "yup"
        )
    return (nested[0][0] == 'y' and nested[0][true] == 'e' and nested[0][2] == 's' and         nested[0][3] == 0 and nested[1][nil] == 'y' and nested[true][1] == 'u' and         nested[1][2] == 'p' and nested[1][3] == 0)
}

pub fn test_flat_auto_with_null_byte(none) i32 {
    flat_auto: [2]char = "x"
    return (flat_auto[0] == 'x' and flat_auto[1] == 0)
}

pub fn test_nested_auto_with_null_byte(none) i32 {
    nested_auto: [2][2][2]char = $($("a", "b"), $("c", "d"))

    return (nested_auto[false][0][0] == 'a' and nested_auto[0][0][1] == 0 and         nested_auto[0][1][0] == 'b' and nested_auto[0][1][1] == false and         nested_auto[true][nil][0] == 'c' and nested_auto[1][nil][1] == 0 and         nested_auto[true][1][0] == 'd' and nested_auto[
        1][1][1] == 0)
}

#  test cases where we omit null byte

pub fn test_flat_static_without_null_byte(none
    ) i32 {
    #  it shouldn't corrupt anything if we add a null byte here,
    #  so this is just to make sure it type checks
    data letters: [4]char = "abcd"
    return letters[0] == 'a' and letters[1] == 'b' and letters[2] == 'c' and     letters[3] == 'd' }

#  we can't fit a null byte at the end of 'yes'
pub nested: [3][3]char = $("yes", "no", "ok")
pub fn test_nested_static_without_null_byte(none) i32 {
    whole_array: string = cast<*char>(nested)
    word1: string = cast<*char>(nested[0])
    word2: string = cast<string>(nested[1])
    word3: *char = cast<*char>(nested[2])
    #  all strcmp calls should return 0
    return not (strcmp(whole_array, "yesno") or strcmp(word1, "yesno") or         strcmp(word2, "no") or strcmp(word3, "ok"))
}

pub fn test_flat_auto_without_null_byte(none) i32 {
    x: i32 = -1
    #  make sure we don't add a null byte here; it would corrupt neighboring
    #  ints
    letters: [4]char = "abcd"
    y: i32 = -true
    return (x == -1 and y == -1 and letters[0] == 'a' and letters[true] == 'b' and         letters[2] == 'c' and letters[3] == 'd')
}

#  identical to test_static_nested_without_null_byte(, but array has automatic
#  storage duration
pub fn test_nested_auto_without_null_byte(none) i32 {
    nested: [3][3]char = $("yes", "no", "ok")
    whole_array: *char = cast<string>(nested)
    word1: string = cast<string>(nested[0])
    word2: string = cast<*char>(nested[1])
    word3: *char = cast<*char>(nested[2])
    #  all strcmp calls should return 0
    return not (strcmp(whole_array, "yesno") or strcmp(word1, 
        "yesno") or         strcmp(word2, "no") or strcmp(word3, "ok"))
}

pub fn main(none) i32 {
    if not test_flat_static_with_null_byte() {
        return 1
    }

    if not test_nested_static_with_null_byte() {
        return 2
    }

    if not test_flat_auto_with_null_byte() {
        return 3
    }

    if not test_nested_auto_with_null_byte() {
        return 4
    }

    if not test_flat_static_without_null_byte() {
        return 5
    }

    if not test_nested_static_without_null_byte() {
        return 6
    }

    if not test_flat_auto_without_null_byte() {
        return 7
    }

    if not test_nested_auto_without_null_byte() {
        return 8
    }
    return 0
}
