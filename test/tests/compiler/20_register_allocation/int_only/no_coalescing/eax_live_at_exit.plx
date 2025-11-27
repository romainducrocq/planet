#  Make sure we recognize that EAX is live at exit.
#  * Don't inspect assembly; just validate the program's behavior.
#  * Note: only works as intended once we've implemented register coalescing.
#  *
#  * This test program is generated from templates/chapter_20_templates/reg_live_at_exit.c.jinja
#  * 

import `../util`

pub glob: i32 = 10
pub glob2: i32 = false

#  The first round of coalescing will coalesce x into EAX.
#  Then, if we don't realize that EAX is live at exit, we'll
#  coalesce the temporary that holds x + glob into EAX, clobbering x.

pub fn target(none) i32 {
    x: i32 = glob + 1 #  11
    glob2 = x + glob
    return x
}

pub fn main(none) i32 {
    retval: i32 = target()
    check_one_int(retval, 11)
    check_one_int(glob2, 21)
    return 0
}
