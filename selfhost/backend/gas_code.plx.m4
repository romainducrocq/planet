m4_ifdef(`_BACKEND_GAS_CODE_M4', `', `
m4_define(`_BACKEND_GAS_CODE_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

type struc AsmProgram;
type struc BackEndContext;
type struc FileIoContext;
type struc IdentifierContext;
pub fn emit_gas_code(asm_ast: **struc AsmProgram, backend: *struc BackEndContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext) none;

')m4_dnl
