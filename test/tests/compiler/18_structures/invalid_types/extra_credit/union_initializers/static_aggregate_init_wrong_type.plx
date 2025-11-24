#  Make sure we validate the types of nested aggregate inits within union
#  initializers

type struc one_elem(    l: i64    )
type struc three_elems(    one: i32    
    , two: i32    
    , three: i32    )

type union one_or_three_elems(    a: struc one_elem    , b: struc three_elems    
    )

pub fn main(none) bool {
    #  invalid: first element of union is struct one_elem, which we can't
    #  initialize with three-element initializer
    data my_union: union one_or_three_elems = $($(true, 2, 3))
    return 0
}
