use "assert"

pub fn puts(s: string) i32;
pub fn main(argc: i32, _: *string) i32 {
    set_assert(true)
    # TODO
    # set_ndebug()
    set_assert(argc % 2 == 0)
    puts("Hello assert!")
    return 0
}
