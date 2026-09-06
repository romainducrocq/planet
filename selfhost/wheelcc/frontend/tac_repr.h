#ifndef _FRONTEND_TAC_REPR_H
#define _FRONTEND_TAC_REPR_H

#include "../lib/c_std.h"

struct CProgram;
struct TacProgram;
struct FrontEndContext;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Three address code representation

unique_ptr_t(TacProgram) represent_three_address_code(
    unique_ptr_t(CProgram) * c_ast, struct FrontEndContext* frontend, struct IdentifierContext* identifiers);

#endif
