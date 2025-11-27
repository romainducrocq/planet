#  Load instruction generates all aliased variables 
pub fn pass_and_return(ptr: *i64) *i64 {
    return ptr
}

pub fn main(none) i32 {
    l: i64;
    ptr: *i64 = @l
    other_ptr: *i64 = pass_and_return(ptr) #  now other_ptr points to l
    l = 10 #  not a dead store b/c l is aliased and this is followed by load
    #  from memory
    return other_ptr[] #  this makes all aliased vars (i.e. l) live
}
