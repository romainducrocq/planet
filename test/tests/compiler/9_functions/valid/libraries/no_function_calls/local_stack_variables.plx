#  Make sure a called function can correctly access variables on the stack 
pub fn f(reg1: i32, reg2: i32, reg3: i32, reg4: i32, reg5: i32, reg6: i32, stack1: i32, stack2: i32, stack3: i32) i32 {
    x: i32 = 10
    #  make sure every variable has the right value
    if reg1 == 1 and reg2 == 2 and reg3 == 3 and reg4 == 4 and reg5 == 5     and reg6 == 6 and stack1 == -1 and stack2 == -2 and stack3 == -3     and x == 10 {
        #  make sure we can update the value of one argument
        stack2 = 100
        return stack2
    }
    return 0
}
