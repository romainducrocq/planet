use "assert"

pub fn puts(s: string) i32;
pub fn main(argc: i32, argv: *string) i32 {
    assert_false: bool = argc == 2 and argv[1][0] == '1'
    set_assert(2 > 1)
    if get_ndebug() {
        return ? assert_false then 0 else 1
    }

    set_ndebug(true)
    set_assert(false)
    if not get_ndebug() {
        return ? assert_false then 0 else 2
    }

    set_ndebug(0)
    set_assert(1)
    if get_ndebug() {
        return ? assert_false then 0 else 3
    }

    set_ndebug(42)
    set_assert(1 < 0)
    if not get_ndebug() {
        return ? assert_false then 0 else 4
    }

    set_ndebug(nil)
    set_assert(42)
    if get_ndebug() {
        return ? assert_false then 0 else 5
    }

    set_assert(not assert_false)
    puts("Hello assert!")
    return 0
}
