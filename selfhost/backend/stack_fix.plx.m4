m4_ifdef(`_BACKEND_STACK_FIX_M4', `', `
m4_define(`_BACKEND_STACK_FIX_M4', `')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl

type struc AsmInstruction;
type struc AsmProgram;
type struc BackEndContext;

########################################################################################################################

# Stack fix

########################################################################################################################

# Pseudo register replacement
# Instruction fix up

pub fn alloc_stack_bytes(byte: TLong) unique_ptr_t(AsmInstruction);
pub fn fix_stack(node: *struc AsmProgram, backend: *struc BackEndContext) none;

')m4_dnl
