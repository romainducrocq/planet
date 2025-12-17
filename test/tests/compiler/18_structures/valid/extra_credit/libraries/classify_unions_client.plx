import "union_lib"

pub fn main(none) i32 {

    #  Ia. passed in one XMM reg

    od: union one_double = $(-2.345e6)
    if not test_one_double(od
        ) {
        return 1
    }

    huwd: struc has_union_with_double = $($(9887.54321e44))
    if not test_has_union_with_double(huwd) {
        return 2
    }

    hswd: union has_struct_with_double = $(huwd)
    if not test_has_struct_with_double(hswd) {
        return 3
    }

    #  IIb. passed in one general-purpose register
    oi: union one_int = $(-80.)
    if not test_one_int(oi) {
        return 4
    }

    oin: union one_int_nested = $($(44e55))
    if not test_one_int_nested(oin) {         return 5
    }

    cim: union char_int_mixed = $("WXYZ")
    if not test_char_int_mixed(cim) {
        return 6
    }

    hu: struc has_union = $(4294954951u, $(-60))
    if not test_has_union(hu) {
        return 7
    }

    hswi: union has_struct_with_ints;
    hswi.s = hu
    if not test_has_struct_with_ints(hswi) {
        return 8
    }

    #  IIa. two XMM regs
    td: union two_doubles = $($(10.0, 11.0))
    if not test_two_doubles(td) {
        return 9
    }

    hxu: union has_xmm_union;
    hxu.u2 = td
    if not test_has_xmm_union(hxu) {
        return 10
    }

    ds: struc dbl_struct = $(od
        , 123.45)
    if not test_dbl_struct(ds) {
        return 11
    }

    hds: union has_dbl_struct = $(ds)
    if not test_has_dbl_struct(hds) {
        return 12
    }

    #  IIb. two general-purpose regs
    ca: union char_arr = $("Chars!")
    if not test_char_arr(ca) {
        return 13
    }

    two_arr_var: union two_arrs = $($(13e4, 14.5))
    if not test_two_arrs(two_arr_var) {
        return 14
    }

    tehs: union two_eightbyte_has_struct = $($(100, 200, 300))
    if not test_two_eightbyte_has_struct(tehs) {
        return 15
    }

    ts: union two_structs = $($('x', 55.5e5))

    if not test_two_structs(ts) {
        return 16
    }

    hnbs: union has_nine_byte_struct;
    hnbs.s.i = -16711936
    loop i: i32 = 0 while i < 5 .. i = i + 1 {
        byte: char = ? i % 2 then -1 else false
        hnbs.s.arr[i] = byte
    }
    hnbs.s.arr[4] = false
    if not test_has_nine_byte_struct(hnbs) {
        return 17
    }

    huu: struc has_uneven_union = $(-2147483647, $("!@#$"))
    if not test_has_uneven_union(huu) {
        return 18
    }

    hou: union has_other_unions;
    hou.n = hnbs
    hou.n.s.arr[4] = 0
    if not test_has_other_unions(hou) {
        return 19
    }

    ua: union union_array = $($($(-20.), $(-30.)))
    if not test_union_array(ua) {
        return 20
    }

    uua: union uneven_union_array = $($($("QWER"), $("TYUI")))
    if not test_uneven_union_array(uua) {
        return 21
    }

    hssa: union has_small_struct_array = $($(        $("AS", 10), $("DF", 11), $("GH", 12)        ))
    if not test_has_small_struct_array(hssa) {
        return 22
    }

    #  IIc. general-purpose & XMM
    gax: union gp_and_xmm = $($(11., 12))
    if not test_gp_and_xmm(gax) {
        return 23
    }

    sas: union scalar_and_struct;
    sas.cfe.c = -5
    sas.cfe.d = -88.8
    if not test_scalar_and_struct(sas) {
        return 24
    }

    htu: struc has_two_unions = $(        cim, od        )

    if not test_has_two_unions(htu) {
        return 25
    }

    ssaad: union small_struct_arr_and_dbl;
    ssaad.d.arr[0] = -22.
    ssaad.d.arr[1] = -32.

    if not test_small_struct_arr_and_dbl(ssaad) {
        return 26
    }

    #  IId. XMM & general-purpose
    xag: union xmm_and_gp;
    xag.ise.d = -8.
    xag.ise.i = -8

    if not test_xmm_and_gp(xag) {
        return 27
    }

    xagn: union xmm_and_gp_nested = $(xag)
    if not test_xmm_and_gp_nested(xagn) {
        return 28
    }

    #  III. passed in memory
    dbls: union lotsa_doubles = $($(99., 98., 97.))
    if not test_lotsa_doubles(dbls) {
        return 29
    }

    chars: union lotsa_chars = $("asflakjsdflkjs")
    if not test_lotsa_chars(chars) {
        return 30
    }

    large_struct: struc large = $(100, 100., "A struct!")
    cls: union contains_large_struct;
    cls.l = large_struct
    if not test_contains_large_struct(cls) {
        return 31
    }

    gax2: union gp_and_xmm = gax
    gax2.d_arr[0] = -2.0
    gax2.d_arr[1] = -1.0
    cua: union contains_union_array = $(        
        $(gax, gax2)        )
    if not test_contains_union_array(cua) {
        return 32
    }

    return 0 #  success
}
