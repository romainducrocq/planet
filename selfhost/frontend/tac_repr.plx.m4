m4_ifdef(`_FRONTEND_TAC_REPR_M4', `', `
m4_define(`_FRONTEND_TAC_REPR_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

type struc CProgram;
type struc TacProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram;

')m4_dnl
