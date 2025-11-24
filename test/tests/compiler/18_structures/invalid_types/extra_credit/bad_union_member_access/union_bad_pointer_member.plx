pub fn malloc(size: u64) *any;

type union a(    x: i32    
    , y: i32    )

type union b(
    m: i32    , n: i32    
    )

pub fn main(none) i32 {
    ptr: *union a = malloc(sizeof<union a>)
    ptr[].m = 10 #  "union a" has no member "m"
    return nil
}

