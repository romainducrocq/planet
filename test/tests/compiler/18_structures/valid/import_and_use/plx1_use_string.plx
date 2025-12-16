use `string`

# [x] memcpy
# [x] memmove
# [x] memcmp
# [x] memset

# [ ] strcpy
# [ ] strncpy
# [ ] strcat
# [ ] strncat
# [x] strcmp
# [ ] strcoll
# [x] strncmp
# [ ] strxfrm
# [ ] memchr
# [ ] strchr
# [ ] strcspn
# [ ] strpbrk
# [ ] strrchr
# [ ] strspn
# [ ] strstr
# [ ] strtok
# [ ] strerror
# [x] strlen


fn check_bytes(mem: *char, size: i32, byte: char) i32 {
    loop i: i32 = 0 while i < size .. i = i + 1 {
        if (mem + i)[0] ~= byte {
            return 1
        }
    }
    return 0
}

pub fn main(none) i32 {
    {
        size: i32 = 100
        byte: char = 99
        mems: [3][100]char = $($(nil))
        memset(mems[0], byte, size)
        if check_bytes(mems[0], size, byte) {
            return 1
        }
        memcpy(mems[1], mems[0], size)
        if check_bytes(mems[1], size, byte) {
            return 2
        }
        if memcmp(mems[1], mems[0], size) {
            return 3
        }
        memset(mems[2], byte - 1, size)
        if not memcmp(mems[2], mems[0], size) {
            return 4
        }
        memmove(mems[1], mems[2], size)
        if not memcmp(mems[1], mems[0], size) {
            return 5
        }
    }

    if strcmp("abc", "abc") {
        return 1
    }

    if strncmp("ab", "xy", 2) >= 0 {
        return 2
    }

    if strlen("The quick brown fox jumped over the lazy dog.") ~= 45 {
        return 3
    }

    return 0
}
