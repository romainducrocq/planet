m4_ifdef(`_OPTIMIZER_REG_ALLOC_M4', `', `
m4_define(`_OPTIMIZER_REG_ALLOC_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;
pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none;

')m4_dnl
