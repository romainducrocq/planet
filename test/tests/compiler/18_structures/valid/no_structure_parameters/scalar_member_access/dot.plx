#  Test the . operator.
#  * Relatively simple tests without nested accesses or members of aggregate
#  * types.
#  

type struc four_members(    d: f64    , c: char    
    , l: i64    , ptr: string    )

#  helper functions/variables

#  get_double and l are used to initialize members
pub fn get_double(none) f64 {
    return 2e12
}

l: i64 = 34359738378l

#  validate members (and values derived from members) that are passed as
#  parameters
pub fn accept_params(d_divided: i32, c_doubled: i32, l_cast: f64, dereferenced_ptr: bool, d: f64, c: i32, l: i64
    , ptr: *char) i32 {
    if d ~= 4e12 or c ~= 127 or l ~= 8589934594l or ptr[] ~= 100 or     d_divided ~= 100.0 or c_doubled ~= 254 or l_cast ~= 8589934594.0 or     dereferenced_ptr ~= 100 {
        return 0
    }

    return 1 #  success
}

pub fn test_auto(none) i32 {
    #  test reading, writing, and getting address of members
    #  in struct with automatic storage duration
    autom: struc four_members;

    #  write to all members - assign results of complex expression to members
    autom.d = get_double() * 2.0 #  4e12
    autom.c = 127
    autom.l = l / 4 #  8589934594l

    chr: char = 100
    autom.ptr = @chr

    #  read all members
    if autom.d ~= 4e12 or autom.c ~= 127 or autom.l ~= 8589934594l or     autom.ptr ~= @chr {
        return false
    }

    #  take address of members
    d_ptr: *f64 = @autom.d
    c_ptr: string = @autom.c
    if d_ptr[] ~= 4e12 or c_ptr[] ~= 127 {
        return 0
    }

    #  dereference member
    if autom.ptr[] ~= 100 {
        return 0
    }

    #  read members and use them in complex expressions (e.g. function calls)
    if not accept_params(autom.d / 4e10, autom.c * 2, cast<f64>(autom.l), autom.ptr[],         autom.d, autom.c, autom.l, autom.ptr) {
        return false
    }

    return 1
}

pub fn test_static(none) i32 {
    #  test reading, writing, and getting address of members
    #  in struct with static storage duration
    data stat: struc four_members;
    data chr: char = 100

    #  same test as test_auto above

    #  write to all members - assign results of complex expression to members
    stat.d = get_double() * 2.0 #  4e12
    stat.c = 127
    stat.l = l / 4 #  8589934594l

    stat.ptr = @chr

    #  read all members
    if stat.d ~= 4e12 or stat.c ~= 127 or stat.l ~= 8589934594l or     stat.ptr ~= @chr {
        return 0
    }

    #  take address of members
    d_ptr: *f64 = @stat.d
    c_ptr: string = @stat.c
    if d_ptr[] ~= 4e12 or c_ptr[] ~= 127 {
        return 0
    }

    #  dereference member
    if stat.ptr[] ~= 100 {
        return 0
    }

    #  read members and use them in complex expressions (e.g. function calls)
    if not accept_params(stat.d / 4e10, stat.c * 2, cast<f64>(stat.l), stat.ptr[],         stat.d, stat.c, stat.l, stat.ptr) {
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

    return 0
}

