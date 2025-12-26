use "stdio"
use "string"

pub fn main(argc: i32, argv: *string) i32 {
    get__IOFBF()
    get__IOLBF()
    get__IONBF()
    get_BUFSIZ()
    get_EOF()
    get_FOPEN_MAX()
    get_FILENAME_MAX()
    get_L_tmpnam()
    get_SEEK_CUR()
    get_SEEK_END()
    get_SEEK_SET()
    get_TMP_MAX()
    get_stderr()
    get_stdin()
    get_stdout()

    magic: i32 = 0
    s1: [32]char = $(nil)
    s2: [32]char = $(nil)
    s3: [32]char = $(nil)
    buf: [128]char = $(nil)

    ctostr(s1, 'a')
    dtostr(s1, 0.123456789, 6)
    ltostr(s1, -10)
    ultostr(s1, 20)
    ptostr(s1, @s1)
    xtostr(s1, 16, 2)

    scan(@magic, "%i")
    if magic ~= 99 {
        return 1
    }
    sscan("101", @magic, "%i")
    if magic ~= 101 {
        return 1
    }

    ungetc('a', get_stdin())
    if getchar() ~= 'a' {
        return 1
    }

    print("Hello print!\n")
    fprint(get_stdout(), fmt5("Hello", " ", "stdout", ctostr(s1, '!'), "\n"))
    fflush(get_stdout())
    fprint(get_stderr(), "Hello stderr!\n")

    file: *struc FILE = nil
    filename: [32]char = $(nil)
    snprint(filename, 32, fmt2(argv[0], ".txt"))
    {
        file = fopen(filename, "w")
        if file == nil {
            return 1
        }
        fprint(file, ltostr(s1, 42))
        if ferror(file) {
            return 1
        }
    }

    {
        rewind(file)
        freopen(filename, "r", file)
        if file == nil {
            return 1
        }
        fscan(file, @magic, "%i")
    }
    if magic ~= 42 {
        return 1
    }

    str: [128]char = $(nil)
    sprint(buf, "The Answer to the Ultimate Question of Life is")
    {
        rewind(file)
        freopen(filename, "w", file)
        if file == nil {
            return 1
        }
        fprint(file, fmt7(buf, " at least ", ltostr(s1, -42l), " but less than ",
            ultostr(s2, 18446744073709551615ul), " and maybe ", dtostr(s3, 3.14159265, 2)))
        if ferror(file) {
            return 1
        }
    }

    {
        rewind(file)
        freopen(filename, "r", file)
        if file == nil {
            return 1
        }
        fseek(file, 0, get_SEEK_END())
        len: i32 = ftell(file)
        if len > 127 {
            return 1
        }
        fseek(file, 0, get_SEEK_SET())
        fread(str, 1, len, file)
        str[len] = nil
    }
    clearerr(file)
    if feof(file) {
        return 1
    }
    fclose(file)
    if strcmp(str, "The Answer to the Ultimate Question of Life is at least -42"
        " but less than 18446744073709551615 and maybe 3.14") {
        return 1
    }

    snprint(str, strlen(buf) + 1, fmt4(str, " ", ltostr(s1, 42), "\n"))
    if strcmp(buf, str) {
        return 1
    }

    print(fmt4(str, " ", ltostr(s1, magic), "\n"))

    return 0

    perror("Hello perror!")

    #sprint(buf, "The Sleeper must awaken")

# [x] fprint
# [x] fscan
# [x] print
# [x] scan
# [x] snprint
# [x] sprint
# [x] sscan
# [x] fmt1
# [ ] fmt2
# [ ] fmt3
# [x] fmt4
# [x] fmt5
# [ ] fmt6
# [ ] fmt7
# [x] fmt8
# [ ] fmt9
# [ ] fmt10
# [x] ctostr
# [x] dtostr
# [x] ltostr
# [x] ultostr
# [x] ptostr
# [x] xtostr

# [ ] remove
# [ ] rename
# [ ] tmpfile
# [ ] tmpnam
# [x] fclose
# [x] fflush
# [x] fopen
# [x] freopen
# [ ] setbuf
# [ ] setvbuf
# [ ] fgetc
# [ ] fgets
# [ ] fputc
# [ ] fputs
# [ ] getc
# [x] getchar
# [ ] putc
# [x] putchar
# [x] puts
# [x] ungetc
# [x] fread
# [x] fwrite
# [x] fseek
# [x] ftell
# [x] rewind
# [x] clearerr
# [x] feof
# [x] ferror
# [x] perror

    return 0
}
