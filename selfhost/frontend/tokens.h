#ifndef _FRONTEND_TOKENS_H
#define _FRONTEND_TOKENS_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Lexer

#define TOKEN_KIND int
#define TOK_skip 0

#define TOK_line_break 1
#define TOK_open_paren 2
#define TOK_close_paren 3
#define TOK_open_brace 4
#define TOK_close_brace 5
#define TOK_open_bracket 6
#define TOK_close_bracket 7
#define TOK_comma_separator 8
#define TOK_semicolon 9

#define TOK_unop_complement 10
#define TOK_unop_neg 11
#define TOK_unop_not 12
#define TOK_unop_addrof 13
#define TOK_unop_incr 14
#define TOK_unop_decr 15

#define TOK_binop_add 16
#define TOK_binop_multiply 17
#define TOK_binop_divide 18
#define TOK_binop_remainder 19
#define TOK_binop_bitand 20
#define TOK_binop_bitor 21
#define TOK_binop_xor 22
#define TOK_binop_shiftleft 23
#define TOK_binop_shiftright 24
#define TOK_binop_and 25
#define TOK_binop_or 26
#define TOK_binop_eq 27
#define TOK_binop_ne 28
#define TOK_binop_lt 29
#define TOK_binop_le 30
#define TOK_binop_gt 31
#define TOK_binop_ge 32

#define TOK_assign 33
#define TOK_assign_type 34
#define TOK_assign_add 35
#define TOK_assign_subtract 36
#define TOK_assign_multiply 37
#define TOK_assign_divide 38
#define TOK_assign_remainder 39
#define TOK_assign_bitand 40
#define TOK_assign_bitor 41
#define TOK_assign_xor 42
#define TOK_assign_shiftleft 43
#define TOK_assign_shiftright 44

#define TOK_force_exec 45
#define TOK_ternary_if 46
#define TOK_compound_init 47
#define TOK_typeop_member 48
#define TOK_loop_post 49
#define TOK_match_with 50

#define TOK_key_char 51
#define TOK_key_string 52
#define TOK_key_i32 53
#define TOK_key_i64 54
#define TOK_key_i8 55
#define TOK_key_f64 56
#define TOK_key_u32 57
#define TOK_key_u64 58
#define TOK_key_u8 59
#define TOK_key_any 60
#define TOK_key_none 61
#define TOK_key_fn 62
#define TOK_key_struc 63
#define TOK_key_union 64
#define TOK_key_type 65
#define TOK_key_sizeof 66
#define TOK_key_return 67
#define TOK_key_cast 68
#define TOK_key_if 69
#define TOK_key_elif 70
#define TOK_key_else 71
#define TOK_key_then 72
#define TOK_key_jump 73
#define TOK_key_label 74
#define TOK_key_loop 75
#define TOK_key_while 76
#define TOK_key_match 77
#define TOK_key_otherwise 78
#define TOK_key_break 79
#define TOK_key_continue 80
#define TOK_key_pub 81
#define TOK_key_data 82
#define TOK_key_extrn 83
#define TOK_key_true 84
#define TOK_key_false 85

#define TOK_identifier 86
#define TOK_string_literal 87
#define TOK_char_const 88
#define TOK_int_const 89
#define TOK_long_const 90
#define TOK_uint_const 91
#define TOK_ulong_const 92
#define TOK_dbl_const 93

#define TOK_m4_prefix 94
#define TOK_import_file 95
#define TOK_import_force 96
#define TOK_use_file 97
#define TOK_use_force 98

#define TOK_error 99

#endif
