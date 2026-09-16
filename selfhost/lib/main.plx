m4_include(`c_std.plx.m4')m4_dnl

m4_include(`../util/fileio.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl
m4_include(`../ast/interm_ast.plx.m4')m4_dnl

m4_include(`../frontend/errors.plx.m4')m4_dnl
m4_include(`../frontend/lexer.plx.m4')m4_dnl
m4_include(`../frontend/parser.plx.m4')m4_dnl
m4_include(`../frontend/semantic.plx.m4')m4_dnl
m4_include(`../frontend/tac_repr.plx.m4')m4_dnl

m4_include(`../backend/asm_gen.plx.m4')m4_dnl
m4_include(`../backend/gas_code.plx.m4')m4_dnl
m4_include(`../backend/stack_fix.plx.m4')m4_dnl
m4_include(`../backend/symt_cvt.plx.m4')m4_dnl

m4_include(`../optimizer/optim_tac.plx.m4')m4_dnl
m4_include(`../optimizer/reg_alloc.plx.m4')m4_dnl















m4_define(`TOKEN_KIND', `TODO')m4_dnl
m4_define(`TOK_skip', `0')m4_dnl
m4_define(`TOK_line_break', `1')m4_dnl
m4_define(`TOK_open_paren', `2')m4_dnl
m4_define(`TOK_close_paren', `3')m4_dnl
m4_define(`TOK_open_brace', `4')m4_dnl
m4_define(`TOK_close_brace', `5')m4_dnl
m4_define(`TOK_open_bracket', `6')m4_dnl
m4_define(`TOK_close_bracket', `7')m4_dnl
m4_define(`TOK_comma_separator', `8')m4_dnl
m4_define(`TOK_semicolon', `9')m4_dnl
m4_define(`TOK_unop_complement', `10')m4_dnl
m4_define(`TOK_unop_neg', `11')m4_dnl
m4_define(`TOK_unop_not', `12')m4_dnl
m4_define(`TOK_unop_addrof', `13')m4_dnl
m4_define(`TOK_unop_incr', `14')m4_dnl
m4_define(`TOK_unop_decr', `15')m4_dnl
m4_define(`TOK_binop_add', `16')m4_dnl
m4_define(`TOK_binop_multiply', `17')m4_dnl
m4_define(`TOK_binop_divide', `18')m4_dnl
m4_define(`TOK_binop_remainder', `19')m4_dnl
m4_define(`TOK_binop_bitand', `20')m4_dnl
m4_define(`TOK_binop_bitor', `21')m4_dnl
m4_define(`TOK_binop_xor', `22')m4_dnl
m4_define(`TOK_binop_shiftleft', `23')m4_dnl
m4_define(`TOK_binop_shiftright', `24')m4_dnl
m4_define(`TOK_binop_and', `25')m4_dnl
m4_define(`TOK_binop_or', `26')m4_dnl
m4_define(`TOK_binop_eq', `27')m4_dnl
m4_define(`TOK_binop_ne', `28')m4_dnl
m4_define(`TOK_binop_lt', `29')m4_dnl
m4_define(`TOK_binop_le', `30')m4_dnl
m4_define(`TOK_binop_gt', `31')m4_dnl
m4_define(`TOK_binop_ge', `32')m4_dnl
m4_define(`TOK_assign', `33')m4_dnl
m4_define(`TOK_assign_type', `34')m4_dnl
m4_define(`TOK_assign_add', `35')m4_dnl
m4_define(`TOK_assign_subtract', `36')m4_dnl
m4_define(`TOK_assign_multiply', `37')m4_dnl
m4_define(`TOK_assign_divide', `38')m4_dnl
m4_define(`TOK_assign_remainder', `39')m4_dnl
m4_define(`TOK_assign_bitand', `40')m4_dnl
m4_define(`TOK_assign_bitor', `41')m4_dnl
m4_define(`TOK_assign_xor', `42')m4_dnl
m4_define(`TOK_assign_shiftleft', `43')m4_dnl
m4_define(`TOK_assign_shiftright', `44')m4_dnl
m4_define(`TOK_force_exec', `45')m4_dnl
m4_define(`TOK_ternary_if', `46')m4_dnl
m4_define(`TOK_compound_init', `47')m4_dnl
m4_define(`TOK_typeop_member', `48')m4_dnl
m4_define(`TOK_loop_post', `49')m4_dnl
m4_define(`TOK_match_with', `50')m4_dnl
m4_define(`TOK_key_char', `51')m4_dnl
m4_define(`TOK_key_string', `52')m4_dnl
m4_define(`TOK_key_i32', `53')m4_dnl
m4_define(`TOK_key_i64', `54')m4_dnl
m4_define(`TOK_key_i8', `55')m4_dnl
m4_define(`TOK_key_f64', `56')m4_dnl
m4_define(`TOK_key_u32', `57')m4_dnl
m4_define(`TOK_key_u64', `58')m4_dnl
m4_define(`TOK_key_u8', `59')m4_dnl
m4_define(`TOK_key_any', `60')m4_dnl
m4_define(`TOK_key_none', `61')m4_dnl
m4_define(`TOK_key_fn', `62')m4_dnl
m4_define(`TOK_key_struc', `63')m4_dnl
m4_define(`TOK_key_union', `64')m4_dnl
m4_define(`TOK_key_type', `65')m4_dnl
m4_define(`TOK_key_sizeof', `66')m4_dnl
m4_define(`TOK_key_return', `67')m4_dnl
m4_define(`TOK_key_cast', `68')m4_dnl
m4_define(`TOK_key_if', `69')m4_dnl
m4_define(`TOK_key_elif', `70')m4_dnl
m4_define(`TOK_key_else', `71')m4_dnl
m4_define(`TOK_key_then', `72')m4_dnl
m4_define(`TOK_key_jump', `73')m4_dnl
m4_define(`TOK_key_label', `74')m4_dnl
m4_define(`TOK_key_loop', `75')m4_dnl
m4_define(`TOK_key_while', `76')m4_dnl
m4_define(`TOK_key_match', `77')m4_dnl
m4_define(`TOK_key_otherwise', `78')m4_dnl
m4_define(`TOK_key_break', `79')m4_dnl
m4_define(`TOK_key_continue', `80')m4_dnl
m4_define(`TOK_key_pub', `81')m4_dnl
m4_define(`TOK_key_data', `82')m4_dnl
m4_define(`TOK_key_extrn', `83')m4_dnl
m4_define(`TOK_key_true', `84')m4_dnl
m4_define(`TOK_key_false', `85')m4_dnl
m4_define(`TOK_identifier', `86')m4_dnl
m4_define(`TOK_string_literal', `87')m4_dnl
m4_define(`TOK_char_const', `88')m4_dnl
m4_define(`TOK_int_const', `89')m4_dnl
m4_define(`TOK_long_const', `90')m4_dnl
m4_define(`TOK_uint_const', `91')m4_dnl
m4_define(`TOK_ulong_const', `92')m4_dnl
m4_define(`TOK_dbl_const', `93')m4_dnl
m4_define(`TOK_m4_prefix', `94')m4_dnl
m4_define(`TOK_import_file', `95')m4_dnl
m4_define(`TOK_import_force', `96')m4_dnl
m4_define(`TOK_use_file', `97')m4_dnl
m4_define(`TOK_use_force', `98')m4_dnl
m4_define(`TOK_error', `99')m4_dnl


type struc Token;
type struc CProgram;
type struc ErrorsContext;
type struc IdentifierContext;
pub fn parse_tokens(tokens: **struc Token, errors: *struc ErrorsContext, identifiers: *struc IdentifierContext, c_ast: **struc CProgram) i32;
type struc CProgram;
type struc ErrorsContext;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32;
type struc CProgram;
type struc TacProgram;
type struc FrontEndContext;
type struc IdentifierContext;
pub fn represent_three_address_code(c_ast: **struc CProgram, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) *struc TacProgram;







type struc MainContext(errors: *struc ErrorsContext, is_verbose: i32, debug_code: u8, optim_1_mask: u8, optim_2_code: u8, filename: string, includedirs: *string, stdlibdirs: *string)

m4_define(`Ctx', `TODO')m4_dnl

fn verbose(ctx: *struc MainContext, msg: string) none {
    if ctx[].is_verbose {
        printf("%s", msg)
    }
}

fn set_filename_ext(ctx: *struc MainContext, ext: string) none {
    loop i: u64 = sdslen(ctx[].filename) while i-- > 0 {
        if ctx[].filename[i] == '.' {
            loop .. while 0 {
                "@MACRO@:str_substr(ctx->filename, 0, i)"
                sdsrange(ctx[].filename, 0, i)
            }
            loop .. while 0 {
                "@MACRO@:str_append(ctx->filename, ext)"
                ctx[].filename = sdscat(ctx[].filename, ext)
            }
            return none
        }
    }
    panic_sigabrt("abort")
}

fn compile(ctx: *struc MainContext, errors: *struc ErrorsContext, fileio: *struc FileIoContext) i32 {
    identifiers: struc IdentifierContext;
    frontend: struc FrontEndContext;
    backend: struc BackEndContext;
    tokens: *struc Token = vec_new()
    c_ast: *struc CProgram = uptr_new()
    tac_ast: *struc TacProgram = uptr_new()

    asm_ast: *struc AsmProgram = uptr_new()
    {
        if ctx[].debug_code > 0 and ctx[].debug_code <= 127 {
            ctx[].is_verbose = true
            errors[].is_stdout = true
        }
        identifiers.label_count = 0u
        identifiers.var_count = 0u
        identifiers.struct_count = 0u
        identifiers.hash_table = map_new()
        frontend.string_const_table = map_new()
        frontend.struct_typedef_table = map_new()
        frontend.symbol_table = map_new()
        frontend.addressed_set = set_new()
        backend.symbol_table = map_new()
    }

    _errval: i32 = 0
    verbose(ctx, "-- Lexing ... ")
    loop .. while 0 {
        "@MACRO@:TRY(lex_c_code(ctx->filename, &ctx->includedirs, &ctx->stdlibdirs, errors, fileio, &identifiers, &tokens))"
        _errval = lex_c_code(ctx[].filename, @ctx[].includedirs, @ctx[].stdlibdirs, errors, fileio, @identifiers, @tokens)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 255 {
        jump _Lfinally
    }
    verbose(ctx, "-- Parsing ... ")
    loop .. while 0 {
        "@MACRO@:TRY(parse_tokens(&tokens, errors, &identifiers, &c_ast))"
        _errval = parse_tokens(@tokens, errors, @identifiers, @c_ast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 254 {
        jump _Lfinally
    }
    verbose(ctx, "-- Semantic analysis ... ")
    loop .. while 0 {
        "@MACRO@:TRY(analyze_semantic(c_ast, errors, &frontend, &identifiers))"
        _errval = analyze_semantic(c_ast, errors, @frontend, @identifiers)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 253 {
        jump _Lfinally
    }
    verbose(ctx, "-- TAC representation ... ")
    tac_ast = represent_three_address_code(@c_ast, @frontend, @identifiers)
    if ctx[].optim_1_mask > 0 {
        verbose(ctx, "OK\n-- Level 1 optimization ... ")
        optimize_three_address_code(tac_ast, @frontend, ctx[].optim_1_mask)
    }
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 252 {
        jump _Lfinally
    }
    verbose(ctx, "-- Assembly generation ... ")
    asm_ast = generate_assembly(@tac_ast, @frontend, @identifiers)
    convert_symbol_table(asm_ast, @backend, @frontend)
    if ctx[].optim_2_code > 0 {
        verbose(ctx, "OK\n-- Level 2 optimization ... ")
        allocate_registers(asm_ast, @backend, @frontend, ctx[].optim_2_code)
    }
    fix_stack(asm_ast, @backend)
    verbose(ctx, "OK\n")
    if ctx[].debug_code == 251 {
        jump _Lfinally
    }
    verbose(ctx, "-- Code emission ... ")
    set_filename_ext(ctx, "s")
    loop .. while 0 {
        "@MACRO@:TRY(open_fwrite(fileio, ctx->filename))"
        _errval = open_fwrite(fileio, ctx[].filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    emit_gas_code(@asm_ast, @backend, fileio, @identifiers)
    close_fwrite(fileio)
    verbose(ctx, "OK\n")
    label _Lfinally
    loop i: u64 = 0 while i < (? (identifiers.hash_table) then (cast<*struc stbds_array_header>(((identifiers.hash_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (identifiers.hash_table[i]).value {
            "@MACRO@:str_delete(pair_second(identifiers.hash_table[i]))"
            sdsfree((identifiers.hash_table[i]).value)
            (identifiers.hash_table[i]).value = ? nil then sdsnew(nil) else nil
        }
    }
    if identifiers.hash_table {
        "@MACRO@:map_delete(identifiers.hash_table)"
        loop .. while 0 {
            cast<none>((? (identifiers.hash_table) ~= nil then stbds_hmfree_func((identifiers.hash_table) - 1, sizeof((identifiers.hash_table)[])) else cast<none>(0)))
            (identifiers.hash_table) = nil
        }
        identifiers.hash_table = map_new()
    }
    if frontend.string_const_table {
        "@MACRO@:map_delete(frontend.string_const_table)"
        loop .. while 0 {
            cast<none>((? (frontend.string_const_table) ~= nil then stbds_hmfree_func((frontend.string_const_table) - 1, sizeof((frontend.string_const_table)[])) else cast<none>(0)))
            (frontend.string_const_table) = nil
        }
        frontend.string_const_table = map_new()
    }
    loop i: u64 = 0 while i < (? (frontend.struct_typedef_table) then (cast<*struc stbds_array_header>(((frontend.struct_typedef_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructTypedef(@(frontend.struct_typedef_table[i]).value)
    }
    if frontend.struct_typedef_table {
        "@MACRO@:map_delete(frontend.struct_typedef_table)"
        loop .. while 0 {
            cast<none>((? (frontend.struct_typedef_table) ~= nil then stbds_hmfree_func((frontend.struct_typedef_table) - 1, sizeof((frontend.struct_typedef_table)[])) else cast<none>(0)))
            (frontend.struct_typedef_table) = nil
        }
        frontend.struct_typedef_table = map_new()
    }
    loop i: u64 = 0 while i < (? (frontend.symbol_table) then (cast<*struc stbds_array_header>(((frontend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_Symbol(@(frontend.symbol_table[i]).value)
    }
    if frontend.symbol_table {
        "@MACRO@:map_delete(frontend.symbol_table)"
        loop .. while 0 {
            cast<none>((? (frontend.symbol_table) ~= nil then stbds_hmfree_func((frontend.symbol_table) - 1, sizeof((frontend.symbol_table)[])) else cast<none>(0)))
            (frontend.symbol_table) = nil
        }
        frontend.symbol_table = map_new()
    }
    loop .. while 0 {
        "@MACRO@:set_delete(frontend.addressed_set)"
        if frontend.addressed_set {
            "@MACRO@:map_delete(frontend.addressed_set)"
            loop .. while 0 {
                cast<none>((? (frontend.addressed_set) ~= nil then stbds_hmfree_func((frontend.addressed_set) - 1, sizeof((frontend.addressed_set)[])) else cast<none>(0)))
                (frontend.addressed_set) = nil
            }
            frontend.addressed_set = map_new()
        }
    }
    loop i: u64 = 0 while i < (? (backend.symbol_table) then (cast<*struc stbds_array_header>(((backend.symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_BackendSymbol(@(backend.symbol_table[i]).value)
    }
    if backend.symbol_table {
        "@MACRO@:map_delete(backend.symbol_table)"
        loop .. while 0 {
            cast<none>((? (backend.symbol_table) ~= nil then stbds_hmfree_func((backend.symbol_table) - 1, sizeof((backend.symbol_table)[])) else cast<none>(0)))
            (backend.symbol_table) = nil
        }
        backend.symbol_table = map_new()
    }
    if tokens {
        "@MACRO@:vec_delete(tokens)"
        loop .. while 0 {
            cast<none>((? (tokens) then free((cast<*struc stbds_array_header>((tokens)) - 1)) else cast<none>(0)))
            (tokens) = nil
        }
        tokens = vec_new()
    }
    free_CProgram(@c_ast)
    free_TacProgram(@tac_ast)
    free_AsmProgram(@asm_ast)
    return _errval
}

fn arg_parse_uint8(arg: string, value: *u8) i32 {
    end_ptr: string = nil
    value[] = cast<u8>(strtol(arg, @end_ptr, 10))
    return end_ptr == arg
}

fn arg_parse(ctx: *struc MainContext, argc: i32, argv: *string) i32 {
    _errval: i32 = 0
    i: u64 = 0
    if argc == 2 and strcmp(argv[1], "--help") == 0 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_print_help), "MSG_print_help", "", "", argv[0]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_debug_arg), "MSG_no_debug_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].debug_code) {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_debug_arg), "MSG_invalid_debug_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_1_arg), "MSG_no_optim_1_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_1_mask) or ctx[].optim_1_mask > 15 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_1_arg), "MSG_invalid_optim_1_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_2_arg), "MSG_no_optim_2_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_2_code) or ctx[].optim_2_code > 2 {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_2_arg), "MSG_invalid_optim_2_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_input_files_arg), "MSG_no_input_files_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].filename = ? argv[i] then sdsnew(argv[i]) else nil
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_stdlib_dir_arg), "MSG_no_stdlib_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:vec_push_back(ctx->stdlibdirs, (char*)argv[i])"
        loop .. while 0 {
            (? (not (ctx[].stdlibdirs) or (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].capacity) then (((ctx[].stdlibdirs) = stbds_arrgrowf((ctx[].stdlibdirs), sizeof((ctx[].stdlibdirs)[]), (1), (0))) and 0) else 0)
            (ctx[].stdlibdirs)[(cast<*struc stbds_array_header>((ctx[].stdlibdirs)) - 1)[].length++] = (cast<string>(argv[i]))
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            "@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_include_dir_arg), "MSG_no_include_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while argv[++i] {
        loop .. while 0 {
            "@MACRO@:vec_push_back(ctx->includedirs, (char*)argv[i])"
            loop .. while 0 {
                (? (not (ctx[].includedirs) or (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].capacity) then (((ctx[].includedirs) = stbds_arrgrowf((ctx[].includedirs), sizeof((ctx[].includedirs)[]), (1), (0))) and 0) else 0)
                (ctx[].includedirs)[(cast<*struc stbds_array_header>((ctx[].includedirs)) - 1)[].length++] = (cast<string>(argv[i]))
            }
        }
    }
    label _Lfinally
    return _errval
}

pub fn main(argc: i32, argv: *string) i32 {
    errors: struc ErrorsContext;
    fileio: struc FileIoContext;

    ctx: struc MainContext;
    {
        errors.errors = @errors
        errors.fileio = @fileio
        errors.is_stdout = false
        errors.info_at_map = map_new()
        errors.fopen_lines = vec_new()
        errors.token_infos = vec_new()
        fileio.errors = @errors
        fileio.fd_write = nil
        fileio.write_buf = ? nil then sdsnew(nil) else nil
        fileio.filename = ? nil then sdsnew(nil) else nil
        fileio.file_reads = vec_new()
        ctx.errors = @errors
        ctx.is_verbose = false
        ctx.filename = ? nil then sdsnew(nil) else nil
        ctx.includedirs = vec_new()
        ctx.stdlibdirs = vec_new()
    }

    _errval: i32 = 0
    loop .. while 0 {
        "@MACRO@:TRY(arg_parse(&ctx, argc, argv))"
        _errval = arg_parse(@ctx, argc, argv)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        "@MACRO@:TRY(compile(&ctx, &errors, &fileio))"
        _errval = compile(@ctx, @errors, @fileio)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if errors.info_at_map {
        "@MACRO@:map_delete(errors.info_at_map)"
        loop .. while 0 {
            cast<none>((? (errors.info_at_map) ~= nil then stbds_hmfree_func((errors.info_at_map) - 1, sizeof((errors.info_at_map)[])) else cast<none>(0)))
            (errors.info_at_map) = nil
        }
        errors.info_at_map = map_new()
    }
    loop i: u64 = 0 while i < (? (errors.fopen_lines) then (cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)[].length else 0) .. ++i {
        if errors.fopen_lines[i].filename {
            "@MACRO@:str_delete(errors.fopen_lines[i].filename)"
            sdsfree(errors.fopen_lines[i].filename)
            errors.fopen_lines[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if errors.fopen_lines {
        "@MACRO@:vec_delete(errors.fopen_lines)"
        loop .. while 0 {
            cast<none>((? (errors.fopen_lines) then free((cast<*struc stbds_array_header>((errors.fopen_lines)) - 1)) else cast<none>(0)))
            (errors.fopen_lines) = nil
        }
        errors.fopen_lines = vec_new()
    }
    if errors.token_infos {
        "@MACRO@:vec_delete(errors.token_infos)"
        loop .. while 0 {
            cast<none>((? (errors.token_infos) then free((cast<*struc stbds_array_header>((errors.token_infos)) - 1)) else cast<none>(0)))
            (errors.token_infos) = nil
        }
        errors.token_infos = vec_new()
    }
    if fileio.write_buf {
        "@MACRO@:str_delete(fileio.write_buf)"
        sdsfree(fileio.write_buf)
        fileio.write_buf = ? nil then sdsnew(nil) else nil
    }
    if fileio.filename {
        "@MACRO@:str_delete(fileio.filename)"
        sdsfree(fileio.filename)
        fileio.filename = ? nil then sdsnew(nil) else nil
    }
    loop i: u64 = 0 while i < (? (fileio.file_reads) then (cast<*struc stbds_array_header>((fileio.file_reads)) - 1)[].length else 0) .. ++i {
        if fileio.file_reads[i].filename {
            "@MACRO@:str_delete(fileio.file_reads[i].filename)"
            sdsfree(fileio.file_reads[i].filename)
            fileio.file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    if fileio.file_reads {
        "@MACRO@:vec_delete(fileio.file_reads)"
        loop .. while 0 {
            cast<none>((? (fileio.file_reads) then free((cast<*struc stbds_array_header>((fileio.file_reads)) - 1)) else cast<none>(0)))
            (fileio.file_reads) = nil
        }
        fileio.file_reads = vec_new()
    }
    if ctx.filename {
        "@MACRO@:str_delete(ctx.filename)"
        sdsfree(ctx.filename)
        ctx.filename = ? nil then sdsnew(nil) else nil
    }
    if ctx.includedirs {
        "@MACRO@:vec_delete(ctx.includedirs)"
        loop .. while 0 {
            cast<none>((? (ctx.includedirs) then free((cast<*struc stbds_array_header>((ctx.includedirs)) - 1)) else cast<none>(0)))
            (ctx.includedirs) = nil
        }
        ctx.includedirs = vec_new()
    }
    if ctx.stdlibdirs {
        "@MACRO@:vec_delete(ctx.stdlibdirs)"
        loop .. while 0 {
            cast<none>((? (ctx.stdlibdirs) then free((cast<*struc stbds_array_header>((ctx.stdlibdirs)) - 1)) else cast<none>(0)))
            (ctx.stdlibdirs) = nil
        }
        ctx.stdlibdirs = vec_new()
    }
    return _errval
}
