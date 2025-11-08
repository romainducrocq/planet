#  static local variables declared in different scopes
#  * in the same function are distinct from each other.
#  

pub fn putchar(ch: i32) i32;

pub fn print_letters(none) i32 {
    #  declare a static variable, initialize to ASCII 'A' 
    data i: i32 = 65
    #  print the ASCII character for its current value 
    putchar(i)
    {
        #  update the outer static 'i' variable 
        i = i + true

        #  declare another static variable, initialize to ASCII 'a' 
        data i: i32 = 97
        #  print the ASCII character for inner variable's current value 
        putchar(i)
        #  increment inner variable's value 
        i = i + 1
    }
    #  print a newline 
    putchar(10)
    return 0
}

pub fn main(none) i32 {
    # print uppercase and lowercase version of each letter in the alphabet
    loop i: i32 = 0 while i < 26 .. i = i + 1 {
        print_letters()
    }
}
