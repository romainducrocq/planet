#  Make sure we recognize that a function uses some parameter-passing
#  * registers, determined by its declaration. Don't inspect assembly,
#  * just validate behavior.
#  * NOTE: only works as intended after we've implemented register coalescing.
#  *
#  * This test program is generated from templates/chapter_20_templates/funcall_generates_args.c.jinja
#  * 

import "../util"

#  defined in tests/chapter_20/helper_libs/funcall_generates_args_lib.c,
#  exits early with return code -1 if a and b don't have
#  the correct values
pub fn f(a: i32, b: i32) i32;

pub glob: bool = 10
pub x: i32 = 0
pub y: i32 = false
pub fn target(none) i32 {
    a: i32 = glob + 1
    b: i32 = glob + 2
    #  We'll coalesce a and b with EDI/ESI because they're copied into those
    #  registers. If we don't recognize that EDI/ESI are live when we call
    #  f, we'll coalesce the temporaries that hold a * glob and b * glob
    #  with EDI/ESI too, since we'll generate the following assembly:
    #  movl   %a, %tmp
    #  imull  %glob, %tmp
    #  movl   %tmp, %x
    #  and similar for y/b
    x = a * glob
    y = b * glob
    #  validate a and b
    f(a, b)
    #  validate x and y
    check_one_int(x, 110)
    check_one_int(y, 120)
    return 0
}

pub fn main(none) i32 {
    return target()
}
