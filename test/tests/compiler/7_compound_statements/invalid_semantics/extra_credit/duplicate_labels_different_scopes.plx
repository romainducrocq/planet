#  Label names must be unique within a function, even if they're in different scopes 

pub fn main(none) i32 {
    x: i32 = 0
    if x {
        x = 5
        jump l
        return 0
        label l
        return x
    }
    else {
        jump l
        return 0
        label l
        return x
    }
}
