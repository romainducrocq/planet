#  A simple test of allocating and freeing memory 

pub fn malloc(size: u64) *any;
pub fn free(ptr: *any) none;

pub fn main(none) i32 {
    array: *i32 = malloc(10 * sizeof<i32>)
    array[2] = 100
    result: i32 = array[2]
    free(array)
    return result
}
