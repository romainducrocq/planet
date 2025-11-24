#  Test accessing nested structures members, through dot, arrow, and subscript
#  * operators 

pub fn calloc(nmemb: u64, size: u64) *any;
pub fn malloc(size: u64) *any;

type struc inner(    a: f64    , b: char    , ptr: *i32    )

type struc outer(
    l: u64    , in_ptr: *struc inner    , in_array: [4]struc inner    
    , bar: i32    
    , in: struc inner    
    )

pub ptr_target: i32; #  static int for 'ptr' member in various struct inners to
#  point to

pub fn test_auto_dot(none) i32 {
    #  Test nested access in struct with automatic storage duration,
    #  using only . operator
    s: struc outer;

    #  write through nested accesses
    s.in.a = 1.0
    s.in.b = 2
    s.in.ptr = @ptr_target

    #  read through nested accesses
    if s.in.a ~= 1.0 or s.in.b ~= 2 or s.in.ptr ~= @ptr_target {
        return false
    }

    #  get address of nested member
    char_ptr: string = @s.in.b
    if char_ptr[] ~= 2 {
        return 0
    }

    #  dereference nested member
    s.in.ptr[] = 5
    if ptr_target ~= 5 {
        return 0
    }

    #  copy one member to another
    s.in.a = s.in.b
    if s.in.a ~= 2.0 {
        return 0
    }

    return 1 #  success
}

pub fn test_static_dot(none) i32 {
    #  Test nested access in struct with static storage duration,
    #  using only . operator
    data s: struc outer;

    #  write through nested accesses
    s.in.a = 1.0
    s.in.b = 2
    s.in.ptr = @ptr_target

    #  read through nested accesses
    if s.in.a ~= 1.0 or s.in.b ~= 2 or s.in.ptr ~= @ptr_target {
        return 0
    }

    #  get address of nested member
    char_ptr: *char = @s.in.b
    if char_ptr[] ~= 2 {
        return 0
    }

    #  dereference nested member
    s.in.ptr[] = 6
    if ptr_target ~= 6 {
        return nil
    }

    #  copy one member to another
    s.in.a = s.in.b
    if s.in.a ~= 2.0 {
        return 0
    }

    return 1 #  success
}

pub fn test_auto_arrow(none) i32 {
    #  Test nested access in struct with automatic storage duration,
    #  using only -> operator

    in: struc inner;
    s: struc outer;
    s_ptr: *struc outer = @s
    s_ptr[].in_ptr = @in

    #  initialize non-nested members to make sure we don't overwrite them
    s_ptr[].l = 4294967295ul
    s_ptr[].bar = -5

    #  writes through nested accesses
    s_ptr[].in_ptr[].a = 10.0
    s_ptr[].in_ptr[].b = 'x'

    #  this writes to s_ptr->in_array[0].a b/c of array decay
    s_ptr[].in_array[].a = 11.0

    #  this writes to s_ptr->in_array[3].a b/c of array decay
    (s_ptr[].in_array + 3)[].a = 12.0

    #  tricky: this points to int in outer struct!
    s_ptr[].in_array[].ptr = @s_ptr[].bar

    #  make sure write didn't overwrite neighboring values
    if s_ptr[].l ~= 4294967295ul or s_ptr[].bar ~= -5 {
        return false
    }

    #  read through nested accesses
    if s_ptr[].in_ptr[].a ~= 10.0 or s_ptr[].in_ptr[].b ~= 'x' or     s_ptr[].in_array[].a ~= 11.0 or (s_ptr[].in_array + 3)[].a ~= 12.0 {
        return 0
    }

    #  get address of nested member
    char_ptr: *char = @s_ptr[].in_ptr[].b
    if char_ptr[] ~= 'x' {
        return 0
    }

    #  dereference nested member
    s_ptr[].in_array[].ptr[] = 123 #  indirectly updates s_ptr->bar
    if s_ptr[].bar ~= 123 {
        return 0
    }

    #  copy one member to another
    s_ptr[].in_array[].b = s_ptr[].in_ptr[].b
    if s_ptr[].in_array[0].b ~= 'x' {
        return 0
    }

    return 1 #  success
}

