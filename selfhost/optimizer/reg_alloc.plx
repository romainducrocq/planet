m4_include(`reg_alloc.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/back_ast.plx.m4')m4_dnl
m4_include(`../ast/back_symt.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl

m4_include(`../backend/registers.plx.m4')m4_dnl

m4_define(`mask_t', `u64')m4_dnl
type struc ControlFlowGraph;
type struc DataFlowAnalysis;
type struc DataFlowAnalysisO2;

type struc InferenceRegister(color: i32, reg_kind: i32, degree: u64, spill_cost: u64, linked_hard_mask: u64, linked_pseudo_names: vector_t(TIdentifier))

m4_define(`StInferenceRegister', `struc InferenceRegister')m4_dnl

PairKeyValue(``TIdentifier'', ``StInferenceRegister'')

type struc InferenceGraph(k: u64, offset: u64, hard_reg_mask: u64, unpruned_hard_mask_bits: vector_t(u64), unpruned_pseudo_names: vector_t(TIdentifier), pseudo_reg_map: *struc PairTIdentifierStInferenceRegister)

type struc RegAllocContext(backend: *struc BackEndContext, frontend: *struc FrontEndContext, callee_saved_reg_mask: u64, p_backend_fun: *struc BackendFun, p_infer_graph: *struc InferenceGraph, reg_color_map: [26]i32, hard_regs: [26]struc InferenceRegister, cfg: *struc ControlFlowGraph, dfa: *struc DataFlowAnalysis, dfa_o2: *struc DataFlowAnalysisO2, infer_graph: *struc InferenceGraph, sse_infer_graph: *struc InferenceGraph, p_instrs: *vector_t(unique_ptr_t(AsmInstruction)), is_with_coal: i32)

fn free_InferenceGraph(self: **struc InferenceGraph) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    vec_delete(self[][].unpruned_hard_mask_bits)
    ;
    vec_delete(self[][].unpruned_pseudo_names)
    ;
    loop i: u64 = 0 while i < (? ((self[])[].pseudo_reg_map) then (cast<*struc stbds_array_header>((((self[])[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        vec_delete((self[][].pseudo_reg_map[i]).value.linked_pseudo_names) # TODO pair_second((*self)->pseudo_reg_map[i]).linked_pseudo_names 
        ;
    }
    if (self[])[].pseudo_reg_map {
        " #@MACRO@:map_delete((*self)->pseudo_reg_map)"
        loop .. while 0 {
            cast<none>((? ((self[])[].pseudo_reg_map) ~= nil then stbds_hmfree_func(((self[])[].pseudo_reg_map) - 1, sizeof(((self[])[].pseudo_reg_map)[])) else cast<none>(0)))
            ((self[])[].pseudo_reg_map) = nil
        }
        (self[])[].pseudo_reg_map = map_new()
    }
    ;
    if self[] {
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_InferenceGraph(is_sse: i32) *struc InferenceGraph {
    self: *struc InferenceGraph = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(InferenceGraph, self)"
        free_InferenceGraph(@self)
        self = cast<*struc InferenceGraph>(malloc(sizeof<struc InferenceGraph>))
        if not self {
            panic_sigabrt("alloc "                 "InferenceGraph")
        }
    }
    self[].hard_reg_mask = 0ul
    self[].unpruned_hard_mask_bits = vec_new()
    self[].unpruned_pseudo_names = vec_new()
    self[].pseudo_reg_map = map_new()
    if is_sse {
        self[].k = 14
        self[].offset = 12
        register_mask_set(@self[].hard_reg_mask, REG_Xmm0, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm1, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm2, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm3, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm4, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm5, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm6, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm7, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm8, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm9, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm10, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm11, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm12, true)
        register_mask_set(@self[].hard_reg_mask, REG_Xmm13, true)
    }
    else {
        self[].k = 12
        self[].offset = 0
        register_mask_set(@self[].hard_reg_mask, REG_Ax, true)
        register_mask_set(@self[].hard_reg_mask, REG_Bx, true)
        register_mask_set(@self[].hard_reg_mask, REG_Cx, true)
        register_mask_set(@self[].hard_reg_mask, REG_Dx, true)
        register_mask_set(@self[].hard_reg_mask, REG_Di, true)
        register_mask_set(@self[].hard_reg_mask, REG_Si, true)
        register_mask_set(@self[].hard_reg_mask, REG_R8, true)
        register_mask_set(@self[].hard_reg_mask, REG_R9, true)
        register_mask_set(@self[].hard_reg_mask, REG_R12, true)
        register_mask_set(@self[].hard_reg_mask, REG_R13, true)
        register_mask_set(@self[].hard_reg_mask, REG_R14, true)
        register_mask_set(@self[].hard_reg_mask, REG_R15, true)
    }
    return self
}

m4_ifdef(`__OPTIM_LEVEL__', `', `
m4_define(`__OPTIM_LEVEL__', `2')m4_dnl
m4_undefine(`_OPTIMIZER_IMPL_OLVL_M4')m4_dnl
m4_include(`impl_olvl.plx.m4')m4_dnl
m4_undefine(`__OPTIM_LEVEL__')m4_dnl
')m4_dnl

fn is_bitshift_cl(node: *struc AsmBinary) i32 {
    match node[].binop.tag {
        -> AST_AsmBitShiftLeft_t {
            -> AST_AsmBitShiftRight_t {
                -> AST_AsmBitShrArithmetic_t {
                    return node[].src[].tag ~= AST_AsmImm_t
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn find_identifier(xs: vector_t(TIdentifier), x: u64) i32 {
    loop i: u64 = 0 while i < vec_size(xs) .. ++i {
        if xs[i] == x {
            return true
        }
    }
    return false
}

fn infer_transfer_used_reg(ctx: *struc RegAllocContext, reg_kind: i32, next_instr_idx: u64) none {
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? register_mask_bit(reg_kind) > 63 then register_mask_bit(reg_kind) / 64 else 0)], register_mask_bit(reg_kind), true)
}

fn infer_transfer_used_name(ctx: *struc RegAllocContext, name: u64, next_instr_idx: u64) none {
    if not is_aliased_name(ctx, name) {
        i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
    }
}

fn infer_transfer_used_op(ctx: *struc RegAllocContext, node: *struc AsmOperand, next_instr_idx: u64) none {
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmPseudo_t {
            infer_transfer_used_name(ctx, node[].get._AsmPseudo.name, next_instr_idx)
        }
        break
        -> AST_AsmMemory_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmMemory.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmIndexed_t {
            p_node: *struc AsmIndexed = @node[].get._AsmIndexed
            {
                reg_kind: i32 = register_mask_kind(@p_node[].reg_base)
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }

            {
                reg_kind: i32 = register_mask_kind(@p_node[].reg_index)
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        otherwise {
            break
        }
    }
}

fn infer_transfer_used_call(ctx: *struc RegAllocContext, node: *struc AsmCall, next_instr_idx: u64) none {
    fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (0)] |= fun_type[].param_reg_mask
}

fn infer_transfer_updated_reg(ctx: *struc RegAllocContext, reg_kind: i32, next_instr_idx: u64) none {
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? register_mask_bit(reg_kind) > 63 then register_mask_bit(reg_kind) / 64 else 0)], register_mask_bit(reg_kind), false)
}

fn infer_transfer_updated_name(ctx: *struc RegAllocContext, name: u64, next_instr_idx: u64) none {
    if not is_aliased_name(ctx, name) {
        i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
    }
}

fn infer_transfer_updated_op(ctx: *struc RegAllocContext, node: *struc AsmOperand, next_instr_idx: u64) none {
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_updated_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmPseudo_t {
            infer_transfer_updated_name(ctx, node[].get._AsmPseudo.name, next_instr_idx)
        }
        break
        -> AST_AsmMemory_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmMemory.reg)
            if reg_kind ~= REG_Sp {
                infer_transfer_used_reg(ctx, reg_kind, next_instr_idx)
            }
            break
        }
        -> AST_AsmIndexed_t {
            panic_sigabrt("abort")
        }
        otherwise {
            break
        }
    }
}

fn infer_transfer_live_regs(ctx: *struc RegAllocContext, instr_idx: u64, next_instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            p_node: *struc AsmMov = @node[].get._AsmMov
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmMovSx_t {
            p_node: *struc AsmMovSx = @node[].get._AsmMovSx
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmMovZeroExtend_t {
            p_node: *struc AsmMovZeroExtend = @node[].get._AsmMovZeroExtend
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmLea_t {
            p_node: *struc AsmLea = @node[].get._AsmLea
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmCvttsd2si_t {
            p_node: *struc AsmCvttsd2si = @node[].get._AsmCvttsd2si
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmCvtsi2sd_t {
            p_node: *struc AsmCvtsi2sd = @node[].get._AsmCvtsi2sd
            infer_transfer_updated_op(ctx, p_node[].dst, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_AsmUnary_t {
            infer_transfer_used_op(ctx, node[].get._AsmUnary.dst, next_instr_idx)
        }
        break
        -> AST_AsmBinary_t {
            p_node: *struc AsmBinary = @node[].get._AsmBinary
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].dst, next_instr_idx)
            if is_bitshift_cl(p_node) {
                infer_transfer_used_reg(ctx, REG_Cx, next_instr_idx)
            }
            break
        }
        -> AST_AsmCmp_t {
            p_node: *struc AsmCmp = @node[].get._AsmCmp
            infer_transfer_used_op(ctx, p_node[].src, next_instr_idx)
            infer_transfer_used_op(ctx, p_node[].dst, next_instr_idx)
            break
        }
        -> AST_AsmIdiv_t {
            infer_transfer_used_op(ctx, node[].get._AsmIdiv.src, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, REG_Ax, next_instr_idx)
        infer_transfer_used_reg(ctx, REG_Dx, next_instr_idx)
        break
        -> AST_AsmDiv_t {
            infer_transfer_used_op(ctx, node[].get._AsmDiv.src, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, REG_Ax, next_instr_idx)
        break
        -> AST_AsmCdq_t {
            infer_transfer_updated_reg(ctx, REG_Dx, next_instr_idx)
        }
        infer_transfer_used_reg(ctx, REG_Ax, next_instr_idx)
        break
        -> AST_AsmSetCC_t {
            infer_transfer_updated_op(ctx, node[].get._AsmSetCC.dst, next_instr_idx)
        }
        break
        -> AST_AsmPush_t {
            infer_transfer_used_op(ctx, node[].get._AsmPush.src, next_instr_idx)
        }
        break
        -> AST_AsmCall_t {
            infer_transfer_updated_reg(ctx, REG_Ax, next_instr_idx)
        }
        infer_transfer_updated_reg(ctx, REG_Cx, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Dx, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Di, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Si, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_R8, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_R9, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm0, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm1, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm2, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm3, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm4, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm5, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm6, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm7, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm8, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm9, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm10, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm11, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm12, next_instr_idx)
        infer_transfer_updated_reg(ctx, REG_Xmm13, next_instr_idx)
        infer_transfer_used_call(ctx, @node[].get._AsmCall, next_instr_idx)
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn set_p_infer_graph(ctx: *struc RegAllocContext, is_dbl: i32) none {
    ctx[].p_infer_graph = ? is_dbl then ctx[].sse_infer_graph else ctx[].infer_graph
}

fn infer_add_pseudo_edges(ctx: *struc RegAllocContext, name_1: u64, name_2: u64) none {
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name_1))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not find_identifier(infer[].linked_pseudo_names, name_2) {
            vec_push_back(infer[].linked_pseudo_names, name_2)
            infer[].degree++
        }
    }
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name_2))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not find_identifier(infer[].linked_pseudo_names, name_1) {
            vec_push_back(infer[].linked_pseudo_names, name_1)
            infer[].degree++
        }
    }
}

fn infer_add_reg_edge(ctx: *struc RegAllocContext, reg_kind: i32, name: u64) none {
    {
        infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not register_mask_get(infer[].linked_hard_mask, reg_kind) {
            register_mask_set(@infer[].linked_hard_mask, reg_kind, true)
            infer[].degree++
        }
    }
    {
        infer: *struc InferenceRegister = @ctx[].hard_regs[register_mask_bit(reg_kind)]
        if not find_identifier(infer[].linked_pseudo_names, name) {
            vec_push_back(infer[].linked_pseudo_names, name)
            infer[].degree++
        }
    }
}

fn infer_rm_pseudo_edge(infer: *struc InferenceRegister, name: u64) none {
    loop i: u64 = vec_size(infer[].linked_pseudo_names) while i-- > 0 {
        if infer[].linked_pseudo_names[i] == name {
            vec_remove_swap(infer[].linked_pseudo_names, i)
            infer[].degree--
            return none
        }
    }
    panic_sigabrt("abort")
}

fn infer_rm_unpruned_pseudo_name(ctx: *struc RegAllocContext, name: u64) none {
    loop i: u64 = vec_size(ctx[].p_infer_graph[].unpruned_pseudo_names) while i-- > 0 {
        if ctx[].p_infer_graph[].unpruned_pseudo_names[i] == name {
            vec_remove_swap(ctx[].p_infer_graph[].unpruned_pseudo_names, i)
            return none
        }
    }
    panic_sigabrt("abort")
}

fn infer_init_used_name_edges(ctx: *struc RegAllocContext, name: u64) none {
    if not is_aliased_name(ctx, name) {
        set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
    }
}

fn infer_init_used_op_edges(ctx: *struc RegAllocContext, node: *struc AsmOperand) none {
    if node[].tag == AST_AsmPseudo_t {
        infer_init_used_name_edges(ctx, node[].get._AsmPseudo.name)
    }
}

fn infer_init_updated_regs_edges(ctx: *struc RegAllocContext, reg_kinds: *i32, instr_idx: u64, reg_kinds_size: u64, is_dbl: i32) none {
    mov_mask_bit: u64 = ctx[].dfa[].set_size
    is_mov: i32 = (ctx[].p_instrs[])[instr_idx][].tag == AST_AsmMov_t
    if is_mov {
        mov: *struc AsmMov = @(ctx[].p_instrs[])[instr_idx][].get._AsmMov
        if mov[].src[].tag == AST_AsmPseudo_t {
            src_name: u64 = mov[].src[].get._AsmPseudo.name
            if is_aliased_name(ctx, src_name) {
                is_mov = false
            }
            else {
                is_src_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
                set_p_infer_graph(ctx, is_src_dbl)
                ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
                mov_mask_bit = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
                is_mov = is_dbl == is_src_dbl
            }
        }
        else {
            is_mov = false
        }
    }
    set_p_infer_graph(ctx, is_dbl)
    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (0)] ~= 0ul {
        loop i: u64 = ? ctx[].dfa[].set_size < 64 then ctx[].dfa[].set_size else 64 while i-- > REGISTER_MASK_SIZE {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    loop j: u64 = 0 while j < reg_kinds_size .. ++j {
                        infer_add_reg_edge(ctx, reg_kinds[j], pseudo_name)
                    }
                }
            }
        }
    }
    i: u64 = 64
    loop j: u64 = 1 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    loop k: u64 = 0 while k < reg_kinds_size .. ++k {
                        infer_add_reg_edge(ctx, reg_kinds[k], pseudo_name)
                    }
                }
            }
        }
    }
}

fn infer_init_updated_name_edges(ctx: *struc RegAllocContext, name: u64, instr_idx: u64) none {
    if is_aliased_name(ctx, name) {
        return none
    }
    is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
    mov_mask_bit: u64 = ctx[].dfa[].set_size
    is_mov: i32 = (ctx[].p_instrs[])[instr_idx][].tag == AST_AsmMov_t
    if is_mov {
        mov: *struc AsmMov = @(ctx[].p_instrs[])[instr_idx][].get._AsmMov
        match mov[].src[].tag {
            -> AST_AsmRegister_t {
                src_reg_kind: i32 = register_mask_kind(@mov[].src[].get._AsmRegister.reg)
                if src_reg_kind == REG_Sp {
                    is_mov = false
                }
                else {
                    mov_mask_bit = register_mask_bit(src_reg_kind)
                    is_mov = is_dbl == (mov_mask_bit > 11)
                }
                break
            }
            -> AST_AsmPseudo_t {
                src_name: u64 = mov[].src[].get._AsmPseudo.name
                if is_aliased_name(ctx, src_name) {
                    is_mov = false
                }
                else {
                    is_src_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
                    set_p_infer_graph(ctx, is_src_dbl)
                    ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
                    mov_mask_bit = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
                    is_mov = is_dbl == is_src_dbl
                }
                break
            }
            -> AST_AsmMemory_t {
                src_reg_kind: i32 = register_mask_kind(@mov[].src[].get._AsmMemory.reg)
                if src_reg_kind == REG_Sp {
                    is_mov = false
                }
                else {
                    mov_mask_bit = register_mask_bit(src_reg_kind)
                    is_mov = is_dbl == (mov_mask_bit > 11)
                }
                break
            }
            -> AST_AsmIndexed_t {
                panic_sigabrt("abort")
            }
            otherwise {
                is_mov = false
                break
            }
        }
    }
    set_p_infer_graph(ctx, is_dbl)
    ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (0)] ~= 0ul {
        i: u64 = ctx[].p_infer_graph[].offset
        mask_set_size: u64 = i + ctx[].p_infer_graph[].k
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                reg_kind: i32 = ctx[].hard_regs[i].reg_kind
                infer_add_reg_edge(ctx, reg_kind, name)
            }
        }
        i = REGISTER_MASK_SIZE
        mask_set_size = ? ctx[].dfa[].set_size < 64 then ctx[].dfa[].set_size else 64
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if name ~= pseudo_name and is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    infer_add_pseudo_edges(ctx, name, pseudo_name)
                }
            }
        }
    }
    i: u64 = 64
    loop j: u64 = 1 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) and not (is_mov and i == mov_mask_bit) {
                pseudo_name: u64 = ctx[].dfa_o2[].data_name_map[i - REGISTER_MASK_SIZE]
                if name ~= pseudo_name and is_dbl == (((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((pseudo_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t) {
                    infer_add_pseudo_edges(ctx, name, pseudo_name)
                }
            }
        }
    }
}

fn infer_init_updated_op_edges(ctx: *struc RegAllocContext, node: *struc AsmOperand, instr_idx: u64) none {
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kinds: [1]i32 = $(register_mask_kind(@node[].get._AsmRegister.reg))
            if reg_kinds[0] ~= REG_Sp {
                is_dbl: i32 = register_mask_bit(reg_kinds[0]) > 11
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, is_dbl)
            }
            break
        }
        -> AST_AsmPseudo_t {
            infer_init_updated_name_edges(ctx, node[].get._AsmPseudo.name, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn infer_init_edges(ctx: *struc RegAllocContext, instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmMov.dst, instr_idx)
        }
        break
        -> AST_AsmMovSx_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmMovSx.dst, instr_idx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmMovZeroExtend.dst, instr_idx)
        }
        break
        -> AST_AsmLea_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmLea.dst, instr_idx)
        }
        break
        -> AST_AsmCvttsd2si_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmCvttsd2si.dst, instr_idx)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmCvtsi2sd.dst, instr_idx)
        }
        break
        -> AST_AsmUnary_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmUnary.dst, instr_idx)
        }
        break
        -> AST_AsmBinary_t {
            p_node: *struc AsmBinary = @node[].get._AsmBinary
            if is_bitshift_cl(p_node) {
                reg_kinds: [1]i32 = $(REG_Cx)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, false)
            }
            infer_init_updated_op_edges(ctx, p_node[].dst, instr_idx)
            infer_init_used_op_edges(ctx, p_node[].src)
            break
        }
        -> AST_AsmCmp_t {
            p_node: *struc AsmCmp = @node[].get._AsmCmp
            infer_init_used_op_edges(ctx, p_node[].src)
            infer_init_used_op_edges(ctx, p_node[].dst)
            break
        }
        -> AST_AsmIdiv_t {
            reg_kinds: [2]i32 = $(REG_Ax, REG_Dx)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 2, false)
            infer_init_used_op_edges(ctx, node[].get._AsmIdiv.src)
            break
        }
        -> AST_AsmDiv_t {
            reg_kinds: [1]i32 = $(REG_Ax)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, false)
            infer_init_used_op_edges(ctx, node[].get._AsmDiv.src)
            break
        }
        -> AST_AsmCdq_t {
            reg_kinds: [1]i32 = $(REG_Dx)
            infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 1, false)
            break
        }
        -> AST_AsmSetCC_t {
            infer_init_updated_op_edges(ctx, node[].get._AsmSetCC.dst, instr_idx)
        }
        break
        -> AST_AsmPush_t {
            infer_init_used_op_edges(ctx, node[].get._AsmPush.src)
        }
        break
        -> AST_AsmCall_t {
            {
                reg_kinds: [7]i32 = $(REG_Ax, REG_Cx, REG_Dx, REG_Di, REG_Si, REG_R8, REG_R9)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 7, false)
            }
            {
                reg_kinds: [14]i32 = $(REG_Xmm0, REG_Xmm1, REG_Xmm2, REG_Xmm3, REG_Xmm4, REG_Xmm5, REG_Xmm6, REG_Xmm7, REG_Xmm8, REG_Xmm9, REG_Xmm10, REG_Xmm11, REG_Xmm12, REG_Xmm13)
                infer_init_updated_regs_edges(ctx, reg_kinds, instr_idx, 14, true)
            }
            break
        }
        otherwise {
            break
        }
    }
}

fn init_inference_graph(ctx: *struc RegAllocContext, fun_name: u64) i32 {
    if not init_data_flow_analysis(ctx, fun_name) {
        return false
    }
    dfa_iter_alg(ctx)
    if ((? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        return false
    }
    ctx[].callee_saved_reg_mask = 0ul
    vec_clear(ctx[].infer_graph[].unpruned_pseudo_names)
    ;
    loop i: u64 = 0 while i < (? (ctx[].infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        vec_delete((ctx[].infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) # TODO pair_second(ctx->infer_graph->pseudo_reg_map[i]).linked_pseudo_names
        ;
    }
    loop .. while 0 {
        " #@MACRO@:map_clear(ctx->infer_graph->pseudo_reg_map)"
        if ctx[].infer_graph[].pseudo_reg_map {
            " #@MACRO@:map_delete(ctx->infer_graph->pseudo_reg_map)"
            loop .. while 0 {
                cast<none>((? (ctx[].infer_graph[].pseudo_reg_map) ~= nil then stbds_hmfree_func((ctx[].infer_graph[].pseudo_reg_map) - 1, sizeof((ctx[].infer_graph[].pseudo_reg_map)[])) else cast<none>(0)))
                (ctx[].infer_graph[].pseudo_reg_map) = nil
            }
            ctx[].infer_graph[].pseudo_reg_map = map_new()
        }
        ;
    }
    vec_clear(ctx[].sse_infer_graph[].unpruned_pseudo_names)
    ;
    loop i: u64 = 0 while i < (? (ctx[].sse_infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        vec_delete((ctx[].sse_infer_graph[].pseudo_reg_map[i]).value.linked_pseudo_names) # TODO pair_second(ctx->sse_infer_graph->pseudo_reg_map[i]).linked_pseudo_names
        ;
    }
    loop .. while 0 {
        " #@MACRO@:map_clear(ctx->sse_infer_graph->pseudo_reg_map)"
        if ctx[].sse_infer_graph[].pseudo_reg_map {
            " #@MACRO@:map_delete(ctx->sse_infer_graph->pseudo_reg_map)"
            loop .. while 0 {
                cast<none>((? (ctx[].sse_infer_graph[].pseudo_reg_map) ~= nil then stbds_hmfree_func((ctx[].sse_infer_graph[].pseudo_reg_map) - 1, sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[])) else cast<none>(0)))
                (ctx[].sse_infer_graph[].pseudo_reg_map) = nil
            }
            ctx[].sse_infer_graph[].pseudo_reg_map = map_new()
        }
        ;
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        name: u64 = (ctx[].cfg[].identifier_id_map[i]).key
        infer: struc InferenceRegister = $(REG_Sp, REG_Sp, 0, 0, 0ul, vec_new())
        if ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t {
            vec_push_back(ctx[].sse_infer_graph[].unpruned_pseudo_names, name)
            loop .. while 0 {
                " #@MACRO@:map_add(ctx->sse_infer_graph->pseudo_reg_map, name, infer)"
                loop .. while 0 {
                    (ctx[].sse_infer_graph[].pseudo_reg_map) = stbds_hmput_key((ctx[].sse_infer_graph[].pseudo_reg_map), sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].sse_infer_graph[].pseudo_reg_map)[].key), 0)
                    (ctx[].sse_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].key = (name)
                    (ctx[].sse_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].value = (infer)
                }
            }
        }
        else {
            vec_push_back(ctx[].infer_graph[].unpruned_pseudo_names, name)
            loop .. while 0 {
                " #@MACRO@:map_add(ctx->infer_graph->pseudo_reg_map, name, infer)"
                loop .. while 0 {
                    (ctx[].infer_graph[].pseudo_reg_map) = stbds_hmput_key((ctx[].infer_graph[].pseudo_reg_map), sizeof((ctx[].infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].infer_graph[].pseudo_reg_map)[].key), 0)
                    (ctx[].infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].key = (name)
                    (ctx[].infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp].value = (infer)
                }
            }
        }
    }
    if not ((? (ctx[].infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        if vec_size(ctx[].infer_graph[].unpruned_hard_mask_bits) < 12 {
            vec_resize(ctx[].infer_graph[].unpruned_hard_mask_bits, 12)
        }
        hard_reg_mask: u64 = ctx[].infer_graph[].hard_reg_mask
        loop i: u64 = 0 while i < 12 .. ++i {
            ctx[].reg_color_map[i] = REG_Sp
            ctx[].hard_regs[i].color = REG_Sp
            ctx[].hard_regs[i].degree = 11
            ctx[].hard_regs[i].spill_cost = 0
            ctx[].hard_regs[i].linked_hard_mask = hard_reg_mask
            vec_clear(ctx[].hard_regs[i].linked_pseudo_names)
            ;
            ctx[].infer_graph[].unpruned_hard_mask_bits[i] = i
        }
    }
    if not ((? (ctx[].sse_infer_graph[].pseudo_reg_map) then (cast<*struc stbds_array_header>(((ctx[].sse_infer_graph[].pseudo_reg_map) - 1)) - 1)[].length - 1 else 0) == 0) {
        if vec_size(ctx[].sse_infer_graph[].unpruned_hard_mask_bits) < 14 {
            vec_resize(ctx[].sse_infer_graph[].unpruned_hard_mask_bits, 14)
        }
        hard_reg_mask: u64 = ctx[].sse_infer_graph[].hard_reg_mask
        loop i: u64 = 12 while i < 26 .. ++i {
            ctx[].reg_color_map[i] = REG_Sp
            ctx[].hard_regs[i].color = REG_Sp
            ctx[].hard_regs[i].degree = 13
            ctx[].hard_regs[i].spill_cost = 0
            ctx[].hard_regs[i].linked_hard_mask = hard_reg_mask
            vec_clear(ctx[].hard_regs[i].linked_pseudo_names)
            ;
            ctx[].sse_infer_graph[].unpruned_hard_mask_bits[i - 12] = i
        }
    }
    loop block_id: u64 = 0 while block_id < vec_size(ctx[].cfg[].blocks) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    infer_init_edges(ctx, instr_idx)
                }
            }
        }
    }
    return true
}

fn is_reg_callee_saved(reg_kind: i32) i32 {
    match reg_kind {
        -> REG_Bx {
            -> REG_R12 {
                -> REG_R13 {
                    -> REG_R14 {
                        -> REG_R15 {
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

fn alloc_prune_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_idx: u64) none {
    if infer[].reg_kind == REG_Sp {
        vec_remove_swap(ctx[].p_infer_graph[].unpruned_pseudo_names, pruned_idx)
    }
    else {
        vec_remove_swap(ctx[].p_infer_graph[].unpruned_hard_mask_bits, pruned_idx)
    }
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                linked_infer[].degree--
            }
        }
    }
    loop i: u64 = 0 while i < vec_size(infer[].linked_pseudo_names) .. ++i {
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).degree--
    }
}

fn alloc_unprune_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_name: u64) none {
    if infer[].reg_kind == REG_Sp {
        ;
        vec_push_back(ctx[].p_infer_graph[].unpruned_pseudo_names, pruned_name)
    }
    else {
        pruned_mask_bit: u64 = register_mask_bit(infer[].reg_kind)
        ;
        vec_push_back(ctx[].p_infer_graph[].unpruned_hard_mask_bits, pruned_mask_bit)
    }
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                linked_infer[].degree++
            }
        }
    }
    loop i: u64 = 0 while i < vec_size(infer[].linked_pseudo_names) .. ++i {
        ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).degree++
    }
}

fn alloc_color_infer_graph(ctx: *struc RegAllocContext) none;

fn alloc_next_color_infer_graph(ctx: *struc RegAllocContext) none {
    if not vec_empty(ctx[].p_infer_graph[].unpruned_hard_mask_bits) or not vec_empty(ctx[].p_infer_graph[].unpruned_pseudo_names) {
        alloc_color_infer_graph(ctx)
    }
}

fn alloc_prune_infer_graph(ctx: *struc RegAllocContext, pruned_name: *u64) *struc InferenceRegister {
    pruned_idx: u64;
    infer: *struc InferenceRegister = nil
    loop i: u64 = 0 while i < vec_size(ctx[].p_infer_graph[].unpruned_pseudo_names) .. ++i {
        pruned_name[] = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
        infer = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((pruned_name[]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if infer[].degree < ctx[].p_infer_graph[].k {
            pruned_idx = i
            break
        }
        infer = nil
    }
    if not infer {
        loop i: u64 = 0 while i < vec_size(ctx[].p_infer_graph[].unpruned_hard_mask_bits) .. ++i {
            pruned_mask_bit: u64 = ctx[].p_infer_graph[].unpruned_hard_mask_bits[i]
            infer = @ctx[].hard_regs[pruned_mask_bit]
            if infer[].degree < ctx[].p_infer_graph[].k {
                pruned_idx = i
                break
            }
            infer = nil
        }
    }
    if not infer {
        i: u64 = 0
        loop  while i < vec_size(ctx[].p_infer_graph[].unpruned_pseudo_names) .. ++i {
            pruned_name[] = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
            infer = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((pruned_name[]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if infer[].degree > 0 {
                pruned_idx = i
                break
            }
            infer = nil
        }
        ;
        min_spill_metric: f64 = (cast<f64>(infer[].spill_cost)) / infer[].degree
        loop  while i < vec_size(ctx[].p_infer_graph[].unpruned_pseudo_names) .. ++i {
            spill_name: u64 = ctx[].p_infer_graph[].unpruned_pseudo_names[i]
            spill_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((spill_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if spill_infer[].degree > 0 {
                spill_metric: f64 = (cast<f64>(spill_infer[].spill_cost)) / spill_infer[].degree
                if spill_metric < min_spill_metric {
                    pruned_idx = i
                    pruned_name[] = spill_name
                    infer = spill_infer
                    min_spill_metric = spill_metric
                }
            }
        }
    }
    alloc_prune_infer_reg(ctx, infer, pruned_idx)
    return infer
}

fn alloc_unprune_infer_graph(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, pruned_name: u64) none {
    color_reg_mask: u64 = ctx[].p_infer_graph[].hard_reg_mask
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                if linked_infer[].color ~= REG_Sp {
                    register_mask_set(@color_reg_mask, linked_infer[].color, false)
                }
            }
        }
    }
    loop i: u64 = 0 while i < vec_size(infer[].linked_pseudo_names) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if linked_infer[].color ~= REG_Sp {
            register_mask_set(@color_reg_mask, linked_infer[].color, false)
        }
    }
    if color_reg_mask ~= 0ul {
        if is_reg_callee_saved(infer[].reg_kind) {
            loop i: u64 = ctx[].p_infer_graph[].k while i-- > 0 {
                color: i32 = ctx[].hard_regs[i + ctx[].p_infer_graph[].offset].reg_kind
                if register_mask_get(color_reg_mask, color) {
                    infer[].color = color
                    break
                }
            }
        }
        else {
            loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
                color: i32 = ctx[].hard_regs[i + ctx[].p_infer_graph[].offset].reg_kind
                if register_mask_get(color_reg_mask, color) {
                    infer[].color = color
                    break
                }
            }
        }
        alloc_unprune_infer_reg(ctx, infer, pruned_name)
    }
}

fn alloc_color_infer_graph(ctx: *struc RegAllocContext) none {
    pruned_name: u64 = 0
    infer: *struc InferenceRegister = alloc_prune_infer_graph(ctx, @pruned_name)
    alloc_next_color_infer_graph(ctx)
    alloc_unprune_infer_graph(ctx, infer, pruned_name)
}

fn alloc_color_reg_map(ctx: *struc RegAllocContext) none {
    loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
        infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
        if infer[].color ~= REG_Sp {
            ctx[].reg_color_map[register_mask_bit(infer[].color)] = infer[].reg_kind
        }
    }
}

fn alloc_hard_reg(ctx: *struc RegAllocContext, name: u64) *struc AsmOperand {
    if is_aliased_name(ctx, name) {
        return sptr_new()
    }
    set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
    color: i32 = ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).color
    if color ~= REG_Sp {
        reg_kind: i32 = ctx[].reg_color_map[register_mask_bit(color)]
        hard_reg: *struc AsmOperand = gen_register(reg_kind)
        if is_reg_callee_saved(reg_kind) and not register_mask_get(ctx[].callee_saved_reg_mask, reg_kind) {
            register_mask_set(@ctx[].callee_saved_reg_mask, reg_kind, true)
            callee_saved_reg: *struc AsmOperand = sptr_new()
            if hard_reg ~= callee_saved_reg {
                " #@MACRO@:sptr_copy(AsmOperand, hard_reg, callee_saved_reg)"
                free_AsmOperand(@callee_saved_reg)
                callee_saved_reg = hard_reg
                (callee_saved_reg)[]._ref_count++
            }
            ;
            vec_move_back(ctx[].p_backend_fun[].callee_saved_regs, callee_saved_reg)
        }
        return hard_reg
    }
    else {
        return sptr_new()
    }
}

fn get_op_reg_kind(ctx: *struc RegAllocContext, node: *struc AsmOperand) i32 {
    match node[].tag {
        -> AST_AsmRegister_t {
            return register_mask_kind(@node[].get._AsmRegister.reg)
        }
        -> AST_AsmPseudo_t {
            name: u64 = node[].get._AsmPseudo.name
            if is_aliased_name(ctx, name) {
                return REG_Sp
            }
            set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
            color: i32 = ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).color
            if color == REG_Sp {
                return REG_Sp
            }
            else {
                return ctx[].reg_color_map[register_mask_bit(color)]
            }
        }
        -> AST_AsmMemory_t {
            return REG_Sp
        }
        -> AST_AsmIndexed_t {
            panic_sigabrt("abort")
        }
        otherwise {
            return REG_Sp
        }
    }
}

fn alloc_mov_instr(ctx: *struc RegAllocContext, node: *struc AsmMov, instr_idx: u64) none {
    src_reg_kind: i32 = get_op_reg_kind(ctx, node[].src)
    dst_reg_kind: i32 = get_op_reg_kind(ctx, node[].dst)
    if src_reg_kind ~= REG_Sp and src_reg_kind == dst_reg_kind {
        set_instr(ctx, uptr_new(), instr_idx)
    }
    else {
        if node[].src[].tag == AST_AsmPseudo_t {
            hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
            if hard_reg {
                loop .. while 0 {
                    " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                    if hard_reg ~= node[].src {
                        " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                        free_AsmOperand(@node[].src)
                        node[].src = hard_reg
                        hard_reg = uptr_new()
                    }
                }
            }
        }
        if node[].dst[].tag == AST_AsmPseudo_t {
            hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
            if hard_reg {
                loop .. while 0 {
                    " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                    if hard_reg ~= node[].dst {
                        " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                        free_AsmOperand(@node[].dst)
                        node[].dst = hard_reg
                        hard_reg = uptr_new()
                    }
                }
            }
        }
    }
}

fn alloc_mov_sx_instr(ctx: *struc RegAllocContext, node: *struc AsmMovSx) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_zero_extend_instr(ctx: *struc RegAllocContext, node: *struc AsmMovZeroExtend) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_lea_instr(ctx: *struc RegAllocContext, node: *struc AsmLea) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_cvttsd2si_instr(ctx: *struc RegAllocContext, node: *struc AsmCvttsd2si) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_cvtsi2sd_instr(ctx: *struc RegAllocContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_unary_instr(ctx: *struc RegAllocContext, node: *struc AsmUnary) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_binary_instr(ctx: *struc RegAllocContext, node: *struc AsmBinary) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_cmp_instr(ctx: *struc RegAllocContext, node: *struc AsmCmp) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_idiv_instr(ctx: *struc RegAllocContext, node: *struc AsmIdiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_div_instr(ctx: *struc RegAllocContext, node: *struc AsmDiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_set_cc_instr(ctx: *struc RegAllocContext, node: *struc AsmSetCC) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].dst[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->dst)"
                if hard_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_push_instr(ctx: *struc RegAllocContext, node: *struc AsmPush) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        hard_reg: *struc AsmOperand = alloc_hard_reg(ctx, node[].src[].get._AsmPseudo.name)
        if hard_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, hard_reg, node->src)"
                if hard_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, hard_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = hard_reg
                    hard_reg = uptr_new()
                }
            }
        }
    }
}

fn alloc_instr(ctx: *struc RegAllocContext, instr_idx: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            alloc_mov_instr(ctx, @node[].get._AsmMov, instr_idx)
        }
        break
        -> AST_AsmMovSx_t {
            alloc_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            alloc_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            alloc_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            alloc_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            alloc_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            alloc_unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            alloc_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            alloc_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            alloc_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            alloc_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmSetCC_t {
            alloc_set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmPush_t {
            alloc_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> AST_AsmCdq_t {
            -> AST_AsmCall_t {
                break
            }
        }
        otherwise {
            break
        }
    }
}

fn reallocate_registers(ctx: *struc RegAllocContext) none {
    if not vec_empty(ctx[].infer_graph[].unpruned_pseudo_names) {
        set_p_infer_graph(ctx, false)
        alloc_color_infer_graph(ctx)
        alloc_color_reg_map(ctx)
    }
    if not vec_empty(ctx[].sse_infer_graph[].unpruned_pseudo_names) {
        set_p_infer_graph(ctx, true)
        alloc_color_infer_graph(ctx)
        alloc_color_reg_map(ctx)
    }
    loop instr_idx: u64 = 0 while instr_idx < vec_size(ctx[].p_instrs[]) .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            alloc_instr(ctx, instr_idx)
        }
    }
}

fn get_type_size(type_t: *struc Type) i32 {
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

fn get_coalesced_idx(ctx: *struc RegAllocContext, node: *struc AsmOperand) u64 {
    coalesced_idx: u64 = ctx[].dfa[].set_size
    match node[].tag {
        -> AST_AsmRegister_t {
            reg_kind: i32 = register_mask_kind(@node[].get._AsmRegister.reg)
            if reg_kind ~= REG_Sp {
                coalesced_idx = register_mask_bit(reg_kind)
            }
            break
        }
        -> AST_AsmPseudo_t {
            name: u64 = node[].get._AsmPseudo.name
            if not is_aliased_name(ctx, name) {
                coalesced_idx = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
            }
            break
        }
        otherwise {
            break
        }
    }
    if coalesced_idx < ctx[].dfa[].set_size {
        loop while coalesced_idx >= REGISTER_MASK_SIZE and coalesced_idx ~= ctx[].dfa[].open_data_map[coalesced_idx - REGISTER_MASK_SIZE] {
            coalesced_idx = ctx[].dfa[].open_data_map[coalesced_idx - REGISTER_MASK_SIZE]
        }
    }
    return coalesced_idx
}

fn get_coalescable_infer_regs(ctx: *struc RegAllocContext, src_infer: **struc InferenceRegister, dst_infer: **struc InferenceRegister, src_idx: u64, dst_idx: u64) i32 {
    if src_idx ~= dst_idx and (src_idx >= REGISTER_MASK_SIZE or dst_idx >= REGISTER_MASK_SIZE) and src_idx < ctx[].dfa[].set_size and dst_idx < ctx[].dfa[].set_size {
        if src_idx < REGISTER_MASK_SIZE {
            dst_name: u64 = ctx[].dfa_o2[].data_name_map[dst_idx - REGISTER_MASK_SIZE]
            is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
            if is_dbl == (src_idx > 11) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @ctx[].hard_regs[src_idx]
                dst_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                return not register_mask_get((dst_infer[])[].linked_hard_mask, (src_infer[])[].reg_kind)
            }
        }
        elif dst_idx < REGISTER_MASK_SIZE {
            src_name: u64 = ctx[].dfa_o2[].data_name_map[src_idx - REGISTER_MASK_SIZE]
            is_dbl: i32 = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t
            if is_dbl == (dst_idx > 11) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                dst_infer[] = @ctx[].hard_regs[dst_idx]
                return not register_mask_get((src_infer[])[].linked_hard_mask, (dst_infer[])[].reg_kind)
            }
        }
        else {
            src_name: u64 = ctx[].dfa_o2[].data_name_map[src_idx - REGISTER_MASK_SIZE]
            dst_name: u64 = ctx[].dfa_o2[].data_name_map[dst_idx - REGISTER_MASK_SIZE]
            src_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((src_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
            dst_type: *struc Type = ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((dst_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t
            is_dbl: i32 = src_type[].tag == AST_Double_t
            if is_dbl == (dst_type[].tag == AST_Double_t) and get_type_size(src_type) == get_type_size(dst_type) {
                set_p_infer_graph(ctx, is_dbl)
                src_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                dst_infer[] = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
                return not find_identifier((dst_infer[])[].linked_pseudo_names, src_name)
            }
        }
    }
    return false
}

fn coal_briggs_test(ctx: *struc RegAllocContext, src_infer: *struc InferenceRegister, dst_infer: *struc InferenceRegister) i32 {
    degree: u64 = 0
    if src_infer[].linked_hard_mask ~= 0ul or dst_infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(src_infer[].linked_hard_mask, linked_infer[].reg_kind) {
                if register_mask_get(dst_infer[].linked_hard_mask, linked_infer[].reg_kind) {
                    if linked_infer[].degree > ctx[].p_infer_graph[].k {
                        degree++
                    }
                }
                elif linked_infer[].degree >= ctx[].p_infer_graph[].k {
                    degree++
                }
            }
            elif register_mask_get(dst_infer[].linked_hard_mask, linked_infer[].reg_kind) and linked_infer[].degree >= ctx[].p_infer_graph[].k {
                degree++
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < vec_size(dst_infer[].linked_pseudo_names) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j, true)
    }
    loop i: u64 = 0 while i < vec_size(src_infer[].linked_pseudo_names) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((src_infer[].linked_pseudo_names[i]))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((src_infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
            if linked_infer[].degree > ctx[].p_infer_graph[].k {
                degree++
            }
            mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j, false)
        }
        elif linked_infer[].degree >= ctx[].p_infer_graph[].k {
            degree++
        }
    }
    loop i: u64 = 0 while i < vec_size(dst_infer[].linked_pseudo_names) .. ++i {
        j: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
        if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
            linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((dst_infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
            if linked_infer[].degree >= ctx[].p_infer_graph[].k {
                degree++
            }
        }
    }
    return degree < ctx[].p_infer_graph[].k
}

fn coal_george_test(ctx: *struc RegAllocContext, reg_kind: i32, infer: *struc InferenceRegister) i32 {
    loop i: u64 = 0 while i < vec_size(infer[].linked_pseudo_names) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        if not register_mask_get(linked_infer[].linked_hard_mask, reg_kind) and linked_infer[].degree >= ctx[].p_infer_graph[].k {
            return false
        }
    }
    return true
}

fn coal_conservative_tests(ctx: *struc RegAllocContext, src_infer: *struc InferenceRegister, dst_infer: *struc InferenceRegister) i32 {
    if coal_briggs_test(ctx, src_infer, dst_infer) {
        return true
    }
    elif src_infer[].reg_kind ~= REG_Sp {
        return coal_george_test(ctx, src_infer[].reg_kind, dst_infer)
    }
    elif dst_infer[].reg_kind ~= REG_Sp {
        return coal_george_test(ctx, dst_infer[].reg_kind, src_infer)
    }
    else {
        return false
    }
}

fn coal_pseudo_infer_reg(ctx: *struc RegAllocContext, infer: *struc InferenceRegister, merge_idx: u64, keep_idx: u64) none {
    merge_name: u64 = ctx[].dfa_o2[].data_name_map[merge_idx - REGISTER_MASK_SIZE]
    keep_name: u64 = ctx[].dfa_o2[].data_name_map[keep_idx - REGISTER_MASK_SIZE]
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                infer_rm_pseudo_edge(linked_infer, merge_name)
                infer_add_reg_edge(ctx, linked_infer[].reg_kind, keep_name)
            }
        }
    }
    loop i: u64 = 0 while i < vec_size(infer[].linked_pseudo_names) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        infer_rm_pseudo_edge(linked_infer, merge_name)
        infer_add_pseudo_edges(ctx, keep_name, infer[].linked_pseudo_names[i])
    }
    infer_rm_unpruned_pseudo_name(ctx, merge_name)
}

fn coal_hard_infer_reg(ctx: *struc RegAllocContext, reg_kind: i32, infer: *struc InferenceRegister, merge_idx: u64) none {
    merge_name: u64 = ctx[].dfa_o2[].data_name_map[merge_idx - REGISTER_MASK_SIZE]
    if infer[].linked_hard_mask ~= 0ul {
        loop i: u64 = 0 while i < ctx[].p_infer_graph[].k .. ++i {
            linked_infer: *struc InferenceRegister = @ctx[].hard_regs[i + ctx[].p_infer_graph[].offset]
            if register_mask_get(infer[].linked_hard_mask, linked_infer[].reg_kind) {
                infer_rm_pseudo_edge(linked_infer, merge_name)
            }
        }
    }
    loop i: u64 = 0 while i < vec_size(infer[].linked_pseudo_names) .. ++i {
        linked_infer: *struc InferenceRegister = @((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((infer[].linked_pseudo_names[i]))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value)
        infer_rm_pseudo_edge(linked_infer, merge_name)
        infer_add_reg_edge(ctx, reg_kind, infer[].linked_pseudo_names[i])
    }
    infer_rm_unpruned_pseudo_name(ctx, merge_name)
}

fn coal_infer_regs(ctx: *struc RegAllocContext, node: *struc AsmMov) i32 {
    src_infer: *struc InferenceRegister = nil
    dst_infer: *struc InferenceRegister = nil
    src_idx: u64 = get_coalesced_idx(ctx, node[].src)
    dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
    if get_coalescable_infer_regs(ctx, @src_infer, @dst_infer, src_idx, dst_idx) and coal_conservative_tests(ctx, src_infer, dst_infer) {
        if src_idx < REGISTER_MASK_SIZE {
            coal_hard_infer_reg(ctx, src_infer[].reg_kind, dst_infer, dst_idx)
            ctx[].dfa[].open_data_map[dst_idx - REGISTER_MASK_SIZE] = src_idx
        }
        else {
            if dst_idx < REGISTER_MASK_SIZE {
                coal_hard_infer_reg(ctx, dst_infer[].reg_kind, src_infer, src_idx)
            }
            else {
                coal_pseudo_infer_reg(ctx, src_infer, src_idx, dst_idx)
            }
            ctx[].dfa[].open_data_map[src_idx - REGISTER_MASK_SIZE] = dst_idx
        }
        return true
    }
    else {
        return false
    }
}

fn coal_op_reg(ctx: *struc RegAllocContext, name: u64, coalesced_idx: u64) *struc AsmOperand {
    if coalesced_idx < ctx[].dfa[].set_size and coalesced_idx ~= ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value) {
        if coalesced_idx < REGISTER_MASK_SIZE {
            reg_kind: i32 = ctx[].hard_regs[coalesced_idx].reg_kind
            return gen_register(reg_kind)
        }
        else {
            set_p_infer_graph(ctx, ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Double_t)
            name = ctx[].dfa_o2[].data_name_map[coalesced_idx - REGISTER_MASK_SIZE]
            ((? ((? ((ctx[].p_infer_graph[].pseudo_reg_map) = stbds_hmget_key((ctx[].p_infer_graph[].pseudo_reg_map), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[]), cast<*any>(@((name))), sizeof((ctx[].p_infer_graph[].pseudo_reg_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].p_infer_graph[].pseudo_reg_map)[(cast<*struc stbds_array_header>(((ctx[].p_infer_graph[].pseudo_reg_map) - 1)) - 1)[].temp])[].value).spill_cost++
            return make_AsmPseudo(name)
        }
    }
    else {
        return sptr_new()
    }
}

fn coal_mov_instr(ctx: *struc RegAllocContext, node: *struc AsmMov, instr_idx: u64, block_id: u64) none {
    src_idx: u64 = get_coalesced_idx(ctx, node[].src)
    dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
    if src_idx < ctx[].dfa[].set_size and src_idx == dst_idx {
        cfg_rm_block_instr(ctx, instr_idx, block_id)
    }
    else {
        if node[].src[].tag == AST_AsmPseudo_t {
            op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
            if op_reg {
                loop .. while 0 {
                    " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                    if op_reg ~= node[].src {
                        " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                        free_AsmOperand(@node[].src)
                        node[].src = op_reg
                        op_reg = uptr_new()
                    }
                }
            }
        }
        if node[].dst[].tag == AST_AsmPseudo_t {
            op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
            if op_reg {
                loop .. while 0 {
                    " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                    if op_reg ~= node[].dst {
                        " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                        free_AsmOperand(@node[].dst)
                        node[].dst = op_reg
                        op_reg = uptr_new()
                    }
                }
            }
        }
    }
}

fn coal_mov_sx_instr(ctx: *struc RegAllocContext, node: *struc AsmMovSx) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_zero_extend_instr(ctx: *struc RegAllocContext, node: *struc AsmMovZeroExtend) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_lea_instr(ctx: *struc RegAllocContext, node: *struc AsmLea) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_cvttsd2si_instr(ctx: *struc RegAllocContext, node: *struc AsmCvttsd2si) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_cvtsi2sd_instr(ctx: *struc RegAllocContext, node: *struc AsmCvtsi2sd) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_unary_instr(ctx: *struc RegAllocContext, node: *struc AsmUnary) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_binary_instr(ctx: *struc RegAllocContext, node: *struc AsmBinary) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_cmp_instr(ctx: *struc RegAllocContext, node: *struc AsmCmp) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_idiv_instr(ctx: *struc RegAllocContext, node: *struc AsmIdiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_div_instr(ctx: *struc RegAllocContext, node: *struc AsmDiv) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_set_cc_instr(ctx: *struc RegAllocContext, node: *struc AsmSetCC) none {
    if node[].dst[].tag == AST_AsmPseudo_t {
        dst_idx: u64 = get_coalesced_idx(ctx, node[].dst)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].dst[].get._AsmPseudo.name, dst_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->dst)"
                if op_reg ~= node[].dst {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->dst)"
                    free_AsmOperand(@node[].dst)
                    node[].dst = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_push_instr(ctx: *struc RegAllocContext, node: *struc AsmPush) none {
    if node[].src[].tag == AST_AsmPseudo_t {
        src_idx: u64 = get_coalesced_idx(ctx, node[].src)
        op_reg: *struc AsmOperand = coal_op_reg(ctx, node[].src[].get._AsmPseudo.name, src_idx)
        if op_reg {
            loop .. while 0 {
                " #@MACRO@:sptr_move(AsmOperand, op_reg, node->src)"
                if op_reg ~= node[].src {
                    " #@MACRO@:uptr_move(AsmOperand, op_reg, node->src)"
                    free_AsmOperand(@node[].src)
                    node[].src = op_reg
                    op_reg = uptr_new()
                }
            }
        }
    }
}

fn coal_instr(ctx: *struc RegAllocContext, instr_idx: u64, block_id: u64) none {
    node: *struc AsmInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_AsmMov_t {
            coal_mov_instr(ctx, @node[].get._AsmMov, instr_idx, block_id)
        }
        break
        -> AST_AsmMovSx_t {
            coal_mov_sx_instr(ctx, @node[].get._AsmMovSx)
        }
        break
        -> AST_AsmMovZeroExtend_t {
            coal_zero_extend_instr(ctx, @node[].get._AsmMovZeroExtend)
        }
        break
        -> AST_AsmLea_t {
            coal_lea_instr(ctx, @node[].get._AsmLea)
        }
        break
        -> AST_AsmCvttsd2si_t {
            coal_cvttsd2si_instr(ctx, @node[].get._AsmCvttsd2si)
        }
        break
        -> AST_AsmCvtsi2sd_t {
            coal_cvtsi2sd_instr(ctx, @node[].get._AsmCvtsi2sd)
        }
        break
        -> AST_AsmUnary_t {
            coal_unary_instr(ctx, @node[].get._AsmUnary)
        }
        break
        -> AST_AsmBinary_t {
            coal_binary_instr(ctx, @node[].get._AsmBinary)
        }
        break
        -> AST_AsmCmp_t {
            coal_cmp_instr(ctx, @node[].get._AsmCmp)
        }
        break
        -> AST_AsmIdiv_t {
            coal_idiv_instr(ctx, @node[].get._AsmIdiv)
        }
        break
        -> AST_AsmDiv_t {
            coal_div_instr(ctx, @node[].get._AsmDiv)
        }
        break
        -> AST_AsmSetCC_t {
            coal_set_cc_instr(ctx, @node[].get._AsmSetCC)
        }
        break
        -> AST_AsmPush_t {
            coal_push_instr(ctx, @node[].get._AsmPush)
        }
        break
        -> AST_AsmCdq_t {
            -> AST_AsmCall_t {
                break
            }
        }
        otherwise {
            break
        }
    }
}

fn coalesce_registers(ctx: *struc RegAllocContext) i32 {
    {
        open_data_map_size: u64 = ctx[].dfa[].set_size - REGISTER_MASK_SIZE
        if vec_size(ctx[].dfa[].open_data_map) < open_data_map_size {
            vec_resize(ctx[].dfa[].open_data_map, open_data_map_size)
        }
    }
    loop i: u64 = REGISTER_MASK_SIZE while i < ctx[].dfa[].set_size .. ++i {
        ctx[].dfa[].open_data_map[i - REGISTER_MASK_SIZE] = i
    }
    {
        is_fixed_point: i32 = true
        loop instr_idx: u64 = 0 while instr_idx < vec_size(ctx[].p_instrs[]) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] and (ctx[].p_instrs[])[instr_idx][].tag == AST_AsmMov_t and coal_infer_regs(ctx, @(ctx[].p_instrs[])[instr_idx][].get._AsmMov) {
                is_fixed_point = false
            }
        }
        if is_fixed_point {
            return false
        }
    }
    loop block_id: u64 = 0 while block_id < vec_size(ctx[].cfg[].blocks) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    coal_instr(ctx, instr_idx, block_id)
                }
            }
        }
    }
    return true
}

fn alloc_fun_toplvl(ctx: *struc RegAllocContext, node: *struc AsmFunction) none {
    ctx[].p_instrs = @node[].instructions
    init_control_flow_graph(ctx)
    label Ldowhile
    if init_inference_graph(ctx, node[].name) {
        if ctx[].is_with_coal and coalesce_registers(ctx) {
            if vec_empty(ctx[].infer_graph[].unpruned_pseudo_names) and vec_empty(ctx[].sse_infer_graph[].unpruned_pseudo_names) {
                jump Lbreak
            }
            jump Ldowhile
        }
        {
            backend_fun: *struc BackendFun = @((? ((? ((ctx[].backend[].symbol_table) = stbds_hmget_key((ctx[].backend[].symbol_table), sizeof((ctx[].backend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].backend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].backend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].backend[].symbol_table) - 1)) - 1)[].temp])[].value)[].get._BackendFun
            ctx[].p_backend_fun = backend_fun
        }
        reallocate_registers(ctx)
        ctx[].p_backend_fun = nil
    }
    label Lbreak
    ctx[].p_infer_graph = nil
    ctx[].p_instrs = nil
}

fn alloc_toplvl(ctx: *struc RegAllocContext, node: *struc AsmTopLevel) none {
    match node[].tag {
        -> AST_AsmFunction_t {
            alloc_fun_toplvl(ctx, @node[].get._AsmFunction)
        }
        break
        -> AST_AsmStaticVariable_t {
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn alloc_program(ctx: *struc RegAllocContext, node: *struc AsmProgram) none {
    loop i: u64 = 0 while i < vec_size(node[].top_levels) .. ++i {
        alloc_toplvl(ctx, node[].top_levels[i])
    }
}

pub fn allocate_registers(node: *struc AsmProgram, backend: *struc BackEndContext, frontend: *struc FrontEndContext, optim_2_code: u8) none {
    ctx: struc RegAllocContext;
    {
        ctx.backend = backend
        ctx.frontend = frontend
        ctx.is_with_coal = optim_2_code > 1u
        ctx.hard_regs[0].reg_kind = REG_Ax
        ctx.hard_regs[1].reg_kind = REG_Bx
        ctx.hard_regs[2].reg_kind = REG_Cx
        ctx.hard_regs[3].reg_kind = REG_Dx
        ctx.hard_regs[4].reg_kind = REG_Di
        ctx.hard_regs[5].reg_kind = REG_Si
        ctx.hard_regs[6].reg_kind = REG_R8
        ctx.hard_regs[7].reg_kind = REG_R9
        ctx.hard_regs[8].reg_kind = REG_R12
        ctx.hard_regs[9].reg_kind = REG_R13
        ctx.hard_regs[10].reg_kind = REG_R14
        ctx.hard_regs[11].reg_kind = REG_R15
        ctx.hard_regs[12].reg_kind = REG_Xmm0
        ctx.hard_regs[13].reg_kind = REG_Xmm1
        ctx.hard_regs[14].reg_kind = REG_Xmm2
        ctx.hard_regs[15].reg_kind = REG_Xmm3
        ctx.hard_regs[16].reg_kind = REG_Xmm4
        ctx.hard_regs[17].reg_kind = REG_Xmm5
        ctx.hard_regs[18].reg_kind = REG_Xmm6
        ctx.hard_regs[19].reg_kind = REG_Xmm7
        ctx.hard_regs[20].reg_kind = REG_Xmm8
        ctx.hard_regs[21].reg_kind = REG_Xmm9
        ctx.hard_regs[22].reg_kind = REG_Xmm10
        ctx.hard_regs[23].reg_kind = REG_Xmm11
        ctx.hard_regs[24].reg_kind = REG_Xmm12
        ctx.hard_regs[25].reg_kind = REG_Xmm13
        loop i: u64 = 0 while i < 26 .. ++i {
            ctx.hard_regs[i].linked_pseudo_names = vec_new()
        }
        ctx.cfg = make_ControlFlowGraph()
        ctx.dfa = make_DataFlowAnalysis()
        ctx.dfa_o2 = make_DataFlowAnalysisO2()
        ctx.infer_graph = make_InferenceGraph(false)
        ctx.sse_infer_graph = make_InferenceGraph(true)
    }

    alloc_program(@ctx, node)
    loop i: u64 = 0 while i < 26 .. ++i {
        vec_delete(ctx.hard_regs[i].linked_pseudo_names)
        ;
    }
    free_ControlFlowGraph(@ctx.cfg)
    free_DataFlowAnalysis(@ctx.dfa)
    free_DataFlowAnalysisO2(@ctx.dfa_o2)
    free_InferenceGraph(@ctx.infer_graph)
    free_InferenceGraph(@ctx.sse_infer_graph)
}
