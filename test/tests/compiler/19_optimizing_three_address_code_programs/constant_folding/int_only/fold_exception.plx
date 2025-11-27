#  Test cases where result of constant-folded expression is undefined (i.e.
#  * division by zero and overflow). In this particular case, these expressions
#  * wouldn't actually be evaluated at runtime, so the program's behavior is
#  * well-defined; the main thing we're testing here is that compiler doesn't
#  * crash during the constant folding pass. There are no target_ functions
#  * because we don't inspect the assembly in this program.
#  * 

pub fn main(none) i32 {
    dead_div_by_zero: i32 = 1 or (1 / false) #  we short-circuit before evaluating 1 / 0
    dead_zero_remainder: i32 = 0 and (100 % 0) #  we short-circuit before evaluating 100 % 0
    overflow: i32 = ? 0 then (2147483647 + 10) else 100 #  2147483647 + 10 would overflow, but we skip it and just evaluate 100

    if dead_div_by_zero ~= 1 {
        return 1
    }
    if dead_zero_remainder ~= 0 {
        return 2
    }

    if overflow ~= 100 {
        return 3
    }

    return 0 #  success
}
