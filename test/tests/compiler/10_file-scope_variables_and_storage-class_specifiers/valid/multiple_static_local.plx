#  Multiple functions may declare static local variables
#  * with the same name; these variables have no linkage,
#  * and are distinct from each other.
#  

pub fn foo(none) i32 {
    #  'a' is a static local variable.
    #      * its value doubles each time we call foo()
    #      
    data a: i32 = 3
    a = a * 2
    return a
}

pub fn bar(none) i32 {
    #  'a' is a static local variable, distinct from the
    #      * 'a' variable declared in foo.
    #      * its value increases by one each time we call bar()
    #      
    data a: i32 = 4
    a = a + 1
    return a
}

pub fn main(none) i32 {
    return foo() + bar() + foo() + bar()
}
