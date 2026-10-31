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

PairKeyValue(``TIdentifier'', ``StStructure'')

type struc SemanticContext(errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext, extern_scope_map: hashmap_t(``TIdentifier'', u64), goto_map: hashmap_t(``TIdentifier'', ``TIdentifier''), scoped_identifier_maps: vector_t(hashmap_t(``TIdentifier'', ``TIdentifier'')), scoped_struct_maps: vector_t(hashmap_t(``TIdentifier'', ``StStructure'')), label_set: hashset_t(``TIdentifier''), break_loop_labels: vector_t(TIdentifier), continue_loop_labels: vector_t(TIdentifier), fun_def_name: u64, p_switch_statement: *struc CSwitch, fun_def_set: hashset_t(``TIdentifier''), struct_def_set: hashset_t(``TIdentifier''), union_def_set: hashset_t(``TIdentifier''), p_static_inits: *vector_t(shared_ptr_t(StaticInit)))

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
                THROW_ABORT
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
    return map_find(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name) ~= map_end()
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

fn is_valid_type(ctx: *struc SemanticContext, type_t: *struc Type) error_t;

fn is_valid_ptr(ctx: *struc SemanticContext, ptr_type: *struc Pointer) error_t {
    CATCH_ENTER
    TRY(is_valid_type(ctx, ptr_type[].ref_type))
    FINALLY
    CATCH_EXIT
}

fn is_valid_arr(ctx: *struc SemanticContext, arr_type: *struc Array) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_complete(ctx, arr_type[].elem_type) {
        THROW_AT_TOKEN(
            ctx[].errors[].info_at_buf, GET_SEMANTIC_MSG(2, MSG_incomplete_arr, str_fmt_arr(arr_type, @type_fmt_1),
                                            str_fmt_type(arr_type[].elem_type, @type_fmt_2)))
    }
    TRY(is_valid_type(ctx, arr_type[].elem_type))
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    CATCH_EXIT
}

fn is_valid_type(ctx: *struc SemanticContext, type_t: *struc Type) error_t {
    CATCH_ENTER
    match type_t[].tag {
        -> AST_Pointer_t {
            TRY(is_valid_ptr(ctx, @type_t[].get._Pointer))
        }
        break
        -> AST_Array_t {
            TRY(is_valid_arr(ctx, @type_t[].get._Array))
        }
        break
        -> AST_FunType_t {
            THROW_ABORT
        }
        otherwise {
            break
        }
    }
    FINALLY
    CATCH_EXIT
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
            THROW_ABORT
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
    THROW_ABORT_IF(map_find(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name) == map_end())
    return map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)[].size
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
    THROW_ABORT_IF(map_find(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name) == map_end())
    return map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)[].alignment
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
    joint_type: shared_ptr_t(Type) = sptr_new()
    if is_type_char(node_1[].exp_type) {
        exp_type: shared_ptr_t(Type) = sptr_new()
        sptr_move(Type, node_1[].exp_type, exp_type)
        node_1[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        sptr_move(Type, exp_type, node_1[].exp_type)
    }
    elif is_type_char(node_2[].exp_type) {
        exp_type: shared_ptr_t(Type) = sptr_new()
        sptr_move(Type, node_2[].exp_type, exp_type)
        node_2[].exp_type = make_Int()
        joint_type = get_joint_type(node_1, node_2)
        sptr_move(Type, exp_type, node_2[].exp_type)
    }
    elif is_same_type(node_1[].exp_type, node_2[].exp_type) {
        sptr_copy(Type, node_1[].exp_type, joint_type)
    }
    elif node_1[].exp_type[].tag == AST_Double_t or node_2[].exp_type[].tag == AST_Double_t {
        joint_type = make_Double()
    }
    else {
        type_size_1: i32 = get_scalar_size(node_1[].exp_type)
        type_size_2: i32 = get_scalar_size(node_2[].exp_type)
        if type_size_1 == type_size_2 {
            if is_type_signed(node_1[].exp_type) {
                sptr_copy(Type, node_2[].exp_type, joint_type)
            }
            else {
                sptr_copy(Type, node_1[].exp_type, joint_type)
            }
        }
        elif type_size_1 > type_size_2 {
            sptr_copy(Type, node_1[].exp_type, joint_type)
        }
        else {
            sptr_copy(Type, node_2[].exp_type, joint_type)
        }
    }
    return joint_type
}

fn get_joint_ptr_type(ctx: *struc SemanticContext, node_1: *struc CExp, node_2: *struc CExp, joint_type: **struc Type) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if is_same_type(node_1[].exp_type, node_2[].exp_type) {
        sptr_copy(Type, node_1[].exp_type, joint_type[])
    }
    elif node_1[].tag == AST_CConstant_t and is_const_null_ptr(@node_1[].get._CConstant) {
        sptr_copy(Type, node_2[].exp_type, joint_type[])
    }
    elif (node_2[].tag == AST_CConstant_t and is_const_null_ptr(@node_2[].get._CConstant)) or (node_1[].exp_type[].tag == AST_Pointer_t and node_1[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and node_2[].exp_type[].tag == AST_Pointer_t) {
        sptr_copy(Type, node_1[].exp_type, joint_type[])
    }
    elif node_2[].exp_type[].tag == AST_Pointer_t and node_2[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and node_1[].exp_type[].tag == AST_Pointer_t {
        sptr_copy(Type, node_2[].exp_type, joint_type[])
    }
    else {
        THROW_AT_TOKEN(
            node_1[].info_at, GET_SEMANTIC_MSG(2, MSG_joint_ptr_mismatch, str_fmt_type(node_1[].exp_type, @type_fmt_1),
                                  str_fmt_type(node_2[].exp_type, @type_fmt_2)))
    }
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    CATCH_EXIT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
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
            THROW_ABORT
        }
    }
}

fn get_compound_info_at(node: *struc CCompoundInit) u64 {
    THROW_ABORT_IF(vec_empty(node[].initializers))
    initializer: *struc CInitializer = node[].initializers[0]
    loop while initializer[].tag == AST_CCompoundInit_t {
        node = @initializer[].get._CCompoundInit
        THROW_ABORT_IF(vec_empty(node[].initializers))
        initializer = node[].initializers[0]
    }
    THROW_ABORT_IF(initializer[].tag ~= AST_CSingleInit_t)
    return initializer[].get._CSingleInit.exp[].info_at
}

fn reslv_struct_type(ctx: *struc SemanticContext, type_t: *struc Type) error_t;

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
            THROW_ABORT
        }
    }
}

fn check_string_exp(node: *struc CString) none {
    size: i64 = cast<i64>(vec_size(node[].literal[].value)) + 1l
    elem_type: *struc Type = make_Char()
    node[]._base[].exp_type = make_Array(size, @elem_type)
}

fn check_var_exp(ctx: *struc SemanticContext, node: *struc CVar) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    var_type: *struc Type = map_get(ctx[].frontend[].symbol_table, node[].name)[].type_t
    if var_type[].tag == AST_FunType_t {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_fun_used_as_var, str_fmt_name(node[].name, @name_fmt)))
    }
    sptr_copy(Type, var_type, node[]._base[].exp_type)
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn check_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    TRY(reslv_struct_type(ctx, node[].target_type))
    if node[].target_type[].tag ~= AST_Void_t and ((node[].exp[].exp_type[].tag == AST_Double_t and node[].target_type[].tag == AST_Pointer_t) or (node[].exp[].exp_type[].tag == AST_Pointer_t and node[].target_type[].tag == AST_Double_t) or not is_type_scalar(node[].exp[].exp_type) or not is_type_scalar(node[].target_type)) {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_illegal_cast, str_fmt_type(node[].exp[].exp_type, @type_fmt_1),
                                        str_fmt_type(node[].target_type, @type_fmt_2)))
    }
    TRY(is_valid_type(ctx, node[].target_type))
    sptr_copy(Type, node[].target_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    CATCH_EXIT
}

fn cast_exp(ctx: *struc SemanticContext, exp_type: **struc Type, exp: *unique_ptr_t(CExp)) error_t {
    exp_type_cp: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    info_at: u64 = (exp[])[].info_at
    sptr_copy(Type, exp_type[], exp_type_cp)
    exp[] = make_CCast(exp, @exp_type_cp, info_at)
    TRY(check_cast_exp(ctx, @(exp[])[].get._CCast))
    FINALLY
    free_Type(@exp_type_cp)
    CATCH_EXIT
}

fn cast_assign(ctx: *struc SemanticContext, exp_type: **struc Type, exp: *unique_ptr_t(CExp)) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if (is_type_arithmetic((exp[])[].exp_type) and is_type_arithmetic(exp_type[])) or ((exp[])[].tag == AST_CConstant_t and (exp_type[])[].tag == AST_Pointer_t and is_const_null_ptr(@(exp[])[].get._CConstant)) or ((exp_type[])[].tag == AST_Pointer_t and (exp_type[])[].get._Pointer.ref_type[].tag == AST_Void_t and (exp[])[].exp_type[].tag == AST_Pointer_t) or ((exp[])[].exp_type[].tag == AST_Pointer_t and (exp[])[].exp_type[].get._Pointer.ref_type[].tag == AST_Void_t and (exp_type[])[].tag == AST_Pointer_t) {
        TRY(cast_exp(ctx, exp_type, exp))
    }
    else {
        THROW_AT_TOKEN(
            exp[][].info_at, GET_SEMANTIC_MSG(2, MSG_illegal_cast, str_fmt_type(exp[][].exp_type, @type_fmt_1),
                                 str_fmt_type(exp_type[], @type_fmt_2)))
    }
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    CATCH_EXIT
}

fn promote_char_to_int(ctx: *struc SemanticContext, exp: *unique_ptr_t(CExp)) error_t {
    promote_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    promote_type = make_Int()
    TRY(cast_exp(ctx, @promote_type, exp))
    FINALLY
    free_Type(@promote_type)
    CATCH_EXIT
}

fn check_unary_complement_exp(ctx: *struc SemanticContext, node: *struc CUnary) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_arithmetic(node[].exp[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_invalid_unary_op, get_unop_fmt(@node[].unop),
                                                   str_fmt_type(node[].exp[].exp_type, @type_fmt)))
    }
    match node[].exp[].exp_type[].tag {
        -> AST_Double_t {
            THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_invalid_unary_op, get_unop_fmt(@node[].unop),
                                                       str_fmt_type(node[].exp[].exp_type, @type_fmt)))
        }
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    TRY(promote_char_to_int(ctx, @node[].exp))
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    sptr_copy(Type, node[].exp[].exp_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_unary_neg_exp(ctx: *struc SemanticContext, node: *struc CUnary) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_arithmetic(node[].exp[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_invalid_unary_op, get_unop_fmt(@node[].unop),
                                                   str_fmt_type(node[].exp[].exp_type, @type_fmt)))
    }
    match node[].exp[].exp_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    TRY(promote_char_to_int(ctx, @node[].exp))
                }
            }
        }
        break
        otherwise {
            break
        }
    }
    sptr_copy(Type, node[].exp[].exp_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_unary_not_exp(ctx: *struc SemanticContext, node: *struc CUnary) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_scalar(node[].exp[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_invalid_unary_op, get_unop_fmt(@node[].unop),
                                                   str_fmt_type(node[].exp[].exp_type, @type_fmt)))
    }
    node[]._base[].exp_type = make_Int()
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) error_t {
    CATCH_ENTER
    match node[].unop.tag {
        -> AST_CComplement_t {
            TRY(check_unary_complement_exp(ctx, node))
        }
        break
        -> AST_CNegate_t {
            TRY(check_unary_neg_exp(ctx, node))
        }
        break
        -> AST_CNot_t {
            TRY(check_unary_not_exp(ctx, node))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn check_binary_add_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) and is_type_int(node[].exp_right[].exp_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_right[].exp_type, common_type) {
            TRY(cast_exp(ctx, @common_type, @node[].exp_right))
        }
        sptr_copy(Type, node[].exp_left[].exp_type, node[]._base[].exp_type)
        EARLY_EXIT
    }
    elif is_type_int(node[].exp_left[].exp_type) and node[].exp_right[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_right[].exp_type[].get._Pointer.ref_type) {
        common_type = make_Long()
        if not is_same_type(node[].exp_left[].exp_type, common_type) {
            TRY(cast_exp(ctx, @common_type, @node[].exp_left))
        }
        sptr_copy(Type, node[].exp_right[].exp_type, node[]._base[].exp_type)
        EARLY_EXIT
    }
    else {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_left))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    sptr_move(Type, common_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_binary_subtract_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    elif node[].exp_left[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].exp_left[].exp_type[].get._Pointer.ref_type) {
        if is_type_int(node[].exp_right[].exp_type) {
            common_type = make_Long()
            if not is_same_type(node[].exp_right[].exp_type, common_type) {
                TRY(cast_exp(ctx, @common_type, @node[].exp_right))
            }
            sptr_copy(Type, node[].exp_left[].exp_type, node[]._base[].exp_type)
            EARLY_EXIT
        }
        elif is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) and not (node[].exp_left[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_left[].get._CConstant)) {
            common_type = make_Long()
            sptr_move(Type, common_type, node[]._base[].exp_type)
            EARLY_EXIT
        }
        else {
            THROW_AT_TOKEN(
                node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                            str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                            str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
        }
    }
    else {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_left))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    sptr_move(Type, common_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_multiply_divide_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_left))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    sptr_move(Type, common_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_remainder_bitwise_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_arithmetic(node[].exp_right[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_left))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    sptr_move(Type, common_type, node[]._base[].exp_type)
    if node[]._base[].exp_type[].tag == AST_Double_t {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_invalid_binary_op, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[]._base[].exp_type, @type_fmt_1)))
    }
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_binary_bitshift_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_arithmetic(node[].exp_left[].exp_type) or not is_type_int(node[].exp_right[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    elif is_type_char(node[].exp_left[].exp_type) {
        TRY(promote_char_to_int(ctx, @node[].exp_left))
    }
    if not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) {
        TRY(cast_exp(ctx, @node[].exp_left[].exp_type, @node[].exp_right))
    }
    sptr_copy(Type, node[].exp_left[].exp_type, node[]._base[].exp_type)
    if node[]._base[].exp_type[].tag == AST_Double_t {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_invalid_binary_op, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[]._base[].exp_type, @type_fmt_1)))
    }
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    CATCH_EXIT
}

