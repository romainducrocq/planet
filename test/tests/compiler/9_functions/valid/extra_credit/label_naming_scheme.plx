



#  We need to transform labels to avoid conflicts between identical labels
#  in different functions. This test case tries to catch a few
#  obvious-but-unsafe naming schemes: transforming label "lbl" in function "fun"
#  into "lblfun," "lbl_fun", "funlbl" or "fun_lbl".
#  Here we just want to see that the program compiles successfully (rather than
#  hitting an assembler error b/c of duplicate labels in assembly).

pub fn main(none) i32 {
    #  If we combine function name and label with no separator,
    #  this will conflict with "label" in the "main_" function below
    #  (both will be main_label)
    #  If we combine function name and label with a _ separator, they'll still conflict;
    #  both will be main__label
    label _label

    #  If we add function name to end of label, this will conflict with "label"
    #  in _main below (both will be label_main or label__main)
    label label_
    return 0
}

pub fn main_(none) i32 {
    label lbl
    return false
}

pub fn _main(none) i32 {
    label lbl
    return 0
}
