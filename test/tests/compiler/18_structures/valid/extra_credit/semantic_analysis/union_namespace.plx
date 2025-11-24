#  Test that we treat union tags, function/variable names, and each
#  * struct/union's member names as separate namespaces.
#  

#  Different unions/structs can use same member names
pub fn test_shared_member_names(none) i32 {
    type union u1(        a: i32        
        )
    
    type union u2(        l: i64        , a: f64        )
    
    type struc s(        a: [2]char        
        )
    

    var1: union u1 = $(10)
    var2: union u2 = $(-9223372036854775807l - 1) #  LONG_MIN
    var3: struc s = $($(-true, -2))
    if var1.a ~= 10 or var2.a ~= -0.0 or var3.a[false] ~= -1 {
        return 0
    }

    return 1 #  success
}

#  you can use the same identiifer as a struct tag, member name, and variable
#  name
pub fn test_same_name_var_member_and_tag(none) i32 {
    type union u(        u: i32        
        )
    
    u: union u = $(100)
    if u.u ~= 100 {
        return false
    }

    return 1 #  success
}

#  you can use the same identifier as a union tag and function name
pub fn f(none) i32 {
    return 10
}

type union f(    f: i32    )

pub fn test_same_name_fun_and_tag(none) i32 {
    x: union f;
    x.f = f()
    if x.f ~= 10 {
        return 0 #  fail
    }

    return 1 #  success
}

pub fn main(none) i32 {
    if not test_shared_member_names() {
        return true #  fail
    }

    if not test_same_name_var_member_and_tag() {
        return 2 #  fail
    }

    if not test_same_name_fun_and_tag() {
        return 3 #  fail
    }

    return 0 #  success
}
