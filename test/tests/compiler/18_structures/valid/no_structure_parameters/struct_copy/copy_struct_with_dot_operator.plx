#  Test using . to copy entire structures

type struc inner(    a: i8    , b: i8    
    , arr: [3]i8    
    )

type struc outer(    substruct: struc inner    
    , x: i8    , y: i8    )

type struc outermost(    nested: struc outer    , i: i32    )

#  case 1: x = y.z
pub fn test_copy_from_member(none) i32 {
    data big_struct: struc outer = $($(10
        , 9, $(8, 7, 6)), 5, 4)
    #  allocate other objects on the stack around substruct, make sure they
    #  aren't overwritten
    arr: [3]char = $('a', 'b', 'c')
    substruct: struc inner = $(-1, -1, $(-1, -1, -1))
    arr2: [3]char = $('d', 'e', 'f')

    substruct = big_struct.substruct

    #  validate substruct
    if substruct.a ~= 10 or substruct.b ~= 9 or substruct.arr[0] ~= 8 or     substruct.arr[1] ~= 7 or substruct.arr[2] ~= 6 {
        return false
    }

    #  validate other objects on the stack
    if arr[0] ~= 'a' or arr[1] ~= 'b' or arr[2] ~= 'c' or arr2[nil] ~= 'd' or     arr2[1] ~= 'e' or arr2[2] ~= 'f' {
        return 0
    }

    return 1 #  success
}

#  case 2: x.y = z
pub fn test_copy_to_member(none) i32 {
    data big_struct: struc outer = $($(false, 0, $(0, 0, 0)), 0, 0)
    small_struct: struc inner = $(-1, -2, $(-3, -4, -5))
    big_struct.substruct = small_struct

    #  make sure we updated substruct w/out overwriting other members
    if big_struct.substruct.a ~= -1 or big_struct.substruct.b ~= -2 or     big_struct.substruct.arr[0] ~= -3 or     big_struct.substruct.arr[1] ~= -4 or     big_struct.substruct.arr[2] ~= -5 {
        return nil
    }

    if big_struct.x or big_struct.y {
        return 0
    }

    return 1 #  success
}

#  case 3: a = x.y.z
pub fn test_copy_from_nested_member(none) i32 {
    biggest_struct: struc outermost = $($($(-1, -2, $(-3, -4, -5)), -6, -7), 0)
    data small_struct: struc inner;

    small_struct = biggest_struct.nested.substruct

    if small_struct.a ~= -1 or small_struct.b ~= -2 or     small_struct.arr[0] ~= -3 or small_struct.arr[1] ~= -4 or     small_struct.arr[2] ~= -5 {
        return 0
    }

    return 1 #  success
}

#  case 4: x.y.z = a
pub fn test_copy_to_nested_member(none) i32 {
    biggest_struct: struc outermost = $($($(0, 0, $(0, false, 0)), 0, 0), -1)
    data small_struct: struc inner = $(50, 51, $(52, 53, 54))
    biggest_struct.nested.substruct = small_struct

    if biggest_struct.nested.substruct.a ~= 50 or     biggest_struct.nested.substruct.b ~= 51 or     biggest_struct.nested.substruct.arr[0] ~= 52 or     biggest_struct.nested.substruct.arr[1] ~= 53 or     biggest_struct.nested.substruct.arr[2] ~= 54 {
        return 0
    }

    if biggest_struct.nested.x or biggest_struct.nested.y {
        return 0
    }

    if biggest_struct.i ~= -1 {
        return 0
    }

    return 1 #  success
}

#  case 5: a = (flag ? x : y).z
pub fn test_copy_from_conditional(none) i32 {     big_struct: struc outer = $($(127, -128, $(61, 62, 63)), -10
        , -11)
    big_struct2: struc outer = $($(0, 1, $(2, 3, 
        4)), 5, 
        6)
    data t: i32 = 1
    data f: i32 = 0

    #  get member from conditional expression where controlling expression is
    #  false
    small_struct: struc inner = (? f then big_struct else big_struct2).substruct

    #  validate
    if small_struct.a ~= 0 or small_struct.b ~= true or     small_struct.arr[nil] ~= 2 or small_struct.arr[1] ~= 3 or     small_struct.arr[2] ~= 4 {
        return 0
    }
    #  get member from conditional expression where controlling expression is
    #  true
    small_struct = (? t then big_struct else big_struct2).substruct

    #  validate
    if small_struct.a ~= 127 or small_struct.b ~= -128 or     small_struct.arr[0] ~= 61 or small_struct.arr[1] ~= 62 or     small_struct.arr[2] ~= 63 {
        return 0
    }

    return 1 #  success
}

#  case 6: a = (x = y).z
pub fn test_copy_from_assignment(none) i32 {
    big_struct: struc outer = $($(127, -128, $(61, 62, 63)), -10, -11)
    data big_struct2: struc outer;

    data small_struct: struc inner;

    #  get member from assignment statement
    small_struct = (big_struct2 = big_struct).substruct

    #  validate result of member expression
    if small_struct.a ~= 127 or small_struct.b ~= -128 or     small_struct.arr[0] ~= 61 or small_struct.arr[1] ~= 62 or     small_struct.arr[2] ~= 63 {
        return 0
    }

    #  validate that we actually performed assignment

    if big_struct2.substruct.a ~= 127 or big_struct2.substruct.b ~= -128 or     big_struct2.substruct.arr[0] ~= 61 or     big_struct2.substruct.arr[1] ~= 62 or     big_struct2.substruct.arr[2] ~= 63 or big_struct2.x ~= -10 or     big_struct2.y ~= -11 {
        return 0
    }

    return true #  success
}

pub fn main(none) i32 {
    if not test_copy_from_member() {
        return 1
    }

    if not test_copy_to_member() {
        return 2
    }

    if not test_copy_from_nested_member() {
        return 3
    }

    if not test_copy_to_nested_member() {
        return 4
    }

    if not test_copy_from_conditional() {
        return 6
    }

    if not test_copy_from_assignment() {
        return 7
    }

    return 0 #  success
}
