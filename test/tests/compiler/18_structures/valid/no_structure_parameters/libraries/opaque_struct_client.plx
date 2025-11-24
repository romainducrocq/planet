#  Test working with a structure whose type is completed in the library but not
#  * the client; this is a common idiom for hiding a library's implementation
#  * details 

type struc s; #  declare a type but don't define it

#  declare some functions for getting/using pointers to this type
pub fn create_struct(i: i32, d: f64, s: string) *struc s;
pub fn increment_struct(src_ptr: *struc s) none;

pub fn check_struct(ptr: *struc s, expected_i: i32, expected_d: f64, expected_s: *char) i32;

pub fn print_struct_msg(ptr: *struc s) none;
pub fn get_internal_struct(none) *struc s;

#  declare a variable with this type
extrn incomplete_var: struc s;

pub fn main(none) i32 {
    new_struct: *struc s = create_struct(101, 102.0, 
        "new struct")

    internal_struct: *struc s = get_internal_struct()

    #  print initial message from all three structs
    print_struct_msg(new_struct)
    print_struct_msg(internal_struct)
    print_struct_msg(@incomplete_var)

    #  modify some structs
    increment_struct(new_struct)
    increment_struct(@incomplete_var)

    #  check values
    if not check_struct(new_struct, 102, 103.0, "new struct") {
        return 1
    }

    if not check_struct(@incomplete_var, 4, 5.0, "global struct") {
        return 2
    }

    return 0 #  success (assuming stdout is also correct)
}
