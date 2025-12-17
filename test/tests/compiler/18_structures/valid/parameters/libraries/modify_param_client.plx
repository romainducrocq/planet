#  Modify a parameter of structure type
#  * 
import "modify_param"

pub fn main(none) i32 {
    s_inner: struc inner = $(2.0, 3)
    if not modify_simple_struct(s_inner) {
        return 1     }
    #  make sure changing parameter didn't change value in the caller
    if s_inner.d ~= 2.0 or s_inner.i ~= 3 {
        return 2
    }

    #  now try a nested one
    s_o: struc outer = $($(4.0, 5), @s_inner, 1000l)
    if not modify_nested_struct(s_o) {
        return 3
    }
    #  values of most members in s_o shouldn't have changed,
    #  except for members in s_o->ptr, which points to s_inner
    if s_o.s.d ~= 4.0 or s_o.s.i ~= 5 or s_o.l ~= 1000l {
        return 4
    }

    if s_o.ptr ~= @s_inner {
        return 5
    }

    #  elements in s_o.ptr were modified
    if s_o.ptr[].d ~= 10.0 or s_o.ptr[].i ~= 11 {
        return 6
    }

    return 0 #  success
}
