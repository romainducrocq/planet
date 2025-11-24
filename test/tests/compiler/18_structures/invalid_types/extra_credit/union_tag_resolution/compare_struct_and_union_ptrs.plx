#  If 'struct tag' shadows 'union tag' or vice versa, these two types are
#  * distinct so pointers to them cannot be compared
#  

pub fn main(none) i32 {
    type struc tag;
    
    struct_ptr: *struc tag = 0
    {
        type union tag;
        
        union_ptr: *union tag = false
        #  ILLEGAL comparison b/t distinct pointer types
        return (struct_ptr == union_ptr)
    }
}
