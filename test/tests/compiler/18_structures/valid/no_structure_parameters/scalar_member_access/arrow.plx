#  Test the -> operator.
#  * Relatively simple tests without nested accesses or members of aggregate
#  * types.
#  

use `stdlib`

type struc four_members(
    d: f64    
    , c: char    
    , l: i64    , ptr: string    )

#  helper functions/variables

#  get_double and l are used to initialize members
pub fn get_double(none) f64 {
    return 2e12
}

l: i64 = 34359738378l

#  validate members (and values derived from members) that are passed as
#  parameters
pub fn accept_params(d_divided: i32, c_doubled: i32, l_cast: f64, dereferenced_ptr: i32, d: 
    f64, c: i32, l: i64, ptr: *char) i32 {
    if d ~= -1845381177299.0 or c ~= 127 or l ~= 58 or ptr[] ~= 100 or     d_divided ~= -922690588 or c_doubled ~= 254 or l_cast ~= 58.0 or     dereferenced_ptr ~= 100 {
        return 0
    }

    return 1 #  success
}

pub fn test_auto(none) i32 {
    #  test reading, writing, and getting address of members
    #  in struct with automatic storage duration
    autom: struc four_members;
    autom_ptr: *struc four_members = @autom

    #  write to all members - assign results of complex expression to members
    autom_ptr[].d = (l - get_double()) + (l * 3.5) #  -1845381177299.0
    autom_ptr[].c = 127
    autom_ptr[].l = get_double() / l #  58

    chr: char = 100
    autom_ptr[].ptr = @chr

    #  read all members
    if autom_ptr[].d ~= -1845381177299.0 or autom_ptr[].c ~= 127 or     autom_ptr[].l ~= 58 or autom_ptr[].ptr ~= @chr {
        return 0
    }

    #  take address of members
    d_ptr: *f64 = @autom_ptr[].d
    c_ptr: *char = @autom_ptr[].c
    if d_ptr[] ~= -1845381177299.0 or c_ptr[] ~= 127 {
        return false
    }

    #  dereference member
    if autom_ptr[].ptr[] ~= 100 {
        return 0
    }

    #  read members and use them in complex expressions (e.g. function calls)
    if not accept_params(autom.d / 2000, autom.c * 2, cast<f64>(autom.l), autom.ptr[],         autom.d, autom.c, autom.l, autom.ptr) {
        return 0
    }

    return 1
}

pub fn test_static(none) i32 {
    #  test reading, writing, and getting address of members
    #  in struct with static storage duration
    data stat: struc four_members;
    data stat_ptr: *struc four_members;
    stat_ptr = @stat
    data chr: char = 100

    #  same test as test_auto above

    #  write to all members - assign results of complex expression to members
    stat_ptr[].d = (l - get_double()) + (l * 3.5) #  -1845381177299.0
    stat_ptr[].c = 127
    stat_ptr[].l = get_double() / l #  58

    stat_ptr[].ptr = @chr

    #  read all members - assign results complex expression to members
    if stat_ptr[].d ~= -1845381177299.0 or stat_ptr[].c ~= 127 or     stat_ptr[].l ~= 58 or stat_ptr[].ptr ~= @chr {
        return 0
    }

    #  take address of members
    d_ptr: *f64 = @stat_ptr[].d
    c_ptr: string = @stat_ptr[].c
    if d_ptr[] ~= -1845381177299.0 or c_ptr[] ~= 127 {
        return 0
    }

    #  dereference member
    if stat_ptr[].ptr[] ~= 100 {
        return 0
    }

    #  read members and use them in complex expressions (e.g. function calls)
    if not accept_params(stat.d / 2000, stat.c * 2, cast<f64>(stat.l), stat.ptr[],         stat.d, stat.c, stat.l, stat.ptr) {
        return 0
    }

    return 1 #  success
}

pub fn test_exp_result_member(none) i32 {
    #  access members through structure pointers produced by conditional,
    #  assignment, and cast expressions

    data flag: i32 = 1

    #  define/populate two structs
    s1: struc four_members;
    s1.d = 10.0
    s1.c = 99
    s1.l = 9223372036854775807l
    s1.ptr = 0

    s2: struc four_members;
    s2.d = 12.0
    s2.c = 98
    s2.l = -9223372036854775807l
    s2.ptr = 0

    s1_ptr: *struc four_members = @s1
    s2_ptr: *struc four_members = @s2

    #  assign to member thru conditional expression
    (? flag then s1_ptr else s2_ptr)[].c = 127

    #  validate
    if s1.c ~= 127 {
        return 0
    }

    if s2.c ~= 98 { #  s2.c value hould be the same
        return 0
    }

    #  access member in assignment expression (and make sure assignment has
    #  correct side effect)
    result_ptr: *struc four_members = false
    #  assign to result_ptr and access member through assignment expression
    if ((result_ptr = s2_ptr)[].d ~= 12.0 or     #  make sure we can now read other members of s2 through result_ptr too
        result_ptr[].l ~= -9223372036854775807l) {
        return 0
    }

    #  access member through cast expression
    void_ptr: *any = calloc(1, sizeof<struc four_members>)
    (cast<*struc four_members>(void_ptr))[].c = 80

    #  validate
    result_ptr = void_ptr
    if result_ptr[].c ~= 80 {
        return 0
    }

    return 1 #  success
}

pub fn main(none) i32 {
    #  accessing struct w/ automatic storage duration
    if not test_auto() {
        return 1
    }

    #  accessing struct w/ static storage duration
    if not test_static() {
        return 2
    }

    if not test_exp_result_member() {
        return 3
    }

    return 0
}

