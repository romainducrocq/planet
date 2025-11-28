type union u1(x1: i32)
type union u2(
    x2: i32)
type union u3(x3: i32
    )
type union u4(
    x4: i32
)
type union u5(x5: i32, y5: i32)
type union u6(x6: i32,
    y6: i32)
type union u7(
    x7: i32,
    y7: i32)
type union _u8(
    x8: i32,
    y8: i32
)

pub fn main(none) i32 {
    a: union u1 = $(1)
    b: union u2 = $(2)
    c: union u3 = $(3)
    d: union u4 = $(4)
    e: union u5 = $(5)
    f: union u6 = $(6)
    g: union u7 = $(7)
    h: union _u8 = $(8)

    if (a.x1 + b.x2 + c.x3 + d.x4 + e.x5 + e.y5 + 
        f.x6 + f.y6 + g.x7 + g.y7 + h.x8 + h.y8) == 62 {
        return 0
    }
    return 1
}
