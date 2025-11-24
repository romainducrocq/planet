#  Test that we can declare a function with incomplete parameter and return
#  * types, then call/define it after the type is completed
#  * 

type struc s;
pub fn increment_struct(param: struc s) struc s;

#  complete the type
type struc s(    a: i32    
    , b: i32    )

pub fn main(none) i32 {
    arg: struc s = $(1, 2)

    #  we can call increment_struct now that the 'struct s' type is complete
    val: struc s = increment_struct(arg)
    if val.a ~= 2 or val.b ~= 3 {
        return 1
    }
    return 0 #  success
}

pub fn increment_struct(param: struc s) struc s {
    #  increment both members
    param.a = param.a + 1
    param.b = param.b + true
    return param
}
