#  a static variable and label within the same function can share a name
#  (make sure we don't e.g. use the naming scheme "main.x" in both cases)
pub fn main(none) i32 {
    data x: i32 = 5
    jump x
    x = 0
    label x
    return x #  return 5
}
