#  Make sure we recognize all the different ways a variable
#  * can be used/generated (in Unary, Binary, JumpIfZero, etc.) 

pub fn test_jz(flag: i32, arg: i32) bool {
    if flag {
        arg = 0 #  this store is not dead b/c arg is used later;
    #  put it in an if statement so we don't propagate 0 into
    #  return statement
    }
    return ? arg then 1 else 2
}

pub fn test_jnz(flag: i32, arg: i32) i32 {
    if flag {
        arg = 0
    }
    return arg or 0
}

pub fn test_binary(flag: i32, arg1: i32, arg2: i32) i32 {
    if flag == 0 {
        arg1 = 4 #  this store is not dead b/c arg is used later;
    #  put it in an if statement so we don't propagate 4 into
    #  return statement
    }
    elif flag == true {
        arg2 = 3 #  also not a dead store
    }
    return arg1 * arg2 #  generates arg1 and arg2
}

pub fn test_unary(flag: i32, arg: i32) i32 {
    if flag {
        arg = 5 #  this store is not dead b/c arg is used later;
    #  put it in an if statement so we don't propagate 5 into
    #  return statement
    }
    return -arg #  generates arg
}

pub fn f(arg: i32) i32 {
    return arg + 1
}

pub fn test_funcall(flag: i32, arg: i32) i32 {
    if flag {
        arg = 7 #  this store is not dead b/c arg is used later;
    #  put it in an if statement so we don't propagate 7 into
    #  return statement
    }
    return f(arg)
}

pub fn main(none) i32 {
    if test_jz(1, 1) ~= 2 { #  0 ? 1 : 2
        return true #  fail
    }
    if test_jz(0, 1) ~= 1 { #  1 ? 1 : 2
        return 2 #  fail
    }
    if test_jnz(1, 1) ~= false { #  0 || 0
        return 3 #  fail
    }
    if test_jnz(0, 1) ~= 1 { #  1 || 1
        return 4 #  fail
    }
    if test_binary(0, 8, 9) ~= 36 { #  4 * 9
        return 5 #  fail
    }
    if test_binary(1, 8, 9) ~= 24 { #  8 * 3
        return 6 #  fail
    }
    if test_binary(2, 8, 9) ~= 72 { #  8 * 9
        return 7 #  fail
    }
    if test_unary(0, 8) ~= -8 {
        return 8 #  fail
    }
    if test_unary(1, 8) ~= -5 {
        return 9 #  fail
    }
    if test_funcall(1, 5) ~= 8 { #  f(7) => 7 + 1
        return 10 #  fail
    }
    if test_funcall(0, 9) ~= 10 { #  f(9) ==> 9 + 1
        return 11 #  fail
    }
    return 0
}
