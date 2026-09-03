#ifndef _BACKEND_SYMT_CVT_H
#define _BACKEND_SYMT_CVT_H

#include "../lib/c_std.h"

#include "../ast/ast_t.h"

struct Type;
struct AssemblyType;
struct AsmProgram;
struct BackEndContext;
struct FrontEndContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Symbol table conversion

TInt gen_type_alignment(struct FrontEndContext* ctx, struct Type* type);
shared_ptr_t(AssemblyType) cvt_backend_asm_type(struct FrontEndContext* ctx, TIdentifier name);
void convert_symbol_table(struct AsmProgram* node, struct BackEndContext* backend, struct FrontEndContext* frontend);

#endif