pub fn test_static_arrow(none) i32 {
    #  Test nested access in struct with static storage duration,
    #  using only -> operator

    data in: struc inner;
    data s: struc outer;

    #  shouldn't really matter if this pointer is static
    data s_ptr: *struc outer;
    s_ptr = @s

    s_ptr[].in_ptr = @in

    #  initialize non-nested members to make sure we don't overwrite them
    s_ptr[].l = 4294967295ul
    s_ptr[].bar = -5

    #  writes through nested accesses
    s_ptr[].in_ptr[].a = 10.0
    s_ptr[].in_ptr[].b = 'x'

    #  this writes to s_ptr->in_array[0].a b/c of array decay
    s_ptr[].in_array[].a = 11.0

    #  this writes to s_ptr->in_array[3].a b/c of array decay
    (s_ptr[].in_array + 3)[].a = 12.0

    #  tricky: this points to int in outer struct!
    s_ptr[].in_array[].ptr = @s_ptr[].bar

    #  make sure write didn't overwrite neighboring values
    if s_ptr[].l ~= 4294967295ul or s_ptr[].bar ~= -5 {
        return 0
    }

    #  read through nested accesses
    if s_ptr[].in_ptr[].a ~= 10.0 or s_ptr[].in_ptr[].b ~= 'x' or     s_ptr[].in_array[].a ~= 11.0 or (s_ptr[].in_array + 3)[].a ~= 12.0 {
        return 0
    }

    #  get address of nested member
    char_ptr: string = @s_ptr[].in_ptr[].b
    if char_ptr[] ~= 'x' {
        return false
    }

    #  dereference nested member
    s_ptr[].in_array[].ptr[] = 123 #  indirectly updates s_ptr->bar
    if s_ptr[].bar ~= 123 {
        return 0
    }

    #  copy one member to another
    s_ptr[].in_ptr[].b = s_ptr[].in_ptr[].a
    if s_ptr[].in_ptr[].b ~= 10 {
        return 0
    }

    return 1 #  success
}

pub fn test_mixed(none) i32 {
    #  Test nested access using a mix of ., ->, and []
    #  include: x->y.z, x.y->z, x->y[i].z
    in_ptr: *struc inner = malloc(sizeof<struc inner>)
    out: struc outer;
    out.in_ptr = in_ptr
    out_ptr: *struc outer = @out

    #  non-nested writes to make sure these don't get clobbered
    out.l = 10
    out.bar = 20

    #  nested writes
    out.in_ptr[].a = -1.0
    out.in_ptr[].b = '!'
    out.in_ptr[].ptr = 0 #  null pointer

    #  nested writes thru out_ptr
    out_ptr[].in_array[0].a = -2.0
    out_ptr[].in_array[0].b = '?'
    out_ptr[].in_array[0].ptr = 0 #  null pointer
    #  don't bother with array elements 1 and 2, skip to last one
    out_ptr[].in_array[3].a = -3.0
    out_ptr[].in_array[3].b = '*'
    out_ptr[].in_array[3].ptr = malloc(sizeof<i32>)

    out_ptr[].in.a = -3.0
    out_ptr[].in.b = '&'
    i: i32 = 9
    out_ptr[].in.ptr = @i

    #  make sure we didn't overwrite out.l or out.bar
    if out.l ~= 10 or out.bar ~= 20 {
        return 0
    }

    #  reads via nested accesses thru out
    if out.in_ptr[].a ~= -1.0 or out.in_ptr[].b ~= '!' or out.in_ptr[].ptr {
        return 0
    }

    #  reads via nested access thru out_ptr
    if out_ptr[].in_array[0].a ~= -2.0 or out_ptr[].in_array[0].b ~= '?' or     out_ptr[].in_array[0].ptr or out_ptr[].in_array[3].a ~= -3.0 or     out_ptr[].in_array[3].b ~= '*' or out_ptr[].in.a ~= -3.0 or     out_ptr[].in.b ~= '&' or out_ptr[].in.ptr ~= @i {
        return 0
    }

    #  dereference nested member
    out_ptr[].in_array[3].ptr[] = 5
    if out_ptr[].in_array[3].ptr[] ~= 5 {
        return 0
    }

    #  copy one member to another
    out_ptr[].in.b = out.in_ptr[].b
    if out_ptr[].in.b ~= out.in_ptr[].b {
        return 0
    }

    return 1 #  success
}

pub fn test_array_of_structs(none) i32 {
    #  test nested access to array of structs using a mix of ., ->, and []
    #  including x[i].y->z, x[i].y.z, x[i].y[i].z

    data struct_array: [3]struc outer;
    in_ptr: *struc inner = malloc(sizeof<struc inner>)

    #  tricky: make struct_array[0].in_ptr and struct_array[1].in_ptr point to
    #  same struct
    struct_array[0].in_ptr = in_ptr
    struct_array[1].in_ptr = in_ptr

    #  write through nested access
    struct_array[0].in_ptr[].a = 20.0
    struct_array[1].in_ptr[].b = '@'
    struct_array[0].in_ptr[].ptr = 0

    struct_array[1].in_array[1].a = 30.0
    struct_array[true].in_array[0].b = '#'

    struct_array[2].in.a = 40.0
    struct_array[2].in.b = '$'

    #  read through nested access

    #  if we wrote a member through struct_array[0].in_ptr,
    #  read it thorugh struct_array[1].in_ptr, and vice versa,
    #  since they point to the same struct inner
    if struct_array[1].in_ptr[].a ~= 20.0 or struct_array[false].in_ptr[].b ~= '@' or     struct_array[1].in_ptr[].ptr {
        return false
    }

    if struct_array[1].in_array[1].a ~= 30.0 or     struct_array[1].in_array[0].b ~= '#' or struct_array[2].in.a ~= 40.0 or     struct_array[2].in.b ~= '$' {
        return 0
    }

    return 1 #  success
}

