#ifndef _BACKEND_ASM_GEN_H
#define _BACKEND_ASM_GEN_H

#include "../lib/c_std.h"

struct TacProgram;
struct AsmProgram;
struct FrontEndContext;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Assembly generation

unique_ptr_t(AsmProgram) generate_assembly(
    unique_ptr_t(TacProgram) * tac_ast, struct FrontEndContext* frontend, struct IdentifierContext* identifiers);

#endif
