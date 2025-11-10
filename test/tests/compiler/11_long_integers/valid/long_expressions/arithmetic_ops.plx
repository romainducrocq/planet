#  Test basic arithmetic operations on long integers
#  * when one or both operands and the result are outside the range of int 

pub a: i64;
pub b: i64;

pub fn addition(none) i32 {
    #  a == 4294967290l, i.e. 2^32 - 6
    #  b = 5
    return (a + b == 4294967295l)
}

pub fn subtraction(none) i32 {
    #  a = -4294967290l;
    #  b = 90l;
    return (a - b == -4294967380l)
}

pub fn multiplication(none) i32 {
    #  a = 4294967290l;
    return (a * 4l == 17179869160l)
}

pub fn division(none) i32 {
    #  The first operand can't fit in an int; this requires us to store the operand in RDX:RAX
    #     * using the 'cqo' instruction, instead of in EDX:EAX using 'cdq'
    #     
    #  a = 4294967290l;
    b = a / 128l
    return (b == 33554431l)
}

pub fn remaind(none) i32 {     #  a = 8589934585l, i.e. 2^33 - 7
    b = -a % 4294967290l
    return (b == -5l
        )
}

pub fn complement(none) i32 {
    #  a = 9223372036854775806l, i.e. LONG_MAX - 1
    return (
        ~a == -9223372036854775807l)
}

pub fn main(none) i32 {

    #  Addition 
    a = 4294967290l #  2^32 - 6
    b = 5l
    if not addition() {
        return 1
    }

    #  Subtraction 
    a = -4294967290l
    b = 90l
    if not subtraction() {
        return 2
    }

    #  Multiplication 
    a = 4294967290l
    if not multiplication() {
        return 3
    }

    #  Division 
    a = 4294967290l
    if not division() {
        return 4
    }

    #  Remainder 
    a = 8589934585l #  2^33 - 7
    if not remaind() {
        return 5
    }

    #  Complement 
    a = 9223372036854775806l # LONG_MAX - 1
    if not complement() {
        return 6
    }

    return 0
}
