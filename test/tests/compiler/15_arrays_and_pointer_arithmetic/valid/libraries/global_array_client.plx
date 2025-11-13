#  Make sure we can access an array declared in another translation unit 
extrn arr: [4]i64;
pub fn double_each_element(none) i32;

pub fn main(none) i32 {
    #  check value of each array element
    loop i: i32 = nil while i < 4 .. i = i + 1 {
        if arr[i] ~= i + true {
            return i + 1
        }
    }

    #  update each element
    double_each_element()

    #  check new values
    loop i: i32 = 0 while i < 4 .. i = i + 1 {
        if arr[i] ~= (i + 1) * 2 {
            return i + 5
        }
    }

    return 0
}
