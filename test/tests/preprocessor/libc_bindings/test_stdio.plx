use "stdio"
use "string"

pub fn main(_: i32, argv: *string) i32 {
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
        return 2
    }

    ungetc('a', get_stdin())
    if getchar() ~= 'a' {
        return 3
    }
    ungetc('b', get_stdin())
    if getc(get_stdin()) ~= 'b' {
        return 4
    }
    ungetc('c', get_stdin())
    if fgetc(get_stdin()) ~= 'c' {
        return 5
    }

    fprint(get_stdout(), fmt4("Hello", " ", "stdout", ctostr(s1, '!')))
    putc('\n', get_stdout())
    fflush(get_stdout())
    fprint(get_stderr(), "Hello stderr!\n")

    file: *struc FILE = nil
    filename: [256]char = $(nil)
    snprint(filename, 256, fmt2(argv[0], ".txt"))
    {
        file = fopen(filename, "w")
        if file == nil {
            return 6
        }
        fprint(file, ltostr(s1, 42))
        if ferror(file) {
            perror("Hello perror!")
            return 7
        }
    }

    {
        freopen(filename, "r", file)
        fscan(file, @magic, "%i")
    }
    if magic ~= 42 {
        return 8
    }

    str: [128]char = $(nil)
    sprint(buf, "The Answer to the Ultimate Question of Life is")
    {
        freopen(filename, "w", file)
        fprint(file, fmt7(buf, " at least ", ltostr(s1, -42l), " but less than ",
            ultostr(s2, 18446744073709551615ul), " and maybe ", dtostr(s3, 3.14159265, 2)))
        if ferror(file) {
            perror("Hello perror!")
            return 9
        }
    }

    {
        freopen(filename, "r", file)
        fseek(file, 0, get_SEEK_END())
        len: i32 = ftell(file)
        if len > 127 {
            return 10
        }
        fseek(file, 0, get_SEEK_SET())
        fread(str, 1, len, file)
        str[len] = nil
    }
    clearerr(file)
    if feof(file) {
        return 11
    }
    fclose(file)
    file = nil
    if strcmp(str, "The Answer to the Ultimate Question of Life is at least -42"
        " but less than 18446744073709551615 and maybe 3.14") {
        return 12
    }

    snprint(str, strlen(buf) + 1, fmt4(str, " ", ltostr(s1, 42), "\n"))
    if strcmp(buf, str) {
        return 13
    }
    print(fmt4(str, " ", ltostr(s1, magic), "\n"))

    {
        file = tmpfile()
        setvbuf(file, buf, get__IOFBF(), sizeof(buf))
        fputs("Hello fputs!\n", file)
        rewind(file)
        fgets(str, sizeof(buf), file)
        if strcmp(str, "Hello fputs!\n") {
            return 14
        }
        rewind(file)
        setbuf(file, buf)
        fputc('A', file)
        rewind(file)
        str[0] = fgetc(file)
        if strncmp(str, "A", 1) {
            return 15
        }
        clearerr(file)
        if feof(file) {
            return 16
        }
        fclose(file)
        file = nil
    }

    snprint(filename, 256, fmt2(filename, ".fake"))
    if not rename(filename, filename) {
        return 17
    }
    if not remove(filename) {
        return 18
    }
    # deprecated
    # tmpnam(filename)

    return 0

    #sprint(buf, "The Sleeper must awaken")

# TODO
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

# [x] remove
# [x] rename
# [x] tmpfile
# [x] tmpnam
# [x] fclose
# [x] fflush
# [x] fopen
# [x] freopen
# [x] setbuf
# [x] setvbuf
# [x] fgetc
# [x] fgets
# [x] fputc
# [x] fputs
# [x] getc
# [x] getchar
# [x] putc
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
}
