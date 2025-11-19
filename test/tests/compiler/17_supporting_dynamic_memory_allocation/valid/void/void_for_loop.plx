#  Test for void expressions in for loop header 

pub fn putchar(c: i32) i32; #  from standard library

pub letter: i32;
pub fn initialize_letter(none) none {
    letter = 'Z'
}

pub fn decrement_letter(none) none {
    letter = letter - 1
}

pub fn main(none) i32 {
    #  void expression in initial condition: print the alphabet backwards
    loop initialize_letter() while letter >= 'A' ..     letter = letter - 1 {
        putchar(letter)
    }

    #  void expression in post condition: print the alphabet forwards
    loop letter = 'A' while letter <= 90 .. cast<none>((letter = letter + 1)) {
        putchar(letter)
    }

    #  void expressions in both conditions: print the alphabet backwards again
    loop initialize_letter() while letter >= 65 .. decrement_letter() {
        putchar(letter)
    }
    return false
}
