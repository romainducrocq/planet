m4_ifdef(`_OPTIMIZER_OPTIM_TAC_M4', `', `
m4_define(`_OPTIMIZER_OPTIM_TAC_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

type struc TacProgram;
type struc FrontEndContext;
pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none;

')m4_dnl
