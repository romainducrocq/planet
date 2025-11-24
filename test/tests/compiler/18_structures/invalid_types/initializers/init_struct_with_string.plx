type struc chars(    a: char    , b: char    
    , c: char    , null: char    
    )

pub fn main(none) i32 {

    #  you can't initialize structure members with a string,
    #  even if they're all chars
    my_chars: struc chars = "abc"
    return 0
}
