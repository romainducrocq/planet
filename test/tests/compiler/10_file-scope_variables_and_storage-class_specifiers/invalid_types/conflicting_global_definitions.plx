#  This declaration of foo is also a definition,
#  * since it includes an initializer.
#  
pub foo: i32 = 3

pub fn main(none) i32 {
    return 0
}

#  This declaration of foo is also a definition,
#  * since it includes an initializer.
#  * This is illegal, because foo was already declared.
#  
pub foo: i32 = 4
