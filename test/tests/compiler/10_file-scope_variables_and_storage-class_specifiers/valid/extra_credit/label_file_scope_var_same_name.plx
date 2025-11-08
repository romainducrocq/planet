#  file scope variables and labels are in different namespaces,
#  so they can share the same name

pub x: i32; #  file scope var - initialized to 0

pub fn main(none) i32 {
    x: i32 = 10 #  declare a local var
    jump x #  refers to label, not either variable
    return x
    {
        #  bring global var back into scope, shadowing local one
        #  NOTE: this also tests that we correctly resolve variable names
        #  even when we jump over their declarations
        extrn x: i32;
        label x #  label
        return x #  global var - should return 0
    }
}
