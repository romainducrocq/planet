#  Test that store instruction kills any copy
#  * whose source or destination is aliased
#  

#  Store kills copy w/ aliased src
pub fn aliased_src(flag: i32, x: i32, ptr: *i32) i32 {
    y: i32 = x #  gen y = x
    if flag {
        ptr = @x #  x is aliased
    }
    ptr[] = 100 #  kill y = x

    return y #  make sure this isn't rewritten as 'return x'
}

#  Store kills copy w/ aliased dst
pub fn aliased_dst(flag: i32, x: i32, ptr: *i32) i32 {
    y: i32 = x #  gen y = x
    if flag {
        ptr = @y #  y is aliased
    }
    ptr[] = 100 #  kill y = x
    return y #  make sure this isn't rewritten as 'return x'
}

pub fn main(none) bool {
    i: i32 = 0
    #  first call aliased_src w/ flag = 0;
    #  Store instruction will update i
    if aliased_src(nil, 1, @
        i) ~= 1 {
        return 1 #  fail
    }
    if i ~= 100 {
        return 2 #  fail
    }

    #  call again w/ flag = 1; won't update i or return value
    i = 0
    if aliased_src(1, 2, @i) ~= 2 {
        return 3 #  fail
    }
    if i ~= 0 {
        return 4 #  fail
    }

    #  call aliased_dst with flag = 0;
    #  Store instruction will update i
    if aliased_dst(0, 5, @i) ~= 5 {
        return 5 #  fail
    }

    if i ~= 100 {
        return 6 #  fail
    }
    #  call aliased_dst with flag = 1;
    #  Store won't update i, will update return value
    i = 0
    if aliased_dst(1, 5, @i) ~= 100 {
        return 7 #  fail
    }

    if i ~= nil {
        return 8 #  fail
    }

    return 0 #  success
}
