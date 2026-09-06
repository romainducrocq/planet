#ifndef _FRONTEND_LEXER_H
#define _FRONTEND_LEXER_H

#include "../lib/c_std.h"

#include "../util/throw.h"

#include "../ast/ast_t.h"

#include "../frontend/tokens.h"

struct ErrorsContext;
struct FileIoContext;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Lexer

struct Token {
    TOKEN_KIND tok_kind;
    TIdentifier tok;
    unsigned long info_at;
};

error_t lex_c_code(string_t filename, vector_t(char*) * includedirs, vector_t(char*) * stdlibdirs,
    struct ErrorsContext* errors, struct FileIoContext* fileio, struct IdentifierContext* identifiers,
    vector_t(struct Token) * tokens);

#endif
