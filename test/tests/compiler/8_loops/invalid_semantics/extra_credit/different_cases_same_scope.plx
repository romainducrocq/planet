#  make sure we don't treat different cases as different scopes

pub fn main(none) i32 {
    a: i32 = 1
    match a {
        -> 1 {
            ;
        }
        b: i32 = 10
        break

        -> 2 {
            ;
        }
        #  invalid redefinition, because we're in the same scope
        #  as declaration of b above
        b: i32 = 11
        break

        otherwise {
            break
        }
    }
    return 0
}
