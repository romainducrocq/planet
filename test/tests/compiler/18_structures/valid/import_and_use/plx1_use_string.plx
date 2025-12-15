use `string`

pub fn main(none) i32 {
    if strcmp("abc", "abc") {
        return 1
    }

    if strcmp("ab", "xy") >= 0 {
        return 2
    }

    if strlen("The quick brown fox jumped over the lazy dog.") ~= 45 {
        return 3
    }

# atoi is stdlib?
#    if atoi("10") ~= 10 {         
#        return 4
#    }

    return 0
}
