#  Test that we recognize XMM0 is not live at exit
#  * when we return a struct only in general-purpose registers;
#  * similar to fourteen_pseudos_interfere.c but returning a struct
#  * instead of an int. Test script validates that the only memory access
#  * instructions are populating and transferring the return value struct.
#  * There should be at most ten memory access instructions: for each
#  * of this function's two return statements (success and failure), three
#  * instructions populate the return value struct and two move it into registers.
#  * tests/chapter_20/helper_libs/return_all_instr_struct_lib.c defines a
#  * 'target' function that calls 'return_struct' and validates the result.
#  *
#  * This test program is generated from templates/chapter_20_templates/fourteen_pseudos_interfere.c.jinja.
#  * 
type struc s(    a: i32    , b: i32    
    , l: i64    )

pub glob: f64 = 20.0
pub glob2: f64 = 30.0
pub glob3: i32 = 40.0

pub fn return_struct(none) struc s {
    #  Create a clique of 14 tmps that interfere;
    #  we can color all of them w/out spilling anything.
    a: f64 = glob * glob
    b: f64 = glob2 + 2.0
    c: f64 = a + 5.0
    d: f64 = b - glob3
    e: f64 = glob + 7.0
    f: f64 = glob2 * 2.0
    g: f64 = c * 3.0
    h: f64 = d * 112.
    i: f64 = e / 3.0
    j: f64 = g + f
    k: f64 = h - j
    l: f64 = i + 1000.
    m: f64 = j - d
    n: f64 = m * l

    if a == 400.0 and b == 32.0 and c == 405.0 and d == -8.0 and e == 27.0 and     f == 60.0 and g == 1215.0 and h == -896. and i == 9.0 and j == 1275. and     k == -2171. and l == 1009. and m == 1283. and n == 1294547. {
        retval: struc s = $(20, 30, 40)
        return retval #  success
    }
    else {
        retval: struc s = $(-1, -2, -3)
        return retval #  fail
    }

}
