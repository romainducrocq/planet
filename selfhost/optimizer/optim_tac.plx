m4_include(`optim_tac.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/str2t.plx.m4')m4_dnl
m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/ast_t.plx.m4')m4_dnl
m4_include(`../ast/front_ast.plx.m4')m4_dnl
m4_include(`../ast/front_symt.plx.m4')m4_dnl
m4_include(`../ast/interm_ast.plx.m4')m4_dnl





type struc TacProgram;
type struc FrontEndContext;
pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none;

type struc ErrorsContext;
pub fn dbl_to_binary(decimal: f64) u64;
pub fn string_to_literal(str_string: string, string_literal: **i8) none;
pub fn string_to_char_ascii(str_char: string) i32;
pub fn string_bytes_to_int8(string_literal: *i8, byte_at: u64) i8;
pub fn string_bytes_to_int32(string_literal: *i8, byte_at: u64) i32;
pub fn string_bytes_to_int64(string_literal: *i8, byte_at: u64) i64;
pub fn string_literal_to_const(string_literal: *i8) string;
pub fn string_to_long(ctx: *struc ErrorsContext, str_int: string, info_at: u64, value: *i64) i32;
pub fn string_to_ulong(ctx: *struc ErrorsContext, str_uint: string, info_at: u64, value: *u64) i32;
pub fn string_to_dbl(ctx: *struc ErrorsContext, str_dbl: string, info_at: u64, value: *f64) i32;





type struc ControlFlowGraph;
type struc DataFlowAnalysis;
type struc DataFlowAnalysisO1;

type struc OptimTacContext(frontend: *struc FrontEndContext, is_fixed_point: i32, enabled_optims: [5]i32, cfg: *struc ControlFlowGraph, dfa: *struc DataFlowAnalysis, dfa_o1: *struc DataFlowAnalysisO1, p_instrs: ***struc TacInstruction)

m4_define(`GET_INSTR', `TODO')m4_dnl
m4_define(`GET_CFG_BLOCK', `TODO')m4_dnl
m4_define(`mask_t', `TODO')m4_dnl
m4_define(`AstInstruction', `TODO')m4_dnl
m4_define(`AstInstruction', `TODO')m4_dnl
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`Ctx', `TODO')m4_dnl
m4_define(`free_AstInstruction', `TODO')m4_dnl
m4_define(`free_AstInstruction', `TODO')m4_dnl
m4_define(`uptr_move_AstInstruction', `TODO')m4_dnl
m4_define(`uptr_move_AstInstruction', `TODO')m4_dnl

type struc ControlFlowBlock(size: u64, instrs_front_idx: u64, instrs_back_idx: u64, pred_ids: *u64, succ_ids: *u64)

type struc ControlFlowGraph(entry_id: u64, exit_id: u64, entry_succ_ids: *u64, exit_pred_ids: *u64, reaching_code: *i32, blocks: *struc ControlFlowBlock, identifier_id_map: *struc PairTIdentifierulong_t)

type struc DataFlowAnalysis(set_size: u64, mask_size: u64, incoming_idx: u64, static_idx: u64, open_data_map: *u64, instr_idx_map: *u64, blocks_mask_sets: *u64, instrs_mask_sets: *u64)

type struc DataFlowAnalysisO1(data_idx_map: *u64, bak_instrs: **struc TacInstruction, addressed_idx: u64)

fn free_ControlFlowGraph(self: **struc ControlFlowGraph) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    if (self[])[].entry_succ_ids {
        "@MACRO@:vec_delete((*self)->entry_succ_ids)"
        loop .. while 0 {
            cast<none>((? ((self[])[].entry_succ_ids) then free((cast<*struc stbds_array_header>(((self[])[].entry_succ_ids)) - 1)) else cast<none>(0)))
            ((self[])[].entry_succ_ids) = nil
        }
        (self[])[].entry_succ_ids = vec_new()
    }
    ;
    if (self[])[].exit_pred_ids {
        "@MACRO@:vec_delete((*self)->exit_pred_ids)"
        loop .. while 0 {
            cast<none>((? ((self[])[].exit_pred_ids) then free((cast<*struc stbds_array_header>(((self[])[].exit_pred_ids)) - 1)) else cast<none>(0)))
            ((self[])[].exit_pred_ids) = nil
        }
        (self[])[].exit_pred_ids = vec_new()
    }
    ;
    if (self[])[].reaching_code {
        "@MACRO@:vec_delete((*self)->reaching_code)"
        loop .. while 0 {
            cast<none>((? ((self[])[].reaching_code) then free((cast<*struc stbds_array_header>(((self[])[].reaching_code)) - 1)) else cast<none>(0)))
            ((self[])[].reaching_code) = nil
        }
        (self[])[].reaching_code = vec_new()
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].blocks) then (cast<*struc stbds_array_header>(((self[])[].blocks)) - 1)[].length else 0) .. ++i {
        if (self[])[].blocks[i].pred_ids {
            "@MACRO@:vec_delete((*self)->blocks[i].pred_ids)"
            loop .. while 0 {
                cast<none>((? ((self[])[].blocks[i].pred_ids) then free((cast<*struc stbds_array_header>(((self[])[].blocks[i].pred_ids)) - 1)) else cast<none>(0)))
                ((self[])[].blocks[i].pred_ids) = nil
            }
            (self[])[].blocks[i].pred_ids = vec_new()
        }
        ;
        if (self[])[].blocks[i].succ_ids {
            "@MACRO@:vec_delete((*self)->blocks[i].succ_ids)"
            loop .. while 0 {
                cast<none>((? ((self[])[].blocks[i].succ_ids) then free((cast<*struc stbds_array_header>(((self[])[].blocks[i].succ_ids)) - 1)) else cast<none>(0)))
                ((self[])[].blocks[i].succ_ids) = nil
            }
            (self[])[].blocks[i].succ_ids = vec_new()
        }
        ;
    }
    if (self[])[].blocks {
        "@MACRO@:vec_delete((*self)->blocks)"
        loop .. while 0 {
            cast<none>((? ((self[])[].blocks) then free((cast<*struc stbds_array_header>(((self[])[].blocks)) - 1)) else cast<none>(0)))
            ((self[])[].blocks) = nil
        }
        (self[])[].blocks = vec_new()
    }
    ;
    if (self[])[].identifier_id_map {
        "@MACRO@:map_delete((*self)->identifier_id_map)"
        loop .. while 0 {
            cast<none>((? ((self[])[].identifier_id_map) ~= nil then stbds_hmfree_func(((self[])[].identifier_id_map) - 1, sizeof(((self[])[].identifier_id_map)[])) else cast<none>(0)))
            ((self[])[].identifier_id_map) = nil
        }
        (self[])[].identifier_id_map = map_new()
    }
    ;
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_ControlFlowGraph(none) *struc ControlFlowGraph {
    self: *struc ControlFlowGraph = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(ControlFlowGraph, self)"
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
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    if (self[])[].open_data_map {
        "@MACRO@:vec_delete((*self)->open_data_map)"
        loop .. while 0 {
            cast<none>((? ((self[])[].open_data_map) then free((cast<*struc stbds_array_header>(((self[])[].open_data_map)) - 1)) else cast<none>(0)))
            ((self[])[].open_data_map) = nil
        }
        (self[])[].open_data_map = vec_new()
    }
    ;
    if (self[])[].instr_idx_map {
        "@MACRO@:vec_delete((*self)->instr_idx_map)"
        loop .. while 0 {
            cast<none>((? ((self[])[].instr_idx_map) then free((cast<*struc stbds_array_header>(((self[])[].instr_idx_map)) - 1)) else cast<none>(0)))
            ((self[])[].instr_idx_map) = nil
        }
        (self[])[].instr_idx_map = vec_new()
    }
    ;
    if (self[])[].blocks_mask_sets {
        "@MACRO@:vec_delete((*self)->blocks_mask_sets)"
        loop .. while 0 {
            cast<none>((? ((self[])[].blocks_mask_sets) then free((cast<*struc stbds_array_header>(((self[])[].blocks_mask_sets)) - 1)) else cast<none>(0)))
            ((self[])[].blocks_mask_sets) = nil
        }
        (self[])[].blocks_mask_sets = vec_new()
    }
    ;
    if (self[])[].instrs_mask_sets {
        "@MACRO@:vec_delete((*self)->instrs_mask_sets)"
        loop .. while 0 {
            cast<none>((? ((self[])[].instrs_mask_sets) then free((cast<*struc stbds_array_header>(((self[])[].instrs_mask_sets)) - 1)) else cast<none>(0)))
            ((self[])[].instrs_mask_sets) = nil
        }
        (self[])[].instrs_mask_sets = vec_new()
    }
    ;
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_DataFlowAnalysis(none) *struc DataFlowAnalysis {
    self: *struc DataFlowAnalysis = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(DataFlowAnalysis, self)"
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

fn free_DataFlowAnalysisO1(self: **struc DataFlowAnalysisO1) none {
    if not self[] {
        "@MACRO@:uptr_delete(*self)"
        return none
    }
    ;
    if (self[])[].data_idx_map {
        "@MACRO@:vec_delete((*self)->data_idx_map)"
        loop .. while 0 {
            cast<none>((? ((self[])[].data_idx_map) then free((cast<*struc stbds_array_header>(((self[])[].data_idx_map)) - 1)) else cast<none>(0)))
            ((self[])[].data_idx_map) = nil
        }
        (self[])[].data_idx_map = vec_new()
    }
    ;
    loop i: u64 = 0 while i < (? ((self[])[].bak_instrs) then (cast<*struc stbds_array_header>(((self[])[].bak_instrs)) - 1)[].length else 0) .. ++i {
        free_TacInstruction(@(self[])[].bak_instrs[i])
    }
    if (self[])[].bak_instrs {
        "@MACRO@:vec_delete((*self)->bak_instrs)"
        loop .. while 0 {
            cast<none>((? ((self[])[].bak_instrs) then free((cast<*struc stbds_array_header>(((self[])[].bak_instrs)) - 1)) else cast<none>(0)))
            ((self[])[].bak_instrs) = nil
        }
        (self[])[].bak_instrs = vec_new()
    }
    ;
    if self[] {
        "@MACRO@:uptr_free(*self)"
        free(self[])
        self[] = uptr_new()
    }
    ;
}

fn make_DataFlowAnalysisO1(none) *struc DataFlowAnalysisO1 {
    self: *struc DataFlowAnalysisO1 = uptr_new()
    loop .. while 0 {
        "@MACRO@:uptr_alloc(DataFlowAnalysisO1, self)"
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

fn set_instr(ctx: *struc OptimTacContext, instr: *struc TacInstruction, instr_idx: u64) none {
    if instr {
        if instr ~= (ctx[].p_instrs[])[instr_idx] {
            "@MACRO@:uptr_move(TacInstruction, instr, (*ctx->p_instrs)[instr_idx])"
            free_TacInstruction(@(ctx[].p_instrs[])[instr_idx])
            (ctx[].p_instrs[])[instr_idx] = instr
            instr = uptr_new()
        }
        ;
    }
    else {
        free_TacInstruction(@(ctx[].p_instrs[])[instr_idx])
    }
    ctx[].is_fixed_point = false
}

fn find_size_t(xs: *u64, x: u64) i32 {
    loop i: u64 = 0 while i < (? (xs) then (cast<*struc stbds_array_header>((xs)) - 1)[].length else 0) .. ++i {
        if xs[i] == x {
            return true
        }
    }
    return false
}

fn cfg_add_edge(succ_ids: **u64, pred_ids: **u64, succ_id: u64, pred_id: u64) none {
    if not find_size_t(succ_ids[], succ_id) {
        loop .. while 0 {
            "@MACRO@:vec_push_back(*succ_ids, succ_id)"
            loop .. while 0 {
                (? (not (succ_ids[]) or (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].capacity) then (((succ_ids[]) = stbds_arrgrowf((succ_ids[]), sizeof((succ_ids[])[]), (1), (0))) and 0) else 0)
                (succ_ids[])[(cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length++] = (succ_id)
            }
        }
    }
    if not find_size_t(pred_ids[], pred_id) {
        loop .. while 0 {
            "@MACRO@:vec_push_back(*pred_ids, pred_id)"
            loop .. while 0 {
                (? (not (pred_ids[]) or (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length + (1) > (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].capacity) then (((pred_ids[]) = stbds_arrgrowf((pred_ids[]), sizeof((pred_ids[])[]), (1), (0))) and 0) else 0)
                (pred_ids[])[(cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length++] = (pred_id)
            }
        }
    }
}

fn cfg_add_succ_edge(ctx: *struc OptimTacContext, block_id: u64, succ_id: u64) none {
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

fn cfg_add_pred_edge(ctx: *struc OptimTacContext, block_id: u64, pred_id: u64) none {
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

fn cfg_rm_edge(succ_ids: **u64, pred_ids: **u64, succ_id: u64, pred_id: u64, is_reachable: i32) none {
    if is_reachable {
        loop i: u64 = (? (succ_ids[]) then (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length else 0) while i-- > 0 {
            if (succ_ids[])[i] == succ_id {
                loop .. while 0 {
                    "@MACRO@:vec_remove_swap(*succ_ids, i)"
                    loop .. while 0 {
                        (succ_ids[])[i] = ((succ_ids[])[(cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length - 1])
                        (cast<*struc stbds_array_header>((succ_ids[])) - 1)[].length -= 1
                    }
                }
                break
            }
        }
    }
    loop i: u64 = (? (pred_ids[]) then (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length else 0) while i-- > 0 {
        if (pred_ids[])[i] == pred_id {
            loop .. while 0 {
                "@MACRO@:vec_remove_swap(*pred_ids, i)"
                loop .. while 0 {
                    (pred_ids[])[i] = ((pred_ids[])[(cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length - 1])
                    (cast<*struc stbds_array_header>((pred_ids[])) - 1)[].length -= 1
                }
            }
            break
        }
    }
}

fn cfg_rm_succ_edge(ctx: *struc OptimTacContext, block_id: u64, succ_id: u64, is_reachable: i32) none {
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

fn cfg_rm_pred_edge(ctx: *struc OptimTacContext, block_id: u64, pred_id: u64) none {
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

fn cfg_rm_empty_block(ctx: *struc OptimTacContext, block_id: u64, is_reachable: i32) none {
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
        succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[i]
        if is_reachable {
            loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++j {
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
        loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++i {
            pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[i]
            cfg_rm_pred_edge(ctx, block_id, pred_id)
        }
    }
    ctx[].cfg[].blocks[block_id].instrs_front_idx = ctx[].cfg[].exit_id
    ctx[].cfg[].blocks[block_id].instrs_back_idx = ctx[].cfg[].exit_id
}

fn cfg_rm_block_instr(ctx: *struc OptimTacContext, instr_idx: u64, block_id: u64) none {
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

fn cfg_init_label_block(ctx: *struc OptimTacContext, node: *struc TacLabel) none {
    loop .. while 0 {
        "@MACRO@:map_add(ctx->cfg->identifier_id_map, node->name, vec_size(ctx->cfg->blocks) - 1)"
        loop .. while 0 {
            (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (node[].name)
            (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1)
        }
    }
}

fn cfg_init_block(ctx: *struc OptimTacContext, instr_idx: u64, instrs_back_idx: *u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacLabel_t {
            if instrs_back_idx[] ~= (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instrs_back_idx[]
                block: struc ControlFlowBlock = $(0, instr_idx, 0, vec_new(), vec_new())
                loop .. while 0 {
                    "@MACRO@:vec_push_back(ctx->cfg->blocks, block)"
                    loop .. while 0 {
                        (? (not (ctx[].cfg[].blocks) or (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].capacity) then (((ctx[].cfg[].blocks) = stbds_arrgrowf((ctx[].cfg[].blocks), sizeof((ctx[].cfg[].blocks)[]), (1), (0))) and 0) else 0)
                        (ctx[].cfg[].blocks)[(cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length++] = (block)
                    }
                }
            }
            cfg_init_label_block(ctx, @node[].get._TacLabel)
            instrs_back_idx[] = instr_idx
            break
        }
        -> AST_TacReturn_t {
            -> AST_TacJump_t {
                -> AST_TacJumpIfZero_t {
                    -> AST_TacJumpIfNotZero_t {
                        (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instr_idx
                        instrs_back_idx[] = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
                        break
                    }
                }
            }
        }
        otherwise {
            instrs_back_idx[] = instr_idx
            break
        }
    }
}

fn cfg_init_jump_edges(ctx: *struc OptimTacContext, node: *struc TacJump, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
}

fn cfg_init_jmp_eq_0_edges(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}

fn cfg_init_jmp_ne_0_edges(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, block_id: u64) none {
    cfg_add_succ_edge(ctx, block_id, ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].target))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value))
    cfg_add_succ_edge(ctx, block_id, block_id + 1)
}

fn cfg_init_edges(ctx: *struc OptimTacContext, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            cfg_add_succ_edge(ctx, block_id, ctx[].cfg[].exit_id)
        }
        break
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
        otherwise {
            cfg_add_succ_edge(ctx, block_id, block_id + 1)
        }
        break
    }
}

fn init_control_flow_graph(ctx: *struc OptimTacContext) none {
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].pred_ids {
            "@MACRO@:vec_delete(GET_CFG_BLOCK(block_id).pred_ids)"
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].blocks[block_id].pred_ids) then free((cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)) else cast<none>(0)))
                (ctx[].cfg[].blocks[block_id].pred_ids) = nil
            }
            ctx[].cfg[].blocks[block_id].pred_ids = vec_new()
        }
        ;
        if ctx[].cfg[].blocks[block_id].succ_ids {
            "@MACRO@:vec_delete(GET_CFG_BLOCK(block_id).succ_ids)"
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].blocks[block_id].succ_ids) then free((cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)) else cast<none>(0)))
                (ctx[].cfg[].blocks[block_id].succ_ids) = nil
            }
            ctx[].cfg[].blocks[block_id].succ_ids = vec_new()
        }
        ;
    }
    if ctx[].cfg[].blocks {
        "@MACRO@:vec_clear(ctx->cfg->blocks)"
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length = 0
    }
    ;
    loop .. while 0 {
        "@MACRO@:map_clear(ctx->cfg->identifier_id_map)"
        if ctx[].cfg[].identifier_id_map {
            "@MACRO@:map_delete(ctx->cfg->identifier_id_map)"
            loop .. while 0 {
                cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
                (ctx[].cfg[].identifier_id_map) = nil
            }
            ctx[].cfg[].identifier_id_map = map_new()
        }
        ;
    }
    {
        instrs_back_idx: u64 = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
        loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
            if (ctx[].p_instrs[])[instr_idx] {
                if instrs_back_idx == (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
                    block: struc ControlFlowBlock = $(0, instr_idx, 0, vec_new(), vec_new())
                    loop .. while 0 {
                        "@MACRO@:vec_push_back(ctx->cfg->blocks, block)"
                        loop .. while 0 {
                            (? (not (ctx[].cfg[].blocks) or (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].capacity) then (((ctx[].cfg[].blocks) = stbds_arrgrowf((ctx[].cfg[].blocks), sizeof((ctx[].cfg[].blocks)[]), (1), (0))) and 0) else 0)
                            (ctx[].cfg[].blocks)[(cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length++] = (block)
                        }
                    }
                }
                cfg_init_block(ctx, instr_idx, @instrs_back_idx)
                (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].size++
            }
        }
        if instrs_back_idx ~= (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) {
            (ctx[].cfg[].blocks)[(? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) - 1].instrs_back_idx = instrs_back_idx
        }
    }
    ctx[].cfg[].exit_id = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    ctx[].cfg[].entry_id = ctx[].cfg[].exit_id + 1
    if ctx[].cfg[].entry_succ_ids {
        "@MACRO@:vec_clear(ctx->cfg->entry_succ_ids)"
        (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length = 0
    }
    ;
    if ctx[].cfg[].exit_pred_ids {
        "@MACRO@:vec_clear(ctx->cfg->exit_pred_ids)"
        (cast<*struc stbds_array_header>((ctx[].cfg[].exit_pred_ids)) - 1)[].length = 0
    }
    ;
    if not ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) == 0) {
        cfg_add_pred_edge(ctx, 0, ctx[].cfg[].entry_id)
        loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
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
m4_define(`MASK_TRUE', `TODO')m4_dnl
m4_define(`MASK_OFFSET', `TODO')m4_dnl
m4_define(`GET_DFA_BLOCK_SET_IDX', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_IDX', `TODO')m4_dnl
m4_define(`GET_DFA_BLOCK_SET_MASK', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_MASK', `TODO')m4_dnl
m4_define(`GET_DFA_BLOCK_SET_AT', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR_SET_AT', `TODO')m4_dnl
m4_define(`SET_DFA_INSTR_SET_AT', `TODO')m4_dnl
m4_define(`GET_DFA_INSTR', `TODO')m4_dnl

fn is_transfer_instr(ctx: *struc OptimTacContext, instr_idx: u64, is_store_elim: i32) i32 {
    match (ctx[].p_instrs[])[instr_idx][].tag {
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
        otherwise {
            return false
        }
    }
}

fn get_dfa_data_idx(ctx: *struc OptimTacContext, instr_idx: u64) u64 {
    loop i: u64 = 0 while i < ctx[].dfa[].set_size .. ++i {
        if ctx[].dfa_o1[].data_idx_map[i] == instr_idx {
            return i
        }
    }
    panic_sigabrt("abort")
}

fn get_dfa_bak_instr(ctx: *struc OptimTacContext, i: u64) *struc TacInstruction {
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

fn set_dfa_bak_instr(ctx: *struc OptimTacContext, instr_idx: u64, i: *u64) i32 {
    i[] = get_dfa_data_idx(ctx, instr_idx)
    if not ctx[].cfg[].reaching_code[i[]] {
        ctx[].cfg[].reaching_code[i[]] = true
        return true
    }
    else {
        return false
    }
}

fn prop_transfer_reach_copies(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) i32;
fn elim_transfer_live_values(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) none;

fn dfa_forward_transfer_block(ctx: *struc OptimTacContext, instr_idx: u64, block_id: u64) u64 {
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

fn dfa_backward_transfer_block(ctx: *struc OptimTacContext, instr_idx: u64, block_id: u64) u64 {
    if instr_idx > 0 {
        loop next_instr_idx: u64 = instr_idx while next_instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
            if (ctx[].p_instrs[])[next_instr_idx] and is_transfer_instr(ctx, next_instr_idx, true) {
                loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
                    ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
                }
                elim_transfer_live_values(ctx, instr_idx, next_instr_idx)
                instr_idx = next_instr_idx
            }
        }
    }
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] * ctx[].dfa[].mask_size + (i)] = ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)]
    }
    elim_transfer_live_values(ctx, instr_idx, ctx[].dfa[].incoming_idx)
    return instr_idx
}

fn dfa_after_meet_block(ctx: *struc OptimTacContext, block_id: u64) i32 {
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

fn dfa_forward_meet_block(ctx: *struc OptimTacContext, block_id: u64) i32 {
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
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++i {
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

fn dfa_backward_meet_block(ctx: *struc OptimTacContext, block_id: u64) i32 {
    instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1
    loop while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
        if (ctx[].p_instrs[])[instr_idx] and is_transfer_instr(ctx, instr_idx, true) {
            jump Lelse
        }
    }
    instr_idx = ctx[].dfa[].incoming_idx
    label Lelse
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
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

fn dfa_forward_iter_alg(ctx: *struc OptimTacContext) none {
    open_data_map_size: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    loop i: u64 = 0 while i < open_data_map_size .. ++i {
        block_id: u64 = ctx[].dfa[].open_data_map[i]
        if block_id == ctx[].cfg[].exit_id {
            continue
        }
        is_fixed_point: i32 = dfa_forward_meet_block(ctx, block_id)
        if not is_fixed_point {
            loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
                succ_id: u64 = ctx[].cfg[].blocks[block_id].succ_ids[j]
                if succ_id < ctx[].cfg[].exit_id {
                    loop k: u64 = i + 1 while k < open_data_map_size .. ++k {
                        if succ_id == ctx[].dfa[].open_data_map[k] {
                            jump Lelse
                        }
                    }
                    if open_data_map_size < (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) {
                        ctx[].dfa[].open_data_map[open_data_map_size] = succ_id
                    }
                    else {
                        loop .. while 0 {
                            "@MACRO@:vec_push_back(ctx->dfa->open_data_map, succ_id)"
                            loop .. while 0 {
                                (? (not (ctx[].dfa[].open_data_map) or (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity) then (((ctx[].dfa[].open_data_map) = stbds_arrgrowf((ctx[].dfa[].open_data_map), sizeof((ctx[].dfa[].open_data_map)[]), (1), (0))) and 0) else 0)
                                (ctx[].dfa[].open_data_map)[(cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length++] = (succ_id)
                            }
                        }
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

fn dfa_iter_alg(ctx: *struc OptimTacContext) none {
    open_data_map_size: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    loop i: u64 = 0 while i < open_data_map_size .. ++i {
        block_id: u64 = ctx[].dfa[].open_data_map[i]
        if block_id == ctx[].cfg[].exit_id {
            continue
        }
        is_fixed_point: i32 = dfa_backward_meet_block(ctx, block_id)
        if not is_fixed_point {
            loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) .. ++j {
                pred_id: u64 = ctx[].cfg[].blocks[block_id].pred_ids[j]
                if pred_id < ctx[].cfg[].exit_id {
                    loop k: u64 = i + 1 while k < open_data_map_size .. ++k {
                        if pred_id == ctx[].dfa[].open_data_map[k] {
                            jump Lelse
                        }
                    }
                    if open_data_map_size < (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) {
                        ctx[].dfa[].open_data_map[open_data_map_size] = pred_id
                    }
                    else {
                        loop .. while 0 {
                            "@MACRO@:vec_push_back(ctx->dfa->open_data_map, pred_id)"
                            loop .. while 0 {
                                (? (not (ctx[].dfa[].open_data_map) or (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity) then (((ctx[].dfa[].open_data_map) = stbds_arrgrowf((ctx[].dfa[].open_data_map), sizeof((ctx[].dfa[].open_data_map)[]), (1), (0))) and 0) else 0)
                                (ctx[].dfa[].open_data_map)[(cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length++] = (pred_id)
                            }
                        }
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

fn dfa_forward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none;
fn dfa_backward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none;

fn dfa_forward_succ_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
        dfa_forward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}

fn dfa_backward_succ_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    loop j: u64 = 0 while j < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++j {
        dfa_backward_open_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[j], i)
    }
}

fn dfa_forward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_forward_succ_open_block(ctx, block_id, i)
        (i[])--
        ctx[].dfa[].open_data_map[i[]] = block_id
    }
}

fn dfa_backward_open_block(ctx: *struc OptimTacContext, block_id: u64, i: *u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        dfa_backward_succ_open_block(ctx, block_id, i)
        ctx[].dfa[].open_data_map[i[]] = block_id
        (i[])++
    }
}

fn is_aliased_name(ctx: *struc OptimTacContext, name: u64) i32 {
    return ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t or (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1
}

fn dfa_add_aliased_value(ctx: *struc OptimTacContext, node: *struc TacValue) none {
    if node[].tag == AST_TacVariable_t {
        loop .. while 0 {
            "@MACRO@:set_insert(ctx->frontend->addressed_set, node->get._TacVariable.name)"
            loop .. while 0 {
                "@MACRO@:map_add(ctx->frontend->addressed_set, node->get._TacVariable.name, 0)"
                loop .. while 0 {
                    (ctx[].frontend[].addressed_set) = stbds_hmput_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@((node[].get._TacVariable.name))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)
                    (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].key = (node[].get._TacVariable.name)
                    (ctx[].frontend[].addressed_set)[(cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp].value = (0)
                }
            }
        }
    }
}

fn is_same_value(node_1: *struc TacValue, node_2: *struc TacValue) i32;

fn prop_add_data_idx(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64, block_id: u64) i32 {
    ;
    if is_same_value(node[].src, node[].dst) {
        cfg_rm_block_instr(ctx, instr_idx, block_id)
        return false
    }
    else {
        if ctx[].dfa[].set_size < (? (ctx[].dfa_o1[].data_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].length else 0) {
            ctx[].dfa_o1[].data_idx_map[ctx[].dfa[].set_size] = instr_idx
        }
        else {
            loop .. while 0 {
                "@MACRO@:vec_push_back(ctx->dfa_o1->data_idx_map, instr_idx)"
                loop .. while 0 {
                    (? (not (ctx[].dfa_o1[].data_idx_map) or (cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].capacity) then (((ctx[].dfa_o1[].data_idx_map) = stbds_arrgrowf((ctx[].dfa_o1[].data_idx_map), sizeof((ctx[].dfa_o1[].data_idx_map)[]), (1), (0))) and 0) else 0)
                    (ctx[].dfa_o1[].data_idx_map)[(cast<*struc stbds_array_header>((ctx[].dfa_o1[].data_idx_map)) - 1)[].length++] = (instr_idx)
                }
            }
        }
        ctx[].dfa[].set_size++
        return true
    }
}

fn elim_add_data_name(ctx: *struc OptimTacContext, name: u64) none {
    if (? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp) == -1 {
        loop .. while 0 {
            "@MACRO@:map_add(ctx->cfg->identifier_id_map, name, ctx->dfa->set_size)"
            loop .. while 0 {
                (ctx[].cfg[].identifier_id_map) = stbds_hmput_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)
                (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].key = (name)
                (ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp].value = (ctx[].dfa[].set_size)
            }
        }
        ctx[].dfa[].set_size++
    }
}

fn elim_add_data_value(ctx: *struc OptimTacContext, node: *struc TacValue) none {
    if node[].tag == AST_TacVariable_t {
        elim_add_data_name(ctx, node[].get._TacVariable.name)
    }
}

fn init_data_flow_analysis(ctx: *struc OptimTacContext, is_store_elim: i32, is_addressed_set: i32) i32 {
    ctx[].dfa[].set_size = 0
    ctx[].dfa[].incoming_idx = (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0)
    if (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:vec_resize(ctx->dfa->open_data_map, vec_size(ctx->cfg->blocks))"
            loop .. while 0 {
                (? (? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].dfa[].open_data_map)) = stbds_arrgrowf(((ctx[].dfa[].open_data_map)), sizeof(((ctx[].dfa[].open_data_map))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
                ? (ctx[].dfa[].open_data_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].open_data_map)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
            }
        }
    }
    {
        i: u64;
        i = ? is_store_elim then 3 else 1
        if (? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].length else 0) < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i {
            loop .. while 0 {
                "@MACRO@:vec_resize(ctx->dfa->instr_idx_map, vec_size(*ctx->p_instrs) + i)"
                loop .. while 0 {
                    (? (? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)) then ((((ctx[].dfa[].instr_idx_map)) = stbds_arrgrowf(((ctx[].dfa[].instr_idx_map)), sizeof(((ctx[].dfa[].instr_idx_map))[]), (0), (cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)))))) and 0 else 0)
                    ? (ctx[].dfa[].instr_idx_map) then (cast<*struc stbds_array_header>((ctx[].dfa[].instr_idx_map)) - 1)[].length = cast<u64>(((? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) + i)) else 0
                }
            }
        }
    }
    if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:vec_resize(ctx->cfg->reaching_code, vec_size(ctx->cfg->blocks))"
            loop .. while 0 {
                (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
                ? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
            }
        }
    }
    memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))
    instrs_mask_sets_size: u64 = 0
    is_copy_prop: i32 = not is_store_elim
    if is_store_elim {
        loop .. while 0 {
            "@MACRO@:map_clear(ctx->cfg->identifier_id_map)"
            if ctx[].cfg[].identifier_id_map {
                "@MACRO@:map_delete(ctx->cfg->identifier_id_map)"
                loop .. while 0 {
                    cast<none>((? (ctx[].cfg[].identifier_id_map) ~= nil then stbds_hmfree_func((ctx[].cfg[].identifier_id_map) - 1, sizeof((ctx[].cfg[].identifier_id_map)[])) else cast<none>(0)))
                    (ctx[].cfg[].identifier_id_map) = nil
                }
                ctx[].cfg[].identifier_id_map = map_new()
            }
            ;
        }
        ctx[].dfa[].static_idx = ctx[].dfa[].incoming_idx + 1
        ctx[].dfa_o1[].addressed_idx = ctx[].dfa[].static_idx + 1
    }
    if is_addressed_set {
        loop .. while 0 {
            "@MACRO@:set_clear(ctx->frontend->addressed_set)"
            loop .. while 0 {
                "@MACRO@:map_clear(ctx->frontend->addressed_set)"
                if ctx[].frontend[].addressed_set {
                    "@MACRO@:map_delete(ctx->frontend->addressed_set)"
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
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
                    match node[].tag {
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
                                loop i: u64 = 0 while i < (? (p_node[].args) then (cast<*struc stbds_array_header>((p_node[].args)) - 1)[].length else 0) .. ++i {
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
    ctx[].dfa[].instr_idx_map[ctx[].dfa[].incoming_idx] = instrs_mask_sets_size
    instrs_mask_sets_size++
    if is_store_elim {
        ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] = instrs_mask_sets_size
        instrs_mask_sets_size++
        ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] = instrs_mask_sets_size
        instrs_mask_sets_size++
    }
    ctx[].dfa[].mask_size = (ctx[].dfa[].set_size + 63) / 64
    instrs_mask_sets_size *= ctx[].dfa[].mask_size
    blocks_mask_sets_size: u64 = ctx[].dfa[].mask_size * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    if (? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].length else 0) < blocks_mask_sets_size {
        loop .. while 0 {
            "@MACRO@:vec_resize(ctx->dfa->blocks_mask_sets, blocks_mask_sets_size)"
            loop .. while 0 {
                (? (? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].capacity else 0) < cast<u64>((blocks_mask_sets_size)) then ((((ctx[].dfa[].blocks_mask_sets)) = stbds_arrgrowf(((ctx[].dfa[].blocks_mask_sets)), sizeof(((ctx[].dfa[].blocks_mask_sets))[]), (0), (cast<u64>((blocks_mask_sets_size)))))) and 0 else 0)
                ? (ctx[].dfa[].blocks_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].blocks_mask_sets)) - 1)[].length = cast<u64>((blocks_mask_sets_size)) else 0
            }
        }
    }
    if (? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].length else 0) < instrs_mask_sets_size {
        loop .. while 0 {
            "@MACRO@:vec_resize(ctx->dfa->instrs_mask_sets, instrs_mask_sets_size)"
            loop .. while 0 {
                (? (? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].capacity else 0) < cast<u64>((instrs_mask_sets_size)) then ((((ctx[].dfa[].instrs_mask_sets)) = stbds_arrgrowf(((ctx[].dfa[].instrs_mask_sets)), sizeof(((ctx[].dfa[].instrs_mask_sets))[]), (0), (cast<u64>((instrs_mask_sets_size)))))) and 0 else 0)
                ? (ctx[].dfa[].instrs_mask_sets) then (cast<*struc stbds_array_header>((ctx[].dfa[].instrs_mask_sets)) - 1)[].length = cast<u64>((instrs_mask_sets_size)) else 0
            }
        }
    }
    if is_copy_prop {
        i: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
        loop j: u64 = 0 while j < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++j {
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
        if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < ctx[].dfa[].set_size {
            loop .. while 0 {
                "@MACRO@:vec_resize(ctx->cfg->reaching_code, ctx->dfa->set_size)"
                loop .. while 0 {
                    (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>((ctx[].dfa[].set_size)) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>((ctx[].dfa[].set_size)))))) and 0 else 0)
                    ? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>((ctx[].dfa[].set_size)) else 0
                }
            }
        }
        loop j: u64 = (? (ctx[].dfa_o1[].bak_instrs) then (cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].length else 0) while j <= ctx[].dfa[].set_size .. ++j {
            loop .. while 0 {
                "@MACRO@:vec_push_back(ctx->dfa_o1->bak_instrs, uptr_new())"
                loop .. while 0 {
                    (? (not (ctx[].dfa_o1[].bak_instrs) or (cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].length + (1) > (cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].capacity) then (((ctx[].dfa_o1[].bak_instrs) = stbds_arrgrowf((ctx[].dfa_o1[].bak_instrs), sizeof((ctx[].dfa_o1[].bak_instrs)[]), (1), (0))) and 0) else 0)
                    (ctx[].dfa_o1[].bak_instrs)[(cast<*struc stbds_array_header>((ctx[].dfa_o1[].bak_instrs)) - 1)[].length++] = (uptr_new())
                }
            }
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
        i: u64 = 0
        loop j: u64 = 0 while j < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++j {
            succ_id: u64 = ctx[].cfg[].entry_succ_ids[j]
            if not ctx[].cfg[].reaching_code[succ_id] {
                dfa_backward_open_block(ctx, succ_id, @i)
            }
        }
        loop  while i < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++i {
            ctx[].dfa[].open_data_map[i] = ctx[].cfg[].exit_id
        }
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (0)] = 0ul
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (0)] = 0ul
        loop i = 1 while i < ctx[].dfa[].mask_size .. ++i {
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
            ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)] = 0ul
        }
        loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
            name_id: *struc PairTIdentifierulong_t = @ctx[].cfg[].identifier_id_map[i]
            if ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@(((name_id[]).key))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].attrs[].tag == AST_StaticAttr_t {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (? (name_id[]).value > 63 then (name_id[]).value / 64 else 0)], (name_id[]).value, true)
            }
            if (? ((ctx[].frontend[].addressed_set) = stbds_hmget_key((ctx[].frontend[].addressed_set), sizeof((ctx[].frontend[].addressed_set)[]), cast<*any>(@(((name_id[]).key))), sizeof((ctx[].frontend[].addressed_set)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].addressed_set) - 1)) - 1)[].temp) ~= -1 {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (? (name_id[]).value > 63 then (name_id[]).value / 64 else 0)], (name_id[]).value, true)
            }
        }
        memset(ctx[].dfa[].blocks_mask_sets, 0ul, sizeof<u64> * blocks_mask_sets_size)
    }
    return true
}

