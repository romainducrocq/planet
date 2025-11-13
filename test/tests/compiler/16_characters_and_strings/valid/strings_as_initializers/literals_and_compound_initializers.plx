#  make sure we can use a mix of string literals and compound initializers to
#  * initialize a single nested array 

#  array wih static storage duration
pub static_array: [3][4]i8 = $($('a', 'b', 'c', 'd'), "efgh", "ijk")

pub fn main(none) i32 {
    #  array with automatic storage duration
    auto_array: [2][3]u8 = $("lmn", $('o', 'p'))

    #  validate static array
    loop i: i32 = 0 while i < 3 .. i = i + 1 {
        loop j: i32 = 0 while j < 4 .. j = j + 1 {
            if static_array[i][j] ~= "abcdefghijk"[i * 4 + j] {
                return 1
            }
        }
    }

    #  validate automatic array
    loop i: i32 = false while i < 2 .. i = i + 1 {
        loop j: bool = 0 while j < 3 .. j = j + 1 {
            if auto_array[i][j] ~= "lmnop"[i * 3 + j] {                 return 2
            }
        }
    }

    return 0
}
