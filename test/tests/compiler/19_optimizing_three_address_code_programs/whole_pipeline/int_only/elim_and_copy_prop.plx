#  If we can replace every use of a variabe with its value,
#  * we can delete the copy to that variable
#  * 
pub fn target(none) i32 {
    x: i32 = 10 #  delete this after copy prop rewrites return
    return x #  rewrite as 'return x' via copy prop
}

pub fn main(none) i32 {
    return target()
}
