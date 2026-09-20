m4_ifdef(`_OPTIMIZER_IMPL_OLVL_M4', `', `
m4_define(`_OPTIMIZER_IMPL_OLVL_M4', `')m4_dnl

m4_ifelse(__OPTIM_LEVEL__, `1', `', __OPTIM_LEVEL__, `2', `', `
    m4_undefine(`__OPTIM_LEVEL__')m4_dnl
')m4_dnl
m4_ifdef(`__OPTIM_LEVEL__', `

m4_define(`GET_INSTR', `TODO')m4_dnl
m4_define(`GET_CFG_BLOCK', `TODO')m4_dnl

m4_ifelse(__OPTIM_LEVEL__, `1', `
m4_define(`mask_t', `u64')m4_dnl
m4_define(`AstInstruction', `TacInstruction')m4_dnl
m4_define(`Ctx', `*struc OptimTacContext')m4_dnl
m4_define(`free_AstInstruction', `free_TacInstruction($1)')m4_dnl
m4_define(`uptr_move_AstInstruction', `TODO')m4_dnl
', __OPTIM_LEVEL__, `2', `
m4_define(`AstInstruction', `AsmInstruction')m4_dnl
m4_define(`Ctx', `*struc RegAllocContext')m4_dnl
m4_define(`free_AstInstruction', `free_AsmInstruction($1)')m4_dnl
m4_define(`uptr_move_AstInstruction', `TODO')m4_dnl
')m4_dnl

type struc ControlFlowBlock(size: u64, instrs_front_idx: u64, instrs_back_idx: u64, pred_ids: vector_t(u64), succ_ids: vector_t(u64))

type struc ControlFlowGraph(entry_id: u64, exit_id: u64, entry_succ_ids: vector_t(u64), exit_pred_ids: vector_t(u64), reaching_code: vector_t(bool), blocks: vector_t(struc ControlFlowBlock), identifier_id_map: *struc PairTIdentifierulong_t)

type struc DataFlowAnalysis(set_size: u64, mask_size: u64, incoming_idx: u64, static_idx: u64, open_data_map: vector_t(u64), instr_idx_map: vector_t(u64), blocks_mask_sets: vector_t(mask_t), instrs_mask_sets: vector_t(mask_t))

m4_ifelse(__OPTIM_LEVEL__, `1', `
type struc DataFlowAnalysisO1(data_idx_map: vector_t(u64), bak_instrs: vector_t(unique_ptr_t(TacInstruction)), addressed_idx: u64)
', __OPTIM_LEVEL__, `2', `
type struc DataFlowAnalysisO2(data_name_map: vector_t(TIdentifier))
')m4_dnl

fn free_ControlFlowGraph(self: **struc ControlFlowGraph) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    vec_delete(self[][].entry_succ_ids)
    ;
    vec_delete(self[][].exit_pred_ids)
    ;
    vec_delete(self[][].reaching_code)
    ;
    loop i: u64 = 0 while i < vec_size(self[][].blocks) .. ++i {
        vec_delete(self[][].blocks[i].pred_ids)
        ;
        vec_delete(self[][].blocks[i].succ_ids)
        ;
    }
    vec_delete(self[][].blocks)
    ;
    if (self[])[].identifier_id_map {
        " #@MACRO@:map_delete((*self)->identifier_id_map)"
        loop .. while 0 {
            cast<none>((? ((self[])[].identifier_id_map) ~= nil then stbds_hmfree_func(((self[])[].identifier_id_map) - 1, sizeof(((self[])[].identifier_id_map)[])) else cast<none>(0)))
            ((self[])[].identifier_id_map) = nil
        }
        (self[])[].identifier_id_map = map_new()
    }
    ;
    if self[] {
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_ControlFlowGraph(none) *struc ControlFlowGraph {
    self: *struc ControlFlowGraph = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(ControlFlowGraph, self)"
        free_ControlFlowGraph(@self)
        self = cast<*struc ControlFlowGraph>(malloc(sizeof<struc ControlFlowGraph>))
        if not self {
            panic_sigabrt("alloc "                 "ControlFlowGraph")
        }
    }
    self[].entry_id = 0
    self[].exit_id = 0
    self[].entry_succ_ids = vec_new()
    self[].exit_pred_ids = vec_new()
    self[].reaching_code = vec_new()
    self[].blocks = vec_new()
    self[].identifier_id_map = map_new()
    return self
}

fn free_DataFlowAnalysis(self: **struc DataFlowAnalysis) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    vec_delete(self[][].open_data_map)
    ;
    vec_delete(self[][].instr_idx_map)
    ;
    vec_delete(self[][].blocks_mask_sets)
    ;
    vec_delete(self[][].instrs_mask_sets)
    ;
    if self[] {
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_DataFlowAnalysis(none) *struc DataFlowAnalysis {
    self: *struc DataFlowAnalysis = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(DataFlowAnalysis, self)"
        free_DataFlowAnalysis(@self)
        self = cast<*struc DataFlowAnalysis>(malloc(sizeof<struc DataFlowAnalysis>))
        if not self {
            panic_sigabrt("alloc "                 "DataFlowAnalysis")
        }
    }
    self[].set_size = 0
    self[].mask_size = 0
    self[].incoming_idx = 0
    self[].static_idx = 0
    self[].open_data_map = vec_new()
    self[].instr_idx_map = vec_new()
    self[].blocks_mask_sets = vec_new()
    self[].instrs_mask_sets = vec_new()
    return self
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn free_DataFlowAnalysisO1(self: **struc DataFlowAnalysisO1) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    vec_delete(self[][].data_idx_map)
    ;
    loop i: u64 = 0 while i < vec_size(self[][].bak_instrs) .. ++i {
        free_TacInstruction(@(self[])[].bak_instrs[i])
    }
    vec_delete(self[][].bak_instrs)
    ;
    if self[] {
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_DataFlowAnalysisO1(none) *struc DataFlowAnalysisO1 {
    self: *struc DataFlowAnalysisO1 = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(DataFlowAnalysisO1, self)"
        free_DataFlowAnalysisO1(@self)
        self = cast<*struc DataFlowAnalysisO1>(malloc(sizeof<struc DataFlowAnalysisO1>))
        if not self {
            panic_sigabrt("alloc "                 "DataFlowAnalysisO1")
        }
    }
    self[].addressed_idx = 0
    self[].data_idx_map = vec_new()
    self[].bak_instrs = vec_new()
    return self
}
', __OPTIM_LEVEL__, `2', `
fn free_DataFlowAnalysisO2(self: **struc DataFlowAnalysisO2) none {
    if not self[] {
        " #@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    vec_delete(self[][].data_name_map)
    ;
    if self[] {
        " #@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_DataFlowAnalysisO2(none) *struc DataFlowAnalysisO2 {
    self: *struc DataFlowAnalysisO2 = uptr_new()
    loop .. while 0 {
        " #@MACRO@:uptr_alloc(DataFlowAnalysisO2, self)"
        free_DataFlowAnalysisO2(@self)
        self = cast<*struc DataFlowAnalysisO2>(malloc(sizeof<struc DataFlowAnalysisO2>))
        if not self {
            panic_sigabrt("alloc "                 "DataFlowAnalysisO2")
        }
    }
    self[].data_name_map = vec_new()
    return self
}
')m4_dnl

fn set_instr(ctx: Ctx, instr: *struc AstInstruction, instr_idx: u64) none {
    if instr {
        if instr ~= (ctx[].p_instrs[])[instr_idx] {
            " #@MACRO@:uptr_move(AstInstruction, instr, (*ctx->p_instrs)[instr_idx])"
            free_AstInstruction(@(ctx[].p_instrs[])[instr_idx])
            (ctx[].p_instrs[])[instr_idx] = instr
            instr = uptr_new()
        }
        ;
    }
    else {
        free_AstInstruction(@(ctx[].p_instrs[])[instr_idx])
    }
m4_ifelse(__OPTIM_LEVEL__, `1', `
    ctx[].is_fixed_point = false
')m4_dnl
}

fn find_size_t(xs: vector_t(u64), x: u64) i32 {
    loop i: u64 = 0 while i < vec_size(xs) .. ++i {
        if xs[i] == x {
            return true
        }
    }
    return false
}

fn cfg_add_edge(succ_ids: *vector_t(u64), pred_ids: *vector_t(u64), succ_id: u64, pred_id: u64) none {
    if not find_size_t(succ_ids[], succ_id) {
        vec_push_back(succ_ids[], succ_id)
    }
    if not find_size_t(pred_ids[], pred_id) {
        vec_push_back(pred_ids[], pred_id)
    }
}

fn cfg_add_succ_edge(ctx: Ctx, block_id: u64, succ_id: u64) none {
    if succ_id < ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].blocks[succ_id].pred_ids, succ_id, block_id)
    }
    elif succ_id == ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].exit_pred_ids, succ_id, block_id)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_add_pred_edge(ctx: Ctx, block_id: u64, pred_id: u64) none {
    if pred_id < ctx[].cfg[].exit_id {
        cfg_add_edge(@ctx[].cfg[].blocks[pred_id].succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id)
    }
    elif pred_id == ctx[].cfg[].entry_id {
        cfg_add_edge(@ctx[].cfg[].entry_succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_rm_edge(succ_ids: *vector_t(u64), pred_ids: *vector_t(u64), succ_id: u64, pred_id: u64, is_reachable: i32) none {
    if is_reachable {
        loop i: u64 = vec_size(succ_ids[]) while i-- > 0 {
            if (succ_ids[])[i] == succ_id {
                vec_remove_swap(succ_ids[], i)
                break
            }
        }
    }
    loop i: u64 = vec_size(pred_ids[]) while i-- > 0 {
        if (pred_ids[])[i] == pred_id {
            vec_remove_swap(pred_ids[], i)
            break
        }
    }
}

fn cfg_rm_succ_edge(ctx: Ctx, block_id: u64, succ_id: u64, is_reachable: i32) none {
    if succ_id < ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].blocks[succ_id].pred_ids, succ_id, block_id, is_reachable)
    }
    elif succ_id == ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[block_id].succ_ids, @ctx[].cfg[].exit_pred_ids, succ_id, block_id, is_reachable)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_rm_pred_edge(ctx: Ctx, block_id: u64, pred_id: u64) none {
    if pred_id < ctx[].cfg[].exit_id {
        cfg_rm_edge(@ctx[].cfg[].blocks[pred_id].succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id, true)
    }
    elif pred_id == ctx[].cfg[].entry_id {
        cfg_rm_edge(@ctx[].cfg[].entry_succ_ids, @ctx[].cfg[].blocks[block_id].pred_ids, block_id, pred_id, true)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn cfg_rm_empty_block(ctx: Ctx, block_id: u64, is_reachable: i32) none {
    loop i: u64 = 0 while i < vec_size(ctx[].cfg[].blocks[block_id].succ_ids) .. ++i { # TODO GET_CFG_BLOCK(block_id).succ_ids
        succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[i]
        if is_reachable {
            loop j: u64 = 0 while j < vec_size(ctx[].cfg[].blocks[block_id].pred_ids) .. ++j { # TODO GET_CFG_BLOCK(block_id).pred_ids
                pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[j]
                if pred_id == ctx[].cfg[].entry_id {
                    cfg_add_pred_edge(ctx, succ_id, pred_id)
                }
                else {
                    cfg_add_succ_edge(ctx, pred_id, succ_id)
                }
            }
        }
        cfg_rm_succ_edge(ctx, block_id, succ_id, is_reachable)
    }
    if is_reachable {
        loop i: u64 = 0 while i < vec_size(ctx[].cfg[].blocks[block_id].pred_ids) .. ++i { # TODO GET_CFG_BLOCK(block_id).pred_ids
            pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[i]
            cfg_rm_pred_edge(ctx, block_id, pred_id)
        }
    }
    ctx[].cfg[].blocks[block_id].instrs_front_idx = ctx[].cfg[].exit_id
    ctx[].cfg[].blocks[block_id].instrs_back_idx = ctx[].cfg[].exit_id
}

fn cfg_rm_block_instr(ctx: Ctx, instr_idx: u64, block_id: u64) none {
    if (ctx[].p_instrs[])[instr_idx] {
        set_instr(ctx, uptr_new(), instr_idx)
        ctx[].cfg[].blocks[block_id].size--
        if ctx[].cfg[].blocks[block_id].size == 0 {
            cfg_rm_empty_block(ctx, block_id, true)
        }
        elif instr_idx == ctx[].cfg[].blocks[block_id].instrs_front_idx {
            loop  while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    ctx[].cfg[].blocks[block_id].instrs_front_idx = instr_idx
                    break
                }
            }
        }
        elif instr_idx == ctx[].cfg[].blocks[block_id].instrs_back_idx {
            instr_idx++
            loop  while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    ctx[].cfg[].blocks[block_id].instrs_back_idx = instr_idx
                    break
                }
            }
        }
    }
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn cfg_init_label_block(ctx: Ctx, node: *struc TacLabel) none {
    loop .. while 0 {
        " #@MACRO@:map_add(ctx->cfg->identifier_id_map, node->name, vec_size(ctx->cfg->blocks) - 1)"
        loop .. while 0 {
            (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1)
        }
    }
}
', __OPTIM_LEVEL__, `2', `
fn cfg_init_label_block(ctx: Ctx, node: *struc AsmLabel) none {
    loop .. while 0 {
        " #@MACRO@:map_add(ctx->cfg->identifier_id_map, node->name, vec_size(ctx->cfg->blocks) - 1)"
        loop .. while 0 {
            (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1)
        }
    }
}
')m4_dnl

fn cfg_init_block(ctx: Ctx, instr_idx: u64, instrs_back_idx: *u64) none {
    node: *struc AstInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
m4_ifelse(__OPTIM_LEVEL__, `1', `
        -> AST_TacLabel_t {
', __OPTIM_LEVEL__, `2', `
        -> AST_AsmLabel_t {
')m4_dnl
            if instrs_back_idx[] ~= vec_size(ctx[].p_instrs[]) {
                vec_back(ctx[].cfg[].blocks).instrs_back_idx = instrs_back_idx[]
                block: struc ControlFlowBlock = $(0, instr_idx, 0, vec_new(), vec_new())
                vec_push_back(ctx[].cfg[].blocks, block)
            }
m4_ifelse(__OPTIM_LEVEL__, `1', `
            cfg_init_label_block(ctx, @node[].get._TacLabel)
', __OPTIM_LEVEL__, `2', `
            cfg_init_label_block(ctx, @node[].get._AsmLabel)
')m4_dnl
            instrs_back_idx[] = instr_idx
            break
        }
m4_ifelse(__OPTIM_LEVEL__, `1', `
        -> AST_TacReturn_t;
        -> AST_TacJump_t;
        -> AST_TacJumpIfZero_t;
        -> AST_TacJumpIfNotZero_t {
', __OPTIM_LEVEL__, `2', `
        -> AST_AsmJmp_t;
        -> AST_AsmJmpCC_t;
        -> AST_AsmRet_t {
')m4_dnl
            vec_back(ctx[].cfg[].blocks).instrs_back_idx = instr_idx
            instrs_back_idx[] = vec_size(ctx[].p_instrs[])
            break
        }
        otherwise {
            instrs_back_idx[] = instr_idx
            break
        }
    }
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn cfg_init_jump_edges(ctx: Ctx, node: *struc TacJump, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
}

fn cfg_init_jmp_eq_0_edges(ctx: Ctx, node: *struc TacJumpIfZero, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}

fn cfg_init_jmp_ne_0_edges(ctx: Ctx, node: *struc TacJumpIfNotZero, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}
', __OPTIM_LEVEL__, `2', `
fn cfg_init_jmp_edges(ctx: Ctx, node: *struc AsmJmp, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
}

fn cfg_init_jmp_cc_edges(ctx: Ctx, node: *struc AsmJmpCC, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}
')m4_dnl

fn cfg_init_edges(ctx: Ctx, block_id: u64) none {
    node: *struc AstInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
m4_ifelse(__OPTIM_LEVEL__, `1', `
        -> AST_TacReturn_t {
', __OPTIM_LEVEL__, `2', `
        -> AST_AsmRet_t {
')m4_dnl
            cfg_add_succ_edge(ctx, block_id, ctx[].cfg[].exit_id)
        }
        break
m4_ifelse(__OPTIM_LEVEL__, `1', `
        -> AST_TacJump_t {
            cfg_init_jump_edges(ctx, @node[].get._TacJump, block_id)
        }
        break
        -> AST_TacJumpIfZero_t {
            cfg_init_jmp_eq_0_edges(ctx, @node[].get._TacJumpIfZero, block_id)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            cfg_init_jmp_ne_0_edges(ctx, @node[].get._TacJumpIfNotZero, block_id)
        }
        break
', __OPTIM_LEVEL__, `2', `
        -> AST_AsmJmp_t {
            cfg_init_jmp_edges(ctx, @node[].get._AsmJmp, block_id)
        }
        break
        -> AST_AsmJmpCC_t {
            cfg_init_jmp_cc_edges(ctx, @node[].get._AsmJmpCC, block_id)
        }
        break
')m4_dnl
        otherwise {
            cfg_add_succ_edge(ctx, block_id, block_id + 1)
        }
        break
    }
}

fn init_control_flow_graph(ctx: Ctx) none {
    loop block_id: u64 = 0 while block_id < vec_size(ctx[].cfg[].blocks) .. ++block_id {
        vec_delete(ctx[].cfg[].blocks[block_id].pred_ids) # TODO GET_CFG_BLOCK(block_id).pred_ids
        ;
        vec_delete(ctx[].cfg[].blocks[block_id].succ_ids) # TODO GET_CFG_BLOCK(block_id).succ_ids
        ;
    }
    vec_clear(ctx[].cfg[].blocks)
    ;
    loop .. while 0 {
        " #@MACRO@:map_clear(ctx->cfg->identifier_id_map)"
        if ctx[].cfg[].identifier_id_map {
            " #@MACRO@:map_delete(ctx->cfg->identifier_id_map)"
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
                (ctx[].cfg[].identifier_id_map) = nil
            }
            ctx[].cfg[].identifier_id_map = map_new()
        }
        ;
    }
    {
        instrs_back_idx: u64 = vec_size(ctx[].p_instrs[])
        loop instr_idx: u64 = 0 while instr_idx < vec_size(ctx[].p_instrs[]) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] {
                if instrs_back_idx == vec_size(ctx[].p_instrs[]) {
                    block: struc ControlFlowBlock = $(0, instr_idx, 0, vec_new(), vec_new())
                    vec_push_back(ctx[].cfg[].blocks, block)
                }
                cfg_init_block(ctx, instr_idx, @instrs_back_idx)
                vec_back(ctx[].cfg[].blocks).size++
            }
        }
        if instrs_back_idx ~= vec_size(ctx[].p_instrs[]) {
            vec_back(ctx[].cfg[].blocks).instrs_back_idx = instrs_back_idx
        }
    }
    ctx[].cfg[].exit_id = vec_size(ctx[].cfg[].blocks)
    ctx[].cfg[].entry_id = ctx[].cfg[].exit_id + 1
    vec_clear(ctx[].cfg[].entry_succ_ids)
    ;
    vec_clear(ctx[].cfg[].exit_pred_ids)
    ;
    if not vec_empty(ctx[].cfg[].blocks) {
        cfg_add_pred_edge(ctx, 0, ctx[].cfg[].entry_id)
        loop block_id: u64 = 0 while block_id < vec_size(ctx[].cfg[].blocks) .. ++block_id {
            cfg_init_edges(ctx, block_id)
        }
    }
}

fn mask_get(mask: u64, bit: u64) i32 {
    if bit > 63 {
        bit %= 64
    }
    return (mask & ((cast<u64>(1ul)) << bit)) > 0
}

fn mask_set(mask: *u64, bit: u64, value: i32) none {
    if bit > 63 {
        bit %= 64
    }
    if value {
        mask[] |= (cast<u64>(1ul)) << bit
    }
    else {
        mask[] &= ~((cast<u64>(1ul)) << bit)
    }
}

m4_define(`MASK_FALSE', `TODO')m4_dnl
m4_ifelse(__OPTIM_LEVEL__, `1', `
m4_define(`MASK_TRUE', `TODO')m4_dnl
')m4_dnl
m4_define(`MASK_OFFSET', `TODO')m4_dnl

m4_define(`GET_DFA_BLOCK_SET_IDX', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_IDX', `TODO')m4_dnl

m4_define(`GET_DFA_BLOCK_SET_MASK', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_MASK', `TODO')m4_dnl

m4_define(`GET_DFA_BLOCK_SET_AT', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_AT', `TODO')m4_dnl

m4_define(`SET_DFA_INSTR_SET_AT', `TODO')m4_dnl

m4_ifelse(__OPTIM_LEVEL__, `1', `
m4_define(`GET_DFA_INSTR', `TODO')m4_dnl
')m4_dnl

fn is_transfer_instr(ctx: Ctx, instr_idx: u64
m4_ifelse(__OPTIM_LEVEL__, `1', `
    , is_store_elim: i32
')m4_dnl
) i32 {
    match (ctx[].p_instrs[])[instr_idx][].tag {
m4_ifelse(__OPTIM_LEVEL__, `1', `
        -> AST_TacSignExtend_t {
            -> AST_TacTruncate_t {
                -> AST_TacZeroExtend_t {
                    -> AST_TacDoubleToInt_t {
                        -> AST_TacDoubleToUInt_t {
                            -> AST_TacIntToDouble_t {
                                -> AST_TacUIntToDouble_t {
                                    -> AST_TacFunCall_t {
                                        -> AST_TacUnary_t {
                                            -> AST_TacBinary_t {
                                                -> AST_TacCopy_t {
                                                    -> AST_TacGetAddress_t {
                                                        -> AST_TacLoad_t {
                                                            -> AST_TacStore_t {
                                                                -> AST_TacAddPtr_t {
                                                                    -> AST_TacCopyToOffset_t {
                                                                        -> AST_TacCopyFromOffset_t {
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
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        -> AST_TacReturn_t {
            -> AST_TacJumpIfZero_t {
                -> AST_TacJumpIfNotZero_t {
                    return is_store_elim
                }
            }
        }
', __OPTIM_LEVEL__, `2', `
        -> AST_AsmMov_t {
            -> AST_AsmMovSx_t {
                -> AST_AsmMovZeroExtend_t {
                    -> AST_AsmLea_t {
                        -> AST_AsmCvttsd2si_t {
                            -> AST_AsmCvtsi2sd_t {
                                -> AST_AsmUnary_t {
                                    -> AST_AsmBinary_t {
                                        -> AST_AsmCmp_t {
                                            -> AST_AsmIdiv_t {
                                                -> AST_AsmDiv_t {
                                                    -> AST_AsmCdq_t {
                                                        -> AST_AsmSetCC_t {
                                                            -> AST_AsmPush_t {
                                                                -> AST_AsmCall_t {
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
                            }
                        }
                    }
                }
            }
        }
')m4_dnl
        otherwise {
            return false
        }
    }
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn get_dfa_data_idx(ctx: Ctx, instr_idx: u64) u64 {
    loop i: u64 = 0 while i < ctx[].dfa[].set_size .. ++i {
        if ctx[].dfa_o1[].data_idx_map[i] == instr_idx {
            return i
        }
    }
    panic_sigabrt("abort")
}

fn get_dfa_bak_instr(ctx: Ctx, i: u64) *struc TacInstruction {
    if ctx[].cfg[].reaching_code[i] {
        if ctx[].dfa_o1[].bak_instrs[i] {
            return ctx[].dfa_o1[].bak_instrs[i]
        }
        else {
            panic_sigabrt("abort")
        }
    }
    elif (ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]] {
        return (ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]]
    }
    else {
        panic_sigabrt("abort")
    }
}

fn set_dfa_bak_instr(ctx: Ctx, instr_idx: u64, i: *u64) i32 {
    i[] = get_dfa_data_idx(ctx, instr_idx)
    if not ctx[].cfg[].reaching_code[i[]] {
        ctx[].cfg[].reaching_code[i[]] = true
        return true
    }
    else {
        return false
    }
}
')m4_dnl

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn prop_transfer_reach_copies(ctx: Ctx, instr_idx: u64, next_instr_idx: u64) i32;
fn elim_transfer_live_values(ctx: Ctx, instr_idx: u64, next_instr_idx: u64) none;
', __OPTIM_LEVEL__, `2', `
fn infer_transfer_live_regs(ctx: Ctx, instr_idx: u64, next_instr_idx: u64) none;
')m4_dnl

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_forward_transfer_block(ctx: Ctx, instr_idx: u64, block_id: u64) u64 {
    loop next_instr_idx: u64 = instr_idx + 1 while next_instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++next_instr_idx {
        if (ctx[].p_instrs[])[next_instr_idx] and is_transfer_instr(ctx, next_instr_idx, false) {
            loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
            }
            if not prop_transfer_reach_copies(ctx, instr_idx, next_instr_idx) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
            }
            instr_idx = next_instr_idx
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
    if not prop_transfer_reach_copies(ctx, instr_idx, ctx[].dfa[].incoming_idx) {
        loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
        }
    }
    return instr_idx
}
')m4_dnl

fn dfa_backward_transfer_block(ctx: Ctx, instr_idx: u64, block_id: u64) u64 {
    if instr_idx > 0 {
        loop next_instr_idx: u64 = instr_idx while next_instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
            if (ctx[].p_instrs[])[next_instr_idx] and is_transfer_instr(ctx, next_instr_idx
m4_ifelse(__OPTIM_LEVEL__, `1', `
                , true
')m4_dnl
            ) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
m4_ifelse(__OPTIM_LEVEL__, `1', `
                elim_transfer_live_values(
', __OPTIM_LEVEL__, `2', `
                infer_transfer_live_regs(
')m4_dnl
                    ctx, instr_idx, next_instr_idx)
                instr_idx = next_instr_idx
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
m4_ifelse(__OPTIM_LEVEL__, `1', `
    elim_transfer_live_values(
', __OPTIM_LEVEL__, `2', `
    infer_transfer_live_regs(
')m4_dnl
        ctx, instr_idx, ctx[].dfa[].incoming_idx)
    return instr_idx
}

fn dfa_after_meet_block(ctx: Ctx, block_id: u64) i32 {
    is_fixed_point: i32 = true
    {
        i: u64 = 0
        loop  while i < ctx[].dfa[].mask_size .. ++i {
            if ctx[].dfa[].blocks_mask_sets[(block_id) * ctx[].dfa[].mask_size + (i)] ~= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] {
                is_fixed_point = false
                break
            }
        }
        loop  while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].blocks_mask_sets[(block_id) * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)]
        }
    }
    return is_fixed_point
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_forward_meet_block(ctx: Ctx, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx
    loop  while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] and is_transfer_instr(ctx, instr_idx, false) {
            jump Lelse
        }
    }
    instr_idx = ctx[].dfa[].incoming_idx
    label Lelse
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)] = 18446744073709551615ul
    }
    loop i: u64 = 0 while i < vec_size(ctx[].cfg[].blocks[block_id].pred_ids) .. ++i { # TODO GET_CFG_BLOCK(block_id).pred_ids
        pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[i]
        if pred_id < ctx[].cfg[].exit_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] &= ctx[].dfa[].blocks_mask_sets[(pred_id) * ctx[].dfa[].mask_size + (j)]
            }
        }
        elif pred_id == ctx[].cfg[].entry_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] = 0ul
            }
            break
        }
        else {
            panic_sigabrt("abort")
        }
    }
    if instr_idx < ctx[].dfa[].incoming_idx {
        dfa_forward_transfer_block(ctx, instr_idx, block_id)
    }
    else {
        ;
    }
    return dfa_after_meet_block(ctx, block_id)
}
')m4_dnl

fn dfa_backward_meet_block(ctx: Ctx, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1
    loop while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
        if (ctx[].p_instrs[])[instr_idx] and is_transfer_instr(ctx, instr_idx
m4_ifelse(__OPTIM_LEVEL__, `1', `
            , true
')m4_dnl
        ) {
            jump Lelse
        }
    }
    instr_idx = ctx[].dfa[].incoming_idx
    label Lelse
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < vec_size(ctx[].cfg[].blocks[block_id].succ_ids) .. ++i { # TDOD GET_CFG_BLOCK(block_id).succ_ids
        succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[i]
        if succ_id < ctx[].cfg[].exit_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] |= ctx[].dfa[].blocks_mask_sets[(succ_id) * ctx[].dfa[].mask_size + (j)]
            }
        }
        elif succ_id == ctx[].cfg[].exit_id {
            loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
                ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (j)]
            }
            break
        }
        else {
            panic_sigabrt("abort")
        }
    }
    if instr_idx < ctx[].dfa[].incoming_idx {
        dfa_backward_transfer_block(ctx, instr_idx, block_id)
    }
    else {
        ;
    }
    return dfa_after_meet_block(ctx, block_id)
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_forward_iter_alg(ctx: Ctx) none {
    open_data_map_size: u64 = vec_size(ctx[].cfg[].blocks)
    loop i: u64 = 0 while i < open_data_map_size .. ++i {
        block_id: u64 = ctx[].dfa[].open_data_map[i]
        if block_id == ctx[].cfg[].exit_id {
            continue
        }
        is_fixed_point: i32 = dfa_forward_meet_block(ctx, block_id)
        if not is_fixed_point {
            loop j: u64 = 0 while j < vec_size(ctx[].cfg[].blocks[block_id].succ_ids) .. ++j { # TODO GET_CFG_BLOCK(block_id).succ_ids
                succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[j]
                if succ_id < ctx[].cfg[].exit_id {
                    loop k: u64 = i + 1 while k < open_data_map_size .. ++k {
                        if succ_id == ctx[].dfa[].open_data_map[k] {
                            jump Lelse
                        }
                    }
                    if open_data_map_size < vec_size(ctx[].dfa[].open_data_map) {
                        ctx[].dfa[].open_data_map[open_data_map_size] = succ_id
                    }
                    else {
                        vec_push_back(ctx[].dfa[].open_data_map, succ_id)
                    }
                    open_data_map_size++
                    label Lelse
                    ;
                }
                else {
                    ;
                }
            }
        }
    }
}
')m4_dnl

fn dfa_iter_alg(ctx: Ctx) none {
    open_data_map_size: u64 = vec_size(ctx[].cfg[].blocks)
    loop i: u64 = 0 while i < open_data_map_size .. ++i {
        block_id: u64 = ctx[].dfa[].open_data_map[i]
        if block_id == ctx[].cfg[].exit_id {
            continue
        }
        is_fixed_point: i32 = dfa_backward_meet_block(ctx, block_id)
        if not is_fixed_point {
            loop j: u64 = 0 while j < vec_size(ctx[].cfg[].blocks[block_id].pred_ids) .. ++j { # TODO GET_CFG_BLOCK(block_id).pred_ids
                pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[j]
                if pred_id < ctx[].cfg[].exit_id {
                    loop k: u64 = i + 1 while k < open_data_map_size .. ++k {
                        if pred_id == ctx[].dfa[].open_data_map[k] {
                            jump Lelse
                        }
                    }
                    if open_data_map_size < vec_size(ctx[].dfa[].open_data_map) {
                        ctx[].dfa[].open_data_map[open_data_map_size] = pred_id
                    }
                    else {
                        vec_push_back(ctx[].dfa[].open_data_map, pred_id)
                    }
                    open_data_map_size++
                    label Lelse
                    ;
                }
                else {
                    ;
                }
            }
        }
    }
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_forward_open_block(ctx: Ctx, block_id: u64, i: *u64) none;
')m4_dnl
fn dfa_backward_open_block(ctx: Ctx, block_id: u64, i: *u64) none;

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_forward_succ_open_block(ctx: Ctx, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < vec_size(ctx[].cfg[].blocks[block_id].succ_ids) .. ++j { # TODO GET_CFG_BLOCK(block_id).succ_ids
        dfa_forward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}
')m4_dnl

fn dfa_backward_succ_open_block(ctx: Ctx, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < vec_size(ctx[].cfg[].blocks[block_id].succ_ids) .. ++j { # TODO GET_CFG_BLOCK(block_id).succ_ids
        dfa_backward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_forward_open_block(ctx: Ctx, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_forward_succ_open_block(ctx, block_id, i)
        (i[])--
        ctx[].dfa[].open_data_map[i[]] = block_id
    }
}
')m4_dnl

fn dfa_backward_open_block(ctx: Ctx, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_backward_succ_open_block(ctx, block_id, i)
        ctx[].dfa[].open_data_map[i[]] = block_id
        (i[])++
    }
}

fn is_aliased_name(ctx: Ctx, name: u64) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t or (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1
}

m4_ifelse(__OPTIM_LEVEL__, `1', `
fn dfa_add_aliased_value(ctx: Ctx, node: *struc TacValue) none {
    if node[].tag == AST_TacVariable_t {
        set_insert(ctx[].frontend[].addressed_set, node[].get._TacVariable.name)
    }
}

fn is_same_value(node_1: *struc TacValue, node_2: *struc TacValue) i32;

fn prop_add_data_idx(ctx: Ctx, node: *struc TacCopy, instr_idx: u64, block_id: u64) i32 {
    ;
    if is_same_value(node[].src, node[].dst) {
        cfg_rm_block_instr(ctx, instr_idx, block_id)
        return false
    }
    else {
        if ctx[].dfa[].set_size < vec_size(ctx[].dfa_o1[].data_idx_map) {
            ctx[].dfa_o1[].data_idx_map[ctx[].dfa[].set_size] = instr_idx
        }
        else {
            vec_push_back(ctx[].dfa_o1[].data_idx_map, instr_idx)
        }
        ctx[].dfa[].set_size++
        return true
    }
}

fn elim_add_data_name(ctx: Ctx, name: u64) none {
    if (? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->cfg->identifier_id_map, name, ctx->dfa->set_size)"
            loop .. while 0 {
                (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
                (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = (ctx[].dfa[].set_size)
            }
        }
        ctx[].dfa[].set_size++
    }
}

fn elim_add_data_value(ctx: Ctx, node: *struc TacValue) none {
    if node[].tag == AST_TacVariable_t {
        elim_add_data_name(ctx, node[].get._TacVariable.name)
    }
}
', __OPTIM_LEVEL__, `2', `
fn infer_add_data_name(ctx: Ctx, name: u64) none {
    if not is_aliased_name(ctx, name) and (? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            " #@MACRO@:map_add(ctx->cfg->identifier_id_map, name, REGISTER_MASK_SIZE + ctx->dfa->set_size)"
            loop .. while 0 {
                (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
                (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = (REGISTER_MASK_SIZE + ctx[].dfa[].set_size)
            }
        }
        ctx[].dfa[].set_size++
    }
}

fn infer_add_data_op(ctx: Ctx, node: *struc AsmOperand) none {
    if node[].tag == AST_AsmPseudo_t {
        infer_add_data_name(ctx, node[].get._AsmPseudo.name)
    }
}
')m4_dnl

fn init_data_flow_analysis(ctx: Ctx,
m4_ifelse(__OPTIM_LEVEL__, `1', `
    is_store_elim: i32, is_addressed_set: i32
', __OPTIM_LEVEL__, `2', `
    fun_name: u64
')m4_dnl
) i32 {
    ctx[].dfa[].set_size = 0
    ctx[].dfa[].incoming_idx = vec_size(ctx[].p_instrs[])
    if vec_size(ctx[].dfa[].open_data_map) < vec_size(ctx[].cfg[].blocks) {
        vec_resize(ctx[].dfa[].open_data_map, vec_size(ctx[].cfg[].blocks))
    }
    {
        i: u64;
m4_ifelse(__OPTIM_LEVEL__, `1', `
        i = ? is_store_elim then 3 else 1
', __OPTIM_LEVEL__, `2', `
        i = 2
')m4_dnl
        if vec_size(ctx[].dfa[].instr_idx_map) < vec_size(ctx[].p_instrs[]) + i {
            vec_resize(ctx[].dfa[].instr_idx_map, vec_size(ctx[].p_instrs[]) + i)
        }
    }
    if vec_size(ctx[].cfg[].reaching_code) < vec_size(ctx[].cfg[].blocks) {
        vec_resize(ctx[].cfg[].reaching_code, vec_size(ctx[].cfg[].blocks))
    }
    memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * vec_size(ctx[].cfg[].blocks))
    instrs_mask_sets_size: u64 = 0
m4_ifelse(__OPTIM_LEVEL__, `1', `
    is_copy_prop: i32 = not is_store_elim
    if is_store_elim {
')m4_dnl
        loop .. while 0 {
            " #@MACRO@:map_clear(ctx->cfg->identifier_id_map)"
            if ctx[].cfg[].identifier_id_map {
                " #@MACRO@:map_delete(ctx->cfg->identifier_id_map)"
                loop .. while 0 {
                    cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
                    (ctx[].cfg[].identifier_id_map) = nil
                }
                ctx[].cfg[].identifier_id_map = map_new()
            }
            ;
        }
        ctx[].dfa[].static_idx = ctx[].dfa[].incoming_idx + 1
m4_ifelse(__OPTIM_LEVEL__, `1', `
        ctx[].dfa_o1[].addressed_idx = ctx[].dfa[].static_idx + 1
    }
    if is_addressed_set {
        loop .. while 0 {
            " #@MACRO@:set_clear(ctx->frontend->addressed_set)"
            loop .. while 0 {
                " #@MACRO@:map_clear(ctx->frontend->addressed_set)"
                if ctx[].frontend[].addressed_set {
                    " #@MACRO@:map_delete(ctx->frontend->addressed_set)"
                    loop .. while 0 {
                        cast<none>((? (ctx[].frontend[].addressed_set) ~= nil then stbds_hmfree_func((ctx[].frontend[].addressed_set) - 1, sizeof((ctx[].frontend[].addressed_set)[])) else cast<none>(0)))
                        (ctx[].frontend[].addressed_set) = nil
                    }
                    ctx[].frontend[].addressed_set = map_new()
                }
                ;
            }
        }
    }
')m4_dnl
    loop block_id: u64 = 0 while block_id < vec_size(ctx[].cfg[].blocks) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    node: *struc AstInstruction = (ctx[].p_instrs[])[instr_idx]
                    match node[].tag {
m4_ifelse(__OPTIM_LEVEL__, `1', `
                        -> AST_TacReturn_t {
                            if is_copy_prop {
                                jump Lcontinue
                            }
                            p_node: *struc TacReturn = @node[].get._TacReturn
                            if p_node[].val {
                                elim_add_data_value(ctx, p_node[].val)
                            }
                            break
                        }
                        -> AST_TacSignExtend_t {
                            if is_store_elim {
                                p_node: *struc TacSignExtend = @node[].get._TacSignExtend
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacTruncate_t {
                            if is_store_elim {
                                p_node: *struc TacTruncate = @node[].get._TacTruncate
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacZeroExtend_t {
                            if is_store_elim {
                                p_node: *struc TacZeroExtend = @node[].get._TacZeroExtend
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacDoubleToInt_t {
                            if is_store_elim {
                                p_node: *struc TacDoubleToInt = @node[].get._TacDoubleToInt
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacDoubleToUInt_t {
                            if is_store_elim {
                                p_node: *struc TacDoubleToUInt = @node[].get._TacDoubleToUInt
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacIntToDouble_t {
                            if is_store_elim {
                                p_node: *struc TacIntToDouble = @node[].get._TacIntToDouble
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacUIntToDouble_t {
                            if is_store_elim {
                                p_node: *struc TacUIntToDouble = @node[].get._TacUIntToDouble
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacFunCall_t {
                            if is_store_elim {
                                p_node: *struc TacFunCall = @node[].get._TacFunCall
                                loop i: u64 = 0 while i < vec_size(p_node[].args) .. ++i {
                                    elim_add_data_value(ctx, p_node[].args[i])
                                }
                                if p_node[].dst {
                                    elim_add_data_value(ctx, p_node[].dst)
                                }
                            }
                            break
                        }
                        -> AST_TacUnary_t {
                            if is_store_elim {
                                p_node: *struc TacUnary = @node[].get._TacUnary
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacBinary_t {
                            if is_store_elim {
                                p_node: *struc TacBinary = @node[].get._TacBinary
                                elim_add_data_value(ctx, p_node[].src1)
                                elim_add_data_value(ctx, p_node[].src2)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacCopy_t {
                            p_node: *struc TacCopy = @node[].get._TacCopy
                            if is_copy_prop {
                                if not prop_add_data_idx(ctx, p_node, instr_idx, block_id) {
                                    jump Lcontinue
                                }
                            }
                            else {
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacGetAddress_t {
                            p_node: *struc TacGetAddress = @node[].get._TacGetAddress
                            if is_store_elim {
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            if is_addressed_set {
                                dfa_add_aliased_value(ctx, p_node[].src)
                            }
                            break
                        }
                        -> AST_TacLoad_t {
                            if is_store_elim {
                                p_node: *struc TacLoad = @node[].get._TacLoad
                                elim_add_data_value(ctx, p_node[].src_ptr)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacStore_t {
                            if is_store_elim {
                                p_node: *struc TacStore = @node[].get._TacStore
                                elim_add_data_value(ctx, p_node[].src)
                                elim_add_data_value(ctx, p_node[].dst_ptr)
                            }
                            break
                        }
                        -> AST_TacAddPtr_t {
                            if is_store_elim {
                                p_node: *struc TacAddPtr = @node[].get._TacAddPtr
                                elim_add_data_value(ctx, p_node[].src_ptr)
                                elim_add_data_value(ctx, p_node[].idx)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacCopyToOffset_t {
                            if is_store_elim {
                                p_node: *struc TacCopyToOffset = @node[].get._TacCopyToOffset
                                elim_add_data_name(ctx, p_node[].dst_name)
                                elim_add_data_value(ctx, p_node[].src)
                            }
                            break
                        }
                        -> AST_TacCopyFromOffset_t {
                            if is_store_elim {
                                p_node: *struc TacCopyFromOffset = @node[].get._TacCopyFromOffset
                                elim_add_data_name(ctx, p_node[].src_name)
                                elim_add_data_value(ctx, p_node[].dst)
                            }
                            break
                        }
                        -> AST_TacJumpIfZero_t {
                            if is_copy_prop {
                                jump Lcontinue
                            }
                            elim_add_data_value(ctx, node[].get._TacJumpIfZero.condition)
                            break
                        }
                        -> AST_TacJumpIfNotZero_t {
                            if is_copy_prop {
                                jump Lcontinue
                            }
                            elim_add_data_value(ctx, node[].get._TacJumpIfNotZero.condition)
                            break
                        }
', __OPTIM_LEVEL__, `2', `
                        -> AST_AsmMov_t {
                            p_node: *struc AsmMov = @node[].get._AsmMov
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmMovSx_t {
                            p_node: *struc AsmMovSx = @node[].get._AsmMovSx
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmMovZeroExtend_t {
                            p_node: *struc AsmMovZeroExtend = @node[].get._AsmMovZeroExtend
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmLea_t {
                            p_node: *struc AsmLea = @node[].get._AsmLea
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmCvttsd2si_t {
                            p_node: *struc AsmCvttsd2si = @node[].get._AsmCvttsd2si
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmCvtsi2sd_t {
                            p_node: *struc AsmCvtsi2sd = @node[].get._AsmCvtsi2sd
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmUnary_t {
                            infer_add_data_op(ctx, node[].get._AsmUnary.dst)
                        }
                        break
                        -> AST_AsmBinary_t {
                            p_node: *struc AsmBinary = @node[].get._AsmBinary
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmCmp_t {
                            p_node: *struc AsmCmp = @node[].get._AsmCmp
                            infer_add_data_op(ctx, p_node[].src)
                            infer_add_data_op(ctx, p_node[].dst)
                            break
                        }
                        -> AST_AsmIdiv_t {
                            infer_add_data_op(ctx, node[].get._AsmIdiv.src)
                        }
                        break
                        -> AST_AsmDiv_t {
                            infer_add_data_op(ctx, node[].get._AsmDiv.src)
                        }
                        break
                        -> AST_AsmSetCC_t {
                            infer_add_data_op(ctx, node[].get._AsmSetCC.dst)
                        }
                        break
                        -> AST_AsmPush_t {
                            infer_add_data_op(ctx, node[].get._AsmPush.src)
                        }
                        break
                        -> AST_AsmCdq_t {
                            -> AST_AsmCall_t {
                                break
                            }
                        }
')m4_dnl
                        otherwise {
                            jump Lcontinue
                        }
                    }
                    ctx[].dfa[].instr_idx_map[instr_idx] = instrs_mask_sets_size
                    instrs_mask_sets_size++
                    label Lcontinue
                    ;
                }
            }
        }
        else {
            ctx[].cfg[].reaching_code[block_id] = true
        }
    }
    if ctx[].dfa[].set_size == 0 {
        return false
    }
m4_ifelse(__OPTIM_LEVEL__, `2', `
    if vec_size(ctx[].dfa_o2[].data_name_map) < ctx[].dfa[].set_size {
        vec_resize(ctx[].dfa_o2[].data_name_map, ctx[].dfa[].set_size)
    }
    ctx[].dfa[].set_size += REGISTER_MASK_SIZE
')m4_dnl
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
m4_ifelse(__OPTIM_LEVEL__, `1', `
    if is_store_elim {
')m4_dnl
        ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] = instrs_mask_sets_size
        instrs_mask_sets_size++
m4_ifelse(__OPTIM_LEVEL__, `1', `
        ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] = instrs_mask_sets_size
        instrs_mask_sets_size++
    }
')m4_dnl
    ctx[].dfa[].mask_size = (ctx[].dfa[].set_size + 63) / 64
    instrs_mask_sets_size *= ctx[].dfa[].mask_size
    blocks_mask_sets_size: u64 = ctx[].dfa[].mask_size * vec_size(ctx[].cfg[].blocks)
    if vec_size(ctx[].dfa[].blocks_mask_sets) < blocks_mask_sets_size {
        vec_resize(ctx[].dfa[].blocks_mask_sets, blocks_mask_sets_size)
    }
    if vec_size(ctx[].dfa[].instrs_mask_sets) < instrs_mask_sets_size {
        vec_resize(ctx[].dfa[].instrs_mask_sets, instrs_mask_sets_size)
m4_ifelse(__OPTIM_LEVEL__, `2', `
        memset(ctx[].dfa[].instrs_mask_sets, 0ul, sizeof<u64> * instrs_mask_sets_size)
')m4_dnl
    }
m4_ifelse(__OPTIM_LEVEL__, `1', `
    if is_copy_prop {
        i: u64 = vec_size(ctx[].cfg[].blocks)
        loop j: u64 = 0 while j < vec_size(ctx[].cfg[].entry_succ_ids) .. ++j {
            succ_id: u64 = ctx[].cfg[].entry_succ_ids[j]
            if not ctx[].cfg[].reaching_code[succ_id] {
                dfa_forward_open_block(ctx, succ_id, @i)
            }
        }
        loop while i-- > 0 {
            ctx[].dfa[].open_data_map[i] = ctx[].cfg[].exit_id
        }
        mask_true_back: u64 = 18446744073709551615ul
        i = ctx[].dfa[].set_size - (ctx[].dfa[].mask_size - 1) * 64
        if i > 0 {
            loop  while i < 64 .. ++i {
                mask_set(@mask_true_back, i, false)
            }
        }
        if vec_size(ctx[].cfg[].reaching_code) < ctx[].dfa[].set_size {
            vec_resize(ctx[].cfg[].reaching_code, ctx[].dfa[].set_size)
        }
        loop j: u64 = vec_size(ctx[].dfa_o1[].bak_instrs) while j <= ctx[].dfa[].set_size .. ++j {
            vec_push_back(ctx[].dfa_o1[].bak_instrs, uptr_new())
        }
        memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * ctx[].dfa[].set_size)
        if ctx[].dfa[].mask_size > 1 {
            i = 0
            loop .. while i < blocks_mask_sets_size {
                loop j: u64 = ctx[].dfa[].mask_size - 1 while j-- > 0 {
                    ctx[].dfa[].blocks_mask_sets[i] = 18446744073709551615ul
                    i++
                }
                ctx[].dfa[].blocks_mask_sets[i] = mask_true_back
                i++
            }
        }
        else {
            loop j: u64 = 0 while j < blocks_mask_sets_size .. ++j {
                ctx[].dfa[].blocks_mask_sets[j] = mask_true_back
            }
        }
    }
    else {
')m4_dnl
        i: u64 = 0
        loop j: u64 = 0 while j < vec_size(ctx[].cfg[].entry_succ_ids) .. ++j {
            succ_id: u64 = ctx[].cfg[].entry_succ_ids[j]
            if not ctx[].cfg[].reaching_code[succ_id] {
                dfa_backward_open_block(ctx, succ_id, @i)
            }
        }
        loop  while i < vec_size(ctx[].cfg[].blocks) .. ++i {
            ctx[].dfa[].open_data_map[i] = ctx[].cfg[].exit_id
        }
m4_ifelse(__OPTIM_LEVEL__, `1', `
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (0)] = 0ul
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (0)] = 0ul
', __OPTIM_LEVEL__, `2', `
    {
        fun_type: *struc FunType = @((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((fun_name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].get._FunType
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (0)] = fun_type[].ret_reg_mask
    }
')m4_dnl
        loop i = 1 while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
m4_ifelse(__OPTIM_LEVEL__, `1', `
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
')m4_dnl
        }
        loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
            name_id: *struc PairTIdentifierulong_t = @ctx[].cfg[].identifier_id_map[i]
m4_ifelse(__OPTIM_LEVEL__, `1', `
            if ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@(((name_id[]).key))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (? (name_id[]).value > 63 then (name_id[]).value / 64 else 0)], (name_id[]).value, true)
            }
            if (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@(((name_id[]).key))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1 {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (? (name_id[]).value > 63 then (name_id[]).value / 64 else 0)], (name_id[]).value, true)
            }
', __OPTIM_LEVEL__, `2', `
        ctx[].dfa_o2[].data_name_map[(name_id[]).value - REGISTER_MASK_SIZE] = (name_id[]).key
')m4_dnl
        }
        memset(ctx[].dfa[].blocks_mask_sets, 0ul, sizeof<u64> * blocks_mask_sets_size)
m4_ifelse(__OPTIM_LEVEL__, `1', `
    }
')m4_dnl
    return true
}

', `')m4_dnl
')m4_dnl
