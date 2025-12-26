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

    fprint(get_stdout(), fmt3("Hello", " stdout", ctostr(s1, '!')))
    putc('\n', get_stdout())
    fflush(get_stdout())
    fprint(get_stderr(), fmt1("Hello stderr!\n"))

    str: [128]char = $(nil)
    snprint(str, 128, "The quick brown fox jumped over the lazy dog")
    if strcmp(str, "The quick brown fox jumped over the lazy dog") {
        return 6
    }

    file: *struc FILE = nil
    filename: [256]char = $(nil)
    snprint(filename, 256, fmt5(argv[0], ".", "t", "x", "t"))
    {
        file = fopen(filename, "w")
        if file == nil {
            return 7
        }
        fprint(file, ltostr(s1, 42))
        if ferror(file) {
            perror("Hello perror!")
            return 8
        }
    }

    {
        freopen(filename, "r", file)
        fscan(file, @magic, "%i")
    }
    if magic ~= 42 {
        return 9
    }

    sprint(buf, "The Answer to the Ultimate Question of Life is")
    {
        freopen(filename, "w", file)
        fprint(file, fmt7(buf, " at least ", ltostr(s1, -42l), " but less than ",
            ultostr(s2, 18446744073709551615ul), " and maybe ", dtostr(s3, 3.14159265, 2)))
        if ferror(file) {
            perror("Hello perror!")
            return 10
        }
    }

    {
        freopen(filename, "r", file)
        fseek(file, 0, get_SEEK_END())
        len: i32 = ftell(file)
        if len > 127 {
            return 11
        }
        fseek(file, 0, get_SEEK_SET())
        fread(str, 1, len, file)
        str[len] = nil
    }
    clearerr(file)
    if feof(file) {
        return 12
    }
    fclose(file)
    file = nil
    if strcmp(str, "The Answer to the Ultimate Question of Life is at least -42"
        " but less than 18446744073709551615 and maybe 3.14") {
        return 13
    }

    snprint(str, strlen(buf) + 1, fmt2(str, " 42\n"))
    if strcmp(buf, str) {
        return 14
    }
    print(fmt4(str, " ", ltostr(s1, magic), "\n"))

    snprint(str, 128, fmt8("One Ring to", " Rule them all,",
        " One Ring to", " find them,", " One Ring to",
        " Bring them all", " and in the darkness", " Bind them."))
    if strcmp(str, "One Ring to Rule them all, One Ring to find them,"
        " One Ring to Bring them all and in the darkness Bind them.") {
        return 15
    }

    snprint(str, 128, fmt9("Without", " change,", " something",
        " sleeps", " inside us,", " and", " seldom", " awakens.",
        " The sleeper must awaken."))
    if strcmp(str, "Without change, something sleeps inside us,"
        " and seldom awakens. The sleeper must awaken.") {
        return 16
    }

    snprint(str, 128, fmt10("I want to be", " the very best",
        " Like no one", " ever was,", " To catch them", " is my real test",
        " To train them", " is my cause,", " Gotta catch", " 'em all"))
    if strcmp(str, "I want to be the very best Like no one ever was,"
        " To catch them is my real test To train them is my cause,"
        " Gotta catch 'em all") {
        return 17
    }

    {
        file = tmpfile()
        setvbuf(file, buf, get__IOFBF(), sizeof(buf))
        fputs("Hello fputs!\n", file)
        rewind(file)
        fgets(str, sizeof(buf), file)
        if strcmp(str, "Hello fputs!\n") {
            return 18
        }
        rewind(file)
        setbuf(file, buf)
        fputc('A', file)
        rewind(file)
        str[0] = fgetc(file)
        if strncmp(str, "A", 1) {
            return 19
        }
        clearerr(file)
        if feof(file) {
            return 20
        }
        fclose(file)
        file = nil
    }

    snprint(filename, 256, fmt6(filename, ".", "f", "a", "k", "e"))
    if not rename(filename, filename) {
        return 21
    }
    if not remove(filename) {
        return 22
    }
    # deprecated
    # tmpnam(filename)

    return 0
}
