# note: in older versions of C this would be valid
# and return type would default to 'int'
# GCC/Clang will compile it (with a warning)
# for backwards compatibility
pub fn main(none) {
    return 0
}