fn check_bitshift_right_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    CATCH_ENTER
    TRY(check_binary_bitshift_exp(ctx, node))
    if is_type_signed(node[].exp_left[].exp_type) {
        node[].binop = init_CBitShrArithmetic()
    }
    FINALLY
    CATCH_EXIT
}

fn check_binary_logical_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    node[]._base[].exp_type = make_Int()
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    CATCH_EXIT
}

fn check_binary_equality_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if node[].exp_left[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        TRY(get_joint_ptr_type(ctx, node[].exp_left, node[].exp_right, @common_type))
    }
    elif is_type_arithmetic(node[].exp_left[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_left, node[].exp_right)
    }
    else {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_left))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    node[]._base[].exp_type = make_Int()
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_binary_relational_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if not is_type_scalar(node[].exp_left[].exp_type) or not is_type_scalar(node[].exp_right[].exp_type) or (node[].exp_left[].exp_type[].tag == AST_Pointer_t and (not is_same_type(node[].exp_left[].exp_type, node[].exp_right[].exp_type) or (node[].exp_left[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_left[].get._CConstant)) or (node[].exp_right[].tag == AST_CConstant_t and is_const_null_ptr(@node[].exp_right[].get._CConstant)))) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_invalid_binary_ops, get_binop_fmt(@node[].binop),
                                                   str_fmt_type(node[].exp_left[].exp_type, @type_fmt_1),
                                                   str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    common_type = get_joint_type(node[].exp_left, node[].exp_right)
    if not is_same_type(node[].exp_left[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_left))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    node[]._base[].exp_type = make_Int()
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    CATCH_ENTER
    match node[].binop.tag {
        -> AST_CAdd_t {
            TRY(check_binary_add_exp(ctx, node))
        }
        break
        -> AST_CSubtract_t {
            TRY(check_binary_subtract_exp(ctx, node))
        }
        break
        -> AST_CMultiply_t {
            -> AST_CDivide_t {
                TRY(check_multiply_divide_exp(ctx, node))
            }
        }
        break
        -> AST_CRemainder_t {
            -> AST_CBitAnd_t {
                -> AST_CBitOr_t {
                    -> AST_CBitXor_t {
                        TRY(check_remainder_bitwise_exp(ctx, node))
                    }
                }
            }
        }
        break
        -> AST_CBitShiftLeft_t {
            TRY(check_binary_bitshift_exp(ctx, node))
        }
        break
        -> AST_CBitShiftRight_t {
            TRY(check_bitshift_right_exp(ctx, node))
        }
        break
        -> AST_CAnd_t {
            -> AST_COr_t {
                TRY(check_binary_logical_exp(ctx, node))
            }
        }
        break
        -> AST_CEqual_t {
            -> AST_CNotEqual_t {
                TRY(check_binary_equality_exp(ctx, node))
            }
        }
        break
        -> AST_CLessThan_t {
            -> AST_CLessOrEqual_t {
                -> AST_CGreaterThan_t {
                    -> AST_CGreaterOrEqual_t {
                        TRY(check_binary_relational_exp(ctx, node))
                    }
                }
            }
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn check_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) error_t {
    CATCH_ENTER
    if node[].exp_left {
        if node[].exp_left[].exp_type[].tag == AST_Void_t {
            THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(0, MSG_assign_to_void))
        }
        elif not is_exp_lvalue(node[].exp_left) {
            THROW_AT_TOKEN(
                node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_assign_to_rvalue, get_assign_fmt(nil, @node[].unop)))
        }
        elif not is_same_type(node[].exp_right[].exp_type, node[].exp_left[].exp_type) {
            TRY(cast_assign(ctx, @node[].exp_left[].exp_type, @node[].exp_right))
        }
        sptr_copy(Type, node[].exp_left[].exp_type, node[]._base[].exp_type)
    }
    else {
        THROW_ABORT_IF(node[].exp_right[].tag ~= AST_CBinary_t)
        exp_left: *struc CExp = node[].exp_right[].get._CBinary.exp_left
        if exp_left[].tag == AST_CCast_t {
            exp_left = exp_left[].get._CCast.exp
        }
        if not is_exp_lvalue(exp_left) {
            THROW_AT_TOKEN(
                node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_assign_to_rvalue,
                                            get_assign_fmt(@node[].exp_right[].get._CBinary.binop, @node[].unop)))
        }
        elif not is_same_type(node[].exp_right[].exp_type, exp_left[].exp_type) {
            TRY(cast_assign(ctx, @exp_left[].exp_type, @node[].exp_right))
        }
        sptr_copy(Type, exp_left[].exp_type, node[]._base[].exp_type)
    }
    FINALLY
    CATCH_EXIT
}

fn check_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    common_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if not is_type_scalar(node[].condition[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at,
            GET_SEMANTIC_MSG(1, MSG_invalid_condition, str_fmt_type(node[].condition[].exp_type, @type_fmt_1)))
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Void_t and node[].exp_right[].exp_type[].tag == AST_Void_t {
        sptr_copy(Type, node[].exp_middle[].exp_type, node[]._base[].exp_type)
        EARLY_EXIT
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Structure_t or node[].exp_right[].exp_type[].tag == AST_Structure_t {
        if not is_same_type(node[].exp_middle[].exp_type, node[].exp_right[].exp_type) {
            THROW_AT_TOKEN(node[]._base[].info_at,
                GET_SEMANTIC_MSG(2, MSG_invalid_ternary_op, str_fmt_type(node[].exp_middle[].exp_type, @type_fmt_1),
                    str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
        }
        sptr_copy(Type, node[].exp_middle[].exp_type, node[]._base[].exp_type)
        EARLY_EXIT
    }
    if is_type_arithmetic(node[].exp_middle[].exp_type) and is_type_arithmetic(node[].exp_right[].exp_type) {
        common_type = get_joint_type(node[].exp_middle, node[].exp_right)
    }
    elif node[].exp_middle[].exp_type[].tag == AST_Pointer_t or node[].exp_right[].exp_type[].tag == AST_Pointer_t {
        TRY(get_joint_ptr_type(ctx, node[].exp_middle, node[].exp_right, @common_type))
    }
    else {
        THROW_AT_TOKEN(node[]._base[].info_at,
            GET_SEMANTIC_MSG(2, MSG_invalid_ternary_op, str_fmt_type(node[].exp_middle[].exp_type, @type_fmt_1),
                str_fmt_type(node[].exp_right[].exp_type, @type_fmt_2)))
    }
    if not is_same_type(node[].exp_middle[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_middle))
    }
    if not is_same_type(node[].exp_right[].exp_type, common_type) {
        TRY(cast_exp(ctx, @common_type, @node[].exp_right))
    }
    sptr_move(Type, common_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@common_type)
    CATCH_EXIT
}

fn check_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) error_t {
    name_fmt: string_t = str_new(nil)
    strto_fmt_1: string_t = str_new(nil)
    strto_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    fun_symbol: *struc Symbol = map_get(ctx[].frontend[].symbol_table, node[].name)
    fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
    if fun_symbol[].type_t[].tag ~= AST_FunType_t {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_var_used_as_fun, str_fmt_name(node[].name, @name_fmt)))
    }
    elif vec_size(fun_type[].param_types) ~= vec_size(node[].args) {
        strto_fmt_1 = str_to_string(vec_size(node[].args))
        strto_fmt_2 = str_to_string(vec_size(fun_type[].param_types))
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(3, MSG_call_with_wrong_argc,
                                                   str_fmt_name(node[].name, @name_fmt), strto_fmt_1, strto_fmt_2))
    }
    loop i: u64 = 0 while i < vec_size(node[].args) .. ++i {
        if not is_same_type(node[].args[i][].exp_type, fun_type[].param_types[i]) {
            TRY(cast_assign(ctx, @fun_type[].param_types[i], @node[].args[i]))
        }
    }
    sptr_copy(Type, fun_type[].ret_type, node[]._base[].exp_type)
    FINALLY
    str_delete(name_fmt)
    str_delete(strto_fmt_1)
    str_delete(strto_fmt_2)
    CATCH_EXIT
}

fn check_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if node[].exp[].exp_type[].tag ~= AST_Pointer_t {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_deref_not_ptr, str_fmt_type(node[].exp[].exp_type, @type_fmt)))
    }
    sptr_copy(Type, node[].exp[].exp_type[].get._Pointer.ref_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_addrof_exp(ctx: *struc SemanticContext, node: *struc CAddrOf) error_t {
    ref_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if not is_exp_lvalue(node[].exp) {
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(0, MSG_addrof_rvalue))
    }
    sptr_copy(Type, node[].exp[].exp_type, ref_type)
    node[]._base[].exp_type = make_Pointer(@ref_type)
    FINALLY
    free_Type(@ref_type)
    CATCH_EXIT
}

fn check_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) error_t {
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    ref_type: shared_ptr_t(Type) = sptr_new()
    subscript_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if node[].primary_exp[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].primary_exp[].exp_type[].get._Pointer.ref_type) and is_type_int(node[].subscript_exp[].exp_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].subscript_exp[].exp_type, subscript_type) {
            TRY(cast_exp(ctx, @subscript_type, @node[].subscript_exp))
        }
        sptr_copy(Type, node[].primary_exp[].exp_type[].get._Pointer.ref_type, ref_type)
    }
    elif is_type_int(node[].primary_exp[].exp_type) and node[].subscript_exp[].exp_type[].tag == AST_Pointer_t and is_type_complete(ctx, node[].subscript_exp[].exp_type[].get._Pointer.ref_type) {
        subscript_type = make_Long()
        if not is_same_type(node[].primary_exp[].exp_type, subscript_type) {
            TRY(cast_exp(ctx, @subscript_type, @node[].primary_exp))
        }
        sptr_copy(Type, node[].subscript_exp[].exp_type[].get._Pointer.ref_type, ref_type)
    }
    else {
        THROW_AT_TOKEN(node[]._base[].info_at,
            GET_SEMANTIC_MSG(2, MSG_invalid_subscript, str_fmt_type(node[].primary_exp[].exp_type, @type_fmt_1),
                str_fmt_type(node[].subscript_exp[].exp_type, @type_fmt_2)))
    }
    sptr_move(Type, ref_type, node[]._base[].exp_type)
    FINALLY
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_Type(@ref_type)
    free_Type(@subscript_type)
    CATCH_EXIT
}

