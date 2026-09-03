#ifndef _BACKEND_REGISTERS_H
#define _BACKEND_REGISTERS_H

#include "../lib/c_std.h"

#include "../ast/ast_t.h"

#include "../backend/regs.h"

struct AsmReg;
struct AsmOperand;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Registers

shared_ptr_t(AsmOperand) gen_register(REGISTER_KIND reg_kind);
shared_ptr_t(AsmOperand) gen_memory(REGISTER_KIND reg_kind, TLong value);
shared_ptr_t(AsmOperand) gen_indexed(REGISTER_KIND reg_kind_base, REGISTER_KIND reg_kind_idx, TLong scale);
REGISTER_KIND register_mask_kind(struct AsmReg* node);
unsigned long register_mask_bit(REGISTER_KIND reg_kind);
bool register_mask_get(TULong reg_mask, REGISTER_KIND reg_kind);
void register_mask_set(TULong* reg_mask, REGISTER_KIND reg_kind, bool value);

#endif
