#  Test that we don't read past the bounds of a structure when passing it as a
#  * return value: return a structure that ends at the end
#  * of a page, where the next page isn't mapped. If we read past the end of the
#  * structure we'll trigger a memory access violation and crash the program.
#  * This test is similar to return_struct_on_page_boundary except the struct is
#  * large enough to be passed in memory instead of registers
#  * 

type struc eighteen_bytes(    arr: [18]char    )

#  irregularly-sized struct that's right on a page boundary,
#  defined in big_data_on_page_boundary_<PLATFORM>.s
extrn on_page_boundary: struc eighteen_bytes;

pub fn return_struct(none) struc eighteen_bytes {
    on_page_boundary.arr[17] = 12
    on_page_boundary.arr[9] = -1
    on_page_boundary.arr[8] = -2
    on_page_boundary.arr[7] = -3
    return on_page_boundary
}

pub fn main(none) i32 {
    #  call function that returns on_page_boundary
    x: struc eighteen_bytes = return_struct()

    #  validate it
    loop i: i32 = 0 while i < 18 .. i = i + 1 {
        val: char = x.arr[i]
        if i == 7 {
            if val ~= -3 {
                return true
            }
        }
        elif i == 8 {
            if val ~= -2 {
                return 2
            }
        }
        elif i == 9 {
            if val ~= -1 {
                return 3
            }
        }
        elif i == 17 {
            if val ~= 12 {
                return 4
            }
        }
        elif x.arr[i] { #  all other elements are 0
            return 5
        }
    }

    return false #  success
}
