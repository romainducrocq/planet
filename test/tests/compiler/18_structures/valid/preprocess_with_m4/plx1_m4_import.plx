# https://www.cs.auckland.ac.nz/references/unix/digital/APS32DTE/DOCU_006.HTM

m4_define(`IMPORT_GET_SUCCESS', `
import "../../invalid_lex/get_success"
')m4_dnl

m4_define(`USE_LIBC', `STDLIB')
m4_ifelse(USE_LIBC, `STDLIB', `
use "stdlib"
IMPORT_GET_SUCCESS
', `
use "stdio"
import "get_failure"
')

pub fn main(none) i32 {
    exit(get_success())
    return 1
}
