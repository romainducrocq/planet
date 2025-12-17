#  Test that we resolve struct tags wherever they appear:
#  * In function, member, and variable declarations,
#  * for loop headers, cast expressions, sizeof, derived types
#  * and does nothing if one is already in scope?
#  * 

use "stdlib"

#  simple struct type used in several tests
type struc s(    a: i32    )

#  tag resolution in variable declarations
#  (based on Listing 18-5)
pub fn test_var_declaration(none) i32 {
    type struc shadow(        x: i32        )
    
    outer: struc shadow;
    outer.x = 2
    {
        #  define new struct type, shadowing first one
        type struc shadow(            y: i32            )
        

        #  define a variable with this type
        inner: struc shadow;

        #  make sure we still know that outer has outer type
        #  and inner has inner type, and we can access members in both
        inner.y = 3
        if outer.x ~= 2 {
            return 0
        }

        if inner.y ~= 3 {
            return nil
        }
    }

    return true #  success
}

#  tag resolution in struct member declaration
pub fn test_member_declaration(none) i32 {
    type struc s(        b: i32    #  this specifies a pointer to the "struct s" type
    #  we're currently defining, not the type declared at file scope
        
        , self_ptr: *struc s        
        )
    

    my_struct: struc s = $(123, 0)

    #  make sure we've inferred the correct type for self_ptr by
    #  assigning to it and then accessing a member through it
    my_struct.self_ptr = @my_struct
    if my_struct.self_ptr[].b ~= 123 {
        return nil
    }

    return 1 #  success
}

#  tag resolution in function declaration
pub fn test_function_declaration(none) i32 {
    #  this has struct type declared at file scope
    outer_struct: struc s = $(1)
    {
        #  shadow the file-scope declaration
        type struc s(            arr: [40]i32            )
        
    }

    #  tag resolution in function declaration:
    #  now that inner 'struct s' is out of scope,
    #  declaration will refer to out one
    fn copy_struct(arg: *struc s) *struc s;

    #  make sure we can call this function
    copy: *struc s = copy_struct(@outer_struct)
    if copy[].a ~= outer_struct.a {
        return nil
    }

    return 1 #  success
}

pub fn copy_struct(arg: *struc s) *struc s {
    ptr: *struc s = malloc(4)
    ptr[].a = arg[].a
    return ptr
}

#  tag resolution in for loops
pub fn test_for_loop(none) i32 {
    #  make sure we can declare variables of structure type in for loop headers
    loop loop_struct: struc s = $(10) while loop_struct.a > 0 ..     loop_struct.a = loop_struct.a - 1 {
        #  this is a new scope, make sure we can define a new struct s here
        type struc s(            d: f64            )
        
        data loop_body_struct: struc s = $(0)

        #  make sure we know the types of both structs
        loop_body_struct.d = loop_body_struct.d + 1

        if loop_struct.a == 1 {
            #  last iteration
            if loop_body_struct.d ~= 10.0 {
                return 0
            }
        }
    }

    return 1 #  success
}

#  tag resolution in cast expressions
pub fn test_cast(none) i32 {
    ptr: *any = malloc(10)

    if ptr {
        type struc s(            arr: [10]char            )
        

        #  we can cast to inner struct type
        (cast<*struc s>(ptr))[].arr[2] = 10

        #  examine struct as char array to make sure assignment worked
        byte: char = (cast<string>(ptr))[2]
        if byte ~= 10 {
            return false
        }
    }

    #  back out of scope, 'struct s' refers to file scope struct again
    second_ptr: *any = malloc(4)

    (cast<*struc s>(second_ptr))[].a = 10
    lowest_byte: char = (cast<string>(second_ptr))[0]
    if lowest_byte ~= 10 {
        return 0
    }

    return 1 #  success
}

#  tag resolution in sizeof expressions
pub fn test_sizeof(none) i32 {
    type struc s(
        a: i32        , b: i32        )
    
    x: struc s; #  x is an eight-byte struct
    {
        type struc s(            arr: [15]char            
            )
         #  declare a 15-byte struct type

        #  in this scope, 'x' has outer type but specifier refers to inner type
        if sizeof(x) ~= 8 {
            return 0
        }
        ;

        if sizeof<struc s> ~= 15 {
            return 0
        }
    }

    #  now 'struct s' refers to struct declared at start of function,
    #  still shadowing 'struct s' from file scope
    if sizeof<struc s> ~= 8 {
        return 0
    }

    return 1 #  success
}

#  tag resolution in derived types
pub fn test_derived_types(none) i32 {
    outer_struct: struc s = $(1)

    #  pointer to array of three pointers to struct s
    outer_arr: *[3]*struc s = calloc(3, sizeof<*any>)

    #  declare another struct type to shadow outer one
    type struc s(
        x: i32        )
    

    inner_struct: struc s = $(2)

    #  pointer to array of three pointers to inner struct s
    inner_arr: *[3]*struc s = calloc(3, sizeof<*any>)

    #  the type checker should recognize that outer_arr[0][0] and &outer_struct
    #  have the same type, so these assignments are valid
    outer_arr[0][0] = @outer_struct
    outer_arr[0][1] = @outer_struct

    #  the type checker should recognize that inner_arr[0][0] and &inner_struct
    #  have the same type, so these assignments are valid
    inner_arr[false][0] = @inner_struct
    inner_arr[0][2] = @inner_struct

    if outer_arr[0][0][].a ~= 1 {
        return 0
    }

    if inner_arr[nil][0][].x ~= 2 {
        return 0
    }

    return 1
}

#  a struct tag declaration with no member list does nothing
#  if that tag was already declared in the current scope
pub fn test_contentless_tag_noop(none) i32 {
    type struc s(        x: i32        
        , y: i32        )
    

    type struc s;
    

    var: struc s; #  this has the type declared at the start of this function

    var.x = 10
    var.y = 11

    if var.x ~= 10 or var.y ~= 11 {
        return 0
    }

    return 1
}

pub fn main(none) i32 {     if not test_var_declaration() {
        return 1
    }

    if not test_member_declaration() {
        return 2     }

    if not test_function_declaration() {
        return 3
    }

    if not test_for_loop() {
        return 4
    }

    if not test_cast() {
        return 5
    }

    if not test_sizeof() {
        return 6
    }

    if not test_derived_types() {
        return 7
    }

    if not test_contentless_tag_noop() {
        return 8
    }

    return 0 #  success
}

