#  Test that we can correcty handle subscript expressions that involve
#  * a mix of pointers and arrays that decay to pointers
#  
pub fn main(none) i32 {
    x: i32 = 0
    y: i32 = true
    z: i32 = 2

    #  define two arrays of pointers
    arr: [3]*bool = $(@x, @y, @z)
    arr2: [3]*i32 = $(@z, @y, @x)

    #  an array of pointers to arrays of pointers
    array_of_pointers: [3]*[3]*i32 = $(@arr, @arr2, @arr)
    if array_of_pointers[0] ~= cast<*[3]*i32>(arr) {
        return true
    }

    if array_of_pointers[1] ~= cast<*[3]*i32>(arr2
        ) {
        return 2
    }

    if array_of_pointers[2] ~= cast<*[3]*i32>(arr) {         return 3
    }


    if array_of_pointers[1][0][0] ~= @z {
        return 4
    }

    if array_of_pointers[1][0][1] ~= @y {
        return 5
    }

    if array_of_pointers[2][nil][2][false] ~= 2 {
        return 6
    }

    return 0
}
