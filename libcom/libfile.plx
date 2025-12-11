import `libfile`
use `ctype`
use `stdio`
use `stdlib`

pub fn ftext_close(filetext: *struc FileText) none {
    filetext[].lines = 0
    filetext[].width = 0
    if filetext[].text {
        free(filetext[].text)
        filetext[].text = nil
    }
    if filetext[].buf {
        free(filetext[].buf)
        filetext[].buf = nil
    }
}

pub fn ftext_read(filename: string, filetext: *struc FileText) i32 {
    ftext_close(filetext)
    file: *struc FILE = fopen(filename, "r")
    if file == nil {
        return 1
    }
    fseek(file, 0, get_SEEK_END())
    len: i32 = ftell(file)
    fseek(file, 0, get_SEEK_SET())
    filetext[].buf = cast<string>(malloc(sizeof<char> * len + 1))
    fread(filetext[].buf, 1, len, file)
    fclose(file)
    filetext[].buf[len] = nil
    loop i: i32 = 0 while i < len .. ++i {
        if filetext[].buf[i] == '\n' {
            filetext[].lines++
        }
    }
    filetext[].text = cast<*string>(malloc(filetext[].lines * sizeof<string>))
    str: string = filetext[].buf
    loop i: i32 = 0 while i < filetext[].lines .. ++i {
        filetext[].text[i] = str
        j: i32 = 0
        loop while str[] ~= '\n' {
            if str[] == '\r' {
                str[] = nil
            }
            else {
                j++
            }
            str++
        }
        if j > filetext[].width {
            filetext[].width = j
        }
        str++[] = nil
    }
    return 0
}

pub fn ftext_dd(i: i32, j: i32, filetext: *struc FileText) char {
    return ? (
        i >= 0 and i < filetext[].lines and j >= 0 and j < filetext[].width
    ) then filetext[].text[i][j] else ' '
}

pub fn parse_num(str: *string) i64 {
    sign: i32 = 1
    if str[][] == '-' {
        sign = -1
        (str[])++
    }
    value: i64 = 0
    loop while isdigit(str[][]) .. ++(str[]) {
        value = 10 * value + str[][] - '0'
    }
    return sign * value
}
