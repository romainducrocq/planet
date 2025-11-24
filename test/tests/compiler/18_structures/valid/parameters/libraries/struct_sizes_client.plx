#  Test that we can pass static and automatic structs of every size between 1 and 24 bytes.
#  * Pass each size both in a register (when possible) and on the stack. 
import `struct_sizes`

pub fn main(none) i32 {

    #  pass global variables of each size
    if not fun0(globvar_1, globvar_2, globvar_3, globvar_4, globvar_5, globvar_6,         globvar_7, globvar_8, globvar_9, globvar_10, globvar_11,         globvar_12, globvar_13, globvar_14, globvar_15, globvar_16,         globvar_17, globvar_18, globvar_19, globvar_20, globvar_21,         globvar_22, globvar_23, globvar_24, globvar_1.arr, globvar_2.arr,         globvar_3.arr, globvar_4.arr, globvar_5.arr, globvar_6.arr,         globvar_7.arr, globvar_8.arr, globvar_9.arr, globvar_10.arr,         globvar_11.arr, globvar_12.arr, globvar_13.arr, globvar_14.arr,         globvar_15.arr, globvar_16.arr, globvar_17.arr, globvar_18.arr,         globvar_19.arr, globvar_20.arr, globvar_21.arr, globvar_22.arr,         globvar_23.
        arr, globvar_24.arr) {
        return 1
    }

    if not fun1(globvar_7, globvar_8, globvar_9, globvar_10, globvar_1, globvar_2,         globvar_3, globvar_4, globvar_5, globvar_6, globvar_7.arr,         globvar_8.arr, globvar_9.arr, globvar_10.arr, globvar_1.arr,         globvar_2.arr, globvar_3.arr, globvar_4.arr, globvar_5.arr,         globvar_6.arr) {
        return 2
    }

    if not fun2(globvar_11, globvar_12, globvar_13, globvar_1, globvar_11.arr,         globvar_12.arr, globvar_13.arr, globvar_1.arr) {
        return 3
    }

    if not fun3(globvar_14, globvar_15, globvar_16, globvar_2, globvar_14.arr,         globvar_15.arr, globvar_16.arr, globvar_2.arr) {
        return 4
    }

    #  define local variables of each size
    locvar_1: struc bytesize1 = $($(0))

    locvar_2: struc bytesize2 = $($(1, 2))

    locvar_3: struc bytesize3 = $($(3, 4, 5))

    locvar_4: struc bytesize4 = $($(6, 7, 8, 9))

    locvar_5: struc bytesize5 = $($(10, 11, 12, 13, 14))

    locvar_6: struc bytesize6 = $($(15, 16, 17, 18, 19, 20))

    locvar_7: struc bytesize7 = $($(21, 22, 23, 24, 25, 26, 27))

    locvar_8: struc bytesize8 = $($(28, 29, 30, 31, 32, 33, 34, 35))

    locvar_9: struc bytesize9 = $($(36, 37, 38, 39, 40, 41, 42, 43, 44))

    locvar_10: struc bytesize10 = $($(45, 46, 47, 48, 49, 50, 51, 52, 53, 54))

    locvar_11: struc bytesize11 = $(        $(55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65))

    locvar_12: struc bytesize12 = $(        $(66, 67, 68, 69, 70, 71, 
        72, 73, 74, 75, 76, 77))

    locvar_13: struc bytesize13 = $(        $(78, 
        79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90))

    locvar_14: struc bytesize14 = $(        $(91
        , 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104))

    locvar_15: struc bytesize15 = $($(105, 
        106, 107, 108, 109, 110, 111, 112, 113,         114, 115, 116, 117, 118, 119))

    locvar_16: struc bytesize16 = $($(120, 121, 122, 123
        , 124, 125, 126, 127, 128,         129, 130, 131, 132, 133, 134, 135))

    locvar_17: struc bytesize17 = $($(136, 137, 138, 139, 140, 141, 142, 143, 144,         145, 146, 147, 148, 149, 150, 151
        , 152))

    locvar_18: struc bytesize18 = $($(153, 154, 155, 156, 157, 158, 159, 160, 161,         162, 163, 164, 165, 166, 167, 168, 169,         170))

    locvar_19: struc bytesize19 = $($(171, 172, 173, 174, 175, 176, 177, 178, 179,         180, 181, 182, 183, 184, 185, 186, 187, 188,         189))

    locvar_20: struc bytesize20 = $($(190, 191, 192, 193, 194, 195, 196,         197, 198, 199, 200, 201, 202, 203,         204, 205, 206, 207, 208, 209))

    locvar_21: struc bytesize21 = $($(210, 211, 212, 213, 214, 215, 216,         217, 218, 219, 220, 221
        , 222, 223,         224, 225, 226, 227, 228, 229, 230))

    locvar_22: struc bytesize22 = $($(231, 232, 233, 234, 235, 236, 237, 238,         239, 240, 241, 242, 243, 244, 245, 246,         247, 248, 249, 250, 251, 252))

    locvar_23: struc bytesize23 = $($(253, 254, 255, 0, 1, 2, 3, 4,         5, 6
        , 7, 8, 9, 10, 11, 12,         13, 14, 15, 16, 17, 18, 19))

    locvar_24: struc bytesize24 = $($(20, 21, 22, 23, 
        24, 25, 26, 27,         28, 29, 30, 31, 32, 33, 34, 35,         36, 37, 38, 39, 40, 41, 42, 43))

    #  pass local variables of each size
    if not fun0(locvar_1, locvar_2, locvar_3, locvar_4, locvar_5, locvar_6,         locvar_7, locvar_8, locvar_9, locvar_10, locvar_11, locvar_12,         locvar_13, locvar_14, locvar_15, locvar_16, locvar_17, locvar_18,         locvar_19
        , locvar_20, locvar_21, locvar_22, locvar_23, locvar_24,         locvar_1.arr, locvar_2.arr, locvar_3.arr, locvar_4.arr,         locvar_5.arr, locvar_6.arr, locvar_7.arr, locvar_8.arr,         locvar_9.arr, locvar_10.
        arr, locvar_11.arr, locvar_12.arr,         locvar_13.arr, locvar_14.arr, locvar_15.arr, locvar_16.arr,         locvar_17.arr, locvar_18.arr, locvar_19.arr, locvar_20.arr,         locvar_21.arr, locvar_22.arr, locvar_23.arr, locvar_24.arr) {
        return 5
    }

    if not fun1(locvar_7, locvar_8, locvar_9, locvar_10, locvar_1, locvar_2,         locvar_3, locvar_4, locvar_5, locvar_6, locvar_7.arr, locvar_8.arr,         locvar_9.arr, locvar_10.arr, locvar_1.arr, locvar_2.arr,         locvar_3.arr, locvar_4.arr, locvar_5.arr, locvar_6.arr) {
        return 6
    }

    if not fun2(locvar_11, locvar_12, locvar_13, locvar_1, locvar_11.arr,         locvar_12.arr, locvar_13.arr, locvar_1.arr) {
        return 7
    }

    if not fun3(locvar_14, locvar_15, locvar_16, locvar_2, locvar_14.arr,         locvar_15.arr, locvar_16.arr, locvar_2.arr) {
        return 8
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

pub globvar_12: struc bytesize12 = $(    $(66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77))

pub globvar_13: struc bytesize13 = $(    $(78, 79, 80, 81, 82, 83, 84, 85, 86, 87
    , 88, 89, 90))

pub globvar_14: struc bytesize14 = $(    $(91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104))

pub globvar_15: struc bytesize15 = $($(105, 106, 107, 108, 109, 110, 111, 112, 113,     114, 115, 116, 117, 118, 119))

pub globvar_16: struc bytesize16 = $(
    $(120, 121, 122, 123, 124, 125, 126, 127, 128,     129, 130, 131, 132, 133, 134, 135))

pub globvar_17: struc bytesize17 = $($(136, 137, 138, 139, 140, 141, 142, 143, 144,     145, 146, 
    147, 148, 149, 150, 151, 152))

pub globvar_18: struc bytesize18 = $($(153, 154, 155, 156, 157, 158, 159, 160, 161,     162, 163, 164, 165, 166, 167, 168, 169, 170))

pub globvar_19: struc bytesize19 = $($(171, 172, 173, 174, 175, 176, 177, 178, 179,     180
    , 181, 182, 183, 184, 185, 186, 187, 188,     189))

pub globvar_20: struc bytesize20 = $($(190, 191, 192, 193, 194, 195, 196,     197, 198, 199, 200, 201, 202, 203,     204, 205, 206, 207, 208, 209))

pub globvar_21: struc bytesize21 = $($(210, 211, 212, 213, 214, 215, 216,     217, 218, 219, 220, 221, 222, 223,     224, 225, 226, 227, 228, 229, 230))

pub globvar_22: struc bytesize22 = $($(231, 232, 233, 234, 235, 236, 237, 238,     239, 240, 241, 242, 243, 244, 245, 246,     247, 248, 249, 250, 251, 252))

pub globvar_23: struc bytesize23 = $($(253, 254, 255, 0, 1, 2, 3, 4,     5, 6, 7, 8, 9, 10, 11, 12,     13, 14, 15, 16, 17, 18, 19))

pub globvar_24: struc bytesize24 = $($(20, 21, 22, 23, 24, 25, 26, 27,     28
    , 29, 30, 31, 32, 33, 34, 35,     36, 37, 38, 39, 40, 41, 42, 43))

