#  Test that we can use coalescing to prevent spills. In particular,
#  this tests that we rebuild the interference graph after each coalescing
#  loop, allowing us to find new coalescing opportunities and ultimately
#  color an up-to-date graph.
pub glob: i32 = 5
pub flag: i32 = 0

#  defined in tests/chapter_20/helper_libs/coalesce_prevents_spill_lib.c
pub fn validate(a: i32, b: i32, c: i32, d: i32, e: i32, f: i32, g: i32, h: i32, i: bool, j: bool, k: i32
    , l: i32, m: i32) i32;


pub fn target(arg: bool) i32 {
    #  declare some pseudoregisters but don't initialize them yet
    a: i32;
    b: i32;
    c: i32;
    d: i32;
    e: i32;
    f: i32;
    g: i32;
    h: i32;
    i: i32;
    j: i32;
    k: i32;
    l: i32;
    m: i32;
    #  a-m all appear to conflict, which would require us to spill one of them,
    #  but they actually have the same value.
    if flag {
        #  This branch isn't taken; only included to prevent copy propagation.
        #  It creates conflict between a-m, which will go away as we perform coalescing.
        #  the same value
        a = arg
        b = arg
        c = arg
        d = arg
        e = arg
        f = arg
        g = arg
        h = arg
        i = arg
        j = arg
        k = arg
        l = arg
        m = arg
    }
    else {
        #  This branch creates conflicts between a-m, which will go away as we perform coalescing.
        a = glob * 2 #  10
        b = a
        c = a
        d = a
        e = a
        f = a
        g = a
        h = a
        i = a
        j = a
        k = a
        l = a
        m = a
    }
    #  We'll first coalesce a-f into param-passing registers.
    #  After rebuilding interference graph, we'll recognize that g-m don't
    #  conflict with these registers despite originally conflicting with a-f,
    #  so we'll be able to coalesce them into DI.
    return validate(a, b, c, d, e, f, g, h, i, j, k, l, m)
}
