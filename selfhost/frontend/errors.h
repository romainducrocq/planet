#ifndef _FRONTEND_ERRORS_H
#define _FRONTEND_ERRORS_H

#include "../lib/c_std.h"

#include "../ast/ast_t.h"

#include "../frontend/messages.h"
#include "../frontend/tokens.h"

struct Token;
struct FunType;
struct Pointer;
struct Array;
struct Structure;
struct Type;
struct CConst;
struct CUnaryOp;
struct CBinaryOp;
struct CStorageClass;
struct IdentifierContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Errors

char* get_tok_kind_fmt(TOKEN_KIND tok_kind);
char* get_tok_fmt(struct IdentifierContext* ctx, struct Token* token);
char* get_const_fmt(struct CConst* node);
char* get_storage_class_fmt(struct CStorageClass* node);
char* get_unop_fmt(struct CUnaryOp* node);
char* get_binop_fmt(struct CBinaryOp* node);
char* get_assign_fmt(struct CBinaryOp* node, struct CUnaryOp* unop);
char* get_name_fmt(struct IdentifierContext* ctx, TIdentifier name, string_t* name_fmt);
char* get_struct_name_fmt(struct IdentifierContext* ctx, TIdentifier name, bool is_union, string_t* struct_fmt);
char* get_fun_fmt(struct IdentifierContext* ctx, struct FunType* fun_type, string_t* fun_fmt);
char* get_ptr_fmt(struct IdentifierContext* ctx, struct Pointer* ptr_type, string_t* ptr_fmt);
char* get_arr_fmt(struct IdentifierContext* ctx, struct Array* arr_type, string_t* arr_fmt);
char* get_struct_fmt(struct IdentifierContext* ctx, struct Structure* struct_type, string_t* struct_fmt);
char* get_type_fmt(struct IdentifierContext* ctx, struct Type* type, string_t* type_fmt);
#define str_get_fmt(T, ...) get_##T##_fmt(ctx->identifiers, __VA_ARGS__)
#define str_fmt_tok(X) str_get_fmt(tok, X)
#define str_fmt_name(X, Y) str_get_fmt(name, X, Y)
#define str_fmt_struct_name(X, Y, Z) str_get_fmt(struct_name, X, Y, Z)
#define str_fmt_fun(X, Y) str_get_fmt(fun, X, Y)
#define str_fmt_ptr(X, Y) str_get_fmt(ptr, X, Y)
#define str_fmt_arr(X, Y) str_get_fmt(arr, X, Y)
#define str_fmt_struct(X, Y) str_get_fmt(struct, X, Y)
#define str_fmt_type(X, Y) str_get_fmt(type, X, Y)

char* get_fatal_msg(MESSAGE_FATAL msg);
char* get_arg_msg(MESSAGE_ARG msg);
char* get_util_msg(MESSAGE_UTIL msg);
char* get_lexer_msg(MESSAGE_LEXER msg);
char* get_parser_msg(MESSAGE_PARSER msg);
char* get_semantic_msg(MESSAGE_SEMANTIC msg);
#define GET_MESSAGE(E, N) get_##E##_msg(N), #N
#define GET_MESSAGE_0(E, N) GET_MESSAGE(E, N), "", "", ""
#define GET_MESSAGE_1(E, N, X) GET_MESSAGE(E, N), "", "", X
#define GET_MESSAGE_2(E, N, X, Y) GET_MESSAGE(E, N), "", X, Y
#define GET_MESSAGE_3(E, N, X, Y, Z) GET_MESSAGE(E, N), X, Y, Z
#define GET_FATAL_MSG(N, ...) GET_MESSAGE_##N(fatal, __VA_ARGS__)
#define GET_ARG_MSG(N, ...) GET_MESSAGE_##N(arg, __VA_ARGS__)
#define GET_UTIL_MSG(N, ...) GET_MESSAGE_##N(util, __VA_ARGS__)
#define GET_LEXER_MSG(N, ...) GET_MESSAGE_##N(lexer, __VA_ARGS__)
#define GET_PARSER_MSG(N, ...) GET_MESSAGE_##N(parser, __VA_ARGS__)
#define GET_SEMANTIC_MSG(N, ...) GET_MESSAGE_##N(semantic, __VA_ARGS__)

#define STRINGIFY(X) #X
#define GET_VERSION(X, Y, Z) STRINGIFY(X), STRINGIFY(Y), STRINGIFY(Z)
#define GCC_VERSION GET_VERSION(__GNUC__, __GNUC_MINOR__, __GNUC_PATCHLEVEL__)
#define CLANG_VERSION GET_VERSION(__clang_major__, __clang_minor__, __clang_patchlevel__)

#endif
