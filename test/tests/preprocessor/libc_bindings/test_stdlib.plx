use "stdlib"

pub fn at_quick_exit_func(none) none { return none }
pub fn atexit_func(none) none { return none }
pub fn bsearch_compare(a: *any, b: *any) i32 { return 0 }
pub fn qsort_compare(a: *any, b: *any) i32 { return 0 }

pub fn main(none) i32 {
    get_EXIT_FAILURE()
    get_EXIT_SUCCESS()
    get_RAND_MAX()

    return 0
}
