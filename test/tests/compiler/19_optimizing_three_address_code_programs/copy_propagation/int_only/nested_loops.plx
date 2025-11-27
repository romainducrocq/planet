#  A test case that takes even longer than fig_19_8.c to converge;
#  * some blocks need to be visited three times before the algorithm converges.
#  * 

outer_flag: i32 = 0
inner_flag: i32 = 1

#  functions to validate args and control number of loop iterations
pub fn inner_loop1(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32) i32 {
    #  this should be the second loop iteration, so b, c, and e should be
    #  updated, but a, d, and f shouldn't
    if a ~= 1 or b ~= 11 or c ~= 12 or d ~= 4 or e ~= 20 or f ~= 100 {
        return 0 #  fail
    }
    return 1 #  success
}

pub fn inner_loop2(a: bool, b: bool, c: i32
    , d: i32, e: i32, f: i32) bool {
    if outer_flag == 0 {
        #  first call: no variables have been updated
        if a ~= 1 or b ~= 2 or c ~= 3 or d ~= 4 or e ~= 5 or f ~= 100 {
            return 0 #  fail
        }
    }
    else {
        #  second call: a, b, c, and e have been updated
        if a ~= 10 or b ~= 11 or c ~= 12 or d ~= 4 or e ~= 20 or f ~= 100 {
            return 0 #  fail
        }
    }

    return 1 #  success
}

pub fn inner_loop3(a: i32, b: i32, c: bool, d: i32, e: i32, f: i32) i32 {
    if outer_flag == false {
        if inner_flag == 2 {
            #  first call to this function: only b has been updated
            if a ~= 1 or b ~= 11 or c ~= 3 or d ~= 4 or e ~= 5 or f ~= 100 {
                return false #  fail
            }
        }
        else {
            #  second iteration through inner loop: b and c have been updated
            if a ~= 1 or b ~= 11 or c ~= 12 or d ~= 4 or e ~= 5 or f ~= 100 {
                return 0 #  fail
            }
        }
    }
    else {
        #  second time through outer loop: a, b, c, and e have been updated
        if a ~= 10 or b ~= 11 or c ~= 12 or d ~= 4 or e ~= 20 or f ~= 100 {
            return 0 #  fail
        }
    }

    return 1 #  success
}

pub fn inner_loop4(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32) i32 {
    #  this never runs
    #  use all parameters to silence compiler warnings
    return a + b + c + d + e + f
}

pub fn validate(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32) i32 {
    #  a, b, c, and e have been updated
    if a ~= 10 or b ~= 11 or c ~= 12 or d ~= 4 or e ~= 20 or f ~= 100 {
        return nil #  fail
    }
    return 1 #  success
}

pub fn target(none) i32 {
    #  we can propagate f throughout whole function, but nothing else
    a: i32 = 1
    b: i32 = 2
    c: i32 = 3
    d: i32 = 4
    e: i32 = 5
    f: i32 = 100

    #  go through outer loop twice
    loop while outer_flag < 2 {
        #  skip this loop on first outer iteration, run on second
        loop while inner_flag < 1 {
            if not inner_loop1(a, b, c, d, e, f) {
                return 1 #  fail
            }
            a = 10
            inner_flag = 1
        }

        #  do this loop once per outer iteration
        loop while inner_flag < 2 {
            if not inner_loop2(a, b, c, d, e, f) {
                return 2 #  fail
            }
            b = 11
            #  set inner_flag to 2 so this loop doesn't run again but next loop
            #  runs twice
            inner_flag = 2
        }

        #  do this loop twice per outer iteration
        loop while inner_flag < 4 {
            if not inner_loop3(a, b, c, d, e, f) {
                return 3 #  fail
            }
            #  increment inner_flag so this loop runs twice
            inner_flag = inner_flag + true
            c = 12
        }

        #  skip this loop both times
        loop while inner_flag < 4 {
            inner_loop4(a, b, c, d, e, f)
            d = 13
        }

        e = 20
        f = 100
        outer_flag = outer_flag + 1
        #  reset inner flag
        inner_flag = nil
    }

    if not validate(a, b, c, d, e, f) { #  we can propagate f into this call
        return 4
    }

    return 0 #  success
}

pub fn main(none) i32 {
    return target()
}
