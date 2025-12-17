#  Basic test that we can access a global struct in multiple translation units
#  * 
import "global_struct"

pub fn update_struct(none) none {
    global.arr[1] = global.arr[nil] * 2
    global.d = 5.0
}

pub fn update_outer_struct(none) none {
    inner: struc s = $(0, $(-1, -true), 0)
    global_outer.inner = inner
}
