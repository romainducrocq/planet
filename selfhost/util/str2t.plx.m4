m4_ifdef(`_UTIL_STR2T_M4', `', `
m4_define(`_UTIL_STR2T_M4', `')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

type struc ErrorsContext;
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: *vector_t(i8)) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: vector_t(i8), byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: vector_t(i8), byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: vector_t(i8), byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: vector_t(i8)) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;

')m4_dnl
