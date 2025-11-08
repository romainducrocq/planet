pub fn read_x(none) i32 {
    #   define x without linkage
    x: i32 = 4
    if x == 4 {
        #  declare x with linkage, shadowing previous definition;
        #          * this refers to the variable defined in the other file.
        #          
        extrn x: i32;
        return x
    }
    else {
        return -1
    }
}
