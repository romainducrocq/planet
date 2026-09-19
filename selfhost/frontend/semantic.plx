m4_include(`errors.plx.m4')m4_dnl
m4_include(`idents.plx.m4')m4_dnl
m4_include(`semantic.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

m4_define(`StStructure', `struc Structure')m4_dnl

type struc PairTIdentifierStStructure(key: u64, value: struc Structure)

type struc SemanticContext(errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext, extern_scope_map: *struc PairTIdentifierulong_t, goto_map: *struc PairTIdentifierTIdentifier, scoped_identifier_maps: vector_t(hashmap_t(``TIdentifier'', ``TIdentifier'')), scoped_struct_maps: vector_t(hashmap_t(``TIdentifier'', ``StStructure'')), label_set: *struc ElementTIdentifier, break_loop_labels: vector_t(TIdentifier), continue_loop_labels: vector_t(TIdentifier), fun_def_name: u64, p_switch_statement: *struc CSwitch, fun_def_set: *struc ElementTIdentifier, struct_def_set: *struc ElementTIdentifier, union_def_set: *struc ElementTIdentifier, p_static_inits: *vector_t(shared_ptr_t(StaticInit)))

m4_define(`Ctx', `TODO')m4_dnl
fn is_same_type(type_1: *struc Type, type_2: *struc Type) i32;

fn is_same_ptr(ptr_type_1: *struc Pointer, ptr_type_2: *struc Pointer) i32 {
    return is_same_type(ptr_type_1[].ref_type, ptr_type_2[].ref_type)
}

fn is_same_arr(arr_type_1: *struc Array, arr_type_2: *struc Array) i32 {
    return arr_type_1[].size == arr_type_2[].size and is_same_type(arr_type_1[].elem_type, arr_type_2[].elem_type)
}

fn is_same_struct(struct_type_1: *struc Structure, struct_type_2: *struc Structure) i32 {
    return struct_type_1[].tag_name == struct_type_2[].tag_name
}

fn is_same_type(type_1: *struc Type, type_2: *struc Type) i32 {
    if type_1[].tag == type_2[].tag {
        match type_1[].tag {
            -> AST_Pointer_t {
                return is_same_ptr(@type_1[].get._Pointer, @type_2[].get._Pointer)
            }
            -> AST_Array_t {
                return is_same_arr(@type_1[].get._Array, @type_2[].get._Array)
            }
            -> AST_Structure_t {
                return is_same_struct(@type_1[].get._Structure, @type_2[].get._Structure)
            }
            -> AST_FunType_t {
                panic_sigabrt("abort")
            }
            otherwise {
                return true
            }
        }
    }
    return false
}

fn is_same_fun_type(fun_type_1: *struc FunType, fun_type_2: *struc FunType) i32 {
    if vec_size(fun_type_1[].param_types) ~= vec_size(fun_type_2[].param_types) or not is_same_type(fun_type_1[].ret_type, fun_type_2[].ret_type) {
        return false
    }
    loop i: u64 = 0 while i < vec_size(fun_type_1[].param_types) .. ++i {
        if not is_same_type(fun_type_1[].param_types[i], fun_type_2[].param_types[i]) {
            return false
        }
    }
    return true
}

fn is_type_signed(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            return true
                        }
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_type_char(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_type_int(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_UChar_t {
                            -> AST_UInt_t {
                                -> AST_ULong_t {
                                    return true
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_type_arithmetic(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            -> AST_UChar_t {
                                -> AST_UInt_t {
                                    -> AST_ULong_t {
                                        return true
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_type_scalar(type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        -> AST_Double_t {
                            -> AST_UChar_t {
                                -> AST_UInt_t {
                                    -> AST_ULong_t {
                                        -> AST_Pointer_t {
                                            return true
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_struct_complete(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    return (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp) ~= -1
}

fn is_type_complete(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Void_t {
            return false
        }
        -> AST_Structure_t {
            return is_struct_complete(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return true
        }
    }
}

fn is_valid_type(ctx: *struc SemanticContext, type_t: *struc Type) i32;

fn is_valid_ptr(ctx: *struc SemanticContext, ptr_type: *struc Pointer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, ptr_type->ref_type))"
        _errval = is_valid_type(ctx, ptr_type[].ref_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn is_valid_arr(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_complete(ctx, arr_type[].elem_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->errors->info_at_buf))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_arr), "MSG_incomplete_arr", "", get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, arr_type[].elem_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, arr_type->elem_type))"
        _errval = is_valid_type(ctx, arr_type[].elem_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn is_valid_type(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    _errval: i32 = 0
    match type_t[].tag {
        -> AST_Pointer_t {
            loop .. while 0 {
                " #@MACRO@:TRY(is_valid_ptr(ctx, &type_t->get._Pointer))"
                _errval = is_valid_ptr(ctx, @type_t[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Array_t {
            loop .. while 0 {
                " #@MACRO@:TRY(is_valid_arr(ctx, &type_t->get._Array))"
                _errval = is_valid_arr(ctx, @type_t[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_FunType_t {
            panic_sigabrt("abort")
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn is_exp_lvalue(node: *struc CExp) i32;

fn is_dot_exp_lvalue(node: *struc CDot) i32 {
    return is_exp_lvalue(node[].structure)
}

fn is_exp_lvalue(node: *struc CExp) i32 {
    match node[].tag {
        -> AST_CString_t {
            -> AST_CVar_t {
                -> AST_CDereference_t {
                    -> AST_CSubscript_t {
                        -> AST_CArrow_t {
                            return true
                        }
                    }
                }
            }
        }
        -> AST_CDot_t {
            return is_dot_exp_lvalue(@node[].get._CDot)
        }
        otherwise {
            return false
        }
    }
}

fn is_const_null_ptr(node: *struc CConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstInt_t {
            return node[].constant[].get._CConstInt.value == 0
        }
        -> AST_CConstLong_t {
            return node[].constant[].get._CConstLong.value == 0l
        }
        -> AST_CConstUInt_t {
            return node[].constant[].get._CConstUInt.value == 0u
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            return false
        }
    }
}

fn get_scalar_size(type_t: *struc Type) i32 {
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

fn get_type_scale(ctx: *struc SemanticContext, type_t: *struc Type) i64;

fn get_arr_scale(ctx: *struc SemanticContext, arr_type: *struc Array) i64 {
    size: i64 = arr_type[].size
    loop while arr_type[].elem_type[].tag == AST_Array_t {
        arr_type = @arr_type[].elem_type[].get._Array
        size *= arr_type[].size
    }
    return get_type_scale(ctx, arr_type[].elem_type) * size
}

fn get_struct_scale(ctx: *struc SemanticContext, struct_type: *struc Structure) i64 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
}

fn get_type_scale(ctx: *struc SemanticContext, type_t: *struc Type) i64 {
    match type_t[].tag {
        -> AST_Array_t {
            return get_arr_scale(ctx, @type_t[].get._Array)
        }
        -> AST_Structure_t {
            return get_struct_scale(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type_t)
        }
    }
}

fn get_type_alignment(ctx: *struc SemanticContext, type_t: *struc Type) i32;

fn get_arr_alignment(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    return get_type_alignment(ctx, arr_type[].elem_type)
}

fn get_struct_alignment(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    return ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].alignment
}

fn get_type_alignment(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    match type_t[].tag {
        -> AST_Array_t {
            return get_arr_alignment(ctx, @type_t[].get._Array)
        }
        -> AST_Structure_t {
            return get_struct_alignment(ctx, @type_t[].get._Structure)
        }
        otherwise {
            return get_scalar_size(type_t)
        }
    }
}

fn get_joint_type(node_1: *struc CExp, node_2: *struc CExp) *struc Type {
    joint_type: *struc Type = sptr_new()
    if is_type_char(node_1[].exp_type) {
        exp_type: *struc Type = sptr_new()
        loop .. while 0 {
            " #@MACRO@:sptr_move(Type, node_1->exp_type, exp_type)"
            if node_1[].exp_type ~= exp_type {
                " #@MACRO@:uptr_move(Type, node_1->exp_type, exp_type)"
                free_Type(@exp_type)
                exp_type = node_1[].exp_type
                node_1[].exp_type = uptr_new()
            }
        }
        node_1[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        loop .. while 0 {
            " #@MACRO@:sptr_move(Type, exp_type, node_1->exp_type)"
            if exp_type ~= node_1[].exp_type {
                " #@MACRO@:uptr_move(Type, exp_type, node_1->exp_type)"
                free_Type(@node_1[].exp_type)
                node_1[].exp_type = exp_type
                exp_type = uptr_new()
            }
        }
    }
    elif is_type_char(node_2[].exp_type) {
        exp_type: *struc Type = sptr_new()
        loop .. while 0 {
            " #@MACRO@:sptr_move(Type, node_2->exp_type, exp_type)"
            if node_2[].exp_type ~= exp_type {
                " #@MACRO@:uptr_move(Type, node_2->exp_type, exp_type)"
                free_Type(@exp_type)
                exp_type = node_2[].exp_type
                node_2[].exp_type = uptr_new()
            }
        }
        node_2[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        loop .. while 0 {
            " #@MACRO@:sptr_move(Type, exp_type, node_2->exp_type)"
            if exp_type ~= node_2[].exp_type {
                " #@MACRO@:uptr_move(Type, exp_type, node_2->exp_type)"
                free_Type(@node_2[].exp_type)
                node_2[].exp_type = exp_type
                exp_type = uptr_new()
            }
        }
    }
    elif is_same_type(node_1[].exp_type, node_2[].exp_type) {
        if node_1[].exp_type ~= joint_type {
            " #@MACRO@:sptr_copy(Type, node_1->exp_type, joint_type)"
            free_Type(@joint_type)
            joint_type = node_1[].exp_type
            (joint_type)[]._ref_count++
        }
    }
    elif node_1[].exp_type[].tag == AST_Double_t or node_2[].exp_type[].tag == AST_Double_t {
        joint_type = make_Double()
    }
    else {
        type_size_1: i32 = get_scalar_size(node_1[].exp_type)
        type_size_2: i32 = get_scalar_size(node_2[].exp_type)
        if type_size_1 == type_size_2 {
            if is_type_signed(node_1[].exp_type) {
                if node_2[].exp_type ~= joint_type {
                    " #@MACRO@:sptr_copy(Type, node_2->exp_type, joint_type)"
                    free_Type(@joint_type)
                    joint_type = node_2[].exp_type
                    (joint_type)[]._ref_count++
                }
            }
            else {
                if node_1[].exp_type ~= joint_type {
                    " #@MACRO@:sptr_copy(Type, node_1->exp_type, joint_type)"
                    free_Type(@joint_type)
                    joint_type = node_1[].exp_type
                    (joint_type)[]._ref_count++
                }
            }
        }
        elif type_size_1 > type_size_2 {
            if node_1[].exp_type ~= joint_type {
                " #@MACRO@:sptr_copy(Type, node_1->exp_type, joint_type)"
                free_Type(@joint_type)
                joint_type = node_1[].exp_type
                (joint_type)[]._ref_count++
            }
        }
        else {
            if node_2[].exp_type ~= joint_type {
                " #@MACRO@:sptr_copy(Type, node_2->exp_type, joint_type)"
                free_Type(@joint_type)
                joint_type = node_2[].exp_type
                (joint_type)[]._ref_count++
            }
        }
    }
    return joint_type
}

fn get_joint_ptr_type(ctx: *struc SemanticContext, node_1: *struc CExp, node_2: *struc CExp, joint_type: **struc Type) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if is_same_type(node_1[].exp_type, node_2[].exp_type) {
        if node_1[].exp_type ~= joint_type[] {
            " #@MACRO@:sptr_copy(Type, node_1->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_1[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    elif node_1[].tag == AST_CConstant_t and is_const_null_ptr(@node_1[].get._CConstant) {
        if node_2[].exp_type ~= joint_type[] {
            " #@MACRO@:sptr_copy(Type, node_2->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_2[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    elif (node_2[].tag == AST_CConstant_t and is_const_null_ptr(@node_2[].get._CConstant)) or (node_1[].exp_type[].tag == AST_Pointer_t and node_1[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and node_2[].exp_type[].tag == AST_Pointer_t) {
        if node_1[].exp_type ~= joint_type[] {
            " #@MACRO@:sptr_copy(Type, node_1->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_1[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    elif node_2[].exp_type[].tag == AST_Pointer_t and node_2[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and node_1[].exp_type[].tag == AST_Pointer_t {
        if node_2[].exp_type ~= joint_type[] {
            " #@MACRO@:sptr_copy(Type, node_2->exp_type, *joint_type)"
            free_Type(@joint_type[])
            joint_type[] = node_2[].exp_type
            (joint_type[])[]._ref_count++
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node_1->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_joint_ptr_mismatch), "MSG_joint_ptr_mismatch", "", get_type_fmt(ctx[].identifiers, node_1[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node_2[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node_1[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn get_const_char_value(node: *struc CConstant) i8 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return node[].constant[].get._CConstChar.value
        }
        -> AST_CConstInt_t {
            return cast<i8>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<i8>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<i8>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<i8>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<i8>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<i8>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_int_value(node: *struc CConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<i32>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return node[].constant[].get._CConstInt.value
        }
        -> AST_CConstLong_t {
            return cast<i32>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<i32>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<i32>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<i32>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<i32>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_long_value(node: *struc CConstant) i64 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<i64>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<i64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return node[].constant[].get._CConstLong.value
        }
        -> AST_CConstDouble_t {
            return cast<i64>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<i64>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<i64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<i64>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_dbl_value(node: *struc CConstant) f64 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<f64>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<f64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<f64>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return node[].constant[].get._CConstDouble.value
        }
        -> AST_CConstUChar_t {
            return cast<f64>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<f64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<f64>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_uchar_value(node: *struc CConstant) u8 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<u8>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<u8>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u8>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<u8>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return node[].constant[].get._CConstUChar.value
        }
        -> AST_CConstUInt_t {
            return cast<u8>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return cast<u8>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_uint_value(node: *struc CConstant) u32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<u32>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<u32>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u32>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<u32>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<u32>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return node[].constant[].get._CConstUInt.value
        }
        -> AST_CConstULong_t {
            return cast<u32>(node[].constant[].get._CConstULong.value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_ulong_value(node: *struc CConstant) u64 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            return cast<u64>(node[].constant[].get._CConstChar.value)
        }
        -> AST_CConstInt_t {
            return cast<u64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u64>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstDouble_t {
            return cast<u64>(node[].constant[].get._CConstDouble.value)
        }
        -> AST_CConstUChar_t {
            return cast<u64>(node[].constant[].get._CConstUChar.value)
        }
        -> AST_CConstUInt_t {
            return cast<u64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_const_ptr_value(node: *struc CConstant) u64 {
    match node[].constant[].tag {
        -> AST_CConstInt_t {
            return cast<u64>(node[].constant[].get._CConstInt.value)
        }
        -> AST_CConstLong_t {
            return cast<u64>(node[].constant[].get._CConstLong.value)
        }
        -> AST_CConstUInt_t {
            return cast<u64>(node[].constant[].get._CConstUInt.value)
        }
        -> AST_CConstULong_t {
            return node[].constant[].get._CConstULong.value
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn get_compound_info_at(node: *struc CCompoundInit) u64 {
    # TODO THROW_ABORT_IF(vec_empty(node->initializers));
    initializer: *struc CInitializer = node[].initializers[0]
    loop while initializer[].tag == AST_CCompoundInit_t {
        node = @initializer[].get._CCompoundInit
        # TODO THROW_ABORT_IF(vec_empty(node->initializers));
        initializer = node[].initializers[0]
    }
    return initializer[].get._CSingleInit.exp[].info_at
}

fn reslv_struct_type(ctx: *struc SemanticContext, type_t: *struc Type) i32;

fn check_const_exp(node: *struc CConstant) none {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            node[]._base[].exp_type = make_Char()
            break
        }
        -> AST_CConstInt_t {
            node[]._base[].exp_type = make_Int()
            break
        }
        -> AST_CConstLong_t {
            node[]._base[].exp_type = make_Long()
            break
        }
        -> AST_CConstDouble_t {
            node[]._base[].exp_type = make_Double()
            break
        }
        -> AST_CConstUChar_t {
            node[]._base[].exp_type = make_UChar()
            break
        }
        -> AST_CConstUInt_t {
            node[]._base[].exp_type = make_UInt()
            break
        }
        -> AST_CConstULong_t {
            node[]._base[].exp_type = make_ULong()
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn check_string_exp(node: *struc CString) none {
    size: i64 = cast<i64>(vec_size(node[].literal[].value)) + 1l
    elem_type: *struc Type = make_Char()
    node[]._base[].exp_type = make_Array(size, @elem_type)
}

fn check_var_exp(ctx: *struc SemanticContext, node: *struc CVar) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    var_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
    if var_type[].tag == AST_FunType_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_fun_used_as_var), "MSG_fun_used_as_var", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if var_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, var_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = var_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, node->target_type))"
        _errval = reslv_struct_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].target_type[].tag ~= AST_Void_t and ((node[].exp[].exp_type[].tag == AST_Double_t and node[].target_type[].tag == AST_Pointer_t) or (node[].exp[].exp_type[].tag == AST_Pointer_t and node[].target_type[].tag == AST_Double_t) or not is_type_scalar(node[].exp[].exp_type) or not is_type_scalar(node[].target_type)) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_illegal_cast), "MSG_illegal_cast", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].target_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, node->target_type))"
        _errval = is_valid_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].target_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, node->target_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].target_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn cast_exp(ctx: *struc SemanticContext, exp_type: **struc Type, exp: **struc CExp) i32 {
    exp_type_cp: *struc Type = sptr_new()
    _errval: i32 = 0
    info_at: u64 = (exp[])[].info_at
    if exp_type[] ~= exp_type_cp {
        " #@MACRO@:sptr_copy(Type, *exp_type, exp_type_cp)"
        free_Type(@exp_type_cp)
        exp_type_cp = exp_type[]
        (exp_type_cp)[]._ref_count++
    }
    exp[] = make_CCast(exp, @exp_type_cp, info_at)
    loop .. while 0 {
        " #@MACRO@:TRY(check_cast_exp(ctx, &(*exp)->get._CCast))"
        _errval = check_cast_exp(ctx, @(exp[])[].get._CCast)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    free_Type(@exp_type_cp)
    return _errval
}

fn cast_assign(ctx: *struc SemanticContext, exp_type: **struc Type, exp: **struc CExp) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (is_type_arithmetic((exp[])[].exp_type) and is_type_arithmetic(exp_type[])) or ((exp[])[].tag == AST_CConstant_t and (exp_type[])[].tag == AST_Pointer_t and is_const_null_ptr(@(exp[])[].get._CConstant)) or ((exp_type[])[].tag == AST_Pointer_t and (exp_type[])[].get._Pointer.ref_type[].tag == AST_Void_t and (exp[])[].exp_type[].tag == AST_Pointer_t) or ((exp[])[].exp_type[].tag == AST_Pointer_t and (exp[])[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and (exp_type[])[].tag == AST_Pointer_t) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, exp_type, exp))"
            _errval = cast_exp(ctx, exp_type, exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, (*exp)->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_illegal_cast), "MSG_illegal_cast", "", get_type_fmt(ctx[].identifiers, (exp[])[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, exp_type[], @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, (exp[])[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn promote_char_to_int(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    promote_type: *struc Type = sptr_new()
    _errval: i32 = 0
    promote_type = make_Int()
    loop .. while 0 {
        " #@MACRO@:TRY(cast_exp(ctx, &promote_type, exp))"
        _errval = cast_exp(ctx, @promote_type, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    free_Type(@promote_type)
    return _errval
}

fn check_unary_complement_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].exp[].exp_type[].tag {
        -> AST_Double_t {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    loop .. while 0 {
                        " #@MACRO@:TRY(promote_char_to_int(ctx, &node->exp))"
                        _errval = promote_char_to_int(ctx, @node[].exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    if node[].exp[].exp_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, node->exp->exp_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_unary_neg_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].exp[].exp_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    loop .. while 0 {
                        " #@MACRO@:TRY(promote_char_to_int(ctx, &node->exp))"
                        _errval = promote_char_to_int(ctx, @node[].exp)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    if node[].exp[].exp_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, node->exp->exp_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_unary_not_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_scalar(node[].exp[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_unary_op), "MSG_invalid_unary_op", "", get_unop_fmt(@node[].unop), get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    _errval: i32 = 0
    match node[].unop.tag {
        -> AST_CComplement_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_unary_complement_exp(ctx, node))"
                _errval = check_unary_complement_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CNegate_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_unary_neg_exp(ctx, node))"
                _errval = check_unary_neg_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CNot_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_unary_not_exp(ctx, node))"
                _errval = check_unary_not_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_binary_add_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) and is_type_int(node[].exp_right[].exp_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_right[].exp_type, common_type) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
                _errval = cast_exp(ctx, @common_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    elif is_type_int(node[].exp_left[].exp_type) and node[].exp_right[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_left[].exp_type, common_type) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
                _errval = cast_exp(ctx, @common_type, @node[].exp_left)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_right[].exp_type ~= node[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->exp_right->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_right[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            " #@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = uptr_new()
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_subtract_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) {
        if is_type_int(node[].exp_right[].exp_type) {
            common_type = make_Long()
            if not is_same_type(node[].exp_right[].exp_type, common_type) {
                loop .. while 0 {
                    " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
                    _errval = cast_exp(ctx, @common_type, @node[].exp_right)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
                " #@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
                free_Type(@node[]._base[].exp_type)
                node[]._base[].exp_type = node[].exp_left[].exp_type
                (node[]._base[].exp_type)[]._ref_count++
            }
            jump _Lfinally
        }
        elif is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) and not (node[].exp_left[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_left[].get._CConstant)) {
            common_type = make_Long()
            loop .. while 0 {
                " #@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
                if common_type ~= node[]._base[].exp_type {
                    " #@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
                    free_Type(@node[]._base[].exp_type)
                    node[]._base[].exp_type = common_type
                    common_type = uptr_new()
                }
            }
            jump _Lfinally
        }
        else {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            " #@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = uptr_new()
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_multiply_divide_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            " #@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = uptr_new()
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_remainder_bitwise_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            " #@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = uptr_new()
        }
    }
    if node[]._base[].exp_type[].tag == AST_Double_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_op), "MSG_invalid_binary_op", "", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[]._base[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_bitshift_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_int(node[].exp_right[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif is_type_char(node[].exp_left[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(promote_char_to_int(ctx, &node->exp_left))"
            _errval = promote_char_to_int(ctx, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &node->exp_left->exp_type, &node->exp_right))"
            _errval = cast_exp(ctx, @node[].exp_left[].exp_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp_left[].exp_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    if node[]._base[].exp_type[].tag == AST_Double_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_op), "MSG_invalid_binary_op", "", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[]._base[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_bitshift_right_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(check_binary_bitshift_exp(ctx, node))"
        _errval = check_binary_bitshift_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if is_type_signed(node[].exp_left[].exp_type) {
        node[].binop = make_CBinaryOp(AST_CBitShrArithmetic_t)
    }
    label _Lfinally
    return _errval
}

fn check_binary_logical_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_binary_equality_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        loop .. while 0 {
            " #@MACRO@:TRY(get_joint_ptr_type(ctx, node->exp_left, node->exp_right, &common_type))"
            _errval = get_joint_ptr_type(ctx, node[].exp_left, node[].exp_right, @common_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    elif is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_relational_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) or (node[].exp_left[].exp_type[].tag == AST_Pointer_t and (not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) or (node[].exp_left[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_left[].get._CConstant)) or (node[].exp_right[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_right[].get._CConstant)))) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_binary_ops), "MSG_invalid_binary_ops", get_binop_fmt(@node[].binop), get_type_fmt(ctx[].identifiers, node[].exp_left[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_left))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    node[]._base[].exp_type = make_Int()
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    match node[].binop.tag {
        -> AST_CAdd_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_binary_add_exp(ctx, node))"
                _errval = check_binary_add_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSubtract_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_binary_subtract_exp(ctx, node))"
                _errval = check_binary_subtract_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CMultiply_t {
            -> AST_CDivide_t {
                loop .. while 0 {
                    " #@MACRO@:TRY(check_multiply_divide_exp(ctx, node))"
                    _errval = check_multiply_divide_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> AST_CRemainder_t {
            -> AST_CBitAnd_t {
                -> AST_CBitOr_t {
                    -> AST_CBitXor_t {
                        loop .. while 0 {
                            " #@MACRO@:TRY(check_remainder_bitwise_exp(ctx, node))"
                            _errval = check_remainder_bitwise_exp(ctx, node)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        -> AST_CBitShiftLeft_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_binary_bitshift_exp(ctx, node))"
                _errval = check_binary_bitshift_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CBitShiftRight_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_bitshift_right_exp(ctx, node))"
                _errval = check_bitshift_right_exp(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CAnd_t {
            -> AST_COr_t {
                loop .. while 0 {
                    " #@MACRO@:TRY(check_binary_logical_exp(ctx, node))"
                    _errval = check_binary_logical_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> AST_CEqual_t {
            -> AST_CNotEqual_t {
                loop .. while 0 {
                    " #@MACRO@:TRY(check_binary_equality_exp(ctx, node))"
                    _errval = check_binary_equality_exp(ctx, node)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
        }
        break
        -> AST_CLessThan_t {
            -> AST_CLessOrEqual_t {
                -> AST_CGreaterThan_t {
                    -> AST_CGreaterOrEqual_t {
                        loop .. while 0 {
                            " #@MACRO@:TRY(check_binary_relational_exp(ctx, node))"
                            _errval = check_binary_relational_exp(ctx, node)
                            if _errval ~= 0 {
                                jump _Lfinally
                            }
                        }
                    }
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) i32 {
    _errval: i32 = 0
    if node[].exp_left {
        if node[].exp_left[].exp_type[].tag == AST_Void_t {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_assign_to_void), "MSG_assign_to_void", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_exp_lvalue(node[].exp_left) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_assign_to_rvalue), "MSG_assign_to_rvalue", "", "", get_assign_fmt(nil, @node[].unop)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_same_type(node[].exp_right[].exp_type, node[].exp_left[].exp_type) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_assign(ctx, &node->exp_left->exp_type, &node->exp_right))"
                _errval = cast_assign(ctx, @node[].exp_left[].exp_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].exp_left[].exp_type ~= node[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->exp_left->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
    }
    else {
        exp_left: *struc CExp = node[].exp_right[].get._CBinary.exp_left
        if exp_left[].tag == AST_CCast_t {
            exp_left = exp_left[].get._CCast.exp
        }
        if not is_exp_lvalue(exp_left) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_assign_to_rvalue), "MSG_assign_to_rvalue", "", "", get_assign_fmt(@node[].exp_right[].get._CBinary.binop, @node[].unop)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif not is_same_type(node[].exp_right[].exp_type, exp_left[].exp_type) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_assign(ctx, &exp_left->exp_type, &node->exp_right))"
                _errval = cast_assign(ctx, @exp_left[].exp_type, @node[].exp_right)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if exp_left[].exp_type ~= node[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, exp_left->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = exp_left[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    return _errval
}

fn check_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    common_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_condition), "MSG_invalid_condition", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Void_t and node[].exp_right[].exp_type[].tag == AST_Void_t {
        if node[].exp_middle[].exp_type ~= node[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->exp_middle->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_middle[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Structure_t or node[].exp_right[].exp_type[].tag == AST_Structure_t {
        if not is_same_type(node[].exp_middle[].exp_type, node[].exp_right[].exp_type) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_ternary_op), "MSG_invalid_ternary_op", "", get_type_fmt(ctx[].identifiers, node[].exp_middle[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        if node[].exp_middle[].exp_type ~= node[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->exp_middle->exp_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = node[].exp_middle[].exp_type
            (node[]._base[].exp_type)[]._ref_count++
        }
        jump _Lfinally
    }
    if is_type_arithmetic(node[].exp_middle[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_middle, node[].exp_right)
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        loop .. while 0 {
            " #@MACRO@:TRY(get_joint_ptr_type(ctx, node->exp_middle, node->exp_right, &common_type))"
            _errval = get_joint_ptr_type(ctx, node[].exp_middle, node[].exp_right, @common_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_ternary_op), "MSG_invalid_ternary_op", "", get_type_fmt(ctx[].identifiers, node[].exp_middle[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].exp_right[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if not is_same_type(node[].exp_middle[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_middle))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_middle)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_exp(ctx, &common_type, &node->exp_right))"
            _errval = cast_exp(ctx, @common_type, @node[].exp_right)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, common_type, node->_base->exp_type)"
        if common_type ~= node[]._base[].exp_type {
            " #@MACRO@:uptr_move(Type, common_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = common_type
            common_type = uptr_new()
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@common_type)
    return _errval
}

fn check_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    fun_symbol: *struc Symbol = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)
    fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
    if fun_symbol[].type_t[].tag ~= AST_FunType_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_var_used_as_fun), "MSG_var_used_as_fun", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif vec_size(fun_type[].param_types) ~= vec_size(node[].args) {
        strto_fmt_1 = str_to_string(vec_size(node[].args))
        strto_fmt_2 = str_to_string(vec_size(fun_type[].param_types))
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_call_with_wrong_argc), "MSG_call_with_wrong_argc", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < vec_size(node[].args) .. ++i {
        if not is_same_type(node[].args[i][].exp_type, fun_type[].param_types[i]) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_assign(ctx, &fun_type->param_types[i], &node->args[i]))"
                _errval = cast_assign(ctx, @fun_type[].param_types[i], @node[].args[i])
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
    }
    if fun_type[].ret_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, fun_type->ret_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = fun_type[].ret_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        " #@MACRO@:str_delete(strto_fmt_1)"
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        " #@MACRO@:str_delete(strto_fmt_2)"
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].exp[].exp_type[].tag ~= AST_Pointer_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_deref_not_ptr), "MSG_deref_not_ptr", "", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].exp[].exp_type[].get._Pointer.ref_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, node->exp->exp_type->get._Pointer.ref_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = node[].exp[].exp_type[].get._Pointer.ref_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_addrof_exp(ctx: *struc SemanticContext, node: *struc CAddrOf) i32 {
    ref_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if not is_exp_lvalue(node[].exp) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_addrof_rvalue), "MSG_addrof_rvalue", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].exp[].exp_type ~= ref_type {
        " #@MACRO@:sptr_copy(Type, node->exp->exp_type, ref_type)"
        free_Type(@ref_type)
        ref_type = node[].exp[].exp_type
        (ref_type)[]._ref_count++
    }
    node[]._base[].exp_type = make_Pointer(@ref_type)
    label _Lfinally
    free_Type(@ref_type)
    return _errval
}

fn check_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) i32 {
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    ref_type: *struc Type = sptr_new()
    subscript_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if node[].primary_exp[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type) and is_type_int(node[].subscript_exp[].exp_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].subscript_exp[].exp_type, subscript_type) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_exp(ctx, &subscript_type, &node->subscript_exp))"
                _errval = cast_exp(ctx, @subscript_type, @node[].subscript_exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].primary_exp[].exp_type[].get._Pointer.ref_type ~= ref_type {
            " #@MACRO@:sptr_copy(Type, node->primary_exp->exp_type->get._Pointer.ref_type, ref_type)"
            free_Type(@ref_type)
            ref_type = node[].primary_exp[].exp_type[].get._Pointer.ref_type
            (ref_type)[]._ref_count++
        }
    }
    elif is_type_int(node[].primary_exp[].exp_type) and node[].subscript_exp[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].primary_exp[].exp_type, subscript_type) {
            loop .. while 0 {
                " #@MACRO@:TRY(cast_exp(ctx, &subscript_type, &node->primary_exp))"
                _errval = cast_exp(ctx, @subscript_type, @node[].primary_exp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        if node[].subscript_exp[].exp_type[].get._Pointer.ref_type ~= ref_type {
            " #@MACRO@:sptr_copy(Type, node->subscript_exp->exp_type->get._Pointer.ref_type, ref_type)"
            free_Type(@ref_type)
            ref_type = node[].subscript_exp[].exp_type[].get._Pointer.ref_type
            (ref_type)[]._ref_count++
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_subscript), "MSG_invalid_subscript", "", get_type_fmt(ctx[].identifiers, node[].primary_exp[].exp_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, node[].subscript_exp[].exp_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:sptr_move(Type, ref_type, node->_base->exp_type)"
        if ref_type ~= node[]._base[].exp_type {
            " #@MACRO@:uptr_move(Type, ref_type, node->_base->exp_type)"
            free_Type(@node[]._base[].exp_type)
            node[]._base[].exp_type = ref_type
            ref_type = uptr_new()
        }
    }
    label _Lfinally
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_Type(@ref_type)
    free_Type(@subscript_type)
    return _errval
}

fn check_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_complete(ctx, node[].exp[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_sizeof_incomplete), "MSG_sizeof_incomplete", "", "", get_type_fmt(ctx[].identifiers, node[].exp[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_ULong()
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, node->target_type))"
        _errval = reslv_struct_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if not is_type_complete(ctx, node[].target_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_sizeof_incomplete), "MSG_sizeof_incomplete", "", "", get_type_fmt(ctx[].identifiers, node[].target_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, node->target_type))"
        _errval = is_valid_type(ctx, node[].target_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    node[]._base[].exp_type = make_ULong()
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].structure[].exp_type[].tag ~= AST_Structure_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_dot_not_struct), "MSG_dot_not_struct", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].structure[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_type = @node[].structure[].exp_type[].get._Structure
    struct_typedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    map_it = (? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_member_not_in_struct), "MSG_member_not_in_struct", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_name_fmt(ctx[].identifiers, node[].member, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    member_type = (struct_typedef[].members[map_it]).value[].member_type
    if member_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, member_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = member_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ptr_type: *struc Pointer;
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].pointer[].exp_type[].tag ~= AST_Pointer_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arrow_not_struct_ptr), "MSG_arrow_not_struct_ptr", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].pointer[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    ptr_type = @node[].pointer[].exp_type[].get._Pointer
    if ptr_type[].ref_type[].tag ~= AST_Structure_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arrow_not_struct_ptr), "MSG_arrow_not_struct_ptr", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_type_fmt(ctx[].identifiers, node[].pointer[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_type = @ptr_type[].ref_type[].get._Structure
    map_it = (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arrow_incomplete), "MSG_arrow_incomplete", "", get_name_fmt(ctx[].identifiers, node[].member, @name_fmt), get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    struct_typedef = (ctx[].frontend[].struct_typedef_table[map_it]).value
    map_it = (? ((struct_typedef[].members) = stbds_hmget_key((struct_typedef[].members), sizeof((struct_typedef[].members)[]), cast<*any>(@((node[].member))), sizeof((struct_typedef[].members)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].temp)
    if map_it == -1 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_member_not_in_struct), "MSG_member_not_in_struct", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_name_fmt(ctx[].identifiers, node[].member, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    member_type = (struct_typedef[].members[map_it]).value[].member_type
    if member_type ~= node[]._base[].exp_type {
        " #@MACRO@:sptr_copy(Type, member_type, node->_base->exp_type)"
        free_Type(@node[]._base[].exp_type)
        node[]._base[].exp_type = member_type
        (node[]._base[].exp_type)[]._ref_count++
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arr_typed_exp(addrof: **struc CExp) none {
    {
        ref_type: *struc Type = sptr_new()
        if (addrof[])[].exp_type[].get._Array.elem_type ~= ref_type {
            " #@MACRO@:sptr_copy(Type, (*addrof)->exp_type->get._Array.elem_type, ref_type)"
            free_Type(@ref_type)
            ref_type = (addrof[])[].exp_type[].get._Array.elem_type
            (ref_type)[]._ref_count++
        }
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = make_Pointer(@ref_type)
    }
    info_at: u64 = (addrof[])[].info_at
    addrof[] = make_CAddrOf(addrof, info_at)
    if (addrof[])[].get._CAddrOf.exp[].exp_type ~= (addrof[])[].exp_type {
        " #@MACRO@:sptr_copy(Type, (*addrof)->get._CAddrOf.exp->exp_type, (*addrof)->exp_type)"
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = (addrof[])[].get._CAddrOf.exp[].exp_type
        ((addrof[])[].exp_type)[]._ref_count++
    }
}

fn check_struct_typed_exp(ctx: *struc SemanticContext, node: *struc CExp) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_struct_complete(ctx, @node[].exp_type[].get._Structure) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_exp_incomplete), "MSG_exp_incomplete", "", "", get_type_fmt(ctx[].identifiers, node[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    match (exp[])[].exp_type[].tag {
        -> AST_Array_t {
            check_arr_typed_exp(exp)
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_struct_typed_exp(ctx, *exp))"
                _errval = check_struct_typed_exp(ctx, exp[])
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn check_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((ctx[].fun_def_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    if fun_type[].ret_type[].tag == AST_Void_t {
        if node[].exp {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_ret_value_in_void_fun), "MSG_ret_value_in_void_fun", "", "", get_name_fmt(ctx[].identifiers, ctx[].fun_def_name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    elif not node[].exp {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_no_ret_value_in_fun), "MSG_no_ret_value_in_fun", "", get_name_fmt(ctx[].identifiers, ctx[].fun_def_name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif not is_same_type(node[].exp[].exp_type, fun_type[].ret_type) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_assign(ctx, &fun_type->ret_type, &node->exp))"
            _errval = cast_assign(ctx, @fun_type[].ret_type, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_typed_exp(ctx, &node->exp))"
        _errval = check_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_if_statement(ctx: *struc SemanticContext, node: *struc CIf) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_if), "MSG_invalid_if", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_while), "MSG_invalid_while", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_do_while), "MSG_invalid_do_while", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_for_statement(ctx: *struc SemanticContext, node: *struc CFor) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->condition->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_for), "MSG_invalid_for", "", "", get_type_fmt(ctx[].identifiers, node[].condition[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].condition[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_switch_int_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: vector_t(i32) = vec_new()
    _errval: i32 = 0
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_int_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstInt(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        " #@MACRO@:str_delete(strto_fmt)"
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    vec_delete(values)
    return _errval
}

fn check_switch_long_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: vector_t(i64) = vec_new()
    _errval: i32 = 0
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_long_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstLong(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        " #@MACRO@:str_delete(strto_fmt)"
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    vec_delete(values)
    return _errval
}

fn check_switch_uint_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: vector_t(u32) = vec_new()
    _errval: i32 = 0
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_uint_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstUInt(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        " #@MACRO@:str_delete(strto_fmt)"
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    vec_delete(values)
    return _errval
}

fn check_switch_ulong_cases(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    values: vector_t(u64) = vec_new()
    _errval: i32 = 0
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_ulong_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = ? (values[i]) > 0 then sdsfromunsignedlong(cast<u64>((values[i]))) else sdsfromlong(cast<i64>((values[i])))
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->cases[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_case_value), "MSG_duplicate_case_value", "", "", strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].cases[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstULong(values[i])
        if node[].lookup[].exp_type ~= esac[]._base[].exp_type {
            " #@MACRO@:sptr_copy(Type, node->lookup->exp_type, esac->_base->exp_type)"
            free_Type(@esac[]._base[].exp_type)
            esac[]._base[].exp_type = node[].lookup[].exp_type
            (esac[]._base[].exp_type)[]._ref_count++
        }
    }
    label _Lfinally
    if strto_fmt {
        " #@MACRO@:str_delete(strto_fmt)"
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    vec_delete(values)
    return _errval
}

fn check_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_int(node[].lookup[].exp_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->lookup->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_invalid_switch), "MSG_invalid_switch", "", "", get_type_fmt(ctx[].identifiers, node[].lookup[].exp_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].lookup[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    match node[].lookup[].exp_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    loop .. while 0 {
                        " #@MACRO@:TRY(promote_char_to_int(ctx, &node->lookup))"
                        _errval = promote_char_to_int(ctx, @node[].lookup)
                        if _errval ~= 0 {
                            jump _Lfinally
                        }
                    }
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    match node[].lookup[].exp_type[].tag {
        -> AST_Int_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_switch_int_cases(ctx, node))"
                _errval = check_switch_int_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Long_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_switch_long_cases(ctx, node))"
                _errval = check_switch_long_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_UInt_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_switch_uint_cases(ctx, node))"
                _errval = check_switch_uint_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_ULong_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_switch_ulong_cases(ctx, node))"
                _errval = check_switch_ulong_cases(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_bound_string_init(ctx: *struc SemanticContext, node: *struc CString, arr_type: *struc Array) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_type_char(arr_type[].elem_type) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_string_init_not_char_arr), "MSG_string_init_not_char_arr", "", "", get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif vec_size(node[].literal[].value) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        strto_fmt_2 = str_to_string(vec_size(node[].literal[].value))
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_string_init_overflow), "MSG_string_init_overflow", "", strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        " #@MACRO@:str_delete(strto_fmt_1)"
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        " #@MACRO@:str_delete(strto_fmt_2)"
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) i32 {
    _errval: i32 = 0
    if not is_same_type(node[].exp[].exp_type, init_type[]) {
        loop .. while 0 {
            " #@MACRO@:TRY(cast_assign(ctx, init_type, &node->exp))"
            _errval = cast_assign(ctx, init_type, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if init_type[] ~= node[]._base[].init_type {
        " #@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
    label _Lfinally
    return _errval
}

fn check_string_init(node: *struc CSingleInit, init_type: **struc Type) none {
    if init_type[] ~= node[].exp[].exp_type {
        " #@MACRO@:sptr_copy(Type, *init_type, node->exp->exp_type)"
        free_Type(@node[].exp[].exp_type)
        node[].exp[].exp_type = init_type[]
        (node[].exp[].exp_type)[]._ref_count++
    }
    if init_type[] ~= node[]._base[].init_type {
        " #@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
}
fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer;

fn check_single_zero_init(elem_type: *struc Type) *struc CInitializer {
    exp: *struc CExp = uptr_new()
    {
        constant: *struc CConst = sptr_new()
        match elem_type[].tag {
            -> AST_Char_t {
                -> AST_SChar_t {
                    constant = make_CConstChar(0)
                    break
                }
            }
            -> AST_Int_t {
                constant = make_CConstInt(0)
                break
            }
            -> AST_Long_t {
                constant = make_CConstLong(0l)
                break
            }
            -> AST_Double_t {
                constant = make_CConstDouble(0.0)
                break
            }
            -> AST_UChar_t {
                constant = make_CConstUChar(0u)
                break
            }
            -> AST_UInt_t {
                constant = make_CConstUInt(0u)
                break
            }
            -> AST_ULong_t {
                -> AST_Pointer_t {
                    constant = make_CConstULong(0ul)
                    break
                }
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
        exp = make_CConstant(@constant, 0)
    }

    return make_CSingleInit(@exp)
}

fn check_arr_zero_init(ctx: *struc SemanticContext, arr_type: *struc Array) *struc CInitializer {
    zero_inits: vector_t(unique_ptr_t(CInitializer)) = vec_new()
    arr_type_size: u64 = cast<u64>(arr_type[].size)
    vec_reserve(zero_inits, arr_type_size)
    loop i: u64 = 0 while i < arr_type_size .. ++i {
        initializer: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        vec_move_back(zero_inits, initializer)
    }
    return make_CCompoundInit(@zero_inits)
}

fn check_struct_zero_init(ctx: *struc SemanticContext, struct_type: *struc Structure) *struc CInitializer {
    zero_inits: vector_t(unique_ptr_t(CInitializer)) = vec_new()
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    vec_reserve(zero_inits, vec_size(struct_typedef[].member_names))
    loop i: u64 = 0 while i < vec_size(struct_typedef[].member_names) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        initializer: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        vec_move_back(zero_inits, initializer)
    }
    return make_CCompoundInit(@zero_inits)
}

fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer {
    match init_type[].tag {
        -> AST_Array_t {
            return check_arr_zero_init(ctx, @init_type[].get._Array)
        }
        -> AST_Structure_t {
            return check_struct_zero_init(ctx, @init_type[].get._Structure)
        }
        otherwise {
            return check_single_zero_init(init_type)
        }
    }
}

fn check_bound_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if vec_size(node[].initializers) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = ? (arr_type[].size) > 0 then sdsfromunsignedlong(cast<u64>((arr_type[].size))) else sdsfromlong(cast<i64>((arr_type[].size)))
        strto_fmt_2 = str_to_string(vec_size(node[].initializers))
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_arr_init_overflow), "MSG_arr_init_overflow", strto_fmt_1, get_arr_fmt(ctx[].identifiers, arr_type, @type_fmt), strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        " #@MACRO@:str_delete(strto_fmt_1)"
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        " #@MACRO@:str_delete(strto_fmt_2)"
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_bound_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt_1: string = ? nil then sdsnew(nil) else nil
    strto_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    bound: u64 = ? struct_type[].is_union then 1 else (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0)
    if vec_size(node[].initializers) > bound {
        strto_fmt_1 = str_to_string(vec_size(node[].initializers))
        strto_fmt_2 = ? (bound) > 0 then sdsfromunsignedlong(cast<u64>((bound))) else sdsfromlong(cast<i64>((bound)))
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_struct_init_overflow), "MSG_struct_init_overflow", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), strto_fmt_1, strto_fmt_2) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_1 {
        " #@MACRO@:str_delete(strto_fmt_1)"
        sdsfree(strto_fmt_1)
        strto_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt_2 {
        " #@MACRO@:str_delete(strto_fmt_2)"
        sdsfree(strto_fmt_2)
        strto_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) none {
    loop while vec_size(node[].initializers) < cast<u64>(arr_type[].size) {
        zero_init: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        vec_move_back(node[].initializers, zero_init)
    }
    if init_type[] ~= node[]._base[].init_type {
        " #@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
}

fn check_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) none {
    struct_typedef: *struc StructTypedef = ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)
    loop i: u64 = vec_size(node[].initializers) while i < (? (struct_typedef[].members) then (cast<*struc stbds_array_header>(((struct_typedef[].members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        zero_init: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        vec_move_back(node[].initializers, zero_init)
    }
    if init_type[] ~= node[]._base[].init_type {
        " #@MACRO@:sptr_copy(Type, *init_type, node->_base->init_type)"
        free_Type(@node[]._base[].init_type)
        node[]._base[].init_type = init_type[]
        (node[]._base[].init_type)[]._ref_count++
    }
}

fn check_ret_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, fun_type->ret_type))"
        _errval = reslv_struct_type(ctx, fun_type[].ret_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, fun_type->ret_type))"
        _errval = is_valid_type(ctx, fun_type[].ret_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match fun_type[].ret_type[].tag {
        -> AST_Array_t {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_ret_arr), "MSG_ret_arr", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        -> AST_Structure_t {
            if node[].body and not is_struct_complete(ctx, @fun_type[].ret_type[].get._Structure) {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_ret_incomplete), "MSG_ret_incomplete", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, fun_type[].ret_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            break
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_arr_param_decl(fun_type: *struc FunType, i: u64) none {
    ref_type: *struc Type = sptr_new()
    if fun_type[].param_types[i][].get._Array.elem_type ~= ref_type {
        " #@MACRO@:sptr_copy(Type, fun_type->param_types[i]->get._Array.elem_type, ref_type)"
        free_Type(@ref_type)
        ref_type = fun_type[].param_types[i][].get._Array.elem_type
        (ref_type)[]._ref_count++
    }
    free_Type(@fun_type[].param_types[i])
    fun_type[].param_types[i] = make_Pointer(@ref_type)
}

fn check_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt_1: string = ? nil then sdsnew(nil) else nil
    name_fmt_2: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    param_attrs: *struc IdentifierAttr = uptr_new()
    symbol: *struc Symbol = uptr_new()
    param_type: *struc Type = sptr_new()
    _errval: i32 = 0
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    loop i: u64 = 0 while i < vec_size(node[].params) .. ++i {
        ctx[].errors[].info_at_buf = node[].info_at
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_struct_type(ctx, fun_type->param_types[i]))"
            _errval = reslv_struct_type(ctx, fun_type[].param_types[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if fun_type[].param_types[i][].tag == AST_Void_t {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_void_param), "MSG_void_param", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].params[i], @name_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            " #@MACRO@:TRY(is_valid_type(ctx, fun_type->param_types[i]))"
            _errval = is_valid_type(ctx, fun_type[].param_types[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if fun_type[].param_types[i][].tag == AST_Array_t {
            check_arr_param_decl(fun_type, i)
        }
        if node[].body {
            if fun_type[].param_types[i][].tag == AST_Structure_t and not is_struct_complete(ctx, @fun_type[].param_types[i][].get._Structure) {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_param), "MSG_incomplete_param", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].params[i], @name_fmt_2), get_type_fmt(ctx[].identifiers, fun_type[].param_types[i], @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            if fun_type[].param_types[i] ~= param_type {
                " #@MACRO@:sptr_copy(Type, fun_type->param_types[i], param_type)"
                free_Type(@param_type)
                param_type = fun_type[].param_types[i]
                (param_type)[]._ref_count++
            }
            param_attrs = make_LocalAttr()
            symbol = make_Symbol(@param_type, @param_attrs)
            loop .. while 0 {
                " #@MACRO@:map_move_add(ctx->frontend->symbol_table, node->params[i], symbol)"
                loop .. while 0 {
                    " #@MACRO@:map_add(ctx->frontend->symbol_table, node->params[i], symbol)"
                    loop .. while 0 {
                        (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].params[i]))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                        (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].params[i])
                        (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
                    }
                }
                symbol = nil
            }
        }
    }
    label _Lfinally
    if name_fmt_1 {
        " #@MACRO@:str_delete(name_fmt_1)"
        sdsfree(name_fmt_1)
        name_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if name_fmt_2 {
        " #@MACRO@:str_delete(name_fmt_2)"
        sdsfree(name_fmt_2)
        name_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@param_attrs)
    free_Symbol(@symbol)
    free_Type(@param_type)
    return _errval
}

fn check_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    glob_fun_attrs: *struc IdentifierAttr = uptr_new()
    symbol: *struc Symbol = uptr_new()
    glob_fun_type: *struc Type = sptr_new()
    _errval: i32 = 0
    is_def: i32 = (? ((ctx[].fun_def_set) = stbds_hmget_key((ctx[].fun_def_set), sizeof((ctx[].fun_def_set)[]), cast<*any>(@((node[].name))), sizeof((ctx[].fun_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp) ~= -1
    is_glob: i32 = node[].storage_class.tag ~= AST_CStatic_t
    map_it: i64 = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        fun_symbol: *struc Symbol = (ctx[].frontend[].symbol_table[map_it]).value
        fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
        if not (fun_symbol[].type_t[].tag == AST_FunType_t and vec_size(fun_type[].param_types) == vec_size(node[].params) and is_same_fun_type(@node[].fun_type[].get._FunType, fun_type)) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_fun_conflict), "MSG_redecl_fun_conflict", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].fun_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, fun_symbol[].type_t, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif is_def and node[].body {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redef_fun), "MSG_redef_fun", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].fun_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        fun_attrs: *struc FunAttr = @fun_symbol[].attrs[].get._FunAttr
        if not is_glob and fun_attrs[].is_glob {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_static_conflict), "MSG_redecl_static_conflict", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        is_glob = fun_attrs[].is_glob
        free_Symbol(@fun_symbol)
    }
    if node[].body {
        loop .. while 0 {
            " #@MACRO@:set_insert(ctx->fun_def_set, node->name)"
            loop .. while 0 {
                " #@MACRO@:map_add(ctx->fun_def_set, node->name, 0)"
                loop .. while 0 {
                    (ctx[].fun_def_set) = stbds_hmput_key((ctx[].fun_def_set), sizeof((ctx[].fun_def_set)[]), cast<*any>(@((node[].name))), sizeof((ctx[].fun_def_set)[].key), 0)
                    (ctx[].fun_def_set)[(cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp].key = (node[].name)
                    (ctx[].fun_def_set)[(cast<*struc stbds_array_header>(((ctx[].fun_def_set) - 1)) - 1)[].temp].value = (0)
                }
            }
        }
        is_def = true
        ctx[].fun_def_name = node[].name
    }
    if node[].fun_type ~= glob_fun_type {
        " #@MACRO@:sptr_copy(Type, node->fun_type, glob_fun_type)"
        free_Type(@glob_fun_type)
        glob_fun_type = node[].fun_type
        (glob_fun_type)[]._ref_count++
    }
    glob_fun_attrs = make_FunAttr(is_def, is_glob)
    symbol = make_Symbol(@glob_fun_type, @glob_fun_attrs)
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->frontend->symbol_table, node->name, symbol)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->frontend->symbol_table, node->name, symbol)"
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@glob_fun_attrs)
    free_Symbol(@symbol)
    free_Type(@glob_fun_type)
    return _errval
}

fn push_static_init(ctx: *struc SemanticContext, static_init: *struc StaticInit) none {
    vec_move_back(ctx[].p_static_inits[], static_init)
}

fn push_zero_static_init(ctx: *struc SemanticContext, byte: i64) none {
    if not vec_empty(ctx[].p_static_inits[]) and vec_back(ctx[].p_static_inits[])[].tag == AST_ZeroInit_t {
        vec_back(ctx[].p_static_inits[])[].get._ZeroInit.byte += byte
    }
    else {
        push_static_init(ctx, make_ZeroInit(byte))
    }
}

fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) i32;

fn check_static_no_init(ctx: *struc SemanticContext, static_init_type: *struc Type, size: i64) none {
    byte: i64 = ? static_init_type == nil then size else get_type_scale(ctx, static_init_type) * size
    push_zero_static_init(ctx, byte)
}

fn check_no_initializer(ctx: *struc SemanticContext, static_init_type: *struc Type) *struc InitialValue {
    static_inits: vector_t(shared_ptr_t(StaticInit)) = vec_new()
    {
        ctx[].p_static_inits = @static_inits
        check_static_no_init(ctx, static_init_type, 1l)
        ctx[].p_static_inits = nil
    }

    return make_Initial(@static_inits)
}

fn make_binary_identifier(ctx: *struc SemanticContext, binary: u64) u64 {
    strto_binary: string = ? (binary) > 0 then sdsfromunsignedlong(cast<u64>((binary))) else sdsfromlong(cast<i64>((binary)))
    return make_string_identifier(ctx[].identifiers, @strto_binary)
}

fn check_static_const_init(ctx: *struc SemanticContext, node: *struc CConstant, static_init_type: *struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    strto_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match static_init_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = get_const_char_value(node)
                if value == 0 {
                    push_zero_static_init(ctx, 1l)
                }
                else {
                    push_static_init(ctx, make_CharInit(value))
                }
                break
            }
        }
        -> AST_Int_t {
            value: i32 = get_const_int_value(node)
            if value == 0 {
                push_zero_static_init(ctx, 4l)
            }
            else {
                push_static_init(ctx, make_IntInit(value))
            }
            break
        }
        -> AST_Long_t {
            value: i64 = get_const_long_value(node)
            if value == 0l {
                push_zero_static_init(ctx, 8l)
            }
            else {
                push_static_init(ctx, make_LongInit(value))
            }
            break
        }
        -> AST_Double_t {
            value: f64 = get_const_dbl_value(node)
            binary: u64 = dbl_to_binary(value)
            if binary == 0ul {
                push_zero_static_init(ctx, 8l)
            }
            else {
                dbl_const: u64 = make_binary_identifier(ctx, binary)
                push_static_init(ctx, make_DoubleInit(dbl_const))
            }
            break
        }
        -> AST_UChar_t {
            value: u8 = get_const_uchar_value(node)
            if value == 0u {
                push_zero_static_init(ctx, 1l)
            }
            else {
                push_static_init(ctx, make_UCharInit(value))
            }
            break
        }
        -> AST_UInt_t {
            value: u32 = get_const_uint_value(node)
            if value == 0u {
                push_zero_static_init(ctx, 4l)
            }
            else {
                push_static_init(ctx, make_UIntInit(value))
            }
            break
        }
        -> AST_ULong_t {
            value: u64 = get_const_ulong_value(node)
            if value == 0ul {
                push_zero_static_init(ctx, 8l)
            }
            else {
                push_static_init(ctx, make_ULongInit(value))
            }
            break
        }
        -> AST_Pointer_t {
            match node[].constant[].tag {
                -> AST_CConstChar_t {
                    -> AST_CConstDouble_t {
                        -> AST_CConstUChar_t {
                            loop .. while 0 {
                                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_ptr_init_not_int), "MSG_static_ptr_init_not_int", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt), get_const_fmt(node[].constant)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                                _errval = 1
                                jump _Lfinally
                            }
                        }
                    }
                }
                otherwise {
                    break
                }
            }
            value: u64 = get_const_ptr_value(node)
            if value ~= 0ul {
                strto_fmt = ? (value) > 0 then sdsfromunsignedlong(cast<u64>((value))) else sdsfromlong(cast<i64>((value)))
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_ptr_init_not_null), "MSG_static_ptr_init_not_null", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt), strto_fmt) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            push_zero_static_init(ctx, 8l)
            break
        }
        otherwise {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_agg_init_with_single), "MSG_agg_init_with_single", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    if strto_fmt {
        " #@MACRO@:str_delete(strto_fmt)"
        sdsfree(strto_fmt)
        strto_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_literal_string_init(ctx: *struc SemanticContext, node: *struc CString, static_ptr_type: *struc Pointer) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if static_ptr_type[].ref_type[].tag ~= AST_Char_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_ptr_init_string), "MSG_static_ptr_init_string", "", "", get_ptr_fmt(ctx[].identifiers, static_ptr_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn make_literal_identifier(ctx: *struc SemanticContext, node: *struc CStringLiteral) u64 {
    value: string = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}

fn check_static_ptr_string_init(ctx: *struc SemanticContext, node: *struc CString) none {
    string_const_label: u64;
    {
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        map_it: i64 = (? ((ctx[].frontend[].string_const_table) = stbds_hmget_key((ctx[].frontend[].string_const_table), sizeof((ctx[].frontend[].string_const_table)[]), cast<*any>(@((string_const))), sizeof((ctx[].frontend[].string_const_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            string_const_label = (ctx[].frontend[].string_const_table[map_it]).value
        }
        else {
            string_const_label = repr_label_identifier(ctx[].identifiers, LBL_Lstring)
            loop .. while 0 {
                " #@MACRO@:map_add(ctx->frontend->string_const_table, string_const, string_const_label)"
                loop .. while 0 {
                    (ctx[].frontend[].string_const_table) = stbds_hmput_key((ctx[].frontend[].string_const_table), sizeof((ctx[].frontend[].string_const_table)[]), cast<*any>(@((string_const))), sizeof((ctx[].frontend[].string_const_table)[].key), 0)
                    (ctx[].frontend[].string_const_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp].key = (string_const)
                    (ctx[].frontend[].string_const_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].string_const_table) - 1)) - 1)[].temp].value = (string_const_label)
                }
            }

            constant_type: *struc Type = sptr_new()
            {
                size: i64 = cast<i64>(vec_size(node[].literal[].value)) + 1l
                elem_type: *struc Type = make_Char()
                constant_type = make_Array(size, @elem_type)
            }

            constant_attrs: *struc IdentifierAttr = uptr_new()
            {
                static_init: *struc StaticInit = sptr_new()
                {
                    literal: *struc CStringLiteral = sptr_new()
                    if node[].literal ~= literal {
                        " #@MACRO@:sptr_copy(CStringLiteral, node->literal, literal)"
                        free_CStringLiteral(@literal)
                        literal = node[].literal
                        (literal)[]._ref_count++
                    }
                    static_init = make_StringInit(string_const, true, @literal)
                }

                constant_attrs = make_ConstantAttr(@static_init)
            }
            symbol: *struc Symbol = make_Symbol(@constant_type, @constant_attrs)
            loop .. while 0 {
                " #@MACRO@:map_move_add(ctx->frontend->symbol_table, string_const_label, symbol)"
                loop .. while 0 {
                    " #@MACRO@:map_add(ctx->frontend->symbol_table, string_const_label, symbol)"
                    loop .. while 0 {
                        (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((string_const_label))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                        (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (string_const_label)
                        (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
                    }
                }
                symbol = nil
            }
        }
    }
    push_static_init(ctx, make_PointerInit(string_const_label))
}

fn check_static_arr_string_init(ctx: *struc SemanticContext, node: *struc CString, static_arr_type: *struc Array) i32 {
    literal: *struc CStringLiteral = sptr_new()
    _errval: i32 = 0
    byte: i64;
    loop .. while 0 {
        " #@MACRO@:TRY(check_bound_string_init(ctx, node, static_arr_type))"
        _errval = check_bound_string_init(ctx, node, static_arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    byte = static_arr_type[].size - cast<i64>(vec_size(node[].literal[].value)) - 1l
    {
        is_null_term: i32 = byte >= 0l
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        if node[].literal ~= literal {
            " #@MACRO@:sptr_copy(CStringLiteral, node->literal, literal)"
            free_CStringLiteral(@literal)
            literal = node[].literal
            (literal)[]._ref_count++
        }
        push_static_init(ctx, make_StringInit(string_const, is_null_term, @literal))
    }
    if byte > 0l {
        push_zero_static_init(ctx, byte)
    }
    label _Lfinally
    free_CStringLiteral(@literal)
    return _errval
}

fn check_static_string_init(ctx: *struc SemanticContext, node: *struc CString, static_init_type: *struc Type) i32 {
    _errval: i32 = 0
    match static_init_type[].tag {
        -> AST_Pointer_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_literal_string_init(ctx, node, &static_init_type->get._Pointer))"
                _errval = check_literal_string_init(ctx, node, @static_init_type[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        check_static_ptr_string_init(ctx, node)
        break
        -> AST_Array_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_arr_string_init(ctx, node, &static_init_type->get._Array))"
                _errval = check_static_arr_string_init(ctx, node, @static_init_type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_single_static_init(ctx: *struc SemanticContext, node: *struc CSingleInit, static_init_type: *struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match node[].exp[].tag {
        -> AST_CConstant_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_const_init(ctx, &node->exp->get._CConstant, static_init_type))"
                _errval = check_static_const_init(ctx, @node[].exp[].get._CConstant, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CString_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_string_init(ctx, &node->exp->get._CString, static_init_type))"
                _errval = check_static_string_init(ctx, @node[].exp[].get._CString, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->exp->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_static_init_not_const), "MSG_static_init_not_const", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].exp[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_static_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(check_bound_arr_init(ctx, node, arr_type))"
        _errval = check_bound_arr_init(ctx, node, arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        loop .. while 0 {
            " #@MACRO@:TRY(check_static_init(ctx, node->initializers[i], arr_type->elem_type))"
            _errval = check_static_init(ctx, node[].initializers[i], arr_type[].elem_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if cast<u64>(arr_type[].size) > vec_size(node[].initializers) {
        check_static_no_init(ctx, arr_type[].elem_type, arr_type[].size - vec_size(node[].initializers))
    }
    label _Lfinally
    return _errval
}

fn check_static_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) i32 {
    _errval: i32 = 0
    size: i64;
    loop .. while 0 {
        " #@MACRO@:TRY(check_bound_struct_init(ctx, node, struct_type))"
        _errval = check_bound_struct_init(ctx, node, struct_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    size = 0l
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        if member[].offset ~= size {
            check_static_no_init(ctx, nil, member[].offset - size)
            size = member[].offset
        }
        loop .. while 0 {
            " #@MACRO@:TRY(check_static_init(ctx, node->initializers[i], member->member_type))"
            _errval = check_static_init(ctx, node[].initializers[i], member[].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        size += get_type_scale(ctx, member[].member_type)
    }
    size -= ((? ((? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp])[].value)[].size
    if size ~= 0l {
        check_static_no_init(ctx, nil, -1l * size)
    }
    label _Lfinally
    return _errval
}

fn check_static_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, static_init_type: *struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match static_init_type[].tag {
        -> AST_Array_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_arr_init(ctx, node, &static_init_type->get._Array))"
                _errval = check_static_arr_init(ctx, node, @static_init_type[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_struct_init(ctx, node, &static_init_type->get._Structure))"
                _errval = check_static_struct_init(ctx, node, @static_init_type[].get._Structure)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_scalar_init_with_compound), "MSG_scalar_init_with_compound", "", "", get_type_fmt(ctx[].identifiers, static_init_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CSingleInit_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_single_static_init(ctx, &node->get._CSingleInit, static_init_type))"
                _errval = check_single_static_init(ctx, @node[].get._CSingleInit, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCompoundInit_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_compound_init(ctx, &node->get._CCompoundInit, static_init_type))"
                _errval = check_static_compound_init(ctx, @node[].get._CCompoundInit, static_init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn check_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type, init_value: **struc InitialValue) i32 {
    static_inits: vector_t(shared_ptr_t(StaticInit)) = vec_new()
    _errval: i32 = 0
    {
        ctx[].p_static_inits = @static_inits
        loop .. while 0 {
            " #@MACRO@:TRY(check_static_init(ctx, node, static_init_type))"
            _errval = check_static_init(ctx, node, static_init_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].p_static_inits = nil
    }
    init_value[] = make_Initial(@static_inits)
    label _Lfinally
    loop i: u64 = 0 while i < vec_size(static_inits) .. ++i {
        free_StaticInit(@static_inits[i])
    }
    vec_delete(static_inits)
    return _errval
}

fn check_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    glob_var_attrs: *struc IdentifierAttr = uptr_new()
    symbol: *struc Symbol = uptr_new()
    init_value: *struc InitialValue = sptr_new()
    glob_var_type: *struc Type = sptr_new()
    _errval: i32 = 0
    is_glob: i32;
    map_it: i64;
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, node->var_type))"
        _errval = reslv_struct_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].var_type[].tag == AST_Void_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_void_var_decl), "MSG_void_var_decl", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, node->var_type))"
        _errval = is_valid_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    is_glob = node[].storage_class.tag ~= AST_CStatic_t
    if node[].init {
        if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_var_decl), "MSG_incomplete_var_decl", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            " #@MACRO@:TRY(check_initializer(ctx, node->init, node->var_type, &init_value))"
            _errval = check_initializer(ctx, node[].init, node[].var_type, @init_value)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        if node[].storage_class.tag == AST_CExtern_t {
            init_value = make_NoInitializer()
        }
        else {
            if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_var_decl), "MSG_incomplete_var_decl", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            init_value = make_Tentative()
        }
    }
    map_it = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        var_symbol: *struc Symbol = (ctx[].frontend[].symbol_table[map_it]).value
        if not is_same_type(var_symbol[].type_t, node[].var_type) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_conflict), "MSG_redecl_var_conflict", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, var_symbol[].type_t, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        var_attrs: *struc StaticAttr = @var_symbol[].attrs[].get._StaticAttr
        if node[].storage_class.tag == AST_CExtern_t {
            is_glob = var_attrs[].is_glob
        }
        elif is_glob ~= var_attrs[].is_glob {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_storage), "MSG_redecl_var_storage", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        if var_attrs[].init[].tag == AST_Initial_t {
            if init_value[].tag == AST_Initial_t {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_storage), "MSG_redecl_var_storage", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            else {
                if var_attrs[].init ~= init_value {
                    " #@MACRO@:sptr_copy(InitialValue, var_attrs->init, init_value)"
                    free_InitialValue(@init_value)
                    init_value = var_attrs[].init
                    (init_value)[]._ref_count++
                }
            }
        }
        free_Symbol(@var_symbol)
    }
    if node[].var_type ~= glob_var_type {
        " #@MACRO@:sptr_copy(Type, node->var_type, glob_var_type)"
        free_Type(@glob_var_type)
        glob_var_type = node[].var_type
        (glob_var_type)[]._ref_count++
    }
    glob_var_attrs = make_StaticAttr(is_glob, @init_value)
    symbol = make_Symbol(@glob_var_type, @glob_var_attrs)
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->frontend->symbol_table, node->name, symbol)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->frontend->symbol_table, node->name, symbol)"
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@glob_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@glob_var_type)
    return _errval
}

fn check_extern_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt_1: string = ? nil then sdsnew(nil) else nil
    type_fmt_2: string = ? nil then sdsnew(nil) else nil
    local_var_attrs: *struc IdentifierAttr = uptr_new()
    symbol: *struc Symbol = uptr_new()
    init_value: *struc InitialValue = sptr_new()
    local_var_type: *struc Type = sptr_new()
    _errval: i32 = 0
    map_it: i64;
    if node[].init {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redef_extern_var), "MSG_redef_extern_var", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    map_it = (? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        var_type: *struc Type = (ctx[].frontend[].symbol_table[map_it]).value[].type_t
        if not is_same_type(var_type, node[].var_type) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_conflict), "MSG_redecl_var_conflict", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt_1), get_type_fmt(ctx[].identifiers, var_type, @type_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    if node[].var_type ~= local_var_type {
        " #@MACRO@:sptr_copy(Type, node->var_type, local_var_type)"
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    init_value = make_NoInitializer()
    local_var_attrs = make_StaticAttr(true, @init_value)
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->frontend->symbol_table, node->name, symbol)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->frontend->symbol_table, node->name, symbol)"
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_1 {
        " #@MACRO@:str_delete(type_fmt_1)"
        sdsfree(type_fmt_1)
        type_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if type_fmt_2 {
        " #@MACRO@:str_delete(type_fmt_2)"
        sdsfree(type_fmt_2)
        type_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    return _errval
}

fn check_static_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    local_var_attrs: *struc IdentifierAttr = uptr_new()
    symbol: *struc Symbol = uptr_new()
    init_value: *struc InitialValue = sptr_new()
    local_var_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if node[].init {
        loop .. while 0 {
            " #@MACRO@:TRY(check_initializer(ctx, node->init, node->var_type, &init_value))"
            _errval = check_initializer(ctx, node[].init, node[].var_type, @init_value)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        init_value = check_no_initializer(ctx, node[].var_type)
    }
    if node[].var_type ~= local_var_type {
        " #@MACRO@:sptr_copy(Type, node->var_type, local_var_type)"
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    local_var_attrs = make_StaticAttr(false, @init_value)
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->frontend->symbol_table, node->name, symbol)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->frontend->symbol_table, node->name, symbol)"
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }
        }
        symbol = nil
    }
    label _Lfinally
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    return _errval
}

fn check_auto_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    local_var_attrs: *struc IdentifierAttr = uptr_new()
    symbol: *struc Symbol = uptr_new()
    local_var_type: *struc Type = sptr_new()
    _errval: i32 = 0
    if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_var_decl), "MSG_incomplete_var_decl", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].var_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    if node[].var_type ~= local_var_type {
        " #@MACRO@:sptr_copy(Type, node->var_type, local_var_type)"
        free_Type(@local_var_type)
        local_var_type = node[].var_type
        (local_var_type)[]._ref_count++
    }
    local_var_attrs = make_LocalAttr()
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->frontend->symbol_table, node->name, symbol)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->frontend->symbol_table, node->name, symbol)"
            loop .. while 0 {
                (ctx[].frontend[].symbol_table) = stbds_hmput_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp].value = (symbol)
            }
        }
        symbol = nil
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_Type(@local_var_type)
    return _errval
}

fn check_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    ctx[].errors[].info_at_buf = node[].info_at
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, node->var_type))"
        _errval = reslv_struct_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].var_type[].tag == AST_Void_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_void_var_decl), "MSG_void_var_decl", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(is_valid_type(ctx, node->var_type))"
        _errval = is_valid_type(ctx, node[].var_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    match node[].storage_class.tag {
        -> AST_CStorageClass_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_auto_block_var_decl(ctx, node))"
                _errval = check_auto_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CExtern_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_extern_block_var_decl(ctx, node))"
                _errval = check_extern_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CStatic_t {
            loop .. while 0 {
                " #@MACRO@:TRY(check_static_block_var_decl(ctx, node))"
                _errval = check_static_block_var_decl(ctx, node)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    struct_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = 0 while i < vec_size(node[].members) .. ++i {
        loop j: u64 = i + 1 while j < vec_size(node[].members) .. ++j {
            if node[].members[i][].member_name == node[].members[j][].member_name {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->members[i]->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_duplicate_member_decl), "MSG_duplicate_member_decl", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt), get_name_fmt(ctx[].identifiers, node[].members[i][].member_name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].members[i][].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        ctx[].errors[].info_at_buf = node[].members[i][].info_at
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_struct_type(ctx, node->members[i]->member_type))"
            _errval = reslv_struct_type(ctx, node[].members[i][].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        if not is_type_complete(ctx, node[].members[i][].member_type) {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->members[i]->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_incomplete_member_decl), "MSG_incomplete_member_decl", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt), get_name_fmt(ctx[].identifiers, node[].members[i][].member_name, @name_fmt), get_type_fmt(ctx[].identifiers, node[].members[i][].member_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].members[i][].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            " #@MACRO@:TRY(is_valid_type(ctx, node->members[i]->member_type))"
            _errval = is_valid_type(ctx, node[].members[i][].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    if struct_fmt {
        " #@MACRO@:str_delete(struct_fmt)"
        sdsfree(struct_fmt)
        struct_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn check_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    struct_fmt: string = ? nil then sdsnew(nil) else nil
    struct_member: *struc StructMember = uptr_new()
    struct_typedef: *struc StructTypedef = uptr_new()
    member_type: *struc Type = sptr_new()
    member_names: vector_t(TIdentifier) = vec_new()
    members: *struc PairTIdentifierUPtrStructMember = map_new()
    _errval: i32 = 0
    alignment: i32;
    size: i64;
    if (? ((ctx[].frontend[].struct_typedef_table) = stbds_hmget_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp) ~= -1 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_in_scope), "MSG_redecl_struct_in_scope", "", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    alignment = 0
    size = 0l
    vec_reserve(member_names, vec_size(node[].members))
    loop i: u64 = 0 while i < vec_size(node[].members) .. ++i {
        {
            name: u64 = node[].members[i][].member_name
            vec_push_back(member_names, name)
        }
        member_alignment: i32 = get_type_alignment(ctx, node[].members[i][].member_type)
        member_size: i64 = get_type_scale(ctx, node[].members[i][].member_type)
        {
            offset: i64 = 0l
            if node[].is_union {
                if size < member_size {
                    size = member_size
                }
            }
            else {
                offset = size % member_alignment
                if offset ~= 0l {
                    size += member_alignment - offset
                }
                offset = size
                size += member_size
            }
            if node[].members[i][].member_type ~= member_type {
                " #@MACRO@:sptr_copy(Type, node->members[i]->member_type, member_type)"
                free_Type(@member_type)
                member_type = node[].members[i][].member_type
                (member_type)[]._ref_count++
            }
            # TODO THROW_ABORT_IF(map_find(members, vec_back(member_names)) != map_end());
            struct_member = make_StructMember(offset, @member_type)
            loop .. while 0 {
                " #@MACRO@:map_move_add(members, vec_back(member_names), struct_member)"
                loop .. while 0 {
                    " #@MACRO@:map_add(members, (member_names)[((member_names) ? ((struct stbds_array_header*)(member_names)-1)->length : 0) - 1], struct_member)"
                    loop .. while 0 {
                        (members) = stbds_hmput_key((members), sizeof((members)[]), cast<*any>(@(((member_names)[(? (member_names) then (cast<*struc stbds_array_header>((member_names)) - 1)[].length else 0) - 1]))), sizeof((members)[].key), 0)
                        (members)[(cast<*struc stbds_array_header>(((members) - 1)) - 1)[].temp].key = ((member_names)[(? (member_names) then (cast<*struc stbds_array_header>((member_names)) - 1)[].length else 0) - 1])
                        (members)[(cast<*struc stbds_array_header>(((members) - 1)) - 1)[].temp].value = (struct_member)
                    }
                }
                struct_member = nil
            }
        }
        if alignment < member_alignment {
            alignment = member_alignment
        }
    }
    {
        offset: i64 = size % alignment
        if offset ~= 0l {
            size += alignment - offset
        }
    }
    struct_typedef = make_StructTypedef(alignment, size, @member_names, @members)
    loop .. while 0 {
        " #@MACRO@:map_move_add(ctx->frontend->struct_typedef_table, node->tag_name, struct_typedef)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->frontend->struct_typedef_table, node->tag_name, struct_typedef)"
            loop .. while 0 {
                (ctx[].frontend[].struct_typedef_table) = stbds_hmput_key((ctx[].frontend[].struct_typedef_table), sizeof((ctx[].frontend[].struct_typedef_table)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].frontend[].struct_typedef_table)[].key), 0)
                (ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp].key = (node[].tag_name)
                (ctx[].frontend[].struct_typedef_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].struct_typedef_table) - 1)) - 1)[].temp].value = (struct_typedef)
            }
        }
        struct_typedef = nil
    }
    label _Lfinally
    if struct_fmt {
        " #@MACRO@:str_delete(struct_fmt)"
        sdsfree(struct_fmt)
        struct_fmt = ? nil then sdsnew(nil) else nil
    }
    free_StructMember(@struct_member)
    free_StructTypedef(@struct_typedef)
    free_Type(@member_type)
    vec_delete(member_names)
    loop i: u64 = 0 while i < (? (members) then (cast<*struc stbds_array_header>(((members) - 1)) - 1)[].length - 1 else 0) .. ++i {
        free_StructMember(@(members[i]).value)
    }
    if members {
        " #@MACRO@:map_delete(members)"
        loop .. while 0 {
            cast<none>((? (members) ~= nil then stbds_hmfree_func((members) - 1, sizeof((members)[])) else cast<none>(0)))
            (members) = nil
        }
        members = map_new()
    }
    return _errval
}

fn annotate_goto_label(ctx: *struc SemanticContext, node: *struc CLabel) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (? ((ctx[].label_set) = stbds_hmget_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@((node[].target))), sizeof((ctx[].label_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp) ~= -1 {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redef_label_in_scope), "MSG_redef_label_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].target, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:set_insert(ctx->label_set, node->target)"
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->label_set, node->target, 0)"
            loop .. while 0 {
                (ctx[].label_set) = stbds_hmput_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@((node[].target))), sizeof((ctx[].label_set)[].key), 0)
                (ctx[].label_set)[(cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp].key = (node[].target)
                (ctx[].label_set)[(cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp].value = (0)
            }
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn annotate_while_loop(ctx: *struc SemanticContext, node: *struc CWhile) none {
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Lwhile)
    vec_push_back(ctx[].break_loop_labels, node[].target)
    vec_push_back(ctx[].continue_loop_labels, node[].target)
}

fn annotate_do_while_loop(ctx: *struc SemanticContext, node: *struc CDoWhile) none {
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Ldo_while)
    vec_push_back(ctx[].break_loop_labels, node[].target)
    vec_push_back(ctx[].continue_loop_labels, node[].target)
}

fn annotate_for_loop(ctx: *struc SemanticContext, node: *struc CFor) none {
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Lfor)
    vec_push_back(ctx[].break_loop_labels, node[].target)
    vec_push_back(ctx[].continue_loop_labels, node[].target)
}

fn annotate_switch_lookup(ctx: *struc SemanticContext, node: *struc CSwitch) none {
    node[].is_default = false
    node[].target = repr_label_identifier(ctx[].identifiers, LBL_Lswitch)
    vec_push_back(ctx[].break_loop_labels, node[].target)
}

fn annotate_case_jump(ctx: *struc SemanticContext, node: *struc CCase) i32 {
    _errval: i32 = 0
    if not ctx[].p_switch_statement {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->value->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_case_out_of_switch), "MSG_case_out_of_switch", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].value[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = repr_case_identifier(ctx[].identifiers, ctx[].p_switch_statement[].target, false, vec_size(ctx[].p_switch_statement[].cases))
    label _Lfinally
    return _errval
}

fn annotate_default_jump(ctx: *struc SemanticContext, node: *struc CDefault) i32 {
    _errval: i32 = 0
    if not ctx[].p_switch_statement {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_default_out_of_switch), "MSG_default_out_of_switch", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif ctx[].p_switch_statement[].is_default {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_multiple_default), "MSG_multiple_default", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = ctx[].p_switch_statement[].target
    ctx[].p_switch_statement[].is_default = true
    label _Lfinally
    return _errval
}

fn annotate_break_jump(ctx: *struc SemanticContext, node: *struc CBreak) i32 {
    _errval: i32 = 0
    if vec_empty(ctx[].break_loop_labels) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_break_out_of_loop), "MSG_break_out_of_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = vec_back(ctx[].break_loop_labels)
    label _Lfinally
    return _errval
}

fn annotate_continue_jump(ctx: *struc SemanticContext, node: *struc CContinue) i32 {
    _errval: i32 = 0
    if vec_empty(ctx[].continue_loop_labels) {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_continue_out_of_loop), "MSG_continue_out_of_loop", "", "", "") > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    node[].target = vec_back(ctx[].continue_loop_labels)
    label _Lfinally
    return _errval
}

fn deannotate_loop(ctx: *struc SemanticContext) none {
    vec_pop_back(ctx[].break_loop_labels)
    vec_pop_back(ctx[].continue_loop_labels)
}

fn deannotate_lookup(ctx: *struc SemanticContext) none {
    vec_pop_back(ctx[].break_loop_labels)
}

fn is_file_scope(ctx: *struc SemanticContext) i32 {
    return vec_size(ctx[].scoped_identifier_maps) == 1
}

fn enter_scope(ctx: *struc SemanticContext) none {
    vec_push_back(ctx[].scoped_identifier_maps, map_new())
    vec_push_back(ctx[].scoped_struct_maps, map_new())
}

fn exit_scope(ctx: *struc SemanticContext) none {
    loop i: u64 = 0 while i < (? ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) then (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].length - 1 else 0) .. ++i { # TODO map_size(vec_back(ctx->scoped_identifier_maps))
        identifier: u64 = ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1][i]).key # pair_first(vec_back(ctx->scoped_identifier_maps)[i])
        map_it: i64 = (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((identifier))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp)
        if map_it ~= -1 and (ctx[].extern_scope_map[map_it]).value == vec_size(ctx[].scoped_identifier_maps) {
            loop .. while 0 {
                " #@MACRO@:map_erase(ctx->extern_scope_map, identifier)"
                (? ((ctx[].extern_scope_map) = stbds_hmdel_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((identifier))), sizeof((ctx[].extern_scope_map)[].key), (cast<string>(@((ctx[].extern_scope_map))[].key) - cast<string>(((ctx[].extern_scope_map)))), 0)) then (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp else 0)
            }
        }
    }
    if (ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1] {
        " #@MACRO@:map_delete(vec_back(ctx->scoped_identifier_maps))"
        loop .. while 0 {
            cast<none>((? ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) ~= nil then stbds_hmfree_func(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1, sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[])) else cast<none>(0)))
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = nil
        }
        (ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1] = map_new()
    }
    vec_pop_back(ctx[].scoped_identifier_maps)
    if (ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1] {
        " #@MACRO@:map_delete(vec_back(ctx->scoped_struct_maps))"
        loop .. while 0 {
            cast<none>((? ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) ~= nil then stbds_hmfree_func(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1, sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[])) else cast<none>(0)))
            ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = nil
        }
        (ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1] = map_new()
    }
    vec_pop_back(ctx[].scoped_struct_maps)
}

fn reslv_label(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt_1: string = ? nil then sdsnew(nil) else nil
    name_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = 0 while i < (? (ctx[].goto_map) then (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        if (? ((ctx[].label_set) = stbds_hmget_key((ctx[].label_set), sizeof((ctx[].label_set)[]), cast<*any>(@(((ctx[].goto_map[i]).key))), sizeof((ctx[].label_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].label_set) - 1)) - 1)[].temp) == -1 {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ((((((ctx->errors->info_at_map) = stbds_hmget_key((ctx->errors->info_at_map), sizeof(*(ctx->errors->info_at_map)), (void*)&(((ctx->goto_map[i]).value)), sizeof((ctx->errors->info_at_map)->key), 0)) && 0 ? 0 : ((struct stbds_array_header*)((ctx->errors->info_at_map)-1)-1)->temp)) && 0 ? 0 : &(ctx->errors->info_at_map)[((struct stbds_array_header*)((ctx->errors->info_at_map)-1)-1)->temp])->value)))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undef_goto_target), "MSG_undef_goto_target", "", get_name_fmt(ctx[].identifiers, (ctx[].goto_map[i]).key, @name_fmt_1), get_name_fmt(ctx[].identifiers, node[].name, @name_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ((? ((? ((ctx[].errors[].info_at_map) = stbds_hmget_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@(((ctx[].goto_map[i]).value))), sizeof((ctx[].errors[].info_at_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp])[].value))) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if name_fmt_1 {
        " #@MACRO@:str_delete(name_fmt_1)"
        sdsfree(name_fmt_1)
        name_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if name_fmt_2 {
        " #@MACRO@:str_delete(name_fmt_2)"
        sdsfree(name_fmt_2)
        name_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_ptr_struct(ctx: *struc SemanticContext, ptr_type: *struc Pointer) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, ptr_type->ref_type))"
        _errval = reslv_struct_type(ctx, ptr_type[].ref_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_arr_struct(ctx: *struc SemanticContext, arr_type: *struc Array) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_type(ctx, arr_type->elem_type))"
        _errval = reslv_struct_type(ctx, arr_type[].elem_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_struct(ctx: *struc SemanticContext, struct_type: *struc Structure) i32 {
    struct_fmt: string = ? nil then sdsnew(nil) else nil
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if struct_type[].is_union {
        if (? ((ctx[].union_def_set) = stbds_hmget_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].union_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp) ~= -1 {
            jump _Lfinally
        }
    }
    elif (? ((ctx[].struct_def_set) = stbds_hmget_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].struct_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp) ~= -1 {
        jump _Lfinally
    }
    loop i: u64 = vec_size(ctx[].scoped_identifier_maps) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_struct_maps[i]) = stbds_hmget_key((ctx[].scoped_struct_maps[i]), sizeof((ctx[].scoped_struct_maps[i])[]), cast<*any>(@((struct_type[].tag_name))), sizeof((ctx[].scoped_struct_maps[i])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_struct_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            structure: *struc Structure = @(ctx[].scoped_struct_maps[i][map_it]).value
            if structure[].is_union ~= struct_type[].is_union {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->errors->info_at_buf))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_conflict), "MSG_redecl_struct_conflict", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt), get_struct_name_fmt(ctx[].identifiers, struct_type[].tag_name, not struct_type[].is_union, @struct_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
            struct_type[].tag_name = structure[].tag_name
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, ctx->errors->info_at_buf))"
        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undef_struct_in_scope), "MSG_undef_struct_in_scope", "", "", get_struct_fmt(ctx[].identifiers, struct_type, @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, ctx[].errors[].info_at_buf)) else panic_sigabrt("abort")
        _errval = 1
        jump _Lfinally
    }
    label _Lfinally
    if struct_fmt {
        " #@MACRO@:str_delete(struct_fmt)"
        sdsfree(struct_fmt)
        struct_fmt = ? nil then sdsnew(nil) else nil
    }
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_struct_type(ctx: *struc SemanticContext, type_t: *struc Type) i32 {
    _errval: i32 = 0
    match type_t[].tag {
        -> AST_Pointer_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_ptr_struct(ctx, &type_t->get._Pointer))"
                _errval = reslv_ptr_struct(ctx, @type_t[].get._Pointer)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Array_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_arr_struct(ctx, &type_t->get._Array))"
                _errval = reslv_arr_struct(ctx, @type_t[].get._Array)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_struct(ctx, &type_t->get._Structure))"
                _errval = reslv_struct(ctx, @type_t[].get._Structure)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_FunType_t {
            panic_sigabrt("abort")
        }
        otherwise {
            break
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) i32;
fn reslv_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32;

fn reslv_const_exp(node: *struc CConstant) none {
    check_const_exp(node)
}

fn reslv_string_exp(node: *struc CString) none {
    check_string_exp(node)
}

fn reslv_var_exp(ctx: *struc SemanticContext, node: *struc CVar) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = vec_size(ctx[].scoped_identifier_maps) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_identifier_maps[i]) = stbds_hmget_key((ctx[].scoped_identifier_maps[i]), sizeof((ctx[].scoped_identifier_maps[i])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps[i])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_identifier_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            node[].name = (ctx[].scoped_identifier_maps[i][map_it]).value
            jump Lelse
        }
    }
    loop .. while 0 {
        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undecl_var_in_scope), "MSG_undecl_var_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
        _errval = 1
        jump _Lfinally
    }
    label Lelse
    loop .. while 0 {
        " #@MACRO@:TRY(check_var_exp(ctx, node))"
        _errval = check_var_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_cast_exp(ctx, node))"
        _errval = check_cast_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_unary_exp(ctx, node))"
        _errval = check_unary_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_left))"
        _errval = reslv_typed_exp(ctx, @node[].exp_left)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_right))"
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_binary_exp(ctx, node))"
        _errval = check_binary_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) i32 {
    _errval: i32 = 0
    if node[].exp_left {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_left))"
            _errval = reslv_typed_exp(ctx, @node[].exp_left)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_right))"
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_assign_exp(ctx, node))"
        _errval = check_assign_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_middle))"
        _errval = reslv_typed_exp(ctx, @node[].exp_middle)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp_right))"
        _errval = reslv_typed_exp(ctx, @node[].exp_right)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_conditional_exp(ctx, node))"
        _errval = check_conditional_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = vec_size(ctx[].scoped_identifier_maps) while i-- > 0 {
        map_it: i64 = (? ((ctx[].scoped_identifier_maps[i]) = stbds_hmget_key((ctx[].scoped_identifier_maps[i]), sizeof((ctx[].scoped_identifier_maps[i])[]), cast<*any>(@((node[].name))), sizeof((ctx[].scoped_identifier_maps[i])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].scoped_identifier_maps[i]) - 1)) - 1)[].temp)
        if map_it ~= -1 {
            node[].name = (ctx[].scoped_identifier_maps[i][map_it]).value
            jump Lelse
        }
    }
    loop .. while 0 {
        " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->_base->info_at))"
        ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_undecl_fun_in_scope), "MSG_undecl_fun_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[]._base[].info_at)) else panic_sigabrt("abort")
        _errval = 1
        jump _Lfinally
    }
    label Lelse
    loop i: u64 = 0 while i < vec_size(node[].args) .. ++i {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->args[i]))"
            _errval = reslv_typed_exp(ctx, @node[].args[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_call_exp(ctx, node))"
        _errval = check_call_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_deref_exp(ctx, node))"
        _errval = check_deref_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_addrof_expr(ctx: *struc SemanticContext, node: *struc CAddrOf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_exp(ctx, node->exp))"
        _errval = reslv_exp(ctx, node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_addrof_exp(ctx, node))"
        _errval = check_addrof_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->primary_exp))"
        _errval = reslv_typed_exp(ctx, @node[].primary_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->subscript_exp))"
        _errval = reslv_typed_exp(ctx, @node[].subscript_exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_subscript_exp(ctx, node))"
        _errval = check_subscript_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_exp(ctx, node->exp))"
        _errval = reslv_exp(ctx, node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_sizeof_exp(ctx, node))"
        _errval = check_sizeof_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(check_sizeoft_exp(ctx, node))"
        _errval = check_sizeoft_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->structure))"
        _errval = reslv_typed_exp(ctx, @node[].structure)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_dot_exp(ctx, node))"
        _errval = check_dot_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->pointer))"
        _errval = reslv_typed_exp(ctx, @node[].pointer)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_arrow_exp(ctx, node))"
        _errval = check_arrow_exp(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CConstant_t {
            reslv_const_exp(@node[].get._CConstant)
        }
        break
        -> AST_CString_t {
            reslv_string_exp(@node[].get._CString)
        }
        break
        -> AST_CVar_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_var_exp(ctx, &node->get._CVar))"
                _errval = reslv_var_exp(ctx, @node[].get._CVar)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCast_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_cast_exp(ctx, &node->get._CCast))"
                _errval = reslv_cast_exp(ctx, @node[].get._CCast)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CUnary_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_unary_exp(ctx, &node->get._CUnary))"
                _errval = reslv_unary_exp(ctx, @node[].get._CUnary)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CBinary_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_binary_exp(ctx, &node->get._CBinary))"
                _errval = reslv_binary_exp(ctx, @node[].get._CBinary)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CAssignment_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_assign_exp(ctx, &node->get._CAssignment))"
                _errval = reslv_assign_exp(ctx, @node[].get._CAssignment)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CConditional_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_conditional_exp(ctx, &node->get._CConditional))"
                _errval = reslv_conditional_exp(ctx, @node[].get._CConditional)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CFunctionCall_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_call_exp(ctx, &node->get._CFunctionCall))"
                _errval = reslv_call_exp(ctx, @node[].get._CFunctionCall)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDereference_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_deref_exp(ctx, &node->get._CDereference))"
                _errval = reslv_deref_exp(ctx, @node[].get._CDereference)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CAddrOf_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_addrof_expr(ctx, &node->get._CAddrOf))"
                _errval = reslv_addrof_expr(ctx, @node[].get._CAddrOf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSubscript_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_subscript_exp(ctx, &node->get._CSubscript))"
                _errval = reslv_subscript_exp(ctx, @node[].get._CSubscript)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSizeOf_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_sizeof_exp(ctx, &node->get._CSizeOf))"
                _errval = reslv_sizeof_exp(ctx, @node[].get._CSizeOf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSizeOfT_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_sizeoft_exp(ctx, &node->get._CSizeOfT))"
                _errval = reslv_sizeoft_exp(ctx, @node[].get._CSizeOfT)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDot_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_dot_exp(ctx, &node->get._CDot))"
                _errval = reslv_dot_exp(ctx, @node[].get._CDot)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CArrow_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_arrow_exp(ctx, &node->get._CArrow))"
                _errval = reslv_arrow_exp(ctx, @node[].get._CArrow)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_typed_exp(ctx: *struc SemanticContext, exp: **struc CExp) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_exp(ctx, *exp))"
        _errval = reslv_exp(ctx, exp[])
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_typed_exp(ctx, exp))"
        _errval = check_typed_exp(ctx, exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) i32;
fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32;
fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) i32;

fn reslv_for_init_decl(ctx: *struc SemanticContext, node: *struc CInitDecl) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if node[].init[].storage_class.tag ~= AST_CStorageClass_t {
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->init->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_for_init_decl_not_auto), "MSG_for_init_decl_not_auto", "", get_name_fmt(ctx[].identifiers, node[].init[].name, @name_fmt), get_storage_class_fmt(@node[].init[].storage_class)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].init[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_block_var_decl(ctx, node->init))"
        _errval = reslv_block_var_decl(ctx, node[].init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_for_init_exp(ctx: *struc SemanticContext, node: *struc CInitExp) i32 {
    _errval: i32 = 0
    if node[].init {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->init))"
            _errval = reslv_typed_exp(ctx, @node[].init)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_for_init(ctx: *struc SemanticContext, node: *struc CForInit) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CInitDecl_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_for_init_decl(ctx, &node->get._CInitDecl))"
                _errval = reslv_for_init_decl(ctx, @node[].get._CInitDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CInitExp_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_for_init_exp(ctx, &node->get._CInitExp))"
                _errval = reslv_for_init_exp(ctx, @node[].get._CInitExp)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) i32 {
    _errval: i32 = 0
    if node[].exp {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
            _errval = reslv_typed_exp(ctx, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_ret_statement(ctx, node))"
        _errval = check_ret_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_exp_statement(ctx: *struc SemanticContext, node: *struc CExpression) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
        _errval = reslv_typed_exp(ctx, @node[].exp)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_if_statement(ctx: *struc SemanticContext, node: *struc CIf) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->then_fi))"
        _errval = reslv_statement(ctx, node[].then_fi)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].else_fi {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_statement(ctx, node->else_fi))"
            _errval = reslv_statement(ctx, node[].else_fi)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_if_statement(ctx, node))"
        _errval = check_if_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_goto_statement(ctx: *struc SemanticContext, node: *struc CGoto) none {
    map_it: i64 = (? ((ctx[].goto_map) = stbds_hmget_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].target = (ctx[].goto_map[map_it]).value
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->errors->info_at_map, node->target, node->info_at)"
            loop .. while 0 {
                (ctx[].errors[].info_at_map) = stbds_hmput_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].errors[].info_at_map)[].key), 0)
                (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].key = (node[].target)
                (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].value = (node[].info_at)
            }
        }
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->goto_map, node->target, target)"
            loop .. while 0 {
                (ctx[].goto_map) = stbds_hmput_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)
                (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].key = (node[].target)
                (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].value = (target)
            }
        }
        node[].target = target
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->errors->info_at_map, node->target, node->info_at)"
            loop .. while 0 {
                (ctx[].errors[].info_at_map) = stbds_hmput_key((ctx[].errors[].info_at_map), sizeof((ctx[].errors[].info_at_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].errors[].info_at_map)[].key), 0)
                (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].key = (node[].target)
                (ctx[].errors[].info_at_map)[(cast<*struc stbds_array_header>(((ctx[].errors[].info_at_map) - 1)) - 1)[].temp].value = (node[].info_at)
            }
        }
    }
}

