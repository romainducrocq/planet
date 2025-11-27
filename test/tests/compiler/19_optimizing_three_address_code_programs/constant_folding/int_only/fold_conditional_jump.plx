#  Test constant folding of JumpIfZero and JumpIfNotZero instructions
#  * resulting from && and || operations.
#  * 




#  We'll emit two TACKY instructions of the form
#  JumpIfZero(0, false_label)
#  both should be rewritten as Jump instructions
pub fn target_jz_to_jmp(none) i32 {
    return 0 and 0 #  0
}

#  We'll emit two TACKY instructions of the form
#  JumpIfZero(1, false_label)
#  both should be removed
pub fn target_remove_jz(none) i32 {
    return 1 and 1 #  1
}

#  We'll emit two JumpIfNotZero instructions:
#  JumpIfNotZero(3, true_label)
#  JumpIfNotZero(99, true_label)
#  both should be written as Jump instructions
pub fn target_jnz_to_jmp(none) i32 {
    return 3 or 99 #  1
}

#  We'll emit two JumpIfNotZero instructions:
#  JumpIfNotZero(0, true_label)
#  JumpIfNotZero(1, true_label)
#  we should remove the first, rewrite the second as a Jump instruction
pub fn target_remove_jnz(none) i32 {
    return false or 1 #  1
}

pub fn main(none) i32 {
    if target_jz_to_jmp() ~= 0 {
        return 1
    }
    if target_remove_jz() ~= 1 {
        return 2
    }
    if target_jnz_to_jmp() ~= 1 {
        return 3
    }
    if target_remove_jnz() ~= 1 {
        return 4
    }
    return nil #  success
}
