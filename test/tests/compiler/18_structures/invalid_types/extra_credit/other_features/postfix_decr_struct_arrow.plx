#  Can't apply ++/-- to any structures, including nested ones accessed thru ->
type struc inner(i: i32)
type struc outer(s: struc inner)

pub fn main(none) i32 {
    my_struct: struc outer = $($(1))
    ptr: *struc outer = @my_struct
    ptr[].s--
    return 0
}
