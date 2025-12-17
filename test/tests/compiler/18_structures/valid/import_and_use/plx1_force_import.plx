pub fn main(none) i32 {
    x: i32 = 0
    import! "incr_x"
    import !"incr_x"
    import "incr_x"
    import   "incr_x"
    import   !   "incr_x"
    import "incr_x"
    import!   "incr_x"
    import"incr_x"
    import! "incr_x"
    import "incr_x"
    return x - 5
}