fn fold_sign_extend_char_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_sign_extend_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_sign_extend_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_sign_extend_char_const(ctx, node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_sign_extend_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_sign_extend_instr(ctx: *struc OptimTacContext, node: *struc TacSignExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_sign_extend_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_truncate_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_long_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstLong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_ulong_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstULong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_truncate_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstInt_t {
            fold_constant = fold_truncate_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_truncate_long_const(ctx, node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_truncate_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_truncate_ulong_const(ctx, node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_truncate_instr(ctx: *struc OptimTacContext, node: *struc TacTruncate, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_truncate_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_zero_extend_uchar_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_zero_extend_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                value: i64 = cast<i64>(constant[].value)
                return make_CConstLong(value)
            }
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_zero_extend_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstUChar_t {
            fold_constant = fold_zero_extend_uchar_const(ctx, node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_zero_extend_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_zero_extend_instr(ctx: *struc OptimTacContext, node: *struc TacZeroExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_zero_extend_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_dbl_to_signed_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = sptr_new()
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].get._CConstDouble.value)
                fold_constant = make_CConstChar(value)
                break
            }
        }
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstInt(value)
            break
        }
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstLong(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_dbl_to_signed_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_dbl_to_signed_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_dbl_to_unsigned_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = sptr_new()
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstUChar(value)
            break
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstUInt(value)
            break
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].get._CConstDouble.value)
            fold_constant = make_CConstULong(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_dbl_to_unsigned_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToUInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_dbl_to_unsigned_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_signed_to_dbl_const(constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            value: f64 = cast<f64>(constant[].get._CConstChar.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstInt_t {
            value: f64 = cast<f64>(constant[].get._CConstInt.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstLong_t {
            value: f64 = cast<f64>(constant[].get._CConstLong.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_signed_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_signed_to_dbl_const(node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_unsigned_to_dbl_const(constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstUChar_t {
            value: f64 = cast<f64>(constant[].get._CConstUChar.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstUInt_t {
            value: f64 = cast<f64>(constant[].get._CConstUInt.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        -> AST_CConstULong_t {
            value: f64 = cast<f64>(constant[].get._CConstULong.value)
            fold_constant = make_CConstDouble(value)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_unsigned_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacUIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_unsigned_to_dbl_const(node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_unary_char_const(node: *struc TacUnaryOp, constant: *struc CConstChar) *struc CConst {
    if node[].tag == AST_TacNot_t {
        value: i32 = ? not constant[].value then 1 else 0
        return make_CConstInt(value)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn fold_unary_int_const(node: *struc TacUnaryOp, constant: *struc CConstInt) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: i32 = ~constant[].value
            return make_CConstInt(value)
        }
        -> AST_TacNegate_t {
            value: i32 = -constant[].value
            return make_CConstInt(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_long_const(node: *struc TacUnaryOp, constant: *struc CConstLong) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: i64 = ~constant[].value
            return make_CConstLong(value)
        }
        -> AST_TacNegate_t {
            value: i64 = -constant[].value
            return make_CConstLong(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_dbl_const(node: *struc TacUnaryOp, constant: *struc CConstDouble) *struc CConst {
    match node[].tag {
        -> AST_TacNegate_t {
            value: f64 = -constant[].value
            return make_CConstDouble(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_uchar_const(node: *struc TacUnaryOp, constant: *struc CConstUChar) *struc CConst {
    if node[].tag == AST_TacNot_t {
        value: i32 = ? not constant[].value then 1 else 0
        return make_CConstInt(value)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn fold_unary_uint_const(node: *struc TacUnaryOp, constant: *struc CConstUInt) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: u32 = ~constant[].value
            return make_CConstUInt(value)
        }
        -> AST_TacNegate_t {
            value: u32 = -constant[].value
            return make_CConstUInt(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_ulong_const(node: *struc TacUnaryOp, constant: *struc CConstULong) *struc CConst {
    match node[].tag {
        -> AST_TacComplement_t {
            value: u64 = ~constant[].value
            return make_CConstULong(value)
        }
        -> AST_TacNegate_t {
            value: u64 = -constant[].value
            return make_CConstULong(value)
        }
        -> AST_TacNot_t {
            value: i32 = ? not constant[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_unary_const(node: *struc TacUnaryOp, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_unary_char_const(node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_unary_int_const(node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_unary_long_const(node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_unary_dbl_const(node, @constant[].get._CConstDouble)
            break
        }
        -> AST_CConstUChar_t {
            fold_constant = fold_unary_uchar_const(node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_unary_uint_const(node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_unary_ulong_const(node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_unary_instr(ctx: *struc OptimTacContext, node: *struc TacUnary, instr_idx: u64) none {
    if node[].src[].tag == AST_TacConstant_t {
        src: *struc TacValue = fold_unary_const(@node[].unop, node[].src[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_binary_int_const(node: *struc TacBinaryOp, constant_1: *struc CConstInt, constant_2: *struc CConstInt) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: i32 = constant_1[].value + constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacSubtract_t {
            value: i32 = constant_1[].value - constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacMultiply_t {
            value: i32 = constant_1[].value * constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacDivide_t {
            value: i32 = ? constant_2[].value ~= 0 then constant_1[].value / constant_2[].value else 0
            return make_CConstInt(value)
        }
        -> AST_TacRemainder_t {
            value: i32 = ? constant_2[].value ~= 0 then constant_1[].value % constant_2[].value else 0
            return make_CConstInt(value)
        }
        -> AST_TacBitAnd_t {
            value: i32 = constant_1[].value & constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitOr_t {
            value: i32 = constant_1[].value | constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitXor_t {
            value: i32 = constant_1[].value ^ constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: i32 = constant_1[].value << constant_2[].value
            return make_CConstInt(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: i32 = constant_1[].value >> constant_2[].value
                return make_CConstInt(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_long_const(node: *struc TacBinaryOp, constant_1: *struc CConstLong, constant_2: *struc CConstLong) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: i64 = constant_1[].value + constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacSubtract_t {
            value: i64 = constant_1[].value - constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacMultiply_t {
            value: i64 = constant_1[].value * constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacDivide_t {
            value: i64 = ? constant_2[].value ~= 0l then constant_1[].value / constant_2[].value else 0l
            return make_CConstLong(value)
        }
        -> AST_TacRemainder_t {
            value: i64 = ? constant_2[].value ~= 0l then constant_1[].value % constant_2[].value else 0l
            return make_CConstLong(value)
        }
        -> AST_TacBitAnd_t {
            value: i64 = constant_1[].value & constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitOr_t {
            value: i64 = constant_1[].value | constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitXor_t {
            value: i64 = constant_1[].value ^ constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: i64 = constant_1[].value << constant_2[].value
            return make_CConstLong(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: i64 = constant_1[].value >> constant_2[].value
                return make_CConstLong(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_dbl_const(node: *struc TacBinaryOp, constant_1: *struc CConstDouble, constant_2: *struc CConstDouble) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: f64 = constant_1[].value + constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacSubtract_t {
            value: f64 = constant_1[].value - constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacMultiply_t {
            value: f64 = constant_1[].value * constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacDivide_t {
            value: f64 = constant_1[].value / constant_2[].value
            return make_CConstDouble(value)
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_uint_const(node: *struc TacBinaryOp, constant_1: *struc CConstUInt, constant_2: *struc CConstUInt) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: u32 = constant_1[].value + constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacSubtract_t {
            value: u32 = constant_1[].value - constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacMultiply_t {
            value: u32 = constant_1[].value * constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacDivide_t {
            value: u32 = ? constant_2[].value ~= 0u then constant_1[].value / constant_2[].value else 0u
            return make_CConstUInt(value)
        }
        -> AST_TacRemainder_t {
            value: u32 = ? constant_2[].value ~= 0u then constant_1[].value % constant_2[].value else 0u
            return make_CConstUInt(value)
        }
        -> AST_TacBitAnd_t {
            value: u32 = constant_1[].value & constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitOr_t {
            value: u32 = constant_1[].value | constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitXor_t {
            value: u32 = constant_1[].value ^ constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: u32 = constant_1[].value << constant_2[].value
            return make_CConstUInt(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: u32 = constant_1[].value >> constant_2[].value
                return make_CConstUInt(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_ulong_const(node: *struc TacBinaryOp, constant_1: *struc CConstULong, constant_2: *struc CConstULong) *struc CConst {
    match node[].tag {
        -> AST_TacAdd_t {
            value: u64 = constant_1[].value + constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacSubtract_t {
            value: u64 = constant_1[].value - constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacMultiply_t {
            value: u64 = constant_1[].value * constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacDivide_t {
            value: u64 = ? constant_2[].value ~= 0ul then constant_1[].value / constant_2[].value else 0ul
            return make_CConstULong(value)
        }
        -> AST_TacRemainder_t {
            value: u64 = ? constant_2[].value ~= 0ul then constant_1[].value % constant_2[].value else 0ul
            return make_CConstULong(value)
        }
        -> AST_TacBitAnd_t {
            value: u64 = constant_1[].value & constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitOr_t {
            value: u64 = constant_1[].value | constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitXor_t {
            value: u64 = constant_1[].value ^ constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitShiftLeft_t {
            value: u64 = constant_1[].value << constant_2[].value
            return make_CConstULong(value)
        }
        -> AST_TacBitShiftRight_t {
            -> AST_TacBitShrArithmetic_t {
                value: u64 = constant_1[].value >> constant_2[].value
                return make_CConstULong(value)
            }
        }
        -> AST_TacEqual_t {
            value: i32 = ? constant_1[].value == constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacNotEqual_t {
            value: i32 = ? constant_1[].value ~= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessThan_t {
            value: i32 = ? constant_1[].value < constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacLessOrEqual_t {
            value: i32 = ? constant_1[].value <= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterThan_t {
            value: i32 = ? constant_1[].value > constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        -> AST_TacGreaterOrEqual_t {
            value: i32 = ? constant_1[].value >= constant_2[].value then 1 else 0
            return make_CConstInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_binary_const(node: *struc TacBinaryOp, constant_1: *struc CConst, constant_2: *struc CConst) *struc TacValue {
    ;
    fold_constant: *struc CConst = sptr_new()
    match constant_1[].tag {
        -> AST_CConstInt_t {
            fold_constant = fold_binary_int_const(node, @constant_1[].get._CConstInt, @constant_2[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_binary_long_const(node, @constant_1[].get._CConstLong, @constant_2[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_binary_dbl_const(node, @constant_1[].get._CConstDouble, @constant_2[].get._CConstDouble)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_binary_uint_const(node, @constant_1[].get._CConstUInt, @constant_2[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_binary_ulong_const(node, @constant_1[].get._CConstULong, @constant_2[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return make_TacConstant(@fold_constant)
}

fn fold_binary_instr(ctx: *struc OptimTacContext, node: *struc TacBinary, instr_idx: u64) none {
    if node[].src1[].tag == AST_TacConstant_t and node[].src2[].tag == AST_TacConstant_t {
        src: *struc TacValue = fold_binary_const(@node[].binop, node[].src1[].get._TacConstant.constant, node[].src2[].get._TacConstant.constant)
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        set_instr(ctx, make_TacCopy(@src, @dst), instr_idx)
    }
}

fn fold_copy_char_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                return sptr_new()
            }
        }
        -> AST_UChar_t {
            value: u8 = cast<u8>(constant[].value)
            return make_CConstUChar(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_int_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            return sptr_new()
        }
        -> AST_UInt_t {
            value: u32 = cast<u32>(constant[].value)
            return make_CConstUInt(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_long_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstLong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            -> AST_Pointer_t {
                return sptr_new()
            }
        }
        -> AST_Double_t {
            value: f64 = cast<f64>(constant[].value)
            return make_CConstDouble(value)
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_dbl_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstDouble) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].value)
            return make_CConstLong(value)
        }
        -> AST_Double_t {
            return sptr_new()
        }
        -> AST_ULong_t {
            value: u64 = cast<u64>(constant[].value)
            return make_CConstULong(value)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_uchar_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUChar) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                value: i8 = cast<i8>(constant[].value)
                return make_CConstChar(value)
            }
        }
        -> AST_UChar_t {
            return sptr_new()
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_uint_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstUInt) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Int_t {
            value: i32 = cast<i32>(constant[].value)
            return make_CConstInt(value)
        }
        -> AST_UInt_t {
            return sptr_new()
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_ulong_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConstULong) *struc CConst {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Long_t {
            value: i64 = cast<i64>(constant[].value)
            return make_CConstLong(value)
        }
        -> AST_Double_t {
            value: f64 = cast<f64>(constant[].value)
            return make_CConstDouble(value)
        }
        -> AST_Pointer_t {
            -> AST_ULong_t {
                return sptr_new()
            }
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_copy_const(ctx: *struc OptimTacContext, node: *struc TacVariable, constant: *struc CConst) *struc TacValue {
    fold_constant: *struc CConst = sptr_new()
    match constant[].tag {
        -> AST_CConstChar_t {
            fold_constant = fold_copy_char_const(ctx, node, @constant[].get._CConstChar)
            break
        }
        -> AST_CConstInt_t {
            fold_constant = fold_copy_int_const(ctx, node, @constant[].get._CConstInt)
            break
        }
        -> AST_CConstLong_t {
            fold_constant = fold_copy_long_const(ctx, node, @constant[].get._CConstLong)
            break
        }
        -> AST_CConstDouble_t {
            fold_constant = fold_copy_dbl_const(ctx, node, @constant[].get._CConstDouble)
            break
        }
        -> AST_CConstUChar_t {
            fold_constant = fold_copy_uchar_const(ctx, node, @constant[].get._CConstUChar)
            break
        }
        -> AST_CConstUInt_t {
            fold_constant = fold_copy_uint_const(ctx, node, @constant[].get._CConstUInt)
            break
        }
        -> AST_CConstULong_t {
            fold_constant = fold_copy_ulong_const(ctx, node, @constant[].get._CConstULong)
            break
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
    if fold_constant {
        return make_TacConstant(@fold_constant)
    }
    else {
        return sptr_new()
    }
}

fn fold_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy) none {
    if node[].src[].tag == AST_TacConstant_t {
        ;
        src: *struc TacValue = fold_copy_const(ctx, @node[].dst[].get._TacVariable, node[].src[].get._TacConstant.constant)
        if src {
            loop .. while 0 {
                "@MACRO@:sptr_move(TacValue, src, node->src)"
                if src ~= node[].src {
                    "@MACRO@:uptr_move(TacValue, src, node->src)"
                    free_TacValue(@node[].src)
                    node[].src = src
                    src = uptr_new()
                }
            }
            ctx[].is_fixed_point = false
        }
    }
}

fn is_const_zero(constant: *struc CConst) i32 {
    match constant[].tag {
        -> AST_CConstChar_t {
            return constant[].get._CConstChar.value == 0
        }
        -> AST_CConstInt_t {
            return constant[].get._CConstInt.value == 0
        }
        -> AST_CConstLong_t {
            return constant[].get._CConstLong.value == 0l
        }
        -> AST_CConstDouble_t {
            return constant[].get._CConstDouble.value == 0.0
        }
        -> AST_CConstUChar_t {
            return constant[].get._CConstUChar.value == 0u
        }
        -> AST_CConstUInt_t {
            return constant[].get._CConstUInt.value == 0u
        }
        -> AST_CConstULong_t {
            return constant[].get._CConstULong.value == 0ul
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn fold_jmp_eq_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, instr_idx: u64) none {
    if node[].condition[].tag == AST_TacConstant_t {
        if is_const_zero(node[].condition[].get._TacConstant.constant) {
            target: u64 = node[].target
            set_instr(ctx, make_TacJump(target), instr_idx)
        }
        else {
            set_instr(ctx, uptr_new(), instr_idx)
        }
    }
}

fn fold_jmp_ne_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, instr_idx: u64) none {
    if node[].condition[].tag == AST_TacConstant_t {
        if is_const_zero(node[].condition[].get._TacConstant.constant) {
            set_instr(ctx, uptr_new(), instr_idx)
        }
        else {
            target: u64 = node[].target
            set_instr(ctx, make_TacJump(target), instr_idx)
        }
    }
}

fn fold_instr(ctx: *struc OptimTacContext, instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            fold_sign_extend_instr(ctx, @node[].get._TacSignExtend, instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            fold_truncate_instr(ctx, @node[].get._TacTruncate, instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            fold_zero_extend_instr(ctx, @node[].get._TacZeroExtend, instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            fold_dbl_to_signed_instr(ctx, @node[].get._TacDoubleToInt, instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            fold_dbl_to_unsigned_instr(ctx, @node[].get._TacDoubleToUInt, instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            fold_signed_to_dbl_instr(ctx, @node[].get._TacIntToDouble, instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            fold_unsigned_to_dbl_instr(ctx, @node[].get._TacUIntToDouble, instr_idx)
        }
        break
        -> AST_TacUnary_t {
            fold_unary_instr(ctx, @node[].get._TacUnary, instr_idx)
        }
        break
        -> AST_TacBinary_t {
            fold_binary_instr(ctx, @node[].get._TacBinary, instr_idx)
        }
        break
        -> AST_TacCopy_t {
            fold_copy_instr(ctx, @node[].get._TacCopy)
        }
        break
        -> AST_TacJumpIfZero_t {
            fold_jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero, instr_idx)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            fold_jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn fold_constants(ctx: *struc OptimTacContext) none {
    loop instr_idx: u64 = 0 while instr_idx < (? (ctx[].p_instrs[]) then (cast<*struc stbds_array_header>((ctx[].p_instrs[])) - 1)[].length else 0) .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            fold_instr(ctx, instr_idx)
        }
    }
}

fn unreach_reachable_block(ctx: *struc OptimTacContext, block_id: u64) none;

fn unreach_succ_reachable_blocks(ctx: *struc OptimTacContext, block_id: u64) none {
    loop i: u64 = 0 while i < (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) .. ++i {
        unreach_reachable_block(ctx, ctx[].cfg[].blocks[block_id].succ_ids[i])
    }
}

fn unreach_reachable_block(ctx: *struc OptimTacContext, block_id: u64) none {
    if block_id < ctx[].cfg[].exit_id and not ctx[].cfg[].reaching_code[block_id] {
        ctx[].cfg[].reaching_code[block_id] = true
        unreach_succ_reachable_blocks(ctx, block_id)
    }
}

fn unreach_empty_block(ctx: *struc OptimTacContext, block_id: u64) none {
    loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
        if (ctx[].p_instrs[])[instr_idx] {
            set_instr(ctx, uptr_new(), instr_idx)
        }
    }
    ctx[].cfg[].blocks[block_id].size = 0
    cfg_rm_empty_block(ctx, block_id, false)
    if ctx[].cfg[].blocks[block_id].succ_ids {
        "@MACRO@:vec_clear(GET_CFG_BLOCK(block_id).succ_ids)"
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length = 0
    }
    ;
    if ctx[].cfg[].blocks[block_id].pred_ids {
        "@MACRO@:vec_clear(GET_CFG_BLOCK(block_id).pred_ids)"
        (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length = 0
    }
    ;
}

fn unreach_jump_instr(ctx: *struc OptimTacContext, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[ctx[].cfg[].blocks[block_id].instrs_back_idx]
    match node[].tag {
        -> AST_TacJump_t {
            -> AST_TacJumpIfZero_t {
                -> AST_TacJumpIfNotZero_t {
                    cfg_rm_block_instr(ctx, ctx[].cfg[].blocks[block_id].instrs_back_idx, block_id)
                }
            }
        }
        break
        otherwise {
            break
        }
    }
}

fn unreach_jump_block(ctx: *struc OptimTacContext, block_id: u64, next_block_id: u64) none {
    if (? (ctx[].cfg[].blocks[block_id].succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].succ_ids)) - 1)[].length else 0) == 1 and ctx[].cfg[].blocks[block_id].succ_ids[0] == next_block_id {
        unreach_jump_instr(ctx, block_id)
    }
}

fn unreach_label_instr(ctx: *struc OptimTacContext, block_id: u64) none {
    ;
    cfg_rm_block_instr(ctx, ctx[].cfg[].blocks[block_id].instrs_front_idx, block_id)
}

fn unreach_label_block(ctx: *struc OptimTacContext, block_id: u64, prev_block_id: u64) none {
    if (? (ctx[].cfg[].blocks[block_id].pred_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks[block_id].pred_ids)) - 1)[].length else 0) == 1 and ctx[].cfg[].blocks[block_id].pred_ids[0] == prev_block_id {
        unreach_label_instr(ctx, block_id)
    }
}

fn eliminate_unreachable_code(ctx: *struc OptimTacContext) none {
    if ((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) == 0) {
        return none
    }
    if (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length else 0) < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) {
        loop .. while 0 {
            "@MACRO@:vec_resize(ctx->cfg->reaching_code, vec_size(ctx->cfg->blocks))"
            loop .. while 0 {
                (? (? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].capacity else 0) < cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) then ((((ctx[].cfg[].reaching_code)) = stbds_arrgrowf(((ctx[].cfg[].reaching_code)), sizeof(((ctx[].cfg[].reaching_code))[]), (0), (cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))))))) and 0 else 0)
                ? (ctx[].cfg[].reaching_code) then (cast<*struc stbds_array_header>((ctx[].cfg[].reaching_code)) - 1)[].length = cast<u64>(((? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))) else 0
            }
        }
    }
    memset(ctx[].cfg[].reaching_code, false, sizeof<i32> * (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0))
    loop i: u64 = 0 while i < (? (ctx[].cfg[].entry_succ_ids) then (cast<*struc stbds_array_header>((ctx[].cfg[].entry_succ_ids)) - 1)[].length else 0) .. ++i {
        unreach_reachable_block(ctx, ctx[].cfg[].entry_succ_ids[i])
    }
    block_id: u64 = (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0)
    next_block_id: u64 = ctx[].cfg[].exit_id
    loop while block_id-- > 0 {
        if ctx[].cfg[].reaching_code[block_id] {
            next_block_id = block_id
            break
        }
        else {
            unreach_empty_block(ctx, block_id)
        }
    }
    loop while block_id-- > 0 {
        if ctx[].cfg[].reaching_code[block_id] {
            unreach_jump_block(ctx, block_id, next_block_id)
            next_block_id = block_id
        }
        else {
            unreach_empty_block(ctx, block_id)
        }
    }
    loop i: u64 = 0 while i < (? (ctx[].cfg[].identifier_id_map) then (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].length - 1 else 0) .. ++i {
        label_id: u64 = (ctx[].cfg[].identifier_id_map[i]).value
        if ctx[].cfg[].reaching_code[label_id] {
            loop block_id = label_id while block_id-- > 0 {
                if ctx[].cfg[].reaching_code[block_id] {
                    next_block_id = block_id
                    jump Lelse
                }
            }
            next_block_id = ctx[].cfg[].entry_id
            label Lelse
            unreach_label_block(ctx, label_id, next_block_id)
        }
        else {
            (ctx[].cfg[].identifier_id_map[i]).value = ctx[].cfg[].exit_id
        }
    }
}

fn is_aliased_value(ctx: *struc OptimTacContext, node: *struc TacValue) i32 {
    return node[].tag == AST_TacVariable_t and is_aliased_name(ctx, node[].get._TacVariable.name)
}

fn is_const_signed(node: *struc TacConstant) i32 {
    match node[].constant[].tag {
        -> AST_CConstChar_t {
            -> AST_CConstInt_t {
                -> AST_CConstLong_t {
                    return true
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_var_signed(ctx: *struc OptimTacContext, node: *struc TacVariable) i32 {
    match ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag {
        -> AST_Char_t {
            -> AST_SChar_t {
                -> AST_Int_t {
                    -> AST_Long_t {
                        return true
                    }
                }
            }
        }
        otherwise {
            return false
        }
    }
}

fn is_value_signed(ctx: *struc OptimTacContext, node: *struc TacValue) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return is_const_signed(@node[].get._TacConstant)
        }
        -> AST_TacVariable_t {
            return is_var_signed(ctx, @node[].get._TacVariable)
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_const_null_ptr(node: *struc TacConstant) i32 {
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

fn is_dbl_same_const(constant_1: *struc CConstDouble, constant_2: *struc CConstDouble) i32 {
    if constant_1[].value == constant_2[].value {
        if constant_1[].value ~= 0.0 {
            return true
        }
        else {
            return dbl_to_binary(constant_1[].value) == dbl_to_binary(constant_2[].value)
        }
    }
    elif constant_1[].value ~= constant_1[].value and constant_2[].value ~= constant_2[].value {
        return true
    }
    else {
        return false
    }
}

fn is_same_const(node_1: *struc TacConstant, node_2: *struc TacConstant) i32 {
    if node_1[].constant[].tag == node_2[].constant[].tag {
        match node_1[].constant[].tag {
            -> AST_CConstChar_t {
                return node_1[].constant[].get._CConstChar.value == node_2[].constant[].get._CConstChar.value
            }
            -> AST_CConstInt_t {
                return node_1[].constant[].get._CConstInt.value == node_2[].constant[].get._CConstInt.value
            }
            -> AST_CConstLong_t {
                return node_1[].constant[].get._CConstLong.value == node_2[].constant[].get._CConstLong.value
            }
            -> AST_CConstDouble_t {
                return is_dbl_same_const(@node_1[].constant[].get._CConstDouble, @node_2[].constant[].get._CConstDouble)
            }
            -> AST_CConstUChar_t {
                return node_1[].constant[].get._CConstUChar.value == node_2[].constant[].get._CConstUChar.value
            }
            -> AST_CConstUInt_t {
                return node_1[].constant[].get._CConstUInt.value == node_2[].constant[].get._CConstUInt.value
            }
            -> AST_CConstULong_t {
                return node_1[].constant[].get._CConstULong.value == node_2[].constant[].get._CConstULong.value
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    return false
}

fn is_same_var(node_1: *struc TacVariable, node_2: *struc TacVariable) i32 {
    return node_1[].name == node_2[].name
}

fn is_same_value(node_1: *struc TacValue, node_2: *struc TacValue) i32 {
    if node_1[].tag == node_2[].tag {
        match node_1[].tag {
            -> AST_TacConstant_t {
                return is_same_const(@node_1[].get._TacConstant, @node_2[].get._TacConstant)
            }
            -> AST_TacVariable_t {
                return is_same_var(@node_1[].get._TacVariable, @node_2[].get._TacVariable)
            }
            otherwise {
                panic_sigabrt("abort")
            }
        }
    }
    return false
}

fn is_same_name(node: *struc TacValue, name: u64) i32 {
    match node[].tag {
        -> AST_TacConstant_t {
            return false
        }
        -> AST_TacVariable_t {
            return node[].get._TacVariable.name == name
        }
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn is_copy_same_signedness(ctx: *struc OptimTacContext, node: *struc TacCopy) i32 {
    return is_value_signed(ctx, node[].src) == is_value_signed(ctx, node[].dst)
}

fn is_copy_null_ptr(ctx: *struc OptimTacContext, node: *struc TacCopy) i32 {
    if node[].src[].tag == AST_TacConstant_t and node[].dst[].tag == AST_TacVariable_t and ((? ((? ((ctx[].frontend[].symbol_table) = stbds_hmget_key((ctx[].frontend[].symbol_table), sizeof((ctx[].frontend[].symbol_table)[]), cast<*any>(@((node[].dst[].get._TacVariable.name))), sizeof((ctx[].frontend[].symbol_table)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].frontend[].symbol_table)[(cast<*struc stbds_array_header>(((ctx[].frontend[].symbol_table) - 1)) - 1)[].temp])[].value)[].type_t[].tag == AST_Pointer_t {
        return is_const_null_ptr(@node[].src[].get._TacConstant)
    }
    else {
        return false
    }
}

fn prop_transfer_dst_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_same_value(node, copy[].src) or is_same_value(node, copy[].dst) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_call(ctx: *struc OptimTacContext, node: *struc TacFunCall, next_instr_idx: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_aliased_value(ctx, copy[].src) or is_aliased_value(ctx, copy[].dst) or (node[].dst and (is_same_value(node[].dst, copy[].src) or is_same_value(node[].dst, copy[].dst))) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_copy(ctx: *struc OptimTacContext, node: *struc TacCopy, next_instr_idx: u64) i32 {
    ;
    loop i: u64 = 0 while i < ctx[].dfa[].set_size .. ++i {
        ;
        copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
        ;
        if is_same_value(node[].dst, copy[].dst) {
            if (is_copy_same_signedness(ctx, copy) or is_copy_null_ptr(ctx, copy)) and is_same_value(node[].src, copy[].src) {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
            }
            else {
                mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
            }
        }
        elif mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
            if is_same_value(node[].dst, copy[].src) {
                if is_same_value(node[].src, copy[].dst) {
                    return false
                }
                else {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                }
            }
        }
    }
    return true
}

fn prop_transfer_store(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_aliased_value(ctx, copy[].src) or is_aliased_value(ctx, copy[].dst) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_cp_to_offset(ctx: *struc OptimTacContext, node: *struc TacCopyToOffset, next_instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                ;
                copy: *struc TacCopy = @(ctx[].p_instrs[])[ctx[].dfa_o1[].data_idx_map[i]][].get._TacCopy
                ;
                if is_same_name(copy[].src, node[].dst_name) or is_same_name(copy[].dst, node[].dst_name) {
                    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
                    if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                        i = mask_set_size
                    }
                }
            }
        }
    }
}

fn prop_transfer_reach_copies(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) i32 {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            prop_transfer_dst_value(ctx, node[].get._TacSignExtend.dst, next_instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            prop_transfer_dst_value(ctx, node[].get._TacTruncate.dst, next_instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            prop_transfer_dst_value(ctx, node[].get._TacZeroExtend.dst, next_instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            prop_transfer_dst_value(ctx, node[].get._TacDoubleToInt.dst, next_instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            prop_transfer_dst_value(ctx, node[].get._TacDoubleToUInt.dst, next_instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            prop_transfer_dst_value(ctx, node[].get._TacIntToDouble.dst, next_instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            prop_transfer_dst_value(ctx, node[].get._TacUIntToDouble.dst, next_instr_idx)
        }
        break
        -> AST_TacFunCall_t {
            prop_transfer_call(ctx, @node[].get._TacFunCall, next_instr_idx)
        }
        break
        -> AST_TacUnary_t {
            prop_transfer_dst_value(ctx, node[].get._TacUnary.dst, next_instr_idx)
        }
        break
        -> AST_TacBinary_t {
            prop_transfer_dst_value(ctx, node[].get._TacBinary.dst, next_instr_idx)
        }
        break
        -> AST_TacCopy_t {
            return prop_transfer_copy(ctx, @node[].get._TacCopy, next_instr_idx)
        }
        -> AST_TacGetAddress_t {
            prop_transfer_dst_value(ctx, node[].get._TacGetAddress.dst, next_instr_idx)
        }
        break
        -> AST_TacLoad_t {
            prop_transfer_dst_value(ctx, node[].get._TacLoad.dst, next_instr_idx)
        }
        break
        -> AST_TacStore_t {
            prop_transfer_store(ctx, next_instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            prop_transfer_dst_value(ctx, node[].get._TacAddPtr.dst, next_instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            prop_transfer_cp_to_offset(ctx, @node[].get._TacCopyToOffset, next_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            prop_transfer_dst_value(ctx, node[].get._TacCopyFromOffset.dst, next_instr_idx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
    return true
}

fn get_dfa_bak_copy_instr(ctx: *struc OptimTacContext, i: u64) *struc TacCopy {
    node: *struc TacInstruction = get_dfa_bak_instr(ctx, i)
    ;
    return @node[].get._TacCopy
}

fn set_dfa_bak_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64) none {
    i: u64;
    if set_dfa_bak_instr(ctx, instr_idx, @i) {
        src: *struc TacValue = sptr_new()
        if node[].src ~= src {
            "@MACRO@:sptr_copy(TacValue, node->src, src)"
            free_TacValue(@src)
            src = node[].src
            (src)[]._ref_count++
        }
        ;
        dst: *struc TacValue = sptr_new()
        if node[].dst ~= dst {
            "@MACRO@:sptr_copy(TacValue, node->dst, dst)"
            free_TacValue(@dst)
            dst = node[].dst
            (dst)[]._ref_count++
        }
        ;
        free_TacInstruction(@ctx[].dfa_o1[].bak_instrs[i])
        ctx[].dfa_o1[].bak_instrs[i] = make_TacCopy(@src, @dst)
    }
}

fn prop_ret_instr(ctx: *struc OptimTacContext, node: *struc TacReturn, incoming_idx: u64, exit_block: i32) none {
    if node[].val and node[].val[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].val, copy[].dst) {
                        if copy[].src ~= node[].val {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->val)"
                            free_TacValue(@node[].val)
                            node[].val = copy[].src
                            (node[].val)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_sign_extend_instr(ctx: *struc OptimTacContext, node: *struc TacSignExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_truncate_instr(ctx: *struc OptimTacContext, node: *struc TacTruncate, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_zero_extend_instr(ctx: *struc OptimTacContext, node: *struc TacZeroExtend, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_dbl_to_int_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_dbl_to_uint_instr(ctx: *struc OptimTacContext, node: *struc TacDoubleToUInt, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_int_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_uint_to_dbl_instr(ctx: *struc OptimTacContext, node: *struc TacUIntToDouble, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_call_instr(ctx: *struc OptimTacContext, node: *struc TacFunCall, instr_idx: u64) none {
    loop i: u64 = 0 while i < (? (node[].args) then (cast<*struc stbds_array_header>((node[].args)) - 1)[].length else 0) .. ++i {
        if node[].args[i][].tag == AST_TacVariable_t {
            j: u64 = 0
            loop k: u64 = 0 while k < ctx[].dfa[].mask_size .. ++k {
                if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (k)] == 0ul {
                    j += 64
                    continue
                }
                mask_set_size: u64 = j + 64
                if mask_set_size > ctx[].dfa[].set_size {
                    mask_set_size = ctx[].dfa[].set_size
                }
                loop  while j < mask_set_size .. ++j {
                    if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? j > 63 then j / 64 else 0)], j) {
                        copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, j)
                        ;
                        if is_same_value(node[].args[i], copy[].dst) {
                            if copy[].src ~= node[].args[i] {
                                "@MACRO@:sptr_copy(TacValue, copy->src, node->args[i])"
                                free_TacValue(@node[].args[i])
                                node[].args[i] = copy[].src
                                (node[].args[i])[]._ref_count++
                            }
                            ;
                            ctx[].is_fixed_point = false
                            jump Lbreak
                        }
                    }
                }
            }
            label Lbreak
            ;
        }
    }
}

fn prop_unary_instr(ctx: *struc OptimTacContext, node: *struc TacUnary, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_binary_instr(ctx: *struc OptimTacContext, node: *struc TacBinary, instr_idx: u64) none {
    is_src1: i32 = node[].src1[].tag == AST_TacVariable_t
    is_src2: i32 = node[].src2[].tag == AST_TacVariable_t
    if is_src1 or is_src2 {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_src1 and is_same_value(node[].src1, copy[].dst) {
                        if copy[].src ~= node[].src1 {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src1)"
                            free_TacValue(@node[].src1)
                            node[].src1 = copy[].src
                            (node[].src1)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src1 = false
                        if not is_src2 {
                            return none
                        }
                    }
                    if is_src2 and is_same_value(node[].src2, copy[].dst) {
                        if copy[].src ~= node[].src2 {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src2)"
                            free_TacValue(@node[].src2)
                            node[].src2 = copy[].src
                            (node[].src2)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src2 = false
                        if not is_src1 {
                            return none
                        }
                    }
                }
            }
        }
    }
}

fn prop_copy_instr(ctx: *struc OptimTacContext, node: *struc TacCopy, instr_idx: u64, block_id: u64) none {
    ;
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                ;
                if ctx[].dfa_o1[].data_idx_map[i] == instr_idx or (is_same_value(node[].src, copy[].dst) and is_same_value(node[].dst, copy[].src)) {
                    set_dfa_bak_copy_instr(ctx, node, instr_idx)
                    cfg_rm_block_instr(ctx, instr_idx, block_id)
                    return none
                }
                elif is_same_value(node[].src, copy[].dst) {
                    set_dfa_bak_copy_instr(ctx, node, instr_idx)
                    if copy[].src ~= node[].src {
                        "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                        free_TacValue(@node[].src)
                        node[].src = copy[].src
                        (node[].src)[]._ref_count++
                    }
                    ;
                    ctx[].is_fixed_point = false
                    return none
                }
            }
        }
    }
}

fn prop_load_instr(ctx: *struc OptimTacContext, node: *struc TacLoad, instr_idx: u64) none {
    if node[].src_ptr[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src_ptr, copy[].dst) {
                        if copy[].src ~= node[].src_ptr {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src_ptr)"
                            free_TacValue(@node[].src_ptr)
                            node[].src_ptr = copy[].src
                            (node[].src_ptr)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_store_instr(ctx: *struc OptimTacContext, node: *struc TacStore, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_add_ptr_instr(ctx: *struc OptimTacContext, node: *struc TacAddPtr, instr_idx: u64) none {
    is_src_ptr: i32 = node[].src_ptr[].tag == AST_TacVariable_t
    is_idx: i32 = node[].idx[].tag == AST_TacVariable_t
    if is_src_ptr or is_idx {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_src_ptr and is_same_value(node[].src_ptr, copy[].dst) {
                        if copy[].src ~= node[].src_ptr {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src_ptr)"
                            free_TacValue(@node[].src_ptr)
                            node[].src_ptr = copy[].src
                            (node[].src_ptr)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_src_ptr = false
                        if not is_idx {
                            return none
                        }
                    }
                    if is_idx and is_same_value(node[].idx, copy[].dst) {
                        if copy[].src ~= node[].idx {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->idx)"
                            free_TacValue(@node[].idx)
                            node[].idx = copy[].src
                            (node[].idx)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        is_idx = false
                        if not is_src_ptr {
                            return none
                        }
                    }
                }
            }
        }
    }
}

fn prop_cp_to_offset_instr(ctx: *struc OptimTacContext, node: *struc TacCopyToOffset, instr_idx: u64) none {
    if node[].src[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].src, copy[].dst) {
                        if copy[].src ~= node[].src {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->src)"
                            free_TacValue(@node[].src)
                            node[].src = copy[].src
                            (node[].src)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_cp_from_offset_instr(ctx: *struc OptimTacContext, node: *struc TacCopyFromOffset, instr_idx: u64) none {
    i: u64 = 0
    loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
        if ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (j)] == 0ul {
            i += 64
            continue
        }
        mask_set_size: u64 = i + 64
        if mask_set_size > ctx[].dfa[].set_size {
            mask_set_size = ctx[].dfa[].set_size
        }
        loop  while i < mask_set_size .. ++i {
            if mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
                copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                ;
                if is_same_name(copy[].dst, node[].src_name) {
                    ;
                    node[].src_name = copy[].src[].get._TacVariable.name
                    ctx[].is_fixed_point = false
                    return none
                }
            }
        }
    }
}

fn prop_jmp_eq_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfZero, incoming_idx: u64, exit_block: u64) none {
    if node[].condition[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].condition, copy[].dst) {
                        if copy[].src ~= node[].condition {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->condition)"
                            free_TacValue(@node[].condition)
                            node[].condition = copy[].src
                            (node[].condition)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_jmp_ne_0_instr(ctx: *struc OptimTacContext, node: *struc TacJumpIfNotZero, incoming_idx: u64, exit_block: u64) none {
    if node[].condition[].tag == AST_TacVariable_t {
        i: u64 = 0
        loop j: u64 = 0 while j < ctx[].dfa[].mask_size .. ++j {
            if (exit_block and ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (j)] == 0ul) or (not exit_block and ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (j)] == 0ul) {
                i += 64
                continue
            }
            mask_set_size: u64 = i + 64
            if mask_set_size > ctx[].dfa[].set_size {
                mask_set_size = ctx[].dfa[].set_size
            }
            loop  while i < mask_set_size .. ++i {
                if ((exit_block and mask_get(ctx[].dfa[].blocks_mask_sets[(incoming_idx) * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i)) or (not exit_block and mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[incoming_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i))) {
                    copy: *struc TacCopy = get_dfa_bak_copy_instr(ctx, i)
                    ;
                    if is_same_value(node[].condition, copy[].dst) {
                        if copy[].src ~= node[].condition {
                            "@MACRO@:sptr_copy(TacValue, copy->src, node->condition)"
                            free_TacValue(@node[].condition)
                            node[].condition = copy[].src
                            (node[].condition)[]._ref_count++
                        }
                        ;
                        ctx[].is_fixed_point = false
                        return none
                    }
                }
            }
        }
    }
}

fn prop_instr(ctx: *struc OptimTacContext, instr_idx: u64, copy_instr_idx: u64, block_id: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            prop_ret_instr(ctx, @node[].get._TacReturn, copy_instr_idx, block_id > 0)
        }
        break
        -> AST_TacSignExtend_t {
            prop_sign_extend_instr(ctx, @node[].get._TacSignExtend, copy_instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            prop_truncate_instr(ctx, @node[].get._TacTruncate, copy_instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            prop_zero_extend_instr(ctx, @node[].get._TacZeroExtend, copy_instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            prop_dbl_to_int_instr(ctx, @node[].get._TacDoubleToInt, copy_instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            prop_dbl_to_uint_instr(ctx, @node[].get._TacDoubleToUInt, copy_instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            prop_int_to_dbl_instr(ctx, @node[].get._TacIntToDouble, copy_instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            prop_uint_to_dbl_instr(ctx, @node[].get._TacUIntToDouble, copy_instr_idx)
        }
        break
        -> AST_TacFunCall_t {
            prop_call_instr(ctx, @node[].get._TacFunCall, copy_instr_idx)
        }
        break
        -> AST_TacUnary_t {
            prop_unary_instr(ctx, @node[].get._TacUnary, copy_instr_idx)
        }
        break
        -> AST_TacBinary_t {
            prop_binary_instr(ctx, @node[].get._TacBinary, copy_instr_idx)
        }
        break
        -> AST_TacCopy_t {
            prop_copy_instr(ctx, @node[].get._TacCopy, copy_instr_idx, block_id)
        }
        break
        -> AST_TacLoad_t {
            prop_load_instr(ctx, @node[].get._TacLoad, copy_instr_idx)
        }
        break
        -> AST_TacStore_t {
            prop_store_instr(ctx, @node[].get._TacStore, copy_instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            prop_add_ptr_instr(ctx, @node[].get._TacAddPtr, copy_instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            prop_cp_to_offset_instr(ctx, @node[].get._TacCopyToOffset, copy_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            prop_cp_from_offset_instr(ctx, @node[].get._TacCopyFromOffset, copy_instr_idx)
        }
        break
        -> AST_TacJumpIfZero_t {
            prop_jmp_eq_0_instr(ctx, @node[].get._TacJumpIfZero, copy_instr_idx, block_id > 0)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            prop_jmp_ne_0_instr(ctx, @node[].get._TacJumpIfNotZero, copy_instr_idx, block_id > 0)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn propagate_copies(ctx: *struc OptimTacContext) none {
    if not init_data_flow_analysis(ctx, false, true) {
        return none
    }
    dfa_forward_iter_alg(ctx)
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            incoming_idx: u64 = block_id
            exit_block: u64 = 1
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_back_idx + 1 while instr_idx-- > ctx[].cfg[].blocks[block_id].instrs_front_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    match (ctx[].p_instrs[])[instr_idx][].tag {
                        -> AST_TacReturn_t {
                            -> AST_TacJumpIfZero_t {
                                -> AST_TacJumpIfNotZero_t {
                                    prop_instr(ctx, instr_idx, incoming_idx, exit_block)
                                }
                            }
                        }
                        break
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
                                                                    -> AST_TacLoad_t {
                                                                        -> AST_TacStore_t {
                                                                            -> AST_TacAddPtr_t {
                                                                                -> AST_TacCopyToOffset_t {
                                                                                    -> AST_TacCopyFromOffset_t {
                                                                                        prop_instr(ctx, instr_idx, instr_idx, block_id)
                                                                                        incoming_idx = instr_idx
                                                                                        exit_block = 0
                                                                                        break
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
                        -> AST_TacGetAddress_t {
                            incoming_idx = instr_idx
                            exit_block = 0
                            break
                        }
                        otherwise {
                            break
                        }
                    }
                }
            }
        }
    }
}

fn elim_transfer_addressed(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)]
    }
}

fn elim_transfer_aliased(ctx: *struc OptimTacContext, next_instr_idx: u64) none {
    loop i: u64 = 0 while i < ctx[].dfa[].mask_size .. ++i {
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa[].static_idx] * ctx[].dfa[].mask_size + (i)]
        ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (i)] |= ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[ctx[].dfa_o1[].addressed_idx] * ctx[].dfa[].mask_size + (i)]
    }
}

fn elim_transfer_src_name(ctx: *struc OptimTacContext, name: u64, next_instr_idx: u64) none {
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, true)
}

fn elim_transfer_src_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    if node[].tag == AST_TacVariable_t {
        elim_transfer_src_name(ctx, node[].get._TacVariable.name, next_instr_idx)
    }
}

fn elim_transfer_dst_value(ctx: *struc OptimTacContext, node: *struc TacValue, next_instr_idx: u64) none {
    ;
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((node[].get._TacVariable.name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    mask_set(@ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[next_instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i, false)
}

fn elim_transfer_live_values(ctx: *struc OptimTacContext, instr_idx: u64, next_instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacReturn_t {
            p_node: *struc TacReturn = @node[].get._TacReturn
            if p_node[].val {
                elim_transfer_src_value(ctx, p_node[].val, next_instr_idx)
            }
            break
        }
        -> AST_TacSignExtend_t {
            p_node: *struc TacSignExtend = @node[].get._TacSignExtend
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacTruncate_t {
            p_node: *struc TacTruncate = @node[].get._TacTruncate
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacZeroExtend_t {
            p_node: *struc TacZeroExtend = @node[].get._TacZeroExtend
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacDoubleToInt_t {
            p_node: *struc TacDoubleToInt = @node[].get._TacDoubleToInt
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacDoubleToUInt_t {
            p_node: *struc TacDoubleToUInt = @node[].get._TacDoubleToUInt
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacIntToDouble_t {
            p_node: *struc TacIntToDouble = @node[].get._TacIntToDouble
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacUIntToDouble_t {
            p_node: *struc TacUIntToDouble = @node[].get._TacUIntToDouble
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacFunCall_t {
            p_node: *struc TacFunCall = @node[].get._TacFunCall
            if p_node[].dst {
                elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            }
            loop i: u64 = 0 while i < (? (p_node[].args) then (cast<*struc stbds_array_header>((p_node[].args)) - 1)[].length else 0) .. ++i {
                elim_transfer_src_value(ctx, p_node[].args[i], next_instr_idx)
            }
            elim_transfer_aliased(ctx, next_instr_idx)
            break
        }
        -> AST_TacUnary_t {
            p_node: *struc TacUnary = @node[].get._TacUnary
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacBinary_t {
            p_node: *struc TacBinary = @node[].get._TacBinary
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src1, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src2, next_instr_idx)
            break
        }
        -> AST_TacCopy_t {
            p_node: *struc TacCopy = @node[].get._TacCopy
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            break
        }
        -> AST_TacGetAddress_t {
            elim_transfer_dst_value(ctx, node[].get._TacGetAddress.dst, next_instr_idx)
        }
        break
        -> AST_TacLoad_t {
            p_node: *struc TacLoad = @node[].get._TacLoad
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src_ptr, next_instr_idx)
            elim_transfer_addressed(ctx, next_instr_idx)
            break
        }
        -> AST_TacStore_t {
            p_node: *struc TacStore = @node[].get._TacStore
            elim_transfer_src_value(ctx, p_node[].src, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].dst_ptr, next_instr_idx)
            break
        }
        -> AST_TacAddPtr_t {
            p_node: *struc TacAddPtr = @node[].get._TacAddPtr
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].src_ptr, next_instr_idx)
            elim_transfer_src_value(ctx, p_node[].idx, next_instr_idx)
            break
        }
        -> AST_TacCopyToOffset_t {
            elim_transfer_src_value(ctx, node[].get._TacCopyToOffset.src, next_instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            p_node: *struc TacCopyFromOffset = @node[].get._TacCopyFromOffset
            elim_transfer_dst_value(ctx, p_node[].dst, next_instr_idx)
            elim_transfer_src_name(ctx, p_node[].src_name, next_instr_idx)
            break
        }
        -> AST_TacJumpIfZero_t {
            elim_transfer_src_value(ctx, node[].get._TacJumpIfZero.condition, next_instr_idx)
        }
        break
        -> AST_TacJumpIfNotZero_t {
            elim_transfer_src_value(ctx, node[].get._TacJumpIfNotZero.condition, next_instr_idx)
        }
        break
        otherwise {
            panic_sigabrt("abort")
        }
    }
}

fn elim_dst_name_instr(ctx: *struc OptimTacContext, name: u64, instr_idx: u64) none {
    i: u64 = ((? ((? ((ctx[].cfg[].identifier_id_map) = stbds_hmget_key((ctx[].cfg[].identifier_id_map), sizeof((ctx[].cfg[].identifier_id_map)[]), cast<*any>(@((name))), sizeof((ctx[].cfg[].identifier_id_map)[].key), 0)) and 0 then 0 else (cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp)) and 0 then 0 else @(ctx[].cfg[].identifier_id_map)[(cast<*struc stbds_array_header>(((ctx[].cfg[].identifier_id_map) - 1)) - 1)[].temp])[].value)
    if not mask_get(ctx[].dfa[].instrs_mask_sets[ctx[].dfa[].instr_idx_map[instr_idx] * ctx[].dfa[].mask_size + (? i > 63 then i / 64 else 0)], i) {
        set_instr(ctx, uptr_new(), instr_idx)
    }
}

fn elim_dst_value_instr(ctx: *struc OptimTacContext, node: *struc TacValue, instr_idx: u64) none {
    ;
    elim_dst_name_instr(ctx, node[].get._TacVariable.name, instr_idx)
}

fn elim_instr(ctx: *struc OptimTacContext, instr_idx: u64) none {
    node: *struc TacInstruction = (ctx[].p_instrs[])[instr_idx]
    match node[].tag {
        -> AST_TacSignExtend_t {
            elim_dst_value_instr(ctx, node[].get._TacSignExtend.dst, instr_idx)
        }
        break
        -> AST_TacTruncate_t {
            elim_dst_value_instr(ctx, node[].get._TacTruncate.dst, instr_idx)
        }
        break
        -> AST_TacZeroExtend_t {
            elim_dst_value_instr(ctx, node[].get._TacZeroExtend.dst, instr_idx)
        }
        break
        -> AST_TacDoubleToInt_t {
            elim_dst_value_instr(ctx, node[].get._TacDoubleToInt.dst, instr_idx)
        }
        break
        -> AST_TacDoubleToUInt_t {
            elim_dst_value_instr(ctx, node[].get._TacDoubleToUInt.dst, instr_idx)
        }
        break
        -> AST_TacIntToDouble_t {
            elim_dst_value_instr(ctx, node[].get._TacIntToDouble.dst, instr_idx)
        }
        break
        -> AST_TacUIntToDouble_t {
            elim_dst_value_instr(ctx, node[].get._TacUIntToDouble.dst, instr_idx)
        }
        break
        -> AST_TacUnary_t {
            elim_dst_value_instr(ctx, node[].get._TacUnary.dst, instr_idx)
        }
        break
        -> AST_TacBinary_t {
            elim_dst_value_instr(ctx, node[].get._TacBinary.dst, instr_idx)
        }
        break
        -> AST_TacCopy_t {
            elim_dst_value_instr(ctx, node[].get._TacCopy.dst, instr_idx)
        }
        break
        -> AST_TacGetAddress_t {
            elim_dst_value_instr(ctx, node[].get._TacGetAddress.dst, instr_idx)
        }
        break
        -> AST_TacLoad_t {
            elim_dst_value_instr(ctx, node[].get._TacLoad.dst, instr_idx)
        }
        break
        -> AST_TacAddPtr_t {
            elim_dst_value_instr(ctx, node[].get._TacAddPtr.dst, instr_idx)
        }
        break
        -> AST_TacCopyToOffset_t {
            elim_dst_name_instr(ctx, node[].get._TacCopyToOffset.dst_name, instr_idx)
        }
        break
        -> AST_TacCopyFromOffset_t {
            elim_dst_value_instr(ctx, node[].get._TacCopyFromOffset.dst, instr_idx)
        }
        break
        otherwise {
            break
        }
    }
}

fn eliminate_dead_stores(ctx: *struc OptimTacContext, is_addressed_set: i32) none {
    if not init_data_flow_analysis(ctx, true, is_addressed_set) {
        return none
    }
    dfa_iter_alg(ctx)
    loop block_id: u64 = 0 while block_id < (? (ctx[].cfg[].blocks) then (cast<*struc stbds_array_header>((ctx[].cfg[].blocks)) - 1)[].length else 0) .. ++block_id {
        if ctx[].cfg[].blocks[block_id].size > 0 {
            loop instr_idx: u64 = ctx[].cfg[].blocks[block_id].instrs_front_idx while instr_idx <= ctx[].cfg[].blocks[block_id].instrs_back_idx .. ++instr_idx {
                if (ctx[].p_instrs[])[instr_idx] {
                    elim_instr(ctx, instr_idx)
                }
            }
        }
    }
}

m4_define(`CONSTANT_FOLDING', `0')m4_dnl
m4_define(`COPY_PROPAGATION', `1')m4_dnl
m4_define(`UNREACHABLE_CODE_ELIMINATION', `2')m4_dnl
m4_define(`DEAD_STORE_ELIMINATION', `3')m4_dnl
m4_define(`CONTROL_FLOW_GRAPH', `4')m4_dnl

fn optim_fun_toplvl(ctx: *struc OptimTacContext, node: *struc TacFunction) none {
    ctx[].p_instrs = @node[].body
    loop .. while not ctx[].is_fixed_point {
        ctx[].is_fixed_point = true
        if ctx[].enabled_optims[CONSTANT_FOLDING] {
            fold_constants(ctx)
        }
        if ctx[].enabled_optims[CONTROL_FLOW_GRAPH] {
            init_control_flow_graph(ctx)
            if ctx[].enabled_optims[UNREACHABLE_CODE_ELIMINATION] {
                eliminate_unreachable_code(ctx)
            }
            if ctx[].enabled_optims[COPY_PROPAGATION] {
                propagate_copies(ctx)
            }
            if ctx[].enabled_optims[DEAD_STORE_ELIMINATION] {
                eliminate_dead_stores(ctx, not ctx[].enabled_optims[COPY_PROPAGATION])
            }
        }
    }
    ctx[].p_instrs = nil
}

fn optim_toplvl(ctx: *struc OptimTacContext, node: *struc TacTopLevel) none {
    if node[].tag == AST_TacFunction_t {
        optim_fun_toplvl(ctx, @node[].get._TacFunction)
    }
    else {
        panic_sigabrt("abort")
    }
}

fn optim_program(ctx: *struc OptimTacContext, node: *struc TacProgram) none {
    loop i: u64 = 0 while i < (? (node[].fun_toplvls) then (cast<*struc stbds_array_header>((node[].fun_toplvls)) - 1)[].length else 0) .. ++i {
        optim_toplvl(ctx, node[].fun_toplvls[i])
    }
    loop .. while 0 {
        "@MACRO@:set_clear(ctx->frontend->addressed_set)"
        loop .. while 0 {
            "@MACRO@:map_clear(ctx->frontend->addressed_set)"
            if ctx[].frontend[].addressed_set {
                "@MACRO@:map_delete(ctx->frontend->addressed_set)"
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

pub fn optimize_three_address_code(node: *struc TacProgram, frontend: *struc FrontEndContext, optim_1_mask: u8) none {
    ctx: struc OptimTacContext;
    {
        ctx.frontend = frontend
        ctx.is_fixed_point = true
        ctx.enabled_optims[CONSTANT_FOLDING] = (optim_1_mask & ((cast<u8>(1u)) << 0)) > 0
        ctx.enabled_optims[COPY_PROPAGATION] = (optim_1_mask & ((cast<u8>(1u)) << 1)) > 0
        ctx.enabled_optims[UNREACHABLE_CODE_ELIMINATION] = (optim_1_mask & ((cast<u8>(1u)) << 2)) > 0
        ctx.enabled_optims[DEAD_STORE_ELIMINATION] = (optim_1_mask & ((cast<u8>(1u)) << 3)) > 0
        ctx.enabled_optims[CONTROL_FLOW_GRAPH] = (optim_1_mask & ~((cast<u8>(1u)) << 0)) > 0
        ctx.cfg = uptr_new()
        ctx.dfa = uptr_new()
        ctx.dfa_o1 = uptr_new()
        if ctx.enabled_optims[CONTROL_FLOW_GRAPH] {
            ctx.cfg = make_ControlFlowGraph()
            if ctx.enabled_optims[COPY_PROPAGATION] or ctx.enabled_optims[DEAD_STORE_ELIMINATION] {
                ctx.dfa = make_DataFlowAnalysis()
                ctx.dfa_o1 = make_DataFlowAnalysisO1()
            }
        }
    }

    optim_program(@ctx, node)
    free_ControlFlowGraph(@ctx.cfg)
    free_DataFlowAnalysis(@ctx.dfa)
    free_DataFlowAnalysisO1(@ctx.dfa_o1)
}
