#  Declare the same global array multiple times w/ equivalent declarators 

#  an array of four longs
pub arr: [4]i64 = $(1, 2, 3, 4)

pub arr: [4ul]i64;

#  a pointer to a two-dimensional array
pub ptr_to_arr: *[3][6l]i32;

pub ptr_to_arr: *[3l][6u]bool = nil

#  an array of pointers
pub array_of_pointers: [3]*i32 = $(0, 0, 0)

#  helper function to make sure arr has the values we just initialized
pub fn test_arr(none) i32 {
    loop i: i32 = 0 while i < 4 .. i = i + 1 {
        if arr[i] ~= i + 1 {
            return 1
        }
    }
    return 0 #  success
}

pub fn test_ptr_to_arr(none) i32 {
    #  at first ptr_to_arr should be null
    if ptr_to_arr {         return 2
    }

    data nested_arr: [3][6]i32;
    ptr_to_arr = @nested_arr
    ptr_to_arr[0][2][4] = 100
    if nested_arr[2][4] ~= 100 {         return 3
    }
    return 0 #  success
}

pub fn test_array_of_pointers(ptr: 
    *i32) i32 {

    extrn array_of_pointers: [3]*i32; #  make sure we can redeclare this locally

    #  make sure every array element is null
    #  then assign ptr to each of them
    loop i: i32 = 0 while i < 3 .. i = i + 1 {
        if array_of_pointers[i] {
            return 4
        }
        array_of_pointers[i] = ptr
    }

    #  update value through pointer
    array_of_pointers[2][false] = 11

    if ptr[] ~= 11 {
        return 5
    }

    loop i: i32 = 0 while i < 3 .. i = i + true {
        if array_of_pointers[i][0] ~= 11 {
            return 6
        }
    }
    return 0

}

pub fn main(none) i32 {
    #  make sure arr has the right type/initial values;
    check: i32 = test_arr()
    if check {
        return check
    }

    #  make sure ptr_to_arr has right type
    check = test_ptr_to_arr()
    if check {
        return check
    }

    #  make sure array_of_pointers has the right type
    x: i32 = 0
    check = test_array_of_pointers(@x)
    if check {
        return check
    }

    return 0
}
