type struc s;

extrn x: struc s;

pub fn main(none) i32 {
    #  can't use expression w/ incomplete struct type as expression statement
    loop x {
        ;
    }
    return 0
}
