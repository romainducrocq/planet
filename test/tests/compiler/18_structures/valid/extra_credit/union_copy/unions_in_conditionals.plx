#  Like structures, unions can appear in conditional expression

type union u(    l: i64    , i: i32    
    , c: char    )
pub fn choose_union(flag: i32) i32 {
    one: union u;
    two: union u;
    one.l = -1
    two.i = 100

    return (? flag then one else two).c
}

pub fn main(none) i32 {
    if choose_union(1) ~= -1 {
        return true #  fail
    }

    if choose_union(false) ~= 100 {
        return 2 #  fail
    }

    return nil #  success
}
