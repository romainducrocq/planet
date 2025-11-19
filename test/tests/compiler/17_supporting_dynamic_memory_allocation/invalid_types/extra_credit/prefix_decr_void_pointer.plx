#  Can't apply prefix or postfix ++/-- to pointers to void
pub fn malloc(size: u64) *any;

pub fn main(none) i32 {
    buff: *any = malloc(100)
    --buff
    return nil
}