fn reslv_label_statement(ctx: *struc SemanticContext, node: *struc CLabel) i32 {
    _errval: i32 = 0
    map_it: i64;
    loop .. while 0 {
        " #@MACRO@:TRY(annotate_goto_label(ctx, node))"
        _errval = annotate_goto_label(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    map_it = (? ((ctx[].goto_map) = stbds_hmget_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp)
    if map_it ~= -1 {
        node[].target = (ctx[].goto_map[map_it]).value
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->goto_map, node->target, target)"
            loop .. while 0 {
                (ctx[].goto_map) = stbds_hmput_key((ctx[].goto_map), sizeof((ctx[].goto_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].goto_map)[].key), 0)
                (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].key = (node[].target)
                (ctx[].goto_map)[(cast<*struc stbds_array_header>(((ctx[].goto_map) - 1)) - 1)[].temp].value = (target)
            }
        }
        node[].target = target
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->jump_to))"
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_compound_statement(ctx: *struc SemanticContext, node: *struc CCompound) i32 {
    _errval: i32 = 0
    enter_scope(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_block(ctx, node->block))"
        _errval = reslv_block(ctx, node[].block)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exit_scope(ctx)
    label _Lfinally
    return _errval
}

fn reslv_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) i32 {
    _errval: i32 = 0
    annotate_while_loop(ctx, node)
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->body))"
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    deannotate_loop(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(check_while_statement(ctx, node))"
        _errval = check_while_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) i32 {
    _errval: i32 = 0
    annotate_do_while_loop(ctx, node)
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->body))"
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
        _errval = reslv_typed_exp(ctx, @node[].condition)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    deannotate_loop(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(check_do_while_statement(ctx, node))"
        _errval = check_do_while_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_for_statement(ctx: *struc SemanticContext, node: *struc CFor) i32 {
    _errval: i32 = 0
    annotate_for_loop(ctx, node)
    enter_scope(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_for_init(ctx, node->init))"
        _errval = reslv_for_init(ctx, node[].init)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].condition {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->condition))"
            _errval = reslv_typed_exp(ctx, @node[].condition)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    if node[].post {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->post))"
            _errval = reslv_typed_exp(ctx, @node[].post)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->body))"
        _errval = reslv_statement(ctx, node[].body)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    exit_scope(ctx)
    deannotate_loop(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(check_for_statement(ctx, node))"
        _errval = check_for_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) i32 {
    _errval: i32 = 0
    annotate_switch_lookup(ctx, node)
    enter_scope(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->lookup))"
        _errval = reslv_typed_exp(ctx, @node[].lookup)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    {
        p_switch_statement: *struc CSwitch = ctx[].p_switch_statement
        ctx[].p_switch_statement = node
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_statement(ctx, node->body))"
            _errval = reslv_statement(ctx, node[].body)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        ctx[].p_switch_statement = p_switch_statement
    }
    exit_scope(ctx)
    deannotate_lookup(ctx)
    loop .. while 0 {
        " #@MACRO@:TRY(check_switch_statement(ctx, node))"
        _errval = check_switch_statement(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_case_statement(ctx: *struc SemanticContext, node: *struc CCase) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(annotate_case_jump(ctx, node))"
        _errval = annotate_case_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->value))"
        _errval = reslv_typed_exp(ctx, @node[].value)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    vec_move_back(ctx[].p_switch_statement[].cases, node[].value)
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->jump_to))"
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_default_statement(ctx: *struc SemanticContext, node: *struc CDefault) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(annotate_default_jump(ctx, node))"
        _errval = annotate_default_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_statement(ctx, node->jump_to))"
        _errval = reslv_statement(ctx, node[].jump_to)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_break_statement(ctx: *struc SemanticContext, node: *struc CBreak) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(annotate_break_jump(ctx, node))"
        _errval = annotate_break_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_continue_statement(ctx: *struc SemanticContext, node: *struc CContinue) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(annotate_continue_jump(ctx, node))"
        _errval = annotate_continue_jump(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CReturn_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_ret_statement(ctx, &node->get._CReturn))"
                _errval = reslv_ret_statement(ctx, @node[].get._CReturn)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CExpression_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_exp_statement(ctx, &node->get._CExpression))"
                _errval = reslv_exp_statement(ctx, @node[].get._CExpression)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CIf_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_if_statement(ctx, &node->get._CIf))"
                _errval = reslv_if_statement(ctx, @node[].get._CIf)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CGoto_t {
            reslv_goto_statement(ctx, @node[].get._CGoto)
        }
        break
        -> AST_CLabel_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_label_statement(ctx, &node->get._CLabel))"
                _errval = reslv_label_statement(ctx, @node[].get._CLabel)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCompound_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_compound_statement(ctx, &node->get._CCompound))"
                _errval = reslv_compound_statement(ctx, @node[].get._CCompound)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CWhile_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_while_statement(ctx, &node->get._CWhile))"
                _errval = reslv_while_statement(ctx, @node[].get._CWhile)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDoWhile_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_do_while_statement(ctx, &node->get._CDoWhile))"
                _errval = reslv_do_while_statement(ctx, @node[].get._CDoWhile)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CFor_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_for_statement(ctx, &node->get._CFor))"
                _errval = reslv_for_statement(ctx, @node[].get._CFor)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CSwitch_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_switch_statement(ctx, &node->get._CSwitch))"
                _errval = reslv_switch_statement(ctx, @node[].get._CSwitch)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCase_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_case_statement(ctx, &node->get._CCase))"
                _errval = reslv_case_statement(ctx, @node[].get._CCase)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CDefault_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_default_statement(ctx, &node->get._CDefault))"
                _errval = reslv_default_statement(ctx, @node[].get._CDefault)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CBreak_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_break_statement(ctx, &node->get._CBreak))"
                _errval = reslv_break_statement(ctx, @node[].get._CBreak)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CContinue_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_continue_statement(ctx, &node->get._CContinue))"
                _errval = reslv_continue_statement(ctx, @node[].get._CContinue)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CNull_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) i32;

