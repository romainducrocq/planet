type struc incomplete;

type struc s(    #  member type is invalid: illegal to specify array of incomplete type,
    #  even as a pointer's referenced type
    array_pointer: *[3]struc incomplete    
    )
