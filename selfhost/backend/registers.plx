m4_include(`registers.plx.m4')m4_dnl

m4_include(`../lib/c_std.plx.m4')m4_dnl

m4_include(`../util/throw.plx.m4')m4_dnl

m4_include(`../ast/back_ast.plx.m4')m4_dnl






m4_define(`REGISTER_KIND', `TODO')m4_dnl
m4_define(`REG_Ax', `0')m4_dnl
m4_define(`REG_Bx', `1')m4_dnl
m4_define(`REG_Cx', `2')m4_dnl
m4_define(`REG_Dx', `3')m4_dnl
m4_define(`REG_Di', `4')m4_dnl
m4_define(`REG_Si', `5')m4_dnl
m4_define(`REG_R8', `6')m4_dnl
m4_define(`REG_R9', `7')m4_dnl
m4_define(`REG_R10', `8')m4_dnl
m4_define(`REG_R11', `9')m4_dnl
m4_define(`REG_R12', `10')m4_dnl
m4_define(`REG_R13', `11')m4_dnl
m4_define(`REG_R14', `12')m4_dnl
m4_define(`REG_R15', `13')m4_dnl
m4_define(`REG_Sp', `14')m4_dnl
m4_define(`REG_Bp', `15')m4_dnl
m4_define(`REG_Xmm0', `16')m4_dnl
m4_define(`REG_Xmm1', `17')m4_dnl
m4_define(`REG_Xmm2', `18')m4_dnl
m4_define(`REG_Xmm3', `19')m4_dnl
m4_define(`REG_Xmm4', `20')m4_dnl
m4_define(`REG_Xmm5', `21')m4_dnl
m4_define(`REG_Xmm6', `22')m4_dnl
m4_define(`REG_Xmm7', `23')m4_dnl
m4_define(`REG_Xmm8', `24')m4_dnl
m4_define(`REG_Xmm9', `25')m4_dnl
m4_define(`REG_Xmm10', `26')m4_dnl
m4_define(`REG_Xmm11', `27')m4_dnl
m4_define(`REG_Xmm12', `28')m4_dnl
m4_define(`REG_Xmm13', `29')m4_dnl
m4_define(`REG_Xmm14', `30')m4_dnl
m4_define(`REG_Xmm15', `31')m4_dnl
m4_define(`REGISTER_MASK_SIZE', `26')m4_dnl
m4_define(`REGISTER_MASK_FALSE', `TODO')m4_dnl
m4_define(`NULL_REGISTER_MASK', `TODO')m4_dnl







fn gen_reg(reg_kind: i32) struc AsmReg {
    match reg_kind {
        -> REG_Ax {
            return make_AsmReg(AST_AsmAx_t)
        }
        -> REG_Bx {
            return make_AsmReg(AST_AsmBx_t)
        }
        -> REG_Cx {
            return make_AsmReg(AST_AsmCx_t)
        }
        -> REG_Dx {
            return make_AsmReg(AST_AsmDx_t)
        }
        -> REG_Di {
            return make_AsmReg(AST_AsmDi_t)
        }
        -> REG_Si {
            return make_AsmReg(AST_AsmSi_t)
        }
        -> REG_R8 {
            return make_AsmReg(AST_AsmR8_t)
        }
        -> REG_R9 {
            return make_AsmReg(AST_AsmR9_t)
        }
        -> REG_R10 {
            return make_AsmReg(AST_AsmR10_t)
        }
        -> REG_R11 {
            return make_AsmReg(AST_AsmR11_t)
        }
        -> REG_R12 {
            return make_AsmReg(AST_AsmR12_t)
        }
        -> REG_R13 {
            return make_AsmReg(AST_AsmR13_t)
        }
        -> REG_R14 {
            return make_AsmReg(AST_AsmR14_t)
        }
        -> REG_R15 {
            return make_AsmReg(AST_AsmR15_t)
        }
        -> REG_Sp {
            return make_AsmReg(AST_AsmSp_t)
        }
        -> REG_Bp {
            return make_AsmReg(AST_AsmBp_t)
        }
        -> REG_Xmm0 {
            return make_AsmReg(AST_AsmXMM0_t)
        }
        -> REG_Xmm1 {
            return make_AsmReg(AST_AsmXMM1_t)
        }
        -> REG_Xmm2 {
            return make_AsmReg(AST_AsmXMM2_t)
        }
        -> REG_Xmm3 {
            return make_AsmReg(AST_AsmXMM3_t)
        }
        -> REG_Xmm4 {
            return make_AsmReg(AST_AsmXMM4_t)
        }
        -> REG_Xmm5 {
            return make_AsmReg(AST_AsmXMM5_t)
        }
        -> REG_Xmm6 {
            return make_AsmReg(AST_AsmXMM6_t)
        }
        -> REG_Xmm7 {
            return make_AsmReg(AST_AsmXMM7_t)
        }
        -> REG_Xmm8 {
            return make_AsmReg(AST_AsmXMM8_t)
        }
        -> REG_Xmm9 {
            return make_AsmReg(AST_AsmXMM9_t)
        }
        -> REG_Xmm10 {
            return make_AsmReg(AST_AsmXMM10_t)
        }
        -> REG_Xmm11 {
            return make_AsmReg(AST_AsmXMM11_t)
        }
        -> REG_Xmm12 {
            return make_AsmReg(AST_AsmXMM12_t)
        }
        -> REG_Xmm13 {
            return make_AsmReg(AST_AsmXMM13_t)
        }
        -> REG_Xmm14 {
            return make_AsmReg(AST_AsmXMM14_t)
        }
        -> REG_Xmm15 {
            return make_AsmReg(AST_AsmXMM15_t)
        }
        otherwise {
            panic_sigabrt("abort")
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
                        panic_sigabrt("abort")
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
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
                                panic_sigabrt("abort")
                            }
                        }
                    }
                }
            }
        }
        otherwise {
            panic_sigabrt("abort")
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
