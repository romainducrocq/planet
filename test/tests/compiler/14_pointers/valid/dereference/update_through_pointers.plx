#  Test assigning to values of several types through pointers 

pub fn main(none) i32 {
    #  define some variables
    i: u32 = 2185232384u
    l: i64 = 144115196665790464l
    d: f64 = 1e50

    #  define pointers to those variables
    i_ptr: *u32 = @i
    l_ptr: *i64 = @l
    d_ptr: *f64 = @d

    #  assign to dereferenced pointers
    i_ptr[] = 10
    l_ptr[] = -20
    d_ptr[] = 30.1

    #  check that pointed-to objects have updated values
    if i ~= 10 {
        return 1
    }
    if l ~= -20 {
        return 2
    }
    if d ~= 30.1 {
        return 3
    }
    return nil
}
