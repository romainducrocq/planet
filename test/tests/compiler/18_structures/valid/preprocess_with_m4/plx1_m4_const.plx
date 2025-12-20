# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_include(`defchar.plx.m4')m4_dnl
m4_include(`return_val.plx.m4')m4_dnl

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
