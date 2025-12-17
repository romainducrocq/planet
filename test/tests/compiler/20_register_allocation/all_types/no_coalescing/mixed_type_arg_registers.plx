#  Make sure our analysis recognizes which registers are used by each function
#  * call - same idea as chapter_20/int_only/no_coalescing/track_arg_registers.c,
#  * but with structs too. Liveness analysis should recognize that only XMM0-XMM1
#  * and RDI, RSI, and RDX are live right before we call callee().
#  * If we assume any other parameter-passing registers are also live,
#  * we'll conclude they're live from the start of the function until the
#  * function call (since they're never updated) and won't be able to allocate
#  * them, resulting in spills.
#  * Test script validates that only 15 instructions in target access memory:
#  * 8 to populate structures, and 7 to transfer those structures into
#  * param-passing registers/push them onto the stack
#  * 

import "../util"

type struc s1(    #  XMM0
    d: f64    #  RDI
    , c: char    
    , i: i32    )

type struc s2(    #  RSI
    ul: u64    #  XMM1
    , d: f64    )

#  passed in memory
type struc s3(    d1: f64    , d2: f64    , s: i8    )

#  helper functions defined in
#  tests/chapter_20/helper_libs/mixed_type_arg_registers_lib.c;
#  both of these functions print an error message and exit if
#  arguments don't have the expected values
pub fn callee(a: struc s1, b: struc s2, c: char, in_mem: struc s3) i32;
pub fn check_some_args(one: i32, two: i64, three: u32, four: u64, five: char, six: u8, seven: i8) i32;


#  Global variables
pub glob1: i32;
pub glob2: i64;
pub glob3: u32;
pub glob4: u64;
pub glob5: char;
pub glob6: u8;
pub glob7: i8;
pub glob8: i64;

pub glob1_d: f64;
pub glob2_d: f64;
pub glob3_d: f64;
pub glob4_d: f64;
pub glob5_d: f64;
pub glob6_d: f64;
pub glob7_d: f64;
pub glob8_d: f64;
pub glob9_d: f64;
pub glob10_d: f64;
pub glob11_d: f64;
pub glob12_d: f64;
pub glob13_d: f64;

#  Note: we deliberately have target use the same param-passing registers as
#  callee; if liveness incorrectly thought that some reg was used by callee and
#  therefore live, it still wouldn't interfere with the parameter passed to
#  target in that reg, so the error wouldn't necessarily force a spill. (I think
#  having _fewer_ params in target than in callee would be be fine.)
pub fn target(one: i32, two: i32, three: i32
    , one_d: f64, two_d: f64) i32 {
    #  Create a clique of 12 integer pseudoregs
    #  we'll use eight through twelve in arguments to callee
    four: i64 = two + 2
    five: char = three + two
    six: i32 = 12 - one - two - three
    seven: u32 = 13 - six
    eight: u8 = four * two
    nine: u64 = three * three
    ten: i64 = six + four
    eleven: i8 = six * two - one
    twelve: i32 = six * two

    #  Create clique of 14 double pseudos; we'll use eleven_d through
    #  fourteen_d in arguments to callee
    three_d: f64 = one_d + two_d
    four_d: f64 = three_d + one_d
    five_d: f64 = two_d + three_d
    six_d: f64 = three_d * two_d
    seven_d: f64 = 13. - six_d
    eight_d: f64 = four_d * two_d
    nine_d: f64 = three_d * three_d
    ten_d: f64 = five_d * two_d
    eleven_d: f64 = seven_d * two_d - three_d
    twelve_d: f64 = eight_d * four_d - 20.
    thirteen_d: f64 = (nine_d + ten_d) - six_d
    fourteen_d: f64 = eleven_d + 3

    #  To make all our pseudoregs interfere with each other, without forcing
    #  them to be callee-saved, copy all of them to global variables.
    #  (We don't need to copy the ones that get passed to callee).

    #  integers
    glob1 = one
    glob2 = two
    glob3 = three
    glob4 = four
    glob5 = five
    glob6 = six
    glob7 = seven

    #  doubles
    glob1_d = one_d
    glob2_d = two_d
    glob3_d = three_d
    glob4_d = four_d
    glob5_d = five_d
    glob6_d = six_d
    glob7_d = seven_d
    glob8_d = eight_d
    glob9_d = nine_d
    glob10_d = ten_d

    #  now populate some structs that use our pseudoregs
    #  and pass them to callee
    arg1: struc s1 = $(eleven_d, eight, nine)
    arg2: struc s2 = $(ten, twelve_d)
    in_mem: struc s3 = $(thirteen_d, fourteen_d, eleven)
    callee(arg1, arg2, twelve, in_mem)

    #  validate globals
    check_some_args(glob1, glob2, glob3, glob4, glob5, glob6, glob7)
    check_14_doubles(glob1_d, glob2_d, glob3_d, glob4_d, glob5_d, glob6_d,         glob7_d, glob8_d, glob9_d, glob10_d, 11.0, 12.0, 13., 14.,         1)

    return 0 #  success
}