fn check_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_complete(ctx, node[].exp[].exp_type) {
        THROW_AT_TOKEN(node[]._base[].info_at,
            GET_SEMANTIC_MSG(1, MSG_sizeof_incomplete, str_fmt_type(node[].exp[].exp_type, @type_fmt)))
    }
    node[]._base[].exp_type = make_ULong()
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    ctx[].errors[].info_at_buf = node[]._base[].info_at
    TRY(reslv_struct_type(ctx, node[].target_type))
    if not is_type_complete(ctx, node[].target_type) {
        THROW_AT_TOKEN(node[]._base[].info_at,
            GET_SEMANTIC_MSG(1, MSG_sizeof_incomplete, str_fmt_type(node[].target_type, @type_fmt)))
    }
    TRY(is_valid_type(ctx, node[].target_type))
    node[]._base[].exp_type = make_ULong()
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].structure[].exp_type[].tag ~= AST_Structure_t {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_dot_not_struct, str_fmt_name(node[].member, @name_fmt),
                                        str_fmt_type(node[].structure[].exp_type, @type_fmt)))
    }
    struct_type = @node[].structure[].exp_type[].get._Structure
    struct_typedef = map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)
    map_it = map_find(struct_typedef[].members, node[].member)
    if map_it == map_end() {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_member_not_in_struct, str_fmt_struct(struct_type, @type_fmt),
                                        str_fmt_name(node[].member, @name_fmt)))
    }
    member_type = pair_second(struct_typedef[].members[map_it])[].member_type
    sptr_copy(Type, member_type, node[]._base[].exp_type)
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    ptr_type: *struc Pointer;
    struct_type: *struc Structure;
    struct_typedef: *struc StructTypedef;
    member_type: *struc Type;
    map_it: i64;
    if node[].pointer[].exp_type[].tag ~= AST_Pointer_t {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_arrow_not_struct_ptr, str_fmt_name(node[].member, @name_fmt),
                                        str_fmt_type(node[].pointer[].exp_type, @type_fmt)))
    }
    ptr_type = @node[].pointer[].exp_type[].get._Pointer
    if ptr_type[].ref_type[].tag ~= AST_Structure_t {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_arrow_not_struct_ptr, str_fmt_name(node[].member, @name_fmt),
                                        str_fmt_type(node[].pointer[].exp_type, @type_fmt)))
    }
    struct_type = @ptr_type[].ref_type[].get._Structure
    map_it = map_find(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)
    if map_it == map_end() {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_arrow_incomplete, str_fmt_name(node[].member, @name_fmt),
                                        str_fmt_struct(struct_type, @type_fmt)))
    }
    struct_typedef = pair_second(ctx[].frontend[].struct_typedef_table[map_it])
    map_it = map_find(struct_typedef[].members, node[].member)
    if map_it == map_end() {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_member_not_in_struct, str_fmt_struct(struct_type, @type_fmt),
                                        str_fmt_name(node[].member, @name_fmt)))
    }
    member_type = pair_second(struct_typedef[].members[map_it])[].member_type
    sptr_copy(Type, member_type, node[]._base[].exp_type)
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_arr_typed_exp(addrof: *unique_ptr_t(CExp)) none {
    {
        ref_type: shared_ptr_t(Type) = sptr_new()
        sptr_copy(Type, (addrof[])[].exp_type[].get._Array.elem_type, ref_type)
        free_Type(@(addrof[])[].exp_type)
        (addrof[])[].exp_type = make_Pointer(@ref_type)
    }
    info_at: u64 = (addrof[])[].info_at
    addrof[] = make_CAddrOf(addrof, info_at)
    sptr_copy(Type, (addrof[])[].get._CAddrOf.exp[].exp_type, (addrof[])[].exp_type)
}

fn check_struct_typed_exp(ctx: *struc SemanticContext, node: *struc CExp) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_struct_complete(ctx, @node[].exp_type[].get._Structure) {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_exp_incomplete, str_fmt_type(node[].exp_type, @type_fmt)))
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_typed_exp(ctx: *struc SemanticContext, exp: *unique_ptr_t(CExp)) error_t {
    CATCH_ENTER
    match (exp[])[].exp_type[].tag {
        -> AST_Array_t {
            check_arr_typed_exp(exp)
        }
        break
        -> AST_Structure_t {
            TRY(check_struct_typed_exp(ctx, exp[]))
        }
        break
        otherwise {
            break
        }
    }
    FINALLY
    CATCH_EXIT
}

fn check_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    fun_type: *struc FunType = @map_get(ctx[].frontend[].symbol_table, ctx[].fun_def_name)[].type_t[].get._FunType
    if fun_type[].ret_type[].tag == AST_Void_t {
        if node[].exp {
            THROW_AT_TOKEN(node[].info_at,
                GET_SEMANTIC_MSG(1, MSG_ret_value_in_void_fun, str_fmt_name(ctx[].fun_def_name, @name_fmt)))
        }
        EARLY_EXIT
    }
    elif not node[].exp {
        THROW_AT_TOKEN(
            node[].info_at, GET_SEMANTIC_MSG(2, MSG_no_ret_value_in_fun, str_fmt_name(ctx[].fun_def_name, @name_fmt),
                                str_fmt_type(fun_type[].ret_type, @type_fmt)))
    }
    elif not is_same_type(node[].exp[].exp_type, fun_type[].ret_type) {
        TRY(cast_assign(ctx, @fun_type[].ret_type, @node[].exp))
    }
    TRY(check_typed_exp(ctx, @node[].exp))
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_if_statement(ctx: *struc SemanticContext, node: *struc CIf) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        THROW_AT_TOKEN(node[].condition[].info_at,
            GET_SEMANTIC_MSG(1, MSG_invalid_if, str_fmt_type(node[].condition[].exp_type, @type_fmt)))
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        THROW_AT_TOKEN(node[].condition[].info_at,
            GET_SEMANTIC_MSG(1, MSG_invalid_while, str_fmt_type(node[].condition[].exp_type, @type_fmt)))
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        THROW_AT_TOKEN(node[].condition[].info_at,
            GET_SEMANTIC_MSG(1, MSG_invalid_do_while, str_fmt_type(node[].condition[].exp_type, @type_fmt)))
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_for_statement(ctx: *struc SemanticContext, node: *struc CFor) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if node[].condition and not is_type_scalar(node[].condition[].exp_type) {
        THROW_AT_TOKEN(node[].condition[].info_at,
            GET_SEMANTIC_MSG(1, MSG_invalid_for, str_fmt_type(node[].condition[].exp_type, @type_fmt)))
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_switch_int_cases(ctx: *struc SemanticContext, node: *struc CSwitch) error_t {
    strto_fmt: string_t = str_new(nil)
    values: vector_t(i32) = vec_new()
    CATCH_ENTER
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        THROW_ABORT_IF(node[].cases[i][].tag ~= AST_CConstant_t)
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_int_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = str_to_string(values[i])
                THROW_AT_TOKEN(node[].cases[i][].info_at, GET_SEMANTIC_MSG(1, MSG_duplicate_case_value, strto_fmt))
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstInt(values[i])
        sptr_copy(Type, node[].lookup[].exp_type, esac[]._base[].exp_type)
    }
    FINALLY
    str_delete(strto_fmt)
    vec_delete(values)
    CATCH_EXIT
}

fn check_switch_long_cases(ctx: *struc SemanticContext, node: *struc CSwitch) error_t {
    strto_fmt: string_t = str_new(nil)
    values: vector_t(i64) = vec_new()
    CATCH_ENTER
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        THROW_ABORT_IF(node[].cases[i][].tag ~= AST_CConstant_t)
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_long_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = str_to_string(values[i])
                THROW_AT_TOKEN(node[].cases[i][].info_at, GET_SEMANTIC_MSG(1, MSG_duplicate_case_value, strto_fmt))
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstLong(values[i])
        sptr_copy(Type, node[].lookup[].exp_type, esac[]._base[].exp_type)
    }
    FINALLY
    str_delete(strto_fmt)
    vec_delete(values)
    CATCH_EXIT
}

fn check_switch_uint_cases(ctx: *struc SemanticContext, node: *struc CSwitch) error_t {
    strto_fmt: string_t = str_new(nil)
    values: vector_t(u32) = vec_new()
    CATCH_ENTER
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        THROW_ABORT_IF(node[].cases[i][].tag ~= AST_CConstant_t)
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_uint_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = str_to_string(values[i])
                THROW_AT_TOKEN(node[].cases[i][].info_at, GET_SEMANTIC_MSG(1, MSG_duplicate_case_value, strto_fmt))
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstUInt(values[i])
        sptr_copy(Type, node[].lookup[].exp_type, esac[]._base[].exp_type)
    }
    FINALLY
    str_delete(strto_fmt)
    vec_delete(values)
    CATCH_EXIT
}

fn check_switch_ulong_cases(ctx: *struc SemanticContext, node: *struc CSwitch) error_t {
    strto_fmt: string_t = str_new(nil)
    values: vector_t(u64) = vec_new()
    CATCH_ENTER
    vec_resize(values, vec_size(node[].cases))
    loop i: u64 = 0 while i < vec_size(values) .. ++i {
        THROW_ABORT_IF(node[].cases[i][].tag ~= AST_CConstant_t)
        esac: *struc CConstant = @node[].cases[i][].get._CConstant
        values[i] = get_const_ulong_value(esac)
        loop j: u64 = 0 while j < i .. ++j {
            if values[i] == values[j] {
                strto_fmt = str_to_string(values[i])
                THROW_AT_TOKEN(node[].cases[i][].info_at, GET_SEMANTIC_MSG(1, MSG_duplicate_case_value, strto_fmt))
            }
        }
        free_CConst(@esac[].constant)
        esac[].constant = make_CConstULong(values[i])
        sptr_copy(Type, node[].lookup[].exp_type, esac[]._base[].exp_type)
    }
    FINALLY
    str_delete(strto_fmt)
    vec_delete(values)
    CATCH_EXIT
}

fn check_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_int(node[].lookup[].exp_type) {
        THROW_AT_TOKEN(node[].lookup[].info_at,
            GET_SEMANTIC_MSG(1, MSG_invalid_switch, str_fmt_type(node[].lookup[].exp_type, @type_fmt)))
    }
    match node[].lookup[].exp_type[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_UChar_t {
                    TRY(promote_char_to_int(ctx, @node[].lookup))
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
            TRY(check_switch_int_cases(ctx, node))
        }
        break
        -> AST_Long_t {
            TRY(check_switch_long_cases(ctx, node))
        }
        break
        -> AST_UInt_t {
            TRY(check_switch_uint_cases(ctx, node))
        }
        break
        -> AST_ULong_t {
            TRY(check_switch_ulong_cases(ctx, node))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_bound_string_init(ctx: *struc SemanticContext, node: *struc CString, arr_type: *struc Array) error_t {
    type_fmt: string_t = str_new(nil)
    strto_fmt_1: string_t = str_new(nil)
    strto_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if not is_type_char(arr_type[].elem_type) {
        THROW_AT_TOKEN(
            node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_string_init_not_char_arr, str_fmt_arr(arr_type, @type_fmt)))
    }
    elif vec_size(node[].literal[].value) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = str_to_string(arr_type[].size)
        strto_fmt_2 = str_to_string(vec_size(node[].literal[].value))
        THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_string_init_overflow, strto_fmt_1, strto_fmt_2))
    }
    FINALLY
    str_delete(type_fmt)
    str_delete(strto_fmt_1)
    str_delete(strto_fmt_2)
    CATCH_EXIT
}

fn check_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) error_t {
    CATCH_ENTER
    if not is_same_type(node[].exp[].exp_type, init_type[]) {
        TRY(cast_assign(ctx, init_type, @node[].exp))
    }
    sptr_copy(Type, init_type[], node[]._base[].init_type)
    FINALLY
    CATCH_EXIT
}

fn check_string_init(node: *struc CSingleInit, init_type: **struc Type) none {
    sptr_copy(Type, init_type[], node[].exp[].exp_type)
    sptr_copy(Type, init_type[], node[]._base[].init_type)
}
fn check_zero_init(ctx: *struc SemanticContext, init_type: *struc Type) *struc CInitializer;