fn reslv_block_items(ctx: *struc SemanticContext, node_list: vector_t(unique_ptr_t(CBlockItem))) i32 {
    _errval: i32 = 0
    loop i: u64 = 0 while i < vec_size(node_list) .. ++i {
        match node_list[i][].tag {
            -> AST_CS_t {
                loop .. while 0 {
                    " #@MACRO@:TRY(reslv_statement(ctx, node_list[i]->get._CS.statement))"
                    _errval = reslv_statement(ctx, node_list[i][].get._CS.statement)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            -> AST_CD_t {
                loop .. while 0 {
                    " #@MACRO@:TRY(reslv_declaration(ctx, node_list[i]->get._CD.declaration))"
                    _errval = reslv_declaration(ctx, node_list[i][].get._CD.declaration)
                    if _errval ~= 0 {
                        jump _Lfinally
                    }
                }
            }
            break
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_block_items(ctx, node->get._CB.block_items))"
        _errval = reslv_block_items(ctx, node[].get._CB.block_items)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) i32;

fn reslv_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) i32 {
    _errval: i32 = 0
    if node[].exp[].tag == AST_CString_t and (init_type[])[].tag == AST_Array_t {
        loop .. while 0 {
            " #@MACRO@:TRY(check_bound_string_init(ctx, &node->exp->get._CString, &(*init_type)->get._Array))"
            _errval = check_bound_string_init(ctx, @node[].exp[].get._CString, @(init_type[])[].get._Array)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        check_string_init(node, init_type)
    }
    else {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_typed_exp(ctx, &node->exp))"
            _errval = reslv_typed_exp(ctx, @node[].exp)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            " #@MACRO@:TRY(check_single_init(ctx, node, init_type))"
            _errval = check_single_init(ctx, node, init_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(check_bound_arr_init(ctx, node, arr_type))"
        _errval = check_bound_arr_init(ctx, node, arr_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_initializer(ctx, node->initializers[i], &arr_type->elem_type))"
            _errval = reslv_initializer(ctx, node[].initializers[i], @arr_type[].elem_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    check_arr_init(ctx, node, arr_type, init_type)
    label _Lfinally
    return _errval
}

fn reslv_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(check_bound_struct_init(ctx, node, struct_type))"
        _errval = check_bound_struct_init(ctx, node, struct_type)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_initializer(ctx, node->initializers[i], &member->member_type))"
            _errval = reslv_initializer(ctx, node[].initializers[i], @member[].member_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    check_struct_init(ctx, node, struct_type, init_type)
    label _Lfinally
    return _errval
}

fn reslv_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, init_type: **struc Type) i32 {
    type_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    match (init_type[])[].tag {
        -> AST_Array_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_arr_init(ctx, node, &(*init_type)->get._Array, init_type))"
                _errval = reslv_arr_init(ctx, node, @(init_type[])[].get._Array, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_Structure_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_struct_init(ctx, node, &(*init_type)->get._Structure, init_type))"
                _errval = reslv_struct_init(ctx, node, @(init_type[])[].get._Structure, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, get_compound_info_at(node)))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_scalar_init_with_compound), "MSG_scalar_init_with_compound", "", "", get_type_fmt(ctx[].identifiers, init_type[], @type_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, get_compound_info_at(node))) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if type_fmt {
        " #@MACRO@:str_delete(type_fmt)"
        sdsfree(type_fmt)
        type_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CSingleInit_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_single_init(ctx, &node->get._CSingleInit, init_type))"
                _errval = reslv_single_init(ctx, @node[].get._CSingleInit, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CCompoundInit_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_compound_init(ctx, &node->get._CCompoundInit, init_type))"
                _errval = reslv_compound_init(ctx, @node[].get._CCompoundInit, init_type)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    loop i: u64 = 0 while i < vec_size(node[].params) .. ++i {
        param: u64 = node[].params[i]
        if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((param))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 { # TODO map_find(vec_back(ctx->scoped_identifier_maps), param)
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_in_scope), "MSG_redecl_var_in_scope", "", "", get_name_fmt(ctx[].identifiers, param, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        param = rslv_var_identifier(ctx[].identifiers, param)
        loop .. while 0 {
            " #@MACRO@:map_add(vec_back(ctx->scoped_identifier_maps), node->params[i], param)"
            loop .. while 0 {
                ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].params[i]))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
                ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].params[i])
                ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (param)
            }
        }
        node[].params[i] = param
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_fun_params_decl(ctx, node))"
        _errval = check_fun_params_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_fun_declaration(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if not is_file_scope(ctx) {
        if node[].body {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_def_nested_fun), "MSG_def_nested_fun", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        elif node[].storage_class.tag == AST_CStatic_t {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_decl_nested_static_fun), "MSG_decl_nested_static_fun", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    if (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) == -1 {
        if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 { # TODO map_find(vec_back(ctx->scoped_identifier_maps), node->name)
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_fun_in_scope), "MSG_redecl_fun_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->extern_scope_map, node->name, vec_size(ctx->scoped_identifier_maps))"
            loop .. while 0 {
                (ctx[].extern_scope_map) = stbds_hmput_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)
                (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].value = ((? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0))
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:map_add(vec_back(ctx->scoped_identifier_maps), node->name, node->name)"
        loop .. while 0 {
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (node[].name)
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_ret_fun_decl(ctx, node))"
        _errval = check_ret_fun_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    enter_scope(ctx)
    if not vec_empty(node[].params) {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_fun_params_decl(ctx, node))"
            _errval = reslv_fun_params_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_fun_decl(ctx, node))"
        _errval = check_fun_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].body {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_block(ctx, node->body))"
            _errval = reslv_block(ctx, node[].body)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    exit_scope(ctx)
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    _errval: i32 = 0
    if (? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->extern_scope_map, node->name, vec_size(ctx->scoped_identifier_maps))"
            loop .. while 0 {
                (ctx[].extern_scope_map) = stbds_hmput_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)
                (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].key = (node[].name)
                (ctx[].extern_scope_map)[(cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp].value = ((? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0))
            }
        }
    }
    loop .. while 0 {
        " #@MACRO@:map_add(vec_back(ctx->scoped_identifier_maps), node->name, node->name)"
        loop .. while 0 {
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
            ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (node[].name)
        }
    }
    if is_file_scope(ctx) {
        loop .. while 0 {
            " #@MACRO@:TRY(check_file_var_decl(ctx, node))"
            _errval = check_file_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:TRY(check_block_var_decl(ctx, node))"
            _errval = check_block_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) i32 {
    name_fmt: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    if (? (((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) ~= -1 and not ((? ((ctx[].extern_scope_map) = stbds_hmget_key((ctx[].extern_scope_map), sizeof((ctx[].extern_scope_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].extern_scope_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].extern_scope_map) - 1)) - 1)[].temp) ~= -1 and node[].storage_class.tag == AST_CExtern_t) { # TODO map_find(vec_back(ctx->scoped_identifier_maps), node->name)
        loop .. while 0 {
            " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
            ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_var_in_scope), "MSG_redecl_var_in_scope", "", "", get_name_fmt(ctx[].identifiers, node[].name, @name_fmt)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
            _errval = 1
            jump _Lfinally
        }
    }
    elif node[].storage_class.tag == AST_CExtern_t {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_file_var_decl(ctx, node))"
            _errval = reslv_file_var_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        jump _Lfinally
    }
    {
        name: u64 = rslv_var_identifier(ctx[].identifiers, node[].name)
        loop .. while 0 {
            " #@MACRO@:map_add(vec_back(ctx->scoped_identifier_maps), node->name, name)"
            loop .. while 0 {
                ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].name))), sizeof(((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[].key), 0)
                ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].name)
                ((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_identifier_maps)[(? (ctx[].scoped_identifier_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_identifier_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (name)
            }
        }
        node[].name = name
    }
    loop .. while 0 {
        " #@MACRO@:TRY(check_block_var_decl(ctx, node))"
        _errval = check_block_var_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if node[].init and node[].storage_class.tag == AST_CStorageClass_t {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_initializer(ctx, node->init, &node->var_type))"
            _errval = reslv_initializer(ctx, node[].init, @node[].var_type)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if name_fmt {
        " #@MACRO@:str_delete(name_fmt)"
        sdsfree(name_fmt)
        name_fmt = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(check_struct_members_decl(ctx, node))"
        _errval = check_struct_members_decl(ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_struct_declaration(ctx: *struc SemanticContext, node: *struc CStructDeclaration) i32 {
    struct_fmt_1: string = ? nil then sdsnew(nil) else nil
    struct_fmt_2: string = ? nil then sdsnew(nil) else nil
    _errval: i32 = 0
    map_it: i64 = (? (((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = stbds_hmget_key(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].tag_name))), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp) # TODO map_find(vec_back(ctx->scoped_struct_maps), node->tag_name)
    if map_it ~= -1 {
        node[].tag_name = ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1][map_it]).value.tag_name # TODO pair_second(vec_back(ctx->scoped_struct_maps)[map_it]).tag_name
        if node[].is_union {
            if (? ((ctx[].union_def_set) = stbds_hmget_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].union_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp) == -1 {
                loop .. while 0 {
                    " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                    ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_conflict), "MSG_redecl_struct_conflict", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt_1), get_struct_name_fmt(ctx[].identifiers, node[].tag_name, not node[].is_union, @struct_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                    _errval = 1
                    jump _Lfinally
                }
            }
        }
        elif (? ((ctx[].struct_def_set) = stbds_hmget_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].struct_def_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp) == -1 {
            loop .. while 0 {
                " #@MACRO@:THROW_ERROR(1, raise_error_at_token(ctx->errors, node->info_at))"
                ? snprintf(ctx[].errors[].msg, sizeof<char> * ERROR_MSG_SIZE, get_semantic_msg(MSG_redecl_struct_conflict), "MSG_redecl_struct_conflict", "", get_struct_name_fmt(ctx[].identifiers, node[].tag_name, node[].is_union, @struct_fmt_1), get_struct_name_fmt(ctx[].identifiers, node[].tag_name, not node[].is_union, @struct_fmt_2)) > 0 then cast<none>(raise_error_at_token(ctx[].errors, node[].info_at)) else panic_sigabrt("abort")
                _errval = 1
                jump _Lfinally
            }
        }
    }
    else {
        {
            structure: struc Structure = $(rslv_struct_tag(ctx[].identifiers, node[].tag_name), node[].is_union)
            loop .. while 0 {
                " #@MACRO@:map_add(vec_back(ctx->scoped_struct_maps), node->tag_name, structure)"
                loop .. while 0 {
                    ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) = stbds_hmput_key(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[]), cast<*any>(@((node[].tag_name))), sizeof(((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[].key), 0)
                    ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].key = (node[].tag_name)
                    ((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1])[(cast<*struc stbds_array_header>((((ctx[].scoped_struct_maps)[(? (ctx[].scoped_struct_maps) then (cast<*struc stbds_array_header>((ctx[].scoped_struct_maps)) - 1)[].length else 0) - 1]) - 1)) - 1)[].temp].value = (structure)
                }
            }
            node[].tag_name = structure.tag_name
        }
        if node[].is_union {
            loop .. while 0 {
                " #@MACRO@:set_insert(ctx->union_def_set, node->tag_name)"
                loop .. while 0 {
                    " #@MACRO@:map_add(ctx->union_def_set, node->tag_name, 0)"
                    loop .. while 0 {
                        (ctx[].union_def_set) = stbds_hmput_key((ctx[].union_def_set), sizeof((ctx[].union_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].union_def_set)[].key), 0)
                        (ctx[].union_def_set)[(cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp].key = (node[].tag_name)
                        (ctx[].union_def_set)[(cast<*struc stbds_array_header>(((ctx[].union_def_set) - 1)) - 1)[].temp].value = (0)
                    }
                }
            }
        }
        else {
            loop .. while 0 {
                " #@MACRO@:set_insert(ctx->struct_def_set, node->tag_name)"
                loop .. while 0 {
                    " #@MACRO@:map_add(ctx->struct_def_set, node->tag_name, 0)"
                    loop .. while 0 {
                        (ctx[].struct_def_set) = stbds_hmput_key((ctx[].struct_def_set), sizeof((ctx[].struct_def_set)[]), cast<*any>(@((node[].tag_name))), sizeof((ctx[].struct_def_set)[].key), 0)
                        (ctx[].struct_def_set)[(cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp].key = (node[].tag_name)
                        (ctx[].struct_def_set)[(cast<*struc stbds_array_header>(((ctx[].struct_def_set) - 1)) - 1)[].temp].value = (0)
                    }
                }
            }
        }
    }
    if not vec_empty(node[].members) {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_struct_members_decl(ctx, node))"
            _errval = reslv_struct_members_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
        loop .. while 0 {
            " #@MACRO@:TRY(check_struct_decl(ctx, node))"
            _errval = check_struct_decl(ctx, node)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    if struct_fmt_1 {
        " #@MACRO@:str_delete(struct_fmt_1)"
        sdsfree(struct_fmt_1)
        struct_fmt_1 = ? nil then sdsnew(nil) else nil
    }
    if struct_fmt_2 {
        " #@MACRO@:str_delete(struct_fmt_2)"
        sdsfree(struct_fmt_2)
        struct_fmt_2 = ? nil then sdsnew(nil) else nil
    }
    return _errval
}

fn reslv_fun_decl(ctx: *struc SemanticContext, node: *struc CFunDecl) i32 {
    _errval: i32 = 0
    if is_file_scope(ctx) {
        loop .. while 0 {
            " #@MACRO@:map_clear(ctx->goto_map)"
            if ctx[].goto_map {
                " #@MACRO@:map_delete(ctx->goto_map)"
                loop .. while 0 {
                    cast<none>((? (ctx[].goto_map) ~= nil then stbds_hmfree_func((ctx[].goto_map) - 1, sizeof((ctx[].goto_map)[])) else cast<none>(0)))
                    (ctx[].goto_map) = nil
                }
                ctx[].goto_map = map_new()
            }
        }
        loop .. while 0 {
            " #@MACRO@:set_clear(ctx->label_set)"
            loop .. while 0 {
                " #@MACRO@:map_clear(ctx->label_set)"
                if ctx[].label_set {
                    " #@MACRO@:map_delete(ctx->label_set)"
                    loop .. while 0 {
                        cast<none>((? (ctx[].label_set) ~= nil then stbds_hmfree_func((ctx[].label_set) - 1, sizeof((ctx[].label_set)[])) else cast<none>(0)))
                        (ctx[].label_set) = nil
                    }
                    ctx[].label_set = map_new()
                }
            }
        }
        vec_clear(ctx[].break_loop_labels)
        vec_clear(ctx[].continue_loop_labels)
        ctx[].p_switch_statement = nil
    }
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_fun_declaration(ctx, node->fun_decl))"
        _errval = reslv_fun_declaration(ctx, node[].fun_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    if is_file_scope(ctx) {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_label(ctx, node->fun_decl))"
            _errval = reslv_label(ctx, node[].fun_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_var_decl(ctx: *struc SemanticContext, node: *struc CVarDecl) i32 {
    _errval: i32 = 0
    if is_file_scope(ctx) {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_file_var_decl(ctx, node->var_decl))"
            _errval = reslv_file_var_decl(ctx, node[].var_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    else {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_block_var_decl(ctx, node->var_decl))"
            _errval = reslv_block_var_decl(ctx, node[].var_decl)
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDecl) i32 {
    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(reslv_struct_declaration(ctx, node->struct_decl))"
        _errval = reslv_struct_declaration(ctx, node[].struct_decl)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    return _errval
}

fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) i32 {
    _errval: i32 = 0
    match node[].tag {
        -> AST_CFunDecl_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_fun_decl(ctx, &node->get._CFunDecl))"
                _errval = reslv_fun_decl(ctx, @node[].get._CFunDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CVarDecl_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_var_decl(ctx, &node->get._CVarDecl))"
                _errval = reslv_var_decl(ctx, @node[].get._CVarDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        -> AST_CStructDecl_t {
            loop .. while 0 {
                " #@MACRO@:TRY(reslv_struct_decl(ctx, &node->get._CStructDecl))"
                _errval = reslv_struct_decl(ctx, @node[].get._CStructDecl)
                if _errval ~= 0 {
                    jump _Lfinally
                }
            }
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    label _Lfinally
    return _errval
}

fn resolve_program(ctx: *struc SemanticContext, node: *struc CProgram) i32 {
    _errval: i32 = 0
    enter_scope(ctx)
    loop i: u64 = 0 while i < vec_size(node[].declarations) .. ++i {
        loop .. while 0 {
            " #@MACRO@:TRY(reslv_declaration(ctx, node->declarations[i]))"
            _errval = reslv_declaration(ctx, node[].declarations[i])
            if _errval ~= 0 {
                jump _Lfinally
            }
        }
    }
    label _Lfinally
    return _errval
}

pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) i32 {
    ctx: struc SemanticContext;
    {
        ctx.errors = errors
        ctx.frontend = frontend
        ctx.identifiers = identifiers
        ctx.extern_scope_map = map_new()
        ctx.goto_map = map_new()
        ctx.scoped_identifier_maps = vec_new()
        ctx.scoped_struct_maps = vec_new()
        ctx.label_set = set_new()
        ctx.break_loop_labels = vec_new()
        ctx.continue_loop_labels = vec_new()
        ctx.fun_def_set = set_new()
        ctx.struct_def_set = set_new()
        ctx.union_def_set = set_new()
    }

    _errval: i32 = 0
    loop .. while 0 {
        " #@MACRO@:TRY(resolve_program(&ctx, node))"
        _errval = resolve_program(@ctx, node)
        if _errval ~= 0 {
            jump _Lfinally
        }
    }
    label _Lfinally
    if ctx.extern_scope_map {
        " #@MACRO@:map_delete(ctx.extern_scope_map)"
        loop .. while 0 {
            cast<none>((? (ctx.extern_scope_map) ~= nil then stbds_hmfree_func((ctx.extern_scope_map) - 1, sizeof((ctx.extern_scope_map)[])) else cast<none>(0)))
            (ctx.extern_scope_map) = nil
        }
        ctx.extern_scope_map = map_new()
    }
    if ctx.goto_map {
        " #@MACRO@:map_delete(ctx.goto_map)"
        loop .. while 0 {
            cast<none>((? (ctx.goto_map) ~= nil then stbds_hmfree_func((ctx.goto_map) - 1, sizeof((ctx.goto_map)[])) else cast<none>(0)))
            (ctx.goto_map) = nil
        }
        ctx.goto_map = map_new()
    }
    loop i: u64 = 0 while i < vec_size(ctx.scoped_identifier_maps) .. ++i {
        if ctx.scoped_identifier_maps[i] {
            " #@MACRO@:map_delete(ctx.scoped_identifier_maps[i])"
            loop .. while 0 {
                cast<none>((? (ctx.scoped_identifier_maps[i]) ~= nil then stbds_hmfree_func((ctx.scoped_identifier_maps[i]) - 1, sizeof((ctx.scoped_identifier_maps[i])[])) else cast<none>(0)))
                (ctx.scoped_identifier_maps[i]) = nil
            }
            ctx.scoped_identifier_maps[i] = map_new()
        }
    }
    vec_delete(ctx.scoped_identifier_maps)
    loop i: u64 = 0 while i < vec_size(ctx.scoped_struct_maps) .. ++i {
        if ctx.scoped_struct_maps[i] {
            " #@MACRO@:map_delete(ctx.scoped_struct_maps[i])"
            loop .. while 0 {
                cast<none>((? (ctx.scoped_struct_maps[i]) ~= nil then stbds_hmfree_func((ctx.scoped_struct_maps[i]) - 1, sizeof((ctx.scoped_struct_maps[i])[])) else cast<none>(0)))
                (ctx.scoped_struct_maps[i]) = nil
            }
            ctx.scoped_struct_maps[i] = map_new()
        }
    }
    vec_delete(ctx.scoped_struct_maps)
    loop .. while 0 {
        " #@MACRO@:set_delete(ctx.label_set)"
        if ctx.label_set {
            " #@MACRO@:map_delete(ctx.label_set)"
            loop .. while 0 {
                cast<none>((? (ctx.label_set) ~= nil then stbds_hmfree_func((ctx.label_set) - 1, sizeof((ctx.label_set)[])) else cast<none>(0)))
                (ctx.label_set) = nil
            }
            ctx.label_set = map_new()
        }
    }
    vec_delete(ctx.break_loop_labels)
    vec_delete(ctx.continue_loop_labels)
    loop .. while 0 {
        " #@MACRO@:set_delete(ctx.fun_def_set)"
        if ctx.fun_def_set {
            " #@MACRO@:map_delete(ctx.fun_def_set)"
            loop .. while 0 {
                cast<none>((? (ctx.fun_def_set) ~= nil then stbds_hmfree_func((ctx.fun_def_set) - 1, sizeof((ctx.fun_def_set)[])) else cast<none>(0)))
                (ctx.fun_def_set) = nil
            }
            ctx.fun_def_set = map_new()
        }
    }
    loop .. while 0 {
        " #@MACRO@:set_delete(ctx.struct_def_set)"
        if ctx.struct_def_set {
            " #@MACRO@:map_delete(ctx.struct_def_set)"
            loop .. while 0 {
                cast<none>((? (ctx.struct_def_set) ~= nil then stbds_hmfree_func((ctx.struct_def_set) - 1, sizeof((ctx.struct_def_set)[])) else cast<none>(0)))
                (ctx.struct_def_set) = nil
            }
            ctx.struct_def_set = map_new()
        }
    }
    loop .. while 0 {
        " #@MACRO@:set_delete(ctx.union_def_set)"
        if ctx.union_def_set {
            " #@MACRO@:map_delete(ctx.union_def_set)"
            loop .. while 0 {
                cast<none>((? (ctx.union_def_set) ~= nil then stbds_hmfree_func((ctx.union_def_set) - 1, sizeof((ctx.union_def_set)[])) else cast<none>(0)))
                (ctx.union_def_set) = nil
            }
            ctx.union_def_set = map_new()
        }
    }
    if errors[].info_at_map {
        " #@MACRO@:map_delete(errors->info_at_map)"
        loop .. while 0 {
            cast<none>((? (errors[].info_at_map) ~= nil then stbds_hmfree_func((errors[].info_at_map) - 1, sizeof((errors[].info_at_map)[])) else cast<none>(0)))
            (errors[].info_at_map) = nil
        }
        errors[].info_at_map = map_new()
    }
    loop i: u64 = 0 while i < vec_size(errors[].fopen_lines) .. ++i {
        if errors[].fopen_lines[i].filename {
            " #@MACRO@:str_delete(errors->fopen_lines[i].filename)"
            sdsfree(errors[].fopen_lines[i].filename)
            errors[].fopen_lines[i].filename = ? nil then sdsnew(nil) else nil
        }
    }
    vec_delete(errors[].fopen_lines)
    vec_delete(errors[].token_infos)
    return _errval
}
