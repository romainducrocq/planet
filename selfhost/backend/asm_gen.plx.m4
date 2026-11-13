m4_ifdef(`_BACKEND_ASM_GEN_M4', `', `
m4_define(`_BACKEND_ASM_GEN_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

type struc TacProgram;
type struc AsmProgram;
type struc FrontEndContext;
type struc IdentifierContext;

########################################################################################################################

# Assembly generation

pub fn generate_assembly(tac_ast: *unique_ptr_t(TacProgram), frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) unique_ptr_t(AsmProgram);

')m4_dnl
