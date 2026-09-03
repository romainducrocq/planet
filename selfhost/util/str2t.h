#ifndef _UTIL_STR2T_H
#define _UTIL_STR2T_H

#include "../lib/c_std.h"

#include "../util/throw.h"

struct ErrorsContext;

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// String to type

uint64_t dbl_to_binary(double decimal);
void string_to_literal(string_t str_string, vector_t(int8_t) * string_literal);
int32_t string_to_char_ascii(string_t str_char);
int8_t string_bytes_to_int8(vector_t(int8_t) string_literal, unsigned long byte_at);
int32_t string_bytes_to_int32(vector_t(int8_t) string_literal, unsigned long byte_at);
int64_t string_bytes_to_int64(vector_t(int8_t) string_literal, unsigned long byte_at);
string_t string_literal_to_const(vector_t(int8_t) string_literal);
error_t string_to_long(struct ErrorsContext* ctx, char* str_int, unsigned long info_at, long* value);
error_t string_to_ulong(struct ErrorsContext* ctx, char* str_uint, unsigned long info_at, unsigned long* value);
error_t string_to_dbl(struct ErrorsContext* ctx, char* str_dbl, unsigned long info_at, double* value);

#endif