fn check_single_zero_init(elem_type: *struc Type) *struc CInitializer {
    exp: unique_ptr_t(CExp) = uptr_new()
    {
        constant: shared_ptr_t(CConst) = sptr_new()
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
                THROW_ABORT
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
    struct_typedef: *struc StructTypedef = map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)
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

fn check_bound_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) error_t {
    type_fmt: string_t = str_new(nil)
    strto_fmt_1: string_t = str_new(nil)
    strto_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    if vec_size(node[].initializers) > cast<u64>(arr_type[].size) {
        strto_fmt_1 = str_to_string(arr_type[].size)
        strto_fmt_2 = str_to_string(vec_size(node[].initializers))
        THROW_AT_TOKEN(get_compound_info_at(node),
            GET_SEMANTIC_MSG(3, MSG_arr_init_overflow, strto_fmt_1, str_fmt_arr(arr_type, @type_fmt), strto_fmt_2))
    }
    FINALLY
    str_delete(type_fmt)
    str_delete(strto_fmt_1)
    str_delete(strto_fmt_2)
    CATCH_EXIT
}

fn check_bound_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) error_t {
    type_fmt: string_t = str_new(nil)
    strto_fmt_1: string_t = str_new(nil)
    strto_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    struct_typedef: *struc StructTypedef = map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)
    bound: u64 = ? struct_type[].is_union then 1 else map_size(struct_typedef[].members)
    if vec_size(node[].initializers) > bound {
        strto_fmt_1 = str_to_string(vec_size(node[].initializers))
        strto_fmt_2 = str_to_string(bound)
        THROW_AT_TOKEN(
            get_compound_info_at(node), GET_SEMANTIC_MSG(3, MSG_struct_init_overflow,
                                            str_fmt_struct(struct_type, @type_fmt), strto_fmt_1, strto_fmt_2))
    }
    FINALLY
    str_delete(type_fmt)
    str_delete(strto_fmt_1)
    str_delete(strto_fmt_2)
    CATCH_EXIT
}

fn check_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) none {
    loop while vec_size(node[].initializers) < cast<u64>(arr_type[].size) {
        zero_init: *struc CInitializer = check_zero_init(ctx, arr_type[].elem_type)
        vec_move_back(node[].initializers, zero_init)
    }
    sptr_copy(Type, init_type[], node[]._base[].init_type)
}

fn check_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) none {
    struct_typedef: *struc StructTypedef = map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)
    loop i: u64 = vec_size(node[].initializers) while i < map_size(struct_typedef[].members) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        zero_init: *struc CInitializer = check_zero_init(ctx, member[].member_type)
        vec_move_back(node[].initializers, zero_init)
    }
    sptr_copy(Type, init_type[], node[]._base[].init_type)
}

fn check_ret_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    ctx[].errors[].info_at_buf = node[].info_at
    TRY(reslv_struct_type(ctx, fun_type[].ret_type))
    TRY(is_valid_type(ctx, fun_type[].ret_type))
    match fun_type[].ret_type[].tag {
        -> AST_Array_t {
            THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(2, MSG_ret_arr, str_fmt_name(node[].name, @name_fmt),
                                               str_fmt_type(fun_type[].ret_type, @type_fmt)))
        }
        -> AST_Structure_t {
            if node[].body and not is_struct_complete(ctx, @fun_type[].ret_type[].get._Structure) {
                THROW_AT_TOKEN(
                    node[].info_at, GET_SEMANTIC_MSG(2, MSG_ret_incomplete, str_fmt_name(node[].name, @name_fmt),
                                        str_fmt_type(fun_type[].ret_type, @type_fmt)))
            }
            break
        }
        otherwise {
            break
        }
    }
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_arr_param_decl(fun_type: *struc FunType, i: u64) none {
    ref_type: shared_ptr_t(Type) = sptr_new()
    sptr_copy(Type, fun_type[].param_types[i][].get._Array.elem_type, ref_type)
    free_Type(@fun_type[].param_types[i])
    fun_type[].param_types[i] = make_Pointer(@ref_type)
}

fn check_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) error_t {
    name_fmt_1: string_t = str_new(nil)
    name_fmt_2: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    param_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
    symbol: unique_ptr_t(Symbol) = uptr_new()
    param_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    fun_type: *struc FunType = @node[].fun_type[].get._FunType
    loop i: u64 = 0 while i < vec_size(node[].params) .. ++i {
        ctx[].errors[].info_at_buf = node[].info_at
        TRY(reslv_struct_type(ctx, fun_type[].param_types[i]))
        if fun_type[].param_types[i][].tag == AST_Void_t {
            THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(2, MSG_void_param, str_fmt_name(node[].name, @name_fmt_1),
                                               str_fmt_name(node[].params[i], @name_fmt_2)))
        }
        TRY(is_valid_type(ctx, fun_type[].param_types[i]))
        if fun_type[].param_types[i][].tag == AST_Array_t {
            check_arr_param_decl(fun_type, i)
        }
        if node[].body {
            if fun_type[].param_types[i][].tag == AST_Structure_t and not is_struct_complete(ctx, @fun_type[].param_types[i][].get._Structure) {
                THROW_AT_TOKEN(node[].info_at,
                    GET_SEMANTIC_MSG(3, MSG_incomplete_param, str_fmt_name(node[].name, @name_fmt_1),
                        str_fmt_name(node[].params[i], @name_fmt_2), str_fmt_type(fun_type[].param_types[i], @type_fmt)))
            }
            sptr_copy(Type, fun_type[].param_types[i], param_type)
            param_attrs = make_LocalAttr()
            THROW_ABORT_IF(map_find(ctx[].frontend[].symbol_table, node[].params[i]) ~= map_end())
            symbol = make_Symbol(@param_type, @param_attrs)
            map_move_add(ctx[].frontend[].symbol_table, node[].params[i], symbol)
        }
    }
    FINALLY
    str_delete(name_fmt_1)
    str_delete(name_fmt_2)
    str_delete(type_fmt)
    free_IdentifierAttr(@param_attrs)
    free_Symbol(@symbol)
    free_Type(@param_type)
    CATCH_EXIT
}

fn check_fun_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    glob_fun_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
    symbol: unique_ptr_t(Symbol) = uptr_new()
    glob_fun_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    THROW_ABORT_IF(node[].fun_type[].tag == AST_Void_t)
    is_def: i32 = set_find(ctx[].fun_def_set, node[].name) ~= set_end()
    is_glob: i32 = node[].storage_class.tag ~= AST_CStatic_t
    map_it: i64 = map_find(ctx[].frontend[].symbol_table, node[].name)
    if map_it ~= map_end() {
        fun_symbol: *struc Symbol = pair_second(ctx[].frontend[].symbol_table[map_it])
        fun_type: *struc FunType = @fun_symbol[].type_t[].get._FunType
        if not (fun_symbol[].type_t[].tag == AST_FunType_t and vec_size(fun_type[].param_types) == vec_size(node[].params) and is_same_fun_type(@node[].fun_type[].get._FunType, fun_type)) {
            THROW_AT_TOKEN(node[].info_at,
                GET_SEMANTIC_MSG(3, MSG_redecl_fun_conflict, str_fmt_name(node[].name, @name_fmt),
                    str_fmt_type(node[].fun_type, @type_fmt_1), str_fmt_type(fun_symbol[].type_t, @type_fmt_2)))
        }
        elif is_def and node[].body {
            THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(2, MSG_redef_fun, str_fmt_name(node[].name, @name_fmt),
                                               str_fmt_type(node[].fun_type, @type_fmt_1)))
        }
        fun_attrs: *struc FunAttr = @fun_symbol[].attrs[].get._FunAttr
        if not is_glob and fun_attrs[].is_glob {
            THROW_AT_TOKEN(
                node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_static_conflict, str_fmt_name(node[].name, @name_fmt)))
        }
        is_glob = fun_attrs[].is_glob
        free_Symbol(@fun_symbol)
    }
    if node[].body {
        set_insert(ctx[].fun_def_set, node[].name)
        is_def = true
        ctx[].fun_def_name = node[].name
    }
    sptr_copy(Type, node[].fun_type, glob_fun_type)
    glob_fun_attrs = make_FunAttr(is_def, is_glob)
    symbol = make_Symbol(@glob_fun_type, @glob_fun_attrs)
    map_move_add(ctx[].frontend[].symbol_table, node[].name, symbol)
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_IdentifierAttr(@glob_fun_attrs)
    free_Symbol(@symbol)
    free_Type(@glob_fun_type)
    CATCH_EXIT
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

fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) error_t;

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
    strto_binary: string_t = str_to_string(binary)
    return make_string_identifier(ctx[].identifiers, @strto_binary)
}

fn check_static_const_init(ctx: *struc SemanticContext, node: *struc CConstant, static_init_type: *struc Type) error_t {
    type_fmt: string_t = str_new(nil)
    strto_fmt: string_t = str_new(nil)
    CATCH_ENTER
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
                    THROW_AT_TOKEN(node[]._base[].info_at,
                        GET_SEMANTIC_MSG(2, MSG_static_ptr_init_not_int, str_fmt_type(static_init_type, @type_fmt),
                            get_const_fmt(node[].constant)))
                        }
                    }
                }
                otherwise {
                    break
                }
            }
            value: u64 = get_const_ptr_value(node)
            if value ~= 0ul {
                strto_fmt = str_to_string(value)
                THROW_AT_TOKEN(node[]._base[].info_at, GET_SEMANTIC_MSG(2, MSG_static_ptr_init_not_null,
                                                           str_fmt_type(static_init_type, @type_fmt), strto_fmt))
            }
            push_zero_static_init(ctx, 8l)
            break
        }
        otherwise {
            THROW_AT_TOKEN(node[]._base[].info_at,
                GET_SEMANTIC_MSG(1, MSG_agg_init_with_single, str_fmt_type(static_init_type, @type_fmt)))
        }
    }
    FINALLY
    str_delete(type_fmt)
    str_delete(strto_fmt)
    CATCH_EXIT
}

