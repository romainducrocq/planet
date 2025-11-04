


#  Test that naming scheme does not result in conflicting variable names after alpha conversion 

pub fn main(none) i32 {
    a: i32; #  a0
    result: i32;
    a1: i32 = 1 #  a10
    { a: i32 = 2 # a1
        a1: i32 = 2 #  a11
        {
            a: i32; #  a2
            {
                a: i32; #  a3
                {
                    a: i32; #  a4
                    {
                        a: i32; #  a5
                        {
                            a: i32; #  a6
                            { a: i32; #  a7
                                {
                                    a: i32; #  a8
                                    {
                                        a: i32; #  a9
                                        {
                                            a: i32 = 20 #  a10
                                            result = a
                                            {
                                                a: i32; #  a11
                                                a = 5
                                                result = result + a }
                                        }
                                    }
                                }
                            }
                        }
                    }
                } }
        }
        result = result + a1
    }
    return result + a1
}
