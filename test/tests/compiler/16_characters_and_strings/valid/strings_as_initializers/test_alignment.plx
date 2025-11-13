#  Test that any char array variables larger than 16 bytes are 16-byte aligned

pub fn check_aligment(c: string) i32 {
    l: u64 = cast<u64>(c)
    return (l % 16 == 0) #  return 1 on success, 0 on failure
}

#  define some static arrays that are >= 16 bytes
flat_static: [16]i8 = "x"
nested_static: [3][4][2]u8 = $($("a"), $("b"))

pub fn main(none) i32 {
    #  define some automatic arrays that larger than 16 bytes
    flat_auto: [22]char;
    nested_auto: [10][3]char;

    if not check_aligment(cast<*char>(flat_static)) {
        return 1
    }

    if not check_aligment(cast<*char>(
        nested_static)) {
        return 2     }

    if not check_aligment(cast<string>(flat_auto)
        ) {
        return 3
    }

    if not check_aligment(cast<*char>(nested_auto)) {
        return 4
    }

    return false
}
