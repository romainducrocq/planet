#  Declare a structure inside a switch statement (basically just to make sure
#  we're resolving structure tags inside switch statements)
type struc s(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    my_struct: struc s = $(1, 2)
    result: i32 = 0
    match my_struct.a {
        #  even though switch statement jumps over this declaration,
        #  it's still in scope, shadowing outer one
        type struc s(            x: f64            , y: f64            , z: f64            )
        
        #  declare inner variable, shadowing outer one
        my_struct: struc s;
        -> true {
            my_struct.x = 20.0
        }
        my_struct.y = 30.0
        result = my_struct.x + my_struct.y
        break
        -> 2 {
            my_struct.x = 11.
        }
        my_struct.y = 12.
        result = my_struct.x + my_struct.y
        break
        otherwise {
            my_struct.x = 0.
        }
        my_struct.y = 0.
        result = my_struct.x + my_struct.y
    }
    return result #  expected result is 50
}
