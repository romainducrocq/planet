use "errno"

pub fn main(none) i32 {
    get_EDOM()
    get_EILSEQ()
    get_ERANGE()

    set_errno(42)
    if get_errno() ~= 42 {
        return 1
    }
    
    set_errno(0)
    return get_errno()
}
