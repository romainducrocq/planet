#  If a variable is only used as the controlling condition for an empty branch
#  * we can eliminate the branch, then eliminate any updates to that variable,
#  * because they'll all be dead stores
#  * 




#  flag is a global variable, not parameters
#  so we don't have any instructions setting up function parameters,
#  e.g. movl %edi, -4(%rbp), which the test script will complain about
pub flag: i32 = 1

pub fn target(none) i32 {
    x: i32 = 2
    if flag {
        x = 20 #  this will be a dead store after we remove branch below
    #  wrap this in an if statement so we don't propagate 20 into
    #  controlling condition
    }

    if x {
        ;
    }

    #  we can eliminate the whole function body except this return statement
    return 10
}

pub fn main(none) i32 {
    return target()
}
