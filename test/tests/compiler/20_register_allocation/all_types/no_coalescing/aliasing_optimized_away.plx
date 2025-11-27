



#  Make sure we store a variable in a register if it's aliased in the
#  * original program, but the aliasing gets optimized away.
#  

#  shouldn't need to place any pseudos in this function on the stack
pub fn target(arg: i32) i32 {
    optimized_away: *i32 = @arg #  dead store; will get optimized away
    return arg + 10
}

