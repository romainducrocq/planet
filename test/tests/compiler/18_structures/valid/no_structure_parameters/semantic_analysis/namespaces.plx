#  Test that we treat struct tags, function/variable names,
#  * and each struct type's member names as separate namespaces
#  * 

#  two structs can use same member names
pub fn test_shared_member_names(none) i32 {
    type struc pair1(        x: i32        
        , y: i32        )
    

    type struc pair2(
        x: f64        , y: char        )
    
    p1: struc pair1 = $(1, 2)
    p2: struc pair2 = $(3.0, 4)
    if p1.x ~= 1 or p2.x ~= 3.0 {
        return 0
    }

    return 1 #  success
}

#  you can use the same member name in different ways in the same expression,
#  and the type checker can infer what struct type each one refers to
pub fn test_shared_nested_member_names(none) i32 {
    type struc pair1(        x: i32        , y
        : *i32        )
    

    type struc pair2(
        x: *any        , y: [4]f64        
        )
    
    p1: struc pair1 = $(3, @(p1.x))
    p2: struc pair2 = $(@p1, $(1.0, 2.0, 3.0, 4.0))

    #  nested access with two 'y' members
    if (cast<*struc pair1>(p2.x))[].x ~= 3 {
        return 0
    }

    return 1 #  success
}

#  you can use the same identiifer as a struct tag, member name, and variable
#  name
pub fn test_same_name_var_member_and_tag(none) i32 {
    type struc x(        x: bool        )
    
    x: struc x = $(10)
    if x.x ~= 10 {
        return false
    }

    return 1 #  success
}

#  you can use the same identifier as a struct tag, member name, and function
#  name
pub fn test_same_name_fun_member_and_tag(none) i32 {
    type struc f(        f: i32        
        )
    
    fn f(none) i32;
    my_struct: struc f;
    my_struct.f = f()
    if my_struct.f ~= 10 {
        return 0
    }

    return 1 #  success
}

pub fn f(none) i32 {
    return 10
}

pub fn main(none) i32 {
    if not test_shared_member_names() {
        return true
    }

    if not test_shared_nested_member_names() {
        return 2
    }

    if not test_same_name_var_member_and_tag() {
        return 3
    }

    if not test_same_name_fun_member_and_tag() {
        return 4
    }

    return 0
}
