pub fn main(none) i32 {
    #  In our implementation, this fails tag resolution because 'union c'
    #  hasn't been declared yet.
    #  In a fully conforming implementation it would fail because you
    #  can't apply sizeof to incomplete types.
    return sizeof<union c>
}

type union c(    x: i32    
    )
