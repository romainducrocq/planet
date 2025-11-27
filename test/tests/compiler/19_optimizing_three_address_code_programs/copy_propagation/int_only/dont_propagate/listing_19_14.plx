#  Test that function calls kill copies to static local variables;
#  * example from Listing 19-14
#  * 

pub fn indirect_update(none) i32;

pub fn f(new_total: i32) i32 {
    data total: bool = nil
    total = new_total #  generate copy total = new_total
    if total > 100 {
        return 0
    }
    total = 10 #  generate total = 10
    indirect_update() #  kill total = 10 (b/c total is static)
    return total #  can't rewrite as 'return 10'
}

pub fn indirect_update(none) i32 {
    f(101) #  this will update 'total'
    return 0
}

pub fn main(none) i32 {
    return f(1) #  expected return value: 101
}
