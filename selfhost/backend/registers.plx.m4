m4_ifdef(`_BACKEND_REGISTERS_M4', `', `
m4_define(`_BACKEND_REGISTERS_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

m4_include(`../backend/regs.plx.m4')m4_dnl

')m4_dnl
