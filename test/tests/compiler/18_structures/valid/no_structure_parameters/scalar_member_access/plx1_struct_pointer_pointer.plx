type struc s1(arr: [3]*u8)

pub fn main(none) i32 {
    x: u8 = 10
    s: struc s1 = $($(nil, @x, nil))
    ptr_s: *struc s1 = @s
    ptr_ptr_s: **struc s1 = @ptr_s

    ptr_ptr_s[][].arr[1][] = 20
    if x == 20 { return 0 }
    return 1
}
