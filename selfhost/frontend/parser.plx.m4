m4_ifdef(`_FRONTEND_PARSER_M4', `', `
m4_define(`_FRONTEND_PARSER_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

type struc Token;
type struc CProgram;
type struc ErrorsContext;
type struc IdentifierContext;
pub fn parse_tokens(tokens: *vector_t(struc Token), errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: *unique_ptr_t(CProgram)) error_t;

')m4_dnl
