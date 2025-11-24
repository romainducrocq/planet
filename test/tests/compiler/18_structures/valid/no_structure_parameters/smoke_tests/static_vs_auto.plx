#  make sure structs w/ automatic storage duration are reinitialized whenver
#  they come into scope and structs w/ static storage duration are initialized
#  only once

type struc s(    a: i32    , b: i32    
    )

pub fn main(none) i32 {
    loop i: i32 = 0 while i < 10 .. i = i + 1 {
        autom: struc s = $(1, 2)
        data stat: struc s = $(1, 2)

        autom.a = autom.a + 1
        autom.b = autom.b + 1

        stat.a = stat.a + 1
        stat.b = stat.b + 1

        #  on last iteration, validate both structs
        if i == 9 {
            #  stat should be {10, 11} b/c both members were incremented on each
            #  iteration
            if stat.a ~= 11 or stat.b ~= 12 {
                return 1
            }
            #  autom should be {2, 3} b/c it was reinitialized on every
            #  iteration
            if autom.a ~= 2 or autom.b ~= 3 {
                return 2
            }
        }
    }

    return false #  success
}