fn check_literal_string_init(ctx: *struc SemanticContext, node: *struc CString, static_ptr_type: *struc Pointer) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if static_ptr_type[].ref_type[].tag ~= AST_Char_t {
        THROW_AT_TOKEN(node[]._base[].info_at,
            GET_SEMANTIC_MSG(1, MSG_static_ptr_init_string, str_fmt_ptr(static_ptr_type, @type_fmt)))
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn make_literal_identifier(ctx: *struc SemanticContext, node: *struc CStringLiteral) u64 {
    value: string_t = string_literal_to_const(node[].value)
    return make_string_identifier(ctx[].identifiers, @value)
}

fn check_static_ptr_string_init(ctx: *struc SemanticContext, node: *struc CString) none {
    string_const_label: u64;
    {
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        map_it: i64 = map_find(ctx[].frontend[].string_const_table, string_const)
        if map_it ~= map_end() {
            string_const_label = pair_second(ctx[].frontend[].string_const_table[map_it])
        }
        else {
            string_const_label = repr_label_identifier(ctx[].identifiers, LBL_Lstring)
            map_add(ctx[].frontend[].string_const_table, string_const, string_const_label)

            constant_type: shared_ptr_t(Type) = sptr_new()
            {
                size: i64 = cast<i64>(vec_size(node[].literal[].value)) + 1l
                elem_type: *struc Type = make_Char()
                constant_type = make_Array(size, @elem_type)
            }

            constant_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
            {
                static_init: shared_ptr_t(StaticInit) = sptr_new()
                {
                    literal: shared_ptr_t(CStringLiteral) = sptr_new()
                    sptr_copy(CStringLiteral, node[].literal, literal)
                    static_init = make_StringInit(string_const, true, @literal)
                }

                constant_attrs = make_ConstantAttr(@static_init)
            }
            symbol: *struc Symbol = make_Symbol(@constant_type, @constant_attrs)
            map_move_add(ctx[].frontend[].symbol_table, string_const_label, symbol)
        }
    }
    push_static_init(ctx, make_PointerInit(string_const_label))
}

fn check_static_arr_string_init(ctx: *struc SemanticContext, node: *struc CString, static_arr_type: *struc Array) error_t {
    literal: shared_ptr_t(CStringLiteral) = sptr_new()
    CATCH_ENTER
    byte: i64;
    TRY(check_bound_string_init(ctx, node, static_arr_type))
    byte = static_arr_type[].size - cast<i64>(vec_size(node[].literal[].value)) - 1l
    {
        is_null_term: i32 = byte >= 0l
        string_const: u64 = make_literal_identifier(ctx, node[].literal)
        sptr_copy(CStringLiteral, node[].literal, literal)
        push_static_init(ctx, make_StringInit(string_const, is_null_term, @literal))
    }
    if byte > 0l {
        push_zero_static_init(ctx, byte)
    }
    FINALLY
    free_CStringLiteral(@literal)
    CATCH_EXIT
}

fn check_static_string_init(ctx: *struc SemanticContext, node: *struc CString, static_init_type: *struc Type) error_t {
    CATCH_ENTER
    match static_init_type[].tag {
        -> AST_Pointer_t {
            TRY(check_literal_string_init(ctx, node, @static_init_type[].get._Pointer))
        }
        check_static_ptr_string_init(ctx, node)
        break
        -> AST_Array_t {
            TRY(check_static_arr_string_init(ctx, node, @static_init_type[].get._Array))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn check_single_static_init(ctx: *struc SemanticContext, node: *struc CSingleInit, static_init_type: *struc Type) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    match node[].exp[].tag {
        -> AST_CConstant_t {
            TRY(check_static_const_init(ctx, @node[].exp[].get._CConstant, static_init_type))
        }
        break
        -> AST_CString_t {
            TRY(check_static_string_init(ctx, @node[].exp[].get._CString, static_init_type))
        }
        break
        otherwise {
            THROW_AT_TOKEN(node[].exp[].info_at,
                GET_SEMANTIC_MSG(1, MSG_static_init_not_const, str_fmt_type(static_init_type, @type_fmt)))
        }
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_static_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array) error_t {
    CATCH_ENTER
    TRY(check_bound_arr_init(ctx, node, arr_type))
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        TRY(check_static_init(ctx, node[].initializers[i], arr_type[].elem_type))
    }
    if cast<u64>(arr_type[].size) > vec_size(node[].initializers) {
        check_static_no_init(ctx, arr_type[].elem_type, arr_type[].size - vec_size(node[].initializers))
    }
    FINALLY
    CATCH_EXIT
}

fn check_static_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure) error_t {
    CATCH_ENTER
    size: i64;
    TRY(check_bound_struct_init(ctx, node, struct_type))
    size = 0l
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        if member[].offset ~= size {
            check_static_no_init(ctx, nil, member[].offset - size)
            size = member[].offset
        }
        TRY(check_static_init(ctx, node[].initializers[i], member[].member_type))
        size += get_type_scale(ctx, member[].member_type)
    }
    size -= map_get(ctx[].frontend[].struct_typedef_table, struct_type[].tag_name)[].size
    if size ~= 0l {
        check_static_no_init(ctx, nil, -1l * size)
    }
    FINALLY
    CATCH_EXIT
}

fn check_static_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, static_init_type: *struc Type) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    match static_init_type[].tag {
        -> AST_Array_t {
            TRY(check_static_arr_init(ctx, node, @static_init_type[].get._Array))
        }
        break
        -> AST_Structure_t {
            TRY(check_static_struct_init(ctx, node, @static_init_type[].get._Structure))
        }
        break
        otherwise {
            THROW_AT_TOKEN(get_compound_info_at(node),
                GET_SEMANTIC_MSG(1, MSG_scalar_init_with_compound, str_fmt_type(static_init_type, @type_fmt)))
        }
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_static_init(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type) error_t {
    CATCH_ENTER
    match node[].tag {
        -> AST_CSingleInit_t {
            TRY(check_single_static_init(ctx, @node[].get._CSingleInit, static_init_type))
        }
        break
        -> AST_CCompoundInit_t {
            TRY(check_static_compound_init(ctx, @node[].get._CCompoundInit, static_init_type))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn check_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, static_init_type: *struc Type, init_value: **struc InitialValue) error_t {
    static_inits: vector_t(shared_ptr_t(StaticInit)) = vec_new()
    CATCH_ENTER
    {
        ctx[].p_static_inits = @static_inits
        TRY(check_static_init(ctx, node, static_init_type))
        ctx[].p_static_inits = nil
    }
    init_value[] = make_Initial(@static_inits)
    FINALLY
    loop i: u64 = 0 while i < vec_size(static_inits) .. ++i {
        free_StaticInit(@static_inits[i])
    }
    vec_delete(static_inits)
    CATCH_EXIT
}

fn check_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    glob_var_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
    symbol: unique_ptr_t(Symbol) = uptr_new()
    init_value: shared_ptr_t(InitialValue) = sptr_new()
    glob_var_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    is_glob: i32;
    map_it: i64;
    ctx[].errors[].info_at_buf = node[].info_at
    TRY(reslv_struct_type(ctx, node[].var_type))
    if node[].var_type[].tag == AST_Void_t {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_void_var_decl, str_fmt_name(node[].name, @name_fmt)))
    }
    TRY(is_valid_type(ctx, node[].var_type))
    is_glob = node[].storage_class.tag ~= AST_CStatic_t
    if node[].init {
        if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
            THROW_AT_TOKEN(
                node[].info_at, GET_SEMANTIC_MSG(2, MSG_incomplete_var_decl, str_fmt_name(node[].name, @name_fmt),
                                    str_fmt_type(node[].var_type, @type_fmt_1)))
        }
        TRY(check_initializer(ctx, node[].init, node[].var_type, @init_value))
    }
    else {
        if node[].storage_class.tag == AST_CExtern_t {
            init_value = make_NoInitializer()
        }
        else {
            if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
                THROW_AT_TOKEN(
                    node[].info_at, GET_SEMANTIC_MSG(2, MSG_incomplete_var_decl, str_fmt_name(node[].name, @name_fmt),
                                        str_fmt_type(node[].var_type, @type_fmt_1)))
            }
            init_value = make_Tentative()
        }
    }
    map_it = map_find(ctx[].frontend[].symbol_table, node[].name)
    if map_it ~= map_end() {
        var_symbol: *struc Symbol = pair_second(ctx[].frontend[].symbol_table[map_it])
        if not is_same_type(var_symbol[].type_t, node[].var_type) {
            THROW_AT_TOKEN(node[].info_at,
                GET_SEMANTIC_MSG(3, MSG_redecl_var_conflict, str_fmt_name(node[].name, @name_fmt),
                    str_fmt_type(node[].var_type, @type_fmt_1), str_fmt_type(var_symbol[].type_t, @type_fmt_2)))
        }
        var_attrs: *struc StaticAttr = @var_symbol[].attrs[].get._StaticAttr
        if node[].storage_class.tag == AST_CExtern_t {
            is_glob = var_attrs[].is_glob
        }
        elif is_glob ~= var_attrs[].is_glob {
            THROW_AT_TOKEN(
                node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_var_storage, str_fmt_name(node[].name, @name_fmt)))
        }
        if var_attrs[].init[].tag == AST_Initial_t {
            if init_value[].tag == AST_Initial_t {
                THROW_AT_TOKEN(
                    node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_var_storage, str_fmt_name(node[].name, @name_fmt)))
            }
            else {
                sptr_copy(InitialValue, var_attrs[].init, init_value)
            }
        }
        free_Symbol(@var_symbol)
    }
    sptr_copy(Type, node[].var_type, glob_var_type)
    glob_var_attrs = make_StaticAttr(is_glob, @init_value)
    symbol = make_Symbol(@glob_var_type, @glob_var_attrs)
    map_move_add(ctx[].frontend[].symbol_table, node[].name, symbol)
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_IdentifierAttr(@glob_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@glob_var_type)
    CATCH_EXIT
}

fn check_extern_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt_1: string_t = str_new(nil)
    type_fmt_2: string_t = str_new(nil)
    local_var_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
    symbol: unique_ptr_t(Symbol) = uptr_new()
    init_value: shared_ptr_t(InitialValue) = sptr_new()
    local_var_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    map_it: i64;
    if node[].init {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_redef_extern_var, str_fmt_name(node[].name, @name_fmt)))
    }
    map_it = map_find(ctx[].frontend[].symbol_table, node[].name)
    if map_it ~= map_end() {
        var_type: *struc Type = pair_second(ctx[].frontend[].symbol_table[map_it])[].type_t
        if not is_same_type(var_type, node[].var_type) {
            THROW_AT_TOKEN(
                node[].info_at, GET_SEMANTIC_MSG(3, MSG_redecl_var_conflict, str_fmt_name(node[].name, @name_fmt),
                                    str_fmt_type(node[].var_type, @type_fmt_1), str_fmt_type(var_type, @type_fmt_2)))
        }
        EARLY_EXIT
    }
    sptr_copy(Type, node[].var_type, local_var_type)
    init_value = make_NoInitializer()
    local_var_attrs = make_StaticAttr(true, @init_value)
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    map_move_add(ctx[].frontend[].symbol_table, node[].name, symbol)
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt_1)
    str_delete(type_fmt_2)
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    CATCH_EXIT
}

fn check_static_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    local_var_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
    symbol: unique_ptr_t(Symbol) = uptr_new()
    init_value: shared_ptr_t(InitialValue) = sptr_new()
    local_var_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    THROW_ABORT_IF(
        node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure))
    if node[].init {
        TRY(check_initializer(ctx, node[].init, node[].var_type, @init_value))
    }
    else {
        init_value = check_no_initializer(ctx, node[].var_type)
    }
    sptr_copy(Type, node[].var_type, local_var_type)
    local_var_attrs = make_StaticAttr(false, @init_value)
    THROW_ABORT_IF(map_find(ctx[].frontend[].symbol_table, node[].name) ~= map_end())
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    map_move_add(ctx[].frontend[].symbol_table, node[].name, symbol)
    FINALLY
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_InitialValue(@init_value)
    free_Type(@local_var_type)
    CATCH_EXIT
}

fn check_auto_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    local_var_attrs: unique_ptr_t(IdentifierAttr) = uptr_new()
    symbol: unique_ptr_t(Symbol) = uptr_new()
    local_var_type: shared_ptr_t(Type) = sptr_new()
    CATCH_ENTER
    if node[].var_type[].tag == AST_Structure_t and not is_struct_complete(ctx, @node[].var_type[].get._Structure) {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(2, MSG_incomplete_var_decl, str_fmt_name(node[].name, @name_fmt),
                                           str_fmt_type(node[].var_type, @type_fmt)))
    }
    sptr_copy(Type, node[].var_type, local_var_type)
    local_var_attrs = make_LocalAttr()
    THROW_ABORT_IF(map_find(ctx[].frontend[].symbol_table, node[].name) ~= map_end())
    symbol = make_Symbol(@local_var_type, @local_var_attrs)
    map_move_add(ctx[].frontend[].symbol_table, node[].name, symbol)
    FINALLY
    str_delete(name_fmt)
    str_delete(type_fmt)
    free_IdentifierAttr(@local_var_attrs)
    free_Symbol(@symbol)
    free_Type(@local_var_type)
    CATCH_EXIT
}