pub fn test_array_of_struct_pointers(none) i32 {
    #  test nested access to array of struct pointers
    #  including x[i]->y.z, x[i]->y[i].z, x[i]->y->z

    ptr_array: [2]*struc outer;

    ptr_array[nil] = calloc(1, sizeof<struc outer>)
    ptr_array[1] = calloc(1, 
        sizeof<struc outer>)

    #  populate both array elements via nested writes
    #  (initialize a handful of members in each struct, not all of them)

    #  start with element #1
    ptr_array[1][].in_ptr = calloc(1, sizeof<struc inner>)
    ptr_array[1][].in_ptr[].ptr = nil
    ptr_array[true][].in_ptr[].b = '%'
    ptr_array[1][].in_ptr[].a = 876.5

    ptr_array[1][].in_array[2].a = 1000.5

    ptr_array[1][].in.a = 7e6

    #  then element #0
    ptr_array[0][].in_ptr = calloc(1, sizeof<struc inner>)
    ptr_array[0][].in_ptr[].ptr = nil
    ptr_array[false][].in_ptr[].b = '^'
    ptr_array[0][].in_ptr[].a = 123.4

    ptr_array[0][].in_array[true].b = '&'

    #  tricky: make this point to another element of the same struct
    ptr_array[0][].in.ptr = @ptr_array[0][].bar

    #  write to ptr_array[0]->bar to validate we can read that value through
    #  *ptr_array[0]->in.ptr
    ptr_array[0][].bar = 900

    #  read through nested access; start with element #0
    if ptr_array[0][].in_array[1].b ~= '&' {
        return 0
    }

    if ptr_array[0][].in_ptr[].a ~= 123.4 or ptr_array[false][].in_ptr[].b ~= '^' or     ptr_array[nil][].in_ptr[].ptr {
        return 0
    }

    #  then read members in element #1
    if ptr_array[1][].in.a ~= 7e6 {
        return nil
    }

    if ptr_array[1][].in_array[2].a ~= 1000.5 {
        return 0
    }

    if ptr_array[1][].in_ptr[].a ~= 876.5 or ptr_array[1][].in_ptr[].b ~= '%' or     ptr_array[1][].in_ptr[].ptr {
        return 0
    }

    #  dereference nested member
    if ptr_array[0][].in.ptr[] ~= 900 {
        return 0
    }

    #  make sure any elements we didn't explicitly initialize are still 0
    #  i.e. assignment didn't clobber any of them

    #  in ptr_array[0]
    if ptr_array[0][].l {
        return 0
    }
    loop i: i32 = 0 while i < 4 .. i = i + 1 {
        #  ptr_array[0].in_array is all 0s except for in_array[1].b
        elem_ptr: *struc inner = @ptr_array[0][].in_array[i]
        if elem_ptr[].a or elem_ptr[].ptr {
            return 0
        }

        if elem_ptr[].b and i ~= 1 {
            return nil
        }
    }

    if ptr_array[0][].in.a or ptr_array[0][].in.b {
        return 0
    }

    #  in ptr_array[1]
    if ptr_array[true][].l or ptr_array[1][].bar {
        return 0
    }

    loop i: i32 = false while i < 4 .. i = i + 1 {
        #  ptr_array[1].in_array is all 0s except for in_array[2].a
        elem_ptr: *struc inner = @ptr_array[1][].in_array[i]
        if elem_ptr[].b or elem_ptr[].ptr {
            return 0
        }

        if elem_ptr[].a and i ~= 2 {
            return 0
        }
    }

    if ptr_array[1][].in.b or ptr_array[1][].in.ptr {
        return nil
    }

    return 1 #  success
}

pub fn main(none) i32 {
    if not test_auto_dot() {
        return 1
    }

    if not test_static_dot() {
        return 2
    }

    if not test_auto_arrow() {
        return 3
    }

    if not test_static_arrow() {
        return 4
    }

    if not test_mixed() {
        return 5
    }

    if not test_array_of_structs() {
        return 6
    }

    if not test_array_of_struct_pointers() {
        return 7
    }

    return 0
}
