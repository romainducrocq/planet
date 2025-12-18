m4_changequote(`[[', `]]')m4_dnl
m4_define([[M4_CHAR]], [['$1']])m4_dnl
m4_changequote([[`]], [[']])m4_dnl

m4_define(`CONST_ZERO', 0)m4_dnl
m4_define(`CONST_ONE', 1)m4_dnl
m4_define(`CONST_TWO', 2)m4_dnl
m4_define(`CONST_THREE', 3)m4_dnl

m4_define(`RETURN_VAL', `return $1')m4_dnl

pub fn main(none) i32 {
    if 'a' ~= M4_CHAR(a) {
        RETURN_VAL(CONST_ONE)
    }

    arr: [CONST_THREE]i32 = $(
        CONST_ONE,
        CONST_TWO,
        M4_CHAR(CONST_ZERO)
    )

    match arr[CONST_ONE] {
        -> M4_CHAR(CONST_ZERO);
        -> M4_CHAR(CONST_ONE);
        -> M4_CHAR(CONST_TWO);
        -> CONST_ZERO;
        -> CONST_ONE {
            break
        }
        -> CONST_TWO {
            if arr[CONST_TWO] == '0' {
                RETURN_VAL(CONST_ZERO)
            }
            else {
                RETURN_VAL(CONST_TWO)
            }
        }
        otherwise {
            break
        }
    }

    return 3
}
