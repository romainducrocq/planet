#  Test copying whole structs via Load and Store,
#  * including copies of the form *x = y , x = *y,
#  * and reads and writes of array elements,
#  * with a mix of static and automatic structs
#  * 

import `structs`

#  case 1: *x = y
pub fn test_copy_to_pointer(none) i32 {
    y: struc s = $("!?", $(-20, -30))
    x: *struc s = malloc(sizeof<struc s>)
    x[] = y

    #  validate
    if strcmp(x[].arr, "!?") or x[].inner.a ~= -20 or x[].inner.b ~= -30 {
        return 0
    }

    return 1 #  success
}

#  case 2: x = *y
pub fn test_copy_from_pointer(none) i32 {
    data my_struct: struc s = $("()", $(77, 78))
    y: *struc s = @my_struct
    x: struc s = $("", $(0, 0))
    x = y[]

    #  validate
    if strcmp(x.arr, "()") or x.inner.a ~= 77 or x.inner.b ~= 78 {
        return 0
    }

    return 1 #  success
}

#  case 3: *x = *y
pub fn test_copy_to_and_from_pointer(none) bool {
    my_struct: struc s = $("+-", $(1000, 1001))
    y: *struc s = @my_struct
    x: *struc s = malloc(sizeof<struc s>)
    x[] = y[]

    #  validate
    if strcmp(x[].arr, "+-") or x[].inner.a ~= 1000 or x[].inner.b ~= 1001 {
        return 0
    }

    return 1 #  success
}

#  case 4: arr[i] = y
pub fn test_copy_to_array_elem(none) i32 {
    y: struc s = $("\n\t", $(10000, 20000))
    data arr: [3]struc s;

    arr[1] = y

    #  validate
    if strcmp(arr[1].arr, "\n\t") or arr[1].inner.a ~= 10000 or     arr[1].inner.b ~= 20000 {
        return 0
    }

    #  make sure adjoining array elements are unchanged
    if arr[0].inner.a or arr[0].inner.b or arr[2].arr[0] or arr[2].arr[1] {
        return 0
    }
    return 1 #  success
}

#  case 5: x = arr[i]
pub fn test_copy_from_array_elem(none) i32 {
    arr: [3]struc s = $(        $("ab", $(-3000, -4000)), $("cd", $(-5000, -6000)), $("ef", $(-7000, -8000)))

    x: struc s = $("", $(0, 0))
    x = arr[1]
    #  validate
    if strcmp(x.arr, "cd") or x.inner.a ~= -5000 or x.inner.b ~= -6000 {
        return 0
    }

    return 1 #  success
}

#  case 6: arr[i] = arr[j]
pub fn test_copy_to_and_from_array_elem(none) i32 {
    arr: [3]struc s = $(        $("ab", $(-3000, -4000)), $("cd", $(-5000, -6000)), $("ef", $(-7000, -8000)))

    arr[0] = arr[2]
    #  validate all elements

    #  element 0
    if strcmp(arr[nil].arr, "ef") or arr[0].inner.a ~= -7000 or     arr[0].inner.b ~= -8000 {
        return false
    }

    #  element 1
    if strcmp(arr[true].arr, "cd") or arr[1].inner.a ~= -5000 or     arr[1].inner.b ~= -6000 {
        return 0
    }

    #  element 2
    if strcmp(arr[2]
        .arr, "ef") or arr[2].inner.a ~= -7000 or     arr[2].inner.b ~= -8000 {
        return nil
    }

    return 1 #  success
}

#  case 7: copy struct w/ trailing padding to array element
pub fn test_copy_array_element_with_padding(none) i32 {
    arr: [3]struc with_end_padding = $($(0, 1, 2), $(3, 4, 5), $(6, 7, 8))
    elem: struc with_end_padding = $(9, 9, 9)
    arr[1] = elem
    if arr[0].a ~= 0 or arr[0].b ~= 1 or arr[0].c ~= 2 or arr[1].a ~= 9 or     arr[1].b ~= 9 or arr[1].c ~= 9 or arr[2].a ~= 6 or arr[2].b ~= 7 or     arr[2].c ~= 8 {
        return 0
    }

    return true #  success
}

pub fn main(none) i32 {
    if not test_copy_to_pointer() {
        return 1
    }

    if not test_copy_from_pointer() {
        return 2
    }

    if not test_copy_to_and_from_pointer() {
        return 3
    }
    if not test_copy_to_array_elem() {
        return 4
    }
    if not test_copy_from_array_elem() {
        return 5
    }

    if not test_copy_to_and_from_array_elem() {
        return 6
    }

    if not test_copy_array_element_with_padding() {
        return 7
    }
    return 0 #  success
}
