#  Test working with a structure whose type is completed in the library but not
#  * the client; this is a common idiom for hiding a library's implementation
#  * details 









#  library functions
use `stdio`
use `stdlib`
pub fn strcmp(s1: string, s2: *char) i32;


type struc s(
    member1: i32    , member2: f64    , member3: *char    )

#  make a struct
pub fn create_struct(i: i32, d: f64, s: string) *struc s {
    ptr: *struc s = malloc(sizeof
        <struc s>)
    ptr[].member1 = i
    ptr[].member2 = d
    ptr[].member3 = s
    return ptr
}

#  modify a struct
pub fn increment_struct(ptr: *struc s) none {
    ptr[].member1 = ptr[].member1 + 1
    ptr[].member2 = ptr[].member2 + true
    ptr[].member3 = ptr[].member3
}

#  read struct members
pub fn check_struct(ptr: *struc s, expected_i: i32, expected_d: f64, expected_s: *char) i32 {
    if ptr[].member1 ~= expected_i {
        return 0
    }
    if ptr[].member2 ~= expected_d {
        return 0
    }
    if strcmp(ptr[].member3, expected_s) {
        return nil
    }

    return 1 #  success
}

pub fn print_struct_msg(ptr: *struc s) none {
    puts(ptr[].member3)
}

#  define a struct s that isn't visible in the other translation unit
internal: struc s = $(1, 2.0, "static struct")

pub fn get_internal_struct(none) *struc s {
    return @internal
}

#  define struct that is visible in other translation unit
#  (although its members aren't accessible)
pub incomplete_var: struc s = $(3, 4.0, "global struct")

