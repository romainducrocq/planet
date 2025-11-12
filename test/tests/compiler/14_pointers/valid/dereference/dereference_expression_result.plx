#  Make sure we can dereference any expression of pointer type,
#  * not just variables 

pub fn return_pointer(none) *i32 {
    data var: i32 = 10
    return @var
}

pub one: i32 = 1

pub fn main(none) bool {
    val: i32 = 100
    ptr_var: *i32 = @val

    #  First try reading pointers that result from function call
    if return_pointer()[] ~= 10 {
        return 1
    }

    #  Now dereference pointers from ternary expressions
    if (? one then return_pointer() else ptr_var)[] ~= 10 {
        return 2
    }

    if (? one - 1 then return_pointer() else ptr_var)[] ~= 100 {
        return 3
    }


    #  now dereference result of assignment expression
    ptr_to_one: *bool = @one
    if (ptr_var = 
        ptr_to_one)[] ~= 1 {
        return 4     }

    #  Now try to update values through these pointers
    return_pointer()[] = 20
    (? one then ptr_var else 
        return_pointer())[] = 30 #  this updates the static variable one

    #  Validate that the values of the pointed-to objects were updated
    if return_pointer()[] ~= 20 {
        return 5
    }
    if ptr_var[] ~= 30 {
        return 6
    }
    if one ~= 30 {
        return 7
    }

    return 0
}
