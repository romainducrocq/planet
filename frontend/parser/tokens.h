#ifndef _FRONT_PARSER_TOKENS_H
#define _FRONT_PARSER_TOKENS_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Lexer

typedef enum TOKEN_KIND {
    TOK_skip,

    TOK_assign_shiftleft,
    TOK_assign_shiftright,

    TOK_unop_incr,
    TOK_unop_decr,
    TOK_binop_shiftleft,
    TOK_binop_shiftright,
    TOK_binop_and,
    TOK_binop_or,
    TOK_binop_eq,
    TOK_binop_ne,
    TOK_binop_le,
    TOK_binop_ge,
    TOK_assign_add,
    TOK_assign_subtract,
    TOK_assign_multiply,
    TOK_assign_divide,
    TOK_assign_remainder,
    TOK_assign_bitand,
    TOK_assign_bitor,
    TOK_assign_xor,
    // TOK_structop_ptr,
    TOK_loop_post,
    TOK_match_with,

    TOK_line_break,
    TOK_open_paren,
    TOK_close_paren,
    TOK_open_brace,
    TOK_close_brace,
    // TOK_open_bracket,
    // TOK_close_bracket,
    TOK_semicolon,
    TOK_unop_complement,
    TOK_unop_neg,
    TOK_unop_not,
    TOK_binop_add,
    TOK_binop_multiply,
    TOK_binop_divide,
    TOK_binop_remainder,
    TOK_binop_bitand,
    TOK_binop_bitor,
    TOK_binop_xor,
    TOK_binop_lt,
    TOK_binop_gt,
    TOK_assign,
    TOK_assign_type,
    TOK_ternary_if,
    TOK_comma_separator,
    // TOK_structop_member,

    // TOK_key_char,
    TOK_key_int, // TODO rm
    TOK_key_i32,
    // TOK_key_long,
    // TOK_key_double,
    // TOK_key_signed,
    // TOK_key_unsigned,
    TOK_key_void, // TODO rm
    TOK_key_none,
    TOK_key_fn,
    // TOK_key_struct,
    // TOK_key_union,
    // TOK_key_sizeof,
    TOK_key_return,
    TOK_key_if,
    TOK_key_elif,
    TOK_key_else,
    TOK_key_then,
    TOK_key_jump,
    TOK_key_label,
    TOK_key_loop,
    TOK_key_while,
    TOK_key_match,
    TOK_key_otherwise,
    TOK_key_break,
    TOK_key_continue,
    TOK_key_pub,
    TOK_key_data,
    TOK_key_extrn,
    TOK_key_true,
    TOK_key_false,

    TOK_identifier,
    TOK_string_literal,
    TOK_char_const,
    TOK_int_const,
    TOK_long_const,
    TOK_uint_const,
    TOK_ulong_const,
    TOK_dbl_const,

    TOK_m4_prefix,
    // TOK_include_preproc,

    TOK_error
} TOKEN_KIND;

#endif
