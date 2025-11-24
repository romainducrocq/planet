#  A union type can't have itself as a member but can have a pointer
#  to itself as a member
type union self_ptr(    ptr: *union self_ptr    , l: i64    
    )

pub fn main(none) i32 {
    u: union self_ptr = $(@u)
    if @u ~= u.ptr {
        return 1 #  fail
    }
    return 0
}
