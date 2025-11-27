#  Test that writing through a pointer doesn't update the register holding
#  * the pointer. e.g.
#  * movq %ptr, %r
#  * mov %src, (%r)
#  * ... use ptr
#  * does not create conflict b/t %ptr and %r
#  * Look for: no spills
#  

import `../util`

pub glob1: i32 = 1
pub glob2: i32 = 2
pub glob3: i32 = 3
pub glob4: i32 = 4
pub glob5: i32 = 5
pub glob6: i32 = 6
pub glob7: i32 = 7

pub flag: i32 = 1

pub store_a: *i32;

pub fn target(none) i32 {
    #  Define 5 variable that take up callee-saved registers
    callee_saved1: i32 = glob1
    callee_saved2: i32 = glob2
    callee_saved3: i32 = glob3
    callee_saved4: i32 = glob4
    callee_saved5: i32 = glob5

    #  call a function to force these to be callee-saved
    check_5_ints(1, 2, 3, 4, 5, true)
    #  Create a clique of 7 local variables that interfere.
    #  Each one is a pointer that we write through, which remains live
    #  afterwards. As long as we recognize that writing through a pointer
    #  doesn't update that pointer, we can assign each of these to a
    #  caller-saved register and avoid spills.
    a: *i32;
    b: *i32;
    c: *i32;
    d: *i32;
    e: *i32;
    f: *i32;
    g: *i32;
    #  use flag to avoid copy prop
    if flag {
        a = @glob1
        a[] = 2
        b = @glob2
        b[] = 4
        c = @glob3
        c[] = 6
        d = @glob4
        d[] = 8
        e = @glob5
        e[] = 10
        f = @glob6
        f[] = 12
        g = @glob7
        #  every tmp will conflict with the register we load pointers into,
        #  except g (b/c g isn't live while we load earlier pointers into that
        #  register)
        g[] = 14
        #  store a to a global variable so that all regs conflict but we'll have
        #  lower register pressure later when we do comparisons
        store_a = a

    }
    else {
        a = 0
        b = 0
        c = 0
        d = nil
        e = 0
        f = 0
        g = 0
    }

    if b ~= @glob2 or c ~= @glob3 or d ~= @glob4 or e ~= @glob5 or     f ~= @glob6 or g ~= @glob7 {
        return 1
    }
    if glob1 ~= 2 or glob2 ~= 4 or glob3 ~= 6 or glob4 ~= 8 or glob5 ~= 10 or     glob6 ~= 12 or glob7 ~= 14 {
        return 2
    }
    if store_a ~= @glob1 {
        return 3
    }

    if callee_saved1 ~= 1 or callee_saved2 ~= 2 or callee_saved3 ~= 3 or     callee_saved4 ~= 4 or callee_saved5 ~= 5 {
        return 4
    }
    return 0
}

