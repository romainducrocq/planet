m4_ifdef(`_FRONTEND_LEXER_M4', `', `
m4_define(`_FRONTEND_LEXER_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

m4_include(`../frontend/tokens.plx.m4')m4_dnl

')m4_dnl
