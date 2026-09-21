m4_include(`regs.plx.m4')m4_dnl
m4_include(`symt_cvt.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

type struc SymtCvtContext(backend: *struc BackEndContext, frontend: *struc FrontEndContext, symbol: u64)

m4_define(`Ctx', `TODO')m4_dnl

fn get_scalar_alignment(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return 1
                }
            }
        }
        -> AST_Int_t {
            -> AST_UInt_t {
                return 4
            }
        }
        -> AST_Long_t {
            -> AST_Double_t {
                -> AST_ULong_t {
                    -> AST_Pointer_t {
                        return 8
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_arr_alignment(ctx: *struc FrontEndContext, arr_type: *struc Array, size: *i64) i32 {
    size[] = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size[] *= arr_type[].size
    }
    alignment: i32 = gen_type_alignment(ctx, arr_type[].elem_type)
    if arr_type[].elem_type[].tag == AST_Structure_t {
        struct_type: *struc Structure = @arr_type[].elem_type[].get._Structure
        size[] *= ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    }
    else {
        size[] *= alignment
    }
    if size[] >= 16l {
        alignment = 16
    }
    return alignment
}

fn get_struct_alignment(ctx: *struc FrontEndContext, struct_type: *struc Structure) i32 {
    return ((? ((? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].alignment
}

pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Array_t {
            size: i64;
            return get_arr_alignment(ctx, @type_t[].get._Array, @size)
        }
        -> AST_Structure_t {
            return get_struct_alignment(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_alignment(type_t)
        }
    }
}

fn arr_asm_type(ctx: *struc FrontEndContext, arr_type: *struc Array) *struc AssemblyType {
    size: i64;
    alignment: i32 = get_arr_alignment(ctx, arr_type, @size)
    return make_ByteArray(size, alignment)
}

fn struct_asm_type(ctx: *struc FrontEndContext, struct_type: *struc Structure) *struc AssemblyType {
    size: i64;
    alignment: i32;
    map_it: i64 = (? ((ctx[].struct_typedef_table) = stbds_hmget_key((ctx[].struct_typedef_table), sizeof((ctx[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_typedef_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        struct_typedef: *struc StructTypedef = (ctx[].struct_typedef_table[map_it]).value
        size = struct_typedef[].size
        alignment = struct_typedef[].alignment
    }
    else {
        size = -1l
        alignment = -1
    }
    return make_ByteArray(size, alignment)
}

pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) *struc AssemblyType {
    symbol_type: *struc Type = ((? ((? ((ctx[].symbol_table) = stbds_hmget_key((ctx[].symbol_table), sizeof((ctx[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    match symbol_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return make_Byte()
                }
            }
        }
        -> AST_Int_t {
            -> AST_UInt_t {
                return make_LongWord()
            }
        }
        -> AST_Long_t {
            -> AST_ULong_t {
                -> AST_Pointer_t {
                    return make_QuadWord()
                }
            }
        }
        -> AST_Double_t {
            return make_BackendDouble()
        }
        -> AST_Array_t {
            return arr_asm_type(ctx, @symbol_type[].get._Array)
        }
        -> AST_Structure_t {
            return struct_asm_type(ctx, @symbol_type[].get._Structure)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn cvt_backend_symbol(ctx: *struc SymtCvtContext, node: *struc BackendSymbol) none {
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->backend->symbol_table, ctx->symbol, node)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->backend->symbol_table, ctx->symbol, node)"
            loop .. while 0 {
                (ctx[].backend[].symbol_table) = stbds_hmput_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((ctx[].symbol))), sizeof((ctx[].backend[].symbol_table)[].key), 0)
                (ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp].key = (ctx[].symbol)
                (ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp].value = (node)
            }
        }
        node = nil
    }
}

fn dbl_static_const(ctx: *struc SymtCvtContext) none {
    asm_type: *struc AssemblyType = make_BackendDouble()
    cvt_backend_symbol(ctx, make_BackendObj(true, true, @asm_type))
}

fn string_static_const(ctx: *struc SymtCvtContext, arr_type: *struc Array) none {
    asm_type: *struc AssemblyType = arr_asm_type(ctx[].frontend, arr_type)
    cvt_backend_symbol(ctx, make_BackendObj(true, true, @asm_type))
}

fn cvt_static_const_toplvl(ctx: *struc SymtCvtContext, node: *struc AsmStaticConstant) none {
    ctx[].symbol = node[].name
    match node[].static_init[].tag {
        -> AST_DoubleInit_t {
            dbl_static_const(ctx)
        }
        break
        -> AST_StringInit_t {
            string_static_const(ctx, @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._Array)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn cvt_toplvl(ctx: *struc SymtCvtContext, node: *struc AsmTopLevel) none {
    if node[].tag == AST_AsmStaticConstant_t {
        cvt_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cvt_fun_type(ctx: *struc SymtCvtContext, node: *struc FunAttr, fun_type: *struc FunType) none {
    if fun_type[].param_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].param_reg_mask = 0ul
    }
    if fun_type[].ret_reg_mask == (cast<u8>(1u)) << REGISTER_MASK_SIZE {
        fun_type[].ret_reg_mask = 0ul
    }
    is_def: i32 = node[].is_def
    cvt_backend_symbol(ctx, make_BackendFun(is_def))
}

fn cvt_obj_type(ctx: *struc SymtCvtContext, node: *struc IdentifierAttr) none {
    if node[].tag ~= AST_ConstantAttr_t {
        asm_type: *struc AssemblyType = cvt_backend_asm_type(ctx[].frontend, ctx[].symbol)
        is_static: i32 = node[].tag == AST_StaticAttr_t
        cvt_backend_symbol(ctx, make_BackendObj(is_static, false, @asm_type))
    }
}

fn cvt_program(ctx: *struc SymtCvtContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < (? (ctx[].frontend[].symbol_table) then (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].length - 1 else 0) .. ++i {
        symbol: *pair_t(``TIdentifier'', ``UPtrSymbol'') = @ctx[].frontend[].symbol_table[i]
        ctx[].symbol = (symbol[]).key
        if (symbol[]).value[].type_t[].tag == AST_FunType_t {
            cvt_fun_type(ctx, @(symbol[]).value[].attrs[].get._FunAttr, @(symbol[]).value[].type_t[].get._FunType)
        }
        else {
            cvt_obj_type(ctx, (symbol[]).value[].attrs)
        }
    }
    loop i: u64 = 0 while i < vec_size(node[].static_const_toplvls) .. ++i {
        cvt_toplvl(ctx, node[].static_const_toplvls[i])
    }
}

pub fn convert_symbol_table(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext) none {
    ctx: struc SymtCvtContext;
    {
        ctx.backend = backend
        ctx.frontend = frontend
    }

    cvt_program(@ctx, node)
}
