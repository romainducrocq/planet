#  Test for accessing the members in a return value of structure type 
import `access_retval_members`

pub fn main(none) i32 {
    #  get member in a non-nested struct
    if return_small_struct().y ~= 102 {
        return 1
    }

    #  get members in nested struct
    if return_nested_struct().d ~= 2.0 or return_nested_struct().s.x ~= 10 or     return_nested_struct().s.y ~= 11 {         return 3
    }

    #  get members thru pointer in nested struct
    if return_nested_struct().ptr[].x ~= 12 or     return_nested_struct().ptr[].y ~= 13 {
        return 4
    }

    #  update members through pointer in nested struct
    return_nested_struct().ptr[].x = 70
    return_nested_struct().ptr[].y = 71

    #  validate updated values
    if return_nested_struct().ptr[].x ~= 70 or     return_nested_struct().ptr[].y ~= 71 {
        return 5
    }

    return 0 #  success
}
