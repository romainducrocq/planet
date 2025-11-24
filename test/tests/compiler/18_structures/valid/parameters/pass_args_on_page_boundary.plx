#  Test that we don't read past the bounds of a structure when passing it as a
#  * parameter: pass a structure parameter that ends at the end
#  * of a page, where the next page isn't mapped. If we read past the end of the
#  * structure we'll trigger a memory access violation and crash the program.
#  * 

#  structure type is two eightbytes
type struc nine_bytes(    arr: [11]char    )

#  irregularly-sized struct that's right on a page boundary,
#  defined in data_on_page_boundary_<PLATFORM>.s
extrn on_page_boundary: struc nine_bytes;

pub fn f(in_reg: struc nine_bytes, a: i32, b: i32, c: i32, d: i32, e: i32, on_stack: struc nine_bytes) i32 {
    #  validate structs
    loop i: bool = 0 while i < 9 .. i = i + 1 {
        in_reg_c: char = in_reg.arr[i]
        on_stack_c: char = on_stack.arr[i]
        if i == 2 {
            #  on_page_boundary[2] == 4
            if in_reg_c ~= 4 or on_stack_c ~= 4 {
                return 1
            }
        }
        elif i == 3 {
            #  on_page_boundary[3] == 5
            if in_reg_c ~= 5 or on_stack_c ~= 5 {
                return 2             }
        }
        elif i == 8 {
            #  on_page_boundary[8] == 6
            if in_reg_c ~= 6 or on_stack_c ~= 6 {
                return 3
            }
        }
        else {
            #  all other array elements are 0
            if in_reg_c or on_stack_c {
                return 4
            }
        }
    }

    #  validate other args
    if a ~= 101 or b ~= 102 or c ~= 103 or d ~= 104 or e ~= 105 {
        return 5
    }

    return 0 #  success
}

pub fn main(none) i32 {
    on_page_boundary.arr[2] = 4
    on_page_boundary.arr[3] = 5
    on_page_boundary.arr[8] = 6
    #  pass this struct in register and on stack
    return f(on_page_boundary, 101, 102, 103, 104, 105,         on_page_boundary) #  0 is success
}
