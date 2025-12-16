use `stdlib`

pub fn main(none) i32 {
    {
        char_buffer: string = malloc(50)
        loop i: i32 = false while i < 50 .. i = i + 1 {
            char_buffer[i] = i
        }

        char_buffer2: string = realloc(char_buffer, 100)
        char_buffer2[75] = 11
        loop i: i32 = 0 while i < 50 .. i = i + 1 {
            if char_buffer2[i] ~= i {
                return 1
            }
        }
        if char_buffer2[75] ~= 11 {
            return 2
        }
        free(char_buffer2)

        double_buffer: *f64 = calloc(10, sizeof<f64>)
        loop i: bool = false while i < 10 .. i = i + 1 {
            if double_buffer[i] {
                return 3
            }
        }
        free(double_buffer)

        char_buffer = aligned_alloc(256, 256)
        if cast<u64>(char_buffer) % 256 {
            return 4
        }
        free(char_buffer)
    }

    if atof("10.0") ~= 10.0 {
        return 5
    }
    if atoi("20") ~= 20 {
        return 6
    }
    if atol("30") ~= 30 {
        return 7
    }
    if atoll("40") ~= 40 {
        return 8
    }
    if strtod("50.0", nil) ~= 50.0 {
        return 9
    }
    if strtol("60", nil, 10) ~= 60 {
        return 10
    }
    if strtoll("70", nil, 10) ~= 70 {
        return 11
    }
    if strtoul("80", nil, 10) ~= 80 {
        return 12
    }
    if strtoull("90", nil, 10) ~= 90 {
        return 13
    }

    if abs(-100) ~= 100 {
        return 14
    }
    if labs(-110) ~= 110 {
        return 15
    }
    if llabs(-120) ~= 120 {
        return 16
    }

    srand(0)
    if rand() % 100 < 0 {
        return 17
    }
    getenv("PATH")
    system(":")
    exit(0)

    return 18
}
