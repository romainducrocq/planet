#  Test that we can take the address of a string literal and annotate it with the correct type 









pub fn puts(s: string) i32;

pub fn main(none) i32 {
    str: *[16]char = @"Sample\tstring!\n"
    puts(str[])

    #  get pointer to one-past-the-end of this string
    one_past_the_end: *[16]char = str + 1
    last_byte_pointer: string = cast<string>(one_past_the_end) - 1 #  now get pointer to the last byte
    if last_byte_pointer[] ~= 0 {
        return 1
    }
    return 0
}
