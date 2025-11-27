#  Function calls kill copies to variables with static storage duration 
pub x: i32;

pub fn update_x(none) i32 {
    x = 4
    return 0
}

pub fn target(none) bool {
    x = 3 #  generate x = 3
    update_x() #  kill x = 3
    return x #  can't propagte b/c it's static
}

pub fn main(none) i32 {
    #  validate return value and value of x after function call
    if target() ~= 4 {
        return 1
    }

    if x ~= 4 {
        return 2
    }

    return 0 #  success
}
