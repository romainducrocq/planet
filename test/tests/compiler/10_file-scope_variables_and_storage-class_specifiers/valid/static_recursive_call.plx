#  Test updating a static local variable over multiple function invocations;
#  also test passing a static variable as an argument
pub fn putchar(ch: i32) i32;

pub fn print_alphabet(none) i32 {
    #  the value of count increases by 1
    #      * each time we call print_alphabet()
    #      
    data count: i32 = 0
    putchar(count + 65) #  65 is ASCII 'A'
    count = count + 1
    if count < 26 {
        print_alphabet()
    }
    return count
}

pub fn main(none) i32 {
    print_alphabet()
}
