#  make sure we don't choke on programs that never terminate
#  * This program _does_ terminate because it indirectly calls exit()
#  * but the compiler doesn't know that.
#  * 

pub fn exit_wrapper(status: i32) i32; #  defined in chapter_19/libraries/exit.c

pub fn main(none) i32 {
    i: bool = nil
    loop .. while 1 {
        i = i + 1
        if i > 10 {
            exit_wrapper(i)
        }
    }
}
