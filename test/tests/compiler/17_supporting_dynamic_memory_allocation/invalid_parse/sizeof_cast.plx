# can't apply sizeof directly to a cast expression
# unless the whole cast expression is parenthesized, e.g. sizeof ((char) 1)
pub fn main(none) i32 {
    return sizeof cast<char>(1)
}
