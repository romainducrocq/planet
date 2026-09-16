m4_ifdef(`_FRONTEND_SEMANTIC_M4', `', `
m4_define(`_FRONTEND_SEMANTIC_M4', `')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

type struc CProgram;
type struc ErrorsContext;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32;

')m4_dnl