fn check_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    ctx[].errors[].info_at_buf = node[].info_at
    TRY(reslv_struct_type(ctx, node[].var_type))
    if node[].var_type[].tag == AST_Void_t {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_void_var_decl, str_fmt_name(node[].name, @name_fmt)))
    }
    TRY(is_valid_type(ctx, node[].var_type))
    match node[].storage_class.tag {
        -> AST_CStorageClass_t {
            TRY(check_auto_block_var_decl(ctx, node))
        }
        break
        -> AST_CExtern_t {
            TRY(check_extern_block_var_decl(ctx, node))
        }
        break
        -> AST_CStatic_t {
            TRY(check_static_block_var_decl(ctx, node))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn check_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    struct_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    loop i: u64 = 0 while i < vec_size(node[].members) .. ++i {
        loop j: u64 = i + 1 while j < vec_size(node[].members) .. ++j {
            if node[].members[i][].member_name == node[].members[j][].member_name {
                THROW_AT_TOKEN(
                    node[].members[i][].info_at, GET_SEMANTIC_MSG(2, MSG_duplicate_member_decl,
                                                     str_fmt_struct_name(node[].tag_name, node[].is_union, @struct_fmt),
                                                     str_fmt_name(node[].members[i][].member_name, @name_fmt)))
            }
        }
        THROW_ABORT_IF(node[].members[i][].member_type[].tag == AST_FunType_t)
        ctx[].errors[].info_at_buf = node[].members[i][].info_at
        TRY(reslv_struct_type(ctx, node[].members[i][].member_type))
        if not is_type_complete(ctx, node[].members[i][].member_type) {
            THROW_AT_TOKEN(node[].members[i][].info_at, GET_SEMANTIC_MSG(3, MSG_incomplete_member_decl,
                                                            str_fmt_struct_name(node[].tag_name, node[].is_union, @struct_fmt),
                                                            str_fmt_name(node[].members[i][].member_name, @name_fmt),
                                                            str_fmt_type(node[].members[i][].member_type, @type_fmt)))
        }
        TRY(is_valid_type(ctx, node[].members[i][].member_type))
    }
    FINALLY
    str_delete(name_fmt)
    str_delete(struct_fmt)
    str_delete(type_fmt)
    CATCH_EXIT
}

fn check_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) error_t {
    struct_fmt: string_t = str_new(nil)
    struct_member: unique_ptr_t(StructMember) = uptr_new()
    struct_typedef: unique_ptr_t(StructTypedef) = uptr_new()
    member_type: shared_ptr_t(Type) = sptr_new()
    member_names: vector_t(TIdentifier) = vec_new()
    members: hashmap_t(``TIdentifier'', ``UPtrStructMember'') = map_new()
    CATCH_ENTER
    alignment: i32;
    size: i64;
    if map_find(ctx[].frontend[].struct_typedef_table, node[].tag_name) ~= map_end() {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_struct_in_scope,
                                           str_fmt_struct_name(node[].tag_name, node[].is_union, @struct_fmt)))
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
            sptr_copy(Type, node[].members[i][].member_type, member_type)
            THROW_ABORT_IF(map_find(members, vec_back(member_names)) ~= map_end())
            struct_member = make_StructMember(offset, @member_type)
            map_move_add(members, vec_back(member_names), struct_member)
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
    map_move_add(ctx[].frontend[].struct_typedef_table, node[].tag_name, struct_typedef)
    FINALLY
    str_delete(struct_fmt)
    free_StructMember(@struct_member)
    free_StructTypedef(@struct_typedef)
    free_Type(@member_type)
    vec_delete(member_names)
    loop i: u64 = 0 while i < map_size(members) .. ++i {
        free_StructMember(@pair_second(members[i]))
    }
    map_delete(members)
    CATCH_EXIT
}

fn annotate_goto_label(ctx: *struc SemanticContext, node: *struc CLabel) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if set_find(ctx[].label_set, node[].target) ~= set_end() {
        THROW_AT_TOKEN(
            node[].info_at, GET_SEMANTIC_MSG(1, MSG_redef_label_in_scope, str_fmt_name(node[].target, @name_fmt)))
    }
    set_insert(ctx[].label_set, node[].target)
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
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

fn annotate_case_jump(ctx: *struc SemanticContext, node: *struc CCase) error_t {
    CATCH_ENTER
    if not ctx[].p_switch_statement {
        THROW_AT_TOKEN(node[].value[].info_at, GET_SEMANTIC_MSG(0, MSG_case_out_of_switch))
    }
    node[].target = repr_case_identifier(ctx[].identifiers, ctx[].p_switch_statement[].target, false, vec_size(ctx[].p_switch_statement[].cases))
    FINALLY
    CATCH_EXIT
}

fn annotate_default_jump(ctx: *struc SemanticContext, node: *struc CDefault) error_t {
    CATCH_ENTER
    if not ctx[].p_switch_statement {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(0, MSG_default_out_of_switch))
    }
    elif ctx[].p_switch_statement[].is_default {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(0, MSG_multiple_default))
    }
    node[].target = ctx[].p_switch_statement[].target
    ctx[].p_switch_statement[].is_default = true
    FINALLY
    CATCH_EXIT
}

fn annotate_break_jump(ctx: *struc SemanticContext, node: *struc CBreak) error_t {
    CATCH_ENTER
    if vec_empty(ctx[].break_loop_labels) {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(0, MSG_break_out_of_loop))
    }
    node[].target = vec_back(ctx[].break_loop_labels)
    FINALLY
    CATCH_EXIT
}

fn annotate_continue_jump(ctx: *struc SemanticContext, node: *struc CContinue) error_t {
    CATCH_ENTER
    if vec_empty(ctx[].continue_loop_labels) {
        THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(0, MSG_continue_out_of_loop))
    }
    node[].target = vec_back(ctx[].continue_loop_labels)
    FINALLY
    CATCH_EXIT
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
    loop i: u64 = 0 while i < map_size(vec_back(ctx[].scoped_identifier_maps)) .. ++i {
        identifier: u64 = pair_first(vec_back(ctx[].scoped_identifier_maps)[i])
        map_it: i64 = map_find(ctx[].extern_scope_map, identifier)
        if map_it ~= map_end() and pair_second(ctx[].extern_scope_map[map_it]) == vec_size(ctx[].scoped_identifier_maps) {
            map_erase(ctx[].extern_scope_map, identifier)
        }
    }
    map_delete(vec_back(ctx[].scoped_identifier_maps))
    vec_pop_back(ctx[].scoped_identifier_maps)
    map_delete(vec_back(ctx[].scoped_struct_maps))
    vec_pop_back(ctx[].scoped_struct_maps)
}

fn reslv_label(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) error_t {
    name_fmt_1: string_t = str_new(nil)
    name_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    loop i: u64 = 0 while i < map_size(ctx[].goto_map) .. ++i {
        if set_find(ctx[].label_set, pair_first(ctx[].goto_map[i])) == set_end() {
            THROW_AT_TOKEN(map_get(ctx[].errors[].info_at_map, pair_second(ctx[].goto_map[i])),
                GET_SEMANTIC_MSG(2, MSG_undef_goto_target, str_fmt_name(pair_first(ctx[].goto_map[i]), @name_fmt_1),
                    str_fmt_name(node[].name, @name_fmt_2)))
        }
    }
    FINALLY
    str_delete(name_fmt_1)
    str_delete(name_fmt_2)
    CATCH_EXIT
}

fn reslv_ptr_struct(ctx: *struc SemanticContext, ptr_type: *struc Pointer) error_t {
    CATCH_ENTER
    TRY(reslv_struct_type(ctx, ptr_type[].ref_type))
    FINALLY
    CATCH_EXIT
}

fn reslv_arr_struct(ctx: *struc SemanticContext, arr_type: *struc Array) error_t {
    CATCH_ENTER
    TRY(reslv_struct_type(ctx, arr_type[].elem_type))
    FINALLY
    CATCH_EXIT
}

fn reslv_struct(ctx: *struc SemanticContext, struct_type: *struc Structure) error_t {
    struct_fmt: string_t = str_new(nil)
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if struct_type[].is_union {
        if set_find(ctx[].union_def_set, struct_type[].tag_name) ~= set_end() {
            EARLY_EXIT
        }
    }
    elif set_find(ctx[].struct_def_set, struct_type[].tag_name) ~= set_end() {
        EARLY_EXIT
    }
    loop i: u64 = vec_size(ctx[].scoped_identifier_maps) while i-- > 0 {
        map_it: i64 = map_find(ctx[].scoped_struct_maps[i], struct_type[].tag_name)
        if map_it ~= map_end() {
            structure: *struc Structure = @pair_second(ctx[].scoped_struct_maps[i][map_it])
            if structure[].is_union ~= struct_type[].is_union {
                THROW_AT_TOKEN(ctx[].errors[].info_at_buf,
                    GET_SEMANTIC_MSG(2, MSG_redecl_struct_conflict, str_fmt_struct(struct_type, @type_fmt),
                        str_fmt_struct_name(struct_type[].tag_name, not struct_type[].is_union, @struct_fmt)))
            }
            struct_type[].tag_name = structure[].tag_name
            EARLY_EXIT
        }
    }
    THROW_AT_TOKEN(ctx[].errors[].info_at_buf,
        GET_SEMANTIC_MSG(1, MSG_undef_struct_in_scope, str_fmt_struct(struct_type, @type_fmt)))
    FINALLY
    str_delete(struct_fmt)
    str_delete(type_fmt)
    CATCH_EXIT
}

