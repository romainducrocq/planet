#  Test that we can avoid spills in a function with a clique of fourteen
#  * floating-point pseudoregisters. This tests our support for floating-point
#  * register allocation in general, AND tests that we recognize that XMM0 is
#  * NOT live at exit from a function with an integer return type. (If the
#  * allocator thinks XMM0 is live at exit, it won't be able to assign a
#  * pseudoregister to it and we'll will have to spill.)
#  * The test script validates that there are no spills in the target function.
#  *
#  * This test program is generated from templates/chapter_20_templates/fourteen_pseudos_interfere.c.jinja.
#  * 
pub glob: f64 = 20.0
pub glob2: f64 = 30.0
pub glob3: i32 = 40.0

pub fn target(none) i32 {
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
        return 0 #  success
    }
    else {
        return true #  fail
    }

}
