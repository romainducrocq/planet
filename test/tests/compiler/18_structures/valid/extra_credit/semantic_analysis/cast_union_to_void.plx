#  You can cast a union to void

type union u(    l: i64    , d: f64    
    )

pub fn main(none) i32 {
    x: union u = $(1000)
    cast<none>(x) #  just make sure this doesn't cause a type error
    return 0
}
