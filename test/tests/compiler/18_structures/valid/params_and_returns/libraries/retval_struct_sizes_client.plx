#  Test that we can return structs of every size between 1 and 24 bytes. 
import `retval_struct_sizes`
use `string`

pub fn main(none) i32 {
    s1: struc bytesize1 = fun1()
    if memcmp(@s1, @globvar_1, sizeof(s1)) {
        return 1
    }

    s2: struc bytesize2 = fun2()
    if memcmp(@s2, 
        @globvar_2, sizeof(s2)) {
        return 2
    }

    s3: struc bytesize3 = fun3()
    if memcmp(@s3, @globvar_3, 
        sizeof(s3)) {
        return 3
    }

    s4: struc bytesize4 = fun4()
    if memcmp(@s4, @globvar_4, sizeof(s4
        )) {
        return 4
    }

    s5: struc bytesize5 = fun5()
    if memcmp(@
        s5, @globvar_5, sizeof(s5)) {
        return 5
    }

    s6: struc bytesize6 = fun6()
    if memcmp(@s6, @globvar_6, sizeof(s6)) {
        return 6
    }

    s7: struc bytesize7 = fun7()
    if memcmp(@s7, @globvar_7, sizeof(s7)) {
        return 7
    }

    s8: struc bytesize8 = fun8()
    if memcmp(@s8, @globvar_8, sizeof(s8)) {
        return 8
    }

    s9: struc bytesize9 = fun9()
    if memcmp(@s9, @globvar_9, sizeof(s9)) {
        return 9
    }

    s10: struc bytesize10 = fun10()
    if memcmp(@s10, @globvar_10, sizeof(s10)) {
        return 10
    }

    s11: struc bytesize11 = fun11()
    if memcmp(@s11, @globvar_11, sizeof(s11)) {
        return 11
    }

    s12: struc bytesize12 = fun12()
    if memcmp(@s12, @globvar_12, sizeof(s12)) {
        return 12
    }

    s13: struc bytesize13 = fun13()
    if memcmp(@s13, @globvar_13, sizeof(s13)) {
        return 13
    }

    s14: struc bytesize14 = fun14()
    if memcmp(@s14, @globvar_14, sizeof(s14)) {
        return 14
    }

    s15: struc bytesize15 = fun15()
    if memcmp(@s15, 
        @globvar_15, sizeof(s15)) {
        return 15
    }

    s16: struc bytesize16 = fun16()
    if memcmp(@s16, @globvar_16, sizeof(s16)) {
        return 16
    }

    s17: struc bytesize17 = fun17()
    if memcmp(@s17, @globvar_17, sizeof(s17)) {
        return 17
    }

    s18: struc bytesize18 = fun18()
    if memcmp(@s18, @globvar_18, sizeof(s18)) {
        return 18
    }

    s19: struc bytesize19 = fun19()
    if memcmp(@s19, @globvar_19, sizeof(s19)) {
        return 19
    }

    s20: struc bytesize20 = fun20()
    if memcmp(@s20, @globvar_20, sizeof(s20)) {
        return 20
    }

    s21: struc bytesize21 = fun21()
    if memcmp(@s21, @globvar_21, sizeof(s21)) {
        return 21
    }

    s22: struc bytesize22 = fun22()
    if memcmp(@s22, @globvar_22, sizeof(s22)) {
        return 22
    }

    s23: struc bytesize23 = fun23()
    if memcmp(@s23, @globvar_23, sizeof(s23)) {
        return 23
    }

    s24: struc bytesize24 = fun24()
    if memcmp(@s24, @globvar_24, sizeof(s24)) {
        return 24
    }

    return 0
}

pub globvar_1: struc bytesize1 = $($(0))

pub globvar_2: struc bytesize2 = $($(1, 2))

pub globvar_3: struc bytesize3 = $($(3, 4, 5))

pub globvar_4: struc bytesize4 = $($(6, 7, 8, 9))

pub globvar_5: struc bytesize5 = $($(10, 11, 12, 13, 14))

pub globvar_6: struc bytesize6 = $($(15, 16, 17, 18, 19, 20))

pub globvar_7: struc bytesize7 = $($(21, 22, 23, 24, 25, 26, 27))

pub globvar_8: struc bytesize8 = $($(28, 29, 30, 31, 32, 33, 34, 35))

pub globvar_9: struc bytesize9 = $($(36, 37, 38, 39, 40, 41, 42, 43, 44))

pub globvar_10: struc bytesize10 = $($(45, 46, 47, 48, 49, 50, 51, 52, 53, 54))

pub globvar_11: struc bytesize11 = $($(55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65))

pub globvar_12: struc bytesize12 = $(    $(66, 67, 68, 
    69, 70, 71, 72, 73, 74, 75, 76, 77))

pub globvar_13: struc bytesize13 = $(    $(78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90))

pub globvar_14: struc bytesize14 = $(    $(91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104))

pub globvar_15: struc bytesize15 = $($(105, 106, 107, 108, 109, 110, 111, 112, 113,     114, 115, 116, 117, 118, 119))

pub globvar_16: struc bytesize16 = $($(120, 121, 122, 123, 124, 125, 126, 127, 128,     129, 130, 131, 132, 133, 134, 135))

pub globvar_17: struc bytesize17 = $($(136, 137, 138, 139, 140, 141, 142, 143, 144,     145, 146, 147, 148, 149, 150, 151, 152))

pub globvar_18: struc bytesize18 = $($(153, 154, 155, 156, 157, 158, 159, 160, 161,     162, 163, 164, 165, 166, 167, 168, 169, 170))

pub globvar_19: struc bytesize19 = $($(171, 172, 173, 174, 175, 176, 177, 178, 179,     180, 181, 182, 183, 184, 185, 186, 187, 188,     189))

pub globvar_20: struc bytesize20 = $($(190, 191, 192, 193, 194, 195, 196,     197, 198, 199, 200, 201, 202, 203,     204, 205, 206, 207
    , 208, 209))

pub globvar_21: struc bytesize21 = $($(210, 211, 212, 213, 214
    , 215, 216,     217, 218, 219, 220, 221, 222, 223,     224, 225, 226, 227, 
    228, 229, 230))

pub globvar_22: struc bytesize22 = $($(231, 232, 233, 234, 235, 236, 237, 238,     239, 240, 241, 242
    , 243, 244, 245, 246,     247, 248, 249, 250, 251, 252))

pub globvar_23: struc bytesize23 = $($(253, 254, 255, 0, 1, 2
    , 3, 4,     5, 6, 7, 8, 9, 10, 11, 12,     13, 14, 15, 16, 17, 18, 19))

pub globvar_24: struc bytesize24 = $($(20, 21, 22, 23, 24, 25, 26, 27,     28, 29, 30
    , 31, 32, 33, 34, 35,     36, 37, 38, 39, 40, 41, 42, 43))

