type struc s;

#  it's illegal to define a file scope variable (or any variable)
#  with an incomplete structure type
#  (some compilers allow tentative definitions if the var has external linkage
#  and the  type is completed
#  later in the same translation unit, but we don't.)
x: struc s;

pub fn main(none) i32 {
    return 0
}
