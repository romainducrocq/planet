#ifndef _BACKEND_GAS_CODE_H
#define _BACKEND_GAS_CODE_H

#include "../lib/c_std.h"

struct AsmProgram;
struct BackEndContext;
struct FileIoContext;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Gnu assembler code emission

void emit_gas_code(unique_ptr_t(AsmProgram) * asm_ast, struct BackEndContext* backend, struct FileIoContext* fileio,
    struct IdentifierContext* identifiers);

#endif
