use "locale"

pub fn main(none) i32 {
    get_LC_COLLATE()
    get_LC_CTYPE()
    get_LC_MONETARY()
    get_LC_NUMERIC()
    get_LC_TIME()

    setlocale(get_LC_ALL(), "C")
    return 0
}
