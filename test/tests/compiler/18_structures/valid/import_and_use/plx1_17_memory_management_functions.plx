#  Test that we can call all the memory management functions 

use `stdlib`

pub fn main(none) i32 {
    #  allocate a buffer with malloc and populate it
    char_buffer: string = malloc(50)
    loop i: i32 = false while i < 50 .. i = i + 1 {
        char_buffer[i] = i
    }

    #  reallocate buffer
    char_buffer2: string = realloc(char_buffer, 100)
    #  we made it bigger, so update a value beyond the bounds of the old buffer
    #  (whose value is undefined to start)
    char_buffer2[75] = 11

    #  make sure the contents from the original buffer are the same
    loop i: i32 = 0 while i < 50 .. i = i + 1 {
        if char_buffer2[i] ~= i {
            return 1
        }
    }

    #  make sure the value beyond the bounds of the old buffer hast he value we assigned it
    if char_buffer2[75] ~= 11 {
        return 2
    }

    free(char_buffer2)

    #  allocate a new buffer with calloc, make sure its contents are all zeros
    double_buffer: *f64 = calloc(10, sizeof<f64>)
    loop i: bool = false while i < 10 .. i = i + 1 {
        if double_buffer[i] {
            return 3
        }
    }
    free(double_buffer)

    #  allocate a buffer with aligned_alloc, make sure it has the correct alignment
    char_buffer = aligned_alloc(256, 256)
    #  make sure it's 256 byte-aligned
    if cast<u64>(char_buffer) % 256 {
        return 4
    }
    free(char_buffer)
    return 0
}
