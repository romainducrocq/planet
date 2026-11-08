m4_include(`regs.plx.m4')m4_dnl
m4_include(`symt_cvt.plx.m4')m4_dnl

m4_include(`../lib/def_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

type struc SymtCvtContext(backend: *struc BackEndContext, frontend: *struc FrontEndContext, symbol: u64)

m4_define(`Ctx', `*struc SymtCvtContext')m4_dnl

fn get_scalar_alignment(type_t: *struc Type) TInt {
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
            THROW_ABORT
        }
    }
}

fn get_arr_alignment(ctx: *struc FrontEndContext, arr_type: *struc Array, size: *TLong) TInt {
    size[] = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size[] *= arr_type[].size
    }
    alignment: TInt = gen_type_alignment(ctx, arr_type[].elem_type)
    if arr_type[].elem_type[].tag == AST_Structure_t {
        struct_type: *struc Structure = @arr_type[].elem_type[].get._Structure
        size[] *= map_get(ctx[].struct_typedef_table, struct_type[].tag_name)[].size
    }
    else {
        size[] *= alignment
    }
    if size[] >= 16l {
        alignment = 16
    }
    return alignment
}

fn get_struct_alignment(ctx: *struc FrontEndContext, struct_type: *struc Structure) TInt {
    return map_get(ctx[].struct_typedef_table, struct_type[].tag_name)[].alignment
}

pub fn gen_type_alignment(ctx: *struc FrontEndContext, type_t: *struc Type) TInt {
    match type_t[].tag {
        -> AST_Array_t {
            size: TLong;
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

fn arr_asm_type(ctx: *struc FrontEndContext, arr_type: *struc Array) shared_ptr_t(AssemblyType) {
    size: TLong;
    alignment: TInt = get_arr_alignment(ctx, arr_type, @size)
    return make_ByteArray(size, alignment)
}

fn struct_asm_type(ctx: *struc FrontEndContext, struct_type: *struc Structure) shared_ptr_t(AssemblyType) {
    size: TLong;
    alignment: TInt;
    map_it: i64 = map_find(ctx[].struct_typedef_table, struct_type[].tag_name)
    if map_it ~= map_end() {
        struct_typedef: *struc StructTypedef = pair_second(ctx[].struct_typedef_table[map_it])
        size = struct_typedef[].size
        alignment = struct_typedef[].alignment
    }
    else {
        size = -1l
        alignment = -1
    }
    return make_ByteArray(size, alignment)
}

pub fn cvt_backend_asm_type(ctx: *struc FrontEndContext, name: u64) shared_ptr_t(AssemblyType) {
    symbol_type: *struc Type = map_get(ctx[].symbol_table, name)[].type_t
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
            THROW_ABORT
        }
    }
}

fn cvt_backend_symbol(ctx: Ctx, node: unique_ptr_t(BackendSymbol)) none {
    map_move_add(ctx[].backend[].symbol_table, ctx[].symbol, node)
}

fn dbl_static_const(ctx: Ctx) none {
    asm_type: shared_ptr_t(AssemblyType) = make_BackendDouble()
    cvt_backend_symbol(ctx, make_BackendObj(true, true, @asm_type))
}

fn string_static_const(ctx: Ctx, arr_type: *struc Array) none {
    asm_type: shared_ptr_t(AssemblyType) = arr_asm_type(ctx[].frontend, arr_type)
    cvt_backend_symbol(ctx, make_BackendObj(true, true, @asm_type))
}

fn cvt_static_const_toplvl(ctx: Ctx, node: *struc AsmStaticConstant) none {
    ctx[].symbol = node[].name
    match node[].static_init[].tag {
        -> AST_DoubleInit_t {
            dbl_static_const(ctx)
        }
        break
        -> AST_StringInit_t {
            string_static_const(ctx, @map_get(ctx[].frontend[].symbol_table, node[].name)[].type_t[].get._Array)
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
}

fn cvt_toplvl(ctx: Ctx, node: *struc AsmTopLevel) none {
    if node[].tag == AST_AsmStaticConstant_t {
        cvt_static_const_toplvl(ctx, @node[].get._AsmStaticConstant)
    }
    else {
        THROW_ABORT
    }
}

fn cvt_fun_type(ctx: Ctx, node: *struc FunAttr, fun_type: *struc FunType) none {
    if fun_type[].param_reg_mask == NULL_REGISTER_MASK {
        THROW_ABORT_IF(node[].is_def)
        fun_type[].param_reg_mask = REGISTER_MASK_FALSE
    }
    if fun_type[].ret_reg_mask == NULL_REGISTER_MASK {
        fun_type[].ret_reg_mask = REGISTER_MASK_FALSE
    }
    is_def: bool = node[].is_def
    cvt_backend_symbol(ctx, make_BackendFun(is_def))
}

fn cvt_obj_type(ctx: Ctx, node: *struc IdentifierAttr) none {
    if node[].tag ~= AST_ConstantAttr_t {
        asm_type: shared_ptr_t(AssemblyType) = cvt_backend_asm_type(ctx[].frontend, ctx[].symbol)
        is_static: bool = node[].tag == AST_StaticAttr_t
        cvt_backend_symbol(ctx, make_BackendObj(is_static, false, @asm_type))
    }
}

fn cvt_program(ctx: Ctx, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < map_size(ctx[].frontend[].symbol_table) .. ++i {
        symbol: *pair_t(``TIdentifier'', ``UPtrSymbol'') = @ctx[].frontend[].symbol_table[i]
        ctx[].symbol = pair_first(symbol[])
        if pair_second(symbol[])[].type_t[].tag == AST_FunType_t {
            cvt_fun_type(ctx, @pair_second(symbol[])[].attrs[].get._FunAttr, @pair_second(symbol[])[].type_t[].get._FunType)
        }
        else {
            cvt_obj_type(ctx, pair_second(symbol[])[].attrs)
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
