type struc s;

pub fn f(param: struc s) none;

extrn extern_var: struc s;

pub fn main(none) i32 {
    #  can't pass a variable with incomplete type as an argument
    f(extern_var)
}