fn reslv_struct_type(ctx: *struc SemanticContext, type_t: *struc Type) error_t {
    CATCH_ENTER
    match type_t[].tag {
        -> AST_Pointer_t {
            TRY(reslv_ptr_struct(ctx, @type_t[].get._Pointer))
        }
        break
        -> AST_Array_t {
            TRY(reslv_arr_struct(ctx, @type_t[].get._Array))
        }
        break
        -> AST_Structure_t {
            TRY(reslv_struct(ctx, @type_t[].get._Structure))
        }
        break
        -> AST_FunType_t {
            THROW_ABORT
        }
        otherwise {
            break
        }
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) error_t;
fn reslv_typed_exp(ctx: *struc SemanticContext, exp: *unique_ptr_t(CExp)) error_t;

fn reslv_const_exp(node: *struc CConstant) none {
    check_const_exp(node)
}

fn reslv_string_exp(node: *struc CString) none {
    check_string_exp(node)
}

fn reslv_var_exp(ctx: *struc SemanticContext, node: *struc CVar) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    loop i: u64 = vec_size(ctx[].scoped_identifier_maps) while i-- > 0 {
        map_it: i64 = map_find(ctx[].scoped_identifier_maps[i], node[].name)
        if map_it ~= map_end() {
            node[].name = pair_second(ctx[].scoped_identifier_maps[i][map_it])
            jump Lelse
        }
    }
    THROW_AT_TOKEN(
        node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_undecl_var_in_scope, str_fmt_name(node[].name, @name_fmt)))
    label Lelse
    TRY(check_var_exp(ctx, node))
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn reslv_cast_exp(ctx: *struc SemanticContext, node: *struc CCast) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].exp))
    TRY(check_cast_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_unary_exp(ctx: *struc SemanticContext, node: *struc CUnary) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].exp))
    TRY(check_unary_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_binary_exp(ctx: *struc SemanticContext, node: *struc CBinary) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].exp_left))
    TRY(reslv_typed_exp(ctx, @node[].exp_right))
    TRY(check_binary_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_assign_exp(ctx: *struc SemanticContext, node: *struc CAssignment) error_t {
    CATCH_ENTER
    if node[].exp_left {
        TRY(reslv_typed_exp(ctx, @node[].exp_left))
    }
    TRY(reslv_typed_exp(ctx, @node[].exp_right))
    TRY(check_assign_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_conditional_exp(ctx: *struc SemanticContext, node: *struc CConditional) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].condition))
    TRY(reslv_typed_exp(ctx, @node[].exp_middle))
    TRY(reslv_typed_exp(ctx, @node[].exp_right))
    TRY(check_conditional_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_call_exp(ctx: *struc SemanticContext, node: *struc CFunctionCall) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    loop i: u64 = vec_size(ctx[].scoped_identifier_maps) while i-- > 0 {
        map_it: i64 = map_find(ctx[].scoped_identifier_maps[i], node[].name)
        if map_it ~= map_end() {
            node[].name = pair_second(ctx[].scoped_identifier_maps[i][map_it])
            jump Lelse
        }
    }
    THROW_AT_TOKEN(
        node[]._base[].info_at, GET_SEMANTIC_MSG(1, MSG_undecl_fun_in_scope, str_fmt_name(node[].name, @name_fmt)))
    label Lelse
    loop i: u64 = 0 while i < vec_size(node[].args) .. ++i {
        TRY(reslv_typed_exp(ctx, @node[].args[i]))
    }
    TRY(check_call_exp(ctx, node))
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn reslv_deref_exp(ctx: *struc SemanticContext, node: *struc CDereference) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].exp))
    TRY(check_deref_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_addrof_expr(ctx: *struc SemanticContext, node: *struc CAddrOf) error_t {
    CATCH_ENTER
    TRY(reslv_exp(ctx, node[].exp))
    TRY(check_addrof_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_subscript_exp(ctx: *struc SemanticContext, node: *struc CSubscript) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].primary_exp))
    TRY(reslv_typed_exp(ctx, @node[].subscript_exp))
    TRY(check_subscript_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_sizeof_exp(ctx: *struc SemanticContext, node: *struc CSizeOf) error_t {
    CATCH_ENTER
    TRY(reslv_exp(ctx, node[].exp))
    TRY(check_sizeof_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_sizeoft_exp(ctx: *struc SemanticContext, node: *struc CSizeOfT) error_t {
    CATCH_ENTER
    TRY(check_sizeoft_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_dot_exp(ctx: *struc SemanticContext, node: *struc CDot) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].structure))
    TRY(check_dot_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_arrow_exp(ctx: *struc SemanticContext, node: *struc CArrow) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].pointer))
    TRY(check_arrow_exp(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_exp(ctx: *struc SemanticContext, node: *struc CExp) error_t {
    CATCH_ENTER
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
            TRY(reslv_var_exp(ctx, @node[].get._CVar))
        }
        break
        -> AST_CCast_t {
            TRY(reslv_cast_exp(ctx, @node[].get._CCast))
        }
        break
        -> AST_CUnary_t {
            TRY(reslv_unary_exp(ctx, @node[].get._CUnary))
        }
        break
        -> AST_CBinary_t {
            TRY(reslv_binary_exp(ctx, @node[].get._CBinary))
        }
        break
        -> AST_CAssignment_t {
            TRY(reslv_assign_exp(ctx, @node[].get._CAssignment))
        }
        break
        -> AST_CConditional_t {
            TRY(reslv_conditional_exp(ctx, @node[].get._CConditional))
        }
        break
        -> AST_CFunctionCall_t {
            TRY(reslv_call_exp(ctx, @node[].get._CFunctionCall))
        }
        break
        -> AST_CDereference_t {
            TRY(reslv_deref_exp(ctx, @node[].get._CDereference))
        }
        break
        -> AST_CAddrOf_t {
            TRY(reslv_addrof_expr(ctx, @node[].get._CAddrOf))
        }
        break
        -> AST_CSubscript_t {
            TRY(reslv_subscript_exp(ctx, @node[].get._CSubscript))
        }
        break
        -> AST_CSizeOf_t {
            TRY(reslv_sizeof_exp(ctx, @node[].get._CSizeOf))
        }
        break
        -> AST_CSizeOfT_t {
            TRY(reslv_sizeoft_exp(ctx, @node[].get._CSizeOfT))
        }
        break
        -> AST_CDot_t {
            TRY(reslv_dot_exp(ctx, @node[].get._CDot))
        }
        break
        -> AST_CArrow_t {
            TRY(reslv_arrow_exp(ctx, @node[].get._CArrow))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_typed_exp(ctx: *struc SemanticContext, exp: *unique_ptr_t(CExp)) error_t {
    CATCH_ENTER
    TRY(reslv_exp(ctx, exp[]))
    TRY(check_typed_exp(ctx, exp))
    FINALLY
    CATCH_EXIT
}

fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) error_t;
fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t;
fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) error_t;

fn reslv_for_init_decl(ctx: *struc SemanticContext, node: *struc CInitDecl) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if node[].init[].storage_class.tag ~= AST_CStorageClass_t {
        THROW_AT_TOKEN(node[].init[].info_at,
            GET_SEMANTIC_MSG(2, MSG_for_init_decl_not_auto, str_fmt_name(node[].init[].name, @name_fmt),
                get_storage_class_fmt(@node[].init[].storage_class)))
    }
    TRY(reslv_block_var_decl(ctx, node[].init))
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn reslv_for_init_exp(ctx: *struc SemanticContext, node: *struc CInitExp) error_t {
    CATCH_ENTER
    if node[].init {
        TRY(reslv_typed_exp(ctx, @node[].init))
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_for_init(ctx: *struc SemanticContext, node: *struc CForInit) error_t {
    CATCH_ENTER
    match node[].tag {
        -> AST_CInitDecl_t {
            TRY(reslv_for_init_decl(ctx, @node[].get._CInitDecl))
        }
        break
        -> AST_CInitExp_t {
            TRY(reslv_for_init_exp(ctx, @node[].get._CInitExp))
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_ret_statement(ctx: *struc SemanticContext, node: *struc CReturn) error_t {
    CATCH_ENTER
    if node[].exp {
        TRY(reslv_typed_exp(ctx, @node[].exp))
    }
    TRY(check_ret_statement(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_exp_statement(ctx: *struc SemanticContext, node: *struc CExpression) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].exp))
    FINALLY
    CATCH_EXIT
}

fn reslv_if_statement(ctx: *struc SemanticContext, node: *struc CIf) error_t {
    CATCH_ENTER
    TRY(reslv_typed_exp(ctx, @node[].condition))
    TRY(reslv_statement(ctx, node[].then_fi))
    if node[].else_fi {
        TRY(reslv_statement(ctx, node[].else_fi))
    }
    TRY(check_if_statement(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_goto_statement(ctx: *struc SemanticContext, node: *struc CGoto) none {
    map_it: i64 = map_find(ctx[].goto_map, node[].target)
    if map_it ~= map_end() {
        node[].target = pair_second(ctx[].goto_map[map_it])
        map_add(ctx[].errors[].info_at_map, node[].target, node[].info_at)
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        map_add(ctx[].goto_map, node[].target, target)
        node[].target = target
        map_add(ctx[].errors[].info_at_map, node[].target, node[].info_at)
    }
}

fn reslv_label_statement(ctx: *struc SemanticContext, node: *struc CLabel) error_t {
    CATCH_ENTER
    map_it: i64;
    TRY(annotate_goto_label(ctx, node))
    map_it = map_find(ctx[].goto_map, node[].target)
    if map_it ~= map_end() {
        node[].target = pair_second(ctx[].goto_map[map_it])
    }
    else {
        target: u64 = rslv_label_identifier(ctx[].identifiers, node[].target)
        map_add(ctx[].goto_map, node[].target, target)
        node[].target = target
    }
    TRY(reslv_statement(ctx, node[].jump_to))
    FINALLY
    CATCH_EXIT
}

fn reslv_compound_statement(ctx: *struc SemanticContext, node: *struc CCompound) error_t {
    CATCH_ENTER
    enter_scope(ctx)
    TRY(reslv_block(ctx, node[].block))
    exit_scope(ctx)
    FINALLY
    CATCH_EXIT
}

fn reslv_while_statement(ctx: *struc SemanticContext, node: *struc CWhile) error_t {
    CATCH_ENTER
    annotate_while_loop(ctx, node)
    TRY(reslv_typed_exp(ctx, @node[].condition))
    TRY(reslv_statement(ctx, node[].body))
    deannotate_loop(ctx)
    TRY(check_while_statement(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_do_while_statement(ctx: *struc SemanticContext, node: *struc CDoWhile) error_t {
    CATCH_ENTER
    annotate_do_while_loop(ctx, node)
    TRY(reslv_statement(ctx, node[].body))
    TRY(reslv_typed_exp(ctx, @node[].condition))
    deannotate_loop(ctx)
    TRY(check_do_while_statement(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_for_statement(ctx: *struc SemanticContext, node: *struc CFor) error_t {
    CATCH_ENTER
    annotate_for_loop(ctx, node)
    enter_scope(ctx)
    TRY(reslv_for_init(ctx, node[].init))
    if node[].condition {
        TRY(reslv_typed_exp(ctx, @node[].condition))
    }
    if node[].post {
        TRY(reslv_typed_exp(ctx, @node[].post))
    }
    TRY(reslv_statement(ctx, node[].body))
    exit_scope(ctx)
    deannotate_loop(ctx)
    TRY(check_for_statement(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_switch_statement(ctx: *struc SemanticContext, node: *struc CSwitch) error_t {
    CATCH_ENTER
    annotate_switch_lookup(ctx, node)
    enter_scope(ctx)
    TRY(reslv_typed_exp(ctx, @node[].lookup))
    {
        p_switch_statement: *struc CSwitch = ctx[].p_switch_statement
        ctx[].p_switch_statement = node
        TRY(reslv_statement(ctx, node[].body))
        ctx[].p_switch_statement = p_switch_statement
    }
    exit_scope(ctx)
    deannotate_lookup(ctx)
    TRY(check_switch_statement(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_case_statement(ctx: *struc SemanticContext, node: *struc CCase) error_t {
    CATCH_ENTER
    TRY(annotate_case_jump(ctx, node))
    TRY(reslv_typed_exp(ctx, @node[].value))
    vec_move_back(ctx[].p_switch_statement[].cases, node[].value)
    TRY(reslv_statement(ctx, node[].jump_to))
    FINALLY
    CATCH_EXIT
}

fn reslv_default_statement(ctx: *struc SemanticContext, node: *struc CDefault) error_t {
    CATCH_ENTER
    TRY(annotate_default_jump(ctx, node))
    TRY(reslv_statement(ctx, node[].jump_to))
    FINALLY
    CATCH_EXIT
}

fn reslv_break_statement(ctx: *struc SemanticContext, node: *struc CBreak) error_t {
    CATCH_ENTER
    TRY(annotate_break_jump(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_continue_statement(ctx: *struc SemanticContext, node: *struc CContinue) error_t {
    CATCH_ENTER
    TRY(annotate_continue_jump(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_statement(ctx: *struc SemanticContext, node: *struc CStatement) error_t {
    CATCH_ENTER
    match node[].tag {
        -> AST_CReturn_t {
            TRY(reslv_ret_statement(ctx, @node[].get._CReturn))
        }
        break
        -> AST_CExpression_t {
            TRY(reslv_exp_statement(ctx, @node[].get._CExpression))
        }
        break
        -> AST_CIf_t {
            TRY(reslv_if_statement(ctx, @node[].get._CIf))
        }
        break
        -> AST_CGoto_t {
            reslv_goto_statement(ctx, @node[].get._CGoto)
        }
        break
        -> AST_CLabel_t {
            TRY(reslv_label_statement(ctx, @node[].get._CLabel))
        }
        break
        -> AST_CCompound_t {
            TRY(reslv_compound_statement(ctx, @node[].get._CCompound))
        }
        break
        -> AST_CWhile_t {
            TRY(reslv_while_statement(ctx, @node[].get._CWhile))
        }
        break
        -> AST_CDoWhile_t {
            TRY(reslv_do_while_statement(ctx, @node[].get._CDoWhile))
        }
        break
        -> AST_CFor_t {
            TRY(reslv_for_statement(ctx, @node[].get._CFor))
        }
        break
        -> AST_CSwitch_t {
            TRY(reslv_switch_statement(ctx, @node[].get._CSwitch))
        }
        break
        -> AST_CCase_t {
            TRY(reslv_case_statement(ctx, @node[].get._CCase))
        }
        break
        -> AST_CDefault_t {
            TRY(reslv_default_statement(ctx, @node[].get._CDefault))
        }
        break
        -> AST_CBreak_t {
            TRY(reslv_break_statement(ctx, @node[].get._CBreak))
        }
        break
        -> AST_CContinue_t {
            TRY(reslv_continue_statement(ctx, @node[].get._CContinue))
        }
        break
        -> AST_CNull_t {
            break
        }
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) error_t;

fn reslv_block_items(ctx: *struc SemanticContext, node_list: vector_t(unique_ptr_t(CBlockItem))) error_t {
    CATCH_ENTER
    loop i: u64 = 0 while i < vec_size(node_list) .. ++i {
        match node_list[i][].tag {
            -> AST_CS_t {
                TRY(reslv_statement(ctx, node_list[i][].get._CS.statement))
            }
            break
            -> AST_CD_t {
                TRY(reslv_declaration(ctx, node_list[i][].get._CD.declaration))
            }
            break
            otherwise {
                THROW_ABORT
            }
        }
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_block(ctx: *struc SemanticContext, node: *struc CBlock) error_t {
    CATCH_ENTER
    THROW_ABORT_IF(node[].tag ~= AST_CB_t)
    TRY(reslv_block_items(ctx, node[].get._CB.block_items))
    FINALLY
    CATCH_EXIT
}

fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) error_t;

fn reslv_single_init(ctx: *struc SemanticContext, node: *struc CSingleInit, init_type: **struc Type) error_t {
    CATCH_ENTER
    if node[].exp[].tag == AST_CString_t and (init_type[])[].tag == AST_Array_t {
        TRY(check_bound_string_init(ctx, @node[].exp[].get._CString, @init_type[][].get._Array))
        check_string_init(node, init_type)
    }
    else {
        TRY(reslv_typed_exp(ctx, @node[].exp))
        TRY(check_single_init(ctx, node, init_type))
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_arr_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, arr_type: *struc Array, init_type: **struc Type) error_t {
    CATCH_ENTER
    TRY(check_bound_arr_init(ctx, node, arr_type))
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        TRY(reslv_initializer(ctx, node[].initializers[i], @arr_type[].elem_type))
    }
    check_arr_init(ctx, node, arr_type, init_type)
    FINALLY
    CATCH_EXIT
}

fn reslv_struct_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, struct_type: *struc Structure, init_type: **struc Type) error_t {
    CATCH_ENTER
    TRY(check_bound_struct_init(ctx, node, struct_type))
    loop i: u64 = 0 while i < vec_size(node[].initializers) .. ++i {
        member: *struc StructMember = get_struct_typedef_member(ctx[].frontend, struct_type[].tag_name, i)
        TRY(reslv_initializer(ctx, node[].initializers[i], @member[].member_type))
    }
    check_struct_init(ctx, node, struct_type, init_type)
    FINALLY
    CATCH_EXIT
}

fn reslv_compound_init(ctx: *struc SemanticContext, node: *struc CCompoundInit, init_type: **struc Type) error_t {
    type_fmt: string_t = str_new(nil)
    CATCH_ENTER
    match (init_type[])[].tag {
        -> AST_Array_t {
            TRY(reslv_arr_init(ctx, node, @init_type[][].get._Array, init_type))
        }
        break
        -> AST_Structure_t {
            TRY(reslv_struct_init(ctx, node, @init_type[][].get._Structure, init_type))
        }
        break
        otherwise {
            THROW_AT_TOKEN(get_compound_info_at(node),
                GET_SEMANTIC_MSG(1, MSG_scalar_init_with_compound, str_fmt_type(init_type[], @type_fmt)))
        }
    }
    FINALLY
    str_delete(type_fmt)
    CATCH_EXIT
}

fn reslv_initializer(ctx: *struc SemanticContext, node: *struc CInitializer, init_type: **struc Type) error_t {
    CATCH_ENTER
    match node[].tag {
        -> AST_CSingleInit_t {
            TRY(reslv_single_init(ctx, @node[].get._CSingleInit, init_type))
        }
        break
        -> AST_CCompoundInit_t {
            TRY(reslv_compound_init(ctx, @node[].get._CCompoundInit, init_type))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_fun_params_decl(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    loop i: u64 = 0 while i < vec_size(node[].params) .. ++i {
        param: u64 = node[].params[i]
        if map_find(vec_back(ctx[].scoped_identifier_maps), param) ~= map_end() {
            THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_var_in_scope, str_fmt_name(param, @name_fmt)))
        }
        param = rslv_var_identifier(ctx[].identifiers, param)
        map_add(vec_back(ctx[].scoped_identifier_maps), node[].params[i], param)
        node[].params[i] = param
    }
    TRY(check_fun_params_decl(ctx, node))
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn reslv_fun_declaration(ctx: *struc SemanticContext, node: *struc CFunctionDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if not is_file_scope(ctx) {
        if node[].body {
            THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(1, MSG_def_nested_fun, str_fmt_name(node[].name, @name_fmt)))
        }
        elif node[].storage_class.tag == AST_CStatic_t {
            THROW_AT_TOKEN(
                node[].info_at, GET_SEMANTIC_MSG(1, MSG_decl_nested_static_fun, str_fmt_name(node[].name, @name_fmt)))
        }
    }
    if map_find(ctx[].extern_scope_map, node[].name) == map_end() {
        if map_find(vec_back(ctx[].scoped_identifier_maps), node[].name) ~= map_end() {
            THROW_AT_TOKEN(
                node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_fun_in_scope, str_fmt_name(node[].name, @name_fmt)))
        }
        map_add(ctx[].extern_scope_map, node[].name, vec_size(ctx[].scoped_identifier_maps))
    }
    map_add(vec_back(ctx[].scoped_identifier_maps), node[].name, node[].name)
    TRY(check_ret_fun_decl(ctx, node))
    enter_scope(ctx)
    if not vec_empty(node[].params) {
        TRY(reslv_fun_params_decl(ctx, node))
    }
    TRY(check_fun_decl(ctx, node))
    if node[].body {
        TRY(reslv_block(ctx, node[].body))
    }
    exit_scope(ctx)
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn reslv_file_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    CATCH_ENTER
    if map_find(ctx[].extern_scope_map, node[].name) == map_end() {
        map_add(ctx[].extern_scope_map, node[].name, vec_size(ctx[].scoped_identifier_maps))
    }
    map_add(vec_back(ctx[].scoped_identifier_maps), node[].name, node[].name)
    if is_file_scope(ctx) {
        TRY(check_file_var_decl(ctx, node))
    }
    else {
        TRY(check_block_var_decl(ctx, node))
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_block_var_decl(ctx: *struc SemanticContext, node: *struc CVariableDeclaration) error_t {
    name_fmt: string_t = str_new(nil)
    CATCH_ENTER
    if map_find(vec_back(ctx[].scoped_identifier_maps), node[].name) ~= map_end() and not (map_find(ctx[].extern_scope_map, node[].name) ~= map_end() and node[].storage_class.tag == AST_CExtern_t) {
        THROW_AT_TOKEN(
            node[].info_at, GET_SEMANTIC_MSG(1, MSG_redecl_var_in_scope, str_fmt_name(node[].name, @name_fmt)))
    }
    elif node[].storage_class.tag == AST_CExtern_t {
        TRY(reslv_file_var_decl(ctx, node))
        EARLY_EXIT
    }
    {
        name: u64 = rslv_var_identifier(ctx[].identifiers, node[].name)
        map_add(vec_back(ctx[].scoped_identifier_maps), node[].name, name)
        node[].name = name
    }
    TRY(check_block_var_decl(ctx, node))
    if node[].init and node[].storage_class.tag == AST_CStorageClass_t {
        TRY(reslv_initializer(ctx, node[].init, @node[].var_type))
    }
    FINALLY
    str_delete(name_fmt)
    CATCH_EXIT
}

fn reslv_struct_members_decl(ctx: *struc SemanticContext, node: *struc CStructDeclaration) error_t {
    CATCH_ENTER
    TRY(check_struct_members_decl(ctx, node))
    FINALLY
    CATCH_EXIT
}

fn reslv_struct_declaration(ctx: *struc SemanticContext, node: *struc CStructDeclaration) error_t {
    struct_fmt_1: string_t = str_new(nil)
    struct_fmt_2: string_t = str_new(nil)
    CATCH_ENTER
    map_it: i64 = map_find(vec_back(ctx[].scoped_struct_maps), node[].tag_name)
    if map_it ~= map_end() {
        node[].tag_name = pair_second(vec_back(ctx[].scoped_struct_maps)[map_it]).tag_name
        if node[].is_union {
            if set_find(ctx[].union_def_set, node[].tag_name) == set_end() {
                THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(2, MSG_redecl_struct_conflict,
                                                   str_fmt_struct_name(node[].tag_name, node[].is_union, @struct_fmt_1),
                                                   str_fmt_struct_name(node[].tag_name, not node[].is_union, @struct_fmt_2)))
            }
        }
        elif set_find(ctx[].struct_def_set, node[].tag_name) == set_end() {
            THROW_AT_TOKEN(node[].info_at, GET_SEMANTIC_MSG(2, MSG_redecl_struct_conflict,
                                               str_fmt_struct_name(node[].tag_name, node[].is_union, @struct_fmt_1),
                                               str_fmt_struct_name(node[].tag_name, not node[].is_union, @struct_fmt_2)))
        }
    }
    else {
        {
            structure: struc Structure = $(rslv_struct_tag(ctx[].identifiers, node[].tag_name), node[].is_union)
            map_add(vec_back(ctx[].scoped_struct_maps), node[].tag_name, structure)
            node[].tag_name = structure.tag_name
        }
        if node[].is_union {
            set_insert(ctx[].union_def_set, node[].tag_name)
        }
        else {
            set_insert(ctx[].struct_def_set, node[].tag_name)
        }
    }
    if not vec_empty(node[].members) {
        TRY(reslv_struct_members_decl(ctx, node))
        TRY(check_struct_decl(ctx, node))
    }
    FINALLY
    str_delete(struct_fmt_1)
    str_delete(struct_fmt_2)
    CATCH_EXIT
}

fn reslv_fun_decl(ctx: *struc SemanticContext, node: *struc CFunDecl) error_t {
    CATCH_ENTER
    if is_file_scope(ctx) {
        map_clear(ctx[].goto_map)
        set_clear(ctx[].label_set)
        vec_clear(ctx[].break_loop_labels)
        vec_clear(ctx[].continue_loop_labels)
        ctx[].p_switch_statement = nil
    }
    TRY(reslv_fun_declaration(ctx, node[].fun_decl))
    if is_file_scope(ctx) {
        TRY(reslv_label(ctx, node[].fun_decl))
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_var_decl(ctx: *struc SemanticContext, node: *struc CVarDecl) error_t {
    CATCH_ENTER
    if is_file_scope(ctx) {
        TRY(reslv_file_var_decl(ctx, node[].var_decl))
    }
    else {
        TRY(reslv_block_var_decl(ctx, node[].var_decl))
    }
    FINALLY
    CATCH_EXIT
}

fn reslv_struct_decl(ctx: *struc SemanticContext, node: *struc CStructDecl) error_t {
    CATCH_ENTER
    TRY(reslv_struct_declaration(ctx, node[].struct_decl))
    FINALLY
    CATCH_EXIT
}

fn reslv_declaration(ctx: *struc SemanticContext, node: *struc CDeclaration) error_t {
    CATCH_ENTER
    match node[].tag {
        -> AST_CFunDecl_t {
            TRY(reslv_fun_decl(ctx, @node[].get._CFunDecl))
        }
        break
        -> AST_CVarDecl_t {
            TRY(reslv_var_decl(ctx, @node[].get._CVarDecl))
        }
        break
        -> AST_CStructDecl_t {
            TRY(reslv_struct_decl(ctx, @node[].get._CStructDecl))
        }
        break
        otherwise {
            THROW_ABORT
        }
    }
    FINALLY
    CATCH_EXIT
}

fn resolve_program(ctx: *struc SemanticContext, node: *struc CProgram) error_t {
    CATCH_ENTER
    enter_scope(ctx)
    loop i: u64 = 0 while i < vec_size(node[].declarations) .. ++i {
        TRY(reslv_declaration(ctx, node[].declarations[i]))
    }
    FINALLY
    CATCH_EXIT
}

pub fn analyze_semantic(node: *struc CProgram, errors: *struc ErrorsContext, frontend: *struc FrontEndContext, identifiers: *struc IdentifierContext) error_t {
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

    CATCH_ENTER
    TRY(resolve_program(@ctx, node))
    FINALLY
    map_delete(ctx.extern_scope_map)
    map_delete(ctx.goto_map)
    loop i: u64 = 0 while i < vec_size(ctx.scoped_identifier_maps) .. ++i {
        map_delete(ctx.scoped_identifier_maps[i])
    }
    vec_delete(ctx.scoped_identifier_maps)
    loop i: u64 = 0 while i < vec_size(ctx.scoped_struct_maps) .. ++i {
        map_delete(ctx.scoped_struct_maps[i])
    }
    vec_delete(ctx.scoped_struct_maps)
    set_delete(ctx.label_set)
    vec_delete(ctx.break_loop_labels)
    vec_delete(ctx.continue_loop_labels)
    set_delete(ctx.fun_def_set)
    set_delete(ctx.struct_def_set)
    set_delete(ctx.union_def_set)
    map_delete(errors[].info_at_map)
    loop i: u64 = 0 while i < vec_size(errors[].fopen_lines) .. ++i {
        str_delete(errors[].fopen_lines[i].filename)
    }
    vec_delete(errors[].fopen_lines)
    vec_delete(errors[].token_infos)
    CATCH_EXIT
}
