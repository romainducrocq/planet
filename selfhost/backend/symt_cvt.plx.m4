m4_ifdef(`_BACKEND_SYMT_CVT_M4', `', `
m4_define(`_BACKEND_SYMT_CVT_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

type struc Type;
type struc AssemblyType;
type struc AsmProgram;
type struc BackEndContext;
type struc FrontEndContext;

########################################################################################################################

# Symbol table conversion

pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) TInt;
pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: TIdentifier) shared_ptr_t(AssemblyType);
pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none;

')m4_dnl
