pub fn malloc(size: u64) *any;

type struc a(    x: i32    
    , y: i32    )

pub fn main(none) i32 {
    ptr: *struc a = malloc(sizeof<struc a>)
    ptr.x = 10 #  can't apply . operator to struct pointer
}
