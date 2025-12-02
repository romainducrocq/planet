#ifndef _FRONT_PARSER_MESSAGES_H
#define _FRONT_PARSER_MESSAGES_H

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Errors

typedef enum MESSAGE_LEXER {
    MSG_unhandled_lexer_error = 300,
    MSG_invalid_tok,
    MSG_failed_include,
    MSG_preproc_macro,
    MSG_unmatched_close
} MESSAGE_LEXER;

typedef enum MESSAGE_PARSER {
    MSG_unhandled_parser_error = 400,
    MSG_unexpected_next_tok,
    MSG_reached_eof,
    MSG_overflow_long_const,
    MSG_overflow_ulong_const,
    MSG_arr_size_not_int_const,
    MSG_case_value_not_int_const,
    MSG_expect_unop,
    MSG_expect_binop,
    MSG_expect_primary_exp_factor,
    MSG_expect_exp,
    MSG_expect_specifier,
    MSG_expect_storage_class,
    MSG_empty_compound_init,
    MSG_expect_declaration,
    MSG_expect_assign,
    MSG_expect_datatype,
    MSG_expect_block,
    MSG_empty_block,
    MSG_infinite_loop,
    MSG_data_at_toplvl,
    MSG_pub_in_block,
    MSG_type_decl_not_auto,
    MSG_list_decl_not_auto,
    MSG_loop_decl_not_auto,
    MSG_expect_maybe_type,
    MSG_expect_data_specifier,
    MSG_incomplete_any,
    MSG_expect_open_sizeof
} MESSAGE_PARSER;

#endif
