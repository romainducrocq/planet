#  any statement can have a label

pub fn main(none) i32 {
    a: i32 = 1
    label label_if
    if a {
        jump label_expression
    }
    else {
        jump label_empty
    }

    label label_goto
    jump label_return

    if 0 {
        label label_expression
        a = 0
    }

    jump label_if

    label label_return
    return a

    label label_empty
    ;
    a = 100
    jump label_goto
}
