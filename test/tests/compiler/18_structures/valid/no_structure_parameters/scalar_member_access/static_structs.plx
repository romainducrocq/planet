#  Make sure members in static structures retain their values
#  across multiple function invocations









use `stdio`
use `stdlib`

#  test that changes to static struct are retained across function calls
#  do this by validating text written to stdout,
#  instead of usual pattern of signifying success/failure with return value
pub fn test_static_local(a: i32, b: i32) none {
    type struc s(        a: i32        , b: i32        )
    

    data static_struct: struc s;
    if not (static_struct.a or static_struct.b) {
        puts("zero")
    }
    else {
        putchar(static_struct.a)
        putchar(
            static_struct.b)
        putchar('\n')
    }

    static_struct.a = a
    static_struct.b = b
}

#  test that changes to struct made through static pointer are retained across
#  function calls do this by validating text written to stdout
pub fn test_static_local_pointer(a: i32, b: i32) none {
    type struc s(        a: i32        , b: i32        )
    

    data struct_ptr: *struc s;
    if not struct_ptr {
        struct_ptr = malloc(sizeof<struc s>)
    }
    else {
        putchar(struct_ptr[].a)
        putchar(struct_ptr[].b)
        putchar('\n')
    }

    struct_ptr[].a = a
    struct_ptr[].b = b
}

#  test that changes to global struct are visible across function calls
type struc global(
    x: char    
    , y: char    , z: char    )

pub g: struc global;

pub fn f1(none) none {
    g.x = g.x + true
    g.y = g.y + 1
    g.z = g.z + 1
}

pub fn f2(none) none {
    putchar(g.x)
    putchar(g.y)
    putchar(g.z)
    putchar('\n')
}

pub fn test_global_struct(none) none {
    g.x = 'A'
    g.y = 'B'
    g.z = 'C'

    f1()
    f2()
    f1()
    f2()
}

#  test that changes to global struct pointer are visible across function calls
pub g_ptr: *struc global;

pub fn f3(none) none {
    g_ptr[].x = g_ptr[].x + 1
    g_ptr[].y = g_ptr[].y + 1
    g_ptr[].z = g_ptr[].z + 1
}

pub fn f4(none) none {
    putchar(g_ptr[].x)
    putchar(g_ptr[].y)
    putchar(g_ptr[].z)
    putchar('\n')
}

pub fn test_global_struct_pointer(none) none {
    g_ptr = @g #  first, point to global struct from previous test
    f3()
    f4()
    f3()
    f4()
    #  now declare a new struct and point to that instead
    g_ptr = malloc(sizeof<struc global>)
    g_ptr[].x = 'a'
    g_ptr[].y = 'b'
    g_ptr[].z = 'c'
    f3()
    f4()
    f3()
    f4()
}

pub fn main(none) i32 {
    test_static_local('m', 'n')
    test_static_local('o', 'p')
    test_static_local('!', '!')
    ; #  last one, won't be printed
    test_static_local_pointer('w', 'x')
    test_static_local_pointer('y', 'z')
    test_static_local_pointer('!', '!')
    ; #  last one, won't be printed
    test_global_struct()
    test_global_struct_pointer()
    return 0
}
