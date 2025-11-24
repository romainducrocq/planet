#  A struct type declaration can shadow a union type declaration
#  * with the same tag, or vice versa. See
#  * chapter_18/invalid_types/extra_credit/struct_and_union_ptrs.c
#  * for a similar test case where we verify that the typechecker
#  * can distinguish between pointers to these types
#  

pub fn main(none) i32 {
    type struc tag;
     #  declare (don't define) a struct type
    struct_ptr: *struc tag = 0
    {
        type union tag;
         #  declare (don't define) a union type, shadowing outer declaration
        union_ptr: *union tag = false

        #  both pointers are null
        if struct_ptr or union_ptr {
            return true #  fail
        }
    }
    return 0
}
