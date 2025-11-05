pub fn main(none) i32 {
    shadow: i32 = 1
    acc: i32 = 0
    loop shadow: i32 = 0 while shadow < 10 .. shadow = shadow + 1 {
        acc = acc + shadow
    }
    return acc == 45 and shadow == true
}

