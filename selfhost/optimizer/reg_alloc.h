#ifndef _OPTIMIZER_REG_ALLOC_H
#define _OPTIMIZER_REG_ALLOC_H

#include "../lib/c_std.h"

struct AsmProgram;
struct BackEndContext;
struct FrontEndContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Register allocation

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Register allocation
// Register coalescing

void allocate_registers(
    struct AsmProgram* node, struct BackEndContext* backend, struct FrontEndContext* frontend, uint8_t optim_2_code);

#endif
