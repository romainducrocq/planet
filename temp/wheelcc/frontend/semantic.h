#ifndef _FRONTEND_SEMANTIC_H
#define _FRONTEND_SEMANTIC_H

#include "../util/throw.h"

struct CProgram;
struct ErrorsContext;
struct FrontEndContext;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Semantic analysis

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Type checking
// Loop labeling
// Identifier resolution

error_t analyze_semantic(struct CProgram* node, struct ErrorsContext* errors, struct FrontEndContext* frontend,
    struct IdentifierContext* identifiers);

#endif
