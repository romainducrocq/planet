#  make sure values of doubles are preserved across function calls
#  * (they must be on the stack, since XMM regs are all caller-saved).
#  * Just validate behavior, don't inspect assembly.
#  

pub glob: f64 = 3.0

pub fn callee(none) f64; #  defined in tests/chapter_20/helper_libs/clobber_xmm_regs_(linux|os_x).s

pub fn main(none) i32 {
    d: f64 = glob
    x: f64 = callee()
    return (d + x == 13.0)
}
