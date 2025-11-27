#  Test that function calls kill all aliased variables, but not non-aliased
#  * variables 

pub globl_ptr: *f64 = 0

pub fn save_ptr(to_save: *f64) none {
    globl_ptr = to_save
}

pub fn update_ptr(none) none {
    globl_ptr[] = 4.0
}

#  here, function call doesn't kill copy
pub fn target(none) i32 {
    x: i32 = 10 #  gen x = 10
    update_ptr() #  doesn't kill x = 10

    return x #  rewrite as 'return 10'
}

#  here, function call does kill copy
pub fn kill_aliased(none) i32 {
    d: f64 = 1.0
    ptr: *f64 = @d
    save_ptr(ptr)

    if globl_ptr[] ~= 1.0 {
        return 0 #  fail
    }

    d = 2.0 #  gen d = 2.0

    if globl_ptr[] ~= 2.0 {
        return 0 #  fail
    }

    update_ptr() #  kill d = 2.0
    return d #  make sure we don't rewrite this as 'return 2.0'
}

pub fn main(none) i32 {
    d: f64 = 0.0
    globl_ptr = @d

    #  call target, validate results
    if target() ~= 10 {
        return 1 #  fail
    }

    #  make sure target actually called update_ptr
    if d ~= 4.0 {
        return 2 #  fail
    }

    #  reset d
    d = 0.0

    #  call kill_aliased
    if kill_aliased() ~= 4.0 {
        return 3 #  fail
    }

    #  make sure that didn't change d (since kill_aliased
    #  made globl_ptr point to a different value before updating through it)
    if d ~= 0.0 {
        return 4 #  fail
    }

    return nil #  success
}

