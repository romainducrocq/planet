m4_ifdef(`_BACKEND_ASM_GEN_M4', `', `
m4_define(`_BACKEND_ASM_GEN_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

type struc TacProgram;
type struc AsmProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn generate_assembly(tac_ast: **struc TacProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc AsmProgram;

')m4_dnl
