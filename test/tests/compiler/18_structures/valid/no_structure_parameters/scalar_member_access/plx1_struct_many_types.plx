type struc s1(x1: i32)
type struc s2(
    x2: i32)
type struc s3(x3: i32
    )
type struc s4(
    x4: i32
)
type struc s5(x5: i32, y5: i32)
type struc s6(x6: i32,
    y6: i32)
type struc s7(
    x7: i32,
    y7: i32)
type struc s8(
    x8: i32,
    y8: i32
)

pub fn main(none) i32 {
    a: struc s1 = $(1)
    b: struc s2 = $(
        2)
    c: struc s3 = $(3
        )
    d: struc s4 = $(
        4
    )
    e: struc s5 = $(5, 6)
    f: struc s6 = $(7,
        8)
    g: struc s7 = $(
        9,
        10)
    h: struc s8 = $(
        11,
        12
    )

    if (a.x1 + b.x2 + c.x3 + d.x4 + e.x5 + e.y5 + 
        f.x6 + f.y6 + g.x7 + g.y7 + h.x8 + h.y8) == 78 {
        return 0
    }
    return 1
}
