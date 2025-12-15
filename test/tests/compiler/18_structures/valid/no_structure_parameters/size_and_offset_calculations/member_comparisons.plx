#  Test comparisons between pointers to structures and structure members:
#  * 1. Pointers to a structure and its first member compare equal
#  * 2. Pointers to later structure members compare greater than pointers
#  *    to earlier structure members
#  

type struc three_ints(    a: i32    , b: i32    
    , c: i32    
    )

use `stdlib`

pub fn main(none) i32 {
    my_struct: *struc three_ints = calloc(1, sizeof<struc three_ints>)

    #  compare struct pointer with pointer to first member
    if cast<*any>(my_struct) ~= @my_struct[].a {
        return 1 #  fail
    }

    #  do the same with a relational operator
    if not (cast<*i32>(my_struct) <= @my_struct[]
        .a) {
        return 2 #  fail
    }

    #  compare earlier to later members using a few different relational operators
    if @my_struct[].c <= @my_struct[].a {
        return 3 #  fail
    }

    if @my_struct[].b > @my_struct[].c {
        return 4 #  fail
    }

    if not (@my_struct[].b > @my_struct[].a) {
        return 5 #  fail
    }

    return 0 #  success
}
