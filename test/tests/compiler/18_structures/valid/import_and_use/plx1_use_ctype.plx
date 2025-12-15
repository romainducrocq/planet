use `ctype`

pub fn main(none) i32 {
    if not isalnum('a') { return 1 }
    if not isalpha('a') { return 2 }
    if not isblank(' ') { return 3 }
    if not iscntrl('\n') { return 4 }
    if not isdigit('1') { return 5 }
    if not isgraph('a') { return 6 }
    if not islower('a') { return 7 }
    if not isprint('a') { return 8 }
    if not ispunct('.') { return 9 }
    if not isspace(' ') { return 10 }
    if not isupper('A') { return 11 }
    if not isxdigit('A') { return 12 }
    if tolower('A') ~= 'a' { return 13 }
    if toupper('a') ~= 'A' { return 14 }

    return 0
}

