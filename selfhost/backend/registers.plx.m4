m4_ifdef(`_BACKEND_REGISTERS_M4', `', `
m4_define(`_BACKEND_REGISTERS_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

m4_include(`../backend/regs.plx.m4')m4_dnl

type struc AsmReg;
type struc AsmOperand;
pub fn gen_register(reg_kind: REGISTER_KIND) shared_ptr_t(AsmOperand);
pub fn gen_memory(reg_kind: REGISTER_KIND, value: i64) shared_ptr_t(AsmOperand);
pub fn gen_indexed(reg_kind_base: REGISTER_KIND, reg_kind_idx: REGISTER_KIND, scale: i64) shared_ptr_t(AsmOperand);
pub fn register_mask_kind(node: *struc AsmReg) REGISTER_KIND;
pub fn register_mask_bit(reg_kind: REGISTER_KIND) u64;
pub fn register_mask_get(reg_mask: u64, reg_kind: REGISTER_KIND) i32;
pub fn register_mask_set(reg_mask: *u64, reg_kind: REGISTER_KIND, value: i32) none;

')m4_dnl
