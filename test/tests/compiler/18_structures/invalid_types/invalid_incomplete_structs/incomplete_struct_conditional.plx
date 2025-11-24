type struc s;

extrn v1: struc s;
extrn v2: struc s;

pub fn main(none) i32 {
    ?     #  can't use expressions with incomplete structure type as branches in conditional expression
    1 then v1 else v2
}
