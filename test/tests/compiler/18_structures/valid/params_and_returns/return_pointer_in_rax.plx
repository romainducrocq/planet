#  When we return a value in memory, make sure we pass a pointer
#  to the returned value in RAX.
#  The main function, defined in validate_return_pointer_<PLATFORM>.s,
#  will call return_in_mem, then read through RAX to access/validate the result


#  This struct will be passed in memory
type struc s(    l1: i64    , l2: i64    
    , l3: i64    )


pub fn return_in_mem(none) struc s {
    result: struc s = $(1, 2, 3)
    return result
}
