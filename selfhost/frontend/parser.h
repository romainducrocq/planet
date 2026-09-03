#ifndef _FRONTEND_PARSER_H
#define _FRONTEND_PARSER_H

#include "../lib/c_std.h"

#include "../util/throw.h"

struct Token;
struct CProgram;
struct ErrorsContext;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Parser

error_t parse_tokens(vector_t(struct Token) * tokens, struct ErrorsContext* errors,
    struct IdentifierContext* identifiers, unique_ptr_t(CProgram) * c_ast);

#endif
