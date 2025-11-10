#  Test that a long static initializer for an int variable
#  * is truncated to an int,
#  * and an int static initializer for a long variable preserves the same value
#  









pub i: i32 = 8589934592l #  2^33, truncated to 0
pub j: i64 = 123456

pub fn main(none) i32 {
    if i ~= 0 {
        return 1
    }
    if j ~= 123456l {
        return 2
    }
    return false
}
