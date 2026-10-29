m4_include(`registers.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/back_ast.plx.m4')m4_dnl

fn gen_reg(reg_kind: i32) struc AsmReg {
    match reg_kind {
        -> REG_Ax {
            return init_AsmAx()
        }
        -> REG_Bx {
            return init_AsmBx()
        }
        -> REG_Cx {
            return init_AsmCx()
        }
        -> REG_Dx {
            return init_AsmDx()
        }
        -> REG_Di {
            return init_AsmDi()
        }
        -> REG_Si {
            return init_AsmSi()
        }
        -> REG_R8 {
            return init_AsmR8()
        }
        -> REG_R9 {
            return init_AsmR9()
        }
        -> REG_R10 {
            return init_AsmR10()
        }
        -> REG_R11 {
            return init_AsmR11()
        }
        -> REG_R12 {
            return init_AsmR12()
        }
        -> REG_R13 {
            return init_AsmR13()
        }
        -> REG_R14 {
            return init_AsmR14()
        }
        -> REG_R15 {
            return init_AsmR15()
        }
        -> REG_Sp {
            return init_AsmSp()
        }
        -> REG_Bp {
            return init_AsmBp()
        }
        -> REG_Xmm0 {
            return init_AsmXMM0()
        }
        -> REG_Xmm1 {
            return init_AsmXMM1()
        }
        -> REG_Xmm2 {
            return init_AsmXMM2()
        }
        -> REG_Xmm3 {
            return init_AsmXMM3()
        }
        -> REG_Xmm4 {
            return init_AsmXMM4()
        }
        -> REG_Xmm5 {
            return init_AsmXMM5()
        }
        -> REG_Xmm6 {
            return init_AsmXMM6()
        }
        -> REG_Xmm7 {
            return init_AsmXMM7()
        }
        -> REG_Xmm8 {
            return init_AsmXMM8()
        }
        -> REG_Xmm9 {
            return init_AsmXMM9()
        }
        -> REG_Xmm10 {
            return init_AsmXMM10()
        }
        -> REG_Xmm11 {
            return init_AsmXMM11()
        }
        -> REG_Xmm12 {
            return init_AsmXMM12()
        }
        -> REG_Xmm13 {
            return init_AsmXMM13()
        }
        -> REG_Xmm14 {
            return init_AsmXMM14()
        }
        -> REG_Xmm15 {
            return init_AsmXMM15()
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn gen_register(reg_kind: i32) *struc AsmOperand {
    reg: struc AsmReg = gen_reg(reg_kind)
    return make_AsmRegister(@reg)
}

pub fn gen_memory(reg_kind: i32, value: i64) *struc AsmOperand {
    reg: struc AsmReg = gen_reg(reg_kind)
    return make_AsmMemory(value, @reg)
}

pub fn gen_indexed(reg_kind_base: i32, reg_kind_idx: i32, scale: i64) *struc AsmOperand {
    reg_base: struc AsmReg = gen_reg(reg_kind_base)
    reg_index: struc AsmReg = gen_reg(reg_kind_idx)
    return make_AsmIndexed(scale, @reg_base, @reg_index)
}

pub fn register_mask_kind(node: *struc AsmReg) i32 {
    match node[].tag {
        -> AST_AsmAx_t {
            return REG_Ax
        }
        -> AST_AsmBx_t {
            return REG_Bx
        }
        -> AST_AsmCx_t {
            return REG_Cx
        }
        -> AST_AsmDx_t {
            return REG_Dx
        }
        -> AST_AsmDi_t {
            return REG_Di
        }
        -> AST_AsmSi_t {
            return REG_Si
        }
        -> AST_AsmR8_t {
            return REG_R8
        }
        -> AST_AsmR9_t {
            return REG_R9
        }
        -> AST_AsmR12_t {
            return REG_R12
        }
        -> AST_AsmR13_t {
            return REG_R13
        }
        -> AST_AsmR14_t {
            return REG_R14
        }
        -> AST_AsmR15_t {
            return REG_R15
        }
        -> AST_AsmXMM0_t {
            return REG_Xmm0
        }
        -> AST_AsmXMM1_t {
            return REG_Xmm1
        }
        -> AST_AsmXMM2_t {
            return REG_Xmm2
        }
        -> AST_AsmXMM3_t {
            return REG_Xmm3
        }
        -> AST_AsmXMM4_t {
            return REG_Xmm4
        }
        -> AST_AsmXMM5_t {
            return REG_Xmm5
        }
        -> AST_AsmXMM6_t {
            return REG_Xmm6
        }
        -> AST_AsmXMM7_t {
            return REG_Xmm7
        }
        -> AST_AsmXMM8_t {
            return REG_Xmm8
        }
        -> AST_AsmXMM9_t {
            return REG_Xmm9
        }
        -> AST_AsmXMM10_t {
            return REG_Xmm10
        }
        -> AST_AsmXMM11_t {
            return REG_Xmm11
        }
        -> AST_AsmXMM12_t {
            return REG_Xmm12
        }
        -> AST_AsmXMM13_t {
            return REG_Xmm13
        }
        -> AST_AsmSp_t {
            -> AST_AsmBp_t {
                return REG_Sp
            }
        }
        -> AST_AsmR10_t {
            -> AST_AsmR11_t {
                -> AST_AsmXMM14_t {
                    -> AST_AsmXMM15_t {
                        THROW_ABORT
                    }
                }
            }
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn register_mask_bit(reg_kind: i32) u64 {
    match reg_kind {
        -> REG_Ax {
            return 0
        }
        -> REG_Bx {
            return 1
        }
        -> REG_Cx {
            return 2
        }
        -> REG_Dx {
            return 3
        }
        -> REG_Di {
            return 4
        }
        -> REG_Si {
            return 5
        }
        -> REG_R8 {
            return 6
        }
        -> REG_R9 {
            return 7
        }
        -> REG_R12 {
            return 8
        }
        -> REG_R13 {
            return 9
        }
        -> REG_R14 {
            return 10
        }
        -> REG_R15 {
            return 11
        }
        -> REG_Xmm0 {
            return 12
        }
        -> REG_Xmm1 {
            return 13
        }
        -> REG_Xmm2 {
            return 14
        }
        -> REG_Xmm3 {
            return 15
        }
        -> REG_Xmm4 {
            return 16
        }
        -> REG_Xmm5 {
            return 17
        }
        -> REG_Xmm6 {
            return 18
        }
        -> REG_Xmm7 {
            return 19
        }
        -> REG_Xmm8 {
            return 20
        }
        -> REG_Xmm9 {
            return 21
        }
        -> REG_Xmm10 {
            return 22
        }
        -> REG_Xmm11 {
            return 23
        }
        -> REG_Xmm12 {
            return 24
        }
        -> REG_Xmm13 {
            return 25
        }
        -> REG_R10 {
            -> REG_R11 {
                -> REG_Sp {
                    -> REG_Bp {
                        -> REG_Xmm14 {
                            -> REG_Xmm15 {
                                THROW_ABORT
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            THROW_ABORT
        }
    }
}

pub fn register_mask_get(reg_mask: u64, reg_kind: i32) i32 {
    return (reg_mask & ((cast<u64>(1ul)) << register_mask_bit(reg_kind))) > 0
}

pub fn register_mask_set(reg_mask: *u64, reg_kind: i32, value: i32) none {
    if value {
        reg_mask[] |= (cast<u64>(1ul)) << register_mask_bit(reg_kind)
    }
    else {
        reg_mask[] &= ~((cast<u64>(1ul)) << register_mask_bit(reg_kind))
    }
}
