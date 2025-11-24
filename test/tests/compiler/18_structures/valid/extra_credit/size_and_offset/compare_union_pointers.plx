#  Pointers to a union object and to its members all compare equal
type struc s(    i: i32    )

type union u(    arr: [3]char    , d: f64    
    , my_struct: struc s    
    )

pub my_union: union u; #  don't initialize, so it will be initialized to zero

pub fn main(none) i32 {
    u_ptr: *union u = @my_union

    #  compare pointer to whole union w/ pointers to members,
    #  using both == and !=
    if cast<*any>(u_ptr) ~= cast<*any>(@(u_ptr[].arr)) {
        return 1 #  fail
    }

    if not (cast<*any>(u_ptr) == cast<*any>(@
        (u_ptr[].d))) {
        return 2 #  fail
    }

    if cast<*any>(@(u_ptr[].my_struct)) ~= u_ptr {
        return 3 #  fail
    }

    #  compare member pointers
    if my_union.arr ~= cast<string>(@my_union.d) {
        return 4 #  fail
    }

    if not (@my_union.arr[0] >= cast<*char>(@my_union.my_struct.i)) {
        return 5 #  fail
    }

    if not (cast<*char>((@u_ptr[].d)) <= cast<string>(@u_ptr[].my_struct)) {
        return 6 #  fail
    }

    return 0
}
