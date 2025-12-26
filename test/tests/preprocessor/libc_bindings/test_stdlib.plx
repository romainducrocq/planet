use "stdio"
use "stdlib"

pub fn main(argc: i32, argv: *string) i32 {
    get_EXIT_FAILURE()
    get_EXIT_SUCCESS()
    get_RAND_MAX()

    at_quick_exit_f()
    atexit_f()

    n: i32 = 5
    arr: [5]i32 = $(4, 5, 1, 2, 3)
    qsort_f(arr, n, sizeof<i32>)
    
    key: i32;
    loop i: i32 = 0 while i < n .. i = i + 1 {
        key = i + 1
        if arr[i] ~= key {
            return 1
        }

        item: *i32 = cast<*i32>(bsearch_f(@key, arr, n, sizeof<i32>))
        if not item {
            return 2
        }
        if cast<i64>(item - arr) ~= i {
            return 3
        }
    }

    key = 0
    item: *i32 = cast<*i32>(bsearch_f(@key, arr, n, sizeof<i32>))
    if item {
        return 4
    }

    if argc == 2 and argv[1][0] == '1' {
        quick_exit(0)
    }
    exit(0)
    
    return 5
}

pub fn at_quick_exit_func(none) none {
    puts("Hello at_quick_exit!")
    fflush(get_stdout())
}

pub fn atexit_func(none) none {
    puts("Hello atexit!")
}

pub fn bsearch_compare(a: *any, b: *any) i32 {
    return cast<*i32>(a)[] - cast<*i32>(b)[]
}

pub fn qsort_compare(a: *any, b: *any) i32 {
    return cast<*i32>(a)[] - cast<*i32>(b)[]
}
