#ifndef _UTIL_THROW_H
#define _UTIL_THROW_H

#include "../lib/c_std.h"

struct FileIoContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Throw

#ifdef __GCC_BOOTSTRAP__
#ifdef __GNUC__
#pragma GCC diagnostic ignored "-Wreturn-type"
#endif
#endif

#define hash_t unsigned long
PairKeyValue(hash_t, hash_t);

struct FileOpenLine {
    unsigned long linenum;
    unsigned long total_linenum;
    string_t filename;
};

struct TokenInfo {
    int tok_pos;
    int tok_len;
    unsigned long total_linenum;
};

struct ErrorsContext {
    struct ErrorsContext* errors;
    struct FileIoContext* fileio;
    // Throw
    char msg[ERROR_MSG_SIZE];
    bool is_stdout;
    unsigned long info_at_buf;
    hashmap_t(hash_t, hash_t) info_at_map;
    vector_t(struct FileOpenLine) fopen_lines;
    vector_t(struct TokenInfo) token_infos;
};

void panic_sigabrt(char* msg, int line, char* file);
#define PANIC_FUNC(X, ...) panic_sigabrt(X, __VA_ARGS__)
#define THROW_ABORT THROW_PANIC("abort")
#define THROW_ALLOC(T) THROW_PANIC("alloc " #T)
#if 0
#define THROW_ABORT_IF(X) \
    if (X)                \
    THROW_ABORT
#else
#define THROW_ABORT_IF(X)
#endif

void raise_init_error(struct ErrorsContext* ctx);
void raise_base_error(struct ErrorsContext* ctx);
void raise_error_at_token(struct ErrorsContext* ctx, unsigned long info_at);
#define ERROR_MSG_BUF ctx->errors->msg
#define THROW_INIT(...) THROW_ERROR(1, raise_init_error(ctx->errors), __VA_ARGS__)
#define THROW_BASE(...) THROW_ERROR(1, raise_base_error(ctx->errors), __VA_ARGS__)
#define THROW_AT_TOKEN(X, ...) THROW_ERROR(1, raise_error_at_token(ctx->errors, X), __VA_ARGS__)

#endif
