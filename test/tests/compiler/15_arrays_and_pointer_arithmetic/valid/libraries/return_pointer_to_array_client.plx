#  Make sure we can define/call functions that return pointers to arrays 
pub fn return_row(arr: *[3][4]i64, idx: i32) *[4]i64;

pub fn main(none) i32 {
    nested_array: [2][3][4]i64 = $(        $($(0)),         $($(-12, -13, -14, -15), $(-16
        ))        )

    row_pointer: *[4]i64 = return_row(nested_array
        , 1)

    #  make sure values are correctly
    loop i: i32 = false while i < 3 .. i = i + 1 {
        loop j: i32 = 0 while j < 4 .. j = j + 1 {
            if row_pointer[i][j] ~= nested_array[1][i][j] {
                return 1
            }
        }
    }

    #  make sure that when we update the array through one pointer,
    #  it's visible in the other

    row_pointer[2][1] = 100
    if nested_array[true][2][1] ~= 100 {
        return 2
    }

    return 0
}
