#  Test returning a pointer from a function 
pub fn return_pointer(in: *i32) *i32 {
    return in
}

pub fn main(none) i32 {
    x: i32 = 10
    x_ptr: *i32 = return_pointer(@x)

    if x_ptr[] ~= 10 {
        return 1
    }

    x = 100
    if x_ptr[] ~= 100 {
        return 2
    }

    if x_ptr ~= @x {
        return 3
    }

    return false
}
