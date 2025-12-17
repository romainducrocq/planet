use "string"

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
    
    str: [100]char = $(nil)
    strcpy(str, "abc")
    if strcmp(str, "abc") {
        return 6
    }
    if strncmp(str, "xy", 2) >= 0 {
        return 7
    }

    strncpy(str, "AAAAAAAAAA", 11)
    if check_bytes(str, 10, 'A') {
        return 8
    }
    
    {
        strx1: [100]char = $(nil)
        strx2: [100]char = $(nil)
        strxfrm(strx1, str, strxfrm(nil, str, 0) + 1)
        strxfrm(strx2, "abc", strxfrm(nil, "abc", 0) + 1)
        if strcoll("abc", str) ~= strcmp(strx2, strx1) {
            return 9
        }
    }
    
    str[0] = nil
    if strlen(str) {
        return 10
    }
    
    strcat(str, "The quick brown fox jumped ")
    strncat(str, "over the lazy dog.", 19)
    if strlen(str) ~= 45 {
        return 11
    }

    if memchr(str, 'q', 45) ~= @str[4] {
        return 12
    }
    if strchr(str, 'b') ~= @str[10] {
        return 13
    }
    if strcspn(str, "fox") ~= 12 {
        return 14
    }
    if strpbrk(str, " .,") ~= @str[3] {
        return 15
    }
    if strrchr(str, 'o') ~= @str[42] {
        return 16
    }
    if strspn(str, "bcehiknoqruwT ") ~= 16 {
        return 17
    }
    if strstr(str, "jumped over") ~= @str[20] {
        return 18
    }
    {
        tok: *char = strtok(str, " .,")
        toks: [9]*char = $(
            "The", "quick", "brown", "fox", "jumped", 
            "over", "the", "lazy", "dog"
        )
        loop i: i32 = 0 while tok ~= nil and i < 9 .. ++i {
            if strncmp(tok, toks[i], 7) {
                return 19
            }
            tok = strtok(nil, " .,")
        }
        if tok {
            return 20
        }
    }
    
    strerror(0)
    
    return 0
}
