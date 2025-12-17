#  Test that we coalesce floating-point pseudos into XMM registers when they
#  * pass the George test. In this case, coalescing lets us get rid of all moves
#  * between registers. We inspect the assembly for the dbl_target function to
#  * validate that it contains at most one spilled operand, and no mov
#  * instructions whose source and destination are both XMM registers.
#  *
#  * This test was generated from templates/chapter_20_templates/george_coalesce.c.jinja.
#  * 

import "../util"

pub glob: f64 = 4.0


#  1. Validate eight function parameters.
#  *    Purpose: make sure they're coalesced into param-passing registers.
#  * 2. Calculate nine pseudoregisters and pass eight of them into
#  *    check_14_doubles.
#  *    Purpose: make sure they're coalesced into param-passing registers.
#  * 3. Validate ninth pseudoregister.
#  *    Purpose: make this pseudoregister conflict with all hard registers,
#  *    ensuring that all hard registers have significant degree. This prevents
#  *    us from coalescing pseudos into hardregs using the Briggs test, to
#  *    force the compiler to use the George test.
#  * 4. Call check_one_double and return the result.
#  *    Purpose: make sure return value is coalesced into XMM0.
#  
pub fn dbl_target(a: f64, b: f64, c: f64, d: f64, e: f64, f: f64, g: f64, h: f64) f64 {
    #  Validate parameters a-h (not with check_* functions, to avoid adding
    #  new interference)
    if a ~= 1.0 {
        return 1.0
    }
    if b ~= 2.0 {
        return 2.0
    }
    if c ~= 3.0 {
        return 3.0
    }
    if d ~= 4.0 {
        return 4.0
    }
    if e ~= 5.0 {
        return 5.0
    }
    if f ~= 6.0 {
        return 6.0
    }
    if g ~= 7.0 {
        return 7.0
    }
    if h ~= 8.0 {
        return 8.0
    }

    #  Now make sure values passed as arguments are coalesced into
    #  parameter-passing registers. Calculate using glob so we can't
    #  copy prop or constant fold them, and don't need to mov values
    #  between registers to calculate them.
    s: f64 = glob - 3.0 #  1.0
    t: f64 = glob - 2.0 #  2.0
    u: f64 = glob - 1.0 #  3.0
    v: f64 = glob * 2.0 - 4.0 #  4.0
    w: f64 = glob + 1.0 #  5.0
    x: f64 = glob + 2.0 #  6.0
    y: f64 = glob + 3.0 #  7.0
    z: f64 = glob * 2.0 #  8.0
    spill: f64 = w * 10.0 #  50.0
    check_14_doubles(s, t, u, v, w, x, y, z, 9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 1.0)

    #  validate spill
    if spill ~= 50.0 {
        return 9.0
    }


    #  make sure return value is coalesced into XMM0
    return check_one_double(glob, 4.0)
}
