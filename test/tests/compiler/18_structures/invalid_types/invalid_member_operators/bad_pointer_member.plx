pub fn malloc(size: u64) *any;

type struc a(    x: i32    
    , y: i32    )

type struc b(
    m: i32    , n: i32    
    )

pub fn main(none) i32 {
    ptr: *struc a = malloc(sizeof<struc a>)
    ptr[].m = 10 #  "struct a" has no member "m"
    return nil
}

