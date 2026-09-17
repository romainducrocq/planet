#ifndef _BACKEND_STACK_FIX_H
#define _BACKEND_STACK_FIX_H

#include "../lib/c_std.h"

#include "../ast/ast_t.h"

struct AsmInstruction;
struct AsmProgram;
struct BackEndContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Stack fix

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Pseudo register replacement
// Instruction fix up

unique_ptr_t(AsmInstruction) alloc_stack_bytes(TLong byte);
void fix_stack(struct AsmProgram* node, struct BackEndContext* backend);

#endif
