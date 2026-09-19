m4_ifdef(`_FRONTEND_LEXER_M4', `', `
m4_define(`_FRONTEND_LEXER_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

m4_include(`../frontend/tokens.plx.m4')m4_dnl

type struc ErrorsContext;
type struc FileIoContext;
type struc IdentifierContext;

type struc Token(tok_kind: i32, tok: u64, info_at: u64)

pub fn lex_c_code(filename: string, includedirs: *vector_t(string), stdlibdirs: *vector_t(string), errors: *struc ErrorsContext, fileio: *struc FileIoContext, identifiers: *struc IdentifierContext, tokens: *vector_t(struc Token)) i32;

')m4_dnl
