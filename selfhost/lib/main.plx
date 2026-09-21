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

type struc MainContext(errors: *struc ErrorsContext, is_verbose: i32, debug_code: u8, optim_1_mask: u8, optim_2_code: u8, filename: string, includedirs: vector_t(string), stdlibdirs: vector_t(string))

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
                " #@MACRO@:str_substr(ctx->filename, 0, i)"
                sdsrange(ctx[].filename, 0, i)
            }
            loop .. while 0 {
                " #@MACRO@:str_append(ctx->filename, ext)"
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
    tokens: vector_t(struc Token) = vec_new()
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
        " #@MACRO@:TRY(lex_c_code(ctx->filename, &ctx->includedirs, &ctx->stdlibdirs, errors, fileio, &identifiers, &tokens))"
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
        " #@MACRO@:TRY(parse_tokens(&tokens, errors, &identifiers, &c_ast))"
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
        " #@MACRO@:TRY(analyze_semantic(c_ast, errors, &frontend, &identifiers))"
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
        " #@MACRO@:TRY(open_fwrite(fileio, ctx->filename))"
        _errval = open_fwrite(fileio, ctx[].filename)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    emit_gas_code(@asm_ast, @backend, fileio, @identifiers)
    close_fwrite(fileio)
    verbose(ctx, "OK\n")
    label _Lfinally
    loop i: u64 = 0 while i < map_size(identifiers.hash_table) .. ++i {
        if (identifiers.hash_table[i]).value {
            " #@MACRO@:str_delete(pair_second(identifiers.hash_table[i]))"
            sdsfree((identifiers.hash_table[i]).value)
            (identifiers.hash_table[i]).value = ? nil then sdsnew(nil) else nil
        }
    }
    map_delete(identifiers.hash_table)
    map_delete(frontend.string_const_table)
    loop i: u64 = 0 while i < map_size(frontend.struct_typedef_table) .. ++i {
        free_StructTypedef(@(frontend.struct_typedef_table[i]).value)
    }
    map_delete(frontend.struct_typedef_table)
    loop i: u64 = 0 while i < map_size(frontend.symbol_table) .. ++i {
        free_Symbol(@(frontend.symbol_table[i]).value)
    }
    map_delete(frontend.symbol_table)
    set_delete(frontend.addressed_set)
    loop i: u64 = 0 while i < map_size(backend.symbol_table) .. ++i {
        free_BackendSymbol(@(backend.symbol_table[i]).value)
    }
    map_delete(backend.symbol_table)
    vec_delete(tokens)
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
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_print_help), "MSG_print_help", "", "", argv[0]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_debug_arg), "MSG_no_debug_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].debug_code) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_debug_arg), "MSG_invalid_debug_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_1_arg), "MSG_no_optim_1_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_1_mask) or ctx[].optim_1_mask > 15 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_1_arg), "MSG_invalid_optim_1_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_optim_2_arg), "MSG_no_optim_2_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif arg_parse_uint8(argv[i], @ctx[].optim_2_code) or ctx[].optim_2_code > 2 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_invalid_optim_2_arg), "MSG_invalid_optim_2_arg", "", "", argv[i]) > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not argv[++i] {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_input_files_arg), "MSG_no_input_files_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ctx[].filename = ? argv[i] then sdsnew(argv[i]) else nil
    if not argv[++i] {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_stdlib_dir_arg), "MSG_no_stdlib_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    vec_push_back(ctx[].stdlibdirs, cast<string>(argv[i]))
    if not argv[++i] {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_init_error(ctx->errors))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_arg_msg(MSG_no_include_dir_arg), "MSG_no_include_dir_arg", "", "", "") > 0 then cast<none>(raise_init_error(ctx[].errors)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    vec_push_back(ctx[].includedirs, cast<string>(argv[i]))
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
        " #@MACRO@:TRY(arg_parse(&ctx, argc, argv))"
        _errval = arg_parse(@ctx, argc, argv)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(compile(&ctx, &errors, &fileio))"
        _errval = compile(@ctx, @errors, @fileio)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    map_delete(errors.info_at_map)
    loop i: u64 = 0 while i < vec_size(errors.fopen_lines) .. ++i {
        if errors.fopen_lines[i].filename {
            " #@MACRO@:str_delete(errors.fopen_lines[i].filename)"
            sdsfree(errors.fopen_lines[i].filename)
            errors.fopen_lines[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    vec_delete(errors.fopen_lines)
    vec_delete(errors.token_infos)
    if fileio.write_buf {
        " #@MACRO@:str_delete(fileio.write_buf)"
        sdsfree(fileio.write_buf)
        fileio.write_buf = ? nil then sdsnew(nil) else nil
    }
    if fileio.filename {
        " #@MACRO@:str_delete(fileio.filename)"
        sdsfree(fileio.filename)
        fileio.filename = ? nil then sdsnew(nil) else nil
    }
    loop i: u64 = 0 while i < vec_size(fileio.file_reads) .. ++i {
        if fileio.file_reads[i].filename {
            " #@MACRO@:str_delete(fileio.file_reads[i].filename)"
            sdsfree(fileio.file_reads[i].filename)
            fileio.file_reads[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    vec_delete(fileio.file_reads)
    if ctx.filename {
        " #@MACRO@:str_delete(ctx.filename)"
        sdsfree(ctx.filename)
        ctx.filename = ? nil then sdsnew(nil) else nil
    }
    vec_delete(ctx.includedirs)
    vec_delete(ctx.stdlibdirs)
    return _errval
}
